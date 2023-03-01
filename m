Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E23976A70C7
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 17:23:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 976C310E310;
	Wed,  1 Mar 2023 16:23:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AAF010E304;
 Wed,  1 Mar 2023 16:23:34 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 321CFP7c001876; Wed, 1 Mar 2023 16:23:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8wBZfy5fcHcLEv+ZksQdujesHs9zzLvwtcpDv6RxDKM=;
 b=lwfiFIsMKVNxrrKZ7jqIYjQk/KMeNkjMjQqHauVFq1FTAnJzvVux45JQx1kiHoGud22w
 kG4D6e+KeXK5EAYpfvK4V4jNkwOP//bH54i4nL1Qt9mb7IL1qbw+e2hcl5Rca8wrIsWK
 2fO09gwYTFh5KiV2TKRn5pYy3EXslVa0X0rLATlBQVPeGI0DBNzcwepzDH50z0zTJ2Oh
 9Zr584cPNVe00jPXdF7DCkITUS2dZJNVhwN3g81UyqkW4fgdiLdGs71n2e/+Z9WcOeqn
 ICToFvy49fLkgBFsFNNwviCh1DHSvcf8eUnXllSh2DJzFNXHUkcw8jKnTm4G79t7NGzq PA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p1vgeje11-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Mar 2023 16:23:31 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 321GNUoi020201
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 1 Mar 2023 16:23:30 GMT
Received: from [10.110.126.127] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 1 Mar 2023
 08:23:29 -0800
Message-ID: <5de60136-4150-dcc7-517f-5d65452c5e1b@quicinc.com>
Date: Wed, 1 Mar 2023 08:23:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v4 1/4] drm/msm/dpu: Move TE setup to prepare_for_kickoff()
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>
References: <20230221184256.1436-1-quic_jesszhan@quicinc.com>
 <20230221184256.1436-2-quic_jesszhan@quicinc.com>
 <20230301100331.3altimojtca4zx6m@SoMainline.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230301100331.3altimojtca4zx6m@SoMainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 7Nxf4SjB6h9DfFiUlf3Ymfi5i011krGy
X-Proofpoint-ORIG-GUID: 7Nxf4SjB6h9DfFiUlf3Ymfi5i011krGy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-01_12,2023-03-01_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 spamscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303010131
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, dmitry.baryshkov@linaro.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/1/2023 2:03 AM, Marijn Suijten wrote:
> On 2023-02-21 10:42:53, Jessica Zhang wrote:
>> Currently, DPU will enable TE during prepare_commit(). However, this
>> will cause a crash and reboot to sahara when trying to read/write to
>> register in get_autorefresh_config(), because the core clock rates
>> aren't set at that time.
> 
> Haven't seeen a crash like this on any of my devices (after implementing
> INTF TE).  get_autorefresh_config() always reads zero (or 1 for
> frame_count) except the first time it is called (autorefresh is left
> enabled by our bootloader on SM6125) and triggers the disable codepath.
> 

I feel that the fact that bootloader keeps things on for you is the 
reason you dont see the issue. With continuoush splash, clocks are kept 
enabled. We dont have it enabled (confirmed that).

> It does look like prepare_for_kickoff() is much more susceptible to
> delays in code than prepare_commit().  The debug logs used to figure
> this out together with this series result in FPS drops on SM6125 and
> SM8150.  Not an issue with this series, just something to keep in mind.
> 
>> This used to work because phys_enc->hw_pp is only initialized in mode
>> set [1], so the first prepare_commit() will return before any register
>> read/write as hw_pp would be NULL.
>>
>> However, when we try to implement support for INTF TE, we will run into
>> the clock issue described above as hw_intf will *not* be NULL on the
>> first prepare_commit(). This is because the initialization of
>> dpu_enc->hw_intf has been moved to dpu_encoder_setup() [2].
>>
>> To avoid this issue, let's enable TE during prepare_for_kickoff()
>> instead as the core clock rates are guaranteed to be set then.
> 
> For the change itself:
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> And tested on SM6125, SM8150 (INTF TE) and SDM845 (PP TE).
> 

