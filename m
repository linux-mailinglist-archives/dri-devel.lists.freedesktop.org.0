Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 769BB653A77
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 03:07:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E0D10E1A7;
	Thu, 22 Dec 2022 02:07:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856B110E1A7;
 Thu, 22 Dec 2022 02:07:00 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BM1dL26016518; Thu, 22 Dec 2022 02:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=zkWvUSBnP20ddkxvN6E5/cdG0NV6gDxxPBwuoJ1Kswo=;
 b=KOxsq9gr0JFlPlOFCRoXA7KhPC1SOcKpHgccHme0dRktUwfnfocNQGszluDhr1kqItQK
 moI8MqPu2t55+uwkmOFLd+xDL6lXJxMCerThRrCWMsMWV1KQN2cBfIRYCdDClx63TDyC
 tWl04n5vjPt/8lQWFGTipZa37C6iydDLsPyembP9e56/OjY6VgKpe65fxX2iLUOH3rzT
 3QbvTgQVoquH9dXyfHtLma+3F7uGLOhl5QPWo1H8zdqysAOzJbE60hnXF3J55gqY973o
 85H56deGqUcVD65Cxv5N5n4Sh1rtk5hqQ7pTFU1zmDJ8wP61CylBBPVnB6BxW8HbgZyz 9Q== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mm6hmgw67-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Dec 2022 02:06:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BM26tSE002060
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Dec 2022 02:06:55 GMT
Received: from [10.110.27.24] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 21 Dec
 2022 18:06:54 -0800
Message-ID: <23c03959-764c-bd4a-79db-5af48799991f@quicinc.com>
Date: Wed, 21 Dec 2022 18:06:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 1/2] drm/msm/dsi: add a helper method to compute the dsi
 byte clk
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <1663807768-23969-1-git-send-email-quic_abhinavk@quicinc.com>
 <dea86c81-449a-3296-d5de-c3b346f974e4@linaro.org>
 <350c27fb-3d13-9252-6fa3-f67b7cc47444@quicinc.com>
 <c77e5aad-d21c-e880-8ef3-081aeac86240@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <c77e5aad-d21c-e880-8ef3-081aeac86240@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: g3SQY5B3bs1RslMWlpBS1K8SGwNFx59V
X-Proofpoint-ORIG-GUID: g3SQY5B3bs1RslMWlpBS1K8SGwNFx59V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_14,2022-12-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212220015
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
Cc: dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry

Sorry for the late response.

