Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A5734DC9F
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 01:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEAD989580;
	Mon, 29 Mar 2021 23:51:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A1289580
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 23:51:12 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1617061872; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=oRzuv5tOAJA9yXWA5RyQvpuL3dZ3lzJ/MaQp4CzmbDA=;
 b=MjGMGHJdEfiBlNFb49SXZRWBXHG8X2gUGLClIGeXh211kxYoI9ofenrXevHT+hpKfNIXt1qa
 lKA+96sEKXqqf6M61n/mNQjYT6bmHyoDwJ1QE38a+hR1t7gNDuVHEFJi82ukbLE7ewkCXHfs
 1egzQiZe/eswqu83zJ2A9qHsU+8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 606267ee876af85fc40f68eb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 29 Mar 2021 23:51:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 05CE3C43467; Mon, 29 Mar 2021 23:51:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 23566C433C6;
 Mon, 29 Mar 2021 23:51:08 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 29 Mar 2021 16:51:08 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v3 14/25] drm/msm/dsi: make save/restore_state
 phy-level functions
In-Reply-To: <20210327110305.3289784-15-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
 <20210327110305.3289784-15-dmitry.baryshkov@linaro.org>
Message-ID: <fe359f280ba68c2fe4f92d70d34cc4a6@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 linux-clk@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-03-27 04:02, Dmitry Baryshkov wrote:
> Morph msm_dsi_pll_save/restore_state() into 
> msm_dsi_phy_save/restore_state(),
> thus removing last bits of knowledge about msm_dsi_pll from 
> dsi_manager.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.h              | 18 ++---------
>  drivers/gpu/drm/msm/dsi/dsi_manager.c      |  6 ++--
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      | 35 +++++++++++++++-------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      | 11 +++++++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c |  2 +-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c  |  2 +-
>  drivers/gpu/drm/msm/dsi/phy/dsi_pll.c      | 26 ----------------
>  drivers/gpu/drm/msm/dsi/phy/dsi_pll.h      | 11 -------
>  8 files changed, 42 insertions(+), 69 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h 
> b/drivers/gpu/drm/msm/dsi/dsi.h
> index 0970f05cd47f..53feea9d30c0 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -92,21 +92,6 @@ static inline bool msm_dsi_device_connected(struct
> msm_dsi *msm_dsi)
> 
>  struct drm_encoder *msm_dsi_get_encoder(struct msm_dsi *msm_dsi);
> 
> -/* dsi pll */
> -struct msm_dsi_pll;
> -#ifdef CONFIG_DRM_MSM_DSI_PLL
> -void msm_dsi_pll_save_state(struct msm_dsi_pll *pll);
> -int msm_dsi_pll_restore_state(struct msm_dsi_pll *pll);
> -#else
> -static inline void msm_dsi_pll_save_state(struct msm_dsi_pll *pll)
> -{
> -}
> -static inline int msm_dsi_pll_restore_state(struct msm_dsi_pll *pll)
> -{
> -	return 0;
> -}
> -#endif
> -
>  /* dsi host */
>  struct msm_dsi_host;
>  int msm_dsi_host_xfer_prepare(struct mipi_dsi_host *host,
> @@ -182,11 +167,12 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
> int src_pll_id,
>  void msm_dsi_phy_disable(struct msm_dsi_phy *phy);
>  void msm_dsi_phy_get_shared_timings(struct msm_dsi_phy *phy,
>  			struct msm_dsi_phy_shared_timings *shared_timing);
> -struct msm_dsi_pll *msm_dsi_phy_get_pll(struct msm_dsi_phy *phy);
>  void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
>  			     enum msm_dsi_phy_usecase uc);
>  int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
>  	struct clk **byte_clk_provider, struct clk **pixel_clk_provider);
> +void msm_dsi_phy_save_state(struct msm_dsi_phy *phy);
> +int msm_dsi_phy_restore_state(struct msm_dsi_phy *phy);
I think renaming these to 
msm_dsi_phy_pll_save_state()/msm_dsi_phy_pll_restore_state()
will be better because internally they are only saving/restoring PLL 
states,
Once thats fixed, please feel free to add :

Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>

