Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B2F83C9EB
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 18:25:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D87910F951;
	Thu, 25 Jan 2024 17:25:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 659C210F951
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 17:25:08 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-55d095e6ab5so169979a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 09:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1706203447; x=1706808247; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JYX/oCAVtAPg69GHLfdJ2n+S0oxX9mTXkx6MsR4rCD4=;
 b=VJsV2uu7KVE3Uc/LJhG5o09h1fvr7fyYuaHOJmq3FNlYfsQm1SRSJifw9fbBFxY4Ea
 Sz2f2IGKh4GqIuflOIZTTr4smj+OYXH1G4TDWlQMcTbO8q8MYjXXB/ceYA+rfhmySt4f
 TuCz/H/5asIUNY4PkPa+5PyAuwtPXscdrXr6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706203447; x=1706808247;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JYX/oCAVtAPg69GHLfdJ2n+S0oxX9mTXkx6MsR4rCD4=;
 b=hRZ6Bm/yxqzEtreipHvA3FDG4tx5CSA37Kdu2MC4GBS7jklYXnW7uG8ytEXPe6BIZ8
 Zt0UvJoAifEcUirz78J83+dm42pYvZsMOr9vKZqHc1UQknylHYeT3uGNxC6C7Kt6I/Fm
 vRjpvfkpJNNh9dkGqCRYxfE2vOwT6USM4YzvANogKYrACBXzrpjLpp+4c4/O5kq9Y/LG
 URTx/ppl9N234JwgFhTc3FPofI+XNRHpboV32DF/iy5KIK94sOg3WoSyinhRC2DcICRY
 uT/W3vVrIk5yVGs5HIR1dxKDOqn8Kxph5N1ORlR2bh+KcLP87tEN46lvXesqhKaBAeX4
 qr8g==
X-Gm-Message-State: AOJu0Yx1/wXPFK++lTno1rJDdjQGfl821w62n5pdyjpFNASr6BbrJnLU
 xH4WH7hgCAVGP9W901ybSUJJfsDs4veNnflOkmAmUU1xVWKZJR/8QZfNCMJM/SE=
X-Google-Smtp-Source: AGHT+IF3318fNOR+ap3x+yUcMMLZkmzP+Galesm9kpVsUuEFWjctO0BMvGCKCtmYfQFhZl2XpoFOgg==
X-Received: by 2002:a17:906:16c4:b0:a2a:6916:60de with SMTP id
 t4-20020a17090616c400b00a2a691660demr1634893ejd.4.1706203446668; 
 Thu, 25 Jan 2024 09:24:06 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a17090608ca00b00a2eb648cdc5sm1222102eje.156.2024.01.25.09.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 09:24:06 -0800 (PST)
Date: Thu, 25 Jan 2024 18:24:04 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v19 09/30] drm/shmem-helper: Add and use lockless
 drm_gem_shmem_get_pages()
Message-ID: <ZbKZNCbZoV4ovWTH@phenom.ffwll.local>
Mail-Followup-To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, virtualization@lists.linux-foundation.org
References: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
 <20240105184624.508603-10-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240105184624.508603-10-dmitry.osipenko@collabora.com>
X-Operating-System: Linux phenom 6.6.11-amd64 
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
Cc: kernel@collabora.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@gmail.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 05, 2024 at 09:46:03PM +0300, Dmitry Osipenko wrote:
> Add lockless drm_gem_shmem_get_pages() helper that skips taking reservation
> lock if pages_use_count is non-zero, leveraging from atomicity of the
> refcount_t. Make drm_gem_shmem_mmap() to utilize the new helper.
> 
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index cacf0f8c42e2..1c032513abf1 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -226,6 +226,20 @@ void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages_locked);
>  
> +static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
> +{
> +	int ret;

Just random drive-by comment: a might_lock annotation here might be good,
or people could hit some really interesting bugs that are rather hard to
reproduce ...
-Sima

> +
> +	if (refcount_inc_not_zero(&shmem->pages_use_count))
> +		return 0;
> +
> +	dma_resv_lock(shmem->base.resv, NULL);
> +	ret = drm_gem_shmem_get_pages_locked(shmem);
> +	dma_resv_unlock(shmem->base.resv);
> +
> +	return ret;
> +}
> +
>  static int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
>  {
>  	int ret;
> @@ -609,10 +623,7 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
>  		return ret;
>  	}
>  
> -	dma_resv_lock(shmem->base.resv, NULL);
> -	ret = drm_gem_shmem_get_pages_locked(shmem);
> -	dma_resv_unlock(shmem->base.resv);
> -
> +	ret = drm_gem_shmem_get_pages(shmem);
>  	if (ret)
>  		return ret;
>  
> -- 
> 2.43.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
