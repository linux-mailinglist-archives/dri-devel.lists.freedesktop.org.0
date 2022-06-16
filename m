Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AF454D717
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 03:33:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC7D4113B00;
	Thu, 16 Jun 2022 01:32:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33EF7113AF4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 01:32:57 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id k24so245616oij.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 18:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=cmBS7CFdpC1cMe1f4cNFc6/OeyKM3Qag/eLbDzrE//0=;
 b=En9sPerFTSEOQ3e7rRhMjYhhAHZ44gLkbJkXPBe2h9vYCXiOa/rq/jSFmoCMMbkgdf
 PG0vi66r3J/2+l4LUJrHjZ7vLKdbox13uDVVz0C3zYX8WdhHbgMLhPCgqadZlp3GI7TH
 knzfOGGCizc5VN3weWI+jSHVvM37XrGR0Zj8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=cmBS7CFdpC1cMe1f4cNFc6/OeyKM3Qag/eLbDzrE//0=;
 b=BM9Nr7ysEQynwzdjdZxFF8ieUeW9SjfhjWefEI9mFo7etnTVENBqa1IsMtnQHuLluA
 aVn1Tpus8cg7kWOz0K+zI2YhyI4AMj70SYO/k5JDfwiGR1TXrSG/6zRAFRT6OUGpOsAX
 i/YrEN1eUq7vKf9sH/pdEbYT4oX33zlWqS0jxfhmTeo8DrB8qxFujMp3y+HRyEJNZrQR
 mZ/9MGFr7njRJa1GzrQJUMIePEKLRITq+MR6NRGh201Pn6Ua/vkFl+LpoGtbGbhBHLz7
 sOejvRH8kcW1nXoCpA78tPxJZ4w2Zfz99Dpx7uZ7aHZLgkongjj4H8SAd2Jvb6f9ZXJU
 Mqxg==
X-Gm-Message-State: AJIora8MBtpqr630uA6NX9oWM5Z7JltErNOXVQMwYwNEzUE2P7+bZsXD
 1qHJrjTZyKPkOJ+7CxIoACJUowgHPK9egl3KsvOqnQ==
X-Google-Smtp-Source: AGRyM1tRuliVYjN8lp/N+rdkcV6KQ88iFb/kd/yQoKIPHNrs3jcH7COLJ99w9jrqSQ9HJWqK7pMUmqgrSUb/DQj4scQ=
X-Received: by 2002:a05:6808:1703:b0:32e:851e:7f81 with SMTP id
 bc3-20020a056808170300b0032e851e7f81mr1408463oib.63.1655343176352; Wed, 15
 Jun 2022 18:32:56 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jun 2022 18:32:55 -0700
