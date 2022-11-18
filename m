Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF3A62F55A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 13:52:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F9C10E1FC;
	Fri, 18 Nov 2022 12:52:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0060F10E1F3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 12:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668775951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wT9OP3LDmRZ2M3TfE/uxE8r3xlgycJJRrdbX7I4PpEk=;
 b=FHLsO5yhndys3gyyIgLS3jGjDRH2PpS2G+7YnhhtPSTkB7wwD+KnNesdtg+gSe7M7Dc+ei
 Wf7HW4TiEl5PVeBl/zzhKj/ZKHo34fIe26h6mrh8lf+P7IiTncu8lL94fy18xJS0FbW3aG
 JWfu5zLzcnQ1q8NlWvgZYjx22MzXPeQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-158-w2-9zaBMPq-FfffVWDegEQ-1; Fri, 18 Nov 2022 07:52:29 -0500
X-MC-Unique: w2-9zaBMPq-FfffVWDegEQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 h9-20020a1c2109000000b003cfd37aec58so2226942wmh.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 04:52:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wT9OP3LDmRZ2M3TfE/uxE8r3xlgycJJRrdbX7I4PpEk=;
 b=jWwV16LiIgUUuz3Mm3v4cevIOCzbjGnBbhgvZ/ddE/2yQXD+yNaXqdtg517Aeiuls7
 6an0iT2rYMQFXcRKnTuKSQlLP0/E+fRwcMhBFxpRJsxme3U8mmbnXKxLYF9DyHwFQX/1
 PabXiPD3+gLFtrKrsZblNEcmObpjbm66FlV2OCXgYPz1K4caWHgiqD2KoeePD3Q3aXKy
 m+pMmB+iZfmr0sAgI75OaIUrkn3QDGDt2BxVQJeYjdWnf3Q0cMuLgyxlCzNH8CCAdbTp
 O1HUGKLnn6YV46wnBdjf8eRpHOOYjqiI7Ad0VQ7adwMM2JDk7+GTs00tI3d1A45nQQeC
 45BQ==
X-Gm-Message-State: ANoB5pl2rMdsL5QrCzH7P7+G4vIy+KoehbLKy9sXCrBCvc305/edKNk8
 s5Wj4v10QWzAYnx/9/pHp5CE0j/QHe0VGMhDIuO1vMupzR/fhb57V4eaK3zboSA1nddrpqIN7GZ
 zZKS4EJDxjNqU7lg5zGDV/IkwPU35
X-Received: by 2002:a5d:4a05:0:b0:236:5abb:590a with SMTP id
 m5-20020a5d4a05000000b002365abb590amr4205823wrq.700.1668775948702; 
 Fri, 18 Nov 2022 04:52:28 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4MX+07NFSdzp6BpmgEjgAS8YqzfVUz6NN4LkO1jB3x2TlMRy4PXvQVXHqTBmA60tIVPgyxmg==
X-Received: by 2002:a5d:4a05:0:b0:236:5abb:590a with SMTP id
 m5-20020a5d4a05000000b002365abb590amr4205809wrq.700.1668775948381; 
 Fri, 18 Nov 2022 04:52:28 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i7-20020a05600c354700b003cf4eac8e80sm6174027wmq.23.2022.11.18.04.52.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 04:52:28 -0800 (PST)
Message-ID: <b0421c22-2893-d76a-4cd8-07f5fdb9add1@redhat.com>
Date: Fri, 18 Nov 2022 13:52:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 1/7] drm/hisilicon/hibmc: Fix preferred depth and bpp
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 xinliang.liu@linaro.org, tiantao6@hisilicon.com, jstultz@google.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 paul.kocialkowski@bootlin.com, airlied@redhat.com, kraxel@redhat.com
References: <20221116160917.26342-1-tzimmermann@suse.de>
 <20221116160917.26342-2-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221116160917.26342-2-tzimmermann@suse.de>
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

Hello Thomas,

On 11/16/22 17:09, Thomas Zimmermann wrote:
> Set the preferred color depth to 24 bits and the fbdev bpp to 32
> bits. This will signal XRGB8888 as default format to clients.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index 22053c613644a..0c4aa4d9b0a77 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -106,7 +106,7 @@ static int hibmc_kms_init(struct hibmc_drm_private *priv)
>  	dev->mode_config.max_width = 1920;
>  	dev->mode_config.max_height = 1200;
>  
> -	dev->mode_config.preferred_depth = 32;
> +	dev->mode_config.preferred_depth = 24;

In the cover letter you said "color depth is the number of color and alpha bits
that affect image composition" but it should be "only the number of color bits
excluding the alpha bits" a better description right?

I also wonder if instead of using a 24 magic number, TRUE_COLOR_DEPTH constant
macro or XRGB8888_COLOR_DEPTH could be defined?

>  	dev->mode_config.prefer_shadow = 1;
>  
>  	dev->mode_config.funcs = (void *)&hibmc_mode_funcs;
> @@ -340,7 +340,7 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
>  		goto err_unload;
>  	}
>  
> -	drm_fbdev_generic_setup(dev, dev->mode_config.preferred_depth);
> +	drm_fbdev_generic_setup(dev, 32);
> 

And same here? Maybe TRUE_COLOR_ALPHA_BPP or XRGB8888_BPP? Can't think of a
good name really for this, but just to avoid using a constant number here.
 
In any case the patch looks good to me:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

