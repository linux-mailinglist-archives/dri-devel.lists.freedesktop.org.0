Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 704AF44B15C
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 17:41:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E79789CAC;
	Tue,  9 Nov 2021 16:41:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D4B6E5C8;
 Tue,  9 Nov 2021 16:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1636476098; x=1668012098;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nRETC3qc+Ukc/ah/liL4gTsIAi1bSb6yJzKSP1WeUYA=;
 b=UrtAi/9Y6NN5ePRHlx/YRlEPnkShaRAY2AE2/qk4ZD31xwfQ9rPwP0p9
 mz5N8xCbRiyUKXaAtBmhuh/76SKurQQkA4Eb0cdNYHhoT7ydXB/FzqPTy
 3d4NJjW8scNIp9oQkoH8G4YzTioGcTRsHu5ZGqrmSna6ZZbY7XbfMBtdg o=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 09 Nov 2021 08:41:37 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 08:41:36 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Tue, 9 Nov 2021 08:41:35 -0800
Received: from [10.110.41.32] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Tue, 9 Nov 2021
 08:41:34 -0800
Message-ID: <d25ccef7-2d01-c337-ef5f-62a29de16a0e@quicinc.com>
Date: Tue, 9 Nov 2021 08:41:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v3] drm/msm/dp: do not initialize phy until plugin
 interrupt received
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <1636414933-5103-1-git-send-email-quic_khsieh@quicinc.com>
 <YYnA0vlRmeTIjk2p@ripper>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <YYnA0vlRmeTIjk2p@ripper>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 aravindh@codeaurora.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/8/2021 4:29 PM, Bjorn Andersson wrote:
> On Mon 08 Nov 15:42 PST 2021, Kuogee Hsieh wrote:
>
>> From: Kuogee Hsieh <khsieh@codeaurora.org>
>>
>> Combo phy supports both USB and DP simultaneously. There may has a
>> possible conflict during phy initialization phase between USB and
>> DP driver which may cause USB phy timeout when USB tries to power
>> up its phy. This patch has the DP driver not initialize its phy
>> during DP driver initialization phase. Instead DP driver only enable
>> required regulators and clocks so that it is able to receive HPD
>> interrupts after completion of initialization phase. DP driver will
>> initialize its phy when HPD plug-in interrupt received.
>> This patch also provides a positive side effects which balance regulator
>> enable count since regulator only enabled at initialize phase and resume
>> and disabled at followed suspend.
>>
> I thought you said that you (someone) will attempt to resolve the
> described error in the QMP driver, making this patch unnecessary.
>
> That said, are there any other benefits to this patch? I.e. does it make
> sense not to initialize the phy when there's no cable connected for
> power purposed etc?
> If so this patch looks reasonable in itself, but the commit message is
> wrong.
>
> Thanks,
> Bjorn

sorry for the confusing.

I will redo the commit test.

Thanks,

