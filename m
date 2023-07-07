Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 149A074A802
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 02:17:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43EDC10E4D6;
	Fri,  7 Jul 2023 00:17:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2524710E4D6;
 Fri,  7 Jul 2023 00:17:05 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 366NJv67004004; Fri, 7 Jul 2023 00:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=kxvgPzsFvGX8avhPmRuzYJwFbJe7rjLQqPu0thkKOHc=;
 b=dpC/ryUwQEzh5c+antJ4jl6oci5GhWDbzDvon8W3hy9f3QUmWf0hd6h+XaRzqyTkONM0
 AdZFQHdOpwEnACsDYxMkDziQ1DzFyCzEAx5AP5RVBdicnLcwtBfJi0Z+d8IWhSE1hsBf
 L6UA3ARD3u+iKMoGRo6R2IDRuJG5+xTPZAkqhvCSeo+e62j/wvxZJL9fw3cLCH4gL1PT
 UOOdtRBnHDMDX+l2ErLro/197kJDuLdp8dfbd4qYDwjsUPF0KNX3TFmRKHREFBHHq61g
 gIm4Koupavtr+qMve+jp97kkrlY/YznhRCyiJwF1bq0kGM7DVunuSwmZP+5TRFCGeu4A Nw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rp71y82t9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jul 2023 00:16:58 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3670GvvN009841
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 7 Jul 2023 00:16:57 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 6 Jul
 2023 17:16:57 -0700
Message-ID: <da04a824-b44c-d6a0-3dfc-f1b8e8272195@quicinc.com>
Date: Thu, 6 Jul 2023 17:16:56 -0700
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
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <deb38d54-bf7f-f42a-8b61-f6c8f46370b0@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: _f1rCvP1-NuH3z7q7uLgIzNaXOa3cVxG
X-Proofpoint-ORIG-GUID: _f1rCvP1-NuH3z7q7uLgIzNaXOa3cVxG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_17,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307070000
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



On 7/6/2023 5:07 PM, Dmitry Baryshkov wrote:
> On 06/07/2023 23:48, Ryan McCann wrote:
>> Currently, the names of main blocks are hardcoded into the
>> msm_disp_snapshot_add_block function rather than using the name that
>> already exists in the catalog. Change this to take the name directly from
>> the catalog instead of hardcoding it.
>>
>> Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 32 
>> ++++++++++++++++----------------
>>   1 file changed, 16 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index aa8499de1b9f..70dbb1204e6c 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -899,38 +899,38 @@ static void dpu_kms_mdp_snapshot(struct 
>> msm_disp_state *disp_state, struct msm_k
>>       /* dump CTL sub-blocks HW regs info */
>>       for (i = 0; i < cat->ctl_count; i++)
>> -        msm_disp_snapshot_add_block(disp_state, cat->ctl[i].len,
>> -                dpu_kms->mmio + cat->ctl[i].base, "ctl_%d", i);
>> +        msm_disp_snapshot_add_block(disp_state, cat->ctl[i].len, 
>> dpu_kms->mmio +
>> +                        cat->ctl[i].base, cat->ctl[i].name);
> 
> Splitting on the `+' sign is a bad idea. It makes it harder to read the 
> code. Please keep the first line as is, it is perfectly fine on its own, 
> and do just what you have stated in the commit message: change printed 
> block name.
> 

Actually, I asked Ryan to fix the indent here in the same patch as he 
was touching this code anyway.

So you would prefer thats left untouched?

>>       /* dump DSPP sub-blocks HW regs info */
>>       for (i = 0; i < cat->dspp_count; i++)
>> -        msm_disp_snapshot_add_block(disp_state, cat->dspp[i].len,
>> -                dpu_kms->mmio + cat->dspp[i].base, "dspp_%d", i);
>> +        msm_disp_snapshot_add_block(disp_state, cat->dspp[i].len, 
>> dpu_kms->mmio +
>> +                        cat->dspp[i].base, cat->dspp[i].name);
>>       /* dump INTF sub-blocks HW regs info */
>>       for (i = 0; i < cat->intf_count; i++)
>> -        msm_disp_snapshot_add_block(disp_state, cat->intf[i].len,
>> -                dpu_kms->mmio + cat->intf[i].base, "intf_%d", i);
>> +        msm_disp_snapshot_add_block(disp_state, cat->intf[i].len, 
>> dpu_kms->mmio +
>> +                        cat->intf[i].base, cat->intf[i].name);
>>       /* dump PP sub-blocks HW regs info */
>>       for (i = 0; i < cat->pingpong_count; i++)
>> -        msm_disp_snapshot_add_block(disp_state, cat->pingpong[i].len,
>> -                dpu_kms->mmio + cat->pingpong[i].base, "pingpong_%d", 
>> i);
>> +        msm_disp_snapshot_add_block(disp_state, cat->pingpong[i].len, 
>> dpu_kms->mmio +
>> +                        cat->pingpong[i].base, cat->pingpong[i].name);
>>       /* dump SSPP sub-blocks HW regs info */
>>       for (i = 0; i < cat->sspp_count; i++)
>> -        msm_disp_snapshot_add_block(disp_state, cat->sspp[i].len,
>> -                dpu_kms->mmio + cat->sspp[i].base, "sspp_%d", i);
>> +        msm_disp_snapshot_add_block(disp_state, cat->sspp[i].len, 
>> dpu_kms->mmio +
>> +                        cat->sspp[i].base, cat->sspp[i].name);
>>       /* dump LM sub-blocks HW regs info */
>>       for (i = 0; i < cat->mixer_count; i++)
>> -        msm_disp_snapshot_add_block(disp_state, cat->mixer[i].len,
>> -                dpu_kms->mmio + cat->mixer[i].base, "lm_%d", i);
>> +        msm_disp_snapshot_add_block(disp_state, cat->mixer[i].len, 
>> dpu_kms->mmio +
>> +                        cat->mixer[i].base, cat->mixer[i].name);
>>       /* dump WB sub-blocks HW regs info */
>>       for (i = 0; i < cat->wb_count; i++)
>> -        msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
>> -                dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
>> +        msm_disp_snapshot_add_block(disp_state, cat->wb[i].len, 
>> dpu_kms->mmio +
>> +                        cat->wb[i].base, cat->wb[i].name);
>>       if (cat->mdp[0].features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
>>           msm_disp_snapshot_add_block(disp_state, MDP_PERIPH_TOP0,
>> @@ -944,8 +944,8 @@ static void dpu_kms_mdp_snapshot(struct 
>> msm_disp_state *disp_state, struct msm_k
>>       /* dump DSC sub-blocks HW regs info */
>>       for (i = 0; i < cat->dsc_count; i++)
>> -        msm_disp_snapshot_add_block(disp_state, cat->dsc[i].len,
>> -                dpu_kms->mmio + cat->dsc[i].base, "dsc_%d", i);
>> +        msm_disp_snapshot_add_block(disp_state, cat->dsc[i].len, 
>> dpu_kms->mmio +
>> +                        cat->dsc[i].base, cat->dsc[i].name);
>>       pm_runtime_put_sync(&dpu_kms->pdev->dev);
>>   }
>>
> 
