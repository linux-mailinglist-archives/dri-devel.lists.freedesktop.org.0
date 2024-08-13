Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFDB950654
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 15:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB0610E348;
	Tue, 13 Aug 2024 13:20:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="V370Nzw3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DBDB10E348
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 13:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723555243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RKab0clWEDb7ZgEJBB08kMd/YP+xvWNLIPosazrE6Vs=;
 b=V370Nzw3+qXKCFecE2r23vE9xH/UeA/iHMEl0pvWX+qvQBpieeLsTZYNu5OsY/g1/jLrzD
 e++qND5XcFapQ1qXOUcWrwXfYc4d2ql22JjP9Kz+8bSEyAHdC7ql/nNarXCTxVRKHXfPX+
 Vxp1ZKLx7pF/UbxmNPNjEgj8/Obm2O4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-ZrDmyVMDMpqiy2YDwDM16A-1; Tue, 13 Aug 2024 09:20:42 -0400
X-MC-Unique: ZrDmyVMDMpqiy2YDwDM16A-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-428ea5b1479so39544815e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 06:20:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723555241; x=1724160041;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RKab0clWEDb7ZgEJBB08kMd/YP+xvWNLIPosazrE6Vs=;
 b=GJ6sb8wRhLBcSJZjnxBsSw6gJeEvlpxI3osMNFLHCKnOoZM3C27RtPifID6jrpBc60
 k+i9JIZKmo/s6rVgZ2eUDC989VB2G1Y4Cp3BaOUZC6l/aGmMCLov94JlsqzrorTpzIqk
 WyhGionaMDyjHZDv6t4vbKFeLkWvXtNth+HPh2Km5IY2sXZW3MytfTZl3eLb2/ia90mD
 E7//q+pD6dx6ZBwtrfSg9Ha17i1hFLrkW+O8EKqevfvClYmwLZyDnb9i02Gw+xQrpNO2
 AmdXBpZEV1NzpR10GathXqMvvaH3RbNg8UQEGEHvhhh3EJTc3uU8aKPQnw0dqyFnZrnD
 BwuA==
X-Gm-Message-State: AOJu0YwiUWKW/zuuiziPalTHul+tT1FTCORbwdLkYzHWGExh3oAkA01u
 HgqrJPPaHrJZ2XMhsMVAM4xzUyp2KeIFSfX+s74NWFaD1ZXA7+artBCMsoQzTaXa/bfxSkF9aZP
 PbeFVO3vSvW5xxPn+v0EI86Gu0NcqQ+1L3444U7QFj6FHmvL4QhJ2pzxQiJT35Ui1bA==
X-Received: by 2002:a05:600c:35cc:b0:426:627d:5542 with SMTP id
 5b1f17b1804b1-429d486efbamr27535335e9.28.1723555241018; 
 Tue, 13 Aug 2024 06:20:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnkZMXZvz/cyMFy9mmZSCkC0pC5ykzEfUY1wXvNNXWlVR8iuwpO2tIA3fP5TdUozf8+NEMtw==
X-Received: by 2002:a05:600c:35cc:b0:426:627d:5542 with SMTP id
 5b1f17b1804b1-429d486efbamr27535055e9.28.1723555240602; 
 Tue, 13 Aug 2024 06:20:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36e4cfefe71sm10370311f8f.62.2024.08.13.06.20.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 06:20:40 -0700 (PDT)
Message-ID: <d5adc9b9-2536-439f-b7a2-58677135872b@redhat.com>
Date: Tue, 13 Aug 2024 15:20:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] drm/ast: Remove BMC output
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20240812093211.382263-1-tzimmermann@suse.de>
 <20240812093211.382263-10-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240812093211.382263-10-tzimmermann@suse.de>
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



