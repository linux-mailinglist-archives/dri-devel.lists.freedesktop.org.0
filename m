Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 460169BEEDC
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 14:21:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E7010E6E1;
	Wed,  6 Nov 2024 13:21:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qvS9YrPZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7325E10E6E1
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 13:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1730899297;
 bh=L4gObn6j06oIMdGdQW22qFXKQRjQnkUKPXbGIDbK3Fs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qvS9YrPZNQbU1UtsVy7BUApWZz4qT2vNKKEYry6WwqkipxxgsbqzwwcqHJCDNhUew
 C+xyaHtSu1x9P3P8sp82Kx366X+VpWEJxRgh219vKPqqAKjhjuzwgqe3t+UJ3Mb7oD
 u9sBchlm+T7VABRBzUKNlDdBupo3Pev+NdB2NntReVauOzlabVjOVuatdHUROYZMUL
 k2+Bc4VlWFYWhfcwQ5gRhj4vYf6LKtvO6UatxPnXTRICkSFnmPN1NQO05ZhZMfEbps
 7zGBzM4djhdKJKeCING9Ngqt95/cCYulwYT5Sv7pDG3IHAcU3gHhCB+MfFZBZ4PT+C
 U0tJ/t4bNKX1A==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id AFA3917E3635;
 Wed,  6 Nov 2024 14:21:36 +0100 (CET)
Date: Wed, 6 Nov 2024 14:21:33 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Steven Price <steven.price@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jann Horn <jannh@google.com>
Subject: Re: [PATCH] drm/panthor: Lock XArray when getting entries for heap
 and VM
Message-ID: <20241106142133.09378b5a@collabora.com>
In-Reply-To: <ZytqzTg2QnEkvDcl@e110455-lin.cambridge.arm.com>
References: <20241106120748.290697-1-liviu.dudau@arm.com>
 <20241106131641.47487624@collabora.com>
 <ZytqzTg2QnEkvDcl@e110455-lin.cambridge.arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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

On Wed, 6 Nov 2024 13:10:37 +0000
Liviu Dudau <liviu.dudau@arm.com> wrote:

> panthor_heap_pool_release() does not take the panthor_heap_pool::lock, so the protection
> is not really there. I could fix panthor_heap_pool_release() and then add a
> lockdep_assert_held() before both calls to xa_load() if you think that's a better
> solution.

Hm, but panthor_heap_pool_release() doesn't release the heap contexts,
it just calls xa_destroy(). If we have objects remaining in the xarray,
they'll be leaked, but that's not a race. BTW, can we make this two
separate patches. I feel like the thing on the vm is an actual fix,
while the second one (adding a helper with a lockdep_assert()) is
safety net that's worth having, but not necessarily something we need
to backport.
