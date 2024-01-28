Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A31F83F3FF
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 06:18:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C4110E7BF;
	Sun, 28 Jan 2024 05:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE8B910E7BF;
 Sun, 28 Jan 2024 05:18:31 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40S57SAl030161; Sun, 28 Jan 2024 05:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=au9GA+55xmm8UAijpVmSgs0/Y+WGynAgtvobEvFRZsw=; b=jN
 xBx5Btewo3JkYvQkw4Ss4VNuudlWiEABmdrh96+UqQpB7QTIwxSISgtEDiKbafWt
 3aMCiuZFkFRK80r59OzHJmn+B5JwkWlZMVyvIYGDUBeN74Mvvvvrio69heuK7VxN
 lgX9LxHYYbCUzBk45cn6yeJVkaVaXtrU6fPT2lO5eERHovoqIUmMprCWDWBeUYTD
 0X0pVZ59MQ0M8ehOCW9xmhnMLtI3AFU0RdOIUMVgRc8r0VKc5O+3MIXaWv2kY5DQ
 SiFEhKX0T1u1mBdYHy2UHPbNl0ILDmXQfCZo/3xbUgpBp4w8Hu7mzUs9Wi2+4lsg
 C8tA74GSbDXYsQpW5Idw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvt7c1da4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 28 Jan 2024 05:18:29 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40S5ISf7031005
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 28 Jan 2024 05:18:28 GMT
Received: from [10.110.54.253] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sat, 27 Jan
 2024 21:18:26 -0800
Message-ID: <2b696a61-6555-4fcb-ab63-9b0d414c969a@quicinc.com>
Date: Sat, 27 Jan 2024 21:18:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 08/17] drm/msm/dp: change YUV420 related programming for DP
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-9-quic_parellan@quicinc.com>
 <c666a271-e12c-41ad-af38-42d0c5b513b1@linaro.org>
From: Paloma Arellano <quic_parellan@quicinc.com>
In-Reply-To: <c666a271-e12c-41ad-af38-42d0c5b513b1@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: O_BNgBvAE_ILnINZUqCBwbYWZ06hzU7A
X-Proofpoint-GUID: O_BNgBvAE_ILnINZUqCBwbYWZ06hzU7A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0 mlxlogscore=999
 mlxscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401280036
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


