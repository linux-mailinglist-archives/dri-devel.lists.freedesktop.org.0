Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A982691BBC8
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 11:45:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9AD10EBF4;
	Fri, 28 Jun 2024 09:45:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RU7fPKYg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EDA010EBF4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 09:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719567900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xF9W9nufk7Yguc1hxjMWBdR2/N1U15WThQm0qjmi0/U=;
 b=RU7fPKYgKQ0YwX5yPeIKUlXNb9L7CfTVThQUtTi4qbOej7shNb6GO2oBxR3UUCqG+CPJ3D
 YjhAXSPlYgj1OirTtZjavLVAOsDisQwvUhB4PPc7lfDOk6undfzidgYsepeyKevyI+R8QL
 Q9ng1BA29JLBHrkSQoI3SjljuSt30WY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-YND_5S25NEKCuXEqI1lc7w-1; Fri, 28 Jun 2024 05:44:59 -0400
X-MC-Unique: YND_5S25NEKCuXEqI1lc7w-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-364dfcace34so226483f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 02:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719567898; x=1720172698;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xF9W9nufk7Yguc1hxjMWBdR2/N1U15WThQm0qjmi0/U=;
 b=eHBKIjPgogD0zeyRmNnc879Iqzo2fs3c133poGAgUSwcEDI69HEVD76D1XHJPKsXkP
 QH+DHJuFxV52zdlciMYHI4CfiMi9HyQ3wdutkVvMaLKK2X6UATbp1xthKuKCBCchna0P
 Lrjknc2shvk9Rz+eI3q8XP5A8KWAgMAgbNVnExPPTdRA+EuKRG6qF9lRg7e5KRNcpib4
 dwX31/Tf6OFgzWdXJxQ9UQhRvQLs4TeTnecStvoEIWSy1iQaTY9yOHU4Pzg7aywoVp6l
 sobb0yU3bpdpqkoZf9flqJO6nzZ60fKQU6gF+fH91GXRGMDl3DqNRBfRQPZtUso/nXtf
 PFeQ==
X-Gm-Message-State: AOJu0YyjyIRZ6QkjySevVP5vRgF2n3+/eT1qMhBm50gnC+EewOx5I4Gt
 lktVu8hWal++iFj9Dvb9pcXqUqaP0s5feJUeQQlGdJeSeR1JnfaPPd9dLLWyaqUchsQO3AGOzZ9
 UlXKA0qCnQVSJaruijXAWG4v+m/FoD1kUv8rDCYsfDsizA3FSQRPfDrlR6x5Uq4CE+uKlbyHwJB
 DD
X-Received: by 2002:a5d:5f8e:0:b0:366:eeb0:5c7a with SMTP id
 ffacd0b85a97d-366eeb05cc5mr12275789f8f.6.1719567897749; 
 Fri, 28 Jun 2024 02:44:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFH+wSieCn8oswEbB1A0rCyuHUWFgL7Lp3nK+cs6QeoWbRFqOPCK8O8mjapO2a1P8As8v8zw==
X-Received: by 2002:a5d:5f8e:0:b0:366:eeb0:5c7a with SMTP id
 ffacd0b85a97d-366eeb05cc5mr12275778f8f.6.1719567897415; 
 Fri, 28 Jun 2024 02:44:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a1046f2sm1699720f8f.112.2024.06.28.02.44.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jun 2024 02:44:57 -0700 (PDT)
Message-ID: <80ac2ebb-11e6-4ce0-a203-2384543a48a8@redhat.com>
Date: Fri, 28 Jun 2024 11:44:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] drm/ast: Implement atomic enable/disable for encoders
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org
References: <20240627153638.8765-1-tzimmermann@suse.de>
 <20240627153638.8765-2-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240627153638.8765-2-tzimmermann@suse.de>
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
> The CRTC helpers contain code to enable and disable DisplayPort
> connectors. Implement this functionality in the respective connector's
> atomic_enable/atomic_disable callbacks. DRM's atomic-modesetting
> helpers will call the functions as part of the atomic commit.

