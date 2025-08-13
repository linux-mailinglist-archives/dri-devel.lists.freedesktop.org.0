Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3469DB248E9
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 13:57:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A1E10E4EF;
	Wed, 13 Aug 2025 11:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="loiZe62l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE71810E4EE;
 Wed, 13 Aug 2025 11:56:59 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLhio020736;
 Wed, 13 Aug 2025 11:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ScSNKkjpVNqkt8xw0KExEZDqJCC3ogyqFs0kGjXvUNs=; b=loiZe62lb9RT6XMg
 ikGdyrAHtIOgkGWlLPXUHA69P0IWhp6nMoHkAsP+AUYyuTmDv59PTaD6WsCNKFGl
 COiMAwqgQszDY0gPMkVUY21o/9pl/5+0jQNKAzeXokRJW2B6BiJrar3uJuyCHD6j
 xIgyvIojSWJLjffXMulBqlLs3W26dzG7uWQHgvRz1Uu9o//jNI0kQQvvlgF9X0H3
 LXyvT+9OxePSrQCWVdib9izxGGDevGC2lbfcgQImZeaYCB20Oz/l21lx3N+B2CUx
 6QG/eLnSXy7G0k5Pavu1wWavo6KFrVwFbZeiNPGtedKaxe/yB5kUNqF74aS7Wg7r
 fXMyhw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9suvj8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Aug 2025 11:56:48 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57DBum66030166
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Aug 2025 11:56:48 GMT
Received: from [10.133.33.43] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 13 Aug
 2025 04:56:44 -0700
Message-ID: <552ce804-1aa2-48ca-a68c-8a98621e7363@quicinc.com>
Date: Wed, 13 Aug 2025 19:56:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/38] drm/msm/dp: move the pixel clock control to its
 own API
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
 <20250609-msm-dp-mst-v2-6-a54d8902a23d@quicinc.com>
 <5b2lpjd2raqmowi466avustasdjsssl2tjwogd3ixjg7gi3dxv@cqtkbtcijnlc>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <5b2lpjd2raqmowi466avustasdjsssl2tjwogd3ixjg7gi3dxv@cqtkbtcijnlc>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689c7d80 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=hdPSHQnkDWgsf_opGwoA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: eIzyrElTwVyFL53DnzA7DeRQUIEXl9uy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX8xjwgCvuPyM/
 ag8VIySIzHToY+rMiF8YbYYdh6AT4lmP013p8+DUjVjwJiH6rzn5T4pQiWxTG3SvjQzT/m8uM6p
 xSOTE4qJOCFquS56rareFRBvJNDq/L8XKibJGEHJvuRmBJWwFd/h2fSLwR0Gvmz93AsudWkwJ76
 NGmASpibpBtBEOMYiIC9dlhHVmITkXN8Zem1+NFxvz+uSFP7zqj++cjDKaWa1qX6pNvZBicMuhE
 Dt9n1TREbPYQt/jZ8f8/uC7fsJQeLFDDs2xcacBRmWRVnAJZ+74YyE7K6ROoixTQGVzXNzUSlEZ
 l2QYjCgOdfLFs96L9ff0HlJqmiGkhF1cmEUWjrq3bR5HzfPBj6I3IkEEEuL1te27FMn7sGwpZ7I
 rMI5g5eh
X-Proofpoint-GUID: eIzyrElTwVyFL53DnzA7DeRQUIEXl9uy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
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