MIME-Version: 1.0
In-Reply-To: <1655308437-1924-1-git-send-email-quic_khsieh@quicinc.com>
References: <1655308437-1924-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 15 Jun 2022 18:32:55 -0700
Message-ID: <CAE-0n51fp3L9DKTZ=yTGGDCzkprd6nCDYLX3fPMoLv3YWtUXiQ@mail.gmail.com>
Subject: Re: [PATCH v7] drm/msm/dp: force link training for display resolution
 change
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-06-15 08:53:57)
> Display resolution change is implemented through drm modeset. Older
> modeset (resolution) has to be disabled first before newer modeset
> (resolution) can be enabled. Display disable will turn off both
> pixel clock and main link clock so that main link have to be
> re-trained during display enable to have new video stream flow
> again. At current implementation, display enable function manually
> kicks up irq_hpd_handle which will read panel link status and start
> link training if link status is not in sync state.
>
> However, there is rare case that a particular panel links status keep
> staying in sync for some period of time after main link had been shut
> down previously at display disabled. In this case, main link retraining
> will not be executed by irq_hdp_handle(). Hence video stream of newer
> display resolution will fail to be transmitted to panel due to main
> link is not in sync between host and panel.
>
> This patch will bypass irq_hpd_handle() in favor of directly call
> dp_ctrl_on_stream() to always perform link training in regardless of
> main link status. So that no unexpected exception resolution change
> failure cases will happen. Also this implementation are more efficient
> than manual kicking off irq_hpd_handle function.
>
> Changes in v2:
> -- set force_link_train flag on DP only (is_edp == false)
>
> Changes in v3:
> -- revise commit  text
> -- add Fixes tag
>
> Changes in v4:
> -- revise commit  text
>
> Changes in v5:
> -- fix spelling at commit text
>
> Changes in v6:
> -- split dp_ctrl_on_stream() for phy test case
> -- revise commit text for modeset
>
> Changes in v7:
> -- drop 0 assignment at local variable (ret = 0)
>
> Fixes: 62671d2ef24b ("drm/msm/dp: fixes wrong connection state caused by failure of link train")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 31 +++++++++++++++++++++++--------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 ++-
>  drivers/gpu/drm/msm/dp/dp_display.c | 13 ++++++-------
>  3 files changed, 31 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index af7a80c..01028b5 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1551,7 +1551,7 @@ static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
>
>         ret = dp_ctrl_on_link(&ctrl->dp_ctrl);
>         if (!ret)
> -               ret = dp_ctrl_on_stream(&ctrl->dp_ctrl);
> +               ret = dp_ctrl_on_stream_phy_test_report(&ctrl->dp_ctrl);
>         else
>                 DRM_ERROR("failed to enable DP link controller\n");
>
> @@ -1807,7 +1807,27 @@ static int dp_ctrl_link_retrain(struct dp_ctrl_private *ctrl)
>         return dp_ctrl_setup_main_link(ctrl, &training_step);
>  }
>
> -int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
> +int dp_ctrl_on_stream_phy_test_report(struct dp_ctrl *dp_ctrl)
> +{
> +       int ret;
> +       struct dp_ctrl_private *ctrl;
> +
> +       ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> +
> +       ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;

There are a few different places where we assign 'pixel_rate' in this
file. Can they be consolidated? Is it a concern that wide_bus isn't
considered here? I was really hoping that we could reuse code instead of
duplicate it, DRY principle and all.

Maybe even better, can we remove 'pixel_rate' entirely from being
stashed? See further down for my patch.

> +
> +       ret = dp_ctrl_enable_stream_clocks(ctrl);
> +       if (ret) {
> +               DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> +               return ret;
> +       }
> +
> +       dp_ctrl_send_phy_test_pattern(ctrl);
> +
> +       return 0;
> +}
> +
> +int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
>  {
>         int ret = 0;
>         bool mainlink_ready = false;
> @@ -1843,12 +1863,7 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
>                 goto end;
>         }
>
> -       if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {
> -               dp_ctrl_send_phy_test_pattern(ctrl);
> -               return 0;
> -       }
> -
> -       if (!dp_ctrl_channel_eq_ok(ctrl))
> +       if (force_link_train || !dp_ctrl_channel_eq_ok(ctrl))
>                 dp_ctrl_link_retrain(ctrl);
>
>         /* stop txing train pattern to end link training */
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index 0745fde..9a39b00 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -21,7 +21,8 @@ struct dp_ctrl {
>  };
>
>  int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl);
> -int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl);
> +int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train);
> +int dp_ctrl_on_stream_phy_test_report(struct dp_ctrl *dp_ctrl);

Please don't expose the API if it's only used in dp_ctrl.c

