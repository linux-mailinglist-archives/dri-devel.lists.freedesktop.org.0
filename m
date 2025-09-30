Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 776EEBAC8B3
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 12:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C95B710E560;
	Tue, 30 Sep 2025 10:46:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="QTjlXH2q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BBA310E560;
 Tue, 30 Sep 2025 10:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1759229173;
 bh=D7FPMpVUID4VWIVsRLfS5OjhCnjT47sZGTl0id6lZQU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QTjlXH2qlSMLT94RF69MdmWM6gnsmuNpbnGAeDVk1OFSCE7ihPVo6rNvTIG/Tpe8w
 vNGepnhvL010tfDYKJQl6E05PrKb8kutNjqacgZjs/Kq5Hss/drZ9NpqvKNbm4J2pC
 8HxDIJ7eFltlQetIVqrN6rrC3ye9kzs/tS+mOE/1FOm2Q4+S/Ef7Ouj35S5BMygvHH
 5xxg9pkWPGbseOA6vdpLQwJmreCPctFohglY6D0BHYsgGQVNUUXyoJeKZpiFa9qXs6
 PpSBuODe7zdLCk3IdG3klbaab4KPtqvbO+ITsVd+nISzyN9TkGdbvJOT5rJNB1kOhk
 SW9R625asBKbQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B361117E0CF8;
 Tue, 30 Sep 2025 12:46:12 +0200 (CEST)
Date: Tue, 30 Sep 2025 12:45:54 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?TG/Dr2M=?= Molinari <loic.molinari@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Melissa Wen <mwen@igalia.com>, =?UTF-8?B?TWHDrXJh?= Canal
 <mcanal@igalia.com>, Hugh Dickins <hughd@google.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>, =?UTF-8?B?TWlrb8WCYWo=?= Wasiak
 <mikolaj.wasiak@intel.com>, Christian Brauner <brauner@kernel.org>, Nitin
 Gote <nitin.r.gote@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org, kernel@collabora.com
Subject: Re: [PATCH 2/8] drm/gem: Introduce drm_gem_get_unmapped_area() fop
Message-ID: <20250930124554.5459194c@fedora>
In-Reply-To: <20250930123003.75370854@fedora>
References: <20250929200316.18417-1-loic.molinari@collabora.com>
 <20250929200316.18417-3-loic.molinari@collabora.com>
 <20250930123003.75370854@fedora>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 30 Sep 2025 12:30:03 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> > +unsigned long drm_gem_get_unmapped_area(struct file *filp, unsigned long uaddr,
> > +					unsigned long len, unsigned long pgoff,
> > +					unsigned long flags)
> > +{
> > +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> > +	struct drm_gem_object *obj;
> > +	unsigned long ret;
> > +
> > +	obj = drm_gem_object_lookup_from_offset(filp, pgoff, len >> PAGE_SHIFT);
> > +	if (IS_ERR(obj))  
> 
> Is this supposed to happen? If not, I'd be tempted to add a
> WARN_ON_ONCE().

Taking that back. I think you need it for non-GEM backed mappings, like
userland IOMEM mappings.

> 
> > +		return mm_get_unmapped_area(current->mm, filp, uaddr, len, 0,
> > +					    flags);
> > +
