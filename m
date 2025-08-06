Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D534B1C33E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 11:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD74210E73F;
	Wed,  6 Aug 2025 09:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ca6KD5/u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B0110E2F3;
 Wed,  6 Aug 2025 09:24:43 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5766A0gN029756;
 Wed, 6 Aug 2025 09:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jVrNcEha1KXOH178NmhwWnb7HRQ/d55h+IO2z7s11UM=; b=ca6KD5/uzfjQX0p+
 jS5CILtyJ9WglziYjE/iE4dsST3pttR2yCyDav5P/aMkIFvgGWtj7+afX3q/TpRd
 wFwtmF1Cp2whhVXKlpA7nIVeXgWQps5xUtcLdS0tkTV/jIWJBctgdXNyoZeuMr76
 a0Mar9+DtkGy/4uuBnEYsm2453+YI0lkmYU+IAmsTwuRqYDILjcePEDCuxJk2Rzl
 Zaj3Ut/Rh1U38bJ27j7rxIlQdUQGqbxijKWOXoHWnVgylwFpyfgYiP1/PDOrXXII
 dyQrPbjR92kNnLBAv4bnygR/dNLedEhcAZ38VIv2iowmx/v30/GqV+AjCE1fkuKZ
 uu9OBg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy8a3d5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Aug 2025 09:24:38 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5769OcYW024142
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 6 Aug 2025 09:24:38 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 6 Aug
 2025 02:24:33 -0700
Message-ID: <eac67099-84fc-46e2-b7e2-3f337937cb1e@quicinc.com>
Date: Wed, 6 Aug 2025 17:24:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/38] drm/msm/dp: break up dp_display_enable into two
 parts
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Rob Clark <robin.clark@oss.qualcomm.com>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-3-a54d8902a23d@quicinc.com>
 <gwib6zcvkxsxcz222cno5jbvsnt2abdoqfnymlxq7e6c6wdfvn@nlplodnco2sw>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <gwib6zcvkxsxcz222cno5jbvsnt2abdoqfnymlxq7e6c6wdfvn@nlplodnco2sw>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: u3BHoTyB6q7tmqYw4cv2uwoHTINuL6FR
X-Proofpoint-ORIG-GUID: u3BHoTyB6q7tmqYw4cv2uwoHTINuL6FR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXyRW53AGAvP8C
 XmHV1i1sVjOK9PEZaFwvwVETawremapuZCrM4txLgtZyFoiot8AToUBlzKERCPqecCs70RwODkG
 zE3HX31FtqQl/zsRIOurZNsa2WF+OC0wYtt+JhkMRMCfEc6mWi99v3fEGh8jCyigRoKk9FhU/L2
 UY5zPahZG07/NyCy5vI12Qr+gKlsA5umlKCInuhUPvHMrqbY6z3Afj8ouoHXulxu/FMswbplYE5
 3YsUm4GssL964bUdpcL0750aW+ceUS1Y9sIKLMD9RmXB2TrJlJ4udlvxYrELdTZXwyGrML5ZgKS
 ZXzNF+t8DOhUVYENYjl7RLazqGf3MGzPtAYaZjrs6gf5Y5vuCzwPMbCPbx6wdOSeCLY6PwwlhRI
 5+6dCOOB
X-Authority-Analysis: v=2.4 cv=GrlC+l1C c=1 sm=1 tr=0 ts=68931f56 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=a1Dkl4VKOg0tngf4JrsA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
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