>  int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl);
>  int dp_ctrl_off_link(struct dp_ctrl *dp_ctrl);
>  int dp_ctrl_off(struct dp_ctrl *dp_ctrl);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index c388323..b6d25ab 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -872,7 +872,7 @@ static int dp_display_enable(struct dp_display_private *dp, u32 data)
>                 return 0;
>         }
>
> -       rc = dp_ctrl_on_stream(dp->ctrl);
> +       rc = dp_ctrl_on_stream(dp->ctrl, data);
>         if (!rc)
>                 dp_display->power_on = true;
>
> @@ -1654,6 +1654,7 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
>         int rc = 0;
>         struct dp_display_private *dp_display;
>         u32 state;
> +       bool force_link_train = false;
>
>         dp_display = container_of(dp, struct dp_display_private, dp_display);
>         if (!dp_display->dp_mode.drm_mode.clock) {
> @@ -1688,10 +1689,12 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
>
>         state =  dp_display->hpd_state;
>
> -       if (state == ST_DISPLAY_OFF)
> +       if (state == ST_DISPLAY_OFF) {
>                 dp_display_host_phy_init(dp_display);
> +               force_link_train = true;
> +       }
>
> -       dp_display_enable(dp_display, 0);
> +       dp_display_enable(dp_display, force_link_train);

I see now that ST_DISPLAY_OFF isn't exposed outside of this file. So my
hope to not modify the function argument is not possible, ok.

>
>         rc = dp_display_post_enable(dp);
>         if (rc) {

Here's my untested patch for pixel_rate removal and movement of the code
so we don't have to expose the test API. Note that there's a place where
I removed the setting of the pixel_rate but didn't use it (see
dp_ctrl_link_maintenance()). Is that important? I couldn't figure out
how link maintenance cared about the pixel rate.

---8<----
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index b4e333a4c587..e114521af2e9 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1238,8 +1238,6 @@ static int dp_ctrl_link_train_2(struct
dp_ctrl_private *ctrl,
 	return -ETIMEDOUT;
 }

-static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl);
-
 static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
 			int *training_step)
 {
@@ -1338,7 +1336,7 @@ static void dp_ctrl_set_clock_rate(struct
dp_ctrl_private *ctrl,
 				name, rate);
 }

-static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
+static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private
*ctrl, unsigned long pixel_rate)
 {
 	int ret = 0;
 	struct dp_io *dp_io = &ctrl->parser->io;
@@ -1359,25 +1357,25 @@ static int
dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
 	if (ret)
 		DRM_ERROR("Unable to start link clocks. ret=%d\n", ret);

-	drm_dbg_dp(ctrl->drm_dev, "link rate=%d pixel_clk=%d\n",
-		ctrl->link->link_params.rate, ctrl->dp_ctrl.pixel_rate);
+	drm_dbg_dp(ctrl->drm_dev, "link rate=%d pixel_clk=%lu\n",
+		ctrl->link->link_params.rate, pixel_rate);

 	return ret;
 }

-static int dp_ctrl_enable_stream_clocks(struct dp_ctrl_private *ctrl)
+static int dp_ctrl_enable_stream_clocks(struct dp_ctrl_private *ctrl,
+					unsigned long pixel_rate)
 {
-	int ret = 0;
+	int ret;

-	dp_ctrl_set_clock_rate(ctrl, DP_STREAM_PM, "stream_pixel",
-					ctrl->dp_ctrl.pixel_rate * 1000);
+	dp_ctrl_set_clock_rate(ctrl, DP_STREAM_PM, "stream_pixel", pixel_rate * 1000);

 	ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, true);
 	if (ret)
 		DRM_ERROR("Unabled to start pixel clocks. ret=%d\n", ret);

-	drm_dbg_dp(ctrl->drm_dev, "link rate=%d pixel_clk=%d\n",
-			ctrl->link->link_params.rate, ctrl->dp_ctrl.pixel_rate);
+	drm_dbg_dp(ctrl->drm_dev, "link rate=%d pixel_clk=%lu\n",
+			ctrl->link->link_params.rate, pixel_rate);

 	return ret;
 }
@@ -1447,7 +1445,7 @@ static bool dp_ctrl_use_fixed_nvid(struct
dp_ctrl_private *ctrl)
 	return false;
 }

