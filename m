Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D376567A092
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 18:55:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700B410E6EF;
	Tue, 24 Jan 2023 17:55:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E04E10E6EF;
 Tue, 24 Jan 2023 17:55:41 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30OFUUYS013935; Tue, 24 Jan 2023 17:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=xgcmdcjZnlgpYJHs1+B07ouOtCwgaQCoWvzpIF3emyg=;
 b=HwgucALZ4rCoRsEgqb490FHKPB9zyS8bHr9HtO1i6J6C1D1qiXTxc+gnevhRj6t7cF/f
 Jwz1iS11dk2m2t1jq/3zwssi7RLyIXZNcxzCdAb1xBiEFRv/QcFTixHLXfqNd0GNZQWg
 sDDV76EDhnFdZ5H4i1txhG2BuqHG/mJAegKup+qCdI26Q5Ip5+6O1U7q1WJyKLU6CvJM
 AHwNGQWHUeVQHqluMEt/FZrkqV+qALaUEjYUBoDHx9cioktb84WvEvTIgxr4OtwjtBLO
 oC47KS/awCDWnV0LNx7nax+O5WR46Da5OC05LibybIzzGhhiGnIytelRPFx/xoUAQ62q eQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nag308kr3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Jan 2023 17:55:35 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30OHtYjn023560
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Jan 2023 17:55:34 GMT
Received: from [10.134.70.75] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 24 Jan
 2023 09:55:33 -0800
Message-ID: <3588a5d0-ca28-918f-e072-35f15a5a5132@quicinc.com>
Date: Tue, 24 Jan 2023 09:55:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 12/14] drm/msm/disp/dpu1: revise timing engine
 programming to work for DSC
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <andersson@kernel.org>
References: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
 <1674498274-6010-13-git-send-email-quic_khsieh@quicinc.com>
 <8392e1f3-8459-4408-41de-564a41980b4c@linaro.org>
Content-Language: en-US
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <8392e1f3-8459-4408-41de-564a41980b4c@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: V_FzY4BryDHgEJOLC5VMcYC3pmLrF0fM
X-Proofpoint-GUID: V_FzY4BryDHgEJOLC5VMcYC3pmLrF0fM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-24_13,2023-01-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301240162
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/24/2023 1:11 AM, Dmitry Baryshkov wrote:
> On 23/01/2023 20:24, Kuogee Hsieh wrote:
>> Current implementation timing engine programming does not consider
>> compression factors. This patch add consideration of DSC factors
>> while programming timing engine.
>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   2 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  14 ++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        | 132 
>> +++++++++++++--------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  10 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |   6 +-
>>   5 files changed, 110 insertions(+), 54 deletions(-)
>>
>
> [skipped]
>
>> @@ -113,82 +124,96 @@ static void 
>> dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>>       /* read interface_cfg */
>>       intf_cfg = DPU_REG_READ(c, INTF_CONFIG);
>>   -    if (ctx->cap->type == INTF_DP)
>> +    if (ctx->cap->type == INTF_EDP || ctx->cap->type == INTF_DP)
>>           dp_intf = true;
>>         hsync_period = p->hsync_pulse_width + p->h_back_porch + 
>> p->width +
>> -    p->h_front_porch;
>> +            p->h_front_porch;
>>       vsync_period = p->vsync_pulse_width + p->v_back_porch + 
>> p->height +
>> -    p->v_front_porch;
>> +            p->v_front_porch;
>
> Actually I went on through the history and found the previous 
> submission, https://patchwork.freedesktop.org/patch/471505/.
> Exactly the same piece of code. Did you expect that the comments will 
> be different this time?
>
> I really hoped that at that time we already went through this. But it 
> seems I was wrong. That series went through v10 or v12 before being 
> accepted. And it was just adding wide_bus_en. Back at that time we 
> lightly discussed that the code will receive compression support. But 
> I never expected to see the original submission again.
>
> It might sound bad, but could you please find somebody who can do 
> internal review for you? Good internal review.
>
> That said, I really do not expect to see v2 before the whole series is 
> reworked, restructured and prepared for the review on your side.

This timing engine code is derived from our downstream code directly and 
it has been used at many mobile devices by many vendors for many years 
already.

On the other words, it had been tested very thorough and works on 
dsi/dp/hdmi/dsc/widebus applications.

When i brought dsc v1.2 over, I just merged it over and did not consider 
too much.

Can we adapt this code so that both upstream and down stream shared same 
timing engine programming so that easier to maintain?





