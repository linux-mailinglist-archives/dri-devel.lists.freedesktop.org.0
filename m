Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 859D283E8B7
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jan 2024 01:48:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75AF71120A7;
	Sat, 27 Jan 2024 00:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A6C1120A7;
 Sat, 27 Jan 2024 00:48:23 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40R0i4FO001078; Sat, 27 Jan 2024 00:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=MnAxDAbNGtyJ23OftgBBqqRdrenQrIuspzw8GCX6v9E=; b=kg
 C0H5T1epeP9Tq0wmiySRdL55UqDXx1bDZmU5FbHh4n+OurdzGjOcxXcp1GyqrIid
 VTkA94vzNaq7q34FaYyFZPPNoSxUEtxuBL1migGn82BlEu67tnTBVwkcYintWp1Z
 x2WucdxCfUjhhlVh/6xmIw5QJD9f2zOMXYaQPcwaD2coKYs6aQwg25Tpgrd7PoQ/
 wk3fTzJxiAKbdfQJS1YRfTucTeYQJMxRR9IQs6V3zpltiy3MGzHVKakfEtMKWynC
 peWYgAobluPqk1e3G6FbrrRajPF5q2lmcqgUEWtLPYbFvLIb6raLTLTOu76TjWFv
 MLyYtaIvcnfn9SMzBeMA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvqhmr06y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 27 Jan 2024 00:48:20 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40R0mJLL004184
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 27 Jan 2024 00:48:19 GMT
Received: from [10.110.17.189] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 16:48:18 -0800
Message-ID: <332892f0-41a4-1110-a39a-2571a5f5704e@quicinc.com>
Date: Fri, 26 Jan 2024 16:48:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 04/17] drm/msm/dp: store mode YUV420 information to be
 used by rest of DP
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-5-quic_parellan@quicinc.com>
 <0c6e94ef-4e9f-420b-92d9-785ee9f6ae30@linaro.org>
From: Paloma Arellano <quic_parellan@quicinc.com>
In-Reply-To: <0c6e94ef-4e9f-420b-92d9-785ee9f6ae30@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ON7zKdWT3s3SS9NXCdMue3XnAD8WkXdX
X-Proofpoint-ORIG-GUID: ON7zKdWT3s3SS9NXCdMue3XnAD8WkXdX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 clxscore=1015 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401270004
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
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/25/2024 1:20 PM, Dmitry Baryshkov wrote:
> On 25/01/2024 21:38, Paloma Arellano wrote:
>> Wide bus is not supported when the mode is YUV420 in DP. In preparation
>> for changing the DPU programming to reflect this, the value and
>> assignment location of wide_bus_en for the DP submodules must be
>> changed. Move it from boot time in dp_init_sub_modules() to run time in
>> dp_display_mode_set.
>>
>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++++++++++----
>>   drivers/gpu/drm/msm/dp/dp_panel.h   |  1 +
>>   2 files changed, 14 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 9df2a8b21021e..ddac55f45a722 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -784,10 +784,6 @@ static int dp_init_sub_modules(struct 
>> dp_display_private *dp)
>>           goto error_ctrl;
>>       }
>>   -    /* populate wide_bus_supported to different layers */
>> -    dp->ctrl->wide_bus_en = dp->wide_bus_supported;
>> -    dp->catalog->wide_bus_en = dp->wide_bus_supported;
>> -
>>       return rc;
>>     error_ctrl:
>> @@ -808,6 +804,7 @@ static int dp_display_set_mode(struct msm_dp 
>> *dp_display,
>>       drm_mode_copy(&dp->panel->dp_mode.drm_mode, &mode->drm_mode);
>>       dp->panel->dp_mode.bpp = mode->bpp;
>>       dp->panel->dp_mode.capabilities = mode->capabilities;
>> +    dp->panel->dp_mode.out_fmt_is_yuv_420 = mode->out_fmt_is_yuv_420;
>
> Why do we need it in dp_panel too?
Not sure if you saw in the other later patches, but I use the 
out_fmt_is_yuv_420 derived from dp_panel throughout dp_ctrl.c and dp_panel.c
>
>> dp_panel_init_panel_info(dp->panel);
>>       return 0;
>>   }
>> @@ -1402,6 +1399,9 @@ bool msm_dp_wide_bus_available(const struct 
>> msm_dp *dp_display)
>>         dp = container_of(dp_display, struct dp_display_private, 
>> dp_display);
>>   +    if (dp->dp_mode.out_fmt_is_yuv_420)
>> +        return false;
>> +
>>       return dp->wide_bus_supported;
>>   }
>>   @@ -1615,6 +1615,15 @@ void dp_bridge_mode_set(struct drm_bridge 
>> *drm_bridge,
>>         dp_display->dp_mode.h_active_low =
>>           !!(dp_display->dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
>> +
>> +    dp_display->dp_mode.out_fmt_is_yuv_420 =
>> + drm_mode_is_420_only(&dp->connector->display_info, adjusted_mode);
>> +
>> +    /* populate wide_bus_support to different layers */
>> +    dp_display->ctrl->wide_bus_en =
>> +        dp_display->dp_mode.out_fmt_is_yuv_420 ? false : 
>> dp_display->wide_bus_supported;
>> +    dp_display->catalog->wide_bus_en =
>> +        dp_display->dp_mode.out_fmt_is_yuv_420 ? false : 
>> dp_display->wide_bus_supported;
>>   }
>>     void dp_bridge_hpd_enable(struct drm_bridge *bridge)
>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h 
>> b/drivers/gpu/drm/msm/dp/dp_panel.h
>> index a0dfc579c5f9f..6ec68be9f2366 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
>> @@ -19,6 +19,7 @@ struct dp_display_mode {
>>       u32 bpp;
>>       u32 h_active_low;
>>       u32 v_active_low;
>> +    bool out_fmt_is_yuv_420;
>>   };
>>     struct dp_panel_in {
>
