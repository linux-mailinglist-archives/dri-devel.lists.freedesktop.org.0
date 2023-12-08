Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEBA80A9E8
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 17:59:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C2EA10E095;
	Fri,  8 Dec 2023 16:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3724610E095
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 16:59:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 83653B82E8B;
 Fri,  8 Dec 2023 16:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC84DC433C8;
 Fri,  8 Dec 2023 16:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702054742;
 bh=h0JkAKzYF1eCC3VCUFet/wUloQePgRqJtpyUOwrwHs8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VV9pLQrduCHZxqG1gp2gsdESd89zqUJ8T/ztaw9WJVw7s21G8m8muHVlDot3+Gf40
 65myTt3MriTs13uBBjQtrCxREZctMcuNBTs7qnGtm24UGeLP0ZZIHk1cDe2BqhGoG5
 6n9im+9fMvwh7N5TggcZFvP6o6io3PyaZcgCS1iYmLOW+edW4FBFuzCKI3FXRVqssq
 gBwKneVYebD7Q/ruS5A6bejC3WL/NZroDaT74VKIptNNKVPIXywOlsdC0uq209XkCP
 And+nEwHTfPBhvawAtMy7NfdJGgiRcPQgMJR+qF0p4bLHgxxd7/yjMuh2w1hz5BSiS
 rFmD07v7UUqtw==
Date: Fri, 8 Dec 2023 16:58:55 +0000
From: Simon Horman <horms@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Subject: Re: [PATCH v2 3/4] drm/stm: dsi: expose DSI PHY internal clock
Message-ID: <20231208165855.GA8459@kernel.org>
References: <20231204101113.276368-1-raphael.gallais-pou@foss.st.com>
 <20231204101113.276368-4-raphael.gallais-pou@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204101113.276368-4-raphael.gallais-pou@foss.st.com>
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh+dt@kernel.org>, Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 04, 2023 at 11:11:12AM +0100, Raphael Gallais-Pou wrote:

...

> @@ -514,18 +675,40 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
>  		dsi->lane_max_kbps *= 2;
>  	}
>  
> -	dw_mipi_dsi_stm_plat_data.base = dsi->base;
> -	dw_mipi_dsi_stm_plat_data.priv_data = dsi;
> +	dsi->pdata = *pdata;
> +	dsi->pdata.base = dsi->base;
> +	dsi->pdata.priv_data = dsi;
> +
> +	dsi->pdata.max_data_lanes = 2;
> +	dsi->pdata.phy_ops = &dw_mipi_dsi_stm_phy_ops;
>  
>  	platform_set_drvdata(pdev, dsi);
>  
> -	dsi->dsi = dw_mipi_dsi_probe(pdev, &dw_mipi_dsi_stm_plat_data);
> +	dsi->dsi = dw_mipi_dsi_probe(pdev, &dsi->pdata);
>  	if (IS_ERR(dsi->dsi)) {
>  		ret = PTR_ERR(dsi->dsi);
>  		dev_err_probe(dev, ret, "Failed to initialize mipi dsi host\n");
>  		goto err_dsi_probe;
>  	}
>  
> +	/*
> +	 * We need to wait for the generic bridge to probe before enabling and
> +	 * register the internal pixel clock.
> +	 */
> +	ret = clk_prepare_enable(dsi->pclk);
> +	if (ret) {
> +		DRM_ERROR("%s: Failed to enable peripheral clk\n", __func__);
> +		goto err_dsi_probe;
> +	}
> +
> +	ret = dw_mipi_dsi_clk_register(dsi, dev);
> +	if (ret) {
> +		DRM_ERROR("Failed to register DSI pixel clock: %d\n", ret);

Hi Raphael,

Does clk_disable_unprepare(dsi->pclk) need to be added to this unwind
chain?

Flagged by Smatch.

> +		goto err_dsi_probe;
> +	}
> +
> +	clk_disable_unprepare(dsi->pclk);
> +
>  	return 0;
>  
>  err_dsi_probe:

...