> 
>  #endif /* __DSI_CONNECTOR_H__ */
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index 86e36be58701..0c47c5fb1ab3 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -498,7 +498,6 @@ static void dsi_mgr_bridge_post_disable(struct
> drm_bridge *bridge)
>  	struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
>  	struct mipi_dsi_host *host = msm_dsi->host;
>  	struct drm_panel *panel = msm_dsi->panel;
> -	struct msm_dsi_pll *src_pll;
>  	bool is_dual_dsi = IS_DUAL_DSI();
>  	int ret;
> 
> @@ -532,9 +531,8 @@ static void dsi_mgr_bridge_post_disable(struct
> drm_bridge *bridge)
>  								id, ret);
>  	}
> 
> -	/* Save PLL status if it is a clock source */
> -	src_pll = msm_dsi_phy_get_pll(msm_dsi->phy);
> -	msm_dsi_pll_save_state(src_pll);
> +	/* Save PHY status if it is a clock source */
> +	msm_dsi_phy_save_state(msm_dsi->phy);
> 
>  	ret = msm_dsi_host_power_off(host);
>  	if (ret)
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 46561435a27d..176930800082 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -799,9 +799,9 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
> int src_pll_id,
>  	 * source.
>  	 */
>  	if (phy->usecase != MSM_DSI_PHY_SLAVE) {
> -		ret = msm_dsi_pll_restore_state(phy->pll);
> +		ret = msm_dsi_phy_restore_state(phy);
>  		if (ret) {
> -			DRM_DEV_ERROR(dev, "%s: failed to restore pll state, %d\n",
> +			DRM_DEV_ERROR(dev, "%s: failed to restore phy state, %d\n",
>  				__func__, ret);
>  			goto pll_restor_fail;
>  		}
> @@ -838,14 +838,6 @@ void msm_dsi_phy_get_shared_timings(struct
> msm_dsi_phy *phy,
>  	       sizeof(*shared_timings));
>  }
> 
> -struct msm_dsi_pll *msm_dsi_phy_get_pll(struct msm_dsi_phy *phy)
> -{
> -	if (!phy)
> -		return NULL;
> -
> -	return phy->pll;
> -}
> -
>  void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
>  			     enum msm_dsi_phy_usecase uc)
>  {
> @@ -863,3 +855,26 @@ int msm_dsi_phy_get_clk_provider(struct 
> msm_dsi_phy *phy,
> 
>  	return -EINVAL;
>  }
> +
> +void msm_dsi_phy_save_state(struct msm_dsi_phy *phy)
> +{
> +	if (phy->cfg->pll_ops.save_state) {
> +		phy->cfg->pll_ops.save_state(phy->pll);
> +		phy->pll->state_saved = true;
> +	}
> +}
> +
> +int msm_dsi_phy_restore_state(struct msm_dsi_phy *phy)
> +{
> +	int ret;
> +
> +	if (phy->cfg->pll_ops.restore_state && phy->pll->state_saved) {
> +		ret = phy->cfg->pll_ops.restore_state(phy->pll);
> +		if (ret)
> +			return ret;
> +
> +		phy->pll->state_saved = false;
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 2c5196844ba9..8133732e0c7f 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -6,6 +6,7 @@
>  #ifndef __DSI_PHY_H__
>  #define __DSI_PHY_H__
> 
> +#include <linux/clk-provider.h>
>  #include <linux/regulator/consumer.h>
> 
>  #include "dsi.h"
> @@ -13,6 +14,16 @@
>  #define dsi_phy_read(offset) msm_readl((offset))
>  #define dsi_phy_write(offset, data) msm_writel((data), (offset))
> 
> +struct msm_dsi_pll {
> +	struct clk_hw	clk_hw;
> +	bool		pll_on;
> +	bool		state_saved;
> +
> +	const struct msm_dsi_phy_cfg *cfg;
> +};
> +
> +#define hw_clk_to_pll(x) container_of(x, struct msm_dsi_pll, clk_hw)
> +
>  struct msm_dsi_phy_ops {
>  	int (*pll_init)(struct msm_dsi_phy *phy);
>  	int (*enable)(struct msm_dsi_phy *phy, int src_pll_id,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index 6300b92c65eb..e0df12a841b2 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -782,7 +782,7 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy 
> *phy)
>  	phy->pll = pll;
> 
>  	/* TODO: Remove this when we have proper display handover support */
> -	msm_dsi_pll_save_state(pll);
> +	msm_dsi_phy_save_state(phy);
> 
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index c482e51d1bee..e6c8040e1bd3 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -807,7 +807,7 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy 
> *phy)
>  	phy->pll = pll;
> 
>  	/* TODO: Remove this when we have proper display handover support */
> -	msm_dsi_pll_save_state(pll);
> +	msm_dsi_phy_save_state(phy);
> 
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
> index 96de79b94f1b..652c2d6bfeec 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
> @@ -56,29 +56,3 @@ void msm_dsi_pll_helper_clk_unprepare(struct clk_hw 
> *hw)
> 
>  	pll->pll_on = false;
>  }
> -
> -/*
> - * DSI PLL API
> - */
> -void msm_dsi_pll_save_state(struct msm_dsi_pll *pll)
> -{
> -	if (pll->cfg->pll_ops.save_state) {
> -		pll->cfg->pll_ops.save_state(pll);
> -		pll->state_saved = true;
> -	}
> -}
> -
> -int msm_dsi_pll_restore_state(struct msm_dsi_pll *pll)
> -{
> -	int ret;
> -
> -	if (pll->cfg->pll_ops.restore_state && pll->state_saved) {
> -		ret = pll->cfg->pll_ops.restore_state(pll);
> -		if (ret)
> -			return ret;
> -
> -		pll->state_saved = false;
> -	}
> -
> -	return 0;
> -}
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
> b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
> index c94f079b8275..eca13cf67c21 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
> @@ -6,21 +6,10 @@
>  #ifndef __DSI_PLL_H__
>  #define __DSI_PLL_H__
> 
> -#include <linux/clk-provider.h>
>  #include <linux/delay.h>
> 
>  #include "dsi.h"
> 
> -struct msm_dsi_pll {
> -	struct clk_hw	clk_hw;
> -	bool		pll_on;
> -	bool		state_saved;
> -
> -	const struct msm_dsi_phy_cfg *cfg;
> -};
> -
> -#define hw_clk_to_pll(x) container_of(x, struct msm_dsi_pll, clk_hw)
> -
>  static inline void pll_write(void __iomem *reg, u32 data)
>  {
>  	msm_writel(data, reg);
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
