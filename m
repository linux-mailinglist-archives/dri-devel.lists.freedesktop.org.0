Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEF0916984
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 15:55:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F9C10E19D;
	Tue, 25 Jun 2024 13:55:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cXWoizWS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06A710E19D
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 13:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719323714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UaeGoK0eatHetnLAWVTTK63vq8uGu/XK8LtxE4rj8O4=;
 b=cXWoizWSI3iBXu4OSu4jTqeFiWl/YkW7so2JOLtO5ww2rvKIFKPtI50tW8i8uC69mjrF6P
 CcbSTPXJ4L83QnwEQ8dJsYFnRJeJ9Y1T3EB8z/MHCaUc+z4Qw1I4itEYgFfDDN/wS/3gRQ
 BU1bvxdP7/rzVvfviz+e2gG59JcigaM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-395-VDcLGNHvPNC0euIogM1lbQ-1; Tue, 25 Jun 2024 09:55:12 -0400
X-MC-Unique: VDcLGNHvPNC0euIogM1lbQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3625bef4461so3123253f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 06:55:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719323711; x=1719928511;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UaeGoK0eatHetnLAWVTTK63vq8uGu/XK8LtxE4rj8O4=;
 b=TjcuDdDhLDy2gPDjWEnz/yj5YmaQIgfMR8oKvxuJ+s4DN98gH+luDCctbryhWIHV52
 m/rsmlYkb24eOjuWpJ+l5aiEWSrtLq4rJeSRU7SErof2/ncknfsv1q9GLGFBMGrEuQkP
 glWEqBjoD4KrsVHWMvo4oCX1dOVbbSuGMhtLXIpc8AxnpvFclMPV50yvkWqsM6UFoY6R
 cprvaUZWEsoWkSFc2EVcbDj+hGQzH8Oxc5RmxXxnwKxGRMlBjhkvoqhNN1doU4YtG6fh
 akDc6J5PnZiA6xPPI0oGNLT2+L1JbIvC+Wv6+rTxdWnrbS3Jkh+TyRxjLqcMritgLbHD
 XdzQ==
X-Gm-Message-State: AOJu0Ywsxkmak3ZiSD80II7lUMDN7rBCU5itlnJpwQgzfEEb/Q4BwCMV
 Vd0OTs+rPRuePVrtx055SQXvWqpwcr60vSPWxDQhrkKK7YiIV+qiRHL55Ai5fBP4opJWsyqPlnn
 bcECpdEyrCf8f+M3g3Vo5RVX3TzDZHbyVrKKFA+qWtHWLJY/oreL68/G9ycZK7AZxQCZ6qIEvBQ
 ==
X-Received: by 2002:adf:ec03:0:b0:364:4321:271a with SMTP id
 ffacd0b85a97d-366e32f70abmr7267139f8f.25.1719323711055; 
 Tue, 25 Jun 2024 06:55:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYDXJWmrfMPIL8aDwNbTYT9qG6cZZcFH9JaV0tKW8U0JIFETQS8cwTQ8meXDrRWbHrhNc81A==
X-Received: by 2002:adf:ec03:0:b0:364:4321:271a with SMTP id
 ffacd0b85a97d-366e32f70abmr7267124f8f.25.1719323710641; 
 Tue, 25 Jun 2024 06:55:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366ed18dfeesm6987570f8f.93.2024.06.25.06.55.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 06:55:09 -0700 (PDT)
Message-ID: <85916061-256b-4268-9361-67421dcb51e8@redhat.com>
Date: Tue, 25 Jun 2024 15:55:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ast: Inline drm_simple_encoder_init()
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240625131815.14514-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240625131815.14514-1-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 25/06/2024 15:18, Thomas Zimmermann wrote:
> The function drm_simple_encoder_init() is a trivial helper and
> deprecated. Replace it with the regular call to drm_encoder_init().
> Resolves the dependency on drm_simple_kms_helper.h. No functional
> changes.

Do you think it's possible to add a default to drm_encoder_init() to 
avoid having to declare the same struct for each encoder ?

something like:

