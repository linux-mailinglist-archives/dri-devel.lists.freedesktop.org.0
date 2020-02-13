Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E530415BC2A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 10:54:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 025B06F58E;
	Thu, 13 Feb 2020 09:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CFCC6F58D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 09:54:42 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id w12so5844129wrt.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 01:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=F6Xrs4G40eT7CiCAVDNye9fsE7epdUzKv1jzBy2mCcY=;
 b=c2jdtDXhA5myh3XLlxgB0otaXBeycNhWoeaw0LyVBeFfpEYTRE2XNIjWNV5JPAuHzG
 n4eEI7qMYJ7RGOCLg3sGEqoMbIeRhVnYX7PhiSk3hFW7T1Di+BQzIax8peR9cU23foYh
 FoZlIC8bdHe4DpsEFHua9PEVhMmE4zbCRQnk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=F6Xrs4G40eT7CiCAVDNye9fsE7epdUzKv1jzBy2mCcY=;
 b=hx5teNha1B350x/sG8q/Jg6z2kF9jmZjP+VP/0z9XfQxqkPgYp6XUIqxRtBUikYfWc
 5M+hRRNYnE1trg6jSqvP8KAaedlxKfxG7AQSc6xoQViv9OCso77lOBt4fQOM1KDvuETM
 Ue9opafCRRMjC+IT/0g/5kjJfHtWrhqAep4gFZwsjAQTA2Ei5eJAseuaQOFn4Z8QCi3G
 15QmR8tFTIX/fxfJWj4LANf+zHH1GyRc+f9FxiYn+cpZxe+9piCWHlgmKz0W/Tegxa12
 ZiWZmpkfgS4orFPDmw8T4LTHWskwIXAfY1HIFQj2Guw6Iv2bucwyM4u5z2Qz1oo11DwO
 ukog==
X-Gm-Message-State: APjAAAUc+uPFmGxzcR4DkTcTuz+DK994/4crYcayhOw8cuFHODQaEKq4
 pGhC4Kt0WRmLzI5pdO2xDIwTFw==
X-Google-Smtp-Source: APXvYqwsjtPrUalJFogK9WuuFtePqrPA0+e261yCARpeQbzvDsYFFYV0oqXbOb5zMEcO3AHIFjqK7Q==
X-Received: by 2002:adf:df0f:: with SMTP id y15mr20439926wrl.26.1581587680659; 
 Thu, 13 Feb 2020 01:54:40 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y12sm2270484wmj.6.2020.02.13.01.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 01:54:39 -0800 (PST)
Date: Thu, 13 Feb 2020 10:54:38 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 14/15] drm/amdgpu/ring: move debugfs init into core
 amdgpu debugfs
Message-ID: <20200213095438.GS2363188@phenom.ffwll.local>
References: <20200207195058.2354-1-alexander.deucher@amd.com>
 <20200207195058.2354-15-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200207195058.2354-15-alexander.deucher@amd.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 07, 2020 at 02:50:57PM -0500, Alex Deucher wrote:
> In order to remove the load and unload drm callbacks,
> we need to reorder the init sequence to move all the drm
> debugfs file handling.  Do this for rings.
> =

