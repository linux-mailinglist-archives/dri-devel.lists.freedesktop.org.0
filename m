Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F375B94CF77
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 13:45:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E4310E8D0;
	Fri,  9 Aug 2024 11:45:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gmjfDTrR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67C110E8D0
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 11:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723203898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rXMKOAsl2AmOsFRrMGi8BwUsNfcexmQHDBef+M2CoNU=;
 b=gmjfDTrRWO5NwHmFRXtELo0VIQeE6cxt2vI8cu8+0r7Wip4AzorFJJb70RWA9bjk2+rgAE
 Da78FeTU/5a23PtBy4BrBG0/MozUJ6v0sv9sbvKSg3N+iXOrjFWptYMai6hZNPMH+iE7WY
 oBQBxnHzDmko7AbIam8qU7vCr3UH6ko=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-DHlw9WBBOFS1Q5R_nJ4L4w-1; Fri, 09 Aug 2024 07:44:56 -0400
X-MC-Unique: DHlw9WBBOFS1Q5R_nJ4L4w-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-42816096cb8so23262835e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Aug 2024 04:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723203895; x=1723808695;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rXMKOAsl2AmOsFRrMGi8BwUsNfcexmQHDBef+M2CoNU=;
 b=Xv1zZin245xQ9iAgZe7wwnXQ5dAjQBQ/b/ApzvR0wxpFh9X6lpMbjthCz8ODoble51
 K2Ny2RVAX+Llo7aWf8EZzIJZxL2ofH7PiE4wmDXmLkaoXsCA6FtzaAL88rJ7lhqlNDCN
 9ZRqqyaolwQl+Dh7dR8TnRJ+gXepsDn20UW6MJAihVZet4SsgW/VJ/zxc7uX7B0elqpQ
 5WLzsSJQ3MgvS/N1StqN3er9oL28NAlbe1yiZYQQu3PExpzFXRKujkOpZnTrfmrHtHPC
 G3E27/cJdUGjCvAmnLH+A7BO9ALMmE7ZzzqjMo0jExIhNpdK+67kZJKjZAdmifXrxLNG
 xScQ==
X-Gm-Message-State: AOJu0YzOP60zvIwr+LqsGkLgl17MGWFR5rRgkF7zxH0l31mB1viSEhao
 7rDShnR3F6lCZu3mcEcd1LvhqNPOqZu+tnjr2WjxqqSAAokJJwwl8KqBj/If1g/nz/eCdtZUFMO
 K0q8QKaoTMq78f2UcI/rBOqi/bHe1RGqLxQrqjYGuhAedEoVSxcUZSYGZGXGVyEAxcQ==
X-Received: by 2002:a5d:6ac8:0:b0:364:ee85:e6e4 with SMTP id
 ffacd0b85a97d-36d60159d62mr1424290f8f.53.1723203895359; 
 Fri, 09 Aug 2024 04:44:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpqVJTkSgejObot66C3gNbaSRHieEGmIFHg1EhJZIqJKNp5A/S8KTN9+6KfyTGIBhs9oFgoA==
X-Received: by 2002:a5d:6ac8:0:b0:364:ee85:e6e4 with SMTP id
 ffacd0b85a97d-36d60159d62mr1424259f8f.53.1723203894740; 
 Fri, 09 Aug 2024 04:44:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36d27157347sm5081026f8f.2.2024.08.09.04.44.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Aug 2024 04:44:54 -0700 (PDT)
Message-ID: <4b54f89d-a399-4173-9e3e-6e7df66a8f0d@redhat.com>
Date: Fri, 9 Aug 2024 13:44:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] drm/ast: Move code for physical outputs into separate
 files
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20240806125601.78650-1-tzimmermann@suse.de>
 <20240806125601.78650-2-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240806125601.78650-2-tzimmermann@suse.de>
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

