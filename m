Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1429A6FCD26
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 20:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B90510E3BF;
	Tue,  9 May 2023 18:02:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957CA10E182;
 Tue,  9 May 2023 18:02:43 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 349Gg72H027919; Tue, 9 May 2023 18:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=m5YYQNFMFcx+27YXz/ngiPPxOgcwkirsOJ9lHLR7kQA=;
 b=MWluBRIS4p4rsyno8B8qssSM28kP5WHetuqCX/wfKQUfSvPJS97pYJGHrdk0NMvkyNzD
 StcyJTZs/tmJYAIB4CkzQlz89LNzpc0BpXcN75tt9E/A1LmDSKFsvcM6KmqCIXsy4GUg
 BqDgAdDfswcNt25Ypfse6o3FFO0V30TQX/oqQOT2Ltqmm88OQvPn+wGeih5qKB/g9frj
 MHaWr+cmoP0zuG0hfMSdCvIytZAMQ91fbKY6royGt1vIG5PgU5UiFbmjsncw8h9/doGL
 j2wMresfu/DLnrwjnlrhVreGV7FEewbcJawmUEwXhCQ0E+BbYRJX/Buh+BhC+MdPXQaJ mQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qfr508h28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 18:02:39 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 349I2cHe016199
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 9 May 2023 18:02:38 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 9 May 2023
 11:02:38 -0700
Message-ID: <d42839ed-1c3a-c7ce-ec72-4a9d1e5723d3@quicinc.com>
Date: Tue, 9 May 2023 11:02:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH 2/4] drm/msm/dsi: Fix compressed word count
 calculation
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Marijn Suijten <marijn.suijten@somainline.org>
References: <20230405-add-dsc-support-v1-0-6bc6f03ae735@quicinc.com>
 <20230405-add-dsc-support-v1-2-6bc6f03ae735@quicinc.com>
 <a60a9f37-bb43-6e2b-2535-995e9fae250a@linaro.org>
 <32d473a6-f7a5-9aa6-85cf-0f77f1c071ce@quicinc.com>
 <4cf2e9ab-7e08-fb26-d924-8ea8141d9f58@linaro.org>
 <44c47800-0913-b122-77ae-5ce0e5d4b443@linaro.org>
 <cd8cfbd5-1bde-08d8-dbb5-5489820d6a45@linaro.org>
 <5f069b2c-d1b1-e489-7494-67ef395437bc@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <5f069b2c-d1b1-e489-7494-67ef395437bc@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: JrLTldyWT2VorLZThbbApxULoyJsdVQF
X-Proofpoint-ORIG-GUID: JrLTldyWT2VorLZThbbApxULoyJsdVQF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_11,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 adultscore=0 phishscore=0 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305090150
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



