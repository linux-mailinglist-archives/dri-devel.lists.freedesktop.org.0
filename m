Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CABD4709FF9
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 21:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0960F10E512;
	Fri, 19 May 2023 19:36:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E33C10E489;
 Fri, 19 May 2023 19:36:44 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34JHnvGt026250; Fri, 19 May 2023 19:36:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=dByxtw+LE7ff21d6fi1eR87U3WqyhXNugdDP05pyYec=;
 b=BBbGncHxlho3fi6fV7nNm5jU/9z9tF2tjPTARBebT663Nk7sSehAQ27k68np6Ovdpfps
 ietu0GmslmaIo+f15E/8JQjLjCYbtybSQugA+UThl8Hwu4Gs1J6xq/caWJw2VH2wBHWX
 Neji3C6AYaY9jw9q0SNOmpsRA/zwoJUkZzB8+LOG1dVuNwBuULZXa/Zfk80sdr4ANRsg
 mgL97JTk7a001kM1evrDXdLnM/UENhaLpeL5ciqsvgmG3e/SyyNldxoGg3uozgXqT/Y6
 KsRkqPNMjpOaJ41Pkoz1xyP35N99qdKayyDieYXcCQe+Fne6qNF9Kq5FSvZyE/ua4Mkf Rg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qp8fm1967-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 May 2023 19:36:40 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34JJadZQ009170
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 May 2023 19:36:39 GMT
Received: from [10.110.99.154] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 19 May
 2023 12:36:38 -0700
Message-ID: <9a505edb-f3e8-ade4-8d4e-629bc2840f29@quicinc.com>
Date: Fri, 19 May 2023 12:36:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: simplify pixel clk rate handling
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20230118130031.2345941-1-dmitry.baryshkov@linaro.org>
 <8ebd01e3-00be-b0da-e91a-ab1a4e074074@quicinc.com>
 <85d0a8c6-f6b4-4cd4-7cc6-b13f37523bd4@linaro.org>
 <637c1848-0e3f-9f3d-dc56-8f2d5b8de696@quicinc.com>
 <a9669c51-3171-3751-f249-be4a7f4312c2@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <a9669c51-3171-3751-f249-be4a7f4312c2@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: -CIa9wdpjv2FfI0ikSDjg_5qEX5Luz0o
