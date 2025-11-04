Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEF1C2FA31
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 08:36:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1E210E532;
	Tue,  4 Nov 2025 07:36:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JSOsP/b/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452F310E532
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 07:36:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5C603600AC;
 Tue,  4 Nov 2025 07:36:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3BDFC4CEF8;
 Tue,  4 Nov 2025 07:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762241767;
 bh=dTh7uimuP+1HLMgpMWUL0kWi3PgDJrHfNJi+05SCrXo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JSOsP/b/wFTdryqmS4RRLFMFoTGlDjVc8A2BgC7sDJayzpLsvh7QWaWOLMTYXMNkc
 zZFmUdkf2HpN4fqUlVCuhzhNuoNNJBSIyGhXvZ7FHSeitj1LkwGt3UsvopH5ritr91
 bY7+76qoqs7T+W6Cg7Ls93UTAs0P1xhrvJwsDx9KbYLmIfdwR58C49czLU6KPpmldU
 Ds5iT83syzYNE35dA4qWJiCEuoI8fgD3K1SOZgityNpzjNyMi/RoxsZZ55eIFxiuNI
 Jo23ze5M69sb5hruBZ+ws4Dp87MDODFuN2ajKcjFpEZvBB6LFuNzGcdP9xXn8D4Ztx
 4YKM2ZO5wQRtg==
Date: Tue, 4 Nov 2025 08:36:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Junjie Cao <caojunjie650@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Helge Deller <deller@gmx.de>, 
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Pengyu Luo <mitltlatltl@gmail.com>
Subject: Re: [PATCH v2 2/2] backlight: aw99706: Add support for Awinic
 AW99706 backlight
Message-ID: <20251104-attractive-dragonfly-of-perspective-0d52d6@kuoka>
References: <20251103110648.878325-1-caojunjie650@gmail.com>
 <20251103110648.878325-3-caojunjie650@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251103110648.878325-3-caojunjie650@gmail.com>
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

On Mon, Nov 03, 2025 at 07:06:48PM +0800, Junjie Cao wrote:
> +struct reg_init_data;
> +
> +struct aw99706_device {
> +	struct i2c_client *client;
> +	struct device *dev;
> +	struct regmap *regmap;
> +	struct backlight_device *bl_dev;
> +	struct gpio_desc *hwen_gpio;
> +	struct reg_init_data *init_tbl;
> +	int init_tbl_size;
> +	bool bl_enable;
> +};
> +
> +enum reg_access {
> +	REG_NONE_ACCESS	= 0,
> +	REG_RD_ACCESS	= 1,
> +	REG_WR_ACCESS	= 2,
> +};
> +
> +const u8 aw99706_regs[AW99706_REG_MAX + 1] = {

Why isn't this static?

> +	[AW99706_CFG0_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
> +	[AW99706_CFG1_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
> +	[AW99706_CFG2_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
> +	[AW99706_CFG3_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
> +	[AW99706_CFG4_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
> +	[AW99706_CFG5_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
> +	[AW99706_CFG6_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
> +	[AW99706_CFG7_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
> +	[AW99706_CFG8_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
> +	[AW99706_CFG9_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
> +	[AW99706_CFGA_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
> +	[AW99706_CFGB_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
> +	[AW99706_CFGC_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
> +	[AW99706_CFGD_REG]		= REG_RD_ACCESS | REG_WR_ACCESS,
> +	[AW99706_FLAG_REG]		= REG_RD_ACCESS,
> +	[AW99706_CHIPID_REG]		= REG_RD_ACCESS,
> +	[AW99706_LED_OPEN_FLAG_REG]	= REG_RD_ACCESS,
> +	[AW99706_LED_SHORT_FLAG_REG]	= REG_RD_ACCESS,
> +
> +	/*
> +	 * Write bit is dropped here, writing BIT(0) to MTPLDOSEL will unlock
> +	 * Multi-time Programmable (MTP).
> +	 */
> +	[AW99706_MTPLDOSEL_REG]		= REG_RD_ACCESS,
> +	[AW99706_MTPRUN_REG]		= REG_NONE_ACCESS,
> +};
> +

...

> +	aw = devm_kzalloc(dev, sizeof(*aw), GFP_KERNEL);
> +	if (!aw)
> +		return -ENOMEM;
> +
> +	aw->client = client;
> +	aw->dev = dev;
> +	i2c_set_clientdata(client, aw);
> +
> +	aw->regmap = devm_regmap_init_i2c(client, &aw99706_regmap_config);
> +	if (IS_ERR(aw->regmap))
> +		return dev_err_probe(dev, PTR_ERR(aw->regmap),
> +				     "Failed to init regmap\n");
> +
> +	ret = aw99706_chip_id_read(aw);
> +	if (ret != AW99706_ID)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to validate chip id\n")

Why are you exiting the probe with a positive value like 4 or 8? This
makes no sense. Registers do not coontain Linux return codes.

Best regards,
Krzysztof

