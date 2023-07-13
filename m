Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB157751937
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 09:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B59110E604;
	Thu, 13 Jul 2023 07:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456FA10E604
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 07:00:16 +0000 (UTC)
Received: from [192.168.2.181] (192.168.2.181) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 13 Jul
 2023 15:00:13 +0800
Message-ID: <f61ea042-a14c-9c8f-710d-0ba0820686fe@aspeedtech.com>
Date: Thu, 13 Jul 2023 15:00:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 2/2] drm/ast: report connection status on Display Port.
To: Jocelyn Falempe <jfalempe@redhat.com>, <tzimmermann@suse.de>,
 <airlied@redhat.com>, <kuohsiang_chou@aspeedtech.com>,
 <jani.nikula@linux.intel.com>, <dianders@chromium.org>
References: <20230713064037.315387-1-jfalempe@redhat.com>
 <20230713064037.315387-2-jfalempe@redhat.com>
Content-Language: en-US
From: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <20230713064037.315387-2-jfalempe@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.2.181]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jocelyn,

Thanks for your work.

On 2023/7/13 下午 02:40, Jocelyn Falempe wrote:
> Aspeed always report the display port as "connected", because it
> doesn't set a .detect_ctx callback.
> Fix this by providing the proper detect callback for astdp and dp501.
>
> This also fixes the following regression:
> Since commit fae7d186403e ("drm/probe-helper: Default to 640x480 if no
> EDID on DP") The default resolution is now 640x480 when no monitor is
> connected. But Aspeed graphics is mostly used in servers, where no monitor
> is attached. This also affects the remote BMC resolution to 640x480, which
> is inconvenient, and breaks the anaconda installer.
>
> v2: Add .detect callback to the dp/dp501 connector (Jani Nikula)
> v3: Use .detect_ctx callback, and refactors (Thomas Zimmermann)
>      Add a BMC virtual connector
> v4: Better indent detect_ctx() functions (Thomas Zimmermann)
> v5: Enable polling of the dp and dp501 connector status
>      (Thomas Zimmermann)
>
> Fixes: fae7d186403e ("drm/probe-helper: Default to 640x480 if no EDID on DP")
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_dp.c    | 11 ++++++++++
>   drivers/gpu/drm/ast/ast_dp501.c | 37 ++++++++++++++++++++++-----------
>   drivers/gpu/drm/ast/ast_drv.h   |  2 ++
>   drivers/gpu/drm/ast/ast_mode.c  | 31 +++++++++++++++++++++++++--
>   4 files changed, 67 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
> index 6dc1a09504e1..bf78f3d4aa3f 100644
> --- a/drivers/gpu/drm/ast/ast_dp.c
> +++ b/drivers/gpu/drm/ast/ast_dp.c
> @@ -7,6 +7,17 @@
>   #include <drm/drm_print.h>
>   #include "ast_drv.h"
>   
> +bool ast_astdp_is_connected(struct ast_device *ast)
> +{
> +	if (!ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD1, ASTDP_MCU_FW_EXECUTING))
> +		return false;
> +	if (!ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDC, ASTDP_LINK_SUCCESS))
> +		return false;
> +	if (!ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDF, ASTDP_HPD))
> +		return false;
> +	return true;
> +}

* ASPDP_LINK_SUCCESS is true, when DP link training is finished. The DP 
link quality is good

enough to deliver video data.

* ASTDP_HPD is true, when there is DP sink pull high HPD.

Thus, ASTDP_HPD is the prerequisite of ASTDP_LINK_SUCCESS. I would 
suggest to remove

the check for ASTDP_LINK_SUCCESS here. ASTDP_HPD is good enough for 
connected status.

If you want to check all these three status, please change the order, 
FW_EXECUTING -> HPD ->

LINK_SUCCESS.