On 06/08/2024 14:51, Thomas Zimmermann wrote:
> Move the modesetting code for the various transmitter chips into
> their own source files before adding BMC support. No functional
> changes.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/Makefile     |   4 +-
>   drivers/gpu/drm/ast/ast_dp.c     | 214 +++++++++++++-
>   drivers/gpu/drm/ast/ast_dp501.c  | 141 ++++++++-
>   drivers/gpu/drm/ast/ast_drv.h    |  17 +-
>   drivers/gpu/drm/ast/ast_mode.c   | 471 -------------------------------
>   drivers/gpu/drm/ast/ast_sil164.c |  88 ++++++
>   drivers/gpu/drm/ast/ast_vga.c    |  88 ++++++
>   7 files changed, 530 insertions(+), 493 deletions(-)
>   create mode 100644 drivers/gpu/drm/ast/ast_sil164.c
>   create mode 100644 drivers/gpu/drm/ast/ast_vga.c
> 
> diff --git a/drivers/gpu/drm/ast/Makefile b/drivers/gpu/drm/ast/Makefile
> index d794c076bc24..47da848fa3fc 100644
> --- a/drivers/gpu/drm/ast/Makefile
> +++ b/drivers/gpu/drm/ast/Makefile
> @@ -11,6 +11,8 @@ ast-y := \
>   	ast_main.o \
>   	ast_mm.o \
>   	ast_mode.o \
> -	ast_post.o
> +	ast_post.o \
> +	ast_sil164.o \
> +	ast_vga.o
>   
>   obj-$(CONFIG_DRM_AST) := ast.o
> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
> index 5d07678b502c..ef2dd9d82de9 100644
> --- a/drivers/gpu/drm/ast/ast_dp.c
> +++ b/drivers/gpu/drm/ast/ast_dp.c
> @@ -4,17 +4,23 @@
>   
>   #include <linux/firmware.h>
>   #include <linux/delay.h>
> +
> +#include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_modeset_helper_vtables.h>
>   #include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
> +
>   #include "ast_drv.h"
>   
> -bool ast_astdp_is_connected(struct ast_device *ast)
> +static bool ast_astdp_is_connected(struct ast_device *ast)
>   {
>   	if (!ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF, AST_IO_VGACRDF_HPD))
>   		return false;
>   	return true;
>   }
>   
> -int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
> +static int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
>   {
>   	struct ast_device *ast = to_ast_device(dev);
>   	int ret = 0;
> @@ -120,7 +126,7 @@ int ast_dp_launch(struct ast_device *ast)
>   	return 0;
>   }
>   
> -bool ast_dp_power_is_on(struct ast_device *ast)
> +static bool ast_dp_power_is_on(struct ast_device *ast)
>   {
>   	u8 vgacre3;
>   
> @@ -129,7 +135,7 @@ bool ast_dp_power_is_on(struct ast_device *ast)
>   	return !(vgacre3 & AST_DP_PHY_SLEEP);
>   }
>   
> -void ast_dp_power_on_off(struct drm_device *dev, bool on)
> +static void ast_dp_power_on_off(struct drm_device *dev, bool on)
>   {
>   	struct ast_device *ast = to_ast_device(dev);
>   	// Read and Turn off DP PHY sleep
> @@ -143,7 +149,7 @@ void ast_dp_power_on_off(struct drm_device *dev, bool on)
>   	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE3, (u8) ~AST_DP_PHY_SLEEP, bE3);
>   }
>   
> -void ast_dp_link_training(struct ast_device *ast)
> +static void ast_dp_link_training(struct ast_device *ast)
>   {
>   	struct drm_device *dev = &ast->base;
>   	unsigned int i = 10;
> @@ -160,7 +166,7 @@ void ast_dp_link_training(struct ast_device *ast)
>   		drm_err(dev, "Link training failed\n");
>   }
>   
> -void ast_dp_set_on_off(struct drm_device *dev, bool on)
> +static void ast_dp_set_on_off(struct drm_device *dev, bool on)
>   {
>   	struct ast_device *ast = to_ast_device(dev);
>   	u8 video_on_off = on;
> @@ -179,7 +185,7 @@ void ast_dp_set_on_off(struct drm_device *dev, bool on)
>   	}
>   }
>   
> -void ast_dp_set_mode(struct drm_crtc *crtc, struct ast_vbios_mode_info *vbios_mode)
> +static void ast_dp_set_mode(struct drm_crtc *crtc, struct ast_vbios_mode_info *vbios_mode)
>   {
>   	struct ast_device *ast = to_ast_device(crtc->dev);
>   
> @@ -252,3 +258,197 @@ void ast_dp_set_mode(struct drm_crtc *crtc, struct ast_vbios_mode_info *vbios_mo
>   	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE1, ASTDP_AND_CLEAR_MASK, ASTDP_MISC1);
>   	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE2, ASTDP_AND_CLEAR_MASK, ModeIdx);
>   }
> +
> +static void ast_wait_for_vretrace(struct ast_device *ast)
> +{
> +	unsigned long timeout = jiffies + HZ;
> +	u8 vgair1;
> +
> +	do {
> +		vgair1 = ast_io_read8(ast, AST_IO_VGAIR1_R);
> +	} while (!(vgair1 & AST_IO_VGAIR1_VREFRESH) && time_before(jiffies, timeout));
> +}
> +
> +/*
> + * Encoder
> + */
> +
> +static const struct drm_encoder_funcs ast_astdp_encoder_funcs = {
> +	.destroy = drm_encoder_cleanup,
> +};
> +
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
> +static void ast_astdp_encoder_helper_atomic_enable(struct drm_encoder *encoder,
> +						   struct drm_atomic_state *state)
> +{
> +	struct drm_device *dev = encoder->dev;
> +	struct ast_device *ast = to_ast_device(dev);
> +
> +	ast_dp_power_on_off(dev, AST_DP_POWER_ON);
> +	ast_dp_link_training(ast);
> +
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
> +	.atomic_mode_set = ast_astdp_encoder_helper_atomic_mode_set,
> +	.atomic_enable = ast_astdp_encoder_helper_atomic_enable,
> +	.atomic_disable = ast_astdp_encoder_helper_atomic_disable,
> +};
> +
> +/*
> + * Connector
> + */
> +
> +static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
> +{
> +	void *edid;
> +	struct drm_device *dev = connector->dev;
> +	struct ast_device *ast = to_ast_device(dev);
> +
> +	int succ;
> +	int count;
> +
> +	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
> +	if (!edid)
> +		goto err_drm_connector_update_edid_property;
> +
> +	/*
> +	 * Protect access to I/O registers from concurrent modesetting
> +	 * by acquiring the I/O-register lock.
> +	 */
> +	mutex_lock(&ast->modeset_lock);
> +
> +	succ = ast_astdp_read_edid(connector->dev, edid);
> +	if (succ < 0)
> +		goto err_mutex_unlock;
> +
> +	mutex_unlock(&ast->modeset_lock);
> +
> +	drm_connector_update_edid_property(connector, edid);
> +	count = drm_add_edid_modes(connector, edid);
> +	kfree(edid);
> +
> +	return count;
> +
> +err_mutex_unlock:
> +	mutex_unlock(&ast->modeset_lock);
> +	kfree(edid);
> +err_drm_connector_update_edid_property:
> +	drm_connector_update_edid_property(connector, NULL);
> +	return 0;
> +}
> +
> +static int ast_astdp_connector_helper_detect_ctx(struct drm_connector *connector,
> +						 struct drm_modeset_acquire_ctx *ctx,
> +						 bool force)
> +{
> +	struct drm_device *dev = connector->dev;
> +	struct ast_device *ast = to_ast_device(connector->dev);
> +	enum drm_connector_status status = connector_status_disconnected;
> +	struct drm_connector_state *connector_state = connector->state;
> +	bool is_active = false;
> +
> +	mutex_lock(&ast->modeset_lock);
> +
> +	if (connector_state && connector_state->crtc) {
> +		struct drm_crtc_state *crtc_state = connector_state->crtc->state;
> +
> +		if (crtc_state && crtc_state->active)
> +			is_active = true;
> +	}
> +
> +	if (!is_active && !ast_dp_power_is_on(ast)) {
> +		ast_dp_power_on_off(dev, true);
> +		msleep(50);
> +	}
> +
> +	if (ast_astdp_is_connected(ast))
> +		status = connector_status_connected;
> +
> +	if (!is_active && status == connector_status_disconnected)
> +		ast_dp_power_on_off(dev, false);
> +
> +	mutex_unlock(&ast->modeset_lock);
> +
> +	return status;
> +}
> +
> +static const struct drm_connector_helper_funcs ast_astdp_connector_helper_funcs = {
> +	.get_modes = ast_astdp_connector_helper_get_modes,
> +	.detect_ctx = ast_astdp_connector_helper_detect_ctx,
> +};
> +
> +static const struct drm_connector_funcs ast_astdp_connector_funcs = {
> +	.reset = drm_atomic_helper_connector_reset,
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = drm_connector_cleanup,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static int ast_astdp_connector_init(struct drm_device *dev, struct drm_connector *connector)
> +{
> +	int ret;
> +
> +	ret = drm_connector_init(dev, connector, &ast_astdp_connector_funcs,
> +				 DRM_MODE_CONNECTOR_DisplayPort);
> +	if (ret)
> +		return ret;
> +
> +	drm_connector_helper_add(connector, &ast_astdp_connector_helper_funcs);
> +
> +	connector->interlace_allowed = 0;
> +	connector->doublescan_allowed = 0;
> +
> +	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
> +
> +	return 0;
> +}
> +
> +int ast_astdp_output_init(struct ast_device *ast)
> +{
> +	struct drm_device *dev = &ast->base;
> +	struct drm_crtc *crtc = &ast->crtc;
> +	struct drm_encoder *encoder = &ast->output.astdp.encoder;
> +	struct drm_connector *connector = &ast->output.astdp.connector;
> +	int ret;
> +
> +	ret = drm_encoder_init(dev, encoder, &ast_astdp_encoder_funcs,
> +			       DRM_MODE_ENCODER_TMDS, NULL);
> +	if (ret)
> +		return ret;
> +	drm_encoder_helper_add(encoder, &ast_astdp_encoder_helper_funcs);
> +
> +	encoder->possible_crtcs = drm_crtc_mask(crtc);
> +
> +	ret = ast_astdp_connector_init(dev, connector);
> +	if (ret)
> +		return ret;
> +
> +	ret = drm_connector_attach_encoder(connector, encoder);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
> index 9a4c3a0963f9..478efa226170 100644
> --- a/drivers/gpu/drm/ast/ast_dp501.c
> +++ b/drivers/gpu/drm/ast/ast_dp501.c
> @@ -4,6 +4,11 @@
>   #include <linux/firmware.h>
>   #include <linux/module.h>
>   
> +#include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_modeset_helper_vtables.h>
> +#include <drm/drm_probe_helper.h>
> +
>   #include "ast_drv.h"
>   
>   MODULE_FIRMWARE("ast_dp501_fw.bin");
> @@ -170,7 +175,7 @@ static void clear_cmd(struct ast_device *ast)
>   }
>   #endif
>   
> -void ast_set_dp501_video_output(struct drm_device *dev, u8 mode)
> +static void ast_set_dp501_video_output(struct drm_device *dev, u8 mode)
>   {
>   	ast_write_cmd(dev, 0x40);
>   	ast_write_data(dev, mode);
> @@ -272,7 +277,7 @@ static bool ast_launch_m68k(struct drm_device *dev)
>   	return true;
>   }
>   
> -bool ast_dp501_is_connected(struct ast_device *ast)
> +static bool ast_dp501_is_connected(struct ast_device *ast)
>   {
>   	u32 boot_address, offset, data;
>   
> @@ -313,7 +318,7 @@ bool ast_dp501_is_connected(struct ast_device *ast)
>   	return true;
>   }
>   
> -bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata)
> +static bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata)
>   {
>   	struct ast_device *ast = to_ast_device(dev);
>   	u32 i, boot_address, offset, data;
> @@ -470,3 +475,133 @@ void ast_init_3rdtx(struct drm_device *dev)
>   		}
>   	}
>   }
> +
> +/*
> + * Encoder
> + */
> +
> +static const struct drm_encoder_funcs ast_dp501_encoder_funcs = {
> +	.destroy = drm_encoder_cleanup,
> +};
> +
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
> +/*
> + * Connector
> + */
> +
> +static int ast_dp501_connector_helper_get_modes(struct drm_connector *connector)
> +{
> +	void *edid;
> +	bool succ;
> +	int count;
> +
> +	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
> +	if (!edid)
> +		goto err_drm_connector_update_edid_property;
> +
> +	succ = ast_dp501_read_edid(connector->dev, edid);
> +	if (!succ)
> +		goto err_kfree;
> +
> +	drm_connector_update_edid_property(connector, edid);
> +	count = drm_add_edid_modes(connector, edid);
> +	kfree(edid);
> +
> +	return count;
> +
> +err_kfree:
> +	kfree(edid);
> +err_drm_connector_update_edid_property:
> +	drm_connector_update_edid_property(connector, NULL);
> +	return 0;
> +}
> +
> +static int ast_dp501_connector_helper_detect_ctx(struct drm_connector *connector,
> +						 struct drm_modeset_acquire_ctx *ctx,
> +						 bool force)
> +{
> +	struct ast_device *ast = to_ast_device(connector->dev);
> +
> +	if (ast_dp501_is_connected(ast))
> +		return connector_status_connected;
> +	return connector_status_disconnected;
> +}
> +
> +static const struct drm_connector_helper_funcs ast_dp501_connector_helper_funcs = {
> +	.get_modes = ast_dp501_connector_helper_get_modes,
> +	.detect_ctx = ast_dp501_connector_helper_detect_ctx,
> +};
> +
> +static const struct drm_connector_funcs ast_dp501_connector_funcs = {
> +	.reset = drm_atomic_helper_connector_reset,
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = drm_connector_cleanup,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static int ast_dp501_connector_init(struct drm_device *dev, struct drm_connector *connector)
> +{
> +	int ret;
> +
> +	ret = drm_connector_init(dev, connector, &ast_dp501_connector_funcs,
> +				 DRM_MODE_CONNECTOR_DisplayPort);
> +	if (ret)
> +		return ret;
> +
> +	drm_connector_helper_add(connector, &ast_dp501_connector_helper_funcs);
> +
> +	connector->interlace_allowed = 0;
> +	connector->doublescan_allowed = 0;
> +
> +	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
> +
> +	return 0;
> +}
> +
> +int ast_dp501_output_init(struct ast_device *ast)
> +{
> +	struct drm_device *dev = &ast->base;
> +	struct drm_crtc *crtc = &ast->crtc;
> +	struct drm_encoder *encoder = &ast->output.dp501.encoder;
> +	struct drm_connector *connector = &ast->output.dp501.connector;
> +	int ret;
> +
> +	ret = drm_encoder_init(dev, encoder, &ast_dp501_encoder_funcs,
> +			       DRM_MODE_ENCODER_TMDS, NULL);
> +	if (ret)
> +		return ret;
> +	drm_encoder_helper_add(encoder, &ast_dp501_encoder_helper_funcs);
> +
> +	encoder->possible_crtcs = drm_crtc_mask(crtc);
> +
> +	ret = ast_dp501_connector_init(dev, connector);
> +	if (ret)
> +		return ret;
> +
> +	ret = drm_connector_attach_encoder(connector, encoder);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index d23b98ce4359..3a4f80cb5c0f 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -460,22 +460,17 @@ void ast_post_gpu(struct drm_device *dev);
>   u32 ast_mindwm(struct ast_device *ast, u32 r);
>   void ast_moutdwm(struct ast_device *ast, u32 r, u32 v);
>   void ast_patch_ahb_2500(void __iomem *regs);
> +
> +int ast_vga_output_init(struct ast_device *ast);
> +int ast_sil164_output_init(struct ast_device *ast);
> +
>   /* ast dp501 */
> -void ast_set_dp501_video_output(struct drm_device *dev, u8 mode);
>   bool ast_backup_fw(struct drm_device *dev, u8 *addr, u32 size);
> -bool ast_dp501_is_connected(struct ast_device *ast);
> -bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata);
> -u8 ast_get_dp501_max_clk(struct drm_device *dev);
>   void ast_init_3rdtx(struct drm_device *dev);
> +int ast_dp501_output_init(struct ast_device *ast);
>   
>   /* aspeed DP */
> -bool ast_astdp_is_connected(struct ast_device *ast);
> -int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata);
>   int ast_dp_launch(struct ast_device *ast);
> -bool ast_dp_power_is_on(struct ast_device *ast);
> -void ast_dp_power_on_off(struct drm_device *dev, bool no);
> -void ast_dp_link_training(struct ast_device *ast);
> -void ast_dp_set_on_off(struct drm_device *dev, bool no);
> -void ast_dp_set_mode(struct drm_crtc *crtc, struct ast_vbios_mode_info *vbios_mode);
> +int ast_astdp_output_init(struct ast_device *ast);
>   
>   #endif
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index ddb7696acc04..d823e9d85b04 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -47,7 +47,6 @@
>   #include <drm/drm_panic.h>
>   #include <drm/drm_probe_helper.h>
>   
> -#include "ast_ddc.h"
>   #include "ast_drv.h"
>   #include "ast_tables.h"
>   
> @@ -1310,476 +1309,6 @@ static int ast_crtc_init(struct drm_device *dev)
>   	return 0;
>   }
>   
> -/*
> - * VGA Encoder
> - */
> -
> -static const struct drm_encoder_funcs ast_vga_encoder_funcs = {
> -	.destroy = drm_encoder_cleanup,
> -};
> -
> -/*
> - * VGA Connector
> - */
> -
> -static const struct drm_connector_helper_funcs ast_vga_connector_helper_funcs = {
> -	.get_modes = drm_connector_helper_get_modes,
> -	.detect_ctx = drm_connector_helper_detect_from_ddc,
> -};
> -
> -static const struct drm_connector_funcs ast_vga_connector_funcs = {
> -	.reset = drm_atomic_helper_connector_reset,
> -	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.destroy = drm_connector_cleanup,
> -	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> -	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> -};
> -
> -static int ast_vga_connector_init(struct drm_device *dev, struct drm_connector *connector)
> -{
> -	struct ast_device *ast = to_ast_device(dev);
> -	struct i2c_adapter *ddc;
> -	int ret;
> -
> -	ddc = ast_ddc_create(ast);
> -	if (IS_ERR(ddc)) {
> -		ret = PTR_ERR(ddc);
> -		drm_err(dev, "failed to add DDC bus for connector; ret=%d\n", ret);
> -		return ret;
> -	}
> -
> -	ret = drm_connector_init_with_ddc(dev, connector, &ast_vga_connector_funcs,
> -					  DRM_MODE_CONNECTOR_VGA, ddc);
> -	if (ret)
> -		return ret;
> -
> -	drm_connector_helper_add(connector, &ast_vga_connector_helper_funcs);
> -
> -	connector->interlace_allowed = 0;
> -	connector->doublescan_allowed = 0;
> -
> -	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
> -
> -	return 0;
> -}
> -
> -static int ast_vga_output_init(struct ast_device *ast)
> -{
> -	struct drm_device *dev = &ast->base;
> -	struct drm_crtc *crtc = &ast->crtc;
> -	struct drm_encoder *encoder = &ast->output.vga.encoder;
> -	struct drm_connector *connector = &ast->output.vga.connector;
> -	int ret;
> -
> -	ret = drm_encoder_init(dev, encoder, &ast_vga_encoder_funcs,
> -			       DRM_MODE_ENCODER_DAC, NULL);
> -	if (ret)
> -		return ret;
> -	encoder->possible_crtcs = drm_crtc_mask(crtc);
> -
> -	ret = ast_vga_connector_init(dev, connector);
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
> -/*
> - * SIL164 Encoder
> - */
> -
> -static const struct drm_encoder_funcs ast_sil164_encoder_funcs = {
> -	.destroy = drm_encoder_cleanup,
> -};
> -
> -/*
> - * SIL164 Connector
> - */
> -
> -static const struct drm_connector_helper_funcs ast_sil164_connector_helper_funcs = {
> -	.get_modes = drm_connector_helper_get_modes,
> -	.detect_ctx = drm_connector_helper_detect_from_ddc,
> -};
> -
> -static const struct drm_connector_funcs ast_sil164_connector_funcs = {
> -	.reset = drm_atomic_helper_connector_reset,
> -	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.destroy = drm_connector_cleanup,
> -	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> -	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> -};
> -
> -static int ast_sil164_connector_init(struct drm_device *dev, struct drm_connector *connector)
> -{
> -	struct ast_device *ast = to_ast_device(dev);
> -	struct i2c_adapter *ddc;
> -	int ret;
> -
> -	ddc = ast_ddc_create(ast);
> -	if (IS_ERR(ddc)) {
> -		ret = PTR_ERR(ddc);
> -		drm_err(dev, "failed to add DDC bus for connector; ret=%d\n", ret);
> -		return ret;
> -	}
> -
> -	ret = drm_connector_init_with_ddc(dev, connector, &ast_sil164_connector_funcs,
> -					  DRM_MODE_CONNECTOR_DVII, ddc);
> -	if (ret)
> -		return ret;
> -
> -	drm_connector_helper_add(connector, &ast_sil164_connector_helper_funcs);
> -
> -	connector->interlace_allowed = 0;
> -	connector->doublescan_allowed = 0;
> -
> -	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
> -
> -	return 0;
> -}
> -
> -static int ast_sil164_output_init(struct ast_device *ast)
> -{
> -	struct drm_device *dev = &ast->base;
> -	struct drm_crtc *crtc = &ast->crtc;
> -	struct drm_encoder *encoder = &ast->output.sil164.encoder;
> -	struct drm_connector *connector = &ast->output.sil164.connector;
> -	int ret;
> -
> -	ret = drm_encoder_init(dev, encoder, &ast_sil164_encoder_funcs,
> -			       DRM_MODE_ENCODER_TMDS, NULL);
> -	if (ret)
> -		return ret;
> -	encoder->possible_crtcs = drm_crtc_mask(crtc);
> -
> -	ret = ast_sil164_connector_init(dev, connector);
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
> -/*
> - * DP501 Encoder
> - */
> -
> -static const struct drm_encoder_funcs ast_dp501_encoder_funcs = {
> -	.destroy = drm_encoder_cleanup,
> -};
> -
> -static void ast_dp501_encoder_helper_atomic_enable(struct drm_encoder *encoder,
> -						   struct drm_atomic_state *state)
> -{
> -	struct drm_device *dev = encoder->dev;
> -
> -	ast_set_dp501_video_output(dev, 1);
> -}
> -
> -static void ast_dp501_encoder_helper_atomic_disable(struct drm_encoder *encoder,
> -						    struct drm_atomic_state *state)
> -{
> -	struct drm_device *dev = encoder->dev;
> -
> -	ast_set_dp501_video_output(dev, 0);
> -}
> -
> -static const struct drm_encoder_helper_funcs ast_dp501_encoder_helper_funcs = {
> -	.atomic_enable = ast_dp501_encoder_helper_atomic_enable,
> -	.atomic_disable = ast_dp501_encoder_helper_atomic_disable,
> -};
> -
> -/*
> - * DP501 Connector
> - */
> -
> -static int ast_dp501_connector_helper_get_modes(struct drm_connector *connector)
> -{
> -	void *edid;
> -	bool succ;
> -	int count;
> -
> -	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
> -	if (!edid)
> -		goto err_drm_connector_update_edid_property;
> -
> -	succ = ast_dp501_read_edid(connector->dev, edid);
> -	if (!succ)
> -		goto err_kfree;
> -
> -	drm_connector_update_edid_property(connector, edid);
> -	count = drm_add_edid_modes(connector, edid);
> -	kfree(edid);
> -
> -	return count;
> -
> -err_kfree:
> -	kfree(edid);
> -err_drm_connector_update_edid_property:
> -	drm_connector_update_edid_property(connector, NULL);
> -	return 0;
> -}
> -
> -static int ast_dp501_connector_helper_detect_ctx(struct drm_connector *connector,
> -						 struct drm_modeset_acquire_ctx *ctx,
> -						 bool force)
> -{
> -	struct ast_device *ast = to_ast_device(connector->dev);
> -
> -	if (ast_dp501_is_connected(ast))
> -		return connector_status_connected;
> -	return connector_status_disconnected;
> -}
> -
> -static const struct drm_connector_helper_funcs ast_dp501_connector_helper_funcs = {
> -	.get_modes = ast_dp501_connector_helper_get_modes,
> -	.detect_ctx = ast_dp501_connector_helper_detect_ctx,
> -};
> -
> -static const struct drm_connector_funcs ast_dp501_connector_funcs = {
> -	.reset = drm_atomic_helper_connector_reset,
> -	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.destroy = drm_connector_cleanup,
> -	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> -	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> -};
> -
> -static int ast_dp501_connector_init(struct drm_device *dev, struct drm_connector *connector)
> -{
> -	int ret;
> -
> -	ret = drm_connector_init(dev, connector, &ast_dp501_connector_funcs,
> -				 DRM_MODE_CONNECTOR_DisplayPort);
> -	if (ret)
> -		return ret;
> -
> -	drm_connector_helper_add(connector, &ast_dp501_connector_helper_funcs);
> -
> -	connector->interlace_allowed = 0;
> -	connector->doublescan_allowed = 0;
> -
> -	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
> -
> -	return 0;
> -}
> -
> -static int ast_dp501_output_init(struct ast_device *ast)
> -{
> -	struct drm_device *dev = &ast->base;
> -	struct drm_crtc *crtc = &ast->crtc;
> -	struct drm_encoder *encoder = &ast->output.dp501.encoder;
> -	struct drm_connector *connector = &ast->output.dp501.connector;
> -	int ret;
> -
> -	ret = drm_encoder_init(dev, encoder, &ast_dp501_encoder_funcs,
> -			       DRM_MODE_ENCODER_TMDS, NULL);
> -	if (ret)
> -		return ret;
> -	drm_encoder_helper_add(encoder, &ast_dp501_encoder_helper_funcs);
> -
> -	encoder->possible_crtcs = drm_crtc_mask(crtc);
> -
> -	ret = ast_dp501_connector_init(dev, connector);
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
> -/*
> - * ASPEED Display-Port Encoder
> - */
> -
> -static const struct drm_encoder_funcs ast_astdp_encoder_funcs = {
> -	.destroy = drm_encoder_cleanup,
> -};
> -
> -static void ast_astdp_encoder_helper_atomic_mode_set(struct drm_encoder *encoder,
> -						     struct drm_crtc_state *crtc_state,
> -						     struct drm_connector_state *conn_state)
> -{
> -	struct drm_crtc *crtc = crtc_state->crtc;
> -	struct ast_crtc_state *ast_crtc_state = to_ast_crtc_state(crtc_state);
> -	struct ast_vbios_mode_info *vbios_mode_info = &ast_crtc_state->vbios_mode_info;
> -
> -	ast_dp_set_mode(crtc, vbios_mode_info);
> -}
> -
> -static void ast_astdp_encoder_helper_atomic_enable(struct drm_encoder *encoder,
> -						   struct drm_atomic_state *state)
> -{
> -	struct drm_device *dev = encoder->dev;
> -	struct ast_device *ast = to_ast_device(dev);
> -
> -	ast_dp_power_on_off(dev, AST_DP_POWER_ON);
> -	ast_dp_link_training(ast);
> -
> -	ast_wait_for_vretrace(ast);
> -	ast_dp_set_on_off(dev, 1);
> -}
> -
> -static void ast_astdp_encoder_helper_atomic_disable(struct drm_encoder *encoder,
> -						    struct drm_atomic_state *state)
> -{
> -	struct drm_device *dev = encoder->dev;
> -
> -	ast_dp_set_on_off(dev, 0);
> -	ast_dp_power_on_off(dev, AST_DP_POWER_OFF);
> -}
> -
> -static const struct drm_encoder_helper_funcs ast_astdp_encoder_helper_funcs = {
> -	.atomic_mode_set = ast_astdp_encoder_helper_atomic_mode_set,
> -	.atomic_enable = ast_astdp_encoder_helper_atomic_enable,
> -	.atomic_disable = ast_astdp_encoder_helper_atomic_disable,
> -};
> -
> -/*
> - * ASPEED Display-Port Connector
> - */
> -
> -static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
> -{
> -	void *edid;
> -	struct drm_device *dev = connector->dev;
> -	struct ast_device *ast = to_ast_device(dev);
> -
> -	int succ;
> -	int count;
> -
> -	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
> -	if (!edid)
> -		goto err_drm_connector_update_edid_property;
> -
> -	/*
> -	 * Protect access to I/O registers from concurrent modesetting
> -	 * by acquiring the I/O-register lock.
> -	 */
> -	mutex_lock(&ast->modeset_lock);
> -
> -	succ = ast_astdp_read_edid(connector->dev, edid);
> -	if (succ < 0)
> -		goto err_mutex_unlock;
> -
> -	mutex_unlock(&ast->modeset_lock);
> -
> -	drm_connector_update_edid_property(connector, edid);
> -	count = drm_add_edid_modes(connector, edid);
> -	kfree(edid);
> -
> -	return count;
> -
> -err_mutex_unlock:
> -	mutex_unlock(&ast->modeset_lock);
> -	kfree(edid);
> -err_drm_connector_update_edid_property:
> -	drm_connector_update_edid_property(connector, NULL);
> -	return 0;
> -}
> -
> -static int ast_astdp_connector_helper_detect_ctx(struct drm_connector *connector,
> -						 struct drm_modeset_acquire_ctx *ctx,
> -						 bool force)
> -{
> -	struct drm_device *dev = connector->dev;
> -	struct ast_device *ast = to_ast_device(connector->dev);
> -	enum drm_connector_status status = connector_status_disconnected;
> -	struct drm_connector_state *connector_state = connector->state;
> -	bool is_active = false;
> -
> -	mutex_lock(&ast->modeset_lock);
> -
> -	if (connector_state && connector_state->crtc) {
> -		struct drm_crtc_state *crtc_state = connector_state->crtc->state;
> -
> -		if (crtc_state && crtc_state->active)
> -			is_active = true;
> -	}
> -
> -	if (!is_active && !ast_dp_power_is_on(ast)) {
> -		ast_dp_power_on_off(dev, true);
> -		msleep(50);
> -	}
> -
> -	if (ast_astdp_is_connected(ast))
> -		status = connector_status_connected;
> -
> -	if (!is_active && status == connector_status_disconnected)
> -		ast_dp_power_on_off(dev, false);
> -
> -	mutex_unlock(&ast->modeset_lock);
> -
> -	return status;
> -}
> -
> -static const struct drm_connector_helper_funcs ast_astdp_connector_helper_funcs = {
> -	.get_modes = ast_astdp_connector_helper_get_modes,
> -	.detect_ctx = ast_astdp_connector_helper_detect_ctx,
> -};
> -
> -static const struct drm_connector_funcs ast_astdp_connector_funcs = {
> -	.reset = drm_atomic_helper_connector_reset,
> -	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.destroy = drm_connector_cleanup,
> -	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> -	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> -};
> -
> -static int ast_astdp_connector_init(struct drm_device *dev, struct drm_connector *connector)
> -{
> -	int ret;
> -
> -	ret = drm_connector_init(dev, connector, &ast_astdp_connector_funcs,
> -				 DRM_MODE_CONNECTOR_DisplayPort);
> -	if (ret)
> -		return ret;
> -
> -	drm_connector_helper_add(connector, &ast_astdp_connector_helper_funcs);
> -
> -	connector->interlace_allowed = 0;
> -	connector->doublescan_allowed = 0;
> -
> -	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
> -
> -	return 0;
> -}
> -
> -static int ast_astdp_output_init(struct ast_device *ast)
> -{
> -	struct drm_device *dev = &ast->base;
> -	struct drm_crtc *crtc = &ast->crtc;
> -	struct drm_encoder *encoder = &ast->output.astdp.encoder;
> -	struct drm_connector *connector = &ast->output.astdp.connector;
> -	int ret;
> -
> -	ret = drm_encoder_init(dev, encoder, &ast_astdp_encoder_funcs,
> -			       DRM_MODE_ENCODER_TMDS, NULL);
> -	if (ret)
> -		return ret;
> -	drm_encoder_helper_add(encoder, &ast_astdp_encoder_helper_funcs);
> -
> -	encoder->possible_crtcs = drm_crtc_mask(crtc);
> -
> -	ret = ast_astdp_connector_init(dev, connector);
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
>    * BMC virtual Connector
>    */
> diff --git a/drivers/gpu/drm/ast/ast_sil164.c b/drivers/gpu/drm/ast/ast_sil164.c
> new file mode 100644
> index 000000000000..6e17d84f994e
> --- /dev/null
> +++ b/drivers/gpu/drm/ast/ast_sil164.c
> @@ -0,0 +1,88 @@
> +// SPDX-License-Identifier: MIT
> +
> +#include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_modeset_helper_vtables.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include "ast_ddc.h"
> +#include "ast_drv.h"
> +
> +/*
> + * Encoder
> + */
> +
> +static const struct drm_encoder_funcs ast_sil164_encoder_funcs = {
> +	.destroy = drm_encoder_cleanup,
> +};
> +
> +/*
> + * Connector
> + */
> +
> +static const struct drm_connector_helper_funcs ast_sil164_connector_helper_funcs = {
> +	.get_modes = drm_connector_helper_get_modes,
> +	.detect_ctx = drm_connector_helper_detect_from_ddc,
> +};
> +
> +static const struct drm_connector_funcs ast_sil164_connector_funcs = {
> +	.reset = drm_atomic_helper_connector_reset,
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = drm_connector_cleanup,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static int ast_sil164_connector_init(struct drm_device *dev, struct drm_connector *connector)
> +{
> +	struct ast_device *ast = to_ast_device(dev);
> +	struct i2c_adapter *ddc;
> +	int ret;
> +
> +	ddc = ast_ddc_create(ast);
> +	if (IS_ERR(ddc)) {
> +		ret = PTR_ERR(ddc);
> +		drm_err(dev, "failed to add DDC bus for connector; ret=%d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = drm_connector_init_with_ddc(dev, connector, &ast_sil164_connector_funcs,
> +					  DRM_MODE_CONNECTOR_DVII, ddc);
> +	if (ret)
> +		return ret;
> +
> +	drm_connector_helper_add(connector, &ast_sil164_connector_helper_funcs);
> +
> +	connector->interlace_allowed = 0;
> +	connector->doublescan_allowed = 0;
> +
> +	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
> +
> +	return 0;
> +}
> +
> +int ast_sil164_output_init(struct ast_device *ast)
> +{
> +	struct drm_device *dev = &ast->base;
> +	struct drm_crtc *crtc = &ast->crtc;
> +	struct drm_encoder *encoder = &ast->output.sil164.encoder;
> +	struct drm_connector *connector = &ast->output.sil164.connector;
> +	int ret;
> +
> +	ret = drm_encoder_init(dev, encoder, &ast_sil164_encoder_funcs,
> +			       DRM_MODE_ENCODER_TMDS, NULL);
> +	if (ret)
> +		return ret;
> +	encoder->possible_crtcs = drm_crtc_mask(crtc);
> +
> +	ret = ast_sil164_connector_init(dev, connector);
> +	if (ret)
> +		return ret;
> +
> +	ret = drm_connector_attach_encoder(connector, encoder);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/ast/ast_vga.c b/drivers/gpu/drm/ast/ast_vga.c
> new file mode 100644
> index 000000000000..2ea0763844f3
> --- /dev/null
> +++ b/drivers/gpu/drm/ast/ast_vga.c
> @@ -0,0 +1,88 @@
> +// SPDX-License-Identifier: MIT
> +
> +#include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_modeset_helper_vtables.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include "ast_ddc.h"
> +#include "ast_drv.h"
> +
> +/*
> + * Encoder
> + */
> +
> +static const struct drm_encoder_funcs ast_vga_encoder_funcs = {
> +	.destroy = drm_encoder_cleanup,
> +};
> +
> +/*
> + * Connector
> + */
> +
> +static const struct drm_connector_helper_funcs ast_vga_connector_helper_funcs = {
> +	.get_modes = drm_connector_helper_get_modes,
> +	.detect_ctx = drm_connector_helper_detect_from_ddc,
> +};
> +
> +static const struct drm_connector_funcs ast_vga_connector_funcs = {
> +	.reset = drm_atomic_helper_connector_reset,
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = drm_connector_cleanup,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static int ast_vga_connector_init(struct drm_device *dev, struct drm_connector *connector)
> +{
> +	struct ast_device *ast = to_ast_device(dev);
> +	struct i2c_adapter *ddc;
> +	int ret;
> +
> +	ddc = ast_ddc_create(ast);
> +	if (IS_ERR(ddc)) {
> +		ret = PTR_ERR(ddc);
> +		drm_err(dev, "failed to add DDC bus for connector; ret=%d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = drm_connector_init_with_ddc(dev, connector, &ast_vga_connector_funcs,
> +					  DRM_MODE_CONNECTOR_VGA, ddc);
> +	if (ret)
> +		return ret;
> +
> +	drm_connector_helper_add(connector, &ast_vga_connector_helper_funcs);
> +
> +	connector->interlace_allowed = 0;
> +	connector->doublescan_allowed = 0;
> +
> +	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
> +
> +	return 0;
> +}
> +
> +int ast_vga_output_init(struct ast_device *ast)
> +{
> +	struct drm_device *dev = &ast->base;
> +	struct drm_crtc *crtc = &ast->crtc;
> +	struct drm_encoder *encoder = &ast->output.vga.encoder;
> +	struct drm_connector *connector = &ast->output.vga.connector;
> +	int ret;
> +
> +	ret = drm_encoder_init(dev, encoder, &ast_vga_encoder_funcs,
> +			       DRM_MODE_ENCODER_DAC, NULL);
> +	if (ret)
> +		return ret;
> +	encoder->possible_crtcs = drm_crtc_mask(crtc);
> +
> +	ret = ast_vga_connector_init(dev, connector);
> +	if (ret)
> +		return ret;
> +
> +	ret = drm_connector_attach_encoder(connector, encoder);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}

