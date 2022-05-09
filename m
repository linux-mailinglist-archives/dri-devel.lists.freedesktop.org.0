Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0826351F217
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 02:47:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37FE210FEB3;
	Mon,  9 May 2022 00:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC4910FEB3
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 00:47:20 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 46CE38010E;
 Mon,  9 May 2022 02:47:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1652057238;
 bh=aaMwZW73eqBNyFeIlh3lkpzFj5DJZEzMGdRfT5LOgxM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CIYv5V+DJTtrCAyqlV7sAQE5iMHlS/9c1jlQP4UWEWQQaUvJy6rcYSgAmNQkPFYMo
 S30svEkAncqTboNmRIdXKS9cbdIl0dbc2MaeXMQ1lTwi6IiauuEADXAIQbyPja2EHA
 invoxsqeNI+FqodhbYvkBKMasv820uGu02VCvEIUU80EgBt6adAmu8LrOWkpwZkaM6
 HkYbTRzoMF1P8HumNrKsDxOCT4tBEVjqEO2HLWfPlpqFP73p2zXJYcnyGMtcgiwCG6
 NducV4vgoyRfx4286dSWIuUFzprLwpy2jbM+dOz1GB4a2kLNCF+TZtL4rhC4DvYj1a
 qAWtB4UolSDwA==
Message-ID: <1a9a412f-9b3d-022c-f90b-ee46e5beddd1@denx.de>
Date: Mon, 9 May 2022 02:47:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v0.5 6/9] phy: freescale: add Samsung HDMI PHY
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20220506181034.2001548-1-l.stach@pengutronix.de>
 <20220506181034.2001548-7-l.stach@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220506181034.2001548-7-l.stach@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Sandor Yu <Sandor.yu@nxp.com>, Robert Foss <robert.foss@linaro.org>,
 patchwork-lst@pengutronix.de, Andrzej Hajda <andrzej.hajda@intel.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-phy@lists.infradead.org,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[...]

> +static int fsl_samsung_hdmi_phy_probe(struct platform_device *pdev)
> +{
> +	struct fsl_samsung_hdmi_phy *phy;
> +	int ret;
> +
> +	phy = devm_kzalloc(&pdev->dev, sizeof(*phy), GFP_KERNEL);
> +	if (!phy)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, phy);
> +	phy->dev = &pdev->dev;
> +
> +	phy->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(phy->regs))
> +		return PTR_ERR(phy->regs);
> +
> +	phy->apbclk = devm_clk_get(phy->dev, "apb");
> +	if (IS_ERR(phy->apbclk))
> +		return dev_err_probe(phy->dev, PTR_ERR(phy->apbclk),
> +				     "failed to get apb clk\n");
> +
> +	phy->refclk = devm_clk_get(phy->dev, "ref");
> +	if (IS_ERR(phy->refclk))
> +		return dev_err_probe(phy->dev, PTR_ERR(phy->refclk),
> +				     "failed to get ref clk\n");
> +
> +	ret = clk_prepare_enable(phy->apbclk);
> +	if (ret) {
> +		dev_err(phy->dev, "failed to enable apbclk\n");
> +		return ret;
> +	}

dev_err_probe() here too ?
