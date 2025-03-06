Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B00FA541D8
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 05:52:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06AFB10E8C8;
	Thu,  6 Mar 2025 04:52:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="T4DxHqsR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1EA10E0C5
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 04:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=PSV6KR/L2RCJUIUbykQwn+3XqvL7U90zxgqKneqEbw0=; b=T4DxHqsREMzOnsxlv3u/oTlt+/
 73IurSXLrDcL0/sykIwVZy8bMG38iXhrTyeXxr0tJxqK6NsRHlVcz1I1JFyveu9DmttTGiQUdWY4G
 eIooopUyLYl62tVcrpTdhURvmbOG9gVuCd6v3tC300MxtQvHlr0zl7UCz4LZdHzeH8QzYX/PluICc
 3FJLvIAawW2nQrnKgxsilYLe3E4WD1sehIBLWCy3sAUc2Inn1gQz0byszk6BgdnyHBGFkFudqN3/U
 XGugWdBVKT/HbLBipL3kbyR9HwW2I36Pzmyd13eikwCwYYwrSlug9ac2HwSJMBDaRd1qdd9+Jsc6Y
 4av/S6dg==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tq3DJ-00000006oty-2yf4; Thu, 06 Mar 2025 04:52:05 +0000
Date: Thu, 6 Mar 2025 04:52:05 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Ryosuke Yasuoka <ryasuoka@redhat.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 kraxel@redhat.com, gurchetansingh@chromium.org, olvaffe@gmail.com,
 akpm@linux-foundation.org, urezki@gmail.com, hch@infradead.org,
 dmitry.osipenko@collabora.com, jfalempe@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-mm@kvack.org
Subject: Re: [PATCH drm-next 1/2] vmalloc: Add atomic_vmap
Message-ID: <Z8kp9Z9VgTpQmV9d@casper.infradead.org>
References: <20250305152555.318159-1-ryasuoka@redhat.com>
 <20250305152555.318159-2-ryasuoka@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305152555.318159-2-ryasuoka@redhat.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 06, 2025 at 12:25:53AM +0900, Ryosuke Yasuoka wrote:
> Some drivers can use vmap in drm_panic, however, vmap is sleepable and
> takes locks. Since drm_panic will vmap in panic handler, atomic_vmap
> requests pages with GFP_ATOMIC and maps KVA without locks and sleep.

In addition to the implicit GFP_KERNEL allocations Vlad mentioned, how
is this supposed to work?

> +	vn = addr_to_node(va->va_start);
> +
> +	insert_vmap_area(va, &vn->busy.root, &vn->busy.head);

If someone else is holding the vn->busy.lock because they're modifying the
busy tree, you'll corrupt the tree.  You can't just say "I can't take a
lock here, so I won't bother".  You need to figure out how to do something
safe without taking the lock.  For example, you could preallocate the
page tables and reserve a vmap area when the driver loads that would
then be usable for the panic situation.  I don't know that we have APIs
to let you do that today, but it's something that could be added.
