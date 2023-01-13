Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD6D66A2AE
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 20:10:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBDD910EA9E;
	Fri, 13 Jan 2023 19:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DC710EAA4;
 Fri, 13 Jan 2023 19:10:05 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30DFHUo5019566; Fri, 13 Jan 2023 19:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=p7f1X50KLAAjSb4OhfpAwfcOd49ehxc6z2R2Qapmuiw=;
 b=mChTRs7St6akC5TR/jgYn6akVWL/YsNY9zy0IYAXg9RljpffxkwzLRw2WWyBQz6IKxFr
 6fSmVuzt99v+Y9U/FtqTR5IenZlPrBllFLfkh046ckx1Dcgc/2vJB0uOFHjV2jzXcexQ
 x52wq6Y8A1e0F6Azz1JKryp4Xzn+J06Z52OMVDOJaHNpj2Yq6mo3FM7UbfgDugcjbNUd
 YwoZWywUKo8Hfk7+koLD6y103BD6f0s55VNMI2ogVgRXZ1NHWHEWSGFQP2U4Dy1Xbo3I
 /q9vAILhWPhjnHVLUAxZWr7nDueD+/qFmdXx/y/SYEBWOZcLHhevcWy9HidWYsYtPzoF wQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n2wqw239b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Jan 2023 19:09:58 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30DJ9vLY021266
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Jan 2023 19:09:57 GMT
Received: from [10.110.70.165] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 13 Jan
 2023 11:09:56 -0800
Message-ID: <71f96910-e7b1-92f9-ae15-79bd1da40a0d@quicinc.com>
Date: Fri, 13 Jan 2023 11:09:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH 1/4] drm/msm/mdss: convert UBWC setup to use match data
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <20221208000850.312548-1-dmitry.baryshkov@linaro.org>
 <20221208000850.312548-2-dmitry.baryshkov@linaro.org>
 <047cd859-7141-d52f-4989-847fd2ada002@quicinc.com>
 <b66de0ab-a31b-c86a-c1d0-c9a5f98c4f85@linaro.org>
 <5aa47cf1-0589-4830-c1fb-22e15bac974a@quicinc.com>
 <20230111084458.wcwzipew3ny7fpno@SoMainline.org>
 <e1c49c07-8ae2-f82f-97e0-4bb03c5f5af6@linaro.org>
 <20230111222159.rqsrtdfuop3tpllq@SoMainline.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230111222159.rqsrtdfuop3tpllq@SoMainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ISszoQvdo8zTrv7xhM6IgQHFsDPNzzt0
