Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C3C74A8F2
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 04:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BCC10E4F8;
	Fri,  7 Jul 2023 02:24:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 330A510E4F4;
 Fri,  7 Jul 2023 02:24:45 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3672KpSa027044; Fri, 7 Jul 2023 02:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=gcKzje3TR7gu11x5qYtexR+kzdaXYRdhFtfgzkm5HMk=;
 b=kehEMVkpMBEzzPrS6eaxQGgYPySScNX/XBOtOFWNjP9iMeAivByQk5JlElpXdT2mN/yI
 E29m/0g6n20R62dnAqZrWdQAtgfvr/IH5XyXhqNTYjWB51oE8Hp/zmgpj9bk/O5wpL2u
 mEE6OOH7WEMsOSqiCB9lnGTT7iMevffo+8AopMnYA8EdtqiEMtlEOA891RrHqmeCOOeM
 Wi/HDQhybHh8b9GgvB8iP5cQOkbyUcePikvI0Y+iJuOcx2eFWLTY2AXvLYHLhz3K7sS0
 Q41iIP7r6WJSTyjcvrhR7gqWnMFtljvg5oIcWMGIUlP6MYBu+I7BI5YYNuVKEKYT6EVC Eg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rnvyvhhyf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jul 2023 02:24:38 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3672Obh8007943
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 7 Jul 2023 02:24:37 GMT
Received: from [10.110.53.25] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 6 Jul
 2023 19:24:36 -0700
Message-ID: <7f9af9af-6a6c-d47e-8bff-b72f3f451703@quicinc.com>
Date: Thu, 6 Jul 2023 19:24:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 5/6] drm/msm/dpu: Refactor printing of main blocks in
 device core dump
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Ryan McCann
 <quic_rmccann@quicinc.com>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230622-devcoredump_patch-v4-0-e304ddbe9648@quicinc.com>
 <20230622-devcoredump_patch-v4-5-e304ddbe9648@quicinc.com>
 <deb38d54-bf7f-f42a-8b61-f6c8f46370b0@linaro.org>
 <da04a824-b44c-d6a0-3dfc-f1b8e8272195@quicinc.com>
 <dc937077-91bd-8c4f-b220-82df11efd215@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <dc937077-91bd-8c4f-b220-82df11efd215@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: xL14X_wVIDda8I9QjqeuArXgv5pecif_
