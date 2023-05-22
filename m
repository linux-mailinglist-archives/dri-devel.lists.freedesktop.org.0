Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EAB70CD66
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 00:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A1810E38A;
	Mon, 22 May 2023 22:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46B310E38A;
 Mon, 22 May 2023 22:02:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 340A1621CD;
 Mon, 22 May 2023 22:02:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FFF2C433D2;
 Mon, 22 May 2023 22:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684792922;
 bh=/3PSYcNTkprXMxayW/VKVvfsLYqzESgwVGZjk8vwCiQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e4OOLw8pP9bbuwM5Ur4+Kd6adOtWIc+sGokc4Fn60e12VA0vyD8CJMCs6zXsbsWX2
 6/s/IlH1tumo87ga7W1kbjLQDiJ3nABelC5zbNzCr3jK5fVpGINr7j7JR5qXkMLhka
 ouXgHyWPlYjYEaBlZC0S+/JJs1/hGB+26SDhS9ihwHINTb7O05TX4qYwu8Z1pG+ScM
 5aW1b02oqGfZp5Qb5MxxtcyKRd91XJ3aW5P0lgcRmJYGvZoBTZdXPLeJJ5DYbA/YPK
 xHPXfoMhgusYtkwex1f7Buiu2lF1ov9awfbfzAQzpB5bw7SM4j5gZfhmFCCJklSywo
 ml+5kB8QqjLjA==
Date: Mon, 22 May 2023 15:05:55 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v3] drm/msm/dp: enable HDP plugin/unplugged interrupts at
 hpd_enable/disable
Message-ID: <20230522220555.7ood44kavjzzg3lv@ripper>
References: <1684791092-1822-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1684791092-1822-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, quic_jesszhan@quicinc.com, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, swboyd@chromium.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 22, 2023 at 02:31:32PM -0700, Kuogee Hsieh wrote:
> The internal_hpd flag is set to true by dp_bridge_hpd_enable() and set to
> false by dp_bridge_hpd_disable() to handle GPIO pinmuxed into DP controller
> case. HDP related interrupts can not be enabled until internal_hpd is set
> to true. At current implementation dp_display_config_hpd() will initialize
> DP host controller first followed by enabling HDP related interrupts if
> internal_hpd was true at that time. Enable HDP related interrupts depends on
> internal_hpd status may leave system with DP driver host is in running state
> but without HDP related interrupts being enabled. This will prevent external
> display from being detected. Eliminated this dependency by moving HDP related
> interrupts enable/disable be done at dp_bridge_hpd_enable/disable() directly
> regardless of internal_hpd status.
> 

Thanks Kuogee, this looks quite good to me. But...

