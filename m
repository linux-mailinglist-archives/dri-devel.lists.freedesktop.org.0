Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DB0916A1A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 16:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605F810E66A;
	Tue, 25 Jun 2024 14:18:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BrBjVYx1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A884D10E66A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 14:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719325110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fb6+3hXYvaZXmUN1Sk2sdsnwB2lb4gcWlnYa3YyVPno=;
 b=BrBjVYx1thm9jiyJVZJK+CFDFBayCHyg/5yfSXBRe7Q73hcjTeAPcQOU34zhndSwZBYO/l
 o/fQey88U7foEogeHIyWCUdgTC8IlLoqLks0d/Q9YqYUJl04Y8z76M3tK9Sd3VZtYd9+aU
 ah49tA9B9Ug5C+6HqrgIhrEbkNl66II=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-yE8o4kfjOiyc_LLoCf5icg-1; Tue, 25 Jun 2024 10:18:29 -0400
X-MC-Unique: yE8o4kfjOiyc_LLoCf5icg-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2ec5057538aso32212951fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 07:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719325108; x=1719929908;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fb6+3hXYvaZXmUN1Sk2sdsnwB2lb4gcWlnYa3YyVPno=;
 b=qkayMalxDFsDlcZIspK+W+36XHNJN59t3Xcajwt7k3Lac15fv6MobXR4oaCKf7dDMv
 e34PaMev6YxA+rM1dn+5vAJWMhJpP3J1b4qSnIKW3vfIwiCcKTb5nORQNGI2sRLqrw1V
 XpHxm66naWw58BCRWRRsbyvQJ2o67sTRFS/+cJnYzIWN7GDoyG0OwRdAjKJ4814pKBjj
 SDbTOE/8c8/pAJ3ovUspBTdrCKN9kgzr4rX9BP0o2ES5M94sRJtM6Wcn55hfFkH1Z6B/
 ygAcCJvlrql/hK1Zb1whvuxCXEzNe4aSlUQ21nglcaU3d4nridIaMHLyR1WpykqU7nmA
 bm+w==
X-Gm-Message-State: AOJu0Yy/DFd9lD+vpUEH6CaiYJLnGQ9QhxRWdxRF8GuN6qZ7Jo7tdg/f
 NUiTuddqFa3MnSWirXzIbZyEmXfbZ23FXvgtO0z3jBdXqGo5CFlkHR+g6NPBhLHEIsqkILR5vi9
 j0Yv3uUUWoAvsFv2WgSRg8KruMuuz7C6ifMRk19plxWqlFF8Hc1uBRH5KvXlT7T+4Tg==
X-Received: by 2002:a05:6512:205:b0:52c:cc38:5e1f with SMTP id
 2adb3069b0e04-52ce0641433mr5929287e87.47.1719325107766; 
 Tue, 25 Jun 2024 07:18:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkZo8Jfpchvj43cpJws88rwUYuN6JZUDN/srs+KD8fl07pypxFFywUCYNLsQ9LMXnMZWOc+Q==
X-Received: by 2002:a05:6512:205:b0:52c:cc38:5e1f with SMTP id
 2adb3069b0e04-52ce0641433mr5929230e87.47.1719325106493; 
 Tue, 25 Jun 2024 07:18:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366383f687dsm13094661f8f.15.2024.06.25.07.18.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 07:18:25 -0700 (PDT)
Message-ID: <3909ae22-c0c0-4f0a-b3e3-b124e86512f7@redhat.com>
Date: Tue, 25 Jun 2024 16:18:25 +0200
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

Thanks for your patch, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
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

