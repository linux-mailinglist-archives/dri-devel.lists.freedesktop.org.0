Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63896C89C8F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 13:33:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68AB510E5BA;
	Wed, 26 Nov 2025 12:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s2r7N7ky";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F231810E5BA
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 12:33:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B427040180;
 Wed, 26 Nov 2025 12:33:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF495C113D0;
 Wed, 26 Nov 2025 12:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764160422;
 bh=WlUVaShN9mH14jqFXquyf1gKUl8dks8bpJbxLKEl6qk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s2r7N7kyyi4co3v569XomNC7tcLFiWTQdGkehyrtCqFmicHOw0ojaoMcAHVK/sd1s
 5Oyd0Uquzy4MoCNJkS4O8kNhdTSehll91vqyB9mmQVBdTFHsbeYu7BZaWpQVVAJbqf
 uYATE4Uug2cXlv3wWzMuWWfPmzMwg8bPKS986x2tRYh71EW0kbSWHl9GUU/9UKo8zI
 CqJYXb/o4ToCrPTGZ8ZaWjDZKlQnrlYq0LHlcfyklJHSufAv5987qW90EsR9QZZKFL
 52yulW8Ocv0nNrhjkJ9HTj5ku1V5isCBR2c6XT5JflD/8vXwK42c1zTqA6EJWhXp49
 Mf2xT7MeHUHtg==
Date: Wed, 26 Nov 2025 12:33:38 +0000
From: Daniel Thompson <danielt@kernel.org>
To: petri.karhula@novatron.fi
Cc: Thomas Richard <thomas.richard@bootlin.com>, Lee Jones <lee@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 1/2] backlight: Add Congatec Board Controller (CGBC)
 backlight support
Message-ID: <aSbzomGqb4g98ADZ@aspen.lan>
References: <20251125-cgbc-backlight-v3-0-18ae42689411@novatron.fi>
 <20251125-cgbc-backlight-v3-1-18ae42689411@novatron.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125-cgbc-backlight-v3-1-18ae42689411@novatron.fi>
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

On Tue, Nov 25, 2025 at 03:29:39PM +0000, Petri Karhula via B4 Relay wrote:
> From: Petri Karhula <petri.karhula@novatron.fi>
>
> This driver provides backlight brightness control through the Linux
> backlight subsystem. It communicates with the board controller to
> adjust LCD backlight using PWM signals. Communication is done
> through Congatec Board Controller core driver.
>
> Signed-off-by: Petri Karhula <petri.karhula@novatron.fi>
> ---
>  drivers/video/backlight/Kconfig   |  11 +++
>  drivers/video/backlight/Makefile  |   1 +
>  drivers/video/backlight/cgbc_bl.c | 177 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 189 insertions(+)


> +static int cgbc_bl_probe(struct platform_device *pdev)
> +{
> +	struct cgbc_device_data *cgbc = dev_get_drvdata(pdev->dev.parent);
> +	struct backlight_properties props = { };
> +	u8 cmd_buf[4] = { CGBC_CMD_BLT0_PWM };
> +	struct backlight_device *bl_dev;
> +	struct cgbc_bl_data *bl_data;
> +	u8 reply_buf[3];
> +	int ret;
> +
> +	bl_data = devm_kzalloc(&pdev->dev, sizeof(*bl_data), GFP_KERNEL);
> +	if (!bl_data)
> +		return -ENOMEM;
> +
> +	bl_data->dev = &pdev->dev;
> +	bl_data->cgbc = cgbc;
> +
> +	ret = cgbc_command(bl_data->cgbc, cmd_buf, sizeof(cmd_buf), reply_buf,
> +			   sizeof(reply_buf), NULL);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Failed to read initial brightness\n");
> +
> +	/*
> +	 * Get only PWM duty factor percentage,
> +	 * ignore polarity inversion bit (bit 7)
> +	 */
> +	bl_data->current_brightness = FIELD_GET(BLT_PWM_DUTY_MASK, reply_buf[0]);

It would good to common this up with cgbc_bl_get_brightness() by
providing a helper that takes struct cgbc_bl_data * and calling it
from both places.


> +
> +	props.type = BACKLIGHT_PLATFORM;
> +	props.max_brightness = CGBC_BL_MAX_BRIGHTNESS;
> +	props.brightness = bl_data->current_brightness;

New drivers should always set props.scale .
> +

> +	bl_dev = devm_backlight_device_register(&pdev->dev, "cgbc-backlight",
> +						&pdev->dev, bl_data,
> +						&cgbc_bl_ops, &props);
> +	if (IS_ERR(bl_dev))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(bl_dev),
> +			     "Failed to register backlight device\n");
> +
> +	platform_set_drvdata(pdev, bl_data);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver cgbc_bl_driver = {
> +	.driver = {
> +		.name = "cgbc-backlight",
> +	},
> +	.probe = cgbc_bl_probe,
> +};


Daniel.