On 1/25/2024 1:29 PM, Dmitry Baryshkov wrote:
> On 25/01/2024 21:38, Paloma Arellano wrote:
>> Change all relevant DP controller related programming for YUV420 cases.
>> Namely, change the pixel clock math to consider YUV420, program the
>> configuration control to indicate YUV420, as well as modify the MVID
>> programming to consider YUV420.
>
> Too many items for a single commit.
Ack. In the next series, I'll keep the clock math and MVID related code 
in one patch. And configuration control code in another.
>
>>
>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_catalog.c |  5 ++++-
>>   drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 12 +++++++++---
>>   drivers/gpu/drm/msm/dp/dp_display.c |  8 +++++++-
>>   drivers/gpu/drm/msm/msm_kms.h       |  3 +++
>>   5 files changed, 24 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c 
>> b/drivers/gpu/drm/msm/dp/dp_catalog.c
>> index 5142aeb705a44..5d84c089e520a 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
>> @@ -442,7 +442,7 @@ void dp_catalog_ctrl_config_misc(struct 
>> dp_catalog *dp_catalog,
>>     void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
>>                       u32 rate, u32 stream_rate_khz,
>> -                    bool fixed_nvid)
>> +                    bool fixed_nvid, bool is_ycbcr_420)
>>   {
>>       u32 pixel_m, pixel_n;
>>       u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
>> @@ -485,6 +485,9 @@ void dp_catalog_ctrl_config_msa(struct dp_catalog 
>> *dp_catalog,
>>           nvid = temp;
>>       }
>>   +    if (is_ycbcr_420)
>> +        mvid /= 2;
>> +
>>       if (link_rate_hbr2 == rate)
>>           nvid *= 2;
>>   diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h 
>> b/drivers/gpu/drm/msm/dp/dp_catalog.h
>> index 38786e855b51a..6cb5e2a243de2 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
>> @@ -96,7 +96,7 @@ void dp_catalog_ctrl_mainlink_ctrl(struct 
>> dp_catalog *dp_catalog, bool enable);
>>   void dp_catalog_ctrl_psr_mainlink_enable(struct dp_catalog 
>> *dp_catalog, bool enable);
>>   void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog, u32 
>> cc, u32 tb);
>>   void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32 
>> rate,
>> -                u32 stream_rate_khz, bool fixed_nvid);
>> +                u32 stream_rate_khz, bool fixed_nvid, bool 
>> is_ycbcr_420);
>>   int dp_catalog_ctrl_set_pattern_state_bit(struct dp_catalog 
>> *dp_catalog, u32 pattern);
>>   u32 dp_catalog_hw_revision(const struct dp_catalog *dp_catalog);
>>   void dp_catalog_ctrl_reset(struct dp_catalog *dp_catalog);
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c 
>> b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index 77a8d9366ed7b..209cf2a35642f 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -128,6 +128,9 @@ static void dp_ctrl_config_ctrl(struct 
>> dp_ctrl_private *ctrl)
>>       /* Default-> LSCLK DIV: 1/4 LCLK  */
>>       config |= (2 << DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT);
>>   +    if (ctrl->panel->dp_mode.out_fmt_is_yuv_420)
>> +        config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
>> +
>
> This definitely is not related to clock rate calculations.
This is related to the configuration control register.
>
>>       /* Scrambler reset enable */
>>       if (drm_dp_alternate_scrambler_reset_cap(dpcd))
>>           config |= DP_CONFIGURATION_CTRL_ASSR;
>> @@ -957,7 +960,7 @@ static void dp_ctrl_calc_tu_parameters(struct 
>> dp_ctrl_private *ctrl,
>>       in.hporch = drm_mode->htotal - drm_mode->hdisplay;
>>       in.nlanes = ctrl->link->link_params.num_lanes;
>>       in.bpp = ctrl->panel->dp_mode.bpp;
>> -    in.pixel_enc = 444;
>> +    in.pixel_enc = ctrl->panel->dp_mode.out_fmt_is_yuv_420 ? 420 : 444;
>>       in.dsc_en = 0;
>>       in.async_en = 0;
>>       in.fec_en = 0;
>> @@ -1763,6 +1766,8 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>>           ctrl->link->link_params.rate = rate;
>>           ctrl->link->link_params.num_lanes =
>>               ctrl->panel->link_info.num_lanes;
>> +        if (ctrl->panel->dp_mode.out_fmt_is_yuv_420)
>> +            pixel_rate >>= 1;
>>       }
>>         drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d, 
>> pixel_rate=%lu\n",
>> @@ -1878,7 +1883,7 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, 
>> bool force_link_train)
>>         pixel_rate = pixel_rate_orig = 
>> ctrl->panel->dp_mode.drm_mode.clock;
>>   -    if (dp_ctrl->wide_bus_en)
>> +    if (dp_ctrl->wide_bus_en || 
>> ctrl->panel->dp_mode.out_fmt_is_yuv_420)
>>           pixel_rate >>= 1;
>>         drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d, 
>> pixel_rate=%lu\n",
>> @@ -1917,7 +1922,8 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, 
>> bool force_link_train)
>>         dp_catalog_ctrl_config_msa(ctrl->catalog,
>>           ctrl->link->link_params.rate,
>> -        pixel_rate_orig, dp_ctrl_use_fixed_nvid(ctrl));
>> +        pixel_rate_orig, dp_ctrl_use_fixed_nvid(ctrl),
>> +        ctrl->panel->dp_mode.out_fmt_is_yuv_420);
>>         dp_ctrl_setup_tr_unit(ctrl);
>>   diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index f6b3b6ca242f8..6d764f5b08727 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -916,9 +916,10 @@ enum drm_mode_status dp_bridge_mode_valid(struct 
>> drm_bridge *bridge,
>>       const u32 num_components = 3, default_bpp = 24;
>>       struct dp_display_private *dp_display;
>>       struct dp_link_info *link_info;
>> -    u32 mode_rate_khz = 0, supported_rate_khz = 0, mode_bpp = 0;
>>       struct msm_dp *dp;
>>       int mode_pclk_khz = mode->clock;
>> +    int rate_ratio = RGB_24BPP_TMDS_CHAR_RATE_RATIO;
>> +    u32 mode_rate_khz = 0, supported_rate_khz = 0, mode_bpp = 0;
>>         dp = to_dp_bridge(bridge)->dp_display;
>>   @@ -933,6 +934,11 @@ enum drm_mode_status 
>> dp_bridge_mode_valid(struct drm_bridge *bridge,
>>       dp_display = container_of(dp, struct dp_display_private, 
>> dp_display);
>>       link_info = &dp_display->panel->link_info;
>>   +    if (drm_mode_is_420_only(&dp->connector->display_info, mode))
>> +        rate_ratio = YUV420_24BPP_TMDS_CHAR_RATE_RATIO;
>> +
>> +    mode_pclk_khz /= rate_ratio;
>
> I think it will be more obvious and simple to write:
>
> if (drm_mode_is_420...)
>     mode_pclk_khz /= 2;
Ack
>
>
>> +
>>       mode_bpp = dp->connector->display_info.bpc * num_components;
>>       if (!mode_bpp)
>>           mode_bpp = default_bpp;
>> diff --git a/drivers/gpu/drm/msm/msm_kms.h 
>> b/drivers/gpu/drm/msm/msm_kms.h
>> index 44aa435d68ce2..66e8151951807 100644
>> --- a/drivers/gpu/drm/msm/msm_kms.h
>> +++ b/drivers/gpu/drm/msm/msm_kms.h
>> @@ -15,6 +15,9 @@
>>     #define MAX_PLANE    4
>>   +#define RGB_24BPP_TMDS_CHAR_RATE_RATIO        1
>> +#define YUV420_24BPP_TMDS_CHAR_RATE_RATIO    2
>> +
>>   /* As there are different display controller blocks depending on the
>>    * snapdragon version, the kms support is split out and the 
>> appropriate
>>    * implementation is loaded at runtime.  The kms module is responsible
>