On 2025/6/9 20:59, Dmitry Baryshkov wrote:
> On Mon, Jun 09, 2025 at 08:21:22PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> dp_display_enable() currently re-trains the link if needed
>> and then enables the pixel clock, programs the controller to
>> start sending the pixel stream. Splite these two parts into
>> prepare/enable APIs, to support MST bridges_enable inserte
> 
> typos
> 
..Got it. thanks.
>> the MST payloads funcs between enable stream_clks and programe
>> register.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 57 +++++++++++++--------
>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 +-
>>   drivers/gpu/drm/msm/dp/dp_display.c | 99 +++++++++++++++++++++++++++----------
>>   drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>>   4 files changed, 111 insertions(+), 49 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index a50bfafbb4ea85c114c958ea0ed24362a1f23136..1e13ca81b0155a37a4ed7a2e83c918293d703a37 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -1980,40 +1980,61 @@ static int msm_dp_ctrl_link_retrain(struct msm_dp_ctrl_private *ctrl)
>>   	return msm_dp_ctrl_setup_main_link(ctrl, &training_step);
>>   }
>>   
>> -int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
>> +int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
>>   {
>>   	int ret = 0;
>> -	bool mainlink_ready = false;
>>   	struct msm_dp_ctrl_private *ctrl;
>> -	unsigned long pixel_rate;
>> -	unsigned long pixel_rate_orig;
>>   
>>   	if (!msm_dp_ctrl)
>>   		return -EINVAL;
>>   
>>   	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>>   
>> -	pixel_rate = pixel_rate_orig = ctrl->panel->msm_dp_mode.drm_mode.clock;
>> -
>> -	if (msm_dp_ctrl->wide_bus_en || ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
>> -		pixel_rate >>= 1;
>> -
>> -	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d, pixel_rate=%lu\n",
>> -		ctrl->link->link_params.rate,
>> -		ctrl->link->link_params.num_lanes, pixel_rate);
>> +	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d\n",
>> +		   ctrl->link->link_params.rate,
>> +		   ctrl->link->link_params.num_lanes);
> 
> Please don't mix whitespace changes with the actual code changes. It
> makes reviewing the patch much harder.
> 
Okay.
>>   
>>   	drm_dbg_dp(ctrl->drm_dev,
>> -		"core_clk_on=%d link_clk_on=%d stream_clk_on=%d\n",
>> -		ctrl->core_clks_on, ctrl->link_clks_on, ctrl->stream_clks_on);
>> +		   "core_clk_on=%d link_clk_on=%d stream_clk_on=%d\n",
>> +		   ctrl->core_clks_on, ctrl->link_clks_on, ctrl->stream_clks_on);
>>   
>>   	if (!ctrl->link_clks_on) { /* link clk is off */
>>   		ret = msm_dp_ctrl_enable_mainlink_clocks(ctrl);
>>   		if (ret) {
>>   			DRM_ERROR("Failed to start link clocks. ret=%d\n", ret);
>> -			goto end;
>> +			return ret;
>>   		}
>>   	}
>>   
>> +	if (force_link_train || !msm_dp_ctrl_channel_eq_ok(ctrl))
>> +		msm_dp_ctrl_link_retrain(ctrl);
>> +
>> +	/* stop txing train pattern to end link training */
>> +	msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
>> +
>> +	return ret;
>> +}
>> +
>> +int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
>> +{
>> +	int ret = 0;
>> +	bool mainlink_ready = false;
>> +	struct msm_dp_ctrl_private *ctrl;
>> +	unsigned long pixel_rate;
>> +	unsigned long pixel_rate_orig;
>> +
>> +	if (!msm_dp_ctrl)
>> +		return -EINVAL;
>> +
>> +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>> +
>> +	pixel_rate = pixel_rate_orig = ctrl->panel->msm_dp_mode.drm_mode.clock;
>> +
>> +	if (msm_dp_ctrl->wide_bus_en || ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
>> +		pixel_rate >>= 1;
>> +
>> +	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
>> +
>>   	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
>>   	if (ret) {
>>   		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
>> @@ -2031,12 +2052,6 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
>>   		ctrl->stream_clks_on = true;
>>   	}
>>   
>> -	if (force_link_train || !msm_dp_ctrl_channel_eq_ok(ctrl))
>> -		msm_dp_ctrl_link_retrain(ctrl);
>> -
>> -	/* stop txing train pattern to end link training */
>> -	msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
>> -
>>   	/*
>>   	 * Set up transfer unit values and set controller state to send
>>   	 * video.
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> index b7abfedbf5749c25877a0b8ba3af3d8ed4b23d67..42745c912adbad7221c78f5cecefa730bfda1e75 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> @@ -18,7 +18,8 @@ struct msm_dp_ctrl {
>>   struct phy;
>>   
>>   int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
>> -int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
>> +int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl);
>> +int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *dp_ctrl, bool force_link_train);
>>   void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl);
>>   void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
>>   void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 9d2db9cbd2552470a36a63f70f517c35436f7280..5ac5dcf35b789f2bda052a2c17aae20aa48d8e18 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -831,7 +831,37 @@ static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
>>   	return 0;
>>   }
>>   
>> -static int msm_dp_display_enable(struct msm_dp_display_private *dp, bool force_link_train)
>> +static int msm_dp_display_prepare(struct msm_dp_display_private *dp)
>> +{
>> +	int rc = 0;
>> +	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
>> +	bool force_link_train = false;
>> +
>> +	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
>> +	if (msm_dp_display->prepared) {
>> +		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
>> +		return 0;
>> +	}
> 
> How can it be prepared here? It is called at the beginning of the
> .atomic_enable() only, so there is no way this can be true.
> 
Thanks. will update it..
>> +
>> +	rc = pm_runtime_resume_and_get(&msm_dp_display->pdev->dev);
>> +	if (rc) {
>> +		DRM_ERROR("failed to pm_runtime_resume\n");
>> +		return rc;
>> +	}
>> +
>> +	if (dp->hpd_state == ST_CONNECTED && !msm_dp_display->power_on) {
>> +		msm_dp_display_host_phy_init(dp);
>> +		force_link_train = true;
>> +	}
>> +
>> +	rc = msm_dp_ctrl_prepare_stream_on(dp->ctrl, force_link_train);
>> +	if (!rc)
>> +		msm_dp_display->prepared = true;
>> +
>> +	return rc;
>> +}
>> +
>> +static int msm_dp_display_enable(struct msm_dp_display_private *dp)
>>   {
>>   	int rc = 0;
>>   	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
>> @@ -842,7 +872,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp, bool force_l
>>   		return 0;
>>   	}
>>   
>> -	rc = msm_dp_ctrl_on_stream(dp->ctrl, force_link_train);
>> +	rc = msm_dp_ctrl_on_stream(dp->ctrl);
>>   	if (!rc)
>>   		msm_dp_display->power_on = true;
>>   
>> @@ -872,13 +902,10 @@ static int msm_dp_display_post_enable(struct msm_dp *msm_dp_display)
>>   	return 0;
>>   }
>>   
>> -static int msm_dp_display_disable(struct msm_dp_display_private *dp)
>> +static void msm_dp_display_audio_notify_disable(struct msm_dp_display_private *dp)
>>   {
>>   	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
>>   
>> -	if (!msm_dp_display->power_on)
>> -		return 0;
>> -
>>   	/* wait only if audio was enabled */
>>   	if (msm_dp_display->audio_enabled) {
>>   		/* signal the disconnect event */
>> @@ -889,6 +916,14 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
>>   	}
>>   
>>   	msm_dp_display->audio_enabled = false;
>> +}
>> +
>> +static int msm_dp_display_disable(struct msm_dp_display_private *dp)
>> +{
>> +	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
>> +
>> +	if (!msm_dp_display->power_on)
>> +		return 0;
>>   
>>   	if (dp->link->sink_count == 0) {
>>   		/*
>> @@ -1506,9 +1541,8 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>>   	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
>>   	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
>>   	int rc = 0;
>> +
>>   	struct msm_dp_display_private *msm_dp_display;
>> -	u32 hpd_state;
>> -	bool force_link_train = false;
>>   
>>   	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
>>   
>> @@ -1516,29 +1550,23 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>>   		msm_dp_hpd_plug_handle(msm_dp_display, 0);
>>   
>>   	mutex_lock(&msm_dp_display->event_mutex);
>> -	if (pm_runtime_resume_and_get(&dp->pdev->dev)) {
>> -		DRM_ERROR("failed to pm_runtime_resume\n");
>> -		mutex_unlock(&msm_dp_display->event_mutex);
>> -		return;
>> -	}
>>   
>> -	hpd_state = msm_dp_display->hpd_state;
>> -	if (hpd_state == ST_DISCONNECT_PENDING) {
>> +	rc = msm_dp_display_prepare(msm_dp_display);
>> +	if (rc) {
>> +		DRM_ERROR("DP display prepare failed, rc=%d\n", rc);
>>   		mutex_unlock(&msm_dp_display->event_mutex);
>>   		return;
>>   	}
>>   
>> -	if (hpd_state == ST_CONNECTED && !dp->power_on) {
>> -		msm_dp_display_host_phy_init(msm_dp_display);
>> -		force_link_train = true;
>> -	}
>> -
>> -	msm_dp_display_enable(msm_dp_display, force_link_train);
>> -
>> -	rc = msm_dp_display_post_enable(dp);
>> -	if (rc) {
>> -		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
>> -		msm_dp_display_disable(msm_dp_display);
>> +	if (dp->prepared) {
>> +		rc = msm_dp_display_enable(msm_dp_display);
>> +		if (rc)
>> +			DRM_ERROR("DP display enable failed, rc=%d\n", rc);
>> +		rc = msm_dp_display_post_enable(dp);
>> +		if (rc) {
>> +			DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
>> +			msm_dp_display_disable(msm_dp_display);
>> +		}
>>   	}
>>   
>>   	/* completed connection */
>> @@ -1560,6 +1588,20 @@ void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
>>   	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
>>   }
>>   
>> +static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
>> +{
>> +	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
>> +
>> +	if (!msm_dp_display->prepared) {
>> +		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
>> +		return;
>> +	}
> 
> Why/ how is it possible?
> 
will check it.
>> +
>> +	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
>> +
>> +	msm_dp_display->prepared = false;
>> +}
>> +
>>   void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
>>   				       struct drm_atomic_state *state)
>>   {
>> @@ -1580,6 +1622,8 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
>>   		drm_dbg_dp(dp->drm_dev, "type=%d wrong hpd_state=%d\n",
>>   			   dp->connector_type, hpd_state);
>>   
>> +	msm_dp_display_audio_notify_disable(msm_dp_display);
>> +
>>   	msm_dp_display_disable(msm_dp_display);
>>   
>>   	hpd_state =  msm_dp_display->hpd_state;
>> @@ -1588,9 +1632,10 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
>>   		msm_dp_display->hpd_state = ST_DISCONNECTED;
>>   	}
>>   
>> +	msm_dp_display_unprepare(msm_dp_display);
>> +
>>   	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
>>   
>> -	pm_runtime_put_sync(&dp->pdev->dev);
>>   	mutex_unlock(&msm_dp_display->event_mutex);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
>> index cc6e2cab36e9c0b1527ff292e547cbb4d69fd95c..2394840e9f28e136705004c3e6af93fbe13c33c5 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
>> @@ -19,6 +19,7 @@ struct msm_dp {
>>   	bool link_ready;
>>   	bool audio_enabled;
>>   	bool power_on;
>> +	bool prepared;
>>   	unsigned int connector_type;
>>   	bool is_edp;
>>   	bool internal_hpd;
>>
>> -- 
>> 2.34.1
>>
> 

