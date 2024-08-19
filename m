Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CA3956773
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 11:49:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8399D10E239;
	Mon, 19 Aug 2024 09:49:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="H/7DSjXJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3D310E239
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 09:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724060974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lP/Hswc40t2y1qpKdBElLh3G8jUXDPx/hEGP9At02y0=;
 b=H/7DSjXJ3ZgbdFDfGPItRqI+aOf9ZOXMxllIpBGFQ2ipWBaUrtzXQD0d3lQm6ME7AkGOI2
 dqRhcFue79yhxwlYTvs7tYfExDHo/xDZCu+hjD3mLhHJcJPVw/yzBuSaU/Q90KPEmVrOiB
 83GvAFEspGbd3RTrxiHFN2UvS8KxsEI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-0eA9ejAPO16h-7BKTpwiLA-1; Mon, 19 Aug 2024 05:49:32 -0400
X-MC-Unique: 0eA9ejAPO16h-7BKTpwiLA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42816096cb8so46135485e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 02:49:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724060971; x=1724665771;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lP/Hswc40t2y1qpKdBElLh3G8jUXDPx/hEGP9At02y0=;
 b=BqeXPlJxKWyfZ29BHiRJ2CsfL8MPdnWSDbIv+B4CHWmwdVoNJrBK0h9S6Gdhgt+ImP
 XDMOmHFjC8EiOCryvhYszS/XszvwUbmRJv46ubgQkuRUl3a8Jz5ADA06skgSM1wuV3at
 qGsMpoihOBmHqH/JWrFa1brg+rl72BMt6C/eRin3ihJMj0yinPgP4ViA/Z3Ql/o9fT6b
 RR9isk4LaECE+LM8wY4CMa7ec6Hvl0ZawbS5RGMLddFfzBG+FoTh6JC+/5cvZqCQdgc1
 7KUaO4j9DbmrUbB5UuoVbSA+FlaYhGyqOKUlrTB4UAdhMnbg06Udf5YRBzVd6CaT7pfK
 MLDQ==
X-Gm-Message-State: AOJu0Yzb1RgM1e/Kzkr67XOzLcBlkYWTxcAis82taCWX/dQDbaWz79wa
 SEjf+BCHa+rvM13eh0quOPHs1Q076noGrt2Mud97//E6es6TXe5yPp+XA40yuYevXlftw4kN1vd
 R4T4qsnIyKo3ofhZ/479dYlNGS7DG46rVMgwlmr71rnn/egLf8hvDNHlzZ85B8AEWwW7ePQgVcQ
 ==
X-Received: by 2002:a05:6000:bc9:b0:368:4489:8efb with SMTP id
 ffacd0b85a97d-3719468ef61mr8138943f8f.40.1724060970793; 
 Mon, 19 Aug 2024 02:49:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAVrJwDZ52y0oGhu+rcnb9dp1j6/P+LysxpAS9zGRhehHor8t0ITOh1mcVotgZqAUasDlPFw==
X-Received: by 2002:a05:6000:bc9:b0:368:4489:8efb with SMTP id
 ffacd0b85a97d-3719468ef61mr8138921f8f.40.1724060970133; 
 Mon, 19 Aug 2024 02:49:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3718983a38csm10175787f8f.6.2024.08.19.02.49.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 02:49:29 -0700 (PDT)
Message-ID: <c312717c-b193-499a-8dc0-b67f46f01ba4@redhat.com>
Date: Mon, 19 Aug 2024 11:49:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/11] drm/ast: Add struct ast_connector
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20240815151953.184679-1-tzimmermann@suse.de>
 <20240815151953.184679-3-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240815151953.184679-3-tzimmermann@suse.de>
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

On 15/08/2024 17:18, Thomas Zimmermann wrote:
> Add struct ast_connector to track a connector's physical status. With
> the upcoming BMC support, the physical status can be different from the
> reported status.

