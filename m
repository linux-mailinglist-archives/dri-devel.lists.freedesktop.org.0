Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEEBB280E3
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 15:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F7310E263;
	Fri, 15 Aug 2025 13:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="ScVIb5sf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B80D10E263
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 13:52:20 +0000 (UTC)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57FDqDCw2616157;
 Fri, 15 Aug 2025 08:52:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1755265933;
 bh=UCQftk1b+byfHKSHcyL4RFx6sgIUNCLS0CkKFBF21w0=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=ScVIb5sfh4FdAZDHq21u2BhhugsupgRx0QOHfW47yD4w9ZvsG0lBKtUh0Q3enoJc3
 9NJlj8wbEYw0uts0Vcc9GWVNXabRYPQP3cNEPih/ra5BRHzMoOVnSHVXvqkF4rwCeW
 T5gQCftev9cUQqwN5u+8+Zib3S5lmPbOzLcPJQXc=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57FDqDqZ2630037
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Fri, 15 Aug 2025 08:52:13 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 15
 Aug 2025 08:52:13 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 15 Aug 2025 08:52:12 -0500
Received: from [10.249.42.149] ([10.249.42.149])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57FDqCMd1373257;
 Fri, 15 Aug 2025 08:52:12 -0500
Message-ID: <e3416746-ee96-449d-8a17-28efcd391c55@ti.com>
Date: Fri, 15 Aug 2025 08:52:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 3/4] drm/bridge: it66121: Use vid/pid to detect the
 type of chip
To: Nishanth Menon <nm@ti.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, David Airlie
 <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Neil Armstrong
 <neil.armstrong@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Robert Nelson <robertcnelson@gmail.com>,
 Jason Kridner <jkridner@beagleboard.org>,
 <tomi.valkeinen@ideasonboard.com>, <devarsht@ti.com>
References: <20250815034105.1276548-1-nm@ti.com>
 <20250815034105.1276548-4-nm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250815034105.1276548-4-nm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

