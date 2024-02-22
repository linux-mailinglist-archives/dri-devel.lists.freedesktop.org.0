Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B1B85EF14
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 03:18:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D973B10E843;
	Thu, 22 Feb 2024 02:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qX/SRZ5m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A81CD10E843;
 Thu, 22 Feb 2024 02:18:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4A572CE20EA;
 Thu, 22 Feb 2024 02:18:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F90C433F1;
 Thu, 22 Feb 2024 02:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708568284;
 bh=ICoVeLCRrWPtB38dc/cDRlSdBAtyS8pTSuWsOxGh700=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qX/SRZ5mwTln4kpwSxVzd5cPB+bUGAKJqxhO83U0vFgjbBKcSNgOX5WPCqdpSNaSx
 YUB0Yu0dKLUbNkTBttzx0KkMaHlUpnG3d7VEIOyRo4dAlR1QnDnx5dazuLCRF+Mcw+
 +CNXpQk8sVuyLGcz9GkkRh8yN3rWuAO/cJTmU7PI0OAg3l6P7iLpn/tsTNo+Z0M5H3
 mDxP/Fr60aa21K0MwRnIdrUyW/wa1Cxem+nqrpchfZ6l5ojfnLCa0gXONfbQchD07g
 oyeQdxZejyjzX7TSoNwvdql1FN/kKXp3EE6RwXZ4FhOeRvFeXCvYVFicmMBqp2GATY
 ZUPosQ0UhRV3g==
Date: Wed, 21 Feb 2024 20:18:00 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 Rob Clark <robdclark@chromium.org>, stable@vger.kernel.org
Subject: Re: [PATCH 4/6] soc: qcom: pmic_glink: Fix boot when QRTR=m
Message-ID: <zakgvxtn53vos36f64wujtkvy5f2na73flojifg5gzs7va65n2@fj6bjleqng7h>
References: <20240217150228.5788-1-johan+linaro@kernel.org>
 <20240217150228.5788-5-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240217150228.5788-5-johan+linaro@kernel.org>
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

On Sat, Feb 17, 2024 at 04:02:26PM +0100, Johan Hovold wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> We need to bail out before adding/removing devices if we are going to
> -EPROBE_DEFER. Otherwise boot can get stuck in a probe deferral loop due
> to a long-standing issue in driver core (see fbc35b45f9f6 ("Add
> documentation on meaning of -EPROBE_DEFER")).
> 
> Deregistering the altmode child device can potentially also trigger bugs
> in the DRM bridge implementation, which does not expect bridges to go
> away.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Link: https://lore.kernel.org/r/20231213210644.8702-1-robdclark@gmail.com
> [ johan: rebase on 6.8-rc4, amend commit message and mention DRM ]
> Fixes: 58ef4ece1e41 ("soc: qcom: pmic_glink: Introduce base PMIC GLINK driver")
> Cc: stable@vger.kernel.org      # 6.3
> Cc: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  drivers/soc/qcom/pmic_glink.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
> index f4bfd24386f1..f913e9bd57ed 100644
> --- a/drivers/soc/qcom/pmic_glink.c
> +++ b/drivers/soc/qcom/pmic_glink.c
> @@ -265,10 +265,17 @@ static int pmic_glink_probe(struct platform_device *pdev)
>  
>  	pg->client_mask = *match_data;
>  
> +	pg->pdr = pdr_handle_alloc(pmic_glink_pdr_callback, pg);
> +	if (IS_ERR(pg->pdr)) {
> +		ret = dev_err_probe(&pdev->dev, PTR_ERR(pg->pdr),
> +				    "failed to initialize pdr\n");
> +		return ret;
> +	}
> +
>  	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI)) {
>  		ret = pmic_glink_add_aux_device(pg, &pg->ucsi_aux, "ucsi");
>  		if (ret)
> -			return ret;
> +			goto out_release_pdr_handle;
>  	}
>  	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_ALTMODE)) {
>  		ret = pmic_glink_add_aux_device(pg, &pg->altmode_aux, "altmode");
> @@ -281,17 +288,11 @@ static int pmic_glink_probe(struct platform_device *pdev)
>  			goto out_release_altmode_aux;
>  	}
>  
> -	pg->pdr = pdr_handle_alloc(pmic_glink_pdr_callback, pg);
> -	if (IS_ERR(pg->pdr)) {
> -		ret = dev_err_probe(&pdev->dev, PTR_ERR(pg->pdr), "failed to initialize pdr\n");
> -		goto out_release_aux_devices;
> -	}
> -
>  	service = pdr_add_lookup(pg->pdr, "tms/servreg", "msm/adsp/charger_pd");
>  	if (IS_ERR(service)) {
>  		ret = dev_err_probe(&pdev->dev, PTR_ERR(service),
>  				    "failed adding pdr lookup for charger_pd\n");
> -		goto out_release_pdr_handle;
> +		goto out_release_aux_devices;
>  	}
>  
>  	mutex_lock(&__pmic_glink_lock);
> @@ -300,8 +301,6 @@ static int pmic_glink_probe(struct platform_device *pdev)
>  
>  	return 0;
>  
> -out_release_pdr_handle:
> -	pdr_handle_release(pg->pdr);
>  out_release_aux_devices:
>  	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_BATT))
>  		pmic_glink_del_aux_device(pg, &pg->ps_aux);
> @@ -311,6 +310,8 @@ static int pmic_glink_probe(struct platform_device *pdev)
>  out_release_ucsi_aux:
>  	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI))
>  		pmic_glink_del_aux_device(pg, &pg->ucsi_aux);
> +out_release_pdr_handle:
> +	pdr_handle_release(pg->pdr);
>  
>  	return ret;
>  }
> -- 
> 2.43.0
> 