Thanks for this, as we fake the connector to be always connected with 
BMC, it has to know internally if there is something plugged.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_dp.c     |  7 ++++++-
>   drivers/gpu/drm/ast/ast_dp501.c  | 11 +++++++++--
>   drivers/gpu/drm/ast/ast_drv.h    | 24 ++++++++++++++++++++----
>   drivers/gpu/drm/ast/ast_mode.c   |  8 ++++----
>   drivers/gpu/drm/ast/ast_sil164.c | 20 ++++++++++++++++++--
>   drivers/gpu/drm/ast/ast_vga.c    | 20 ++++++++++++++++++--
>   6 files changed, 75 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
> index 549c823c9529..c7f0f9b5dc3a 100644
> --- a/drivers/gpu/drm/ast/ast_dp.c
> +++ b/drivers/gpu/drm/ast/ast_dp.c
> @@ -364,6 +364,7 @@ static int ast_astdp_connector_helper_detect_ctx(struct drm_connector *connector
>   						 struct drm_modeset_acquire_ctx *ctx,
>   						 bool force)
>   {
> +	struct ast_connector *ast_connector = to_ast_connector(connector);
>   	struct drm_device *dev = connector->dev;
>   	struct ast_device *ast = to_ast_device(connector->dev);
>   	enum drm_connector_status status = connector_status_disconnected;
> @@ -392,6 +393,8 @@ static int ast_astdp_connector_helper_detect_ctx(struct drm_connector *connector
>   
>   	mutex_unlock(&ast->modeset_lock);
>   
> +	ast_connector->physical_status = status;
> +
>   	return status;
>   }
>   
> @@ -432,7 +435,8 @@ int ast_astdp_output_init(struct ast_device *ast)
>   	struct drm_device *dev = &ast->base;
>   	struct drm_crtc *crtc = &ast->crtc;
>   	struct drm_encoder *encoder = &ast->output.astdp.encoder;
> -	struct drm_connector *connector = &ast->output.astdp.connector;
> +	struct ast_connector *ast_connector = &ast->output.astdp.connector;
> +	struct drm_connector *connector = &ast_connector->base;
>   	int ret;
>   
>   	ret = drm_encoder_init(dev, encoder, &ast_astdp_encoder_funcs,
> @@ -446,6 +450,7 @@ int ast_astdp_output_init(struct ast_device *ast)
>   	ret = ast_astdp_connector_init(dev, connector);
>   	if (ret)
>   		return ret;
> +	ast_connector->physical_status = connector->status;
>   
>   	ret = drm_connector_attach_encoder(connector, encoder);
>   	if (ret)
> diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
> index 478efa226170..3904f98ef846 100644
> --- a/drivers/gpu/drm/ast/ast_dp501.c
> +++ b/drivers/gpu/drm/ast/ast_dp501.c
> @@ -540,11 +540,16 @@ static int ast_dp501_connector_helper_detect_ctx(struct drm_connector *connector
>   						 struct drm_modeset_acquire_ctx *ctx,
>   						 bool force)
>   {
> +	struct ast_connector *ast_connector = to_ast_connector(connector);
>   	struct ast_device *ast = to_ast_device(connector->dev);
> +	enum drm_connector_status status = connector_status_disconnected;
>   
>   	if (ast_dp501_is_connected(ast))
>   		return connector_status_connected;
> -	return connector_status_disconnected;
> +
> +	ast_connector->physical_status = status;
> +
> +	return status;
>   }
>   
>   static const struct drm_connector_helper_funcs ast_dp501_connector_helper_funcs = {
> @@ -584,7 +589,8 @@ int ast_dp501_output_init(struct ast_device *ast)
>   	struct drm_device *dev = &ast->base;
>   	struct drm_crtc *crtc = &ast->crtc;
>   	struct drm_encoder *encoder = &ast->output.dp501.encoder;
> -	struct drm_connector *connector = &ast->output.dp501.connector;
> +	struct ast_connector *ast_connector = &ast->output.dp501.connector;
> +	struct drm_connector *connector = &ast_connector->base;
>   	int ret;
>   
>   	ret = drm_encoder_init(dev, encoder, &ast_dp501_encoder_funcs,
> @@ -598,6 +604,7 @@ int ast_dp501_output_init(struct ast_device *ast)
>   	ret = ast_dp501_connector_init(dev, connector);
>   	if (ret)
>   		return ret;
> +	ast_connector->physical_status = connector->status;
>   
>   	ret = drm_connector_attach_encoder(connector, encoder);
>   	if (ret)
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 3a4f80cb5c0f..b29625d45a11 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -146,6 +146,22 @@ static inline struct ast_plane *to_ast_plane(struct drm_plane *plane)
>   	return container_of(plane, struct ast_plane, base);
>   }
>   
> +/*
> + * Connector
> + */
> +
> +struct ast_connector {
> +	struct drm_connector base;
> +
> +	enum drm_connector_status physical_status;
> +};
> +
> +static inline struct ast_connector *
> +to_ast_connector(struct drm_connector *connector)
> +{
> +	return container_of(connector, struct ast_connector, base);
> +}
> +
>   /*
>    * BMC
>    */
> @@ -192,19 +208,19 @@ struct ast_device {
>   	struct {
>   		struct {
>   			struct drm_encoder encoder;
> -			struct drm_connector connector;
> +			struct ast_connector connector;
>   		} vga;
>   		struct {
>   			struct drm_encoder encoder;
> -			struct drm_connector connector;
> +			struct ast_connector connector;
>   		} sil164;
>   		struct {
>   			struct drm_encoder encoder;
> -			struct drm_connector connector;
> +			struct ast_connector connector;
>   		} dp501;
>   		struct {
>   			struct drm_encoder encoder;
> -			struct drm_connector connector;
> +			struct ast_connector connector;
>   		} astdp;
>   		struct {
>   			struct drm_encoder encoder;
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index d823e9d85b04..8ce1637268e1 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1502,25 +1502,25 @@ int ast_mode_config_init(struct ast_device *ast)
>   		ret = ast_vga_output_init(ast);
>   		if (ret)
>   			return ret;
> -		physical_connector = &ast->output.vga.connector;
> +		physical_connector = &ast->output.vga.connector.base;
>   	}
>   	if (ast->tx_chip_types & AST_TX_SIL164_BIT) {
>   		ret = ast_sil164_output_init(ast);
>   		if (ret)
>   			return ret;
> -		physical_connector = &ast->output.sil164.connector;
> +		physical_connector = &ast->output.sil164.connector.base;
>   	}
>   	if (ast->tx_chip_types & AST_TX_DP501_BIT) {
>   		ret = ast_dp501_output_init(ast);
>   		if (ret)
>   			return ret;
> -		physical_connector = &ast->output.dp501.connector;
> +		physical_connector = &ast->output.dp501.connector.base;
>   	}
>   	if (ast->tx_chip_types & AST_TX_ASTDP_BIT) {
>   		ret = ast_astdp_output_init(ast);
>   		if (ret)
>   			return ret;
> -		physical_connector = &ast->output.astdp.connector;
> +		physical_connector = &ast->output.astdp.connector.base;
>   	}
>   	ret = ast_bmc_output_init(ast, physical_connector);
>   	if (ret)
> diff --git a/drivers/gpu/drm/ast/ast_sil164.c b/drivers/gpu/drm/ast/ast_sil164.c
> index 6e17d84f994e..05f991aa34ca 100644
> --- a/drivers/gpu/drm/ast/ast_sil164.c
> +++ b/drivers/gpu/drm/ast/ast_sil164.c
> @@ -21,9 +21,23 @@ static const struct drm_encoder_funcs ast_sil164_encoder_funcs = {
>    * Connector
>    */
>   
> +static int ast_sil164_connector_helper_detect_ctx(struct drm_connector *connector,
> +						  struct drm_modeset_acquire_ctx *ctx,
> +						  bool force)
> +{
> +	struct ast_connector *ast_connector = to_ast_connector(connector);
> +	enum drm_connector_status status;
> +
> +	status = drm_connector_helper_detect_from_ddc(connector, ctx, force);
> +
> +	ast_connector->physical_status = status;
> +
> +	return status;
> +}
> +
>   static const struct drm_connector_helper_funcs ast_sil164_connector_helper_funcs = {
>   	.get_modes = drm_connector_helper_get_modes,
> -	.detect_ctx = drm_connector_helper_detect_from_ddc,
> +	.detect_ctx = ast_sil164_connector_helper_detect_ctx,
>   };
>   
>   static const struct drm_connector_funcs ast_sil164_connector_funcs = {
> @@ -67,7 +81,8 @@ int ast_sil164_output_init(struct ast_device *ast)
>   	struct drm_device *dev = &ast->base;
>   	struct drm_crtc *crtc = &ast->crtc;
>   	struct drm_encoder *encoder = &ast->output.sil164.encoder;
> -	struct drm_connector *connector = &ast->output.sil164.connector;
> +	struct ast_connector *ast_connector = &ast->output.sil164.connector;
> +	struct drm_connector *connector = &ast_connector->base;
>   	int ret;
>   
>   	ret = drm_encoder_init(dev, encoder, &ast_sil164_encoder_funcs,
> @@ -79,6 +94,7 @@ int ast_sil164_output_init(struct ast_device *ast)
>   	ret = ast_sil164_connector_init(dev, connector);
>   	if (ret)
>   		return ret;
> +	ast_connector->physical_status = connector->status;
>   
>   	ret = drm_connector_attach_encoder(connector, encoder);
>   	if (ret)
> diff --git a/drivers/gpu/drm/ast/ast_vga.c b/drivers/gpu/drm/ast/ast_vga.c
> index 2ea0763844f3..fdbd0daca7dc 100644
> --- a/drivers/gpu/drm/ast/ast_vga.c
> +++ b/drivers/gpu/drm/ast/ast_vga.c
> @@ -21,9 +21,23 @@ static const struct drm_encoder_funcs ast_vga_encoder_funcs = {
>    * Connector
>    */
>   
> +static int ast_vga_connector_helper_detect_ctx(struct drm_connector *connector,
> +					       struct drm_modeset_acquire_ctx *ctx,
> +					       bool force)
> +{
> +	struct ast_connector *ast_connector = to_ast_connector(connector);
> +	enum drm_connector_status status;
> +
> +	status = drm_connector_helper_detect_from_ddc(connector, ctx, force);
> +
> +	ast_connector->physical_status = status;
> +
> +	return status;
> +}
> +
>   static const struct drm_connector_helper_funcs ast_vga_connector_helper_funcs = {
>   	.get_modes = drm_connector_helper_get_modes,
> -	.detect_ctx = drm_connector_helper_detect_from_ddc,
> +	.detect_ctx = ast_vga_connector_helper_detect_ctx,
>   };
>   
>   static const struct drm_connector_funcs ast_vga_connector_funcs = {
> @@ -67,7 +81,8 @@ int ast_vga_output_init(struct ast_device *ast)
>   	struct drm_device *dev = &ast->base;
>   	struct drm_crtc *crtc = &ast->crtc;
>   	struct drm_encoder *encoder = &ast->output.vga.encoder;
> -	struct drm_connector *connector = &ast->output.vga.connector;
> +	struct ast_connector *ast_connector = &ast->output.vga.connector;
> +	struct drm_connector *connector = &ast_connector->base;
>   	int ret;
>   
>   	ret = drm_encoder_init(dev, encoder, &ast_vga_encoder_funcs,
> @@ -79,6 +94,7 @@ int ast_vga_output_init(struct ast_device *ast)
>   	ret = ast_vga_connector_init(dev, connector);
>   	if (ret)
>   		return ret;
> +	ast_connector->physical_status = connector->status;
>   
>   	ret = drm_connector_attach_encoder(connector, encoder);
>   	if (ret)

