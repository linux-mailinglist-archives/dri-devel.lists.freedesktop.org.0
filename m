Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4336FCF68
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 22:25:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D98E10E3CD;
	Tue,  9 May 2023 20:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB2B10E3CC;
 Tue,  9 May 2023 20:25:21 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 349JmAqe005801; Tue, 9 May 2023 20:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=vOw4KeOLh5CQjPPz0zZ3wSLP2wtyOVw1Qyg4I9juF2A=;
 b=d8S5pn12tjCRuGBiZHiUiLl30fN0B7IC3+JhCxKHP8O4QjEeP8effjoQKe6P5qcBwvJh
 A4RrnZ/ogPh1zbgpP7vMdmMIgaZwskDZEZmddsa1OJYmRfSRqwvGNtH/PHH3L+1u3mI1
 Hx+7Vrria6deeFh+6k9H9pk2OM+XBzvhp8wtZYh5ojJFI7N09OHTqNlCjKYfI3ap7yee
 0wZF61SP0Rl4iuBErqdiCXyG4J43pr12AWmuenMHagTqTFlhGE+sFu2JOZldT2nvnUoL
 sYLXmNuU+iV8caoKEQZZV5fL56gQzowdpl1ldl111MpSV8Fba2HcIEZ2dRqCpo8WwU/p 0Q== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qf77f2t4m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 20:25:18 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 349KPIEl024165
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 9 May 2023 20:25:18 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 9 May 2023
 13:25:17 -0700
Message-ID: <8556e1c5-8f96-7e4c-2f54-066499266414@quicinc.com>
Date: Tue, 9 May 2023 13:25:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [Freedreno] [PATCH 2/4] drm/msm/dsi: Fix compressed word count
 calculation
Content-Language: en-US
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230405-add-dsc-support-v1-0-6bc6f03ae735@quicinc.com>
 <20230405-add-dsc-support-v1-2-6bc6f03ae735@quicinc.com>
 <a60a9f37-bb43-6e2b-2535-995e9fae250a@linaro.org>
 <32d473a6-f7a5-9aa6-85cf-0f77f1c071ce@quicinc.com>
 <4cf2e9ab-7e08-fb26-d924-8ea8141d9f58@linaro.org>
 <44c47800-0913-b122-77ae-5ce0e5d4b443@linaro.org>
 <cd8cfbd5-1bde-08d8-dbb5-5489820d6a45@linaro.org>
 <5f069b2c-d1b1-e489-7494-67ef395437bc@linaro.org>
 <d42839ed-1c3a-c7ce-ec72-4a9d1e5723d3@quicinc.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <d42839ed-1c3a-c7ce-ec72-4a9d1e5723d3@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: dkpDAUXtUu1z-0z_i0Wc9TsYEznixQC-
