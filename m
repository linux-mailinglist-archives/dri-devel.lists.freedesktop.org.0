Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEA96D548E
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 00:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C866010E5A9;
	Mon,  3 Apr 2023 22:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A3810E5A9;
 Mon,  3 Apr 2023 22:13:05 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 333Kl39H017499; Mon, 3 Apr 2023 22:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=tdIvwZ6gzVADNUmLOLaqRrwkghhD4NIUTvfSOaJMZh0=;
 b=UWDdJbFhctc1WLomYeog3fwmibUkzwYtxjkz4AWNzk5VDOwkzP/W60PZwuL1FhRvbWCL
 XWPcrAQjwhfNvYXjaxAMciu6/fVe7ZBXIqrhnsucdn0o9sanZYGvGZ5Wj8OE7QTwmcfz
 PGwPavX0qvAFdzAA4xR8jiva28vZqxDDtj1Dc6plHmSLNHSMW5fimYD9J8F3g5V3JBHA
 KLKw1JMjHuHafpVj9r8Nq2h24kOebGZhhFZWrSLioKzRSWvOBVRddobytAeBLQfefwpA
 p0i4rhtI6AuNsRW3/8Kh8vIJzv4Fhi4YjuVng66Vj/kIz3tDnkj48zgOJAOBQ4YjnhnN yg== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pqus59shw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Apr 2023 22:13:03 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 333MD2wA007518
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 3 Apr 2023 22:13:02 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 3 Apr 2023
 15:13:01 -0700
Message-ID: <2686a406-784e-a212-8e7e-e479a0019d7e@quicinc.com>
Date: Mon, 3 Apr 2023 15:13:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Freedreno] [PATCH RFC v2 4/6] drm/msm/dpu: Fix
 slice_last_group_size calculation
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <20230329-rfc-msm-dsc-helper-v2-0-3c13ced536b2@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v2-4-3c13ced536b2@quicinc.com>
 <b3a9fecd-0677-482b-7066-03465d5f0dd0@linaro.org>
 <b20b78ff-067d-769a-2266-94662d224843@quicinc.com>
 <c8dc2528-a4a7-573d-5d61-59a639125124@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <c8dc2528-a4a7-573d-5d61-59a639125124@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ftm9j1PHqfiWWtvycI7oaJgORO07u2tf
X-Proofpoint-GUID: ftm9j1PHqfiWWtvycI7oaJgORO07u2tf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_17,2023-04-03_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 impostorscore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304030176
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/3/2023 2:51 PM, Dmitry Baryshkov wrote:
> On 04/04/2023 00:45, Jessica Zhang wrote:
>>
>>
>> On 4/2/2023 4:27 AM, Dmitry Baryshkov wrote:
>>> On 31/03/2023 21:49, Jessica Zhang wrote:
>>>> Correct the math for slice_last_group_size so that it matches the
>>>> calculations downstream.
>>>>
>>>> Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 6 +++++-
>>>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
>>>> index b952f7d2b7f5..9312a8d7fbd9 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
>>>> @@ -56,7 +56,11 @@ static void dpu_hw_dsc_config(struct dpu_hw_dsc 
>>>> *hw_dsc,
>>>>       if (is_cmd_mode)
>>>>           initial_lines += 1;
>>>> -    slice_last_group_size = 3 - (dsc->slice_width % 3);
>>>> +    slice_last_group_size = dsc->slice_width % 3;
>>>> +
>>>> +    if (slice_last_group_size == 0)
>>>> +        slice_last_group_size = 3;
>>>
>>> Hmm. As I went on checking this against techpack:
>>>
>>> mod = dsc->slice_width % 3
>>>
>>> mod | techpack | old | your_patch
>>> 0   | 2        | 3   | 3
>>> 1   | 0        | 2   | 1
>>> 2   | 1        | 1   | 2
>>>
>>> So, obviously neither old nor new code match the calculations of the 
>>> techpack. If we assume that sde_dsc_helper code is correct (which I 
>>> have no reasons to doubt), then the proper code should be:
>>>
>>> slice_last_group_size = (dsc->slice_width + 2) % 3;
>>>
>>> Could you please doublecheck and adjust.
>>
>> Hi Dmitry,
>>
>> The calculation should match the techpack calculation (I kept the 
>> `data |= ((slice_last_group_size - 1) << 18);` a few lines down).
> 
> And the techpack doesn't have -1.
> 
> I think the following code piece would be more convenient as it is simpler:
> 
> slice_last_group_size = (dsc->slice_width + 2) % 3;
> [...]
> data |= slice_last_group_size << 18;
> 
> If you agree, could you please switch to it?

Sure.

Thanks,

Jessica Zhang

> 
>>
>> Thanks,
>>
>> Jessica Zhang
>>
>>>
>>>> +
>>>>       data = (initial_lines << 20);
>>>>       data |= ((slice_last_group_size - 1) << 18);
>>>>       /* bpp is 6.4 format, 4 LSBs bits are for fractional part */
>>>>
>>>
>>> -- 
>>> With best wishes
>>> Dmitry
>>>
> 
> -- 
> With best wishes
> Dmitry
> 
