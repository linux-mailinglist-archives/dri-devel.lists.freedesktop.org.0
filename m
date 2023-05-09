Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FF76FBE43
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 06:37:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C0510E10C;
	Tue,  9 May 2023 04:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C633910E061;
 Tue,  9 May 2023 04:37:01 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34940NfP028290; Tue, 9 May 2023 04:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=tURrAEZas3UPymC/Fmh3j72WpggiO2AEDFkEoL1Os+M=;
 b=iB0FbQny1OgIMIqigE5/+ixnFsmoWwJ2Y0yux8/5fbAAGmz/z9AjZWIQ1SfI2K2isgkm
 tAqCpNZ87+JBr5H2APu1Rg7jwhD6+F/iSG+VEdjPKK4Pw82QKLebT3jig1K1c+NTyCHK
 wCQ39epGF4Ww1QTPhMT/92aefTZE13CAiuWa6OLILLfZPE9L2jaO0n7M4F/4HvBpNWBa
 BvNcUnt/v0PJKUOO3pUU2ElGFF11pJDTH/7ZdiHlp1Sj9LHF0taS9fEn0tPh/8ZasCYV
 fbDt6mq/9jsF+6wGoX1FftjegZ1/VxeXEkvC8RnZDP2N5f0lRpZD/C9M/fj3908p4I+6 Hw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qf77krsgs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 04:36:58 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3494avg6015555
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 9 May 2023 04:36:57 GMT
Received: from [10.110.11.65] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 8 May 2023
 21:36:26 -0700
Message-ID: <6f5db0c8-8764-534e-497b-b246f1ff99d1@quicinc.com>
Date: Mon, 8 May 2023 21:36:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 2/4] drm/msm/dsi: Fix compressed word count calculation
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Marijn Suijten <marijn.suijten@somainline.org>
References: <20230405-add-dsc-support-v1-0-6bc6f03ae735@quicinc.com>
 <20230405-add-dsc-support-v1-2-6bc6f03ae735@quicinc.com>
 <a60a9f37-bb43-6e2b-2535-995e9fae250a@linaro.org>
 <32d473a6-f7a5-9aa6-85cf-0f77f1c071ce@quicinc.com>
 <4cf2e9ab-7e08-fb26-d924-8ea8141d9f58@linaro.org>
 <e4ebb901-84fd-7e7d-531c-1f8d7fec00f9@quicinc.com>
 <9e9bbe10-8646-9443-06b2-fa6737d0c267@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <9e9bbe10-8646-9443-06b2-fa6737d0c267@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: YhG8NvuK-1Z92tAcBHmwRUSrMbzp3qoW
