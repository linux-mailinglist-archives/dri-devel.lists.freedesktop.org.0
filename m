Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A537AE6DC
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 09:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB1310E0CD;
	Tue, 26 Sep 2023 07:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC6210E0CD
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 07:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695713486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fAPoPKzJY9VRvD8h3WXlth3d+w4hjMrV4Np9NeYDaDM=;
 b=HsrYHtlTFeEj6hnntdcegjXmAjRY6hg7zR/dQ22RiR4aY4AWs/0cpN5+HA5U+0J1tSIP/u
 pyulFKyAZliBuH8LZLAaYM7NXcGcfpLje41UT9iMNYYF6CbfOWukDHCxPfWCdmMHrabZuL
 uot+PD71iqS6Kts+ubBoXVkZfMPbeVI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-3oXB8mgTN5-RG44zuGFSHA-1; Tue, 26 Sep 2023 03:31:25 -0400
X-MC-Unique: 3oXB8mgTN5-RG44zuGFSHA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f41a04a297so73041715e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 00:31:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695713484; x=1696318284;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fAPoPKzJY9VRvD8h3WXlth3d+w4hjMrV4Np9NeYDaDM=;
 b=j2V7o6qnZP2HBNAPn3KyjsqNul1ZThEtDFEp5v3XXqm7u0X4YwjkitrZIGsxe5Ap5T
 HxE1CPN428D3spH1pq6mzAnje6OmVo6bil56NZYTarbZ9Nq9mBgkX59YgVIRpmXM/mYl
 8AiFw4idMo4apkLsV/lAe4D6oyDN0OWUZ9QBMU51Ywx9ePXr3Yp/17ohdx2T+Z6zoqMc
 V8C14ZekBPfgky/stNkaaVisfKRPCpP+uoISjBnjjKw07uWxSUYoP/9zkgpERCuokP1/
 LoNbXEn1cMWy0U9KJ6j3DSBkGTNJt2vmC+kK7mDBrnFHvPzoGhQd1oBxRm/8kWz3+kDW
 i+fw==
X-Gm-Message-State: AOJu0Yz4u5WXlZkx484kplD7LyFvsCHORocSmvBhlQJYMTdNrALGjcy1
 2Bv+yw1MEx65WHyVuCMlSFi77vLfk8BOMGT19iieyMSH/w6G4iL+4kHLf2XWmIXodJf6TtwtRX+
 OTpTuTLX7yooHhXx3gpFhwz7EjpD8
X-Received: by 2002:a7b:c454:0:b0:405:39c1:a98b with SMTP id
 l20-20020a7bc454000000b0040539c1a98bmr8219575wmi.20.1695713483977; 
 Tue, 26 Sep 2023 00:31:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3rblYzBeFCXPZID2No9Gqsl0MpRGLQ0zUteJR4la7MCZu4fVie8NrinytcZZPhnOpv5J8gQ==
X-Received: by 2002:a7b:c454:0:b0:405:39c1:a98b with SMTP id
 l20-20020a7bc454000000b0040539c1a98bmr8219557wmi.20.1695713483625; 
 Tue, 26 Sep 2023 00:31:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 n26-20020a7bcbda000000b004063977eccesm1499128wmi.42.2023.09.26.00.31.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Sep 2023 00:31:23 -0700 (PDT)
Message-ID: <c19e0868-b84e-8eb6-909e-9e37e222b809@redhat.com>
Date: Tue, 26 Sep 2023 09:31:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 3/5] drm/simpledrm: Store xfrm buffer in device instance
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
References: <20230920142535.19321-1-tzimmermann@suse.de>
 <20230920142535.19321-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20230920142535.19321-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 20/09/2023 16:24, Thomas Zimmermann wrote:
> Store and instance of struct drm_xfrm_buf in struct simpledrm_device
> and keep the allocated memory allocated across display updates. Avoid
> possibly reallocating temporary memory on each display update. Instead
> preallocate temporary memory during initialization. Releasing the DRM
> device also releases the xfrm buffer.
> 
> v2:
> 	* reserve storage during probe
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/tiny/simpledrm.c | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
> index 8aceb7d378dea..a3d8a956a4c4e 100644
> --- a/drivers/gpu/drm/tiny/simpledrm.c
> +++ b/drivers/gpu/drm/tiny/simpledrm.c
> @@ -232,6 +232,7 @@ struct simpledrm_device {
>   	struct drm_display_mode mode;
>   	const struct drm_format_info *format;
>   	unsigned int pitch;
> +	struct drm_xfrm_buf xfrm;
>   
>   	/* memory management */
>   	struct iosys_map screen_base;
> @@ -486,7 +487,6 @@ static void simpledrm_primary_plane_helper_atomic_update(struct drm_plane *plane
>   	struct drm_framebuffer *fb = plane_state->fb;
>   	struct drm_device *dev = plane->dev;
>   	struct simpledrm_device *sdev = simpledrm_device_of_dev(dev);
> -	struct drm_xfrm_buf xfrm = DRM_XFRM_BUF_INIT;
>   	struct drm_atomic_helper_damage_iter iter;
>   	struct drm_rect damage;
>   	int ret, idx;
> @@ -508,13 +508,12 @@ static void simpledrm_primary_plane_helper_atomic_update(struct drm_plane *plane
>   
>   		iosys_map_incr(&dst, drm_fb_clip_offset(sdev->pitch, sdev->format, &dst_clip));
>   		drm_fb_blit(&dst, &sdev->pitch, sdev->format->format, shadow_plane_state->data,
> -			    fb, &damage, &xfrm);
> +			    fb, &damage, &sdev->xfrm);
>   	}
>   
>   	drm_dev_exit(idx);
>   out_drm_gem_fb_end_cpu_access:
>   	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
> -	drm_xfrm_buf_release(&xfrm);
>   }
>   
>   static void simpledrm_primary_plane_helper_atomic_disable(struct drm_plane *plane,
> @@ -637,6 +636,7 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
>   	struct drm_connector *connector;
>   	unsigned long max_width, max_height;
>   	size_t nformats;
> +	void *buf;
>   	int ret;
>   
>   	sdev = devm_drm_dev_alloc(&pdev->dev, drv, struct simpledrm_device, dev);
> @@ -718,6 +718,13 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
>   	drm_dbg(dev, "framebuffer format=%p4cc, size=%dx%d, stride=%d byte\n",
>   		&format->format, width, height, stride);
>   
> +	ret = drmm_xfrm_buf_init(dev, &sdev->xfrm);
> +	if (ret)
> +		return ERR_PTR(ret);
> +	buf = drm_xfrm_buf_reserve(&sdev->xfrm, sdev->pitch, GFP_KERNEL);
> +	if (!buf)
> +		return ERR_PTR(-ENOMEM);
> +

I think it would be nice to have a "init_and_reserve()" function, to 
simplify the callers ?

>   	/*
>   	 * Memory management
>   	 */

