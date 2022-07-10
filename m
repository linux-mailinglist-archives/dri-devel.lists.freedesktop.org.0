Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAF956D0ED
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 21:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB9818AAFD;
	Sun, 10 Jul 2022 19:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D4118AB00
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 19:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=W3z8QjY2NDvbGYjUALmDzkecOhbyZDY04ZL/YMcdLsQ=;
 b=SfJNs4yOIV6v/7RLmTLmgPMMpH42DIp+oCh6B7Gro2ynvRWo8cKoqJoFh3o1Ak3DiVeQ5iETK2stn
 16+8Y8GA8el0OKJJR/etDnwNX/NbUqgYyAiWXpL+BqgwWVvcAmzIefNIXnB7oITEn04LYd+5SXBEZt
 KrQukCLoO36Q51eRkf10Ono1G1ih7mnIT3K/D2pIWh/j4zBdw4mwQl77zqmcZhovkPlQ43q6kwzQ1H
 NxTvuxr/0yB1dTc7H0zs3YQkfD6VmG8YrhaX1bETiF/EwlUms5FDKFNX0NYvgDhcD/wdpy3mhPkSFr
 gt4zONdiLdgNFTSKhxV0yOFULyjwZJA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=W3z8QjY2NDvbGYjUALmDzkecOhbyZDY04ZL/YMcdLsQ=;
 b=2Yaowkg52oe7UuWCqGUIf2aI+XxHRdYatqobOzQiTqvQyUVKmzjc1eTn3wJSEQW7R75/+dnn0stgS
 Yjy9pnnAg==
X-HalOne-Cookie: bd4b5f6c7dae9ce210b009c869a79a2c6528271d
X-HalOne-ID: 217c681d-0083-11ed-be7e-d0431ea8bb03
Received: from mailproxy4.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 217c681d-0083-11ed-be7e-d0431ea8bb03;
 Sun, 10 Jul 2022 19:04:32 +0000 (UTC)
Date: Sun, 10 Jul 2022 21:04:30 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [RFC PATCH 1/3] drm/bridge: ti-sn65dsi86: switch to atomic ops
Message-ID: <YssivkHHpKFhw3cr@ravnborg.org>
References: <20220710184536.172705-1-dmitry.baryshkov@linaro.org>
 <20220710184536.172705-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710184536.172705-2-dmitry.baryshkov@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On Sun, Jul 10, 2022 at 09:45:34PM +0300, Dmitry Baryshkov wrote:
> Make ti-sn65dsi86 use atomic_enable / atomic_disable / atomic_pre_enable
> / atomic_post_disable rather than their non-atomic versions.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

a more or less identical patch was applied to drm-misc-next
the other day.
See d8b599bf625d1d818fdbb322a272fd2a5ea32e38.

	Sam

> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 8cad662de9bb..01171547f638 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -752,7 +752,8 @@ ti_sn_bridge_mode_valid(struct drm_bridge *bridge,
>  	return MODE_OK;
>  }
>  
> -static void ti_sn_bridge_disable(struct drm_bridge *bridge)
> +static void ti_sn_bridge_atomic_disable(struct drm_bridge *bridge,
> +					struct drm_bridge_state *old_bridge_state)
>  {
>  	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>  
> @@ -1011,7 +1012,8 @@ static int ti_sn_link_training(struct ti_sn65dsi86 *pdata, int dp_rate_idx,
>  	return ret;
>  }
>  
> -static void ti_sn_bridge_enable(struct drm_bridge *bridge)
> +static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
> +				       struct drm_bridge_state *old_bridge_state)
>  {
>  	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>  	const char *last_err_str = "No supported DP rate";
> @@ -1080,7 +1082,8 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>  			   VSTREAM_ENABLE);
>  }
>  
> -static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
> +static void ti_sn_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> +					   struct drm_bridge_state *old_bridge_state)
>  {
>  	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>  
> @@ -1093,7 +1096,8 @@ static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
>  	usleep_range(100, 110);
>  }
>  
> -static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
> +static void ti_sn_bridge_atomic_post_disable(struct drm_bridge *bridge,
> +					     struct drm_bridge_state *old_bridge_state)
>  {
>  	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>  
> @@ -1114,10 +1118,10 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
>  	.attach = ti_sn_bridge_attach,
>  	.detach = ti_sn_bridge_detach,
>  	.mode_valid = ti_sn_bridge_mode_valid,
> -	.pre_enable = ti_sn_bridge_pre_enable,
> -	.enable = ti_sn_bridge_enable,
> -	.disable = ti_sn_bridge_disable,
> -	.post_disable = ti_sn_bridge_post_disable,
> +	.atomic_pre_enable = ti_sn_bridge_atomic_pre_enable,
> +	.atomic_enable = ti_sn_bridge_atomic_enable,
> +	.atomic_disable = ti_sn_bridge_atomic_disable,
> +	.atomic_post_disable = ti_sn_bridge_atomic_post_disable,
>  };
>  
>  static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
> -- 
> 2.35.1
