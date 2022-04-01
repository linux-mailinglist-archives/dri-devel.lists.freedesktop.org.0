Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B07A74EE697
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 05:14:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD5710F616;
	Fri,  1 Apr 2022 03:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68BC510F616
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 03:14:11 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-dee0378ce7so1410122fac.4
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 20:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kVZ08yrVARuwkY0AZaafSGG3TPOa5+ixl6TpLnul944=;
 b=U9J5jo6nRhNDB4GM8fjPFzgoCObC9O4VNxH5LDd0E6C9vvNSmOkZRnkOWnsHfdS8eT
 3gPvN/vkh4MeVu5JUyLCOcVH1g6R5HEftX2OXj7OfCF25Ri9pG+pQIvMZ7RVnpABkuuM
 Pa5MEBkQLU6VBgPY1o4LKnMFdBENsN/ijJx7m41ChQWnlsKE7Ha0migRwpO2Oke0kvmq
 gFPZIC8HPhxjSajRGWvPZ3fbrBvYNK1sR9ArhH1MPjAl1g8Ot0494hsX1ZoHt8kC88iL
 9IPtAbt7VoOXJJ0peoEbS5Un/78hdS0daoKrz1n8QFvlxXI7JPiaQkXSYfdC7L6U5C01
 IsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kVZ08yrVARuwkY0AZaafSGG3TPOa5+ixl6TpLnul944=;
 b=B0IEiRdeZLQHZHZrSZ/KL6XUMpsjrm4f3f5xCIaRWHD/r1UO/OY93FGNSrTd+r1QOU
 11Ta7STIgAN1GkHqtMO3qJ746TE50RaX0c1XT8asNO2lpL2lMOFY1gBhnYmDSMCo+RGy
 JZ/pZ8CFMtkoIwL4fiAGxQtqO1mI7SnoO86RqDL0yLWVdCMWq18vjNRhy9ew0DQXtToI
 w6kFomZGgM2qrlrXXaGaTo1ZuXLz3RxmyxO+DWAWJpr31rw1ozx12mmB1QoNwJuWRlpg
 J74nbL2i9xrrHE5eIbG2NU7aZDAAMMzC8JEzFMC+Ddav293/lPt5VYnpe3e6rhdqCuRR
 2gfA==
X-Gm-Message-State: AOAM531pq59TliK3/BCdeiZhjIITkaP4GGyXSl77y71+8Fx9TyNQV3YK
 LbSI1qXitLug4LfLnhXbxPqCrA==
X-Google-Smtp-Source: ABdhPJyRO/jnaOotnxXYf0107pZwgjHxW4B3HwOkkI//8UZRvs4X/rTMa4aad0gyzBD2JB88+y7rCQ==
X-Received: by 2002:a05:6870:c1cb:b0:dd:b81f:3ea1 with SMTP id
 i11-20020a056870c1cb00b000ddb81f3ea1mr4025235oad.131.1648782850625; 
 Thu, 31 Mar 2022 20:14:10 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 w8-20020aca3008000000b002ef7e3ad3b8sm525621oiw.29.2022.03.31.20.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 20:14:09 -0700 (PDT)
Date: Thu, 31 Mar 2022 20:16:38 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3] drm: of: Properly try all possible cases for
 bridge/panel detection
Message-ID: <YkZulslrzeurp43U@ripper>
References: <20220329132732.628474-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220329132732.628474-1-paul.kocialkowski@bootlin.com>
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 29 Mar 06:27 PDT 2022, Paul Kocialkowski wrote:

> While bridge/panel detection was initially relying on the usual
> port/ports-based of graph detection, it was recently changed to
> perform the lookup on any child node that is not port/ports
> instead when such a node is available, with no fallback on the
> usual way.
> 
> This results in breaking detection when a child node is present
> but does not contain any panel or bridge node, even when the
> usual port/ports-based of graph is there.
> 
> In order to support both situations properly, this commit reworks
> the logic to try both options and not just one of the two: it will
> only return -EPROBE_DEFER when both have failed.
> 

Thanks for your patch Paul, it fixed a regression on a device where I
have a eDP bridge with an of_graph and a aux-bus defined.

But unfortunately it does not resolve the regression I have for the
USB based DisplayPort setup described below.


In the Qualcomm DisplayPort driver We're calling:

	devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);

and with the following DT snippet the behavior changed:

displayport-controller@ae90000 {
	compatible = "qcom,sc8180x-dp";
	...

	operating-points-v2 = <&dp0_opp_table>;

	ports {
		#address-cells = <1>;
		#size-cells = <0>;

		port@0 {
			reg = <0>;
			dp0_in: endpoint {
				remote-endpoint = <&display_driver>;
			};
		};
	};

	dp0_opp_table: opp-table {
		...;
	};
};

