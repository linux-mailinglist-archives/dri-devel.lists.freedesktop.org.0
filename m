Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB04386A760
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 04:54:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0759910E61D;
	Wed, 28 Feb 2024 03:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="ebpbyM0U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D26C10E56B
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 03:54:43 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-60821136c5aso35592237b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 19:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1709092482; x=1709697282;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YW4SWbLimQ0VFXlHaJDeVx867JJFVSwL6sDK9ku7RFk=;
 b=ebpbyM0UkXUjCLvqPjAU+grYZaiuRJOqWeAF/1mTO+pc16q7lbf182+jxeKL5Q4YQT
 uKOq1Qz1aP3gsEl8xl7qzMMhHdvaugm/oTOo+/kCiDVfT/JgT8M/+7VgeJv61RyF/MoD
 3wqe9wQ2A8Axdf59KtLgBc6AzihU3Pj1dVxxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709092482; x=1709697282;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YW4SWbLimQ0VFXlHaJDeVx867JJFVSwL6sDK9ku7RFk=;
 b=qivz4yJmG94OftXxMEZ1/MEszNZARETZmJHEDexOd0JScQ6UO7UDYXn5o3KQkxaJrT
 Vhk31Gj5AhU0L6tmoG0avwUxqpvQuizO400d4jAiKg2xq2PeSZ141PtaKG85WsXnUuT1
 TtmNbd3wkSpzfVqL5APykTi6g+qY0z6GALhbH7D/847g+RC0LmI97n165wF/GWFpenvF
 T0nPPc9SgQBolkMLo2M3AsWAt3Kfm/CrXkby9BnNvLOpzzQ7nB185LE6qlfVHf0thN/J
 eCist0mFFlskA+Io6000gFIYM23h8ffNFbLp7invCJUSlD1cixLjeXES1NvI7iUjryEv
 OSkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsBw/Tuhr14aicV6nmL0HVpb2LMjIBaErJj2d5iLqLOTA4a53zH+Kjts9FW5KmhmYqXGRRMz2C5QcT4r8Gnor3U+BtBMojiDjpa74zRglf
X-Gm-Message-State: AOJu0YyfTaoH6rj0OygFxesyr9k05+CFHfFkbYr/zGc1+95RMRPPp0bS
 1EZns1Q3N3gVhYAPd6eIiXVcMfKaX3o0DHWQ3d40u55ujofxIlm39NaFQlIbAobeY2q/d00uWlY
 dBL9FjjxR0trxO+WU6qomml8TSlognvFwoLmd
X-Google-Smtp-Source: AGHT+IHEv7+c/ePWhOgKmqYsJ5d3zIAxFqZvYWkNQbw6XfXCc1hvqrNWPlY3OogOg7lOY3gWJjWCq9lA6f1828rRluU=
X-Received: by 2002:a81:b107:0:b0:607:850e:7583 with SMTP id
 p7-20020a81b107000000b00607850e7583mr3821071ywh.38.1709092482039; Tue, 27 Feb
 2024 19:54:42 -0800 (PST)
MIME-Version: 1.0
References: <20240227113853.8464-1-tzimmermann@suse.de>
In-Reply-To: <20240227113853.8464-1-tzimmermann@suse.de>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Tue, 27 Feb 2024 22:54:31 -0500
Message-ID: <CABQX2QMrjqShv0fgYCBzGkVc53DB9NLmh-d2aJMSWg2BfctYXw@mail.gmail.com>
Subject: Re: [PATCH 00/13] drm: Fix reservation locking for pin/unpin and
 console
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org, 
 maarten.lankhorst@linux.intel.com, christian.koenig@amd.com, 
 sumit.semwal@linaro.org, dmitry.osipenko@collabora.com, robdclark@gmail.com, 
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run, 
 marijn.suijten@somainline.org, suijingfeng@loongson.cn, kherbst@redhat.com, 
 lyude@redhat.com, dakr@redhat.com, airlied@redhat.com, kraxel@redhat.com, 
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, 
 bcm-kernel-feedback-list@broadcom.com, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev, 
 spice-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Feb 27, 2024 at 6:38=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Dma-buf locking semantics require the caller of pin and unpin to hold