On 10/31/2022 5:20 PM, Dmitry Baryshkov wrote:
> On 28/10/2022 01:22, Abhinav Kumar wrote:
>>
>>
>> On 10/27/2022 10:35 AM, Dmitry Baryshkov wrote:
>>> On 22/09/2022 03:49, Abhinav Kumar wrote:
>>>> Re-arrange the dsi_calc_pclk method to two helpers, one to
>>>> compute the DSI byte clk and the other to compute the pclk.
>>>>
>>>> This makes the separation of the two clean and also allows
>>>> clients to compute and use the dsi byte clk separately.
>>>>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> ---
>>>>   drivers/gpu/drm/msm/dsi/dsi.h      |  2 ++
>>>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 27 +++++++++++++++++++--------
>>>>   2 files changed, 21 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h 
>>>> b/drivers/gpu/drm/msm/dsi/dsi.h
>>>> index 2a96b4fe7839..60ba8e67f550 100644
>>>> --- a/drivers/gpu/drm/msm/dsi/dsi.h
>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
>>>> @@ -118,6 +118,8 @@ int dsi_link_clk_enable_6g(struct msm_dsi_host 
>>>> *msm_host);
>>>>   int dsi_link_clk_enable_v2(struct msm_dsi_host *msm_host);
>>>>   void dsi_link_clk_disable_6g(struct msm_dsi_host *msm_host);
>>>>   void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host);
>>>> +unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, 
>>>> bool is_bonded_dsi,
>>>> +        const struct drm_display_mode *mode);
>>>>   int dsi_tx_buf_alloc_6g(struct msm_dsi_host *msm_host, int size);
>>>>   int dsi_tx_buf_alloc_v2(struct msm_dsi_host *msm_host, int size);
>>>>   void *dsi_tx_buf_get_6g(struct msm_dsi_host *msm_host);
>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>>>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>> index 57a4c0fa614b..32b35d4ac1d3 100644
>>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>> @@ -569,9 +569,8 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host 
>>>> *msm_host)
>>>>       clk_disable_unprepare(msm_host->byte_clk);
>>>>   }
>>>> -static unsigned long dsi_get_pclk_rate(struct msm_dsi_host 
>>>> *msm_host, bool is_bonded_dsi)
>>>> +static unsigned long dsi_get_pclk_rate(const struct 
>>>> drm_display_mode *mode, bool is_bonded_dsi)
>>>>   {
>>>> -    struct drm_display_mode *mode = msm_host->mode;
>>>>       unsigned long pclk_rate;
>>>>       pclk_rate = mode->clock * 1000;
>>>> @@ -588,12 +587,18 @@ static unsigned long dsi_get_pclk_rate(struct 
>>>> msm_dsi_host *msm_host, bool is_bo
>>>>       return pclk_rate;
>>>>   }
>>>> -static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool 
>>>> is_bonded_dsi)
>>>> +unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, 
>>>> bool is_bonded_dsi,
>>>> +        const struct drm_display_mode *mode)
>>>>   {
>>>> +    struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>>>>       u8 lanes = msm_host->lanes;
>>>>       u32 bpp = dsi_get_bpp(msm_host->format);
>>>> -    unsigned long pclk_rate = dsi_get_pclk_rate(msm_host, 
>>>> is_bonded_dsi);
>>>> -    u64 pclk_bpp = (u64)pclk_rate * bpp;
>>>> +    unsigned long pclk_rate;
>>>> +    u64 pclk_bpp;
>>>> +
>>>> +    pclk_rate = dsi_get_pclk_rate(mode, is_bonded_dsi);
>>>> +
>>>> +    pclk_bpp = (u64)pclk_rate * bpp;
>>>>       if (lanes == 0) {
>>>>           pr_err("%s: forcing mdss_dsi lanes to 1\n", __func__);
>>>> @@ -606,8 +611,14 @@ static void dsi_calc_pclk(struct msm_dsi_host 
>>>> *msm_host, bool is_bonded_dsi)
>>>>       else
>>>>           do_div(pclk_bpp, (8 * lanes));
>>>> -    msm_host->pixel_clk_rate = pclk_rate;
>>>> -    msm_host->byte_clk_rate = pclk_bpp;
>>>> +    return pclk_bpp;
>>>> +}
>>>> +
>>>> +static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool 
>>>> is_bonded_dsi)
>>>> +{
>>>> +    msm_host->pixel_clk_rate = dsi_get_pclk_rate(msm_host->mode, 
>>>> is_bonded_dsi);
>>>> +    msm_host->byte_clk_rate = 
>>>> dsi_byte_clk_get_rate(&msm_host->base, is_bonded_dsi,
>>>> +            msm_host->mode);
>>>
>>> This way you are calling dsi_get_pclk_rate twice(), which is slightly 
>>> inefficient. You can call it once (here) and then pass the resulting 
>>> pclk_rate as an argument to dsi_byte_clk_get_rate().
>>
>> So the goal was to have two independent APIs to calculate byte and 
>> pixel clk.
>>
>> If we pass the output of one as the input to the other we are making 
>> them dependent.
>>
>> Thats why i kept it separate.
> 
> Calling one function from another clearly points that they are not 
> independent. And surely pixel and byte clocks can not be fully 
> independent. I see your point about getting only the byte clock. But I 
> think it would be easier to explicitly pass the pixel rate rather than 
> calculating it again under the hood.
> 

Yes, calling one function from another means they are dependent and 
thats true in this case because byte clk computation depends on the pclk.

The reason behind this separation was that in the next patch, we need to 
compute only the byte clock and use that to validate in the mode_valid 
against the opp table limits.

The opp table for DSI is based on the byte clk.

If we were to pass pclk as a parameter, then we would have to explicitly 
compute the pclk just to pass the parameter to the method which computes 
the byte clk. As opposed to this approach, where it just happens under 
the hood.

So for the purpose of the next patch I kept it this way.

Let me know what you think.

>>
>>>
>>>>       DBG("pclk=%lu, bclk=%lu", msm_host->pixel_clk_rate,
>>>>                   msm_host->byte_clk_rate);
>>>> @@ -635,7 +646,7 @@ int dsi_calc_clk_rate_v2(struct msm_dsi_host 
>>>> *msm_host, bool is_bonded_dsi)
>>>>       dsi_calc_pclk(msm_host, is_bonded_dsi);
>>>> -    pclk_bpp = (u64)dsi_get_pclk_rate(msm_host, is_bonded_dsi) * bpp;
>>>> +    pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, 
>>>> is_bonded_dsi) * bpp;
>>>
>>> So... We have calculated all rates, stored the pclk_rate in 
>>> msm_host->pixel_clk_rate. And now we are going to calculate it again. 
>>> As you are touching this line of code, I'd suggest to just use 
>>> msm_host->pixel_clk_rate instead of a function call.
>>
>> Ack, I will fix this.
>>
>>>
>>>>       do_div(pclk_bpp, 8);
>>>>       msm_host->src_clk_rate = pclk_bpp;
>>>
> 
