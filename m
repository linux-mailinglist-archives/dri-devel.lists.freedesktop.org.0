Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C21DAB2460B
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 11:52:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3F610E6C1;
	Wed, 13 Aug 2025 09:52:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="LSob99fV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE6610E6C1;
 Wed, 13 Aug 2025 09:52:15 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mJsQ025986;
 Wed, 13 Aug 2025 09:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /d2pP3eikutOq1UWe80VMn/eSPyNptjb0CHW7cqF0gk=; b=LSob99fVcCZ2Aj9T
 SSQZnH2hIt9aC+wlUW8jS7TFoAHBHVnZV16GOsKyIH90kzyVaPst/7qpF9p6Xw6D
 IYg/qX+xYCc+vJEElYoV9iHCxVuJ78rcJd3kO21hfwHYj3mdcgzqxzrvxOU0RiCM
 k6mMGMmGrFkjwGSBqiitOheScK/sdZJZkO/XlwLA0LDMF5WMx64Y6u27gDAfBO4k
 XTAWlMzBFndYz94dzNNJ8Pi5GQ5BpxdX3c9uMMwcVP+JSk0F5xoQ0ygY6pT8n29N
 0AD4rqa+f8tHn+NmkdHxkoTPiJphL4x773cnxBV9JAKLRA2pQpVmsEpGLmzE3Cx5
 cnLy/w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9suhy4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Aug 2025 09:52:11 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57D9qAMD027415
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Aug 2025 09:52:10 GMT
Received: from [10.133.33.43] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 13 Aug
 2025 02:52:06 -0700
Message-ID: <61834162-7e73-4467-9dd7-bfb1dcbd0afb@quicinc.com>
Date: Wed, 13 Aug 2025 17:52:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/38] drm/msm/dp: allow dp_ctrl stream APIs to use any
 panel passed to it
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
 <20250609-msm-dp-mst-v2-5-a54d8902a23d@quicinc.com>
 <5emeno6zpefewmysmmfb6s64mme32pzatgpzeu6hnuzgfi3q4t@i6zpgj5am3ie>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <5emeno6zpefewmysmmfb6s64mme32pzatgpzeu6hnuzgfi3q4t@i6zpgj5am3ie>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689c604b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=OfSDUUBKtISxzcSHUPkA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: SRDXNu8u84Es_D1A1GKQUbyd49YvZ4mw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX8JBF8/npCHTC
 TZqUScWbE06e6FTKxynDSopYo6ByTRIMJgIpKLdqrweUdFnHUBzYk0ggTCBMK+k7bYchdc8UbRL
 /+qquySH0ANA+BgwW25iFhc2++qxjbjzEzaBfeWdb0pfzrtj8UW8ViMR1tT+TCgm0WRubziy+Y3
 QoVhQ0bkqf6/1+0PWh96QSBIpw81Li0RtdK2c0JY2Y5J8T9KLOEHB40CVTSulaD1aFRQaYygNUN
 23eM75+LWsc+REk3ZKRQmVrdMR7lP+r3ntqXOSfn39PMgFaK3d1er+txRIRWRCS7OYac5zLCuUO
 713DPW4ubtjdD+OCQra+c1YoWY1UmNXAfe5HkS3RentIZ7C62jR83J65f844QEw0tz3pqfFq7xy
 lyG5ipjN
X-Proofpoint-GUID: SRDXNu8u84Es_D1A1GKQUbyd49YvZ4mw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015
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



