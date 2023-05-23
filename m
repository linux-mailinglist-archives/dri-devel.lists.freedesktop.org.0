Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0286870E52F
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 21:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5140410E49F;
	Tue, 23 May 2023 19:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E750B10E49F;
 Tue, 23 May 2023 19:14:02 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34NIjZu0020052; Tue, 23 May 2023 19:13:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=mbzUjdNauL+HKalQdT3yUkcfvihpVdDedlpjJcTTDLA=;
 b=WJLhO7A8rOQ5jxHzTNVabs+c2lvEmOh8BNbziIecOwmwjtHMX7uWWqZ7uuPbLsSdj6r8
 mY7sgW7E/WVEWSyFuiMZDXC/VTvMIZICKa1JaNn7poH8q0uw4iUrz+dTpDtd/VkPOKDV
 SZ/Le7KCUl013FUsDebBktQ8kDA41NuJOhqYte9EH9wOnnHz2moQ4flvpuuGbbXKnPBR
 mtgFtQ7tYdhfEnXGY2BrMLcyzo93IMUqZE78jOoVjU1JbW4VFjHvkv0PfzGlEshA5/P9
 N8tkajSZTfQYpdgKT1WM6zbb9DK7dw6PwwWqpHTVSMDZHmSR5HgPnOcP+inzSUqR9oGL ow== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qre8p30d7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 May 2023 19:13:57 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34NJDtZ9018191
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 May 2023 19:13:55 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 23 May
 2023 12:13:54 -0700
Message-ID: <249baf98-5264-b2cb-4213-5bcd00a670c9@quicinc.com>
Date: Tue, 23 May 2023 12:13:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH v2 0/7] drm/msm/dpu: simplify DPU encoder init
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, <neil.armstrong@linaro.org>
References: <20230519023855.3840907-1-dmitry.baryshkov@linaro.org>
 <557a8aee-37b9-5654-c82c-97206576ab44@quicinc.com>
 <CAA8EJpp+ODZZu13ehAN-9Ehz87HCdXsXvO3DQ-oxAhKcb2rqtA@mail.gmail.com>
 <af7ab667-1be4-7391-d0a9-6f9e7439eb6d@linaro.org>
 <b0be5965-0dc9-c33c-9cba-21bfa82c4faf@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <b0be5965-0dc9-c33c-9cba-21bfa82c4faf@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: gkad1XO8CTkt_mydigsZL6Q8cF_wNDX1
X-Proofpoint-GUID: gkad1XO8CTkt_mydigsZL6Q8cF_wNDX1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-23_12,2023-05-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305230155
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
Cc: Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/23/2023 7:36 AM, Dmitry Baryshkov wrote:
> On 23/05/2023 10:31, Neil Armstrong wrote:
>> On 23/05/2023 09:20, Dmitry Baryshkov wrote:
>>> On Tue, 23 May 2023 at 04:58, Abhinav Kumar 
>>> <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 5/18/2023 7:38 PM, Dmitry Baryshkov wrote:
>>>>> Rework dpu_encoder initialization code, simplifying calling sequences
>>>>> and separating common init parts.
>>>>>
>>>>> Changes since v1:
>>>>> - Withdrawn two pathes for a later consideration
>>>>> - Changed dpu_encoder_phys_init() to return void (Abhinav)
>>>>> - Added small simplifications of dpu_encoder_phys_cmd_init() and
>>>>>     dpu_encoder_phys_wb_init()
>>>>>
>>>>
>>>> I had previously given these comments on the cover letter of v1, so
>>>> giving it again.
>>>>
>>>> Please mention that your series was made on top of
>>>> https://patchwork.freedesktop.org/series/116530/.
>>>>
>>>> Figured it out when I tried to apply it to my branch to test.
>>>>
>>>> I had tested v1, and between v1 and v2 i only see very trivial change,
>>>> so i think its okay to retain:
>>>>
>>>> Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
>>>
>>> Unfortunately patchwork ignores tags sent in the cover letter thread.
>>
>> But b4 does with -t option to b4 shazam or b4 am
> 
> Yes. But b4 doesn't append Patchwork headers.
> 

If thats the case, either the author can add them to the patches 
manually like we do sometimes for R-b tags OR I will go ahead and add it 
one by one for every patch now.

Let me know what you prefer.

>>
>> Neil
>>
>>>
>>>>
>>>>> Dmitry Baryshkov (7):
>>>>>     drm/msm/dpu: merge dpu_encoder_init() and dpu_encoder_setup()
>>>>>     drm/msm/dpu: separate common function to init physical encoder
>>>>>     drm/msm/dpu: drop duplicated intf/wb indices from encoder structs
>>>>>     drm/msm/dpu: inline dpu_encoder_get_wb()
>>>>>     drm/msm/dpu: call dpu_rm_get_intf() from dpu_encoder_get_intf()
>>>>>     drm/msm/dpu: drop temp variable from dpu_encoder_phys_cmd_init()
>>>>>     drm/msm/dpu: simplify dpu_encoder_phys_wb_init()
>>>>>
>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 178 
>>>>> ++++++++----------
>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  14 +-
>>>>>    .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  15 +-
>>>>>    .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  35 ++--
>>>>>    .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  19 +-
>>>>>    .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  35 +---
>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  87 ++++-----
>>>>>    7 files changed, 140 insertions(+), 243 deletions(-)
>>>>>
>>>
>>>
>>>
>>
> 