drm_encoder_init(...)
{

if (!funcs)
	funcs = &drm_encoder_default_funcs;

So you can call it like this to get the default funcs:

drm_encoder_init(dev, encoder, NULL, DRM_MODE_ENCODER_DAC, NULL);


I don't see this pattern in other drm functions, so it might not fit the 
current coding style.

Best regards,

-- 

Jocelyn

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_mode.c | 45 ++++++++++++++++++++++++++++++----
>   1 file changed, 40 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 6695af70768f..2fd9c78eab73 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -45,7 +45,6 @@
>   #include <drm/drm_managed.h>
>   #include <drm/drm_panic.h>
>   #include <drm/drm_probe_helper.h>
> -#include <drm/drm_simple_kms_helper.h>
>   
>   #include "ast_ddc.h"
>   #include "ast_drv.h"
> @@ -1358,6 +1357,14 @@ static int ast_crtc_init(struct drm_device *dev)
>   	return 0;
>   }
>   
> +/*
> + * VGA Encoder
> + */
> +
> +static const struct drm_encoder_funcs ast_vga_encoder_funcs = {
> +	.destroy = drm_encoder_cleanup,
> +};
> +
>   /*
>    * VGA Connector
>    */
> @@ -1411,7 +1418,8 @@ static int ast_vga_output_init(struct ast_device *ast)
>   	struct drm_connector *connector = &ast->output.vga.connector;
>   	int ret;
>   
> -	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_DAC);
> +	ret = drm_encoder_init(dev, encoder, &ast_vga_encoder_funcs,
> +			       DRM_MODE_ENCODER_DAC, NULL);
>   	if (ret)
>   		return ret;
>   	encoder->possible_crtcs = drm_crtc_mask(crtc);
> @@ -1427,6 +1435,14 @@ static int ast_vga_output_init(struct ast_device *ast)
>   	return 0;
>   }
>   
> +/*
> + * SIL164 Encoder
> + */
> +
> +static const struct drm_encoder_funcs ast_sil164_encoder_funcs = {
> +	.destroy = drm_encoder_cleanup,
> +};
> +
>   /*
>    * SIL164 Connector
>    */
> @@ -1480,7 +1496,8 @@ static int ast_sil164_output_init(struct ast_device *ast)
>   	struct drm_connector *connector = &ast->output.sil164.connector;
>   	int ret;
>   
> -	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_TMDS);
> +	ret = drm_encoder_init(dev, encoder, &ast_sil164_encoder_funcs,
> +			       DRM_MODE_ENCODER_TMDS, NULL);
>   	if (ret)
>   		return ret;
>   	encoder->possible_crtcs = drm_crtc_mask(crtc);
> @@ -1496,6 +1513,14 @@ static int ast_sil164_output_init(struct ast_device *ast)
>   	return 0;
>   }
>   
> +/*
> + * DP501 Encoder
> + */
> +
> +static const struct drm_encoder_funcs ast_dp501_encoder_funcs = {
> +	.destroy = drm_encoder_cleanup,
> +};
> +
>   /*
>    * DP501 Connector
>    */
> @@ -1578,7 +1603,8 @@ static int ast_dp501_output_init(struct ast_device *ast)
>   	struct drm_connector *connector = &ast->output.dp501.connector;
>   	int ret;
>   
> -	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_TMDS);
> +	ret = drm_encoder_init(dev, encoder, &ast_dp501_encoder_funcs,
> +			       DRM_MODE_ENCODER_TMDS, NULL);
>   	if (ret)
>   		return ret;
>   	encoder->possible_crtcs = drm_crtc_mask(crtc);
> @@ -1594,6 +1620,14 @@ static int ast_dp501_output_init(struct ast_device *ast)
>   	return 0;
>   }
>   
> +/*
> + * ASPEED Display-Port Encoder
> + */
> +
> +static const struct drm_encoder_funcs ast_astdp_encoder_funcs = {
> +	.destroy = drm_encoder_cleanup,
> +};
> +
>   /*
>    * ASPEED Display-Port Connector
>    */
> @@ -1688,7 +1722,8 @@ static int ast_astdp_output_init(struct ast_device *ast)
>   	struct drm_connector *connector = &ast->output.astdp.connector;
>   	int ret;
>   
> -	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_TMDS);
> +	ret = drm_encoder_init(dev, encoder, &ast_astdp_encoder_funcs,
> +			       DRM_MODE_ENCODER_TMDS, NULL);
>   	if (ret)
>   		return ret;
>   	encoder->possible_crtcs = drm_crtc_mask(crtc);

