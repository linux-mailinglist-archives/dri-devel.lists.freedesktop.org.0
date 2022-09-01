Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B52B5AA01E
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 21:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 528DF10E1B3;
	Thu,  1 Sep 2022 19:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801DB89220;
 Thu,  1 Sep 2022 19:35:38 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 281JHYFm007763;
 Thu, 1 Sep 2022 19:35:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=RHi6c/HBjJZ34f0IuzhsVo7+lap45J1tiyyW4j0h/y4=;
 b=p8zzxfIc6AVdZdKEDoz7SI7HVElrQMf3FCUXRgepex1gHD0cwEoUd+I6656Nl/3oiXDg
 hi0lSTlVBEmNOAXXaRZjhp7enbJuHv39zbI6y3bN/3HtWj5GUAQD3EYSxR2/1+ttoPHY
 MeckbzLB9LMEr4Ryk9o1ZMDMlKRUXhybYmOXRLpM1TiqxnZ2gMrV8AWMmHzmJ2XXxzCj
 /yl6A7bgzFBF7iv8KwJj0JACfbJLjo2zKb9X6rwdD0soXF44MHi3cFoBMNqknsmiDcJi
 zWAGhcbMfP+rGgANyuxiSVlw+2149bqwgyy+mmTq+oNPvuoI4miptK9l9ObW4Psd4I55 wg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jabqk4qnc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Sep 2022 19:35:32 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 281JZVqq024780
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 Sep 2022 19:35:31 GMT
Received: from [10.216.21.90] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Thu, 1 Sep 2022
 12:35:25 -0700
Message-ID: <0a4f3234-ab54-8e2e-0945-b0be159e38a0@quicinc.com>
Date: Fri, 2 Sep 2022 01:05:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [Freedreno] [PATCH v6 4/6] clk: qcom: gpucc-sc7280: Add cx
 collapse reset support
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Philipp Zabel
 <p.zabel@pengutronix.de>
References: <1661923108-789-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220831104741.v6.4.I5e64ff4b77bb9079eb2edeea8a02585c9e76778f@changeid>
 <20220901103449.GC32271@pengutronix.de>
 <ff2d8784-0cf9-fac9-4360-71cac30fbd76@linaro.org>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <ff2d8784-0cf9-fac9-4360-71cac30fbd76@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: PqSAWRVPKVjxcWpI1GrozR2ZS-tQsvWV
X-Proofpoint-ORIG-GUID: PqSAWRVPKVjxcWpI1GrozR2ZS-tQsvWV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_12,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209010085
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, krzysztof.kozlowski@linaro.org,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/1/2022 4:16 PM, Dmitry Baryshkov wrote:
> On 01/09/2022 13:34, Philipp Zabel wrote:
>> On Wed, Aug 31, 2022 at 10:48:25AM +0530, Akhil P Oommen wrote:
>>> Allow a consumer driver to poll for cx gdsc collapse through Reset
>>> framework.
>>>
>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>
>>> (no changes since v3)
>>>
>>> Changes in v3:
>>> - Convert 'struct qcom_reset_ops cx_gdsc_reset' to 'static const' 
>>> (Krzysztof)
>>>
>>> Changes in v2:
>>> - Minor update to use the updated custom reset ops implementation
>>>
>>>   drivers/clk/qcom/gpucc-sc7280.c | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/clk/qcom/gpucc-sc7280.c 
>>> b/drivers/clk/qcom/gpucc-sc7280.c
>>> index 9a832f2..fece3f4 100644
>>> --- a/drivers/clk/qcom/gpucc-sc7280.c
>>> +++ b/drivers/clk/qcom/gpucc-sc7280.c
>>> @@ -433,12 +433,22 @@ static const struct regmap_config 
>>> gpu_cc_sc7280_regmap_config = {
>>>       .fast_io = true,
>>>   };
>>>   +static const struct qcom_reset_ops cx_gdsc_reset = {
>>> +    .reset = gdsc_wait_for_collapse,
>>
>> This should be accompanied by a comment explaining the not-quite-reset
>> nature of this workaround, i.e. what is the prerequisite for this to
>> actually work as expected?
>>
>>> +};
>>> +
>>> +static const struct qcom_reset_map gpucc_sc7280_resets[] = {
>>> +    [GPU_CX_COLLAPSE] = { .ops = &cx_gdsc_reset, .priv = &cx_gdsc },
>>> +};
>>> +
>>>   static const struct qcom_cc_desc gpu_cc_sc7280_desc = {
>>>       .config = &gpu_cc_sc7280_regmap_config,
>>>       .clks = gpu_cc_sc7280_clocks,
>>>       .num_clks = ARRAY_SIZE(gpu_cc_sc7280_clocks),
>>>       .gdscs = gpu_cc_sc7180_gdscs,
>>>       .num_gdscs = ARRAY_SIZE(gpu_cc_sc7180_gdscs),
>>> +    .resets = gpucc_sc7280_resets,
>>> +    .num_resets = ARRAY_SIZE(gpucc_sc7280_resets),
>>
>> See my comment on patch 2. I think instead of adding a const struct
>> qcom_reset_ops * to gpucc_sc7280_resets, this should just add a const
>> struct reset_control * to gpu_cc_sc7280_desc.
>
> While this will work for the sc7280, the platform that Akhil was 
> developing, this will not work for other platforms (like sm8250), 
> where the dispcc also provides traditional BCR resets.
>
Like Dimtry mentioned, we should eventually implement this feature on 
all gpucc drivers and some of them already use the existing reset ops. 
The current implementation creates the least code churn and duplication's.

-Akhil
