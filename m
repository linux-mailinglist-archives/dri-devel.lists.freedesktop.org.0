Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6989991BBD1
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 11:45:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 376E510EBFA;
	Fri, 28 Jun 2024 09:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Fh6yB1mN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 451EA10EBFA
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 09:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719567941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uoIQp4SaOS2d5CyM3tAs5ItcuJAj8oUIzG99Tc2TJdw=;
 b=Fh6yB1mNFp1vvEjdKdkRygtMssL9n2oVjkBFZfs1eFtMT2KT0dlAZ96qwXff0a+haUh8Ro
 v8aID25TlvGV2OaRj4n0/NQsx/2wVpFMJlxlgve9iPx60KSofLpZaUU605/jT4RiQ0dlm9
 nwjcTJRD+KuhJFHwOFkAIhx0Nx6NVyQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-c_aqkGjiOi61pBcuk8BCwQ-1; Fri, 28 Jun 2024 05:45:39 -0400
X-MC-Unique: c_aqkGjiOi61pBcuk8BCwQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-421f43ddc2aso3616425e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 02:45:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719567939; x=1720172739;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uoIQp4SaOS2d5CyM3tAs5ItcuJAj8oUIzG99Tc2TJdw=;
 b=d5Icaw7so9idZAW+JJok7aGM79O61Q+qZss3ZoGn7nJMXnuyODRjLtdPUeB4D8OR++
 S/B1vCF1UJ5K2Psm6e7pH6afNwVG9xgWGGGwIiADc8GK14RyWBM4RdHzNlz044o11oUy
 Mb4unF0OpdLQy95FoSPasXRQS8ABdyzwMuWB+hILjCeepasOYCvz+DoRH3fwajglnOyK
 bypTzvWKJz/q8VHybIj7636NtRICHQ7gvEfLPOLcGzUfNQHbvzKSbU/+FAJJloPboCsy
 KKWSbojaE7dgVh3CyDRalA7gvdmq/c7jcxEUbuOTwcaY8JvCNe+YkA6sZ/CFyUg5keOb
 PM6Q==
X-Gm-Message-State: AOJu0YzB75LjIXL65PgpQGe0HmMtAv85uIZ22gtaCP3o5wfsEbufe8aJ
 9677WnpB7I+a8pQ/VLxrIomuN3WosYw61c/U3oqhn1jgR76vLu0EGHMlIG/n3AiaOW5TZKxiQLP
 eMda6KdCyL5Ij0iyNX+/z+/BWJVDSyrs/uWH5H7oU5kmme54ftnMypmrm8PBGNLy/eg==
X-Received: by 2002:a05:600c:28a:b0:425:3084:c99 with SMTP id
 5b1f17b1804b1-42530840db3mr47978655e9.31.1719567938875; 
 Fri, 28 Jun 2024 02:45:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJhQASoI51CEtos2rpd8f0xve1Mt8n0PxkH72xNK/6ET3AaPOrRM1UIJaEJ1Iv6CpfsW8KVw==
X-Received: by 2002:a05:600c:28a:b0:425:3084:c99 with SMTP id
 5b1f17b1804b1-42530840db3mr47978535e9.31.1719567938469; 
 Fri, 28 Jun 2024 02:45:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b0c172csm26783505e9.41.2024.06.28.02.45.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jun 2024 02:45:38 -0700 (PDT)
Message-ID: <a48b4247-e821-4e00-bc11-0db51cb2ca59@redhat.com>
Date: Fri, 28 Jun 2024 11:45:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] drm/ast: Program mode for AST DP in atomic_mode_set
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org
References: <20240627153638.8765-1-tzimmermann@suse.de>
 <20240627153638.8765-3-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240627153638.8765-3-tzimmermann@suse.de>
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



On 27/06/2024 17:27, Thomas Zimmermann wrote:
> The CRTC's atomic flush function contains code to program the
> display mode ot the AST DP chip. Move the code to the connector's
> atomic_mode_set callback. The DRM atomic-modesetting code invoke
> this callback as part of the atomic commit.

Thanks, it looks good te me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_mode.c | 17 ++++++++++++-----
>   1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 7f9f77b7ee73..421fcdad40e4 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1190,7 +1190,6 @@ ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
>   	struct drm_device *dev = crtc->dev;
>   	struct ast_device *ast = to_ast_device(dev);
>   	struct ast_crtc_state *ast_crtc_state = to_ast_crtc_state(crtc_state);
> -	struct ast_vbios_mode_info *vbios_mode_info = &ast_crtc_state->vbios_mode_info;
>   
>   	/*
>   	 * The gamma LUT has to be reloaded after changing the primary
> @@ -1204,10 +1203,6 @@ ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
>   		else
>   			ast_crtc_set_gamma_linear(ast, ast_crtc_state->format);
>   	}
> -
> -	//Set Aspeed Display-Port
> -	if (ast->tx_chip_types & AST_TX_ASTDP_BIT)
> -		ast_dp_set_mode(crtc, vbios_mode_info);
>   }
>   
>   static void ast_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
> @@ -1635,6 +1630,17 @@ static const struct drm_encoder_funcs ast_astdp_encoder_funcs = {
>   	.destroy = drm_encoder_cleanup,
>   };
>   
> +static void ast_astdp_encoder_helper_atomic_mode_set(struct drm_encoder *encoder,
> +						     struct drm_crtc_state *crtc_state,
> +						     struct drm_connector_state *conn_state)
> +{
> +	struct drm_crtc *crtc = crtc_state->crtc;
> +	struct ast_crtc_state *ast_crtc_state = to_ast_crtc_state(crtc_state);
> +	struct ast_vbios_mode_info *vbios_mode_info = &ast_crtc_state->vbios_mode_info;
> +
> +	ast_dp_set_mode(crtc, vbios_mode_info);
> +}
> +
>   static void ast_astdp_encoder_helper_atomic_enable(struct drm_encoder *encoder,
>   						   struct drm_atomic_state *state)
>   {
> @@ -1656,6 +1662,7 @@ static void ast_astdp_encoder_helper_atomic_disable(struct drm_encoder *encoder,
>   }
>   
>   static const struct drm_encoder_helper_funcs ast_astdp_encoder_helper_funcs = {
> +	.atomic_mode_set = ast_astdp_encoder_helper_atomic_mode_set,
>   	.atomic_enable = ast_astdp_encoder_helper_atomic_enable,
>   	.atomic_disable = ast_astdp_encoder_helper_atomic_disable,
>   };