-static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
+static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private
*ctrl, unsigned long pixel_rate)
 {
 	int ret = 0;
 	struct dp_io *dp_io = &ctrl->parser->io;
@@ -1471,7 +1469,7 @@ static int dp_ctrl_reinitialize_mainlink(struct
dp_ctrl_private *ctrl)
 	/* hw recommended delay before re-enabling clocks */
 	msleep(20);

-	ret = dp_ctrl_enable_mainlink_clocks(ctrl);
+	ret = dp_ctrl_enable_mainlink_clocks(ctrl, pixel_rate);
 	if (ret) {
 		DRM_ERROR("Failed to enable mainlink clks. ret=%d\n", ret);
 		return ret;
@@ -1519,8 +1517,6 @@ static int dp_ctrl_link_maintenance(struct
dp_ctrl_private *ctrl)
 	ctrl->link->phy_params.p_level = 0;
 	ctrl->link->phy_params.v_level = 0;

-	ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
-
 	ret = dp_ctrl_setup_main_link(ctrl, &training_step);
 	if (ret)
 		goto end;
@@ -1534,36 +1530,6 @@ static int dp_ctrl_link_maintenance(struct
dp_ctrl_private *ctrl)
 	return ret;
 }

-static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
-{
-	int ret = 0;
-
-	if (!ctrl->link->phy_params.phy_test_pattern_sel) {
-		drm_dbg_dp(ctrl->drm_dev,
-			"no test pattern selected by sink\n");
-		return ret;
-	}
-
-	/*
-	 * The global reset will need DP link related clocks to be
-	 * running. Add the global reset just before disabling the
-	 * link clocks and core clocks.
-	 */
-	ret = dp_ctrl_off(&ctrl->dp_ctrl);
-	if (ret) {
-		DRM_ERROR("failed to disable DP controller\n");
-		return ret;
-	}
-
-	ret = dp_ctrl_on_link(&ctrl->dp_ctrl);
-	if (!ret)
-		ret = dp_ctrl_on_stream_phy_test_report(&ctrl->dp_ctrl);
-	else
-		DRM_ERROR("failed to enable DP link controller\n");
-
-	return ret;
-}
-
 static bool dp_ctrl_send_phy_test_pattern(struct dp_ctrl_private *ctrl)
 {
 	bool success = false;
@@ -1616,6 +1582,56 @@ static bool
dp_ctrl_send_phy_test_pattern(struct dp_ctrl_private *ctrl)
 	return success;
 }

+static int dp_ctrl_on_stream_phy_test_report(struct dp_ctrl *dp_ctrl)
+{
+	int ret;
+	struct dp_ctrl_private *ctrl;
+	unsigned long pixel_rate;
+
+	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+
+	pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
+	ret = dp_ctrl_enable_stream_clocks(ctrl, pixel_rate);
+	if (ret) {
+		DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
+		return ret;
+	}
+
+	dp_ctrl_send_phy_test_pattern(ctrl);
+
+	return 0;
+}
+
+static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
+{
+	int ret = 0;
+
+	if (!ctrl->link->phy_params.phy_test_pattern_sel) {
+		drm_dbg_dp(ctrl->drm_dev,
+			"no test pattern selected by sink\n");
+		return ret;
+	}
+
+	/*
+	 * The global reset will need DP link related clocks to be
+	 * running. Add the global reset just before disabling the
+	 * link clocks and core clocks.
+	 */
+	ret = dp_ctrl_off(&ctrl->dp_ctrl);
+	if (ret) {
+		DRM_ERROR("failed to disable DP controller\n");
+		return ret;
+	}
+
+	ret = dp_ctrl_on_link(&ctrl->dp_ctrl);
+	if (!ret)
+		ret = dp_ctrl_on_stream_phy_test_report(&ctrl->dp_ctrl);
+	else
+		DRM_ERROR("failed to enable DP link controller\n");
+
+	return ret;
+}
+
 void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
@@ -1691,6 +1707,7 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 	u32 const phy_cts_pixel_clk_khz = 148500;
 	u8 link_status[DP_LINK_STATUS_SIZE];
 	unsigned int training_step;
+	unsigned long pixel_rate;

 	if (!dp_ctrl)
 		return -EINVAL;
@@ -1705,25 +1722,25 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 		drm_dbg_dp(ctrl->drm_dev,
 				"using phy test link parameters\n");
 		if (!ctrl->panel->dp_mode.drm_mode.clock)
-			ctrl->dp_ctrl.pixel_rate = phy_cts_pixel_clk_khz;
+			pixel_rate = phy_cts_pixel_clk_khz;
 	} else {
 		ctrl->link->link_params.rate = rate;
 		ctrl->link->link_params.num_lanes =
 			ctrl->panel->link_info.num_lanes;
-		ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
+		pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
 	}

