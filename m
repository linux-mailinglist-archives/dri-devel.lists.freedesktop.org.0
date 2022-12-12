Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6490F64A633
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 18:50:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A0910E23D;
	Mon, 12 Dec 2022 17:49:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78DD10E23D;
 Mon, 12 Dec 2022 17:49:55 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCGkQKh028589; Mon, 12 Dec 2022 17:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=FQ/6lTyzpPWte9JtTBRaMG+LrtODMsTmst64lvQGnHc=;
 b=PqmQlOPlFdC6m5x3UbHIGMfoOIqpRaXdyYzj1vRVn2Lg+ey/LITk9grsR5vTtLf14rx8
 BvoJVwTPc9/bo91k1oiGN2+lKZpWkX5ZjbsuajT4MBorzN2Mko5kVD1pyyKxvD4CQECk
 NrqBem9UTOgEE1Vb+DIHZM3/FfEj7dYXxDYSDIzeKixIn8dCafoWRxqfnXw+Ap4NCkwA
 Vdbslq8qEiUKKZ0tB1sPiMcz7jyNcIvB32Ti2a5C4d5dBJxZptZpl5kQM9OMO5tDPgWA
 1gfZK0TqfhFKvQBQb8UcRSJeEcgmDmZ1GBhFTWMMUtFpQ9M/wpHa4UZfoWi9SP/7WKN5 6w== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3me83sg6fh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 17:49:50 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BCHnnOH013750
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 17:49:49 GMT
Received: from [10.216.43.29] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 12 Dec
 2022 09:49:43 -0800
Message-ID: <1be71e47-fba3-4795-6950-de3229961215@quicinc.com>
Date: Mon, 12 Dec 2022 23:19:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v7 4/6] clk: qcom: gpucc-sc7280: Add cx collapse reset
 support
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>
References: <1664960824-20951-1-git-send-email-quic_akhilpo@quicinc.com>
 <20221005143618.v7.4.I5e64ff4b77bb9079eb2edeea8a02585c9e76778f@changeid>
 <CAPDyKFp8ynYSyMc+gXWuW8dC1j07X+8k3omsKKnLA_u+4X-vvA@mail.gmail.com>
 <76812eb1-ef4a-48b3-7b7a-231adc8c7c36@quicinc.com>
 <20221208210929.capfm7jaltxvgpvq@builder.lan>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20221208210929.capfm7jaltxvgpvq@builder.lan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 6k1emu0vcrTAQxsOXaRZ37Xmbmw3ybeD
X-Proofpoint-ORIG-GUID: 6k1emu0vcrTAQxsOXaRZ37Xmbmw3ybeD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212120161
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, krzysztof.kozlowski@linaro.org,
 Andy Gross <agross@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/9/2022 2:39 AM, Bjorn Andersson wrote:
> On Thu, Dec 08, 2022 at 08:54:39PM +0530, Akhil P Oommen wrote:
>> On 12/7/2022 9:16 PM, Ulf Hansson wrote:
>>> On Wed, 5 Oct 2022 at 11:08, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>> Allow a consumer driver to poll for cx gdsc collapse through Reset
>>>> framework.
>>> Would you mind extending this commit message, to allow us to better
>>> understand what part is really the consumer part.
>> Sure. I can do that.
>>> I was expecting the consumer part to be the GPU (adreno) driver, but I
>>> may have failed to understand correctly. It would be nice to see an
>>> example of a typical sequence, where the reset is being
>>> asserted/deasserted, from the consumer point of view. Would you mind
>>> explaining this a bit more?
>> https://elixir.bootlin.com/linux/v6.1-rc8/source/drivers/gpu/drm/msm/adreno/a6xx_gpu.c#L1309
>> You are correct. The consumer is adreno gpu driver. When there is a gpu fault, these sequences are followed:
>> 1. drop pm_runtime_put() for gpu device which will drops its vote on 'cx' genpd. line: 1306
>> 2. At this point, there could be vote from either smmu driver (smmu is under same power domain too) or from other subsystems (tz/hyp).
> Can you confirm that this is happening completely independent of what
> the kernel does?
Yes, it is independent.
>
>> 3. So we call into gdsc driver through reset interface to poll the gdsc register to ensure it collapsed at least once. Line: 1309
> I other words, if we engineered 1. such that it would wait in
> gdsc_disable() until the condition for 3. is reached, that should work
> for you? (Obviously depending on the ability for us to engineer this...)
Yes, it will work.

-Akhil.
>
> Regards,
> Bjorn
>
>> 4. Then we turn ON gpu. line:1314.
>>
>> -Akhil.
>>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Kind regards
>>> Uffe
>>>
>>>> ---
>>>>
>>>> (no changes since v3)
>>>>
>>>> Changes in v3:
>>>> - Convert 'struct qcom_reset_ops cx_gdsc_reset' to 'static const' (Krzysztof)
>>>>
>>>> Changes in v2:
>>>> - Minor update to use the updated custom reset ops implementation
>>>>
>>>>  drivers/clk/qcom/gpucc-sc7280.c | 10 ++++++++++
>>>>  1 file changed, 10 insertions(+)
>>>>
>>>> diff --git a/drivers/clk/qcom/gpucc-sc7280.c b/drivers/clk/qcom/gpucc-sc7280.c
>>>> index 9a832f2..fece3f4 100644
>>>> --- a/drivers/clk/qcom/gpucc-sc7280.c
>>>> +++ b/drivers/clk/qcom/gpucc-sc7280.c
>>>> @@ -433,12 +433,22 @@ static const struct regmap_config gpu_cc_sc7280_regmap_config = {
>>>>         .fast_io = true,
>>>>  };
>>>>
>>>> +static const struct qcom_reset_ops cx_gdsc_reset = {
>>>> +       .reset = gdsc_wait_for_collapse,
>>>> +};
>>>> +
>>>> +static const struct qcom_reset_map gpucc_sc7280_resets[] = {
>>>> +       [GPU_CX_COLLAPSE] = { .ops = &cx_gdsc_reset, .priv = &cx_gdsc },
>>>> +};
>>>> +
>>>>  static const struct qcom_cc_desc gpu_cc_sc7280_desc = {
>>>>         .config = &gpu_cc_sc7280_regmap_config,
>>>>         .clks = gpu_cc_sc7280_clocks,
>>>>         .num_clks = ARRAY_SIZE(gpu_cc_sc7280_clocks),
>>>>         .gdscs = gpu_cc_sc7180_gdscs,
>>>>         .num_gdscs = ARRAY_SIZE(gpu_cc_sc7180_gdscs),
>>>> +       .resets = gpucc_sc7280_resets,
>>>> +       .num_resets = ARRAY_SIZE(gpucc_sc7280_resets),
>>>>  };
>>>>
>>>>  static const struct of_device_id gpu_cc_sc7280_match_table[] = {
>>>> --
>>>> 2.7.4
>>>>

