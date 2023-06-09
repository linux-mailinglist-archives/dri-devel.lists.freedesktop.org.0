Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AB872A129
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 19:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF9A10E15C;
	Fri,  9 Jun 2023 17:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE8DC10E157;
 Fri,  9 Jun 2023 17:24:31 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 359EBq3n024991; Fri, 9 Jun 2023 17:24:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=1b7hEhV9ZR3ErYyrh6dtfaDiEFYsrQqoxaoxl0F9tUw=;
 b=VN5rhGQ+B0W082XDVn0f+r7oKgbpgtHY0P5jI2cpfWMfWPNCpFnF/YuQO3hmWJ1CyxdG
 ydh3gsqOduhzdME6K8wDKULdnGOi9I4+a6juJno6TFKWHfBjOrOjdabALT7kiBY2Lw1C
 5LJqKBzFJO0AuQqTc3qM+ZBRLx4E6dmlzXCiCo5hohQxo7Br9E96g2eRhpRYVGJhCsjD
 E6bJ3OgKAioNAM/aTDHhYlRosiL3yA+MCU99FS82xUSM81PQNJKYmM7nW76kr+8CBywB
 BWPq8n5CsNWHCigdTp0v4bD448GJUWsI3buNqRwn31tyPNxraBARlP451bc8NEeWgor0 bA== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r3nwet3kc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jun 2023 17:24:29 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 359HOSMj007649
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 9 Jun 2023 17:24:28 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 9 Jun 2023
 10:24:27 -0700
Message-ID: <f49db16a-e470-aeb5-f161-be354b5817f5@quicinc.com>
Date: Fri, 9 Jun 2023 10:24:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v5 2/5] drm/msm/dsi: Adjust pclk rate for compression
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20230405-add-dsc-support-v5-0-028c10850491@quicinc.com>
 <20230405-add-dsc-support-v5-2-028c10850491@quicinc.com>
 <js3mcglahq53mcyxa6deltjlu4xpc2pnafwz2rbk3dl4ovws2o@5xw2wzvfaj2v>
 <f34a03ce-6295-b5d1-bf42-a43cfb382ea3@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <f34a03ce-6295-b5d1-bf42-a43cfb382ea3@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: s_3pfLppHfL3CrfFLx7JYXA5pA8Rwcin
X-Proofpoint-ORIG-GUID: s_3pfLppHfL3CrfFLx7JYXA5pA8Rwcin
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-09_12,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306090145
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/9/2023 9:58 AM, Dmitry Baryshkov wrote:
> On 08/06/2023 23:36, Marijn Suijten wrote:
>> Same title suggestion as earlier: s/adjust/reduce
>>
>> On 2023-05-22 18:08:56, Jessica Zhang wrote:
>>> Adjust the pclk rate to divide hdisplay by the compression ratio when 
>>> DSC
>>> is enabled.
>>>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 21 ++++++++++++++++++---
>>>   1 file changed, 18 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> index a448931af804..88f370dd2ea1 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> @@ -561,7 +561,18 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host 
>>> *msm_host)
>>>       clk_disable_unprepare(msm_host->byte_clk);
>>>   }
>>> -static unsigned long dsi_get_pclk_rate(const struct drm_display_mode 
>>> *mode, bool is_bonded_dsi)
>>> +static unsigned long dsi_adjust_compressed_pclk(const struct 
>>> drm_display_mode *mode,
>>
>> Nit: adjust_pclk_for_compression
>>
>> As discussed before we realized that this change is more-or-less a hack,
>> since downstream calculates pclk quite differently - at least for
>> command-mode panels.  Do you still intend to land this patch this way,
>> or go the proper route by introducing the right math from the get-go?
>> Or is the math at least correct for video-mode panels?
> 
> Can we please postpone the cmd-vs-video discussion? Otherwise I will 
> reserve myself a right to push a patch dropping CMD mode support until 
> somebody comes with a proper way to handle CMD clock calculation.
> 
> 
> It is off-topic for the sake of DSC 1.2 support. Yes, all CMD panel 
> timings are a kind of a hack and should be improved. No, we can not do 
> this as a part of this series. I think everybody agrees that with the 
> current way of calculating CMD panel timings, this function does some 
> kind of a trick.
> 
>>
>> This function requires a documentation comment to explain that all.
>>
>>> +        const struct drm_dsc_config *dsc)
>>> +{
>>> +    int new_hdisplay = DIV_ROUND_UP(mode->hdisplay * 
>>> drm_dsc_get_bpp_int(dsc),
>>
>> This sounds like a prime candidate for msm_dsc_get_bytes_per_line(), if
>> bits_per_component==8 is assumed.  In fact, it then becomes identical
>> to the following line in dsi_host.c which you added previously:
>>
>>     hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 
>> 3);
> 
> This would imply a simple /3, but as far as I understand it is not 
> correct here.
> 
>>
>> If not, what is the difference between these two calculations?  Maybe
>> they both need to be in a properly-named helper.
>>
>>> +            dsc->bits_per_component * 3);
> 
> I hope to see a documentation patch to be posted, telling that this 
> scales hdisplay and thus pclk by the factor of compressed_bpp / 
> uncompressed_bpp.
> 
> This is not how it is usually done, but I would accept a separate 
> documentation patch going over the calculation here and in 
> dsi_timing_setup (and maybe other unobvious cases, if there is anything 
> left).
> 
>>
>> As we established in the drm/msm issue [2] there is currently a
>> confusion whether this /3 (and the /3 in dsi_timing_setup) come from the
>> ratio between dsi_get_bpp() and dsc->bpp or something else.  Can you
>> clarify that with constants and comments?
>>
>> [2]: https://gitlab.freedesktop.org/drm/msm/-/issues/24
>>
>>> +
>>> +    return (new_hdisplay + (mode->htotal - mode->hdisplay))
>>> +            * mode->vtotal * drm_mode_vrefresh(mode);
>>
>> As clarified in [1] I was not necessarily suggesting to move this math
>> to a separate helper, but to also use a few more properly-named
>> intermediate variables to not have multi-line math and self-documenting
>> code.  These lines could be split to be much more clear.
> 
> I think it's fine more or less. One pair of parenthesis is unnecessary, 
> but that's mostly it. Maybe `new_htotal' variable would make some sense.
> 
> Also, please excuse me if this was discussed somewhere. This calculation 
> means that only the displayed data is compressed, but porches are not 
> touched. Correct?