X-Proofpoint-ORIG-GUID: YhG8NvuK-1Z92tAcBHmwRUSrMbzp3qoW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_02,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305090035
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/8/2023 5:47 PM, Dmitry Baryshkov wrote:
> On 09/05/2023 03:45, Abhinav Kumar wrote:
>>
>>
>> On 5/8/2023 4:27 PM, Dmitry Baryshkov wrote:
>>> On 08/05/2023 23:09, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 5/3/2023 1:26 AM, Dmitry Baryshkov wrote:
>>>>> On 03/05/2023 04:19, Jessica Zhang wrote:
>>>>>> Currently, word count is calculated using slice_count. This is 
>>>>>> incorrect
>>>>>> as downstream uses slice per packet, which is different from
>>>>>> slice_count.
>>>>>>
>>>>>> Slice count represents the number of soft slices per interface, 
>>>>>> and its
>>>>>> value will not always match that of slice per packet. For example, 
>>>>>> it is
>>>>>> possible to have cases where there are multiple soft slices per 
>>>>>> interface
>>>>>> but the panel specifies only one slice per packet.
>>>>>>
>>>>>> Thus, use the default value of one slice per packet and remove 
>>>>>> slice_count
>>>>>> from the word count calculation.
>>>>>>
>>>>>> Fixes: bc6b6ff8135c ("drm/msm/dsi: Use DSC slice(s) packet size to 
>>>>>> compute word count")
>>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 9 ++++++++-
>>>>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>>>>>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>> index 35c69dbe5f6f..b0d448ffb078 100644
>>>>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>> @@ -996,7 +996,14 @@ static void dsi_timing_setup(struct 
>>>>>> msm_dsi_host *msm_host, bool is_bonded_dsi)
>>>>>>           if (!msm_host->dsc)
>>>>>>               wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
>>>>>>           else
>>>>>> -            wc = msm_host->dsc->slice_chunk_size * 
>>>>>> msm_host->dsc->slice_count + 1;
>>>>>> +            /*
>>>>>> +             * When DSC is enabled, WC = slice_chunk_size * 
>>>>>> slice_per_packet + 1.
>>>>>> +             * Currently, the driver only supports default value 
>>>>>> of slice_per_packet = 1
>>>>>> +             *
>>>>>> +             * TODO: Expand drm_panel struct to hold 
>>>>>> slice_per_packet info
>>>>>> +             *       and adjust DSC math to account for 
>>>>>> slice_per_packet.
>>>>>
>>>>> slice_per_packet is not a part of the standard DSC, so I'm not sure 
>>>>> how that can be implemented. And definitely we should not care 
>>>>> about the drm_panel here. It should be either a part of 
>>>>> drm_dsc_config, or mipi_dsi_device.
>>>>>
>>>>
>>>> This is not correct.
>>>>
>>>> It is part of the DSI standard (not DSC standard). Please refer to 
>>>> Figure 40 "One Line Containing One Packet with Data from One or More 
>>>> Compressed Slices" and Figure 41 "One Line Containing More than One 
>>>> Compressed Pixel Stream Packet".
>>>
>>> I have reviewed section 8.8.24 and Annex D of the DSI standard.
>>>
>>> It is not clear to me, if we can get away with always using 
>>> slice_per_packet = 1. What is the DSI sink's difference between Fig. 
>>> 40.(b) and Fig 41?
>>>
>>
>> The difference is that in fig 40(b) there is only one packet of data 
>> (check closely, there is only one header).
>>
>> In fig 41, there are multiple headers so its showing multiple packets.
> 
> Yes, this is the description of the pictures. I mean what is the 
> functional difference?
> 

 From the same section of the spec:

"This is one method that can segregate slice-widths
when the receiver has multiple instantiations of decoders and this 
packet structure is used to identify slice-width boundaries"

 From this it seems like when there are multiple decoders then having 
individual multiple packets helps to identify the boundaries correctly 
due to the header/checksum boundaries. How exactly this works on the 
panel side, needs more investigation but outside the boundary of this 
discussion. But I think overall, unless really requested by the panel 
one slice_per_pkt is more optimal as it reduces packet overhead.

>>
>>> Are there are known panels that require slice_per_packet != 1? If so, 
>>> we will have to implement support for such configurations.
>>>
>>
>> Unless explicitly requested by the panel, we can use 1. From the 
>> device tree files of the panels we support downstream, I do see 
>> qcom,mdss-dsc-slice-per-pkt set to 2 for some panels. I dont know 
>> whether those panels will not work with 1. I really don't think any of 
>> the DSC panels working with MSM were upstreamed.
>>
>> I think the one jessica will be posting (and merging) will be the 
>> first and that works with 1.
>>
>> If there are other panels in the works which require 2 slice_per_pkt, 
>> I would wait to first see them on the list and if they cannot work 
>> with 1 slice_per_pkt, add support for that.
> 
> If slice_per_pkt change is localized - touching only few lines in DSI or 
> in msm_helpers. Otherwise we should consider having that from the 
> beginning (but hardcoded to 1 for now).
> 

Yes, from what I see downstream it touches only few lines in DSI and MSM 
helper. So should not be hard from MSM standpoint even in future, but 
the core changes would need agreement from the core maintainers.

>>
>>>> This has details about this. So I still stand by my point that this 
>>>> should be in the drm_panel.
>>>
>>> Note, the driver doesn't use drm_panel directly. So slices_per_packet 
>>> should go to mipi_dsi_device instead (which in turn can be filled 
>>> from e.g. drm_panel or from any other source).
>>>
>>>>
>>>>>> +             */
>>>>>> +            wc = msm_host->dsc->slice_chunk_size + 1;
>>>>>>           dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
>>>>>>               DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
>>>>>>
>>>>>
>>>
> 