-	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d, pixel_rate=%d\n",
+	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d, pixel_rate=%lu\n",
 		ctrl->link->link_params.rate, ctrl->link->link_params.num_lanes,
-		ctrl->dp_ctrl.pixel_rate);
+		pixel_rate);


-	rc = dp_ctrl_enable_mainlink_clocks(ctrl);
+	rc = dp_ctrl_enable_mainlink_clocks(ctrl, pixel_rate);
 	if (rc)
 		return rc;

 	while (--link_train_max_retries) {
-		rc = dp_ctrl_reinitialize_mainlink(ctrl);
+		rc = dp_ctrl_reinitialize_mainlink(ctrl, pixel_rate);
 		if (rc) {
 			DRM_ERROR("Failed to reinitialize mainlink. rc=%d\n",
 					rc);
@@ -1813,31 +1830,12 @@ static int dp_ctrl_link_retrain(struct
dp_ctrl_private *ctrl)
 	return dp_ctrl_setup_main_link(ctrl, &training_step);
 }

-int dp_ctrl_on_stream_phy_test_report(struct dp_ctrl *dp_ctrl)
-{
-	int ret;
-	struct dp_ctrl_private *ctrl;
-
-	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
-
-	ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
-
-	ret = dp_ctrl_enable_stream_clocks(ctrl);
-	if (ret) {
-		DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
-		return ret;
-	}
-
-	dp_ctrl_send_phy_test_pattern(ctrl);
-
-	return 0;
-}
-
 int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
 {
 	int ret = 0;
 	bool mainlink_ready = false;
 	struct dp_ctrl_private *ctrl;
+	unsigned long pixel_rate;
 	unsigned long pixel_rate_orig;

 	if (!dp_ctrl)
@@ -1845,25 +1843,24 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl,
bool force_link_train)

 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);

-	ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
+	pixel_rate = pixel_rate_orig = ctrl->panel->dp_mode.drm_mode.clock;

-	pixel_rate_orig = ctrl->dp_ctrl.pixel_rate;
 	if (dp_ctrl->wide_bus_en)
-		ctrl->dp_ctrl.pixel_rate >>= 1;
+		pixel_rate >>= 1;

-	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d, pixel_rate=%d\n",
+	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d, pixel_rate=%lu\n",
 		ctrl->link->link_params.rate,
-		ctrl->link->link_params.num_lanes, ctrl->dp_ctrl.pixel_rate);
+		ctrl->link->link_params.num_lanes, pixel_rate);

 	if (!dp_power_clk_status(ctrl->power, DP_CTRL_PM)) { /* link clk is off */
-		ret = dp_ctrl_enable_mainlink_clocks(ctrl);
+		ret = dp_ctrl_enable_mainlink_clocks(ctrl, pixel_rate);
 		if (ret) {
 			DRM_ERROR("Failed to start link clocks. ret=%d\n", ret);
 			goto end;
 		}
 	}

-	ret = dp_ctrl_enable_stream_clocks(ctrl);
+	ret = dp_ctrl_enable_stream_clocks(ctrl, pixel_rate);
 	if (ret) {
 		DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
 		goto end;
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 9a39b0089ae0..9f29734af81c 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -16,13 +16,11 @@
 struct dp_ctrl {
 	bool orientation;
 	atomic_t aborted;
-	u32 pixel_rate;
 	bool wide_bus_en;
 };

 int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train);
-int dp_ctrl_on_stream_phy_test_report(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_off_link(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_off(struct dp_ctrl *dp_ctrl);
