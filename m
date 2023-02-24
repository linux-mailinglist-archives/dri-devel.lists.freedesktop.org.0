Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E603F6A2349
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 21:52:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 628FD10ED16;
	Fri, 24 Feb 2023 20:52:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FB210E26F;
 Fri, 24 Feb 2023 20:51:59 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31OJTSKS022184; Fri, 24 Feb 2023 20:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=lbbVB3k23RQjUw90I/QkLcSSw61COvYG7rDw+Z6ZIoc=;
 b=Hhr5f6nDEbtJPD495hwi8m25IofJYLP15oEvNpV3MArI+oI/3tngU8Z6F5343B+fP5A9
 OJusqsP0SGySV/A0jaBtIZcVNFJdC5T9AAztRJd7JO70uH+huXIB4MrwwxlFfbjEHWHQ
 +n7XVXrdDul+OE2rAeo6gfs8Y2vn2+s1HQqUhcazMWYx2EWHwpg5dMk0eJwlVDSmXw+i
 E8mPzA0mawFa7DiMKaJRnhe7SZGPSNVTxPJlFzaXETo8sntmukv0QOCZzejrwYzHjen1
 W4A0sxQgOhzyY4SJGOCTtM0KJwRago8TpgfffOrkmS5ubhsMCpCRihQP1EqgZw5Bv4qS 0Q== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nwybm676f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Feb 2023 20:51:53 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31OKpqIn018524
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Feb 2023 20:51:52 GMT
Received: from [10.110.89.76] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 24 Feb
 2023 12:51:51 -0800
Message-ID: <298eff36-1a55-75a8-d957-ab97504e5caf@quicinc.com>
Date: Fri, 24 Feb 2023 12:51:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 06/50] drm/msm/dpu: correct sm8550 scaler
Content-Language: en-US
To: <neil.armstrong@linaro.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
 <20230211231259.1308718-7-dmitry.baryshkov@linaro.org>
 <5bc2221f-61ba-3801-6dbb-83587d986b50@linaro.org>
 <a589d45e-f084-9371-05dc-0676f12458a3@linaro.org>
 <e20d2b76-a446-019d-73db-6f16ba7cbfb5@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <e20d2b76-a446-019d-73db-6f16ba7cbfb5@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Zbf7s01zB7KkC2bxwz4nWh0iOI4g4FTk
X-Proofpoint-GUID: Zbf7s01zB7KkC2bxwz4nWh0iOI4g4FTk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-24_14,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302240166
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/13/2023 9:36 AM, neil.armstrong@linaro.org wrote:
> On 13/02/2023 12:16, Dmitry Baryshkov wrote:
>> On 13/02/2023 12:41, Neil Armstrong wrote:
>>> On 12/02/2023 00:12, Dmitry Baryshkov wrote:
>>>> QSEED4 is a newer variant of QSEED3LITE, which should be used on
>>>> sm8550. Fix the DPU caps structure and used feature masks.
>>>
>>> I found nowhere SM8550 uses Qseed4, on downstream DT, it's written:
>>>          qcom,sde-qseed-sw-lib-rev = "qseedv3lite";
>>>          qcom,sde-qseed-scalar-version = <0x3002>;
>>
>> And then the techpack tells us starting from 0x3000 the v3lite is v4:
>>
>> https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/display-kernel.lnx.5.10.r8-rel/msm/sde/sde_hw_util.c#L59 
>>
>>
>> https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/display-kernel.lnx.5.10.r8-rel/msm/sde/sde_hw_util.c#L102 
>>
> 
> OK then:
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
>>

This little bit of confusion is because with downstream, the qseed is a 
separate usermode library having its own revision. So the SW lib version 
in this case is not exactly correlating with the scalar HW revision.

Since upstream DPU only cares about the HW revision of the scaler, we 
should be going off the qcom,sde-qseed-scalar-version.

This change LGTM,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>
>>> Neil
>>>>
>>>> Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 10 +++++-----
>>>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>> index 192fff9238f9..c4e45c472685 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>> @@ -458,7 +458,7 @@ static const struct dpu_caps sm8450_dpu_caps = {
>>>>   static const struct dpu_caps sm8550_dpu_caps = {
>>>>       .max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>>>>       .max_mixer_blendstages = 0xb,
>>>> -    .qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
>>>> +    .qseed_type = DPU_SSPP_SCALER_QSEED4,
>>>>       .smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
>>>>       .ubwc_version = DPU_HW_UBWC_VER_40,
>>>>       .has_src_split = true,
>>>> @@ -1301,13 +1301,13 @@ static const struct dpu_sspp_cfg 
>>>> sm8450_sspp[] = {
>>>>   };
>>>>   static const struct dpu_sspp_sub_blks sm8550_vig_sblk_0 =
>>>> -                _VIG_SBLK("0", 7, DPU_SSPP_SCALER_QSEED3LITE);
>>>> +                _VIG_SBLK("0", 7, DPU_SSPP_SCALER_QSEED4);
>>>>   static const struct dpu_sspp_sub_blks sm8550_vig_sblk_1 =
>>>> -                _VIG_SBLK("1", 8, DPU_SSPP_SCALER_QSEED3LITE);
>>>> +                _VIG_SBLK("1", 8, DPU_SSPP_SCALER_QSEED4);
>>>>   static const struct dpu_sspp_sub_blks sm8550_vig_sblk_2 =
>>>> -                _VIG_SBLK("2", 9, DPU_SSPP_SCALER_QSEED3LITE);
>>>> +                _VIG_SBLK("2", 9, DPU_SSPP_SCALER_QSEED4);
>>>>   static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
>>>> -                _VIG_SBLK("3", 10, DPU_SSPP_SCALER_QSEED3LITE);
>>>> +                _VIG_SBLK("3", 10, DPU_SSPP_SCALER_QSEED4);
>>>>   static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = 
>>>> _DMA_SBLK("12", 5);
>>>>   static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = 
>>>> _DMA_SBLK("13", 6);
>>>
>>
> 
