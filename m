Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 706D29EE6CA
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 13:33:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A612610E16E;
	Thu, 12 Dec 2024 12:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="DwS46AdY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr
 [80.12.242.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1118110E16E
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 12:33:40 +0000 (UTC)
Received: from [192.168.1.37] ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id LiNptubjiI1FGLiNptgWq8; Thu, 12 Dec 2024 13:33:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1734006819;
 bh=UoVTbaL4YNuWYLH975v+DNNPn9DDGWZVxGYR9Qdxa6s=;
 h=Message-ID:Date:MIME-Version:Subject:From:To;
 b=DwS46AdYDXC+9ZAsRLRjPUp1SCcuBxmFNKhonH5F5UWdvmPdW7vVhza+qcdT3QN4s
 Cs+Z5Al/+1IMjvmnJc+gr4Mb5fbRWLE7QLeYlZTsJDZxy5IQoIYnowlN0BgYhvEG1T
 3MO2M8I2/YbJAnnfN2J1udFQ/FTpo1z1iETzWtSyCOjnUp9RcQAoNO3UIgGdv6UsSz
 UetoPuHOaS9OWFM05EPhZuzdie0Rkj8GsK3d3qHr8IILz4UHsiZXYlW1z9Fu/CsogA
 BPlNhaljpKHp/QxwseVtkuFpdRUeUWFmaADh8ubMr9u62LkDeZrBwajpEmlxvoG0Tp
 9tml5snDXE3Xg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 12 Dec 2024 13:33:39 +0100
X-ME-IP: 90.11.132.44
Message-ID: <45f90007-3136-4b59-a3fc-6fc0147b8ad8@wanadoo.fr>
Date: Thu, 12 Dec 2024 13:33:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] drm/bridge: ti-sn65dsi83: Add ti,lvds-vod-swing
 optional properties
References: <20241212121712.214639-1-andrej.picej@norik.com>
 <20241212121712.214639-3-andrej.picej@norik.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, upstream@lists.phytec.de,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, marex@denx.de
To: Andrej Picej <andrej.picej@norik.com>
In-Reply-To: <20241212121712.214639-3-andrej.picej@norik.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Le 12/12/2024 à 13:17, Andrej Picej a écrit :
> Add a optional properties to change LVDS output voltage. This should not
> be static as this depends mainly on the connected display voltage
> requirement. We have three properties:
> - "ti,lvds-termination-ohms", which sets near end termination,
> - "ti,lvds-vod-swing-data-microvolt" and
> - "ti,lvds-vod-swing-clock-microvolt" which both set LVDS differential
> output voltage for data and clock lanes. They are defined as an array
> with min and max values. The appropriate bitfield will be set if
> selected constraints can be met.
> 
> If "ti,lvds-termination-ohms" is not defined the default of 200 Ohm near
> end termination will be used. Selecting only one:
> "ti,lvds-vod-swing-data-microvolt" or
> "ti,lvds-vod-swing-clock-microvolt" can be done, but the output voltage
> constraint for only data/clock lanes will be met. Setting both is
> recommended.

...

> +static int sn65dsi83_select_lvds_vod_swing(struct device *dev,
> +	u32 lvds_vod_swing_data[2], u32 lvds_vod_swing_clk[2], u8 lvds_term)
> +{
> +	int i;
> +
> +	for (i = 0; i <= 3; i++) {
> +		if (lvds_vod_swing_data_table[lvds_term][i][0] >= lvds_vod_swing_data[0] &&
> +		lvds_vod_swing_data_table[lvds_term][i][1] <= lvds_vod_swing_data[1] &&
> +		lvds_vod_swing_clock_table[lvds_term][i][0] >= lvds_vod_swing_clk[0] &&
> +		lvds_vod_swing_clock_table[lvds_term][i][1] <= lvds_vod_swing_clk[1])

Adding a few spaces to align things would help reading.

> +			return i;
> +	}
> +
> +	dev_err(dev, "failed to find appropriate LVDS_VOD_SWING configuration\n");
> +	return -EINVAL;
> +}
> +
> +static int sn65dsi83_parse_lvds_endpoint(struct sn65dsi83 *ctx, int channel)
> +{
> +	struct device *dev = ctx->dev;
> +	struct device_node *endpoint;
> +	int endpoint_reg;
> +	/* Set so the property can be freely selected if not defined */
> +	u32 lvds_vod_swing_data[2] = { 0, 1000000 };
> +	u32 lvds_vod_swing_clk[2] = { 0, 1000000 };
> +	/* Set default near end terminataion to 200 Ohm */
> +	u32 lvds_term = 200;
> +	int lvds_vod_swing_conf;
> +	int ret = 0;
> +	int ret_data;
> +	int ret_clock;
> +
> +	if (channel == CHANNEL_A)
> +		endpoint_reg = 2;
> +	else
> +		endpoint_reg = 3;
> +
> +	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, endpoint_reg, -1);
> +
> +	of_property_read_u32(endpoint, "ti,lvds-termination-ohms", &lvds_term);
> +	if (lvds_term == 100)
> +		ctx->lvds_term_conf[channel] = OHM_100;
> +	else if (lvds_term == 200)
> +		ctx->lvds_term_conf[channel] = OHM_200;
> +	else
> +		return -EINVAL;

Should it be:
	else {
		ret = -EINVAL;
		goto exit;
	}
?

> +
> +	ret_data = of_property_read_u32_array(endpoint, "ti,lvds-vod-swing-data-microvolt",
> +					lvds_vod_swing_data, ARRAY_SIZE(lvds_vod_swing_data));
> +	if (ret_data != 0 && ret_data != -EINVAL) {
> +		ret = ret_data;
> +		goto exit;
> +	}
> +
> +	ret_clock = of_property_read_u32_array(endpoint, "ti,lvds-vod-swing-clock-microvolt",
> +					lvds_vod_swing_clk, ARRAY_SIZE(lvds_vod_swing_clk));
> +	if (ret_clock != 0 && ret_clock != -EINVAL) {
> +		ret = ret_clock;
> +		goto exit;
> +	}
> +
> +	/* Use default value if both properties are NOT defined. */
> +	if (ret_data == -EINVAL && ret_clock == -EINVAL)
> +		lvds_vod_swing_conf = 0x1;
> +
> +	/* Use lookup table if any of the two properties is defined. */
> +	if (!ret_data || !ret_clock) {
> +		lvds_vod_swing_conf = sn65dsi83_select_lvds_vod_swing(dev, lvds_vod_swing_data,
> +						lvds_vod_swing_clk, ctx->lvds_term_conf[channel]);
> +		if (lvds_vod_swing_conf < 0) {
> +			ret = lvds_vod_swing_conf;
> +			goto exit;
> +		}
> +	}
> +
> +	ctx->lvds_vod_swing_conf[channel] = lvds_vod_swing_conf;
> +	ret = 0;
> +exit:
> +	of_node_put(endpoint);
> +	return ret;
> +}

...

CJ