On 12/08/2024 11:30, Thomas Zimmermann wrote:
> Ast's BMC connector tracks the status of an underlying physical
> connector and updates the BMC status accordingly. This functionality
> works around GNOME's settings app, which cannot handle multiple
> outputs on the same CRTC.
> 
> The workaround is now obsolete as all code for physical outputs
> handle BMC support internally. Hence, remove the driver's code and
> the BMC output entirely.
> 
Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_drv.h  |   4 --
>   drivers/gpu/drm/ast/ast_mode.c | 107 ---------------------------------
>   2 files changed, 111 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 3a4f80cb5c0f..a4cde495fde4 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -206,10 +206,6 @@ struct ast_device {
>   			struct drm_encoder encoder;
>   			struct drm_connector connector;
>   		} astdp;
> -		struct {
> -			struct drm_encoder encoder;
> -			struct ast_bmc_connector bmc_connector;
> -		} bmc;
>   	} output;
>   
>   	bool support_wide_screen;
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index d823e9d85b04..ed496fb32bf3 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -34,10 +34,8 @@
>   
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_atomic_helper.h>
> -#include <drm/drm_atomic_state_helper.h>
>   #include <drm/drm_crtc.h>
>   #include <drm/drm_damage_helper.h>
> -#include <drm/drm_edid.h>
>   #include <drm/drm_format_helper.h>
>   #include <drm/drm_fourcc.h>
>   #include <drm/drm_gem_atomic_helper.h>
> @@ -1309,103 +1307,6 @@ static int ast_crtc_init(struct drm_device *dev)
>   	return 0;
>   }
>   
> -/*
> - * BMC virtual Connector
> - */
> -
> -static const struct drm_encoder_funcs ast_bmc_encoder_funcs = {
> -	.destroy = drm_encoder_cleanup,
> -};
> -
> -static int ast_bmc_connector_helper_detect_ctx(struct drm_connector *connector,
> -					       struct drm_modeset_acquire_ctx *ctx,
> -					       bool force)
> -{
> -	struct ast_bmc_connector *bmc_connector = to_ast_bmc_connector(connector);
> -	struct drm_connector *physical_connector = bmc_connector->physical_connector;
> -
> -	/*
> -	 * Most user-space compositors cannot handle more than one connected
> -	 * connector per CRTC. Hence, we only mark the BMC as connected if the
> -	 * physical connector is disconnected. If the physical connector's status
> -	 * is connected or unknown, the BMC remains disconnected. This has no
> -	 * effect on the output of the BMC.
> -	 *
> -	 * FIXME: Remove this logic once user-space compositors can handle more
> -	 *        than one connector per CRTC. The BMC should always be connected.
> -	 */
> -
> -	if (physical_connector && physical_connector->status == connector_status_disconnected)
> -		return connector_status_connected;
> -
> -	return connector_status_disconnected;
> -}
> -
> -static int ast_bmc_connector_helper_get_modes(struct drm_connector *connector)
> -{
> -	return drm_add_modes_noedid(connector, 4096, 4096);
> -}
> -
> -static const struct drm_connector_helper_funcs ast_bmc_connector_helper_funcs = {
> -	.get_modes = ast_bmc_connector_helper_get_modes,
> -	.detect_ctx = ast_bmc_connector_helper_detect_ctx,
> -};
> -
> -static const struct drm_connector_funcs ast_bmc_connector_funcs = {
> -	.reset = drm_atomic_helper_connector_reset,
> -	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.destroy = drm_connector_cleanup,
> -	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> -	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> -};
> -
> -static int ast_bmc_connector_init(struct drm_device *dev,
> -				  struct ast_bmc_connector *bmc_connector,
> -				  struct drm_connector *physical_connector)
> -{
> -	struct drm_connector *connector = &bmc_connector->base;
> -	int ret;
> -
> -	ret = drm_connector_init(dev, connector, &ast_bmc_connector_funcs,
> -				 DRM_MODE_CONNECTOR_VIRTUAL);
> -	if (ret)
> -		return ret;
> -
> -	drm_connector_helper_add(connector, &ast_bmc_connector_helper_funcs);
> -
> -	bmc_connector->physical_connector = physical_connector;
> -
> -	return 0;
> -}
> -
> -static int ast_bmc_output_init(struct ast_device *ast,
> -			       struct drm_connector *physical_connector)
> -{
> -	struct drm_device *dev = &ast->base;
> -	struct drm_crtc *crtc = &ast->crtc;
> -	struct drm_encoder *encoder = &ast->output.bmc.encoder;
> -	struct ast_bmc_connector *bmc_connector = &ast->output.bmc.bmc_connector;
> -	struct drm_connector *connector = &bmc_connector->base;
> -	int ret;
> -
> -	ret = drm_encoder_init(dev, encoder,
> -			       &ast_bmc_encoder_funcs,
> -			       DRM_MODE_ENCODER_VIRTUAL, "ast_bmc");
> -	if (ret)
> -		return ret;
> -	encoder->possible_crtcs = drm_crtc_mask(crtc);
> -
> -	ret = ast_bmc_connector_init(dev, bmc_connector, physical_connector);
> -	if (ret)
> -		return ret;
> -
> -	ret = drm_connector_attach_encoder(connector, encoder);
> -	if (ret)
> -		return ret;
> -
> -	return 0;
> -}
> -
>   /*
>    * Mode config
>    */
> @@ -1457,7 +1358,6 @@ static const struct drm_mode_config_funcs ast_mode_config_funcs = {
>   int ast_mode_config_init(struct ast_device *ast)
>   {
>   	struct drm_device *dev = &ast->base;
> -	struct drm_connector *physical_connector = NULL;
>   	int ret;
>   
>   	ret = drmm_mutex_init(dev, &ast->modeset_lock);
> @@ -1502,29 +1402,22 @@ int ast_mode_config_init(struct ast_device *ast)
>   		ret = ast_vga_output_init(ast);
>   		if (ret)
>   			return ret;
> -		physical_connector = &ast->output.vga.connector;
>   	}
>   	if (ast->tx_chip_types & AST_TX_SIL164_BIT) {
>   		ret = ast_sil164_output_init(ast);
>   		if (ret)
>   			return ret;
> -		physical_connector = &ast->output.sil164.connector;
>   	}
>   	if (ast->tx_chip_types & AST_TX_DP501_BIT) {
>   		ret = ast_dp501_output_init(ast);
>   		if (ret)
>   			return ret;
> -		physical_connector = &ast->output.dp501.connector;
>   	}
>   	if (ast->tx_chip_types & AST_TX_ASTDP_BIT) {
>   		ret = ast_astdp_output_init(ast);
>   		if (ret)
>   			return ret;
> -		physical_connector = &ast->output.astdp.connector;
>   	}
> -	ret = ast_bmc_output_init(ast, physical_connector);
> -	if (ret)
> -		return ret;
>   
>   	drm_mode_config_reset(dev);
>   

