Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDAB211091
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 18:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09676E944;
	Wed,  1 Jul 2020 16:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB9C6E944
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 16:27:28 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id j12so11210103pfn.10
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 09:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wQaCz8+UfsafcwRt4VL8N/qWARYzLvQoOyGJgNCrxQI=;
 b=Wy3cweAjK4tvj6mIeOVbVrJjUOaGgRxJ6UPiv9+Se3RA7mLci7cvfmTFwRjxuu983H
 0KvWKlCLHrBYHAzUPOL184XNbTz+I3z1Md/IlwUIZ3UeXct7U0VRXXyeHyBsIKgMzXtd
 sRfojAeQpY0uadNtq/c9rWNJZbooeqNEAcvr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wQaCz8+UfsafcwRt4VL8N/qWARYzLvQoOyGJgNCrxQI=;
 b=rU1tZvx94D7IRhVzckD9b2DzMLrf+l5F/3/eqWfi1aaJOizPb2KQe2dglHBZuvME7h
 VEUVnFLfDRm7VwtEhC7pGb1w08I/1GgolVzA/IrbpIBdBeSOzXDTglICdO9sCs0NFtK2
 ASmBve+vghTdE0HEhNut/okJXfsnMZ4n9aTV9HnlBYSUi5NRf04BeEs4L7R+c3n1x9ZV
 BMxHsNAaEsfjvL6cObgCbyop74IFEtQc4RWIYHsaahPwMC1nTU8Qj39Utb9rsIFubsCZ
 4LZhKQU/UfrW6v67SIt3X6u59t/TWfib2fkzMjEGvSSCl2dY9NpN4S4xBN9W3EhRrBxn
 TnXQ==
X-Gm-Message-State: AOAM532h9zCj4KKyTOYz1SNrdpyExN3Y9L2qhijYLECWCNsskL5hW1ry
 RKjUCK3mrPN7H0tJMoTSRQESsg==
X-Google-Smtp-Source: ABdhPJy0vP6rFgxJXypkuu0P2L9thUTIA4J7HCFrWcLpeIClul/fDj97U02GLCWP4TkVeCw22Q499g==
X-Received: by 2002:a05:6a00:1511:: with SMTP id
 q17mr25176779pfu.16.1593620848077; 
 Wed, 01 Jul 2020 09:27:28 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
 by smtp.gmail.com with ESMTPSA id z1sm6186018pgk.89.2020.07.01.09.27.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2020 09:27:27 -0700 (PDT)
Date: Wed, 1 Jul 2020 09:27:26 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH 2/4] drm/msm: dsi: Use OPP API to set clk/perf state
Message-ID: <20200701162726.GO39073@google.com>
References: <1593518176-24450-1-git-send-email-rnayak@codeaurora.org>
 <1593518176-24450-3-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1593518176-24450-3-git-send-email-rnayak@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, agross@kernel.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 30, 2020 at 05:26:14PM +0530, Rajendra Nayak wrote:
> On SDM845 DSI needs to express a perforamnce state

nit: performance

