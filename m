Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4105070E562
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 21:30:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFE310E4A7;
	Tue, 23 May 2023 19:30:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF5B410E4A7;
 Tue, 23 May 2023 19:30:43 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34NDsf65013530; Tue, 23 May 2023 19:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=i5FHdJNVDlD97PTLbGONSrTOPGpdieFUG7ZM5fa/vEY=;
 b=Wt45GyLyWIxQvXSAFQtFQXZ3OfjTfUddJoI8i3XXoE+rlBr8dCSK5Nvr4AdVUH7uAerY
 Hvk/MVy0C19XxixEIVGysOI1TAVKkaAMitkTgrsL7kpm2jvjgMgsaPQ5kHg0Mq+N4uaU
 e+/wSbo1aIqjry2FRKY7/suF4YQipmSDssj74YEmBXNHMTCOLxaCDCfR2r6ekCSAjiju
 vR17YLU74YnE1jXA5Nt3heABkY2V/RAv8ZvGPvYxfa6iBuruK+Yjvz7EevuMIwU4ZKvl
 NdE89MI9seN2DS/6qnQ6N2mazbX7KqKl7GDmJEQfNqRt47WIa/+S5WIlKz0NHY9mJvwO hw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qrf77ayjd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 May 2023 19:30:39 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34NJUbZJ008467
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 May 2023 19:30:37 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 23 May
 2023 12:30:37 -0700
Message-ID: <a4bda0d3-767e-9ed4-ae59-db9cc843cd48@quicinc.com>
Date: Tue, 23 May 2023 12:30:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH v2 0/7] drm/msm/dpu: simplify DPU encoder init
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230519023855.3840907-1-dmitry.baryshkov@linaro.org>
 <557a8aee-37b9-5654-c82c-97206576ab44@quicinc.com>
 <CAA8EJpp+ODZZu13ehAN-9Ehz87HCdXsXvO3DQ-oxAhKcb2rqtA@mail.gmail.com>
 <af7ab667-1be4-7391-d0a9-6f9e7439eb6d@linaro.org>
 <b0be5965-0dc9-c33c-9cba-21bfa82c4faf@linaro.org>
 <249baf98-5264-b2cb-4213-5bcd00a670c9@quicinc.com>
 <CAA8EJpp4m85ubkfs7erLVxydHi_S7Xp7neNjh22z=tMnvrWsQA@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpp4m85ubkfs7erLVxydHi_S7Xp7neNjh22z=tMnvrWsQA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: aSLX2N1iy2ZD_Qkd0BIjKVe4JxO80s9L
X-Proofpoint-ORIG-GUID: aSLX2N1iy2ZD_Qkd0BIjKVe4JxO80s9L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-23_12,2023-05-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305230157
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
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/23/2023 12:23 PM, Dmitry Baryshkov wrote:
> On Tue, 23 May 2023 at 22:14, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 5/23/2023 7:36 AM, Dmitry Baryshkov wrote:
>>> On 23/05/2023 10:31, Neil Armstrong wrote:
>>>> On 23/05/2023 09:20, Dmitry Baryshkov wrote:
>>>>> On Tue, 23 May 2023 at 04:58, Abhinav Kumar
>>>>> <quic_abhinavk@quicinc.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 5/18/2023 7:38 PM, Dmitry Baryshkov wrote:
>>>>>>> Rework dpu_encoder initialization code, simplifying calling sequences
>>>>>>> and separating common init parts.
>>>>>>>
>>>>>>> Changes since v1:
>>>>>>> - Withdrawn two pathes for a later consideration
>>>>>>> - Changed dpu_encoder_phys_init() to return void (Abhinav)
>>>>>>> - Added small simplifications of dpu_encoder_phys_cmd_init() and
>>>>>>>      dpu_encoder_phys_wb_init()
>>>>>>>
>>>>>>
>>>>>> I had previously given these comments on the cover letter of v1, so
>>>>>> giving it again.
>>>>>>
>>>>>> Please mention that your series was made on top of
>>>>>> https://patchwork.freedesktop.org/series/116530/.
>>>>>>
>>>>>> Figured it out when I tried to apply it to my branch to test.
>>>>>>
>>>>>> I had tested v1, and between v1 and v2 i only see very trivial change,
>>>>>> so i think its okay to retain:
>>>>>>
>>>>>> Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
>>>>>
>>>>> Unfortunately patchwork ignores tags sent in the cover letter thread.
>>>>
>>>> But b4 does with -t option to b4 shazam or b4 am
>>>
>>> Yes. But b4 doesn't append Patchwork headers.
>>>
>>
>> If thats the case, either the author can add them to the patches
>> manually like we do sometimes for R-b tags OR I will go ahead and add it
>> one by one for every patch now.
> 
> I'd prefer either to have a single T-B on the latest patch on the
> series, or a pile of replies with T-B tags. Thank you (for the testing
> and for providing the feedback).
> If we ever switch from git-pw to b4, this requirement will be lifted.
> 

Latest patch means, the last one in the series?

In this case, that would look a bit odd as that one just removes a temp 
variable.

I will provide it on all the patches by tomorrow.

>>
>> Let me know what you prefer.
>>
>>>>
>>>> Neil
>>>>
>>>>>
>>>>>>
>>>>>>> Dmitry Baryshkov (7):
>>>>>>>      drm/msm/dpu: merge dpu_encoder_init() and dpu_encoder_setup()
>>>>>>>      drm/msm/dpu: separate common function to init physical encoder
>>>>>>>      drm/msm/dpu: drop duplicated intf/wb indices from encoder structs
>>>>>>>      drm/msm/dpu: inline dpu_encoder_get_wb()
>>>>>>>      drm/msm/dpu: call dpu_rm_get_intf() from dpu_encoder_get_intf()
>>>>>>>      drm/msm/dpu: drop temp variable from dpu_encoder_phys_cmd_init()
>>>>>>>      drm/msm/dpu: simplify dpu_encoder_phys_wb_init()
>>>>>>>
>>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 178
>>>>>>> ++++++++----------
>>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  14 +-
>>>>>>>     .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  15 +-
>>>>>>>     .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  35 ++--
>>>>>>>     .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  19 +-
>>>>>>>     .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  35 +---
>>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  87 ++++-----
>>>>>>>     7 files changed, 140 insertions(+), 243 deletions(-)
>>>>>>>
>>>>>
>>>>>
>>>>>
>>>>
>>>
> 
> 
> 
