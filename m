Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 840CE663738
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 03:21:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C9CD10E47B;
	Tue, 10 Jan 2023 02:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17CF210E47B;
 Tue, 10 Jan 2023 02:21:20 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30A1MHd5028626; Tue, 10 Jan 2023 02:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=5bvc9P0DGQ+Kf3ppiFeeIEvqiNVb/9AexQ22/Z+gUsk=;
 b=UhhQmaP82nA+IT8NnqVRj6OX2yHXL1CZMwZXFLlRPbQYDq0Yd/WrKkzLVtBvp5zaGBvg
 ic9QzyM+DWa50g7Q2EbDgZ5XcnUTBCN+D8XcQcubYeVTHIOH1S0D1JqQaIIF11i3YnbV
 SS9uDy3NpTTrPhXudH69NOPcNYP/tngIFa1lapIZRPhacudrInSc+iTD6hQMxwbZbBZ4
 +swS7YF7D3tmd0jT2qpt6r0y6X9JAO0M9uDCtDkcBF9sfZ9qJVBxOKuBPylGcxVvOcIb
 dKVHJzDyu2k8TWaaqF3dm1HLjD6LFzFgeszycf87P2mSLLo7NQOyOA0LlArZ1mTGaMht jg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3my1wu4ea8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jan 2023 02:21:15 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30A2LEqA006362
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jan 2023 02:21:14 GMT
Received: from [10.110.115.72] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 9 Jan 2023
 18:21:14 -0800
Message-ID: <cbe88a7e-c6a9-ab12-7dbf-f4efbfd7fd71@quicinc.com>
Date: Mon, 9 Jan 2023 18:21:13 -0800
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
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <36862c49-39d2-952d-829b-e660375d49f4@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Ay2cfsJuQhb5RdX7ddV6HXz8S2kb0f9I
X-Proofpoint-GUID: Ay2cfsJuQhb5RdX7ddV6HXz8S2kb0f9I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_16,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 clxscore=1015 mlxscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301100012
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



On 1/9/2023 5:34 PM, Dmitry Baryshkov wrote:
> On 22/09/2022 03:49, Abhinav Kumar wrote:
>> Re-arrange the dsi_calc_pclk method to two helpers, one to
>> compute the DSI byte clk and the other to compute the pclk.
>>
>> This makes the separation of the two clean and also allows
>> clients to compute and use the dsi byte clk separately.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi.h      |  2 ++
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 27 +++++++++++++++++++--------
>>   2 files changed, 21 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h 
>> b/drivers/gpu/drm/msm/dsi/dsi.h
>> index 2a96b4fe7839..60ba8e67f550 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi.h
>> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
>> @@ -118,6 +118,8 @@ int dsi_link_clk_enable_6g(struct msm_dsi_host 
>> *msm_host);
>>   int dsi_link_clk_enable_v2(struct msm_dsi_host *msm_host);
>>   void dsi_link_clk_disable_6g(struct msm_dsi_host *msm_host);
>>   void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host);
>> +unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool 
>> is_bonded_dsi,
>> +        const struct drm_display_mode *mode);
>>   int dsi_tx_buf_alloc_6g(struct msm_dsi_host *msm_host, int size);
>>   int dsi_tx_buf_alloc_v2(struct msm_dsi_host *msm_host, int size);
>>   void *dsi_tx_buf_get_6g(struct msm_dsi_host *msm_host);
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 57a4c0fa614b..32b35d4ac1d3 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -569,9 +569,8 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host 
>> *msm_host)
>>       clk_disable_unprepare(msm_host->byte_clk);
>>   }
>> -static unsigned long dsi_get_pclk_rate(struct msm_dsi_host *msm_host, 
>> bool is_bonded_dsi)
>> +static unsigned long dsi_get_pclk_rate(const struct drm_display_mode 
>> *mode, bool is_bonded_dsi)
>>   {
>> -    struct drm_display_mode *mode = msm_host->mode;
>>       unsigned long pclk_rate;
>>       pclk_rate = mode->clock * 1000;
>> @@ -588,12 +587,18 @@ static unsigned long dsi_get_pclk_rate(struct 
>> msm_dsi_host *msm_host, bool is_bo
>>       return pclk_rate;
>>   }
>> -static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool 
>> is_bonded_dsi)
>> +unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool 
>> is_bonded_dsi,
>> +        const struct drm_display_mode *mode)
>>   {
>> +    struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>>       u8 lanes = msm_host->lanes;
>>       u32 bpp = dsi_get_bpp(msm_host->format);
>> -    unsigned long pclk_rate = dsi_get_pclk_rate(msm_host, 
>> is_bonded_dsi);
>> -    u64 pclk_bpp = (u64)pclk_rate * bpp;
>> +    unsigned long pclk_rate;
>> +    u64 pclk_bpp;
>> +
>> +    pclk_rate = dsi_get_pclk_rate(mode, is_bonded_dsi);
>> +
>> +    pclk_bpp = (u64)pclk_rate * bpp;
> 
> Any particular reason for this? The following patch would be more obvious:
> 
>  > -    unsigned long pclk_rate = dsi_get_pclk_rate(msm_host, 
> is_bonded_dsi);
>  > +    unsigned long pclk_rate = dsi_get_pclk_rate(mode, is_bonded_dsi);
>  >      u64 pclk_bpp = (u64)pclk_rate * bpp;
> 
> 
>>       if (lanes == 0) {
>>           pr_err("%s: forcing mdss_dsi lanes to 1\n", __func__);
>> @@ -606,8 +611,14 @@ static void dsi_calc_pclk(struct msm_dsi_host 
>> *msm_host, bool is_bonded_dsi)
>>       else
>>           do_div(pclk_bpp, (8 * lanes));
>> -    msm_host->pixel_clk_rate = pclk_rate;
>> -    msm_host->byte_clk_rate = pclk_bpp;
>> +    return pclk_bpp;
>> +}
>> +
>> +static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool 
>> is_bonded_dsi)
>> +{
>> +    msm_host->pixel_clk_rate = dsi_get_pclk_rate(msm_host->mode, 
>> is_bonded_dsi);
>> +    msm_host->byte_clk_rate = dsi_byte_clk_get_rate(&msm_host->base, 
>> is_bonded_dsi,
>> +            msm_host->mode);
>>       DBG("pclk=%lu, bclk=%lu", msm_host->pixel_clk_rate,
>>                   msm_host->byte_clk_rate);
>> @@ -635,7 +646,7 @@ int dsi_calc_clk_rate_v2(struct msm_dsi_host 
>> *msm_host, bool is_bonded_dsi)
>>       dsi_calc_pclk(msm_host, is_bonded_dsi);
>> -    pclk_bpp = (u64)dsi_get_pclk_rate(msm_host, is_bonded_dsi) * bpp;
>> +    pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi) 
>> * bpp;
>>       do_div(pclk_bpp, 8);
>>       msm_host->src_clk_rate = pclk_bpp;
> 
> 
> Following my previous feedback:
> 
> I think at this moment msm_host->src_clk_rate = msm_host->byte_clk_rate 
> * msm_host->lanes. If so, we can drop dsi_get_pclk_rate() call and the 
> multiply/do_div calculation and use the above formula instead.
> 

 From what I see msm_host->src_clk_rate = pixel_clk * bpp / 8;

 From where did you get the above formula?

I just felt that by having two APIs the next patch becomes easier 
because I need to just invoke the API which calculates byte clk.

> If this looks logical, could you please prepend a patch changing this?
> 
> LGTM otherwise.
> 