> the buffer's reservation lock. Fix DRM to adhere to the specs. This
> enables to fix the locking in DRM's console emulation. Similar changes
> for vmap and mmap have been posted at [1][2]
>
> Most DRM drivers and memory managers acquire the buffer object's
> reservation lock within their GEM pin and unpin callbacks. This
> violates dma-buf locking semantics. We get away with it because PRIME
> does not provide pin/unpin, but attach/detach, for which the locking
> semantics is correct.
>
> Patches 1 to 8 rework DRM GEM code in various implementations to
> acquire the reservation lock when entering the pin and unpin callbacks.
> This prepares them for the next patch. Drivers that are not affected
> by these patches either don't acquire the reservation lock (amdgpu)
> or don't need preparation (loongson).
>
> Patch 9 moves reservation locking from the GEM pin/unpin callbacks
> into drm_gem_pin() and drm_gem_unpin(). As PRIME uses these functions
> internally it still gets the reservation lock.
>
> With the updated GEM callbacks, the rest of the patchset fixes the
> fbdev emulation's buffer locking. Fbdev emulation needs to keep its
> GEM buffer object inplace while updating its content. This required
> a implicit pinning and apparently amdgpu didn't do this at all.
>
> Patch 10 introduces drm_client_buffer_vmap_local() and _vunmap_local().
> The former function map a GEM buffer into the kernel's address space
> with regular vmap operations, but keeps holding the reservation lock.
> The _vunmap_local() helper undoes the vmap and releases the lock. The
> updated GEM callbacks make this possible. Between the two calls, the
> fbdev emulation can update the buffer content without have the buffer
> moved or evicted. Update fbdev-generic to use vmap_local helpers,
> which fix amdgpu. The idea of adding a "local vmap" has previously been
> attempted at [3] in a different form.
>
> Patch 11 adds implicit pinning to the DRM client's regular vmap
> helper so that long-term vmap'ed buffers won't be evicted. This only
> affects fbdev-dma, but GEM DMA helpers don't require pinning. So
> there are no practical changes.
>
> Patches 12 and 13 remove implicit pinning from the vmap and vunmap
> operations in gem-vram and qxl. These pin operations are not supposed
> to be part of vmap code, but were required to keep the buffers in place
> for fbdev emulation. With the conversion o ffbdev-generic to to
> vmap_local helpers, that code can finally be removed.
>
> Tested with amdgpu, nouveau, radeon, simpledrm and vc4.
>
> [1] https://patchwork.freedesktop.org/series/106371/
> [2] https://patchwork.freedesktop.org/series/116001/
> [3] https://patchwork.freedesktop.org/series/84732/
>
> Thomas Zimmermann (13):
>   drm/gem-shmem: Acquire reservation lock in GEM pin/unpin callbacks
>   drm/gem-vram: Acquire reservation lock in GEM pin/unpin callbacks
>   drm/msm: Provide msm_gem_get_pages_locked()
>   drm/msm: Acquire reservation lock in GEM pin/unpin callback
>   drm/nouveau: Provide nouveau_bo_{pin,unpin}_locked()
>   drm/nouveau: Acquire reservation lock in GEM pin/unpin callbacks
>   drm/qxl: Provide qxl_bo_{pin,unpin}_locked()
>   drm/qxl: Acquire reservation lock in GEM pin/unpin callbacks
>   drm/gem: Acquire reservation lock in drm_gem_{pin/unpin}()
>   drm/fbdev-generic: Fix locking with drm_client_buffer_vmap_local()
>   drm/client: Pin vmap'ed GEM buffers
>   drm/gem-vram: Do not pin buffer objects for vmap
>   drm/qxl: Do not pin buffer objects for vmap
>
>  drivers/gpu/drm/drm_client.c            |  92 ++++++++++++++++++---
>  drivers/gpu/drm/drm_fbdev_generic.c     |   4 +-
>  drivers/gpu/drm/drm_gem.c               |  34 +++++++-
>  drivers/gpu/drm/drm_gem_shmem_helper.c  |   6 +-
>  drivers/gpu/drm/drm_gem_vram_helper.c   | 101 ++++++++++--------------
>  drivers/gpu/drm/drm_internal.h          |   2 +
>  drivers/gpu/drm/loongson/lsdc_gem.c     |  13 +--
>  drivers/gpu/drm/msm/msm_gem.c           |  20 ++---
>  drivers/gpu/drm/msm/msm_gem.h           |   4 +-
>  drivers/gpu/drm/msm/msm_gem_prime.c     |  20 +++--
>  drivers/gpu/drm/nouveau/nouveau_bo.c    |  43 +++++++---
>  drivers/gpu/drm/nouveau/nouveau_bo.h    |   2 +
>  drivers/gpu/drm/nouveau/nouveau_prime.c |   8 +-
>  drivers/gpu/drm/qxl/qxl_object.c        |  26 +++---
>  drivers/gpu/drm/qxl/qxl_object.h        |   2 +
>  drivers/gpu/drm/qxl/qxl_prime.c         |   4 +-
>  drivers/gpu/drm/radeon/radeon_prime.c   |  11 ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c     |  25 ++----
>  include/drm/drm_client.h                |  10 +++
>  include/drm/drm_gem.h                   |   3 +
>  include/drm/drm_gem_shmem_helper.h      |   7 +-
>  21 files changed, 265 insertions(+), 172 deletions(-)
>
>
> base-commit: 7291e2e67dff0ff573900266382c9c9248a7dea5
> prerequisite-patch-id: bdfa0e6341b30cc9d7647172760b3473007c1216
> prerequisite-patch-id: bc27ac702099f481890ae2c7c4a9c531f4a62d64
> prerequisite-patch-id: f5d4bf16dc45334254527c2e31ee21ba4582761c
> prerequisite-patch-id: 734c87e610747779aa41be12eb9e4c984bdfa743
> prerequisite-patch-id: 0aa359f6144c4015c140c8a6750be19099c676fb
> prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
> prerequisite-patch-id: cbc453ee02fae02af22fbfdce56ab732c7a88c36
> --
> 2.43.2
>

That's a really nice cleanup! I already gave a r-b for 9/13. For the rest:
Acked-by: Zack Rusin <zack.rusin@broadcom.com>

z
