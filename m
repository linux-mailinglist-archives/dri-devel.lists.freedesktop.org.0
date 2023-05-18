Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAF7708B4D
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 00:09:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B0B610E565;
	Thu, 18 May 2023 22:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D200210E565;
 Thu, 18 May 2023 22:09:28 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34IM4SuS032060; Thu, 18 May 2023 22:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=1bUgox6j599CmzW8rtuF1ODGcZT0x9mq5zR7O7gjYGU=;
 b=DpklgrgzNR5J13XysWqC9gIjglTPojCQYYkDt/cwdJxgNtANZS0DkfQUZ8slkJJYqMtT
 KvWvRQBH044AmyqHFycyVHhx2LXX9oooayaSS1fM9EsFLem+tJqSas9dHT43vrw6Wd1x
 FamzeZ/PhmoZ/jMiG6mzk2imomYWuE2muuhc1Iebkxr5lISgd+RDVbdLP+Qw3FLGk+U9
 ppmRR4m+LGD0hD2RYS293B9gpj+g3ZCC9o+Hbhxec+qF5jfJ5QdJSHxh1talxawWgMMp
 3MwRzbmgcwNFnJMTHLtKCK/Dxp/UXJKhVQhkeUeiD6GwKByMnPIwrOxihnjoCMkp4s/H qQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qn8d2jne6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 May 2023 22:09:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34IM9JK7013625
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 May 2023 22:09:19 GMT
Received: from [10.71.110.189] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 18 May
 2023 15:09:18 -0700
Message-ID: <8e9feb23-a5f0-7cd8-ebff-8e9097ff0ca1@quicinc.com>
Date: Thu, 18 May 2023 15:09:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v10 6/8] drm/msm/dpu: separate DSC flush update out of
 interface
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <1684360919-28458-1-git-send-email-quic_khsieh@quicinc.com>
 <1684360919-28458-7-git-send-email-quic_khsieh@quicinc.com>
 <evkla3rkf4tge6gln4lgtulj7q5gt6vef3i2yqupc5lj2oszfx@7ttyxzlmvet5>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <evkla3rkf4tge6gln4lgtulj7q5gt6vef3i2yqupc5lj2oszfx@7ttyxzlmvet5>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: R4zabI1_GyLgeX59jG_w1tVMUG-WQRtY
X-Proofpoint-GUID: R4zabI1_GyLgeX59jG_w1tVMUG-WQRtY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-18_15,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 malwarescore=0 mlxlogscore=756 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305180182
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 quic_jesszhan@quicinc.com, swboyd@chromium.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/17/2023 3:31 PM, Marijn Suijten wrote:
>
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>> @@ -139,6 +139,11 @@ static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>>   				CTL_DSPP_n_FLUSH(dspp - DSPP_0),
>>   				ctx->pending_dspp_flush_mask[dspp - DSPP_0]);
>>   		}
>> +
>> +	if (ctx->pending_flush_mask & BIT(DSC_IDX))
>> +		DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH,
>> +			      ctx->pending_dsc_flush_mask);
> Again, when do we reset this mask to 0?  (v8 review)

can not find it.

let me add a separate  patch to fix this.

>
>> +
>>   	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);
>>   }
>>   
>> @@ -285,6 +290,13 @@ static void dpu_hw_ctl_update_pending_flush_merge_3d_v1(struct dpu_hw_ctl *ctx,
>>   	ctx->pending_flush_mask |= BIT(MERGE_3D_IDX);
>>   }
>>   
>> +static void dpu_hw_ctl_update_pending_flush_dsc_v1(struct dpu_hw_ctl *ctx,
>> +						   enum dpu_dsc dsc_num)
>> +{
>> +	ctx->pending_dsc_flush_mask |= BIT(dsc_num - DSC_0);
>> +	ctx->pending_flush_mask |= BIT(DSC_IDX);
>> +}
>> +
>>   static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl *ctx,
>>   	enum dpu_dspp dspp, u32 dspp_sub_blk)
>>   {
>> @@ -502,9 +514,6 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>>   	if ((test_bit(DPU_CTL_VM_CFG, &ctx->caps->features)))
>>   		mode_sel = CTL_DEFAULT_GROUP_ID  << 28;
>>   
>> -	if (cfg->dsc)
>> -		DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH, cfg->dsc);
>> -
>>   	if (cfg->intf_mode_sel == DPU_CTL_MODE_SEL_CMD)
>>   		mode_sel |= BIT(17);
>>   
>> @@ -524,10 +533,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>>   	if (cfg->merge_3d)
>>   		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>>   			      BIT(cfg->merge_3d - MERGE_3D_0));
>> -	if (cfg->dsc) {
>> -		DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
> Again, this bugfix of now wrapping DSC_IDX in BIT() should go in a
> separate Fixes: patch to have this semantic change documented.  (v8
> review)
That will be this patch. let me add Fixes at this patch
>
>> +
>> +	if (cfg->dsc)
>>   		DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
>> -	}
>>   }
>>   
>>   static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
>> @@ -630,6 +638,8 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
>>   		ops->update_pending_flush_merge_3d =
>>   			dpu_hw_ctl_update_pending_flush_merge_3d_v1;
>>   		ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb_v1;
>> +		ops->update_pending_flush_dsc =
>> +			dpu_hw_ctl_update_pending_flush_dsc_v1;
>>   	} else {
>>   		ops->trigger_flush = dpu_hw_ctl_trigger_flush;
>>   		ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>> index 6292002..d5f3ef8 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>> @@ -158,6 +158,15 @@ struct dpu_hw_ctl_ops {
>>   		enum dpu_dspp blk, u32 dspp_sub_blk);
>>   
>>   	/**
>> +	 * OR in the given flushbits to the cached pending_(dsc_)flush_mask
>> +	 * No effect on hardware
>> +	 * @ctx: ctl path ctx pointer
>> +	 * @blk: interface block index
>> +	 */
>> +	void (*update_pending_flush_dsc)(struct dpu_hw_ctl *ctx,
>> +		enum dpu_dsc blk);
>> +
>> +	/**
>>   	 * Write the value of the pending_flush_mask to hardware
>>   	 * @ctx       : ctl path ctx pointer
>>   	 */
>> @@ -229,6 +238,9 @@ struct dpu_hw_ctl_ops {
>>    * @pending_flush_mask: storage for pending ctl_flush managed via ops
>>    * @pending_intf_flush_mask: pending INTF flush
>>    * @pending_wb_flush_mask: pending WB flush
> The above is all capitalized, so...:
>
>> + * @pending_merge_3d_flush_mask: pending merge_3d flush
> MERGE_3D?
>
>> + * @pending_dspp_flush_mask: pending dspp flush
> DSPP
>
>> + * @pending_dsc_flush_mask: pending dsc flush
> DSC
>
> - Marijn
>
>>    * @ops: operation list
>>    */
>>   struct dpu_hw_ctl {
>> @@ -245,6 +257,7 @@ struct dpu_hw_ctl {
>>   	u32 pending_wb_flush_mask;
>>   	u32 pending_merge_3d_flush_mask;
>>   	u32 pending_dspp_flush_mask[DSPP_MAX - DSPP_0];
>> +	u32 pending_dsc_flush_mask;
>>   
>>   	/* ops */
>>   	struct dpu_hw_ctl_ops ops;
>> -- 
>> 2.7.4
>>