X-Proofpoint-ORIG-GUID: xL14X_wVIDda8I9QjqeuArXgv5pecif_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_17,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307070020
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/6/2023 7:19 PM, Dmitry Baryshkov wrote:
> On 07/07/2023 03:16, Abhinav Kumar wrote:
>>
>>
>> On 7/6/2023 5:07 PM, Dmitry Baryshkov wrote:
>>> On 06/07/2023 23:48, Ryan McCann wrote:
>>>> Currently, the names of main blocks are hardcoded into the
>>>> msm_disp_snapshot_add_block function rather than using the name that
>>>> already exists in the catalog. Change this to take the name directly 
>>>> from
>>>> the catalog instead of hardcoding it.
>>>>
>>>> Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
>>>> ---
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 32 
>>>> ++++++++++++++++----------------
>>>>   1 file changed, 16 insertions(+), 16 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>> index aa8499de1b9f..70dbb1204e6c 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>> @@ -899,38 +899,38 @@ static void dpu_kms_mdp_snapshot(struct 
>>>> msm_disp_state *disp_state, struct msm_k
>>>>       /* dump CTL sub-blocks HW regs info */
>>>>       for (i = 0; i < cat->ctl_count; i++)
>>>> -        msm_disp_snapshot_add_block(disp_state, cat->ctl[i].len,
>>>> -                dpu_kms->mmio + cat->ctl[i].base, "ctl_%d", i);
>>>> +        msm_disp_snapshot_add_block(disp_state, cat->ctl[i].len, 
>>>> dpu_kms->mmio +
>>>> +                        cat->ctl[i].base, cat->ctl[i].name);
>>>
>>> Splitting on the `+' sign is a bad idea. It makes it harder to read 
>>> the code. Please keep the first line as is, it is perfectly fine on 
>>> its own, and do just what you have stated in the commit message: 
>>> change printed block name.
>>>
>>
>> Actually, I asked Ryan to fix the indent here in the same patch as he 
>> was touching this code anyway.
>>
>> So you would prefer thats left untouched?
> 
> Yes. The current one was definitely better than splitting in the middle 
> of a statement.
> 

Certainly Yes. Splitting across '+' was the last resort. For some 
reason, I thought any other option of splitting was breaking checkpatch 
for ryan so we had to do that. But, for this change it seems like even 
if we had done like below checkpatch didnt complain.

@@ -900,7 +900,7 @@ static void dpu_kms_mdp_snapshot(struct 
msm_disp_state *disp_state, struct msm_k
         /* dump CTL sub-blocks HW regs info */
         for (i = 0; i < cat->ctl_count; i++)
                 msm_disp_snapshot_add_block(disp_state, cat->ctl[i].len,
-                               dpu_kms->mmio + cat->ctl[i].base, 
"ctl_%d", i);
+                                           dpu_kms->mmio + 
cat->ctl[i].base, "ctl_%d", i);

But anyway, we can just take care of fixing indentation separately to 
avoid the hassle.

>>
>>>>       /* dump DSPP sub-blocks HW regs info */
>>>>       for (i = 0; i < cat->dspp_count; i++)
>>>> -        msm_disp_snapshot_add_block(disp_state, cat->dspp[i].len,
>>>> -                dpu_kms->mmio + cat->dspp[i].base, "dspp_%d", i);
>>>> +        msm_disp_snapshot_add_block(disp_state, cat->dspp[i].len, 
>>>> dpu_kms->mmio +
>>>> +                        cat->dspp[i].base, cat->dspp[i].name);
>>>>       /* dump INTF sub-blocks HW regs info */
>>>>       for (i = 0; i < cat->intf_count; i++)
>>>> -        msm_disp_snapshot_add_block(disp_state, cat->intf[i].len,
>>>> -                dpu_kms->mmio + cat->intf[i].base, "intf_%d", i);
>>>> +        msm_disp_snapshot_add_block(disp_state, cat->intf[i].len, 
>>>> dpu_kms->mmio +
>>>> +                        cat->intf[i].base, cat->intf[i].name);
>>>>       /* dump PP sub-blocks HW regs info */
>>>>       for (i = 0; i < cat->pingpong_count; i++)
>>>> -        msm_disp_snapshot_add_block(disp_state, cat->pingpong[i].len,
>>>> -                dpu_kms->mmio + cat->pingpong[i].base, 
>>>> "pingpong_%d", i);
>>>> +        msm_disp_snapshot_add_block(disp_state, 
>>>> cat->pingpong[i].len, dpu_kms->mmio +
>>>> +                        cat->pingpong[i].base, cat->pingpong[i].name);
>>>>       /* dump SSPP sub-blocks HW regs info */
>>>>       for (i = 0; i < cat->sspp_count; i++)
>>>> -        msm_disp_snapshot_add_block(disp_state, cat->sspp[i].len,
>>>> -                dpu_kms->mmio + cat->sspp[i].base, "sspp_%d", i);
>>>> +        msm_disp_snapshot_add_block(disp_state, cat->sspp[i].len, 
>>>> dpu_kms->mmio +
>>>> +                        cat->sspp[i].base, cat->sspp[i].name);
>>>>       /* dump LM sub-blocks HW regs info */
>>>>       for (i = 0; i < cat->mixer_count; i++)
>>>> -        msm_disp_snapshot_add_block(disp_state, cat->mixer[i].len,
>>>> -                dpu_kms->mmio + cat->mixer[i].base, "lm_%d", i);
>>>> +        msm_disp_snapshot_add_block(disp_state, cat->mixer[i].len, 
>>>> dpu_kms->mmio +
>>>> +                        cat->mixer[i].base, cat->mixer[i].name);
>>>>       /* dump WB sub-blocks HW regs info */
>>>>       for (i = 0; i < cat->wb_count; i++)
>>>> -        msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
>>>> -                dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
>>>> +        msm_disp_snapshot_add_block(disp_state, cat->wb[i].len, 
>>>> dpu_kms->mmio +
>>>> +                        cat->wb[i].base, cat->wb[i].name);
>>>>       if (cat->mdp[0].features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
>>>>           msm_disp_snapshot_add_block(disp_state, MDP_PERIPH_TOP0,
>>>> @@ -944,8 +944,8 @@ static void dpu_kms_mdp_snapshot(struct 
>>>> msm_disp_state *disp_state, struct msm_k
>>>>       /* dump DSC sub-blocks HW regs info */
>>>>       for (i = 0; i < cat->dsc_count; i++)
>>>> -        msm_disp_snapshot_add_block(disp_state, cat->dsc[i].len,
>>>> -                dpu_kms->mmio + cat->dsc[i].base, "dsc_%d", i);
>>>> +        msm_disp_snapshot_add_block(disp_state, cat->dsc[i].len, 
>>>> dpu_kms->mmio +
>>>> +                        cat->dsc[i].base, cat->dsc[i].name);
>>>>       pm_runtime_put_sync(&dpu_kms->pdev->dev);
>>>>   }
>>>>
>>>
> 