On 2025/6/9 21:12, Dmitry Baryshkov wrote:
> On Mon, Jun 09, 2025 at 08:21:24PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Currently, the dp_ctrl stream APIs operate on their own dp_panel
>> which is cached inside the dp_ctrl's private struct. However with MST,
>> the cached panel represents the fixed link and not the sinks which
>> are hotplugged. Allow the stream related APIs to work on the panel
>> which is passed to them rather than the cached one. For SST cases,
>> this shall continue to use the cached dp_panel.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 37 ++++++++++++++++++++-----------------
>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  5 +++--
>>   drivers/gpu/drm/msm/dp/dp_display.c |  4 ++--
>>   3 files changed, 25 insertions(+), 21 deletions(-)
> 
> I think previous review comments got ignored. Please step back and
> review them. Maybe I should ask you to go back to v1 and actually check
> all the review comments there?
> 
Sorry for that.. i will check all the comments again.. thanks
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index 1ce3cca121d0c56b493e282c76eb9202371564cf..aee8e37655812439dfb65ae90ccb61b14e6e261f 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -135,7 +135,8 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
>>   	drm_dbg_dp(ctrl->drm_dev, "mainlink off\n");
>>   }
>>   
>> -static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
>> +static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl,
>> +				    struct msm_dp_panel *msm_dp_panel)
>>   {
>>   	u32 config = 0, tbd;
>>   	const u8 *dpcd = ctrl->panel->dpcd;
>> @@ -143,7 +144,7 @@ static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
>>   	/* Default-> LSCLK DIV: 1/4 LCLK  */
>>   	config |= (2 << DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT);
>>   
>> -	if (ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
>> +	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
>>   		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
>>   
>>   	/* Scrambler reset enable */
>> @@ -151,7 +152,7 @@ static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
>>   		config |= DP_CONFIGURATION_CTRL_ASSR;
>>   
>>   	tbd = msm_dp_link_get_test_bits_depth(ctrl->link,
>> -			ctrl->panel->msm_dp_mode.bpp);
>> +			msm_dp_panel->msm_dp_mode.bpp);
>>   
>>   	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
>>   
>> @@ -174,20 +175,21 @@ static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
>>   	msm_dp_catalog_ctrl_config_ctrl(ctrl->catalog, config);
>>   }
>>   
>> -static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl)
>> +static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl,
>> +						struct msm_dp_panel *msm_dp_panel)
>>   {
>>   	u32 cc, tb;
>>   
>>   	msm_dp_catalog_ctrl_lane_mapping(ctrl->catalog);
>>   	msm_dp_catalog_setup_peripheral_flush(ctrl->catalog);
>>   
>> -	msm_dp_ctrl_config_ctrl(ctrl);
>> +	msm_dp_ctrl_config_ctrl(ctrl, msm_dp_panel);
>>   
>>   	tb = msm_dp_link_get_test_bits_depth(ctrl->link,
>> -		ctrl->panel->msm_dp_mode.bpp);
>> +		msm_dp_panel->msm_dp_mode.bpp);
>>   	cc = msm_dp_link_get_colorimetry_config(ctrl->link);
>>   	msm_dp_catalog_ctrl_config_misc(ctrl->catalog, cc, tb);
>> -	msm_dp_panel_timing_cfg(ctrl->panel);
>> +	msm_dp_panel_timing_cfg(msm_dp_panel);
>>   }
>>   
>>   /*
>> @@ -1317,7 +1319,7 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
>>   	u8 assr;
>>   	struct msm_dp_link_info link_info = {0};
>>   
>> -	msm_dp_ctrl_config_ctrl(ctrl);
>> +	msm_dp_ctrl_config_ctrl(ctrl, ctrl->panel);
> 
> Could you please explain, when is it fine to use ctrl->panel and when it
> is not? Here you are passing msm_dp_panel to configure DP link for link
> training. I don't think we need the panel for that, so just using
> ctrl->panel here is incorrect too.
> 
Emm, If we need to program registers related to the pixel clock or DP 
link with MST(all of them need pass the stream_id to determine the 
register address), we should pass in msm_dp_panel. If we're only 
programming the other parts not related to the stream_id, passing in 
ctrl->panel is sufficient.
here in link tranning, it's right, we actually don't need to pass in the 
panel. But since in msm_dp_ctrl_config_ctrl, we will write config to 
DP0/DP1 CONFIGURATION_CTRL, even mst2/mst3 link CONFIGURATION_CTRL. and 
this func will also been called in msm_dp_ctrl_configure_source_params. 
so we need add ctrl->panel here.
>>   
>>   	link_info.num_lanes = ctrl->link->link_params.num_lanes;
>>   	link_info.rate = ctrl->link->link_params.rate;
>> @@ -1735,7 +1737,8 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
>>   	return success;
>>   }
>>   
>> -static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl)
>> +static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl,
>> +						struct msm_dp_panel *msm_dp_panel)
>>   {
>>   	int ret;
>>   	unsigned long pixel_rate;
>> @@ -1759,7 +1762,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
>>   		return ret;
>>   	}
>>   
>> -	pixel_rate = ctrl->panel->msm_dp_mode.drm_mode.clock;
>> +	pixel_rate = msm_dp_panel->msm_dp_mode.drm_mode.clock;
>>   	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
>>   	if (ret) {
>>   		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
>> @@ -1797,7 +1800,7 @@ void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl)
>>   
>>   	if (sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {
>>   		drm_dbg_dp(ctrl->drm_dev, "PHY_TEST_PATTERN request\n");
>> -		if (msm_dp_ctrl_process_phy_test_request(ctrl)) {
>> +		if (msm_dp_ctrl_process_phy_test_request(ctrl, ctrl->panel)) {
>>   			DRM_ERROR("process phy_test_req failed\n");
>>   			return;
>>   		}
>> @@ -2015,7 +2018,7 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_li
>>   	return ret;
>>   }
>>   
>> -int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
>> +int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel)
>>   {
>>   	int ret = 0;
>>   	bool mainlink_ready = false;
>> @@ -2028,9 +2031,9 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
>>   
>>   	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>>   
>> -	pixel_rate = pixel_rate_orig = ctrl->panel->msm_dp_mode.drm_mode.clock;
>> +	pixel_rate = pixel_rate_orig = msm_dp_panel->msm_dp_mode.drm_mode.clock;
>>   
>> -	if (msm_dp_ctrl->wide_bus_en || ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
>> +	if (msm_dp_ctrl->wide_bus_en || msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
>>   		pixel_rate >>= 1;
>>   
>>   	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
>> @@ -2058,12 +2061,12 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
>>   	 */
>>   	reinit_completion(&ctrl->video_comp);
>>   
>> -	msm_dp_ctrl_configure_source_params(ctrl);
>> +	msm_dp_ctrl_configure_source_params(ctrl, msm_dp_panel);
>>   
>>   	msm_dp_catalog_ctrl_config_msa(ctrl->catalog,
>>   		ctrl->link->link_params.rate,
>>   		pixel_rate_orig,
>> -		ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
>> +		msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420);
>>   
>>   	msm_dp_ctrl_setup_tr_unit(ctrl);
>>   
>> @@ -2081,7 +2084,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
>>   	return ret;
>>   }
>>   
>> -void msm_dp_ctrl_clear_vsc_sdp_pkt(struct msm_dp_ctrl *msm_dp_ctrl)
>> +void msm_dp_ctrl_clear_vsc_sdp_pkt(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *dp_panel)
>>   {
>>   	struct msm_dp_ctrl_private *ctrl;
>>   
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> index edbe5766db74c4e4179141d895f9cb85e514f29b..fbe458c5a17bda0586097a61d925f608d99f9224 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> @@ -18,7 +18,7 @@ struct msm_dp_ctrl {
>>   struct phy;
>>   
>>   int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
>> -int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl);
>> +int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel);
>>   int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *dp_ctrl, bool force_link_train);
>>   void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
>>   void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
>> @@ -41,7 +41,8 @@ void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl);
>>   int msm_dp_ctrl_core_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl);
>>   void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl);
>>   
>> -void msm_dp_ctrl_clear_vsc_sdp_pkt(struct msm_dp_ctrl *msm_dp_ctrl);
>> +void msm_dp_ctrl_clear_vsc_sdp_pkt(struct msm_dp_ctrl *msm_dp_ctrl,
>> +				   struct msm_dp_panel *msm_dp_panel);
>>   void msm_dp_ctrl_psm_config(struct msm_dp_ctrl *msm_dp_ctrl);
>>   void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
>>   
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index a5ca498cb970d0c6a4095b0b7fc6269c2dc3ad31..17ccea4047500848c4fb3eda87a10e29b18e0cfb 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -872,7 +872,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp)
>>   		return 0;
>>   	}
>>   
>> -	rc = msm_dp_ctrl_on_stream(dp->ctrl);
>> +	rc = msm_dp_ctrl_on_stream(dp->ctrl, dp->panel);
>>   	if (!rc)
>>   		msm_dp_display->power_on = true;
>>   
>> @@ -925,7 +925,7 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
>>   	if (!msm_dp_display->power_on)
>>   		return 0;
>>   
>> -	msm_dp_ctrl_clear_vsc_sdp_pkt(dp->ctrl);
>> +	msm_dp_ctrl_clear_vsc_sdp_pkt(dp->ctrl, dp->panel);
>>   
>>   	/* dongle is still connected but sinks are disconnected */
>>   	if (dp->link->sink_count == 0) {
>>
>> -- 
>> 2.34.1
>>
> 