Thanks.

> Then, for some patch hygiene, starting here:
> 
>> Depends on: "Implement tearcheck support on INTF block" [3]
>>
>> Changes in V3:
>> - Added function prototypes
>> - Reordered function definitions to make change more legible
>> - Removed prepare_commit() function from dpu_encoder_phys_cmd
>>
>> Changes in V4:
>> - Reworded commit message to be more specific
>> - Removed dpu_encoder_phys_cmd_is_ongoing_pptx() prototype
> 
> ... until here: all this info belongs /below the cut/ outside of the
> messge that becomes part of the commit when this patch is applied to the
> tree.

For DRM, I thought we are keeping the change log above the ---- ?
Which means its allowed in the commit message.

> 
>> [1] https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L1109
>> [2] https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L2339
> 
> Please replace these with "permalinks" (to a commit hash): a branch with
> line number annotation will fall out of date soon as more patches are
> applied that touch these files.
> 
>> [3] https://patchwork.freedesktop.org/series/112332/
> 
> Is this a hard dependency?  It seems this series applies cleanly on
> -next and - from a cursory view - should be applicable and testable
> without my INTF TE series.  However, Dmitry asked me to move some code
> around in review resulting in separate callbacks in the encoder, rather
> than having various if(has_intf_te) within those callbacks.  That'll
> cause conflicts when I eventually get to respin a v2.
> 

I guess Jessica listed this because without intf_te series there is no 
crash because hw_pp would be NULL and autorefresh() would return early. 
So dependency is from the standpoint of when this series is needed and 
not from compilation point of view.

> - Marijn
> 
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> index cb05036f2916..98958c75864a 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> @@ -40,6 +40,8 @@
>>   
>>   #define DPU_ENC_MAX_POLL_TIMEOUT_US	2000
>>   
>> +static void dpu_encoder_phys_cmd_enable_te(struct dpu_encoder_phys *phys_enc);
>> +
>>   static bool dpu_encoder_phys_cmd_is_master(struct dpu_encoder_phys *phys_enc)
>>   {
>>   	return (phys_enc->split_role != ENC_ROLE_SLAVE);
>> @@ -611,6 +613,8 @@ static void dpu_encoder_phys_cmd_prepare_for_kickoff(
>>   			  phys_enc->hw_pp->idx - PINGPONG_0);
>>   	}
>>   
>> +	dpu_encoder_phys_cmd_enable_te(phys_enc);
>> +
>>   	DPU_DEBUG_CMDENC(cmd_enc, "pp:%d pending_cnt %d\n",
>>   			phys_enc->hw_pp->idx - PINGPONG_0,
>>   			atomic_read(&phys_enc->pending_kickoff_cnt));
>> @@ -641,8 +645,7 @@ static bool dpu_encoder_phys_cmd_is_ongoing_pptx(
>>   	return false;
>>   }
>>   
>> -static void dpu_encoder_phys_cmd_prepare_commit(
>> -		struct dpu_encoder_phys *phys_enc)
>> +static void dpu_encoder_phys_cmd_enable_te(struct dpu_encoder_phys *phys_enc)
>>   {
>>   	struct dpu_encoder_phys_cmd *cmd_enc =
>>   		to_dpu_encoder_phys_cmd(phys_enc);
>> @@ -799,7 +802,6 @@ static void dpu_encoder_phys_cmd_trigger_start(
>>   static void dpu_encoder_phys_cmd_init_ops(
>>   		struct dpu_encoder_phys_ops *ops)
>>   {
>> -	ops->prepare_commit = dpu_encoder_phys_cmd_prepare_commit;
>>   	ops->is_master = dpu_encoder_phys_cmd_is_master;
>>   	ops->atomic_mode_set = dpu_encoder_phys_cmd_atomic_mode_set;
>>   	ops->enable = dpu_encoder_phys_cmd_enable;
>> -- 
>> 2.39.2
>>