>
>>         display_v_start = ((p->vsync_pulse_width + p->v_back_porch) *
>> -    hsync_period) + p->hsync_skew;
>> +            hsync_period) + p->hsync_skew;
>>       display_v_end = ((vsync_period - p->v_front_porch) * 
>> hsync_period) +
>> -    p->hsync_skew - 1;
>> +            p->hsync_skew - 1;
>> +
>> +    hsync_ctl = (hsync_period << 16) | p->hsync_pulse_width;
>>         hsync_start_x = p->h_back_porch + p->hsync_pulse_width;
>>       hsync_end_x = hsync_period - p->h_front_porch - 1;
>>   -    if (p->width != p->xres) { /* border fill added */
>> -        active_h_start = hsync_start_x;
>> -        active_h_end = active_h_start + p->xres - 1;
>> -    } else {
>> -        active_h_start = 0;
>> -        active_h_end = 0;
>> -    }
>> -
>> -    if (p->height != p->yres) { /* border fill added */
>> -        active_v_start = display_v_start;
>> -        active_v_end = active_v_start + (p->yres * hsync_period) - 1;
>> -    } else {
>> -        active_v_start = 0;
>> -        active_v_end = 0;
>> -    }
>> -
>> -    if (active_h_end) {
>> -        active_hctl = (active_h_end << 16) | active_h_start;
>> -        intf_cfg |= INTF_CFG_ACTIVE_H_EN;
>> -    } else {
>> -        active_hctl = 0;
>> -    }
>> -
>> -    if (active_v_end)
>> -        intf_cfg |= INTF_CFG_ACTIVE_V_EN;
>> -
>> -    hsync_ctl = (hsync_period << 16) | p->hsync_pulse_width;
>> -    display_hctl = (hsync_end_x << 16) | hsync_start_x;
>> -
>>       /*
>>        * DATA_HCTL_EN controls data timing which can be different from
>>        * video timing. It is recommended to enable it for all cases, 
>> except
>>        * if compression is enabled in 1 pixel per clock mode
>>        */
>> +    if (!p->compression_en || p->wide_bus_en)
>> +        intf_cfg2 |= INTF_CFG2_DATA_HCTL_EN;
>> +
>>       if (p->wide_bus_en)
>> -        intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN | INTF_CFG2_DATA_HCTL_EN;
>> +        intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN;
>>   +    /*
>> +     * If widebus is disabled:
>> +     * For uncompressed stream, the data is valid for the entire active
>> +     * window period.
>> +     * For compressed stream, data is valid for a shorter time period
>> +     * inside the active window depending on the compression ratio.
>> +     *
>> +     * If widebus is enabled:
>> +     * For uncompressed stream, data is valid for only half the active
>> +     * window, since the data rate is doubled in this mode.
>> +     * p->width holds the adjusted width for DP but unadjusted width 
>> for DSI
>> +     * For compressed stream, data validity window needs to be 
>> adjusted for
>> +     * compression ratio and then further halved.
>> +     */
>>       data_width = p->width;
>>   +    if (p->compression_en) {
>> +        if (p->wide_bus_en)
>> +            data_width = DIV_ROUND_UP(p->dce_bytes_per_line, 6);
>> +        else
>> +            data_width = DIV_ROUND_UP(p->dce_bytes_per_line, 3);
>> +    } else if (!dp_intf && p->wide_bus_en) {
>> +        data_width = p->width >> 1;
>> +    } else {
>> +        data_width = p->width;
>> +    }
>> +
>>       hsync_data_start_x = hsync_start_x;
>>       hsync_data_end_x =  hsync_start_x + data_width - 1;
>>   +    display_hctl = (hsync_end_x << 16) | hsync_start_x;
>>       display_data_hctl = (hsync_data_end_x << 16) | hsync_data_start_x;
>>         if (dp_intf) {
>>           /* DP timing adjustment */
>>           display_v_start += p->hsync_pulse_width + p->h_back_porch;
>>           display_v_end   -= p->h_front_porch;
>> +    }
>> +
>> +    intf_cfg |= INTF_CFG_ACTIVE_H_EN;
>> +    intf_cfg |= INTF_CFG_ACTIVE_V_EN;
>> +    active_h_start = hsync_start_x;
>> +    active_h_end = active_h_start + p->xres - 1;
>> +    active_v_start = display_v_start;
>> +    active_v_end = active_v_start + (p->yres * hsync_period) - 1;
>>   -        active_h_start = hsync_start_x;
>> -        active_h_end = active_h_start + p->xres - 1;
>> -        active_v_start = display_v_start;
>> -        active_v_end = active_v_start + (p->yres * hsync_period) - 1;
>> +    active_hctl = (active_h_end << 16) | active_h_start;
>>   -        active_hctl = (active_h_end << 16) | active_h_start;
>> +    if (dp_intf) {
>>           display_hctl = active_hctl;
>>   -        intf_cfg |= INTF_CFG_ACTIVE_H_EN | INTF_CFG_ACTIVE_V_EN;
>> +        if (p->compression_en) {
>> +            active_data_hctl = (hsync_start_x + p->extra_dto_cycles) 
>> << 16;
>> +            active_data_hctl += hsync_start_x;
>> +
>> +            display_data_hctl = active_data_hctl;
>> +        }
>>       }
>>   +    _check_and_set_comp_bit(ctx, p->dsc_4hs_merge, 
>> p->compression_en, &intf_cfg2);
>> +
>>       den_polarity = 0;
>>       if (ctx->cap->type == INTF_HDMI) {
>>           hsync_polarity = p->yres >= 720 ? 0 : 1;
>> @@ -202,7 +227,7 @@ static void 
>> dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>