On 5/9/2023 4:42 AM, Dmitry Baryshkov wrote:
> On 09/05/2023 11:54, Konrad Dybcio wrote:
>>
>>
>> On 9.05.2023 10:23, Neil Armstrong wrote:
>>> On 09/05/2023 01:27, Dmitry Baryshkov wrote:
>>>> On 08/05/2023 23:09, Abhinav Kumar wrote:
>>>>>
>>>>>
>>>>> On 5/3/2023 1:26 AM, Dmitry Baryshkov wrote:
>>>>>> On 03/05/2023 04:19, Jessica Zhang wrote:
>>>>>>> Currently, word count is calculated using slice_count. This is 
>>>>>>> incorrect
>>>>>>> as downstream uses slice per packet, which is different from
>>>>>>> slice_count.
>>>>>>>
>>>>>>> Slice count represents the number of soft slices per interface, 
>>>>>>> and its
>>>>>>> value will not always match that of slice per packet. For 
>>>>>>> example, it is
>>>>>>> possible to have cases where there are multiple soft slices per 
>>>>>>> interface
>>>>>>> but the panel specifies only one slice per packet.
>>>>>>>
>>>>>>> Thus, use the default value of one slice per packet and remove 
>>>>>>> slice_count
>>>>>>> from the word count calculation.
>>>>>>>
>>>>>>> Fixes: bc6b6ff8135c ("drm/msm/dsi: Use DSC slice(s) packet size 
>>>>>>> to compute word count")
>>>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>>>> ---
>>>>>>>    drivers/gpu/drm/msm/dsi/dsi_host.c | 9 ++++++++-
>>>>>>>    1 file changed, 8 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>>>>>>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>>> index 35c69dbe5f6f..b0d448ffb078 100644
>>>>>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>>> @@ -996,7 +996,14 @@ static void dsi_timing_setup(struct 
>>>>>>> msm_dsi_host *msm_host, bool is_bonded_dsi)
>>>>>>>            if (!msm_host->dsc)
>>>>>>>                wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 
>>>>>>> + 1;
>>>>>>>            else
>>>>>>> -            wc = msm_host->dsc->slice_chunk_size * 
>>>>>>> msm_host->dsc->slice_count + 1;
>>>>>>> +            /*
>>>>>>> +             * When DSC is enabled, WC = slice_chunk_size * 
>>>>>>> slice_per_packet + 1.
>>>>>>> +             * Currently, the driver only supports default value 
>>>>>>> of slice_per_packet = 1
>>>>>>> +             *
>>>>>>> +             * TODO: Expand drm_panel struct to hold 
>>>>>>> slice_per_packet info
>>>>>>> +             *       and adjust DSC math to account for 
>>>>>>> slice_per_packet.
>>>>>>
>>>>>> slice_per_packet is not a part of the standard DSC, so I'm not 
>>>>>> sure how that can be implemented. And definitely we should not 
>>>>>> care about the drm_panel here. It should be either a part of 
>>>>>> drm_dsc_config, or mipi_dsi_device.
>>>>>>
>>>>>
>>>>> This is not correct.
>>>>>
>>>>> It is part of the DSI standard (not DSC standard). Please refer to 
>>>>> Figure 40 "One Line Containing One Packet with Data from One or 
>>>>> More Compressed Slices" and Figure 41 "One Line Containing More 
>>>>> than One Compressed Pixel Stream Packet".
>>>>
>>>> I have reviewed section 8.8.24 and Annex D of the DSI standard.
>>>>
>>>> It is not clear to me, if we can get away with always using 
>>>> slice_per_packet = 1. What is the DSI sink's difference between Fig. 
>>>> 40.(b) and Fig 41?
>>>>
>>>> Are there are known panels that require slice_per_packet != 1? If 
>>>> so, we will have to implement support for such configurations.
>>>>
>>>>> This has details about this. So I still stand by my point that this 
>>>>> should be in the drm_panel.
>>>>
>>>> Note, the driver doesn't use drm_panel directly. So 
>>>> slices_per_packet should go to mipi_dsi_device instead (which in 
>>>> turn can be filled from e.g. drm_panel or from any other source).
>>>
>>> This is a big question, where should we set those parameters ?
>>>
>>> It's an even bigger questions for panels optionally supporting DSC in 
>>> Video or Command mode (like the vtdr6130),
>>> how to select DSC or not ? DT is not an option.
>> Compressed vs uncompressed modes, maybe? Would be nice to make this
>> togglable from userspace.. But then it may not scale for panels with e.g.
>> 10 resolutions, all cmd/vid/dsc/nodsc
> 
> Currently the panel/panel-bridge make decision on command vs video mode. 
> We have no way to influence that decision. If you want to make that 
> negotiable, I'd start with adding 
> 'cmd_supported/video_supported/dsc_supported' flags to struct 
> mipi_dsi_hosts.
> 

Right. Isn't that issue there even today that if a panel supports DSC in 
only one of the modes, we have no way to tell that as we have not 
encountered such a panel in upstream yet.

Also, fundamental question to folks who had panels requiring 
slice_per_pkt as 2,

if you had some panels which need a slice_per_pkt as 2, this support 
could have been added even earlier by someone who had these panels even 
in DSC 1.1.

If these panels are not yet upstreamed, may i please know why this is 
considered as a "breakage"? If they were working "somehow" due to 
incorrect math / panel settings /  DPU calculations, unfortunately we 
have to work towards bringing up these panels properly and upstreaming 
them rather than saying "oh, these panels were working somehow and now 
we need to keep it working".

>>
>>
>> Konrad
>>>
>>> Those should tied to a panel+controller tuple.
>>>
>>> Neil
>>>
>>>>
>>>>>
>>>>>>> +             */
>>>>>>> +            wc = msm_host->dsc->slice_chunk_size + 1;
>>>>>>>            dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
>>>>>>>                DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
>>>>>>>
>>>>>>
>>>>
>>>
> 