> Acked-by: Christian K=F6nig <christian.koenig@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 23 ++++++++++++++++++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c    | 15 +++-----------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h    |  4 ++++
>  3 files changed, 29 insertions(+), 13 deletions(-)
> =

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_debugfs.c
> index df3919ef886b..7379910790c9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> @@ -1218,7 +1218,7 @@ DEFINE_SIMPLE_ATTRIBUTE(fops_ib_preempt, NULL,
>  =

>  int amdgpu_debugfs_init(struct amdgpu_device *adev)
>  {
> -	int r;
> +	int r, i;
>  =

>  	adev->debugfs_preempt =3D
>  		debugfs_create_file("amdgpu_preempt_ib", 0600,
> @@ -1268,12 +1268,33 @@ int amdgpu_debugfs_init(struct amdgpu_device *ade=
v)
>  	}
>  #endif
>  =

> +	for (i =3D 0; i < AMDGPU_MAX_RINGS; ++i) {
> +		struct amdgpu_ring *ring =3D adev->rings[i];
> +
> +		if (!ring)
> +			continue;
> +
> +		if (amdgpu_debugfs_ring_init(adev, ring)) {
> +			DRM_ERROR("Failed to register debugfs file for rings !\n");
> +		}
> +	}
> +
>  	return amdgpu_debugfs_add_files(adev, amdgpu_debugfs_list,
>  					ARRAY_SIZE(amdgpu_debugfs_list));
>  }
>  =

>  void amdgpu_debugfs_fini(struct amdgpu_device *adev)

btw debugfs_fini shouldn't be needed anymore, Greg KH removed this all.
drm core removes all debugfs files recusrively for you, there should be 0
need for debugfs cleanup.

Also at least my tree doesn't even have this, where does this apply to?
-Daniel

>  {
> +	int i;
> +
> +	for (i =3D 0; i < AMDGPU_MAX_RINGS; ++i) {
> +		struct amdgpu_ring *ring =3D adev->rings[i];
> +
> +		if (!ring)
> +			continue;
> +
> +		amdgpu_debugfs_ring_fini(ring);
> +	}
>  	amdgpu_ttm_debugfs_fini(adev);
>  	debugfs_remove(adev->debugfs_preempt);
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_ring.c
> index e5c83e164d82..539be138260e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> @@ -48,9 +48,6 @@
>   * wptr.  The GPU then starts fetching commands and executes
>   * them until the pointers are equal again.
>   */
> -static int amdgpu_debugfs_ring_init(struct amdgpu_device *adev,
> -				    struct amdgpu_ring *ring);
> -static void amdgpu_debugfs_ring_fini(struct amdgpu_ring *ring);
>  =

>  /**
>   * amdgpu_ring_alloc - allocate space on the ring buffer
> @@ -334,10 +331,6 @@ int amdgpu_ring_init(struct amdgpu_device *adev, str=
uct amdgpu_ring *ring,
>  	for (i =3D 0; i < DRM_SCHED_PRIORITY_MAX; ++i)
>  		atomic_set(&ring->num_jobs[i], 0);
>  =

> -	if (amdgpu_debugfs_ring_init(adev, ring)) {
> -		DRM_ERROR("Failed to register debugfs file for rings !\n");
> -	}
> -
>  	return 0;
>  }
>  =

> @@ -367,8 +360,6 @@ void amdgpu_ring_fini(struct amdgpu_ring *ring)
>  			      &ring->gpu_addr,
>  			      (void **)&ring->ring);
>  =

> -	amdgpu_debugfs_ring_fini(ring);
> -
>  	dma_fence_put(ring->vmid_wait);
>  	ring->vmid_wait =3D NULL;
>  	ring->me =3D 0;
> @@ -485,8 +476,8 @@ static const struct file_operations amdgpu_debugfs_ri=
ng_fops =3D {
>  =

>  #endif
>  =

> -static int amdgpu_debugfs_ring_init(struct amdgpu_device *adev,
> -				    struct amdgpu_ring *ring)
> +int amdgpu_debugfs_ring_init(struct amdgpu_device *adev,
> +			     struct amdgpu_ring *ring)
>  {
>  #if defined(CONFIG_DEBUG_FS)
>  	struct drm_minor *minor =3D adev->ddev->primary;
> @@ -507,7 +498,7 @@ static int amdgpu_debugfs_ring_init(struct amdgpu_dev=
ice *adev,
>  	return 0;
>  }
>  =

> -static void amdgpu_debugfs_ring_fini(struct amdgpu_ring *ring)
> +void amdgpu_debugfs_ring_fini(struct amdgpu_ring *ring)
>  {
>  #if defined(CONFIG_DEBUG_FS)
>  	debugfs_remove(ring->ent);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_ring.h
> index 5134d0dd6dc2..0d098dafd23c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> @@ -329,4 +329,8 @@ static inline void amdgpu_ring_write_multiple(struct =
amdgpu_ring *ring,
>  =

>  int amdgpu_ring_test_helper(struct amdgpu_ring *ring);
>  =

> +int amdgpu_debugfs_ring_init(struct amdgpu_device *adev,
> +			     struct amdgpu_ring *ring);
> +void amdgpu_debugfs_ring_fini(struct amdgpu_ring *ring);
> +
>  #endif
> -- =

> 2.24.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