On 2025/6/9 21:16, Dmitry Baryshkov wrote:
> On Mon, Jun 09, 2025 at 08:21:25PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Enable/Disable of DP pixel clock happens in multiple code paths
>> leading to code duplication. Move it into individual helpers so that
>> the helpers can be called wherever necessary.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c | 98 +++++++++++++++++++++-------------------
>>   1 file changed, 52 insertions(+), 46 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index aee8e37655812439dfb65ae90ccb61b14e6e261f..ed00dd2538d98ddbc6bdcbd5fa154fd7043c48d6 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -97,7 +97,7 @@ struct msm_dp_ctrl_private {
>>   
>>   	bool core_clks_on;
>>   	bool link_clks_on;
>> -	bool stream_clks_on;
>> +	bool pixel_clks_on;
> 
> As you are touching this part, how many paths lead to pixel clock being
> enabled and/or disabled? Can we sort them out and drop this flag, making
> sure that the clock can be enabled only in one place and disabled in
> another one (hopefully)?
> 
Here we only have 2 paths to enable/disable pixel, 
1.msm_dp_ctrl_process_phy_test_request 2.msm_dp_display_enable/disable.
both of them are in pairs. Maybe we can keep this state to make it 
easier to access the on/off status of each of them in the case of 4 MST 
streams. when we get the snapshot of the pixel clk, we can visit here.
>>   };
>>   
>>   static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
>> @@ -1406,8 +1406,8 @@ int msm_dp_ctrl_core_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl)
>>   	ctrl->core_clks_on = true;
>>   
>>   	drm_dbg_dp(ctrl->drm_dev, "enable core clocks \n");
>> -	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
>> -		   str_on_off(ctrl->stream_clks_on),
>> +	drm_dbg_dp(ctrl->drm_dev, "pixel_clks:%s link_clks:%s core_clks:%s\n",
>> +		   str_on_off(ctrl->pixel_clks_on),
>>   		   str_on_off(ctrl->link_clks_on),
>>   		   str_on_off(ctrl->core_clks_on));
>>   
>> @@ -1425,8 +1425,8 @@ void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl)
>>   	ctrl->core_clks_on = false;
>>   
>>   	drm_dbg_dp(ctrl->drm_dev, "disable core clocks \n");
>> -	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
>> -		   str_on_off(ctrl->stream_clks_on),
>> +	drm_dbg_dp(ctrl->drm_dev, "pixel_clks:%s link_clks:%s core_clks:%s\n",
>> +		   str_on_off(ctrl->pixel_clks_on),
>>   		   str_on_off(ctrl->link_clks_on),
>>   		   str_on_off(ctrl->core_clks_on));
>>   }
>> @@ -1456,8 +1456,8 @@ static int msm_dp_ctrl_link_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl)
>>   	ctrl->link_clks_on = true;
>>   
>>   	drm_dbg_dp(ctrl->drm_dev, "enable link clocks\n");
>> -	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
>> -		   str_on_off(ctrl->stream_clks_on),
>> +	drm_dbg_dp(ctrl->drm_dev, "pixel_clks:%s link_clks:%s core_clks:%s\n",
>> +		   str_on_off(ctrl->pixel_clks_on),
>>   		   str_on_off(ctrl->link_clks_on),
>>   		   str_on_off(ctrl->core_clks_on));
>>   
>> @@ -1475,8 +1475,8 @@ static void msm_dp_ctrl_link_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl)
>>   	ctrl->link_clks_on = false;
>>   
>>   	drm_dbg_dp(ctrl->drm_dev, "disabled link clocks\n");
>> -	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
>> -		   str_on_off(ctrl->stream_clks_on),
>> +	drm_dbg_dp(ctrl->drm_dev, "pixel_clks:%s link_clks:%s core_clks:%s\n",
>> +		   str_on_off(ctrl->pixel_clks_on),
>>   		   str_on_off(ctrl->link_clks_on),
>>   		   str_on_off(ctrl->core_clks_on));
>>   }
>> @@ -1737,6 +1737,42 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
>>   	return success;
>>   }
>>   
>> +static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned long pixel_rate)
>> +{
>> +	int ret;
>> +
>> +	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
>> +	if (ret) {
>> +		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	if (ctrl->pixel_clks_on) {
>> +		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
>> +	} else {
>> +		ret = clk_prepare_enable(ctrl->pixel_clk);
>> +		if (ret) {
>> +			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
>> +			return ret;
>> +		}
>> +		ctrl->pixel_clks_on = true;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
>> +{
>> +	struct msm_dp_ctrl_private *ctrl;
>> +
>> +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>> +
>> +	if (ctrl->pixel_clks_on) {
>> +		clk_disable_unprepare(ctrl->pixel_clk);
>> +		ctrl->pixel_clks_on = false;
>> +	}
>> +}
>> +
>>   static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl,
>>   						struct msm_dp_panel *msm_dp_panel)
>>   {
>> @@ -1763,22 +1799,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
>>   	}
>>   
>>   	pixel_rate = msm_dp_panel->msm_dp_mode.drm_mode.clock;
>> -	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
>> -	if (ret) {
>> -		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
>> -		return ret;
>> -	}
>> -
>> -	if (ctrl->stream_clks_on) {
>> -		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
>> -	} else {
>> -		ret = clk_prepare_enable(ctrl->pixel_clk);
>> -		if (ret) {
>> -			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
>> -			return ret;
>> -		}
>> -		ctrl->stream_clks_on = true;
>> -	}
>> +	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
>>   
>>   	msm_dp_ctrl_send_phy_test_pattern(ctrl);
>>   
>> @@ -1998,8 +2019,8 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_li
>>   		   ctrl->link->link_params.num_lanes);
>>   
>>   	drm_dbg_dp(ctrl->drm_dev,
>> -		   "core_clk_on=%d link_clk_on=%d stream_clk_on=%d\n",
>> -		   ctrl->core_clks_on, ctrl->link_clks_on, ctrl->stream_clks_on);
>> +		   "core_clk_on=%d link_clk_on=%d pixel_clks_on=%d\n",
>> +		   ctrl->core_clks_on, ctrl->link_clks_on, ctrl->pixel_clks_on);
>>   
>>   	if (!ctrl->link_clks_on) { /* link clk is off */
>>   		ret = msm_dp_ctrl_enable_mainlink_clocks(ctrl);
>> @@ -2038,21 +2059,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>>   
>>   	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
>>   
>> -	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
>> +	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
>>   	if (ret) {
>> -		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
>> -		goto end;
>> -	}
>> -
>> -	if (ctrl->stream_clks_on) {
>> -		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
>> -	} else {
>> -		ret = clk_prepare_enable(ctrl->pixel_clk);
>> -		if (ret) {
>> -			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
>> -			goto end;
>> -		}
>> -		ctrl->stream_clks_on = true;
>> +		DRM_ERROR("failed to enable pixel clk\n");
>> +		return ret;
>>   	}
>>   
>>   	/*
>> @@ -2080,7 +2090,6 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>>   	drm_dbg_dp(ctrl->drm_dev,
>>   		"mainlink %s\n", mainlink_ready ? "READY" : "NOT READY");
>>   
>> -end:
>>   	return ret;
>>   }
>>   
>> @@ -2154,10 +2163,7 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
>>   
>>   	msm_dp_catalog_ctrl_reset(ctrl->catalog);
>>   
>> -	if (ctrl->stream_clks_on) {
>> -		clk_disable_unprepare(ctrl->pixel_clk);
>> -		ctrl->stream_clks_on = false;
>> -	}
>> +	msm_dp_ctrl_off_pixel_clk(msm_dp_ctrl);
>>   
>>   	dev_pm_opp_set_rate(ctrl->dev, 0);
>>   	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
>>
>> -- 
>> 2.34.1
>>
> 