Hi Dmitry,

Correct, we will apply the compression ratio to only the hdisplay but 
keep the porches as is.

> 
>>
>> [1]: 
>> https://lore.kernel.org/linux-arm-msm/u4x2vldkzsokfcpbkz3dtwcllbdk4ljcz6kzuaxt5frx6g76o5@uku6abewvye7/
>>
>>> +}
>>> +
>>> +static unsigned long dsi_get_pclk_rate(const struct drm_display_mode 
>>> *mode,
>>> +        const struct drm_dsc_config *dsc, bool is_bonded_dsi)
>>>   {
>>>       unsigned long pclk_rate;
>>> @@ -576,6 +587,10 @@ static unsigned long dsi_get_pclk_rate(const 
>>> struct drm_display_mode *mode, bool
>>>       if (is_bonded_dsi)
>>>           pclk_rate /= 2;
>>> +    /* If DSC is enabled, divide hdisplay by compression ratio */
>>> +    if (dsc)
>>> +        pclk_rate = dsi_adjust_compressed_pclk(mode, dsc);
> 
> Looking for the perfection, I'd also move the pclk adjustment to come 
> before the is_bonded_dsi check.

Acked.

Thanks,

Jessica Zhang

> 
>>
>> The confusion with this comment (and the reason the aforementioned
>> discussion [2] carried on so long) stems from the fact a division makes
>> sense for a bit/byte clock, but not for a pixel clock: we still intend
>> to send the same number of pixels, just spending less bytes on them.  So
>> as you clarify the /3 above, can you also clarify that here or drop this
>> comment completely when the function is correctly documented instead?
>>
>> - Marijn
>>
>>> +
>>>       return pclk_rate;
>>>   }
>>> @@ -585,7 +600,7 @@ unsigned long dsi_byte_clk_get_rate(struct 
>>> mipi_dsi_host *host, bool is_bonded_d
>>>       struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>>>       u8 lanes = msm_host->lanes;
>>>       u32 bpp = dsi_get_bpp(msm_host->format);
>>> -    unsigned long pclk_rate = dsi_get_pclk_rate(mode, is_bonded_dsi);
>>> +    unsigned long pclk_rate = dsi_get_pclk_rate(mode, msm_host->dsc, 
>>> is_bonded_dsi);
>>>       unsigned long pclk_bpp;
>>>       if (lanes == 0) {
>>> @@ -604,7 +619,7 @@ unsigned long dsi_byte_clk_get_rate(struct 
>>> mipi_dsi_host *host, bool is_bonded_d
>>>   static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool 
>>> is_bonded_dsi)
>>>   {
>>> -    msm_host->pixel_clk_rate = dsi_get_pclk_rate(msm_host->mode, 
>>> is_bonded_dsi);
>>> +    msm_host->pixel_clk_rate = dsi_get_pclk_rate(msm_host->mode, 
>>> msm_host->dsc, is_bonded_dsi);
>>>       msm_host->byte_clk_rate = 
>>> dsi_byte_clk_get_rate(&msm_host->base, is_bonded_dsi,
>>>                               msm_host->mode);
>>>
>>> -- 
>>> 2.40.1
>>>
> 
> -- 
> With best wishes
> Dmitry
> 
