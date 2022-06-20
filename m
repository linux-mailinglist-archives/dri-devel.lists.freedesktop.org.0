Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D42C9552090
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 17:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 665E110E259;
	Mon, 20 Jun 2022 15:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1209910E0A7;
 Mon, 20 Jun 2022 15:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655738623; x=1687274623;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IOpznbgvSaym+Sif0wAWCP/JivReL3TNtBOptLf7zn8=;
 b=eNufK/EIYFhxmzRP4Wh/Z+q+nCW59TDJgEJWNH336ZbLSgMb2PdLJ1N3
 7CVqV8OyJXU7gco1ey/KkQZzUOUnRCmOi9D6JJB4pMNdNPDO9PpFn38t8
 EmDrQRdVvWmx8dOfrsg3CAX7j/ZyVJ72xRXeQzuu6CWs6qWVPhiWamiPe g=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 20 Jun 2022 08:23:41 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 08:23:41 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 20 Jun 2022 08:23:40 -0700
Received: from [10.110.14.194] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 20 Jun
 2022 08:23:39 -0700
Message-ID: <920ec4fd-2ab0-2a0a-83fb-fc824ca7425d@quicinc.com>
Date: Mon, 20 Jun 2022 08:23:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/3] drm/msm/dp: Reorganize code to avoid forward
 declaration
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Stephen Boyd
 <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>
References: <20220617204750.2347797-1-swboyd@chromium.org>
 <20220617204750.2347797-2-swboyd@chromium.org>
 <ddddcb1d-46c6-4903-3a8a-83bc96ece159@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <ddddcb1d-46c6-4903-3a8a-83bc96ece159@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/17/2022 3:50 PM, Dmitry Baryshkov wrote:
> On 17/06/2022 23:47, Stephen Boyd wrote:
>> Let's move these functions around to avoid having to forward declare
>> dp_ctrl_on_stream_phy_test_report(). Also remove
>> dp_ctrl_reinitialize_mainlink() forward declaration because we're doing
>> that sort of task.
>>
>> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c | 104 +++++++++++++++----------------
>>   1 file changed, 50 insertions(+), 54 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c 
>> b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index 703249384e7c..bd445e683cfc 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -1238,8 +1238,6 @@ static int dp_ctrl_link_train_2(struct 
>> dp_ctrl_private *ctrl,
>>       return -ETIMEDOUT;
>>   }
>>   -static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private 
>> *ctrl);
>> -
>>   static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
>>               int *training_step)
>>   {
>> @@ -1534,38 +1532,6 @@ static int dp_ctrl_link_maintenance(struct 
>> dp_ctrl_private *ctrl)
>>       return ret;
>>   }
>>   -static int dp_ctrl_on_stream_phy_test_report(struct dp_ctrl 
>> *dp_ctrl);
>> -
>> -static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private 
>> *ctrl)
>> -{
>> -    int ret = 0;
>> -
>> -    if (!ctrl->link->phy_params.phy_test_pattern_sel) {
>> -        drm_dbg_dp(ctrl->drm_dev,
>> -            "no test pattern selected by sink\n");
>> -        return ret;
>> -    }
>> -
>> -    /*
>> -     * The global reset will need DP link related clocks to be
>> -     * running. Add the global reset just before disabling the
>> -     * link clocks and core clocks.
>> -     */
>> -    ret = dp_ctrl_off(&ctrl->dp_ctrl);
>> -    if (ret) {
>> -        DRM_ERROR("failed to disable DP controller\n");
>> -        return ret;
>> -    }
>> -
>> -    ret = dp_ctrl_on_link(&ctrl->dp_ctrl);
>> -    if (!ret)
>> -        ret = dp_ctrl_on_stream_phy_test_report(&ctrl->dp_ctrl);
>> -    else
>> -        DRM_ERROR("failed to enable DP link controller\n");
>> -
>> -    return ret;
>> -}
>> -
>>   static bool dp_ctrl_send_phy_test_pattern(struct dp_ctrl_private 
>> *ctrl)
>>   {
>>       bool success = false;
>> @@ -1618,6 +1584,56 @@ static bool 
>> dp_ctrl_send_phy_test_pattern(struct dp_ctrl_private *ctrl)
>>       return success;
>>   }
>>   +static int dp_ctrl_on_stream_phy_test_report(struct dp_ctrl *dp_ctrl)
>> +{
>> +    int ret;
>> +    struct dp_ctrl_private *ctrl;
>> +
>> +    ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>> +
>> +    ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
>> +
>> +    ret = dp_ctrl_enable_stream_clocks(ctrl);
>> +    if (ret) {
>> +        DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    dp_ctrl_send_phy_test_pattern(ctrl);
>> +
>> +    return 0;
>> +}
>> +
>> +static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private 
>> *ctrl)
>> +{
>> +    int ret = 0;
>> +
>> +    if (!ctrl->link->phy_params.phy_test_pattern_sel) {
>> +        drm_dbg_dp(ctrl->drm_dev,
>> +            "no test pattern selected by sink\n");
>> +        return ret;
>> +    }
>> +
>> +    /*
>> +     * The global reset will need DP link related clocks to be
>> +     * running. Add the global reset just before disabling the
>> +     * link clocks and core clocks.
>> +     */
>> +    ret = dp_ctrl_off(&ctrl->dp_ctrl);
>> +    if (ret) {
>> +        DRM_ERROR("failed to disable DP controller\n");
>> +        return ret;
>> +    }
>> +
>> +    ret = dp_ctrl_on_link(&ctrl->dp_ctrl);
>> +    if (!ret)
>> +        ret = dp_ctrl_on_stream_phy_test_report(&ctrl->dp_ctrl);
>> +    else
>> +        DRM_ERROR("failed to enable DP link controller\n");
>> +
>> +    return ret;
>> +}
>> +
>>   void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl)
>>   {
>>       struct dp_ctrl_private *ctrl;
>> @@ -1815,26 +1831,6 @@ static int dp_ctrl_link_retrain(struct 
>> dp_ctrl_private *ctrl)
>>       return dp_ctrl_setup_main_link(ctrl, &training_step);
>>   }
>>   -static int dp_ctrl_on_stream_phy_test_report(struct dp_ctrl *dp_ctrl)
>> -{
>> -    int ret;
>> -    struct dp_ctrl_private *ctrl;
>> -
>> -    ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>> -
>> -    ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
>> -
>> -    ret = dp_ctrl_enable_stream_clocks(ctrl);
>> -    if (ret) {
>> -        DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
>> -        return ret;
>> -    }
>> -
>> -    dp_ctrl_send_phy_test_pattern(ctrl);
>> -
>> -    return 0;
>> -}
>> -
>>   int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
>>   {
>>       int ret = 0;
>
>