Thanks, it looks good te me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_mode.c | 66 +++++++++++++++++++++++++---------
>   1 file changed, 50 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 2fd9c78eab73..7f9f77b7ee73 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1034,14 +1034,6 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
>   	case DRM_MODE_DPMS_ON:
>   		ast_set_index_reg_mask(ast, AST_IO_VGASRI,  0x01, 0xdf, 0);
>   		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, 0);
> -		if (ast->tx_chip_types & AST_TX_DP501_BIT)
> -			ast_set_dp501_video_output(crtc->dev, 1);
> -
> -		if (ast->tx_chip_types & AST_TX_ASTDP_BIT) {
> -			ast_dp_power_on_off(crtc->dev, AST_DP_POWER_ON);
> -			ast_wait_for_vretrace(ast);
> -			ast_dp_set_on_off(crtc->dev, 1);
> -		}
>   
>   		ast_state = to_ast_crtc_state(crtc->state);
>   		format = ast_state->format;
> @@ -1061,14 +1053,6 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
>   	case DRM_MODE_DPMS_SUSPEND:
>   	case DRM_MODE_DPMS_OFF:
>   		ch = mode;
> -		if (ast->tx_chip_types & AST_TX_DP501_BIT)
> -			ast_set_dp501_video_output(crtc->dev, 0);
> -
> -		if (ast->tx_chip_types & AST_TX_ASTDP_BIT) {
> -			ast_dp_set_on_off(crtc->dev, 0);
> -			ast_dp_power_on_off(crtc->dev, AST_DP_POWER_OFF);
> -		}
> -
>   		ast_set_index_reg_mask(ast, AST_IO_VGASRI,  0x01, 0xdf, 0x20);
>   		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, ch);
>   		break;
> @@ -1521,6 +1505,27 @@ static const struct drm_encoder_funcs ast_dp501_encoder_funcs = {
>   	.destroy = drm_encoder_cleanup,
>   };
>   
> +static void ast_dp501_encoder_helper_atomic_enable(struct drm_encoder *encoder,
> +						   struct drm_atomic_state *state)
> +{
> +	struct drm_device *dev = encoder->dev;
> +
> +	ast_set_dp501_video_output(dev, 1);
> +}
> +
> +static void ast_dp501_encoder_helper_atomic_disable(struct drm_encoder *encoder,
> +						    struct drm_atomic_state *state)
> +{
> +	struct drm_device *dev = encoder->dev;
> +
> +	ast_set_dp501_video_output(dev, 0);
> +}
> +
> +static const struct drm_encoder_helper_funcs ast_dp501_encoder_helper_funcs = {
> +	.atomic_enable = ast_dp501_encoder_helper_atomic_enable,
> +	.atomic_disable = ast_dp501_encoder_helper_atomic_disable,
> +};
> +
>   /*
>    * DP501 Connector
>    */
> @@ -1607,6 +1612,8 @@ static int ast_dp501_output_init(struct ast_device *ast)
>   			       DRM_MODE_ENCODER_TMDS, NULL);
>   	if (ret)
>   		return ret;
> +	drm_encoder_helper_add(encoder, &ast_dp501_encoder_helper_funcs);
> +
>   	encoder->possible_crtcs = drm_crtc_mask(crtc);
>   
>   	ret = ast_dp501_connector_init(dev, connector);
> @@ -1628,6 +1635,31 @@ static const struct drm_encoder_funcs ast_astdp_encoder_funcs = {
>   	.destroy = drm_encoder_cleanup,
>   };
>   
> +static void ast_astdp_encoder_helper_atomic_enable(struct drm_encoder *encoder,
> +						   struct drm_atomic_state *state)
> +{
> +	struct drm_device *dev = encoder->dev;
> +	struct ast_device *ast = to_ast_device(dev);
> +
> +	ast_dp_power_on_off(dev, AST_DP_POWER_ON);
> +	ast_wait_for_vretrace(ast);
> +	ast_dp_set_on_off(dev, 1);
> +}
> +
> +static void ast_astdp_encoder_helper_atomic_disable(struct drm_encoder *encoder,
> +						    struct drm_atomic_state *state)
> +{
> +	struct drm_device *dev = encoder->dev;
> +
> +	ast_dp_set_on_off(dev, 0);
> +	ast_dp_power_on_off(dev, AST_DP_POWER_OFF);
> +}
> +
> +static const struct drm_encoder_helper_funcs ast_astdp_encoder_helper_funcs = {
> +	.atomic_enable = ast_astdp_encoder_helper_atomic_enable,
> +	.atomic_disable = ast_astdp_encoder_helper_atomic_disable,
> +};
> +
>   /*
>    * ASPEED Display-Port Connector
>    */
> @@ -1726,6 +1758,8 @@ static int ast_astdp_output_init(struct ast_device *ast)
>   			       DRM_MODE_ENCODER_TMDS, NULL);
>   	if (ret)
>   		return ret;
> +	drm_encoder_helper_add(encoder, &ast_astdp_encoder_helper_funcs);
> +
>   	encoder->possible_crtcs = drm_crtc_mask(crtc);
>   
>   	ret = ast_astdp_connector_init(dev, connector);