> requirement on a power domain depending on the clock rates.
> Use OPP table from DT to register with OPP framework and use
> dev_pm_opp_set_rate() to set the clk/perf state.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.h      |  2 ++
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c  |  4 +--
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 58 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 62 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> index 4de771d..ba7583c 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -180,10 +180,12 @@ int msm_dsi_runtime_suspend(struct device *dev);
>  int msm_dsi_runtime_resume(struct device *dev);
>  int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host);
>  int dsi_link_clk_set_rate_v2(struct msm_dsi_host *msm_host);
> +int dsi_link_clk_set_rate_6g_v2(struct msm_dsi_host *msm_host);
>  int dsi_link_clk_enable_6g(struct msm_dsi_host *msm_host);
>  int dsi_link_clk_enable_v2(struct msm_dsi_host *msm_host);
>  void dsi_link_clk_disable_6g(struct msm_dsi_host *msm_host);
>  void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host);
> +void dsi_link_clk_disable_6g_v2(struct msm_dsi_host *msm_host);
>  int dsi_tx_buf_alloc_6g(struct msm_dsi_host *msm_host, int size);
>  int dsi_tx_buf_alloc_v2(struct msm_dsi_host *msm_host, int size);
>  void *dsi_tx_buf_get_6g(struct msm_dsi_host *msm_host);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index 813d69d..773c4fe 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -210,9 +210,9 @@ static const struct msm_dsi_host_cfg_ops msm_dsi_6g_host_ops = {
>  };
>  
>  static const struct msm_dsi_host_cfg_ops msm_dsi_6g_v2_host_ops = {
> -	.link_clk_set_rate = dsi_link_clk_set_rate_6g,
> +	.link_clk_set_rate = dsi_link_clk_set_rate_6g_v2,
>  	.link_clk_enable = dsi_link_clk_enable_6g,
> -	.link_clk_disable = dsi_link_clk_disable_6g,
> +	.link_clk_disable = dsi_link_clk_disable_6g_v2,
>  	.clk_init_ver = dsi_clk_init_6g_v2,
>  	.tx_buf_alloc = dsi_tx_buf_alloc_6g,
>  	.tx_buf_get = dsi_tx_buf_get_6g,
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 11ae5b8..890531c 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -14,6 +14,7 @@
>  #include <linux/of_graph.h>
>  #include <linux/of_irq.h>
>  #include <linux/pinctrl/consumer.h>
> +#include <linux/pm_opp.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/spinlock.h>
> @@ -111,6 +112,9 @@ struct msm_dsi_host {
>  	struct clk *pixel_clk_src;
>  	struct clk *byte_intf_clk;
>  
> +	struct opp_table *opp_table;
> +	bool has_opp_table;
> +
>  	u32 byte_clk_rate;
>  	u32 pixel_clk_rate;
>  	u32 esc_clk_rate;
> @@ -537,6 +541,38 @@ int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host)
>  	return 0;
>  }
>  
> +int dsi_link_clk_set_rate_6g_v2(struct msm_dsi_host *msm_host)
> +{
> +	int ret;
> +	struct device *dev = &msm_host->pdev->dev;
> +
> +	DBG("Set clk rates: pclk=%d, byteclk=%d",
> +		msm_host->mode->clock, msm_host->byte_clk_rate);
> +
> +	ret = dev_pm_opp_set_rate(dev, msm_host->byte_clk_rate);
> +	if (ret) {
> +		pr_err("%s: dev_pm_opp_set_rate failed %d\n", __func__, ret);
> +		return ret;
> +	}
> +
> +	ret = clk_set_rate(msm_host->pixel_clk, msm_host->pixel_clk_rate);
> +	if (ret) {
> +		pr_err("%s: Failed to set rate pixel clk, %d\n", __func__, ret);
> +		return ret;
> +	}
> +
> +	if (msm_host->byte_intf_clk) {
> +		ret = clk_set_rate(msm_host->byte_intf_clk,
> +				   msm_host->byte_clk_rate / 2);
> +		if (ret) {
> +			pr_err("%s: Failed to set rate byte intf clk, %d\n",
> +			       __func__, ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}

xThis function is essentially the same as dsi_link_clk_set_rate_6g(),
except for the use of dev_pm_opp_set_rate() instead of clk_set_rate().

IIUC dev_pm_opp_set_rate() just calls clk_set_rate() if the device has
no OPP table. If that's correct you could just call dev_pm_opp_set_rate()
in dsi_link_clk_set_rate_6g().

	/*
    	* For IO devices which require an OPP on some platforms/SoCs
    	* while just needing to scale the clock on some others
    	* we look for empty OPP tables with just a clock handle and
    	* scale only the clk. This makes dev_pm_opp_set_rate()
	* equivalent to a clk_set_rate()
	*/
	if (!_get_opp_count(opp_table)) {
		ret = _generic_set_opp_clk_only(dev, clk, freq);
		goto put_opp_table;
	}

https://elixir.bootlin.com/linux/v5.7.6/source/drivers/opp/core.c#L855

>  int dsi_link_clk_enable_6g(struct msm_dsi_host *msm_host)
>  {
> @@ -665,6 +701,13 @@ void dsi_link_clk_disable_6g(struct msm_dsi_host *msm_host)
>  	clk_disable_unprepare(msm_host->byte_clk);
>  }
>  
> +void dsi_link_clk_disable_6g_v2(struct msm_dsi_host *msm_host)
> +{
> +	/* Drop the performance state vote */
> +	dev_pm_opp_set_rate(&msm_host->pdev->dev, 0);

Couldn't you just do this in dsi_link_clk_disable_6g() ?

> +	dsi_link_clk_disable_6g(msm_host);
> +}
> +
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