On 8/14/25 10:41 PM, Nishanth Menon wrote:
> The driver knows exactly which version of the chip is present since
> the vid/pid is used to enforce a compatibility. Given that some
> devices like IT66121 has potentially been replaced with IT66122 mid
> production for many platforms, it makes no sense to use the vid/pid as
> an enforcement for compatibility. Instead, let us detect the ID of the
> actual chip in use by matching the corresponding vid/pid.
> 
> This also allows for some future compatibility to be checked only
> against a restricted set of vid/pid.
> 
> While at this, fix up a bit of formatting errors reported by
> checkpatch warning, and since the ctx info just requires the id, drop
> storing the entire chip_info pointer.
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
> Changes in V3:
> * Converted the patch to lookup ID based on vid/pid match rather than
>    enforcing vid/pid match per compatible.
> * Squashed a formating fix for pre-existing checkpatch --strict warning
> 
> V2: https://lore.kernel.org/all/20250813204106.580141-3-nm@ti.com/
> 
>   drivers/gpu/drm/bridge/ite-it66121.c | 53 ++++++++++++++--------------
>   1 file changed, 27 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index 9b8ed2fae2f4..5ac9631bcd9a 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -312,7 +312,7 @@ struct it66121_ctx {
>   		u8 swl;
>   		bool auto_cts;
>   	} audio;
> -	const struct it66121_chip_info *info;
> +	enum chip_id id;
>   };
>   
>   static const struct regmap_range_cfg it66121_regmap_banks[] = {
> @@ -402,7 +402,7 @@ static int it66121_configure_afe(struct it66121_ctx *ctx,
>   		if (ret)
>   			return ret;
>   
> -		if (ctx->info->id == ID_IT66121) {
> +		if (ctx->id == ID_IT66121) {
>   			ret = regmap_write_bits(ctx->regmap, IT66121_AFE_IP_REG,
>   						IT66121_AFE_IP_EC1, 0);
>   			if (ret)
> @@ -428,7 +428,7 @@ static int it66121_configure_afe(struct it66121_ctx *ctx,
>   		if (ret)
>   			return ret;
>   
> -		if (ctx->info->id == ID_IT66121) {
> +		if (ctx->id == ID_IT66121) {
>   			ret = regmap_write_bits(ctx->regmap, IT66121_AFE_IP_REG,
>   						IT66121_AFE_IP_EC1,
>   						IT66121_AFE_IP_EC1);
> @@ -449,7 +449,7 @@ static int it66121_configure_afe(struct it66121_ctx *ctx,
>   	if (ret)
>   		return ret;
>   
> -	if (ctx->info->id == ID_IT6610) {
> +	if (ctx->id == ID_IT6610) {
>   		ret = regmap_write_bits(ctx->regmap, IT66121_AFE_XP_REG,
>   					IT6610_AFE_XP_BYPASS,
>   					IT6610_AFE_XP_BYPASS);
> @@ -599,7 +599,7 @@ static int it66121_bridge_attach(struct drm_bridge *bridge,
>   	if (ret)
>   		return ret;
>   
> -	if (ctx->info->id == ID_IT66121) {
> +	if (ctx->id == ID_IT66121) {
>   		ret = regmap_write_bits(ctx->regmap, IT66121_CLK_BANK_REG,
>   					IT66121_CLK_BANK_PWROFF_RCLK, 0);
>   		if (ret)
> @@ -748,7 +748,7 @@ static int it66121_bridge_check(struct drm_bridge *bridge,
>   {
>   	struct it66121_ctx *ctx = container_of(bridge, struct it66121_ctx, bridge);
>   
> -	if (ctx->info->id == ID_IT6610) {
> +	if (ctx->id == ID_IT6610) {
>   		/* The IT6610 only supports these settings */
>   		bridge_state->input_bus_cfg.flags |= DRM_BUS_FLAG_DE_HIGH |
>   			DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE;
> @@ -802,7 +802,7 @@ void it66121_bridge_mode_set(struct drm_bridge *bridge,
>   	if (regmap_write(ctx->regmap, IT66121_HDMI_MODE_REG, IT66121_HDMI_MODE_HDMI))
>   		goto unlock;
>   
> -	if (ctx->info->id == ID_IT66121 &&
> +	if (ctx->id == ID_IT66121 &&
>   	    regmap_write_bits(ctx->regmap, IT66121_CLK_BANK_REG,
>   			      IT66121_CLK_BANK_PWROFF_TXCLK,
>   			      IT66121_CLK_BANK_PWROFF_TXCLK)) {
> @@ -815,7 +815,7 @@ void it66121_bridge_mode_set(struct drm_bridge *bridge,
>   	if (it66121_configure_afe(ctx, adjusted_mode))
>   		goto unlock;
>   
> -	if (ctx->info->id == ID_IT66121 &&
> +	if (ctx->id == ID_IT66121 &&
>   	    regmap_write_bits(ctx->regmap, IT66121_CLK_BANK_REG,
>   			      IT66121_CLK_BANK_PWROFF_TXCLK, 0)) {
>   		goto unlock;
> @@ -1505,6 +1505,7 @@ static int it66121_probe(struct i2c_client *client)
>   	int ret;
>   	struct it66121_ctx *ctx;
>   	struct device *dev = &client->dev;
> +	const struct it66121_chip_info *chip_info;
>   
>   	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
>   		dev_err(dev, "I2C check functionality failed.\n");
> @@ -1522,7 +1523,7 @@ static int it66121_probe(struct i2c_client *client)
>   
>   	ctx->dev = dev;
>   	ctx->client = client;
> -	ctx->info = i2c_get_match_data(client);
> +	chip_info = i2c_get_match_data(client);
>   
>   	of_property_read_u32(ep, "bus-width", &ctx->bus_width);
>   	of_node_put(ep);
> @@ -1568,11 +1569,17 @@ static int it66121_probe(struct i2c_client *client)
>   	revision_id = FIELD_GET(IT66121_REVISION_MASK, device_ids[1]);
>   	device_ids[1] &= IT66121_DEVICE_ID1_MASK;
>   
> -	if ((vendor_ids[1] << 8 | vendor_ids[0]) != ctx->info->vid ||
> -	    (device_ids[1] << 8 | device_ids[0]) != ctx->info->pid) {
> -		return -ENODEV;
> +	for (; chip_info->vid; chip_info++) {
> +		if ((vendor_ids[1] << 8 | vendor_ids[0]) == chip_info->vid &&
> +		    (device_ids[1] << 8 | device_ids[0]) == chip_info->pid) {
> +			ctx->id = chip_info->id;
> +			break;
> +		}
>   	}
>   
> +	if (!chip_info->vid)
> +		return -ENODEV;
> +
>   	ctx->bridge.of_node = dev->of_node;
>   	ctx->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
>   	ctx->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
> @@ -1606,28 +1613,22 @@ static void it66121_remove(struct i2c_client *client)
>   	mutex_destroy(&ctx->lock);
>   }
>   
> -static const struct it66121_chip_info it66121_chip_info = {
> -	.id = ID_IT66121,
> -	.vid = 0x4954,
> -	.pid = 0x0612,
> -};
> -
> -static const struct it66121_chip_info it6610_chip_info = {
> -	.id = ID_IT6610,
> -	.vid = 0xca00,
> -	.pid = 0x0611,
> +static const struct it66121_chip_info it66xx_chip_info[] = {
> +	{.id = ID_IT66121, .vid = 0x4954, .pid = 0x0612 },
> +	{.id = ID_IT6610, .vid = 0xca00, .pid = 0x0611 },
> +	{ }
>   };
>   
>   static const struct of_device_id it66121_dt_match[] = {
> -	{ .compatible = "ite,it66121", &it66121_chip_info },
> -	{ .compatible = "ite,it6610", &it6610_chip_info },
> +	{ .compatible = "ite,it66121", &it66xx_chip_info },
> +	{ .compatible = "ite,it6610", &it66xx_chip_info },

If you will pass in the same data to all devices, just don't pass
anything. Move the it66121_dt_match table up above probe, and just
use it, no need for fetching it from i2c_get_match_data().

That can also be done later too, so not a blocker here,

Reviewed-by: Andrew Davis <afd@ti.com>

>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, it66121_dt_match);
>   
>   static const struct i2c_device_id it66121_id[] = {
> -	{ "it66121", (kernel_ulong_t) &it66121_chip_info },
> -	{ "it6610", (kernel_ulong_t) &it6610_chip_info },
> +	{ "it66121", (kernel_ulong_t)&it66xx_chip_info },
> +	{ "it6610", (kernel_ulong_t)&it66xx_chip_info },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(i2c, it66121_id);