X-Proofpoint-GUID: dkpDAUXtUu1z-0z_i0Wc9TsYEznixQC-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_13,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 adultscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305090168
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/9/2023 11:02 AM, Abhinav Kumar wrote:
> 
> 
> On 5/9/2023 4:42 AM, Dmitry Baryshkov wrote:
>> On 09/05/2023 11:54, Konrad Dybcio wrote:
>>>
>>>
>>> On 9.05.2023 10:23, Neil Armstrong wrote:
>>>> On 09/05/2023 01:27, Dmitry Baryshkov wrote:
>>>>> On 08/05/2023 23:09, Abhinav Kumar wrote:
>>>>>>
>>>>>>
>>>>>> On 5/3/2023 1:26 AM, Dmitry Baryshkov wrote:
>>>>>>> On 03/05/2023 04:19, Jessica Zhang wrote:
>>>>>>>> Currently, word count is calculated using slice_count. This is 
>>>>>>>> incorrect
>>>>>>>> as downstream uses slice per packet, which is different from
>>>>>>>> slice_count.
>>>>>>>>
>>>>>>>> Slice count represents the number of soft slices per interface, 
>>>>>>>> and its
>>>>>>>> value will not always match that of slice per packet. For 
>>>>>>>> example, it is
>>>>>>>> possible to have cases where there are multiple soft slices per 
>>>>>>>> interface
>>>>>>>> but the panel specifies only one slice per packet.
>>>>>>>>
>>>>>>>> Thus, use the default value of one slice per packet and remove 
>>>>>>>> slice_count
>>>>>>>> from the word count calculation.
>>>>>>>>
>>>>>>>> Fixes: bc6b6ff8135c ("drm/msm/dsi: Use DSC slice(s) packet size 
>>>>>>>> to compute word count")
>>>>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>>>>> ---
>>>>>>>>    drivers/gpu/drm/msm/dsi/dsi_host.c | 9 ++++++++-
>>>>>>>>    1 file changed, 8 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>>>>>>>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>>>> index 35c69dbe5f6f..b0d448ffb078 100644
>>>>>>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>>>> @@ -996,7 +996,14 @@ static void dsi_timing_setup(struct 
>>>>>>>> msm_dsi_host *msm_host, bool is_bonded_dsi)
>>>>>>>>            if (!msm_host->dsc)
>>>>>>>>                wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 
>>>>>>>> + 1;
>>>>>>>>            else
>>>>>>>> -            wc = msm_host->dsc->slice_chunk_size * 
>>>>>>>> msm_host->dsc->slice_count + 1;
>>>>>>>> +            /*
>>>>>>>> +             * When DSC is enabled, WC = slice_chunk_size * 
>>>>>>>> slice_per_packet + 1.
>>>>>>>> +             * Currently, the driver only supports default 
>>>>>>>> value of slice_per_packet = 1
>>>>>>>> +             *
>>>>>>>> +             * TODO: Expand drm_panel struct to hold 
>>>>>>>> slice_per_packet info
>>>>>>>> +             *       and adjust DSC math to account for 
>>>>>>>> slice_per_packet.
>>>>>>>
>>>>>>> slice_per_packet is not a part of the standard DSC, so I'm not 
>>>>>>> sure how that can be implemented. And definitely we should not 
>>>>>>> care about the drm_panel here. It should be either a part of 
>>>>>>> drm_dsc_config, or mipi_dsi_device.
>>>>>>>
>>>>>>
>>>>>> This is not correct.
>>>>>>
>>>>>> It is part of the DSI standard (not DSC standard). Please refer to 
>>>>>> Figure 40 "One Line Containing One Packet with Data from One or 
>>>>>> More Compressed Slices" and Figure 41 "One Line Containing More 
>>>>>> than One Compressed Pixel Stream Packet".
>>>>>
>>>>> I have reviewed section 8.8.24 and Annex D of the DSI standard.
>>>>>
>>>>> It is not clear to me, if we can get away with always using 
>>>>> slice_per_packet = 1. What is the DSI sink's difference between 
>>>>> Fig. 40.(b) and Fig 41?
>>>>>
>>>>> Are there are known panels that require slice_per_packet != 1? If 
>>>>> so, we will have to implement support for such configurations.
>>>>>
>>>>>> This has details about this. So I still stand by my point that 
>>>>>> this should be in the drm_panel.
>>>>>
>>>>> Note, the driver doesn't use drm_panel directly. So 
>>>>> slices_per_packet should go to mipi_dsi_device instead (which in 
>>>>> turn can be filled from e.g. drm_panel or from any other source).
>>>>
>>>> This is a big question, where should we set those parameters ?
>>>>
>>>> It's an even bigger questions for panels optionally supporting DSC 
>>>> in Video or Command mode (like the vtdr6130),
>>>> how to select DSC or not ? DT is not an option.
>>> Compressed vs uncompressed modes, maybe? Would be nice to make this
>>> togglable from userspace.. But then it may not scale for panels with 
>>> e.g.
>>> 10 resolutions, all cmd/vid/dsc/nodsc
>>
>> Currently the panel/panel-bridge make decision on command vs video 
>> mode. We have no way to influence that decision. If you want to make 
>> that negotiable, I'd start with adding 
>> 'cmd_supported/video_supported/dsc_supported' flags to struct 
>> mipi_dsi_hosts.
>>
> 
> Right. Isn't that issue there even today that if a panel supports DSC in 
> only one of the modes, we have no way to tell that as we have not 
> encountered such a panel in upstream yet.
> 
> Also, fundamental question to folks who had panels requiring 
> slice_per_pkt as 2,
> 
> if you had some panels which need a slice_per_pkt as 2, this support 
> could have been added even earlier by someone who had these panels even 
> in DSC 1.1.
> 
> If these panels are not yet upstreamed, may i please know why this is 
> considered as a "breakage"? If they were working "somehow" due to 
> incorrect math / panel settings /  DPU calculations, unfortunately we 
> have to work towards bringing up these panels properly and upstreaming 
> them rather than saying "oh, these panels were working somehow and now 
> we need to keep it working".

I also want to add on top of Abhinav's point:

Currently, the panel I'm testing this series on only uses 
slice_per_pkt=1, so I have no way to testing slice_per_pkt > 1.

So in the case where we add support for slice_per_pkt > 1, I would 
prefer that be as a separate series as I would not be able to validate 
those changes on my current setup.

Thanks,

Jessica Zhang

> 
>>>
>>>
>>> Konrad
>>>>
>>>> Those should tied to a panel+controller tuple.
>>>>
>>>> Neil
>>>>
>>>>>
>>>>>>
>>>>>>>> +             */
>>>>>>>> +            wc = msm_host->dsc->slice_chunk_size + 1;
>>>>>>>>            dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
>>>>>>>>                DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
>>>>>>>>
>>>>>>>
>>>>>
>>>>
>>
