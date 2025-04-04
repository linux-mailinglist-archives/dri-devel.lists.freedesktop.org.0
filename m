Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 345BAA7BFF0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 16:52:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C9510EBD8;
	Fri,  4 Apr 2025 14:52:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="AK5dZbe5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B182E10EBD8
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 14:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743778357;
 bh=HQEwVFo23Mr3erq7OYuxzmfb7ImgX/7WpQUlZtxKNVw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AK5dZbe5u1Q8thHivk2etDFByqBQib3ESC+QWMrdfiTL8JOQz527MQUAa4mO8RlPR
 e9mHhS4X6Rpk2yMAONLbgRdUMPeY6/ECC6mu6tDzyDSquI8DVUW/zaoITnBBQQso1M
 xRaUgreQgne87px2bCaUEgdhr3iWNWd6sCdMnkDb89twFURpogR1aHPggVOqQ2x7SW
 lJUfpBLxujR6NsosDOh9c7d0K5shN/3NspDRkmHZantnMfIluOYaFQolJFNOg3waDR
 qg08P3rtOxfBjA+HNsrT18riIHeW3GpH37mWFnDuCBneJRjUP0qEmM2ygT/bi+EaUw
 4RRnoMre1bt0Q==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2E25117E0B0B;
 Fri,  4 Apr 2025 16:52:37 +0200 (CEST)
Date: Fri, 4 Apr 2025 16:52:33 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Qiang Yu <yuq825@gmail.com>, Steven Price
 <steven.price@arm.com>, Frank Binns <frank.binns@imgtec.com>, Matt Coster
 <matt.coster@imgtec.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v20 09/10] drm/shmem-helper: Switch
 drm_gem_shmem_vmap/vunmap to use pin/unpin
Message-ID: <20250404165233.139814ee@collabora.com>
In-Reply-To: <29cfb98b-fe27-4243-abe4-ce66aa504573@suse.de>
References: <20250322212608.40511-1-dmitry.osipenko@collabora.com>
 <20250322212608.40511-10-dmitry.osipenko@collabora.com>
 <ea4f4059-7748-4bfd-9205-8e95222144da@suse.de>
 <710cdbd4-2c6e-48b7-b12b-972ab6d12abf@collabora.com>
 <20250402152102.01d9cfee@collabora.com>
 <a8ed4b8b-5116-4ac2-bfce-21b2751f7377@suse.de>
 <20250403105053.788b0f6e@collabora.com>
 <29cfb98b-fe27-4243-abe4-ce66aa504573@suse.de>
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

On Fri, 4 Apr 2025 10:01:50 +0200
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> >> In your case, vmap an pin both intent to hold the shmem pages in memory.
> >> They might be build on top of the same implementation, but one should
> >> not be implemented with the other because of their different meanings.  
> > But that's not what we do, is it? Sure, in drm_gem_shmem_vmap_locked(),
> > we call drm_gem_shmem_pin_locked(), but that's an internal function to
> > make sure the pages are allocated and stay around until
> > drm_gem_shmem_vunmap_locked() is called.
> >
> > I guess we could rename pin_count into hard_refcount or
> > page_residency_count or xxx_count, and change the pin/unpin_locked()
> > function names accordingly, but that's just a naming detail, it doesn't
> > force you to call drm_gem_pin() to vmap() your GEM, it's something we
> > do internally.  
> 
> Such a rename would be much appreciated. page_residency_count seems 
> appropriate.

On a second thought, I think I prefer
'unevictable_count/inc_unevictable()/dec_unevictable()'. But looking at
the gem-vram changes you just posted, it looks like gem-shmem is not the
only one to use the term 'pin' for this page pinning thing, so if we go
and plan for a rename, I'd rather make it DRM-wide than gem-shmem being
the outlier yet again :-).
