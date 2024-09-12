Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8AF976AC8
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 15:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF55F10EB80;
	Thu, 12 Sep 2024 13:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JhY1RjX2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D791710EB80
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 13:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726148243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vNgeLzFgcy0/Lnq7Ifun6IjXJZSNpxykQXp+2iYokfU=;
 b=JhY1RjX2Sl3cWvedI6Pa/bFJaRjjMH0GYcZm/mODW/gYnrCl+NfLUM/2zwsLTOZCQgm19u
 T+nfz461K6qAlduaEd/qDsbWflq6kmVHHv5IW72ILExjDmmbL4RrX48ouXsv2+Eavjh8LX
 7p+nlZ1/jAi6MKbkrYnbjeBUtlwzS2M=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-KLKP-Y7UMYq9MWjPNBmT7w-1; Thu, 12 Sep 2024 09:37:21 -0400
X-MC-Unique: KLKP-Y7UMYq9MWjPNBmT7w-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3789c3541e9so452947f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 06:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726148240; x=1726753040;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vNgeLzFgcy0/Lnq7Ifun6IjXJZSNpxykQXp+2iYokfU=;
 b=foXxFVdXgXBPDgVMd4hB3mfgJ3EBof5aFkPaZCp7ycRF+/tgje5e3xO0U1PoeGneht
 27DBzlLsnZPtjrNP9eorpa5vt3U3nJDssUaL9UcQGz8/0F8pQXjoBxS+/ra+ITxvS+tV
 /e4qEdUk4df/lcIOvD89ibL47sUSVJdX7EWmh7LHXh613fq14MORe6CtMfldQE1waV9g
 nNZZacsA34665D3xNLIpk/vW5yKAP5uRR6fWETk+R/nu494wunv+TwNqfq4nmBJ3pHrU
 HDcS2qfRLpLFCDBroSVnQ0+tsvi5PXi6MyHWDiBefjTQ6as6PvcCsHqnOOIInPqCHg1z
 kO5w==
X-Gm-Message-State: AOJu0Yy/AX+Tw53lVC3BUO21pyl/0OMiBNho57XDIDQTiGvsvyNavRp1
 pkJbcyIPR3RlMw23SV338bAwagNkkOS99tRB+dFosePaeGwXu2+dgWz35oX4HOb6VkMHor5jvWC
 zI3DG7fWyDkY0bIwpZ9XQ3UZ5fTEu+jwjXJSGo5Xo/sgaGnenophuPbUrfsk0lOsuuQ==
X-Received: by 2002:adf:f54d:0:b0:371:8e0d:b0fc with SMTP id
 ffacd0b85a97d-378c2d133a9mr1704882f8f.35.1726148240535; 
 Thu, 12 Sep 2024 06:37:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyYqUBpsCfJi0EFGd2oCP9Ns870KAI5AvhE+k/o0lcpnLQk7uJ1l4BJ/d7rLPvNki+Em/w0Q==
X-Received: by 2002:adf:f54d:0:b0:371:8e0d:b0fc with SMTP id
 ffacd0b85a97d-378c2d133a9mr1704860f8f.35.1726148239883; 
 Thu, 12 Sep 2024 06:37:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3789564af1asm14413547f8f.18.2024.09.12.06.37.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 06:37:19 -0700 (PDT)
Message-ID: <58dff3fb-3a46-4b52-9926-8bcb4b859f31@redhat.com>
Date: Thu, 12 Sep 2024 15:37:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] drm/ast: astdp: Avoid upcasting to struct ast_device
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20240911115347.899148-1-tzimmermann@suse.de>
 <20240911115347.899148-3-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240911115347.899148-3-tzimmermann@suse.de>
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

