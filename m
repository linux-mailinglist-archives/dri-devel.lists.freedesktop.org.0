Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED0F62F58E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 14:09:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63D310E726;
	Fri, 18 Nov 2022 13:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5ED10E726
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 13:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668776936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=caedTY5LMyFw0Xq7T3f0INPaKiI48MMznuWMfO3dps4=;
 b=bIZcBUdfv7YkmkhJfJlXFdBXBdDXLD5I+ze1HKKWMRNcXLQJkKanRK4Ihtf3609NW/TK5l
 AV4Gm7ISCjzIk3/goaR2ckHAeKbtSHNtqe091hD07+c3AWYlhg9j5l024/f4bcb/7RPSGX
 U8ZGVRo3uOiano1MbBj4cZdG6ozvSgg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-84-m3iiZF_yOVicxDoezulP7A-1; Fri, 18 Nov 2022 08:08:55 -0500
X-MC-Unique: m3iiZF_yOVicxDoezulP7A-1
Received: by mail-wr1-f72.google.com with SMTP id
 k1-20020adfb341000000b00238745c9b1aso1554119wrd.5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 05:08:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=caedTY5LMyFw0Xq7T3f0INPaKiI48MMznuWMfO3dps4=;
 b=uXXzYM7pKoCxavjkIwjTANl6wQcZs0TLevfWL0d2kp3Xze/2MsNOXyiwD9qmQU0gRm
 09UILXMxNNRY2qrntxk8EzGywBfeOoJ/hio2qMl4N+BCLU3GD3wqjLSA+ZbrHto/JJt6
 JMcho7UYEW0m+u6wI2H4O/i8YjscsfsT3LXMdnYvP9tmUxIhXwGU3dF6ULRKxBosrdPN
 NHQqxwoIG9HjuCyfKy3XYgW3UOTx4PuNCbyUDMUBz1Pm3Rq27YR+dEsTCbxbixWL48rq
 gf8oTwsLRtl8AQXEmv3nElmx645aiSvXQVsOPMq5CB36rSs9y4qWVEVz0jGt/bc7/kYc
 VrBw==
X-Gm-Message-State: ANoB5pkR9DV2X1uYeaK6Jys1r9GfIEgopZ3pEhQgtlpEA2Si5i00kZpO
 O2aPxXhsThzF9uABlxDynUP4SeeADWp6ex20FTRt3LbkEtUtCZMcbwozX7p7sPNwtJ1PO+q1D2F
 3t5cuF8Axvxtd7kH8AOGw12vgkvwH
X-Received: by 2002:adf:e2c3:0:b0:236:65f2:eade with SMTP id
 d3-20020adfe2c3000000b0023665f2eademr4143720wrj.608.1668776934098; 
 Fri, 18 Nov 2022 05:08:54 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6Z4PwGjQ7wAK4Sc6pIBiNXmBA15XslywrucKiI7Zc2N76ZElHo5jJph88bLcPALo0mkQOGTg==
X-Received: by 2002:adf:e2c3:0:b0:236:65f2:eade with SMTP id
 d3-20020adfe2c3000000b0023665f2eademr4143705wrj.608.1668776933911; 
 Fri, 18 Nov 2022 05:08:53 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l6-20020a5d5606000000b0022efc4322a9sm3604848wrv.10.2022.11.18.05.08.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 05:08:53 -0800 (PST)
Message-ID: <521e43bb-0c76-f3b7-aa78-8ed97edce613@redhat.com>
Date: Fri, 18 Nov 2022 14:08:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 2/7] drm/logicvc: Fix preferred fbdev cpp
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 xinliang.liu@linaro.org, tiantao6@hisilicon.com, jstultz@google.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 paul.kocialkowski@bootlin.com, airlied@redhat.com, kraxel@redhat.com
References: <20221116160917.26342-1-tzimmermann@suse.de>
 <20221116160917.26342-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221116160917.26342-3-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/16/22 17:09, Thomas Zimmermann wrote:
> Logicvc can have different values for the preferred color depth. Set
> the fbdev bpp value depending on the runtime value.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/logicvc/logicvc_drm.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.c b/drivers/gpu/drm/logicvc/logicvc_drm.c
> index 9de24d9f0c963..d9cd5d967e31f 100644
> --- a/drivers/gpu/drm/logicvc/logicvc_drm.c
> +++ b/drivers/gpu/drm/logicvc/logicvc_drm.c
> @@ -301,6 +301,7 @@ static int logicvc_drm_probe(struct platform_device *pdev)
>  	struct regmap *regmap = NULL;
>  	struct resource res;
>  	void __iomem *base;
> +	unsigned int preferred_bpp;
>  	int irq;
>  	int ret;
>  
> @@ -438,7 +439,18 @@ static int logicvc_drm_probe(struct platform_device *pdev)
>  		goto error_mode;
>  	}
>  
> -	drm_fbdev_generic_setup(drm_dev, drm_dev->mode_config.preferred_depth);
> +	switch (drm_dev->mode_config.preferred_depth) {
> +	case 15:

Why could have 15? IIUC the formats supported by this driver are:

static uint32_t logicvc_layer_formats_rgb16[] = {
	DRM_FORMAT_RGB565,
	DRM_FORMAT_BGR565,
	DRM_FORMAT_INVALID,
};

static uint32_t logicvc_layer_formats_rgb24[] = {
	DRM_FORMAT_XRGB8888,
	DRM_FORMAT_XBGR8888,
	DRM_FORMAT_INVALID,
};

/*
 * What we call depth in this driver only counts color components, not alpha.
 * This allows us to stay compatible with the LogiCVC bistream definitions.
 */
static uint32_t logicvc_layer_formats_rgb24_alpha[] = {
	DRM_FORMAT_ARGB8888,
	DRM_FORMAT_ABGR8888,
	DRM_FORMAT_INVALID,
};

So shouldn't be just 16, 24 and 32 ?

> +	case 16:
> +		preferred_bpp = 16;
> +		break;
> +	case 24:
> +	case 32:
> +	default:
> +		preferred_bpp = 32;
> +		break;

I'm also not sure if this is needed. Since IIUC in logicvc_mode_init() the
driver does:

	preferred_depth = layer_primary->formats->depth;

	/* DRM counts alpha in depth, our driver doesn't. */
	if (layer_primary->formats->alpha)
		preferred_depth += 8;

	...
	mode_config->preferred_depth = preferred_depth;

So it seems this patch is not needed? Unless I'm misunderstanding the code.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