Prior to the introduction of 80253168dbfd ("drm: of: Lookup if child
node has panel or bridge") this would return -ENODEV, so we could
differentiate the case when we have a statically defined eDP panel from
that of a dynamically attached (over USB) DP panel.

Prior to your change, above case without the opp-table node would have
still returned -ENODEV.

But now this will just return -EPROBE_DEFER in both cases.


I thought the appropriate method of referencing the dsi panel was to
actually reference that using the of_graph, even though it's a child of
the dsi controller - that's at least how we've done it in e.g. [1].
I find this to be much nicer than to just blindly define that all
children of any sort of display controller must be a bridge or a panel.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/sdm845-mtp.dts#n436

Regards,
Bjorn

> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Fixes: 80253168dbfd ("drm: of: Lookup if child node has panel or bridge")
> ---
> 
> Changes since v2:
> - Removed unnecessary else statement and added a comment about
>   clearing the panel pointer on error.
> 
> Changes since v1:
> - Renamed remote to node;
> - Renamed helper to find_panel_or_bridge;
> - Cleared bridge pointer early;
> - Returned early to make the code more concise;
> 
> ---
>  drivers/gpu/drm/drm_of.c | 99 ++++++++++++++++++++--------------------
>  1 file changed, 50 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> index 9d90cd75c457..8716da6369a6 100644
> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -219,6 +219,29 @@ int drm_of_encoder_active_endpoint(struct device_node *node,
>  }
>  EXPORT_SYMBOL_GPL(drm_of_encoder_active_endpoint);
>  
> +static int find_panel_or_bridge(struct device_node *node,
> +				struct drm_panel **panel,
> +				struct drm_bridge **bridge)
> +{
> +	if (panel) {
> +		*panel = of_drm_find_panel(node);
> +		if (!IS_ERR(*panel))
> +			return 0;
> +
> +		/* Clear the panel pointer in case of error. */
> +		*panel = NULL;
> +	}
> +
> +	/* No panel found yet, check for a bridge next. */
> +	if (bridge) {
> +		*bridge = of_drm_find_bridge(node);
> +		if (*bridge)
> +			return 0;
> +	}
> +
> +	return -EPROBE_DEFER;
> +}
> +
>  /**
>   * drm_of_find_panel_or_bridge - return connected panel or bridge device
>   * @np: device tree node containing encoder output ports
> @@ -241,66 +264,44 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
>  				struct drm_panel **panel,
>  				struct drm_bridge **bridge)
>  {
> -	int ret = -EPROBE_DEFER;
> -	struct device_node *remote;
> +	struct device_node *node;
> +	int ret;
>  
>  	if (!panel && !bridge)
>  		return -EINVAL;
> +
>  	if (panel)
>  		*panel = NULL;
> -
> -	/**
> -	 * Devices can also be child nodes when we also control that device
> -	 * through the upstream device (ie, MIPI-DCS for a MIPI-DSI device).
> -	 *
> -	 * Lookup for a child node of the given parent that isn't either port
> -	 * or ports.
> -	 */
> -	for_each_available_child_of_node(np, remote) {
> -		if (of_node_name_eq(remote, "port") ||
> -		    of_node_name_eq(remote, "ports"))
> -			continue;
> -
> -		goto of_find_panel_or_bridge;
> +	if (bridge)
> +		*bridge = NULL;
> +
> +	/* Check for a graph on the device node first. */
> +	if (of_graph_is_present(np)) {
> +		node = of_graph_get_remote_node(np, port, endpoint);
> +		if (node) {
> +			ret = find_panel_or_bridge(node, panel, bridge);
> +			of_node_put(node);
> +
> +			if (!ret)
> +				return 0;
> +		}
>  	}
>  
> -	/*
> -	 * of_graph_get_remote_node() produces a noisy error message if port
> -	 * node isn't found and the absence of the port is a legit case here,
> -	 * so at first we silently check whether graph presents in the
> -	 * device-tree node.
> -	 */
> -	if (!of_graph_is_present(np))
> -		return -ENODEV;
> -
> -	remote = of_graph_get_remote_node(np, port, endpoint);
> -
> -of_find_panel_or_bridge:
> -	if (!remote)
> -		return -ENODEV;
> +	/* Otherwise check for any child node other than port/ports. */
> +	for_each_available_child_of_node(np, node) {
> +		if (of_node_name_eq(node, "port") ||
> +		    of_node_name_eq(node, "ports"))
> +			continue;
>  
> -	if (panel) {
> -		*panel = of_drm_find_panel(remote);
> -		if (!IS_ERR(*panel))
> -			ret = 0;
> -		else
> -			*panel = NULL;
> -	}
> -
> -	/* No panel found yet, check for a bridge next. */
> -	if (bridge) {
> -		if (ret) {
> -			*bridge = of_drm_find_bridge(remote);
> -			if (*bridge)
> -				ret = 0;
> -		} else {
> -			*bridge = NULL;
> -		}
> +		ret = find_panel_or_bridge(node, panel, bridge);
> +		of_node_put(node);
>  
> +		/* Stop at the first found occurrence. */
> +		if (!ret)
> +			return 0;
>  	}
>  
> -	of_node_put(remote);
> -	return ret;
> +	return -EPROBE_DEFER;
>  }
>  EXPORT_SYMBOL_GPL(drm_of_find_panel_or_bridge);
>  
> -- 
> 2.35.1
> 