On 11/09/2024 13:51, Thomas Zimmermann wrote:
> Several functions receive an instance of struct drm_device only to
> upcast it to struct ast_device. Improve type safety by passing the
> AST device directly.


Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_dp.c | 24 ++++++++++--------------
>   1 file changed, 10 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
> index dab73dc6cb87..2b5129c6f8b0 100644
> --- a/drivers/gpu/drm/ast/ast_dp.c
> +++ b/drivers/gpu/drm/ast/ast_dp.c
> @@ -158,9 +158,8 @@ static bool ast_dp_power_is_on(struct ast_device *ast)
>   	return !(vgacre3 & AST_DP_PHY_SLEEP);
>   }
>   
> -static void ast_dp_power_on_off(struct drm_device *dev, bool on)
> +static void ast_dp_power_on_off(struct ast_device *ast, bool on)
>   {
> -	struct ast_device *ast = to_ast_device(dev);
>   	// Read and Turn off DP PHY sleep
>   	u8 bE3 = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xE3, AST_DP_VIDEO_ENABLE);
>   
> @@ -192,9 +191,8 @@ static void ast_dp_link_training(struct ast_device *ast)
>   	drm_err(dev, "Link training failed\n");
>   }
>   
> -static void ast_dp_set_on_off(struct drm_device *dev, bool on)
> +static void ast_dp_set_on_off(struct ast_device *ast, bool on)
>   {
> -	struct ast_device *ast = to_ast_device(dev);
>   	u8 video_on_off = on;
>   	u32 i = 0;
>   
> @@ -317,26 +315,25 @@ static void ast_astdp_encoder_helper_atomic_mode_set(struct drm_encoder *encoder
>   static void ast_astdp_encoder_helper_atomic_enable(struct drm_encoder *encoder,
>   						   struct drm_atomic_state *state)
>   {
> -	struct drm_device *dev = encoder->dev;
> -	struct ast_device *ast = to_ast_device(dev);
> +	struct ast_device *ast = to_ast_device(encoder->dev);
>   	struct ast_connector *ast_connector = &ast->output.astdp.connector;
>   
>   	if (ast_connector->physical_status == connector_status_connected) {
> -		ast_dp_power_on_off(dev, AST_DP_POWER_ON);
> +		ast_dp_power_on_off(ast, AST_DP_POWER_ON);
>   		ast_dp_link_training(ast);
>   
>   		ast_wait_for_vretrace(ast);
> -		ast_dp_set_on_off(dev, 1);
> +		ast_dp_set_on_off(ast, 1);
>   	}
>   }
>   
>   static void ast_astdp_encoder_helper_atomic_disable(struct drm_encoder *encoder,
>   						    struct drm_atomic_state *state)
>   {
> -	struct drm_device *dev = encoder->dev;
> +	struct ast_device *ast = to_ast_device(encoder->dev);
>   
> -	ast_dp_set_on_off(dev, 0);
> -	ast_dp_power_on_off(dev, AST_DP_POWER_OFF);
> +	ast_dp_set_on_off(ast, 0);
> +	ast_dp_power_on_off(ast, AST_DP_POWER_OFF);
>   }
>   
>   static const struct drm_encoder_helper_funcs ast_astdp_encoder_helper_funcs = {
> @@ -383,7 +380,6 @@ static int ast_astdp_connector_helper_detect_ctx(struct drm_connector *connector
>   						 bool force)
>   {
>   	struct ast_connector *ast_connector = to_ast_connector(connector);
> -	struct drm_device *dev = connector->dev;
>   	struct ast_device *ast = to_ast_device(connector->dev);
>   	enum drm_connector_status status = connector_status_disconnected;
>   	bool power_is_on;
> @@ -392,13 +388,13 @@ static int ast_astdp_connector_helper_detect_ctx(struct drm_connector *connector
>   
>   	power_is_on = ast_dp_power_is_on(ast);
>   	if (!power_is_on)
> -		ast_dp_power_on_off(dev, true);
> +		ast_dp_power_on_off(ast, true);
>   
>   	if (ast_astdp_is_connected(ast))
>   		status = connector_status_connected;
>   
>   	if (!power_is_on && status == connector_status_disconnected)
> -		ast_dp_power_on_off(dev, false);
> +		ast_dp_power_on_off(ast, false);
>   
>   	mutex_unlock(&ast->modeset_lock);
>   

