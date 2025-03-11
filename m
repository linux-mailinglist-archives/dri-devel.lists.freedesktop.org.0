Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F4DA5C7FE
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 16:39:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD9B10E057;
	Tue, 11 Mar 2025 15:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TzKC5yKE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 414E110E057;
 Tue, 11 Mar 2025 15:39:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 64ADDA451F0;
 Tue, 11 Mar 2025 15:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C324AC4CEE9;
 Tue, 11 Mar 2025 15:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741707596;
 bh=0uaioJB2qNBcM6iTwrAoMMsO3wwEbIudWy2wENjYiLM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TzKC5yKEUVlwntBZl6Bg0L6W4nqeVZP858CD8HC+F/0nA72LQlPvyzv+qendn6xjx
 ZfInROABdvFflu8fEb/92c5/jMMnir9jcERDxZji+bQwGcF/PhnxQLnu82zCXbbHEH
 r9szJQcVJHm/UQs4I1EHaPc40lbsWvAou9ztggjyZCnuqokoiBSq/KjdCmCrlIhRE1
 rfBJnLhrFp6vG//MnAp1+0pIhYW9s9Cd9KtOhSSC7pib6MTehFQWEzUaF7C58tpNIF
 Kcn3FivMNhIIngvj2tq783e/FLNt7eDNtADLkhyuq7ADdn95iiq2Nfkh97CNy0CTSo
 ry7Py+FrYdLzw==
Date: Tue, 11 Mar 2025 17:39:48 +0200
From: Dmitry Baryshkov <lumag@kernel.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run, 
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, 
 krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 quic_abhinavk@quicinc.com, quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: Re: [PATCH v2 08/10] drm/bridge: anx7625: enable HPD interrupts
Message-ID: <5hvpacx3qeqhjqemhqizws4esdhwg7reli77qey2nin2fggljp@ykgyayj2v3e6>
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-9-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311122445.3597100-9-quic_amakhija@quicinc.com>
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

On Tue, Mar 11, 2025 at 05:54:43PM +0530, Ayushi Makhija wrote:
> When device enters the suspend state, it prevents
> HPD interrupts from occurring. To address this,
> add an additional PM runtime vote in hpd_enable().
> This vote is removed in hpd_disable().

Is it really enough to toggle the HPD interrupts? Is there any kind of
programming that should be moved to .hpd_enable() too (so that by
default the bridge doesn't generate HPD interrupts)?

> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 4be34d5c7a3b..764da1c1dc11 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -2474,6 +2474,22 @@ static const struct drm_edid *anx7625_bridge_edid_read(struct drm_bridge *bridge
>  	return anx7625_edid_read(ctx);
>  }
>  
> +static void anx7625_bridge_hpd_enable(struct drm_bridge *bridge)
> +{
> +	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
> +	struct device *dev = ctx->dev;
> +
> +	pm_runtime_get_sync(dev);
> +}
> +
> +static void anx7625_bridge_hpd_disable(struct drm_bridge *bridge)
> +{
> +	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
> +	struct device *dev = ctx->dev;
> +
> +	pm_runtime_put_sync(dev);
> +}
> +
>  static const struct drm_bridge_funcs anx7625_bridge_funcs = {
>  	.attach = anx7625_bridge_attach,
>  	.detach = anx7625_bridge_detach,
> @@ -2487,6 +2503,8 @@ static const struct drm_bridge_funcs anx7625_bridge_funcs = {
>  	.atomic_reset = drm_atomic_helper_bridge_reset,
>  	.detect = anx7625_bridge_detect,
>  	.edid_read = anx7625_bridge_edid_read,
> +	.hpd_enable = anx7625_bridge_hpd_enable,
> +	.hpd_disable = anx7625_bridge_hpd_disable,
>  };
>  
>  static int anx7625_register_i2c_dummy_clients(struct anx7625_data *ctx,
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
