Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BB4A7DA70
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 11:57:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF42B10E412;
	Mon,  7 Apr 2025 09:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="baK0FbfF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E2810E412
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 09:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744019821;
 bh=ECIQQcTVtg/hv39ybDI897PJaXrGxDcq2VT2bEcU6rU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=baK0FbfFY0YlYV41bgu/R7tTtxwh18jci8auDNjRN15GWCxMEQETpAoUYHtx/Qp0h
 vXh13n1xlrAU6BaqCE4xvrBR1UptiwW3CQgaYdQWFjKr5a8nGHUJ8//RbtN2u2JceR
 mBrdlQFFpm7IuhycGuTx4ny+iPhW84ReEHppr8HEX/tQNb8JVKOPtDH0E53q2MHrFl
 7bxkTKwGp0zwLY2sZZxKUfLAQVFsMyXs3N9sm2vfaD61xMd9U91vYYefQecY4RxEaZ
 Rrc/HBIFhwymshCskIEA/JNqhLbrtbbX5q7wD30ooFDvxvwwGCJPsBlGgNGtDyFCFk
 /41UxKO/+5YDw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6891E17E001E;
 Mon,  7 Apr 2025 11:57:00 +0200 (CEST)
Date: Mon, 7 Apr 2025 11:56:54 +0200
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
Message-ID: <20250407115654.761ddaa6@collabora.com>
In-Reply-To: <edf93bc7-3289-4b1c-9698-e5e2cc5a6910@suse.de>
References: <20250322212608.40511-1-dmitry.osipenko@collabora.com>
 <20250322212608.40511-10-dmitry.osipenko@collabora.com>
 <ea4f4059-7748-4bfd-9205-8e95222144da@suse.de>
 <710cdbd4-2c6e-48b7-b12b-972ab6d12abf@collabora.com>
 <20250402152102.01d9cfee@collabora.com>
 <a8ed4b8b-5116-4ac2-bfce-21b2751f7377@suse.de>
 <20250403105053.788b0f6e@collabora.com>
 <29cfb98b-fe27-4243-abe4-ce66aa504573@suse.de>
 <20250404165233.139814ee@collabora.com>
 <edf93bc7-3289-4b1c-9698-e5e2cc5a6910@suse.de>
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

On Fri, 4 Apr 2025 16:58:20 +0200
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Hi
> 
> Am 04.04.25 um 16:52 schrieb Boris Brezillon:
> > On Fri, 4 Apr 2025 10:01:50 +0200
> > Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >  
> >>>> In your case, vmap an pin both intent to hold the shmem pages in memory.
> >>>> They might be build on top of the same implementation, but one should
> >>>> not be implemented with the other because of their different meanings.  
> >>> But that's not what we do, is it? Sure, in drm_gem_shmem_vmap_locked(),
> >>> we call drm_gem_shmem_pin_locked(), but that's an internal function to
> >>> make sure the pages are allocated and stay around until
> >>> drm_gem_shmem_vunmap_locked() is called.
> >>>
> >>> I guess we could rename pin_count into hard_refcount or
> >>> page_residency_count or xxx_count, and change the pin/unpin_locked()
> >>> function names accordingly, but that's just a naming detail, it doesn't
> >>> force you to call drm_gem_pin() to vmap() your GEM, it's something we
> >>> do internally.  
> >> Such a rename would be much appreciated. page_residency_count seems
> >> appropriate.  
> > On a second thought, I think I prefer
> > 'unevictable_count/inc_unevictable()/dec_unevictable()'. But looking at  
> 
> Ok
> 
> > the gem-vram changes you just posted, it looks like gem-shmem is not the
> > only one to use the term 'pin' for this page pinning thing, so if we go
> > and plan for a rename, I'd rather make it DRM-wide than gem-shmem being
> > the outlier yet again :-).  
> 
> Which one do you mean?
> 
> - The code in gem-vram does pinning in the TTM sense of the term.

Sorry, but I still don't see why pinning should be a TTM only thing. If
I read the doc of drm_gem_vram_pin():

"
Pinning a buffer object ensures that it is not evicted from a memory
region. A pinned buffer object has to be unpinned before it can be
pinned to another region. If the pl_flag argument is 0, the buffer is
pinned at its current location (video RAM or system memory).
"

And this pinning is not so different from the pinning we have in
gem-shmem: making buffer object memory unevictable/unmovable.

> 
> - From the client code, the pinning got removed.
> 
> - The GEM pin/unpin callbacks are still there, but the long-term plan is 
> to go to dma-buf pin callbacks AFAICT.
> 
> - Renaming the dma-buf pin/unpin would be a kernel-wide change. Not 
> likely to happen.

Again, I'm not sure why we'd want to do that anyway. Just because the
TTM pinning semantics might be slightly different from the
GEM/dma-buf ones doesn't mean the pinning term should be
prohibited outside the TTM scope. The concept of pinning is pretty
generic and applies to system memory too AFAICT.