>> Changes in V2:
>> -- removed unnecessary dp_ctrl NULL check
>> -- removed unnecessary phy init_count and power_count DRM_DEBUG_DP logs
>> -- remove flip parameter out of dp_ctrl_irq_enable()
>> -- add fixes tag
>>
>> Changes in V3:
>> -- call dp_display_host_phy_init() instead of dp_ctrl_phy_init() at dp_display_host_init() for eDP
>>
>> Fixes: e91e3065a806 ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 87 ++++++++++++++++---------------------
>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  9 ++--
>>   drivers/gpu/drm/msm/dp/dp_display.c | 83 ++++++++++++++++++++++++++---------
>>   3 files changed, 105 insertions(+), 74 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index 7ec155d..4788e8c 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -1364,60 +1364,54 @@ static int dp_ctrl_enable_stream_clocks(struct dp_ctrl_private *ctrl)
>>   	return ret;
>>   }
>>   
>> -int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset)
>> +void dp_ctrl_irq_enable(struct dp_ctrl *dp_ctrl)
>> +{
>> +	struct dp_ctrl_private *ctrl;
>> +
>> +	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>> +
>> +	dp_catalog_ctrl_reset(ctrl->catalog);
>> +
>> +	dp_catalog_ctrl_enable_irq(ctrl->catalog, true);
>> +}
>> +
>> +void dp_ctrl_irq_disable(struct dp_ctrl *dp_ctrl)
>> +{
>> +	struct dp_ctrl_private *ctrl;
>> +
>> +	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>> +
>> +	dp_catalog_ctrl_reset(ctrl->catalog);
>> +
>> +	dp_catalog_ctrl_enable_irq(ctrl->catalog, false);
>> +}
>> +
>> +void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
>>   {
>>   	struct dp_ctrl_private *ctrl;
>>   	struct dp_io *dp_io;
>>   	struct phy *phy;
>>   
>> -	if (!dp_ctrl) {
>> -		DRM_ERROR("Invalid input data\n");
>> -		return -EINVAL;
>> -	}
>> -
>>   	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>>   	dp_io = &ctrl->parser->io;
>>   	phy = dp_io->phy;
>>   
>> -	ctrl->dp_ctrl.orientation = flip;
>> -
>> -	if (reset)
>> -		dp_catalog_ctrl_reset(ctrl->catalog);
>> -
>> -	DRM_DEBUG_DP("flip=%d\n", flip);
>>   	dp_catalog_ctrl_phy_reset(ctrl->catalog);
>>   	phy_init(phy);
>> -	dp_catalog_ctrl_enable_irq(ctrl->catalog, true);
>> -
>> -	return 0;
>>   }
>>   
>> -/**
>> - * dp_ctrl_host_deinit() - Uninitialize DP controller
>> - * @dp_ctrl: Display Port Driver data
>> - *
>> - * Perform required steps to uninitialize DP controller
>> - * and its resources.
>> - */
>> -void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl)
>> +void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl)
>>   {
>>   	struct dp_ctrl_private *ctrl;
>>   	struct dp_io *dp_io;
>>   	struct phy *phy;
>>   
>> -	if (!dp_ctrl) {
>> -		DRM_ERROR("Invalid input data\n");
>> -		return;
>> -	}
>> -
>>   	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>>   	dp_io = &ctrl->parser->io;
>>   	phy = dp_io->phy;
>>   
>> -	dp_catalog_ctrl_enable_irq(ctrl->catalog, false);
>> +	dp_catalog_ctrl_phy_reset(ctrl->catalog);
>>   	phy_exit(phy);
>> -
>> -	DRM_DEBUG_DP("Host deinitialized successfully\n");
>>   }
>>   
>>   static bool dp_ctrl_use_fixed_nvid(struct dp_ctrl_private *ctrl)
>> @@ -1895,8 +1889,14 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
>>   		return ret;
>>   	}
>>   
>> +	DRM_DEBUG_DP("Before, phy=%x init_count=%d power_on=%d\n",
>> +		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
>> +
>>   	phy_power_off(phy);
>>   
>> +	DRM_DEBUG_DP("After, phy=%x init_count=%d power_on=%d\n",
>> +		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
>> +
>>   	/* aux channel down, reinit phy */
>>   	phy_exit(phy);
>>   	phy_init(phy);
>> @@ -1905,23 +1905,6 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
>>   	return ret;
>>   }
>>   
>> -void dp_ctrl_off_phy(struct dp_ctrl *dp_ctrl)
>> -{
>> -	struct dp_ctrl_private *ctrl;
>> -	struct dp_io *dp_io;
>> -	struct phy *phy;
>> -
>> -	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>> -	dp_io = &ctrl->parser->io;
>> -	phy = dp_io->phy;
>> -
>> -	dp_catalog_ctrl_reset(ctrl->catalog);
>> -
>> -	phy_exit(phy);
>> -
>> -	DRM_DEBUG_DP("DP off phy done\n");
>> -}
>> -
>>   int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
>>   {
>>   	struct dp_ctrl_private *ctrl;
>> @@ -1949,10 +1932,14 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
>>   		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
>>   	}
>>   
>> +	DRM_DEBUG_DP("Before, phy=%x init_count=%d power_on=%d\n",
>> +		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
>> +
>>   	phy_power_off(phy);
>> -	phy_exit(phy);
>>   
>> -	DRM_DEBUG_DP("DP off done\n");
>> +	DRM_DEBUG_DP("After, phy=%x init_count=%d power_on=%d\n",
>> +		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
>> +
>>   	return ret;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> index 2363a2d..30f9414 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> @@ -19,12 +19,9 @@ struct dp_ctrl {
>>   	u32 pixel_rate;
>>   };
>>   
>> -int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset);
>> -void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl);
>>   int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl);
>>   int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl);
>>   int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl);
>> -void dp_ctrl_off_phy(struct dp_ctrl *dp_ctrl);
>>   int dp_ctrl_off(struct dp_ctrl *dp_ctrl);
>>   void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl);
>>   void dp_ctrl_isr(struct dp_ctrl *dp_ctrl);
>> @@ -34,4 +31,10 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
>>   			struct dp_power *power, struct dp_catalog *catalog,
>>   			struct dp_parser *parser);
>>   
>> +void dp_ctrl_irq_enable(struct dp_ctrl *dp_ctrl);
>> +void dp_ctrl_irq_disable(struct dp_ctrl *dp_ctrl);
>> +void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl);
>> +void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl);
>> +void dp_ctrl_irq_phy_exit(struct dp_ctrl *dp_ctrl);
>> +
>>   #endif /* _DP_CTRL_H_ */
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index e41dd40..2f113ff 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -84,6 +84,7 @@ struct dp_display_private {
>>   
>>   	/* state variables */
>>   	bool core_initialized;
>> +	bool phy_initialized;
>>   	bool hpd_irq_on;
>>   	bool audio_supported;
>>   
>> @@ -387,7 +388,29 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
>>   	return rc;
>>   }
>>   
>> -static void dp_display_host_init(struct dp_display_private *dp, int reset)
>> +static void dp_display_host_phy_init(struct dp_display_private *dp)
>> +{
>> +	DRM_DEBUG_DP("core_init=%d phy_init=%d\n",
>> +			dp->core_initialized, dp->phy_initialized);
>> +
>> +	if (!dp->phy_initialized) {
>> +		dp_ctrl_phy_init(dp->ctrl);
>> +		dp->phy_initialized = true;
>> +	}
>> +}
>> +
>> +static void dp_display_host_phy_exit(struct dp_display_private *dp)
>> +{
>> +	DRM_DEBUG_DP("core_init=%d phy_init=%d\n",
>> +			dp->core_initialized, dp->phy_initialized);
>> +
>> +	if (dp->phy_initialized) {
>> +		dp_ctrl_phy_exit(dp->ctrl);
>> +		dp->phy_initialized = false;
>> +	}
>> +}
>> +
>> +static void dp_display_host_init(struct dp_display_private *dp)
>>   {
>>   	bool flip = false;
>>   
>> @@ -400,8 +423,16 @@ static void dp_display_host_init(struct dp_display_private *dp, int reset)
>>   	if (dp->usbpd->orientation == ORIENTATION_CC2)
>>   		flip = true;
>>   
>> -	dp_power_init(dp->power, flip);
>> -	dp_ctrl_host_init(dp->ctrl, flip, reset);
>> +	dp_power_init(dp->power, false);
>> +	dp_ctrl_irq_enable(dp->ctrl);
>> +
>> +	/*
>> +	 * eDP is the embedded primary display and has its own phy
>> +	 * initialize phy immediately
>> +	 */
>> +	if (dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP)
>> +		dp_display_host_phy_init(dp);
>> +
>>   	dp_aux_init(dp->aux);
>>   	dp->core_initialized = true;
>>   }
>> @@ -413,7 +444,7 @@ static void dp_display_host_deinit(struct dp_display_private *dp)
>>   		return;
>>   	}
>>   
>> -	dp_ctrl_host_deinit(dp->ctrl);
>> +	dp_ctrl_irq_disable(dp->ctrl);
>>   	dp_aux_deinit(dp->aux);
>>   	dp_power_deinit(dp->power);
>>   
>> @@ -424,7 +455,7 @@ static int dp_display_usbpd_configure_cb(struct device *dev)
>>   {
>>   	struct dp_display_private *dp = dev_get_dp_display_private(dev);
>>   
>> -	dp_display_host_init(dp, true);
>> +	dp_display_host_phy_init(dp);
>>   
>>   	return dp_display_process_hpd_high(dp);
>>   }
>> @@ -551,7 +582,7 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
>>   		dp->hpd_state = ST_DISCONNECTED;
>>   
>>   		if (ret == -ECONNRESET) { /* cable unplugged */
>> -			dp->core_initialized = false;
>> +			dp->phy_initialized = false;
>>   		}
>>   
>>   	} else {
>> @@ -623,9 +654,8 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>>   	if (state == ST_DISCONNECTED) {
>>   		/* triggered by irq_hdp with sink_count = 0 */
>>   		if (dp->link->sink_count == 0) {
>> -			dp_ctrl_off_phy(dp->ctrl);
>> +			dp_display_host_phy_exit(dp);
>>   			hpd->hpd_high = 0;
>> -			dp->core_initialized = false;
>>   		}
>>   		mutex_unlock(&dp->event_mutex);
>>   		return 0;
>> @@ -716,7 +746,7 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
>>   
>>   	ret = dp_display_usbpd_attention_cb(&dp->pdev->dev);
>>   	if (ret == -ECONNRESET) { /* cable unplugged */
>> -		dp->core_initialized = false;
>> +		dp->phy_initialized = false;
>>   	}
>>   	DRM_DEBUG_DP("hpd_state=%d\n", state);
>>   
>> @@ -918,12 +948,19 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
>>   
>>   	dp_display->audio_enabled = false;
>>   
>> -	/* triggered by irq_hpd with sink_count = 0 */
>>   	if (dp->link->sink_count == 0) {
>> +		/*
>> +		 * irq_hpd with sink_count = 0
>> +		 * hdmi unplugged out of dongle
>> +		 */
>>   		dp_ctrl_off_link_stream(dp->ctrl);
>>   	} else {
>> +		/*
>> +		 * unplugged interrupt
>> +		 * dongle unplugged out of DUT
>> +		 */
>>   		dp_ctrl_off(dp->ctrl);
>> -		dp->core_initialized = false;
>> +		dp_display_host_phy_exit(dp);
>>   	}
>>   
>>   	dp_power_panel_on(dp->power, false);
>> @@ -1059,7 +1096,7 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
>>   static void dp_display_config_hpd(struct dp_display_private *dp)
>>   {
>>   
>> -	dp_display_host_init(dp, true);
>> +	dp_display_host_init(dp);
>>   	dp_catalog_ctrl_hpd_config(dp->catalog);
>>   
>>   	/* Enable interrupt first time
>> @@ -1338,20 +1375,22 @@ static int dp_pm_resume(struct device *dev)
>>   	dp->hpd_state = ST_DISCONNECTED;
>>   
>>   	/* turn on dp ctrl/phy */
>> -	dp_display_host_init(dp, true);
>> +	dp_display_host_init(dp);
>>   
>>   	dp_catalog_ctrl_hpd_config(dp->catalog);
>>   
>> -	/*
>> -	 * set sink to normal operation mode -- D0
>> -	 * before dpcd read
>> -	 */
>> -	dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>> -
>>   	if (dp_catalog_link_is_connected(dp->catalog)) {
>> +		/*
>> +		 * set sink to normal operation mode -- D0
>> +		 * before dpcd read
>> +		 */
>> +		dp_display_host_phy_init(dp);
>> +		dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>>   		sink_count = drm_dp_read_sink_count(dp->aux);
>>   		if (sink_count < 0)
>>   			sink_count = 0;
>> +
>> +		dp_display_host_phy_exit(dp);
>>   	}
>>   
>>   	dp->link->sink_count = sink_count;
>> @@ -1399,6 +1438,8 @@ static int dp_pm_suspend(struct device *dev)
>>   		dp_display_host_deinit(dp);
>>   	}
>>   
>> +	dp_display_host_phy_exit(dp);
>> +
>>   	dp->hpd_state = ST_SUSPENDED;
>>   
>>   	/* host_init will be called at pm_resume */
>> @@ -1473,7 +1514,7 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
>>   		enable_irq(dp->irq);
>>   		dp_hpd_connect(dp->usbpd, true);
>>   	} else {
>> -		dp_add_event(dp, EV_HPD_INIT_SETUP, 0, dp->id * 10);
>> +		dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 0);
>>   	}
>>   }
>>   
>> @@ -1567,7 +1608,7 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
>>   	state =  dp_display->hpd_state;
>>   
>>   	if (state == ST_DISPLAY_OFF)
>> -		dp_display_host_init(dp_display, true);
>> +		dp_display_host_phy_init(dp_display);
>>   
>>   	dp_display_enable(dp_display, 0);
>>   
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>
