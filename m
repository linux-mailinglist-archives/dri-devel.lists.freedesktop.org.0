Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6CE5133C8
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 14:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA2C10E4D0;
	Thu, 28 Apr 2022 12:34:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E8410E521
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 12:33:59 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id u3so6599229wrg.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 05:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=oM/mhDtYgrTfoqWHcDfm1oQ6TI+8agMAO+j/ubn1fLc=;
 b=QFjsWJOlqR+0ZVt8NYJ+S/caZI3wMRsvdf5luivf3r9b3TOTg8jOxqcs7+oxnyUENI
 5QdlvMdqDxO/q5fmRIgPkMqki7Yx6mTzhjfvC0MwrxuozgeDajkjYApi21QWMPQjayjA
 cAcvWqQlh2+AVQ0W8SppkQa9DBc9c66zwFwww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=oM/mhDtYgrTfoqWHcDfm1oQ6TI+8agMAO+j/ubn1fLc=;
 b=Q/ow7CHbbgnepfN7y4NjOfjYV1Y7G1ZfNm33Jfip08nsxWYFzgc3725ELN44yhZSko
 38RT9OBiSdkLP8ZWwQhhwmkMptegiOur4qMUxbi3AUz/Fufg8V8/k+qigHi0Jc5Y0aUJ
 Dp8vYnuHG4N+oFQpS1y2s5mnO9ZdnGQayAR4JA/VjVMT1FcBeuIbeD+gmtfCa3oi4lxX
 e1X/wbr4C+HAb8C+KYMJhyrT6ObtqUtjp9atNnWrUg2xDzCQkOW33H25f/m/z95TX12y
 pNlj/nndTgF4gyu91RPdvKcVfH4yyEIDkDb9yCLz7cHlsJf3fLapw7PY2eLVzoYmOnXR
 daCg==
X-Gm-Message-State: AOAM530zZzkDHr7eGNyKAh51xeZctmXDFSBDqQDA7Cd85A7x8wdldpgw
 yI5x7jwVO1ESr7mxF+NBtyFMlw==
X-Google-Smtp-Source: ABdhPJyyK4ExiKJP8QtekER2JcpnlC5WS6PaDYGWUo71doJitzURTCSFG1Gx5e2x4TNnODMzeQ0Gdw==
X-Received: by 2002:a05:6000:1883:b0:205:c0cb:33c6 with SMTP id
 a3-20020a056000188300b00205c0cb33c6mr27531231wri.39.1651149238107; 
 Thu, 28 Apr 2022 05:33:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 f66-20020a1c3845000000b00393e84ea043sm4015952wma.44.2022.04.28.05.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 05:33:57 -0700 (PDT)
Date: Thu, 28 Apr 2022 14:33:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v5 15/17] drm/shmem-helper: Make
 drm_gem_shmem_get_pages() private
Message-ID: <YmqJsxHYB2DNBzX0@phenom.ffwll.local>
Mail-Followup-To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Qiang Yu <yuq825@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Dmitry Osipenko <digetx@gmail.com>
References: <20220424190424.540501-1-dmitry.osipenko@collabora.com>
 <20220424190424.540501-16-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220424190424.540501-16-dmitry.osipenko@collabora.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko <digetx@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Steven Price <steven.price@arm.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 virtualization@lists.linux-foundation.org,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 Qiang Yu <yuq825@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 24, 2022 at 10:04:22PM +0300, Dmitry Osipenko wrote:
> VirtIO-GPU driver was the only user of drm_gem_shmem_get_pages()
> and it now uses drm_gem_shmem_get_pages_sgt(). Make the get_pages()
> private to drm_gem_shmem_helper.
> 
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 3 +--
>  include/drm/drm_gem_shmem_helper.h     | 1 -
>  2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 25e9bc2803ee..7ec5f8002f68 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -490,7 +490,7 @@ static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
>   * Returns:
>   * 0 on success or a negative error code on failure.
>   */

We also delete the kerneldoc for functions not exported (kerneldoc is
geared towards driver writes). If there's anything critical the comment
explains about the internals, you can keep that as a normal C style
comment without the /** but generally there's no need for these anymore.
-Daniel

> -int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
> +static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
>  {
>  	int ret;
>  
> @@ -507,7 +507,6 @@ int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
>  
>  	return ret;
>  }
> -EXPORT_SYMBOL(drm_gem_shmem_get_pages);
>  
>  static void drm_gem_shmem_get_pages_no_fail(struct drm_gem_shmem_object *shmem)
>  {
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index 638cb16a4576..5b351933c293 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -180,7 +180,6 @@ struct drm_gem_shmem_object {
>  struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t size);
>  void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem);
>  
> -int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem);
>  void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem);
>  int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem);
>  void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem);
> -- 
> 2.35.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
