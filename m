Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0E285EF19
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 03:21:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8234910E85A;
	Thu, 22 Feb 2024 02:21:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lUML9HjG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF4C710E859;
 Thu, 22 Feb 2024 02:21:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F2279616D5;
 Thu, 22 Feb 2024 02:21:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE407C433C7;
 Thu, 22 Feb 2024 02:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708568494;
 bh=7XDJKPJHyfF1OzvneqeZT2dRiORVLAx3GebsWrRsA3M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lUML9HjGLxBqhE6KwPXjXIlXMbbglCyZ42O6HLy6PH2G4HeFuL6lWnkf7EmTKTqPs
 Tznree3UVXwLGVPFQ3+CHpQ1F7a0y5Tuzrn0pCwpCybmc5zrw13xWUmjXETJo5eYuQ
 iyJirYR3ha6AWmSxwEXfkUQojDDgUYCdzHeeibatgww1QhohaHXtdG/ojeOeG+gl6N
 7SeqHlllu4G8bz37Qg8F1VHgQYfLT7f01WdDZWdlfolvohW6J1Crihs8g74OIg4h43
 PIkQNx0lq7QmzKvBkzP6g3rbCqEwbY2hLjeCHqVxdUhXZ4ydicNNObDLzlrz+Uze4q
 jYJadycT4CV6A==
Date: Wed, 21 Feb 2024 20:21:30 -0600
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
 stable@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH 5/6] phy: qcom-qmp-combo: fix drm bridge registration
Message-ID: <36tnarj4tgxceapo4fdvp5novqm2a6qdwqeox6rmhobdi6y3vj@kezj3wl4jixi>
References: <20240217150228.5788-1-johan+linaro@kernel.org>
 <20240217150228.5788-6-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240217150228.5788-6-johan+linaro@kernel.org>
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

On Sat, Feb 17, 2024 at 04:02:27PM +0100, Johan Hovold wrote:
> Due to a long-standing issue in driver core, drivers may not probe defer
> after having registered child devices to avoid triggering a probe
> deferral loop (see fbc35b45f9f6 ("Add documentation on meaning of
> -EPROBE_DEFER")).
> 
> This could potentially also trigger a bug in the DRM bridge
> implementation which does not expect bridges to go away even if device
> links may avoid triggering this (when enabled).
> 
> Move registration of the DRM aux bridge to after looking up clocks and
> other resources.
> 
> Note that PHY creation can in theory also trigger a probe deferral when
> a 'phy' supply is used. This does not seem to affect the QMP PHY driver
> but the PHY subsystem should be reworked to address this (i.e. by
> separating initialisation and registration of the PHY).
> 
> Fixes: 35921910bbd0 ("phy: qcom: qmp-combo: switch to DRM_AUX_BRIDGE")
> Fixes: 1904c3f578dc ("phy: qcom-qmp-combo: Introduce drm_bridge")
> Cc: stable@vger.kernel.org      # 6.5
> Cc: Bjorn Andersson <quic_bjorande@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 1ad10110dd25..e19d6a084f10 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -3566,10 +3566,6 @@ static int qmp_combo_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	ret = drm_aux_bridge_register(dev);
> -	if (ret)
> -		return ret;
> -
>  	/* Check for legacy binding with child nodes. */
>  	usb_np = of_get_child_by_name(dev->of_node, "usb3-phy");
>  	if (usb_np) {
> @@ -3589,6 +3585,10 @@ static int qmp_combo_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_node_put;
>  
> +	ret = drm_aux_bridge_register(dev);
> +	if (ret)
> +		goto err_node_put;
> +
>  	pm_runtime_set_active(dev);
>  	ret = devm_pm_runtime_enable(dev);
>  	if (ret)
> -- 
> 2.43.0
> 
