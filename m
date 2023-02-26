Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EFA6A2D21
	for <lists+dri-devel@lfdr.de>; Sun, 26 Feb 2023 03:10:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870C610E0F1;
	Sun, 26 Feb 2023 02:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0127B10E0F1;
 Sun, 26 Feb 2023 02:10:13 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31Q1wNjQ027734; Sun, 26 Feb 2023 02:10:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=fJznbVVqx0R/Sln2bJAOjE1eXjS3i69ztMFQSRujj9o=;
 b=cxwFLAKdNaIEFtZZlHJ0m8DybhGlmEL+O+bdrwjAeoL/vsBzFp/nFN7kGmtN82iebblI
 v60oXNpI4H/u56/wHDc8FmiCxf71keoQBHvj0fkcZh8wheK+zknGFUd9JeU3sUu6erRf
 OugCenXs5ACqFJShwEqs571lQZ8od+FGrKt4HPE5H46DJ6JokfQGGYWdxDu4hp2cXPiA
 MUWASj35m1Jwop3yfM5VTlbgCnIvSphRviY6UPSZuDIAaMhJVlV6FZsbsxOOn5KOVCHp
 HTvzupUz8+ncvyqco/igJ1V8l8VbYKyzG6AgBQzm0jhzBJjtBJAMTCssduFn6M7W+0+p mg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nybgu9mwj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Feb 2023 02:10:06 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31Q2A53p020509
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Feb 2023 02:10:05 GMT
Received: from [10.110.89.76] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Sat, 25 Feb
 2023 18:10:04 -0800
Message-ID: <9d976322-14ba-6ada-ae26-174695509d10@quicinc.com>
Date: Sat, 25 Feb 2023 18:10:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 06/50] drm/msm/dpu: correct sm8550 scaler
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <neil.armstrong@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
 <20230211231259.1308718-7-dmitry.baryshkov@linaro.org>
 <5bc2221f-61ba-3801-6dbb-83587d986b50@linaro.org>
 <a589d45e-f084-9371-05dc-0676f12458a3@linaro.org>
 <e20d2b76-a446-019d-73db-6f16ba7cbfb5@linaro.org>
 <298eff36-1a55-75a8-d957-ab97504e5caf@quicinc.com>
 <2f7fb041-edf0-79b1-5005-2af19a3d4934@linaro.org>
 <533f2da0-fecc-27e9-7bab-2a9d51377833@quicinc.com>
 <423c71d1-70ce-ae97-3453-737c9cb179d3@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <423c71d1-70ce-ae97-3453-737c9cb179d3@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 86zZuP74UvxGhm7akQV1vTE-_TCw8wBn
X-Proofpoint-ORIG-GUID: 86zZuP74UvxGhm7akQV1vTE-_TCw8wBn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-25_14,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302260015
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