X-Proofpoint-ORIG-GUID: ISszoQvdo8zTrv7xhM6IgQHFsDPNzzt0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-13_09,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 adultscore=0 mlxscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301130130
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
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/11/2023 2:21 PM, Marijn Suijten wrote:
> On 2023-01-11 17:11:03, Dmitry Baryshkov wrote:
>> On 11/01/2023 10:44, Marijn Suijten wrote:
>>> On 2023-01-09 12:32:18, Abhinav Kumar wrote:
>>> <snip>
>>>>>> On 12/7/2022 4:08 PM, Dmitry Baryshkov wrote:
>>> <snip>
>>>>>>> +struct msm_mdss_data {
>>>>>>> +    u32 ubwc_version;
>>>>>>> +    u32 ubwc_swizzle;
>>>>>>> +    u32 ubwc_static;
>>>>>>> +    u32 highest_bank_bit;
>>>>>>> +    u32 macrotile_mode;
>>>>>>> +};
>>>
>>> This magic struct could really use some documentation, otherwise users
>>> will have no idea what fields to set (or omit) nor what values to use.
>>> For example decoder 2.0 seems to only use ubwc_static as a sort of magic
>>> "we don't know what the bits in UBWC_STATIC mean", whereas decoder 3.0
>>> reconstructs this field entirely from the other parameters.  Decoder 4.0
>>> however does the same, but _also_ embeds this uwbc_static magic value
>>> back into the register value....?
>>
>> On the bright side these magic values correspond 1:1 to the vendor dtsi
>> and to the part of DPU hw catalog. It would be nice to know the bit used
>> by decoder 2.0, but I fear that we'd have to resort to wild guesses
>> unless Qualcomm decides to disclose that information.
> 
> If downstream has these fields verbatim that makes it easier to
> copy-paste, agreed.
> 
>> As for dec 4.0 and ubwc_static. I fear that it's just somebody (writing
>> downstream DT parsing) reused the ubwc-static name for the bitfield
>> which in reality has some sensible name.
> 
> Yes, ugh.
> 
>>> Also read on below about checking "compatibility" between this struct
>>> and the decoder version, and why I feel this struct (versus mandatory
>>> function arguments) makes this struct less robust.
>>>
>>>>>>>     struct msm_mdss {
>>>>>>>         struct device *dev;
>>>>>>> @@ -40,6 +48,7 @@ struct msm_mdss {
>>>>>>>             unsigned long enabled_mask;
>>>>>>>             struct irq_domain *domain;
>>>>>>>         } irq_controller;
>>>>>>> +    const struct msm_mdss_data *mdss_data;
>>>>>>>         struct icc_path *path[2];
>>>>>>>         u32 num_paths;
>>>>>>>     };
>>>>>>> @@ -180,46 +189,40 @@ static int _msm_mdss_irq_domain_add(struct
>>>>>>> msm_mdss *msm_mdss)
>>>>>>>     #define UBWC_3_0 0x30000000
>>>>>>>     #define UBWC_4_0 0x40000000
>>>>>>> -static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss,
>>>>>>> -                       u32 ubwc_static)
>>>>>>> +static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
>>>>>>>     {
>>>>>>> -    writel_relaxed(ubwc_static, msm_mdss->mmio + UBWC_STATIC);
>>>>>>> +    const struct msm_mdss_data *data = msm_mdss->mdss_data;
>>>>>>> +
>>>>>>> +    writel_relaxed(data->ubwc_static, msm_mdss->mmio + UBWC_STATIC);
>>>>>>>     }
>>>>>>> -static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss,
>>>>>>> -                       unsigned int ubwc_version,
>>>>>>> -                       u32 ubwc_swizzle,
>>>>>>> -                       u32 highest_bank_bit,
>>>>>>> -                       u32 macrotile_mode)
>>>>>>> +static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
>>>>>>>     {
>>>>>>> -    u32 value = (ubwc_swizzle & 0x1) |
>>>>>>> -            (highest_bank_bit & 0x3) << 4 |
>>>>>>> -            (macrotile_mode & 0x1) << 12;
>>>>>>> +    const struct msm_mdss_data *data = msm_mdss->mdss_data;
>>>>>>> +    u32 value = (data->ubwc_swizzle & 0x1) |
>>>>>>> +            (data->highest_bank_bit & 0x3) << 4 |
>>>>>>> +            (data->macrotile_mode & 0x1) << 12;
>>>>>>> -    if (ubwc_version == UBWC_3_0)
>>>>>>> +    if (data->ubwc_version == UBWC_3_0)
>>>>>>>             value |= BIT(10);
>>>>>>> -    if (ubwc_version == UBWC_1_0)
>>>>>>> +    if (data->ubwc_version == UBWC_1_0)
>>>>>>>             value |= BIT(8);
>>>>>>>         writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
>>>>>>>     }
>>>>>>> -static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss,
>>>>>>> -                       unsigned int ubwc_version,
>>>>>>> -                       u32 ubwc_swizzle,
>>>>>>> -                       u32 ubwc_static,
>>>>>>> -                       u32 highest_bank_bit,
>>>>>>> -                       u32 macrotile_mode)
>>>>>>> +static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
>>>>>>>     {
>>>>>>> -    u32 value = (ubwc_swizzle & 0x7) |
>>>>>>> -            (ubwc_static & 0x1) << 3 |
>>>>>>> -            (highest_bank_bit & 0x7) << 4 |
>>>>>>> -            (macrotile_mode & 0x1) << 12;
>>>>>>> +    const struct msm_mdss_data *data = msm_mdss->mdss_data;
>>>>>>> +    u32 value = (data->ubwc_swizzle & 0x7) |
>>>>>>> +            (data->ubwc_static & 0x1) << 3 |
>>>>>>> +            (data->highest_bank_bit & 0x7) << 4 |
>>>>>>> +            (data->macrotile_mode & 0x1) << 12;
>>>>>>>         writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
>>>>>>> -    if (ubwc_version == UBWC_3_0) {
>>>>>>> +    if (data->ubwc_version == UBWC_3_0) {
>>>>>>>             writel_relaxed(1, msm_mdss->mmio + UBWC_CTRL_2);
>>>>>>>             writel_relaxed(0, msm_mdss->mmio + UBWC_PREDICTION_MODE);
>>>>>>>         } else {
>>>>>>> @@ -232,6 +235,7 @@ static int msm_mdss_enable(struct msm_mdss
>>>>>>> *msm_mdss)
>>>>>>>     {
>>>>>>>         int ret;
>>>>>>>         u32 hw_rev;
>>>>>>> +    u32 ubwc_dec_hw_version;
>>>>>>>         /*
>>>>>>>          * Several components have AXI clocks that can only be turned
>>>>>>> on if
>>>>>>> @@ -250,53 +254,36 @@ static int msm_mdss_enable(struct msm_mdss
>>>>>>> *msm_mdss)
>>>>>>>          * HW_REV requires MDSS_MDP_CLK, which is not enabled by the
>>>>>>> mdss on
>>>>>>>          * mdp5 hardware. Skip reading it for now.
>>>>>>>          */
>>>>>>> -    if (msm_mdss->is_mdp5)
>>>>>>> +    if (msm_mdss->is_mdp5 || !msm_mdss->mdss_data)
>>>>>>>             return 0;
>>>>>>>         hw_rev = readl_relaxed(msm_mdss->mmio + HW_REV);
>>>>
>>>> hw_rev is not used anymore now so why not just drop that reg read
>>>> altogether.
>>>>
>>>>>>>         dev_dbg(msm_mdss->dev, "HW_REV: 0x%x\n", hw_rev);
>>>>>>> +
>>>>>>> +    ubwc_dec_hw_version = readl_relaxed(msm_mdss->mmio +
>>>>>>> UBWC_DEC_HW_VERSION);
>>>>
>>>> If we are going to tie UBWC version to the HW compatible match, then
>>>> even this register read can be skipped and instead you can add
>>>> ubwc_dec_hw_version to your match data struct and skip this read as well.
>>>
>>> I have suggested in IRC to keep this register read, and utilize it to at
>>> least sanity check the configuration.  You are right that the DPU HW
>>> version already describes what UWBC decoder version is used, but we're
>>> are already questioning whether it was ported correctly for SM6115.  A
>>> WARN() that catches a mismatch between what was written in the "catalog"
>>> (or this match table) versus what the hardware reports would have gone a
>>> long way.
>>
>> Well... Sanity checking here means we do not trust the kernel. And whom
>> we can trust then?
> 
> I have no reason to trust the kernel here.  Knowing the read-back value
> might even be necessary to decipher the "downstream" kernel, since it
> doesn't specify the decoder /hardware/ version but only the data format?
> 

Many values in the catalog are also working on the assumption that they 
have been copied over correctly from downstream.

So I dont think we need to rely on reading the revision from HW.

The reason I would like to skip it is because its directly tied to the 
DPU HW version.

Having an extra register read just to make sure downstream values are 
not incorrectly copied over seems like an overkill.

>> Note, that for 6115 I had a question regarding the
>> ubwc_version stated in the comment, not in the code. I asked for
>> UBWC_DEC_HW_VERSION value just to be sure.
> 
> Right, that is some weird paraphrasing.  Is it the UBWC_2_0 data format
> (because there's nothing in dec_20 performing a conditional based on
> this) and only coincidentally being the same as the HW decoder version?
> 
>>> This is especially relevant with the new struct where fields are
>>> (un)used depending on the UBWC HW decoder version, making for an extra
>>> exercise to the developer to double-check whether their struct values
>>> are taken into account or not (or if used ones are accidentally
>>> omitted).
>>
>> Granted the overlay between DPU catalog and MDSS device data maybe we
>> should make DPU ask MDSS for the ubwc settings.
> 
> Is DPU also holding on to these values?  I was more so referring to the
> fact that the HW_DEC version determines what specific fields are read
> and what are not, which may not be immediately obvious when adding a
> struct instance unless reading the code.
> 
> - Marijn
