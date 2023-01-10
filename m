Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B83F663775
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 03:41:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC7BB10E488;
	Tue, 10 Jan 2023 02:41:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0698D10E487;
 Tue, 10 Jan 2023 02:41:49 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30A1WloF026976; Tue, 10 Jan 2023 02:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8FTiAgEt8PvOuDggHw9Vw6W3d7yjB6WqGK/FLZRlnkU=;
 b=pZINAoLc13AH69JJ1ro6M1tcyBIza/NU8yKaM6os+uLRnbgdCSbbnWD/BIzt/ibtEpJO
 0HGqE8HlFq78plTsTi3AGk9vKAyKiQpR4vhyk6j7Bt88857bUjr/5oKiIAKqf5kDG6uQ
 NmA03z17SfUtSFn4Pnb/3aDJ6TVUylaCLUR0yI9FLzP17bN2x7JxFLnFpWyml+x1oXuQ
 XIC2wIiHaPdEs3aOfQiuVJIXrY3OUqjetE9dBduAiml3onem9+tuDim1ggQOWI7wsMOW
 oWEFDeBHKyVvgj9WgjiZDd0PVrtPQoYtYfgV+aj7q/rJHIbZ5p48ovS0eoacrS/dJA7O 8Q== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n0x0jg510-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jan 2023 02:41:44 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30A2fihj021022
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jan 2023 02:41:44 GMT
Received: from [10.110.115.72] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 9 Jan 2023
 18:41:43 -0800
Message-ID: <1342cf8f-44be-40ff-13c7-a61be48f1ec8@quicinc.com>
Date: Mon, 9 Jan 2023 18:41:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 1/2] drm/msm/dsi: add a helper method to compute the dsi
 byte clk
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <1663807768-23969-1-git-send-email-quic_abhinavk@quicinc.com>
 <36862c49-39d2-952d-829b-e660375d49f4@linaro.org>
 <cbe88a7e-c6a9-ab12-7dbf-f4efbfd7fd71@quicinc.com>
 <7b10f169-c1f3-09f8-a43e-409888fa4c40@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <7b10f169-c1f3-09f8-a43e-409888fa4c40@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: NsRU6geVpEzuNyWXDzzdFpszHBYTGq5D
X-Proofpoint-ORIG-GUID: NsRU6geVpEzuNyWXDzzdFpszHBYTGq5D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_16,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 mlxscore=0 adultscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301100015
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



On 1/9/2023 6:25 PM, Dmitry Baryshkov wrote:
> On 10/01/2023 04:21, Abhinav Kumar wrote:
>>
>>
>> On 1/9/2023 5:34 PM, Dmitry Baryshkov wrote:
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
>>>
>>> Any particular reason for this? The following patch would be more 
>>> obvious:
>>>
>>>  > -    unsigned long pclk_rate = dsi_get_pclk_rate(msm_host, 
>>> is_bonded_dsi);
>>>  > +    unsigned long pclk_rate = dsi_get_pclk_rate(mode, 
>>> is_bonded_dsi);
>>>  >      u64 pclk_bpp = (u64)pclk_rate * bpp;
>>>
>>>
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
>>>>       DBG("pclk=%lu, bclk=%lu", msm_host->pixel_clk_rate,
>>>>                   msm_host->byte_clk_rate);
>>>> @@ -635,7 +646,7 @@ int dsi_calc_clk_rate_v2(struct msm_dsi_host 
>>>> *msm_host, bool is_bonded_dsi)
>>>>       dsi_calc_pclk(msm_host, is_bonded_dsi);
>>>> -    pclk_bpp = (u64)dsi_get_pclk_rate(msm_host, is_bonded_dsi) * bpp;
>>>> +    pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, 
>>>> is_bonded_dsi) * bpp;
>>>>       do_div(pclk_bpp, 8);
>>>>       msm_host->src_clk_rate = pclk_bpp;
>>>
>>>
>>> Following my previous feedback:
>>>
>>> I think at this moment msm_host->src_clk_rate = 
>>> msm_host->byte_clk_rate * msm_host->lanes. If so, we can drop 
>>> dsi_get_pclk_rate() call and the multiply/do_div calculation and use 
>>> the above formula instead.
>>>
>>
>>  From what I see msm_host->src_clk_rate = pixel_clk * bpp / 8;
> 
> and msm_host->byte_clk_rate = pixel_clk * bpp / (8 * nlanes);
> 
>>
>>  From where did you get the above formula?
>>
>> I just felt that by having two APIs the next patch becomes easier 
>> because I need to just invoke the API which calculates byte clk.
> 
> Yes, I see that, it looks like a correct approach. You know, let's 
> ignore the dsi_calc_clk_rate_v2() for now, it is definitely a separate 
> change.
> 
> Could you please drop the opp_table handling from patch 2/2, move 
> assignments in dsi_byte_clk_get_rate() back to the definition lines and 
> then send it as v2?
> 

Ack, will move the assignments to definition lines. Regarding the patch 
2/2, I have responded with my concerns.
