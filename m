Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E20F785EF1E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 03:23:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC0310E85B;
	Thu, 22 Feb 2024 02:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T2q7x03B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D8710E85D;
 Thu, 22 Feb 2024 02:23:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 654D0CE20F0;
 Thu, 22 Feb 2024 02:23:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C481DC433C7;
 Thu, 22 Feb 2024 02:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708568587;
 bh=MMlkjmsJsicEDs7i5WxUmhs8W/iz3PM4L1aTQKsYqS4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T2q7x03BsCLrEV+dAiEnodN6qvtQf8spHVxVTLO7VN2AznIQ7r0uW+vkoD+o0npAA
 vve9abeOEDefbhv27dw+nVSB+Gz2M2c1QAy78CDkf6gRh+YpnvxYTb61AKFYdSwYhy
 dgzQPjHMwmBREv8OE/+dcm0+nFwcKqxjH5w1W33PcH8pwcGJEJf3JeCBweF09scS+L
 yGa57tso+nIIgKFb7AyKPZFM/z6hICesMczCh6qFE8QjMwEA6WX+ATklittaMdmyem
 D3bHL21fCNo/e4779NOodc6DctIUc9pjMXmBLuDhjQTC62dkPV0nnk12nu2yHntbg4
 SspNPWE022PBQ==
Date: Wed, 21 Feb 2024 20:23:03 -0600
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
Subject: Re: [PATCH 6/6] phy: qcom-qmp-combo: fix type-c switch registration
Message-ID: <7emxapsbkv5evnuhpr4uanr5fhnqaxy6thow4y3zlfwvnzbpdk@ioyynlfubfsr>
References: <20240217150228.5788-1-johan+linaro@kernel.org>
 <20240217150228.5788-7-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240217150228.5788-7-johan+linaro@kernel.org>
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

On Sat, Feb 17, 2024 at 04:02:28PM +0100, Johan Hovold wrote:
> Due to a long-standing issue in driver core, drivers may not probe defer
> after having registered child devices to avoid triggering a probe
> deferral loop (see fbc35b45f9f6 ("Add documentation on meaning of
> -EPROBE_DEFER")).
> 
> Move registration of the typec switch to after looking up clocks and
> other resources.
> 
> Note that PHY creation can in theory also trigger a probe deferral when
> a 'phy' supply is used. This does not seem to affect the QMP PHY driver
> but the PHY subsystem should be reworked to address this (i.e. by
> separating initialisation and registration of the PHY).
> 
> Fixes: 2851117f8f42 ("phy: qcom-qmp-combo: Introduce orientation switching")
> Cc: stable@vger.kernel.org      # 6.5
> Cc: Bjorn Andersson <quic_bjorande@quicinc.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index e19d6a084f10..17c4ad7553a5 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -3562,10 +3562,6 @@ static int qmp_combo_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	ret = qmp_combo_typec_switch_register(qmp);
> -	if (ret)
> -		return ret;
> -
>  	/* Check for legacy binding with child nodes. */
>  	usb_np = of_get_child_by_name(dev->of_node, "usb3-phy");
>  	if (usb_np) {
> @@ -3585,6 +3581,10 @@ static int qmp_combo_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_node_put;
>  
> +	ret = qmp_combo_typec_switch_register(qmp);
> +	if (ret)
> +		goto err_node_put;
> +
>  	ret = drm_aux_bridge_register(dev);
>  	if (ret)
>  		goto err_node_put;
> -- 
> 2.43.0
> 
