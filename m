Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 760115284DC
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 15:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D3610FADC;
	Mon, 16 May 2022 13:00:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67F010FADC
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 13:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652706053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dpnuw/JO7Lbmg5cyDlVXc7w7ryXSHUFTAjuEpxppvYc=;
 b=gI5J7KUS1wHW4m6+T9MIimvINNu0uB3IphKRPcsS0Jw0HYKlsXxL9ZUNYKJLfpmQikj1Z5
 ECYop91sIRQoGshbI4XtBPSuBUq95d9iHxtbFDu4ZIj+90t6FyCZjUrq1mTDAk792sydIf
 qqs2p+RemUC0HecM6YRy7d74NbG56vE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-HQYtVnzcPOKlXBAt0imFXQ-1; Mon, 16 May 2022 09:00:52 -0400
X-MC-Unique: HQYtVnzcPOKlXBAt0imFXQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 l38-20020a05600c1d2600b00395cf292797so3565678wms.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 06:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dpnuw/JO7Lbmg5cyDlVXc7w7ryXSHUFTAjuEpxppvYc=;
 b=CXnynxuRTP9t8hKMZKiUWbaGn0gXlYfermUbtm4cG8VXZAXSa4c2aHiMX8xKfu1pWm
 BRph9S9XI4MleFCkdfQTELgwglqbo0RODfgdksf+Ncnkeg3bVjaIfFoDDOXnduxJnvxX
 EklNIPepKF8GgOnYzCDkv8kPZSqjlG8AFEmleJpxZecRFZkZYCVpT0FvOfd4mrvP4RbE
 px3SBsMUOffqbl1gyZIkewzp4cMP8JjpdrEKRz9gvAN6kdH47Vt/nQKetV/r4kGbltTq
 JoZDA3VuedUEXQLTrCO/WxIOC8bQgC7vjHYl+Quk3+svgRNSMYnDeSshAVzu2OqYFgwg
 IJ+A==
X-Gm-Message-State: AOAM533pexwulGR8ELqBAOwtC8g/642WGgde6UgEC5lKHqq6TJcBnmPE
 iL9+MWEz0+pVhFn+tg6QaqDnHm0x9SDtsCxurbJWAjvpU8qhK0/x6PMYtkLVcGK6dsCtSOmAGfS
 2gyCjpzr90N7Gp9nRyzof5OpmSzLk
X-Received: by 2002:a05:600c:3542:b0:394:6e2f:ffa2 with SMTP id
 i2-20020a05600c354200b003946e2fffa2mr16803519wmq.132.1652706050769; 
 Mon, 16 May 2022 06:00:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEOkrIFjMwH7P5QeA1Zy8pANlrShUnZumJjzagGV1FhGiDNZCrzghLVaKtUitZRa9toZogCg==
X-Received: by 2002:a05:600c:3542:b0:394:6e2f:ffa2 with SMTP id
 i2-20020a05600c354200b003946e2fffa2mr16803495wmq.132.1652706050462; 
 Mon, 16 May 2022 06:00:50 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 a4-20020a05600c348400b003942a244ec4sm10127981wmq.9.2022.05.16.06.00.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 06:00:50 -0700 (PDT)
Message-ID: <bb2862d5-e35f-fb3e-be8b-181bb18993a8@redhat.com>
Date: Mon, 16 May 2022 15:00:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/4] drm/gem: Share code between drm_gem_fb_{begin,
 end}_cpu_access()
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 noralf@tronnes.org, christian.koenig@amd.com
References: <20220509081602.474-1-tzimmermann@suse.de>
 <20220509081602.474-2-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220509081602.474-2-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 5/9/22 10:15, Thomas Zimmermann wrote:
> The error-recovery code in drm_gem_fb_begin() is the same pattern
> as drm_gem_fb_end(). Implement both this an internal helper. No

Maybe "both of these using using an" or something like that ?

> functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 62 ++++++++------------
>  1 file changed, 26 insertions(+), 36 deletions(-)
>

Nice cleanup. For the patch:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

I just have a few minor comments below.

> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index f4619803acd0..2fcacab9f812 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -403,6 +403,27 @@ void drm_gem_fb_vunmap(struct drm_framebuffer *fb,
>  }
>  EXPORT_SYMBOL(drm_gem_fb_vunmap);
>  
> +static void __drm_gem_fb_end_cpu_access(struct drm_framebuffer *fb, enum dma_data_direction dir,
> +					unsigned int num_planes)
> +{
> +	struct dma_buf_attachment *import_attach;
> +	struct drm_gem_object *obj;
> +	int ret;
> +
> +	while (num_planes) {
> +		--num_planes;
> +		obj = drm_gem_fb_get_obj(fb, num_planes);
> +		if (!obj)
> +			continue;
> +		import_attach = obj->import_attach;
> +		if (!import_attach)
> +			continue;
> +		ret = dma_buf_end_cpu_access(import_attach->dmabuf, dir);
> +		if (ret)
> +			drm_err(fb->dev, "dma_buf_end_cpu_access() failed: %d\n", ret);

I wonder if would be useful to also print the plane index and access mode here.

> +	}
> +}
> +
>  /**
>   * drm_gem_fb_begin_cpu_access - prepares GEM buffer objects for CPU access
>   * @fb: the framebuffer
> @@ -422,7 +443,7 @@ int drm_gem_fb_begin_cpu_access(struct drm_framebuffer *fb, enum dma_data_direct
>  	struct dma_buf_attachment *import_attach;
>  	struct drm_gem_object *obj;
>  	size_t i;
> -	int ret, ret2;
> +	int ret;
>  
>  	for (i = 0; i < ARRAY_SIZE(fb->obj); ++i) {
>  		obj = drm_gem_fb_get_obj(fb, i);
> @@ -433,28 +454,13 @@ int drm_gem_fb_begin_cpu_access(struct drm_framebuffer *fb, enum dma_data_direct
>  			continue;
>  		ret = dma_buf_begin_cpu_access(import_attach->dmabuf, dir);
>  		if (ret)
> -			goto err_dma_buf_end_cpu_access;
> +			goto err___drm_gem_fb_end_cpu_access;

I wouldn't rename this. As I read it, the goto label doesn't denote what
function is called but rather what action is being taken in an error path.

Since finally what's being done is a dma_buf_end_cpu_access in the helper,
I think that just keeping err_dma_buf_end_cpu_access is enough. Also, the
additional underscores added make it harder to read IMO.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