> Changes in V3:
> -- dp_catalog_ctrl_hpd_enable() and dp_catalog_ctrl_hpd_disable()
> -- rewording ocmmit text
> 
> Fixes: cd198caddea7 ("drm/msm/dp: Rely on hpd_enable/disable callbacks")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 15 +++++++-
>  drivers/gpu/drm/msm/dp/dp_catalog.h |  3 +-
>  drivers/gpu/drm/msm/dp/dp_display.c | 70 +++++++++++--------------------------
>  3 files changed, 37 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 7a8cf1c..5142aeb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -620,7 +620,7 @@ void dp_catalog_hpd_config_intr(struct dp_catalog *dp_catalog,
>  				config & DP_DP_HPD_INT_MASK);
>  }
>  
> -void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog)
> +void dp_catalog_ctrl_hpd_enable(struct dp_catalog *dp_catalog)
>  {
>  	struct dp_catalog_private *catalog = container_of(dp_catalog,
>  				struct dp_catalog_private, dp_catalog);
> @@ -635,6 +635,19 @@ void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog)
>  	dp_write_aux(catalog, REG_DP_DP_HPD_CTRL, DP_DP_HPD_CTRL_HPD_EN);
>  }
>  
> +void dp_catalog_ctrl_hpd_disable(struct dp_catalog *dp_catalog)
> +{
> +	struct dp_catalog_private *catalog = container_of(dp_catalog,
> +				struct dp_catalog_private, dp_catalog);
> +
> +	u32 reftimer = dp_read_aux(catalog, REG_DP_DP_HPD_REFTIMER);
> +
> +	reftimer &= ~DP_DP_HPD_REFTIMER_ENABLE;
> +	dp_write_aux(catalog, REG_DP_DP_HPD_REFTIMER, reftimer);
> +
> +	dp_write_aux(catalog, REG_DP_DP_HPD_CTRL, 0);
> +}
> +
>  static void dp_catalog_enable_sdp(struct dp_catalog_private *catalog)
>  {
>  	/* trigger sdp */
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 82376a2..38786e8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -104,7 +104,8 @@ bool dp_catalog_ctrl_mainlink_ready(struct dp_catalog *dp_catalog);
>  void dp_catalog_ctrl_enable_irq(struct dp_catalog *dp_catalog, bool enable);
>  void dp_catalog_hpd_config_intr(struct dp_catalog *dp_catalog,
>  			u32 intr_mask, bool en);
> -void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog);
> +void dp_catalog_ctrl_hpd_enable(struct dp_catalog *dp_catalog);
> +void dp_catalog_ctrl_hpd_disable(struct dp_catalog *dp_catalog);
>  void dp_catalog_ctrl_config_psr(struct dp_catalog *dp_catalog);
>  void dp_catalog_ctrl_set_psr(struct dp_catalog *dp_catalog, bool enter);
>  u32 dp_catalog_link_is_connected(struct dp_catalog *dp_catalog);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 3e13acdf..69bbc5f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -615,12 +615,6 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
>  		dp->hpd_state = ST_MAINLINK_READY;
>  	}
>  
> -	/* enable HDP irq_hpd/replug interrupt */
> -	if (dp->dp_display.internal_hpd)
> -		dp_catalog_hpd_config_intr(dp->catalog,
> -					   DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK,
> -					   true);
> -
>  	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
>  			dp->dp_display.connector_type, state);
>  	mutex_unlock(&dp->event_mutex);
> @@ -658,12 +652,6 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>  	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
>  			dp->dp_display.connector_type, state);
>  
> -	/* disable irq_hpd/replug interrupts */
> -	if (dp->dp_display.internal_hpd)
> -		dp_catalog_hpd_config_intr(dp->catalog,
> -					   DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK,
> -					   false);
> -
>  	/* unplugged, no more irq_hpd handle */
>  	dp_del_event(dp, EV_IRQ_HPD_INT);
>  
> @@ -687,10 +675,6 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>  		return 0;
>  	}
>  
> -	/* disable HPD plug interrupts */
> -	if (dp->dp_display.internal_hpd)
> -		dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, false);
> -
>  	/*
>  	 * We don't need separate work for disconnect as
>  	 * connect/attention interrupts are disabled
> @@ -706,10 +690,6 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>  	/* signal the disconnect event early to ensure proper teardown */
>  	dp_display_handle_plugged_change(&dp->dp_display, false);
>  
> -	/* enable HDP plug interrupt to prepare for next plugin */
> -	if (dp->dp_display.internal_hpd)
> -		dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, true);
> -
>  	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
>  			dp->dp_display.connector_type, state);
>  
> @@ -1082,26 +1062,6 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
>  	mutex_unlock(&dp_display->event_mutex);
>  }
>  
> -static void dp_display_config_hpd(struct dp_display_private *dp)
> -{
> -
> -	dp_display_host_init(dp);
> -	dp_catalog_ctrl_hpd_config(dp->catalog);
> -
> -	/* Enable plug and unplug interrupts only if requested */
> -	if (dp->dp_display.internal_hpd)
> -		dp_catalog_hpd_config_intr(dp->catalog,
> -				DP_DP_HPD_PLUG_INT_MASK |
> -				DP_DP_HPD_UNPLUG_INT_MASK,
> -				true);
> -
> -	/* Enable interrupt first time
> -	 * we are leaving dp clocks on during disconnect
> -	 * and never disable interrupt
> -	 */
> -	enable_irq(dp->irq);

...we need dp->irq enabled for handling the other interrupts, otherwise
e.g. AUX transfers will time out.

I added enable_irq(dp_priv->irq) to the EV_HPD_INIT_SETUP case below,
just for testing, and with that the patch seems to be working fine.


Is there any reason why we need to delay its enablement to after we
unmask the HPD interrupts?

Regards,
Bjorn

> -}
> -
>  void dp_display_set_psr(struct msm_dp *dp_display, bool enter)
>  {
>  	struct dp_display_private *dp;
> @@ -1176,7 +1136,7 @@ static int hpd_event_thread(void *data)
>  
>  		switch (todo->event_id) {
>  		case EV_HPD_INIT_SETUP:
> -			dp_display_config_hpd(dp_priv);
> +			dp_display_host_init(dp_priv);
>  			break;
>  		case EV_HPD_PLUG_INT:
>  			dp_hpd_plug_handle(dp_priv, todo->data);
> @@ -1394,13 +1354,8 @@ static int dp_pm_resume(struct device *dev)
>  	/* turn on dp ctrl/phy */
>  	dp_display_host_init(dp);
>  
> -	dp_catalog_ctrl_hpd_config(dp->catalog);
> -
> -	if (dp->dp_display.internal_hpd)
> -		dp_catalog_hpd_config_intr(dp->catalog,
> -				DP_DP_HPD_PLUG_INT_MASK |
> -				DP_DP_HPD_UNPLUG_INT_MASK,
> -				true);
> +	if (dp_display->is_edp)
> +		dp_catalog_ctrl_hpd_enable(dp->catalog);
>  
>  	if (dp_catalog_link_is_connected(dp->catalog)) {
>  		/*
> @@ -1568,7 +1523,7 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
>  
>  	if (aux_bus && dp->is_edp) {
>  		dp_display_host_init(dp_priv);
> -		dp_catalog_ctrl_hpd_config(dp_priv->catalog);
> +		dp_catalog_ctrl_hpd_enable(dp_priv->catalog);
>  		dp_display_host_phy_init(dp_priv);
>  		enable_irq(dp_priv->irq);
>  
> @@ -1801,16 +1756,33 @@ void dp_bridge_hpd_enable(struct drm_bridge *bridge)
>  {
>  	struct msm_dp_bridge *dp_bridge = to_dp_bridge(bridge);
>  	struct msm_dp *dp_display = dp_bridge->dp_display;
> +	struct dp_display_private *dp = container_of(dp_display, struct dp_display_private, dp_display);
> +
> +	mutex_lock(&dp->event_mutex);
> +	dp_catalog_ctrl_hpd_enable(dp->catalog);
> +
> +	/* enable HDP interrupts */
> +	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, true);
> +
> +	enable_irq(dp->irq);
>  
>  	dp_display->internal_hpd = true;
> +	mutex_unlock(&dp->event_mutex);
>  }
>  
>  void dp_bridge_hpd_disable(struct drm_bridge *bridge)
>  {
>  	struct msm_dp_bridge *dp_bridge = to_dp_bridge(bridge);
>  	struct msm_dp *dp_display = dp_bridge->dp_display;
> +	struct dp_display_private *dp = container_of(dp_display, struct dp_display_private, dp_display);
> +
> +	mutex_lock(&dp->event_mutex);
> +	/* disable HDP interrupts */
> +	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, false);
> +	dp_catalog_ctrl_hpd_disable(dp->catalog);
>  
>  	dp_display->internal_hpd = false;
> +	mutex_unlock(&dp->event_mutex);
>  }
>  
>  void dp_bridge_hpd_notify(struct drm_bridge *bridge,
> -- 
> 2.7.4
> 