> +
>   int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
>   {
>   	struct ast_device *ast = to_ast_device(dev);
> diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
> index a5d285850ffb..f10d53b0c94f 100644
> --- a/drivers/gpu/drm/ast/ast_dp501.c
> +++ b/drivers/gpu/drm/ast/ast_dp501.c
> @@ -272,11 +272,9 @@ static bool ast_launch_m68k(struct drm_device *dev)
>   	return true;
>   }
>   
> -bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata)
> +bool ast_dp501_is_connected(struct ast_device *ast)
>   {
> -	struct ast_device *ast = to_ast_device(dev);
> -	u32 i, boot_address, offset, data;
> -	u32 *pEDIDidx;
> +	u32 boot_address, offset, data;
>   
>   	if (ast->config_mode == ast_use_p2a) {
>   		boot_address = get_fw_base(ast);
> @@ -292,14 +290,6 @@ bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata)
>   		data = ast_mindwm(ast, boot_address + offset);
>   		if (!(data & AST_DP501_PNP_CONNECTED))
>   			return false;
> -
> -		/* Read EDID */
> -		offset = AST_DP501_EDID_DATA;
> -		for (i = 0; i < 128; i += 4) {
> -			data = ast_mindwm(ast, boot_address + offset + i);
> -			pEDIDidx = (u32 *)(ediddata + i);
> -			*pEDIDidx = data;
> -		}
>   	} else {
>   		if (!ast->dp501_fw_buf)
>   			return false;
> @@ -319,7 +309,30 @@ bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata)
>   		data = readl(ast->dp501_fw_buf + offset);
>   		if (!(data & AST_DP501_PNP_CONNECTED))
>   			return false;
> +	}
> +	return true;
> +}
> +
> +bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata)
> +{
> +	struct ast_device *ast = to_ast_device(dev);
> +	u32 i, boot_address, offset, data;
> +	u32 *pEDIDidx;
> +
> +	if (!ast_dp501_is_connected(ast))
> +		return false;
> +
> +	if (ast->config_mode == ast_use_p2a) {
> +		boot_address = get_fw_base(ast);
>   
> +		/* Read EDID */
> +		offset = AST_DP501_EDID_DATA;
> +		for (i = 0; i < 128; i += 4) {
> +			data = ast_mindwm(ast, boot_address + offset + i);
> +			pEDIDidx = (u32 *)(ediddata + i);
> +			*pEDIDidx = data;
> +		}
> +	} else {
>   		/* Read EDID */
>   		offset = AST_DP501_EDID_DATA;
>   		for (i = 0; i < 128; i += 4) {
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index c9659e72002f..848a9f1403e8 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -514,6 +514,7 @@ void ast_patch_ahb_2500(struct ast_device *ast);
>   /* ast dp501 */
>   void ast_set_dp501_video_output(struct drm_device *dev, u8 mode);
>   bool ast_backup_fw(struct drm_device *dev, u8 *addr, u32 size);
> +bool ast_dp501_is_connected(struct ast_device *ast);
>   bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata);
>   u8 ast_get_dp501_max_clk(struct drm_device *dev);
>   void ast_init_3rdtx(struct drm_device *dev);
> @@ -522,6 +523,7 @@ void ast_init_3rdtx(struct drm_device *dev);
>   struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev);
>   
>   /* aspeed DP */
> +bool ast_astdp_is_connected(struct ast_device *ast);
>   int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata);
>   void ast_dp_launch(struct drm_device *dev);
>   void ast_dp_power_on_off(struct drm_device *dev, bool no);
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 1a8293162fec..e7f36ec73817 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1582,8 +1582,21 @@ static int ast_dp501_connector_helper_get_modes(struct drm_connector *connector)
>   	return 0;
>   }
>   
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
> +
>   static const struct drm_connector_helper_funcs ast_dp501_connector_helper_funcs = {
>   	.get_modes = ast_dp501_connector_helper_get_modes,
> +	.detect_ctx = ast_dp501_connector_helper_detect_ctx,
>   };
>   
>   static const struct drm_connector_funcs ast_dp501_connector_funcs = {
> @@ -1608,7 +1621,7 @@ static int ast_dp501_connector_init(struct drm_device *dev, struct drm_connector
>   	connector->interlace_allowed = 0;
>   	connector->doublescan_allowed = 0;
>   
> -	connector->polled = DRM_CONNECTOR_POLL_CONNECT;
> +	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
>   
>   	return 0;
>   }
> @@ -1680,8 +1693,20 @@ static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
>   	return 0;
>   }
>   
> +static int ast_astdp_connector_helper_detect_ctx(struct drm_connector *connector,
> +						 struct drm_modeset_acquire_ctx *ctx,
> +						 bool force)
> +{
> +	struct ast_device *ast = to_ast_device(connector->dev);
> +
> +	if (ast_astdp_is_connected(ast))
> +		return connector_status_connected;
> +	return connector_status_disconnected;
> +}
> +
>   static const struct drm_connector_helper_funcs ast_astdp_connector_helper_funcs = {
>   	.get_modes = ast_astdp_connector_helper_get_modes,
> +	.detect_ctx = ast_astdp_connector_helper_detect_ctx,
>   };
>   
>   static const struct drm_connector_funcs ast_astdp_connector_funcs = {
> @@ -1706,7 +1731,7 @@ static int ast_astdp_connector_init(struct drm_device *dev, struct drm_connector
>   	connector->interlace_allowed = 0;
>   	connector->doublescan_allowed = 0;
>   
> -	connector->polled = DRM_CONNECTOR_POLL_CONNECT;
> +	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
>   
>   	return 0;
>   }
> @@ -1903,5 +1928,7 @@ int ast_mode_config_init(struct ast_device *ast)
>   
>   	drm_mode_config_reset(dev);
>   
> +	drm_kms_helper_poll_init(dev);
> +
>   	return 0;
>   }

-- 
Best Regards
Jammy