X-Proofpoint-GUID: -CIa9wdpjv2FfI0ikSDjg_5qEX5Luz0o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-19_14,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305190168
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/19/2023 12:33 PM, Dmitry Baryshkov wrote:
> On 19/05/2023 21:54, Jessica Zhang wrote:
>>
>>
>> On 3/28/2023 6:04 AM, Dmitry Baryshkov wrote:
>>> On 26/01/2023 02:07, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 1/18/2023 5:00 AM, Dmitry Baryshkov wrote:
>>>>> Move a call to dsi_calc_pclk() out of calc_clk_rate directly towards
>>>>> msm_dsi_host_get_phy_clk_req(). It is called for both 6g and v2 hosts.
>>>>>
>>>>> Also, while we are at it, replace another dsi_get_pclk_rate() 
>>>>> invocation
>>>>> with using the stored value at msm_host->pixel_clk_rate.
>>>>>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>>   drivers/gpu/drm/msm/dsi/dsi.h      |  4 ++--
>>>>>   drivers/gpu/drm/msm/dsi/dsi_cfg.h  |  2 +-
>>>>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 24 ++++++++++++------------
>>>>>   3 files changed, 15 insertions(+), 15 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h 
>>>>> b/drivers/gpu/drm/msm/dsi/dsi.h
>>>>> index bd3763a5d723..93ec54478eb6 100644
>>>>> --- a/drivers/gpu/drm/msm/dsi/dsi.h
>>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
>>>>> @@ -129,8 +129,8 @@ int dsi_dma_base_get_6g(struct msm_dsi_host 
>>>>> *msm_host, uint64_t *iova);
>>>>>   int dsi_dma_base_get_v2(struct msm_dsi_host *msm_host, uint64_t 
>>>>> *iova);
>>>>>   int dsi_clk_init_v2(struct msm_dsi_host *msm_host);
>>>>>   int dsi_clk_init_6g_v2(struct msm_dsi_host *msm_host);
>>>>> -int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool 
>>>>> is_bonded_dsi);
>>>>> -int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool 
>>>>> is_bonded_dsi);
>>>>> +int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host);
>>>>> +int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host);
>>>>>   void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, 
>>>>> struct mipi_dsi_host *host);
>>>>>   void msm_dsi_host_test_pattern_en(struct mipi_dsi_host *host);
>>>>>   struct drm_dsc_config *msm_dsi_host_get_dsc_config(struct 
>>>>> mipi_dsi_host *host);
>>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h 
>>>>> b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
>>>>> index 44be4a88aa83..5106e66846c3 100644
>>>>> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
>>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
>>>>> @@ -51,7 +51,7 @@ struct msm_dsi_host_cfg_ops {
>>>>>       void* (*tx_buf_get)(struct msm_dsi_host *msm_host);
>>>>>       void (*tx_buf_put)(struct msm_dsi_host *msm_host);
>>>>>       int (*dma_base_get)(struct msm_dsi_host *msm_host, uint64_t 
>>>>> *iova);
>>>>> -    int (*calc_clk_rate)(struct msm_dsi_host *msm_host, bool 
>>>>> is_bonded_dsi);
>>>>> +    int (*calc_clk_rate)(struct msm_dsi_host *msm_host);
>>>>>   };
>>>>>   struct msm_dsi_cfg_handler {
>>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>>>>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>> index 18fa30e1e858..7d99a108bff6 100644
>>>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>> @@ -616,28 +616,21 @@ static void dsi_calc_pclk(struct msm_dsi_host 
>>>>> *msm_host, bool is_bonded_dsi)
>>>>>   }
>>>>> -int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool 
>>>>> is_bonded_dsi)
>>>>> +int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host)
>>>>>   {
>>>>> -    if (!msm_host->mode) {
>>>>> -        pr_err("%s: mode not set\n", __func__);
>>>>> -        return -EINVAL;
>>>>> -    }
>>>>> -
>>>>> -    dsi_calc_pclk(msm_host, is_bonded_dsi);
>>>>>       msm_host->esc_clk_rate = clk_get_rate(msm_host->esc_clk);
>>>>> +
>>>>>       return 0;
>>>>>   }
>>>>> -int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool 
>>>>> is_bonded_dsi)
>>>>> +int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host)
>>>>>   {
>>>>>       u32 bpp = dsi_get_bpp(msm_host->format);
>>>>>       u64 pclk_bpp;
>>>>>       unsigned int esc_mhz, esc_div;
>>>>>       unsigned long byte_mhz;
>>>>> -    dsi_calc_pclk(msm_host, is_bonded_dsi);
>>>>> -
>>>>> -    pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, 
>>>>> is_bonded_dsi) * bpp;
>>>>> +    pclk_bpp = msm_host->pixel_clk_rate * bpp;
>>>>>       do_div(pclk_bpp, 8);
>>>>>       msm_host->src_clk_rate = pclk_bpp;
>>>>> @@ -2292,7 +2285,14 @@ void msm_dsi_host_get_phy_clk_req(struct 
>>>>> mipi_dsi_host *host,
>>>>>       const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
>>>>>       int ret;
>>>>> -    ret = cfg_hnd->ops->calc_clk_rate(msm_host, is_bonded_dsi);
>>>>> +    if (!msm_host->mode) {
>>>>> +        pr_err("%s: mode not set\n", __func__);
>>>>> +        return;
>>>>> +    }
>>>>> +
>>>>> +    dsi_calc_pclk(msm_host, is_bonded_dsi);
>>>>> +
>>>>> +    ret = cfg_hnd->ops->calc_clk_rate(msm_host);
>>>>
>>>> I am not too sure what we are gaining by this.
>>>>
>>>> Its not that we are replacing dsi_get_pclk_rate().
>>>>
>>>> We are moving the dsi_get_pclk_rate() from the calc_clk_rate() to 
>>>> the msm_dsi_host_get_phy_clk_req().
>>>>
>>>> Also, with this change, dsi_calc_clk_rate_6g() looks kind of empty 
>>>> to stand on its own.
>>>>
>>>> The original intention of the calc_clk_rate() op seems to be 
>>>> calculate and store all the clocks (byte, pixel and esc).
>>>>
>>>> Why change that behavior by breaking it up?
>>>
>>> Unification between platforms. Both v2 and 6g platforms call 
>>> dsi_calc_pclk(). Let's just move it to a common code path.
>>
>> Hi Dmitry,
>>
>> I think what Abhinav means here is that the meaning and functionality 
>> of calc_clk_rate() changes with this patch.
>>
>> Before, calc_clk_rate() does *all* the clk_rate calculations and 
>> assignments. But after this change, it will only calculate and assign 
>> the escape clk rate.
>>
>> I agree with Abhinav that this change renders the calc_clk_rate() op 
>> misleading as it will not calculate all of the clock rates anymore.
> 
> Would it make sense if I rename it to calc_other_clock_rates()?
> 

Not really. I would rather still have it separate and drop this patch.

So even if pixel clock calculation looks common today between v2 and 6g, 
lets say tomorrow there is a 7g or 8g which needs some other math there, 
I think this is the right place where it should stay so that we 
calculate all clocks together.

> Moving pclk calculation to the core code emphasises that pclk 
> calculation is common between v2 and 6g hosts.
> 
>>
>> Thanks,
>>
>> Jessica Zhang
>>
>>>
>>>>
>>>>>       if (ret) {
>>>>>           pr_err("%s: unable to calc clk rate, %d\n", __func__, ret);
>>>>>           return;
>>>
>>> -- 
>>> With best wishes
>>> Dmitry
>>>
> 