On 2/25/2023 4:06 PM, Dmitry Baryshkov wrote:
> On 26/02/2023 01:27, Abhinav Kumar wrote:
>> Hi Dmitry
>>
>> On 2/25/2023 3:06 PM, Dmitry Baryshkov wrote:
>>> On 24/02/2023 22:51, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 2/13/2023 9:36 AM, neil.armstrong@linaro.org wrote:
>>>>> On 13/02/2023 12:16, Dmitry Baryshkov wrote:
>>>>>> On 13/02/2023 12:41, Neil Armstrong wrote:
>>>>>>> On 12/02/2023 00:12, Dmitry Baryshkov wrote:
>>>>>>>> QSEED4 is a newer variant of QSEED3LITE, which should be used on
>>>>>>>> sm8550. Fix the DPU caps structure and used feature masks.
>>>>>>>
>>>>>>> I found nowhere SM8550 uses Qseed4, on downstream DT, it's written:
>>>>>>>          qcom,sde-qseed-sw-lib-rev = "qseedv3lite";
>>>>>>>          qcom,sde-qseed-scalar-version = <0x3002>;
>>>>>>
>>>>>> And then the techpack tells us starting from 0x3000 the v3lite is v4:
>>>>>>
>>>>>> https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/display-kernel.lnx.5.10.r8-rel/msm/sde/sde_hw_util.c#L59 
>>>>>>
>>>>>>
>>>>>> https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/display-kernel.lnx.5.10.r8-rel/msm/sde/sde_hw_util.c#L102 
>>>>>>
>>>>>
>>>>> OK then:
>>>>>
>>>>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>
>>>>>>
>>>>
>>>> This little bit of confusion is because with downstream, the qseed 
>>>> is a separate usermode library having its own revision. So the SW 
>>>> lib version in this case is not exactly correlating with the scalar 
>>>> HW revision.
>>>
>>> Can you possibly spend some more words here? I see that 
>>> sde_hw_utils.c programs scalers slightly different depending on the 
>>> version of the scaler. At some point the SDE driver was reading the 
>>> register to determine the revision. Then it switched to the revision 
>>> specified in the DTS (which, as far as I understand, corresponds to 
>>> the HW register contents).
>>>
>>> So, where does SW revision come into the play? (and which library are 
>>> we talking about?). Is the 'v3lite' an SW revision? Or is the 0x3002 
>>> an SW revision?
>>>
>>
>> qcom,sde-qseed-sw-lib-rev is the SW library revision for libscale.
>>
>> This is a proprietary library used to calculate the LUTs for the qseed 
>> block. Its not used in the upstream version of the driver.
>>
>> For upstream driver, the driver uses default settings for the LUTs 
>> which work for most of the common use-cases we see.
> 
> Ack, thanks for the explanation. If default settings work, that's good. 
> When you wrote about the proprietary lib, I started wondering if we 
> loose anything (like worse quality of the images, etc).
> 
>>
>> You can refer the below property names, there are programmed by the 
>> lib for the downstream driver.
>>
>> 3733         msm_property_install_range(
>> 3734                 &psde->property_info, "scaler_v2",
>> 3735                 0x0, 0, ~0, 0, PLANE_PROP_SCALER_V2);
>> 3736         msm_property_install_blob(&psde->property_info,
>> 3737                 "lut_sep", 0,
>> 3738                 PLANE_PROP_SCALER_LUT_SEP);
>>
>> No, 0x3002 is the HW revision of the qseed and thats why this change 
>> is correct because the SW library name/rev doesnt exactly match the 
>> qseed HW revision as its possible that even qseed3lite library can 
>> support the QSEED4 HW.
>>
>> So we should be going off qcom,sde-qseed-scalar-version and not 
>> qcom,sde-qseed-sw-lib-rev.
> 
> Thanks!
> 
> So, we should further drop the v3lite/v4 from the scaler name/subblock 
> and use qseed3 everywhere. Correct?
> 

No, even that wont be correct because as you pointed out anything we 
need to handle < QSEED4 case differently from others over here

537 		if (pdpu->pipe_hw->cap->features &
538 			BIT(DPU_SSPP_SCALER_QSEED4)) {
539 			scale_cfg->preload_x[i] = DPU_QSEED4_DEFAULT_PRELOAD_H;
540 			scale_cfg->preload_y[i] = DPU_QSEED4_DEFAULT_PRELOAD_V;
541 		} else {
542 			scale_cfg->preload_x[i] = DPU_QSEED3_DEFAULT_PRELOAD_H;
543 			scale_cfg->preload_y[i] = DPU_QSEED3_DEFAULT_PRELOAD_V;
544 		}


If we want to clean this up more accurately, we should add qseed_rev in 
the dpu caps or rename qseed_type to that which will hold the 0x3xxx 
value and then write a small util which would set the the bit correctly 
based on the qseed rev (0x3xxxx value).


>>
>>>>
>>>> Since upstream DPU only cares about the HW revision of the scaler, 
>>>> we should be going off the qcom,sde-qseed-scalar-version.
>>>>
>>>> This change LGTM,
>>>>
>>>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>
>>>
> 
