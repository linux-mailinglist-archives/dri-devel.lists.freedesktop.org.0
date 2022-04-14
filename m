Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AFD501D74
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 23:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE0C10E201;
	Thu, 14 Apr 2022 21:30:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF6910E201;
 Thu, 14 Apr 2022 21:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1649971839; x=1681507839;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DV+cZXGND3WDBmk0sP4DWMDXkIiqAfRdh+1pfcSwE8U=;
 b=CZgqJhq38xf/pr6ZMKBusd9n4fJKVhegvrWGxmm9h/2hd2HmeMwd9MmI
 qGpJ7FQSMX5/fUyM3eGdPabAGxqUEODfogoEd7qwyZ1p3ZiShvZ4LzBRe
 MCfOXSKmtV1JuKE5D6I6pwsYis2qtoJtNQu9HiYfFJ5qEoOm6A+AO3PIk 4=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 14 Apr 2022 14:30:38 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 14:30:38 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Apr 2022 14:30:17 -0700
Received: from [10.111.169.145] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 14 Apr
 2022 14:30:14 -0700
Message-ID: <1e318f0a-9468-29bb-999a-0032614c81f3@quicinc.com>
Date: Thu, 14 Apr 2022 14:30:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 03/12] drm/msm/dpu: add writeback blocks to DPU RM
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <dri-devel@lists.freedesktop.org>
References: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
 <1644009445-17320-4-git-send-email-quic_abhinavk@quicinc.com>
 <64ced3f1-5656-d5e1-28bf-eb84cfae8021@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <64ced3f1-5656-d5e1-28bf-eb84cfae8021@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: linux-arm-msm@vger.kernel.org, swboyd@chromium.org, nganji@codeaurora.org,
 seanpaul@chromium.org, markyacoub@chromium.org, quic_jesszhan@quicinc.com,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/4/2022 3:43 PM, Dmitry Baryshkov wrote:
> On 05/02/2022 00:17, Abhinav Kumar wrote:
>> Add writeback blocks to DPU resource manager so that
>> writeback encoders can request for writeback hardware blocks
>> through RM and their usage can be tracked.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> [please excuse me for the duplicate, I've sent the email without the 
> proper distribution list]
> 
> We have WB blocks being allocated manually. Could you please consider 
> following the ideas from 
> https://patchwork.freedesktop.org/patch/470394/?series=99175&rev=1 ?
> 
> I think it simplifies the code and shows exact correspondence between WB 
> and dpu_encoder.

Yes, will rebase on the latest msm-next which i think already has this 
change and refactor this.

> 
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  3 ++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  2 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 71 
>> +++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  2 +
>>   4 files changed, 78 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> index e241914..cc10436 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> @@ -1,5 +1,6 @@
>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>   /*
>> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>>    * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>>    * Copyright (C) 2013 Red Hat
>>    * Author: Rob Clark <robdclark@gmail.com>
>> @@ -21,9 +22,11 @@
>>   /**
>>    * Encoder functions and data types
>>    * @intfs:    Interfaces this encoder is using, INTF_MODE_NONE if 
>> unused
>> + * @wbs:    Writeback blocks this encoder is using
>>    */
>>   struct dpu_encoder_hw_resources {
>>       enum dpu_intf_mode intfs[INTF_MAX];
>> +    enum dpu_intf_mode wbs[WB_MAX];
>>   };
>>   /**
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>> index 2d385b4..1e00804 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>> @@ -1,5 +1,6 @@
>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>   /*
>> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>>    * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>>    * Copyright (C) 2013 Red Hat
>>    * Author: Rob Clark <robdclark@gmail.com>
>> @@ -146,6 +147,7 @@ struct dpu_global_state {
>>       uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
>>       uint32_t intf_to_enc_id[INTF_MAX - INTF_0];
>>       uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
>> +    uint32_t wb_to_enc_id[WB_MAX - WB_0];
>>   };
>>   struct dpu_global_state
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> index f9c83d6..edd0b7a 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> @@ -1,5 +1,6 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>>   /*
>> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>>    * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
>>    */
>> @@ -9,6 +10,7 @@
>>   #include "dpu_hw_ctl.h"
>>   #include "dpu_hw_pingpong.h"
>>   #include "dpu_hw_intf.h"
>> +#include "dpu_hw_wb.h"
>>   #include "dpu_hw_dspp.h"
>>   #include "dpu_hw_merge3d.h"
>>   #include "dpu_encoder.h"
>> @@ -75,6 +77,14 @@ int dpu_rm_destroy(struct dpu_rm *rm)
>>               dpu_hw_intf_destroy(hw);
>>           }
>>       }
>> +    for (i = 0; i < ARRAY_SIZE(rm->wb_blks); i++) {
>> +        struct dpu_hw_wb *hw;
>> +
>> +        if (rm->wb_blks[i]) {
>> +            hw = to_dpu_hw_wb(rm->wb_blks[i]);
>> +            dpu_hw_wb_destroy(hw);
>> +        }
>> +    }
>>       return 0;
>>   }
>> @@ -187,6 +197,24 @@ int dpu_rm_init(struct dpu_rm *rm,
>>           rm->intf_blks[intf->id - INTF_0] = &hw->base;
>>       }
>> +    for (i = 0; i < cat->wb_count; i++) {
>> +        struct dpu_hw_wb *hw;
>> +        const struct dpu_wb_cfg *wb = &cat->wb[i];
>> +
>> +        if (wb->id < WB_0 || wb->id >= WB_MAX) {
>> +            DPU_ERROR("skip intf %d with invalid id\n", wb->id);
>> +            continue;
>> +        }
>> +
>> +        hw = dpu_hw_wb_init(wb->id, mmio, cat);
>> +        if (IS_ERR_OR_NULL(hw)) {
>> +            rc = PTR_ERR(hw);
>> +            DPU_ERROR("failed wb object creation: err %d\n", rc);
>> +            goto fail;
>> +        }
>> +        rm->wb_blks[wb->id - WB_0] = &hw->base;
>> +    }
>> +
>>       for (i = 0; i < cat->ctl_count; i++) {
>>           struct dpu_hw_ctl *hw;
>>           const struct dpu_ctl_cfg *ctl = &cat->ctl[i];
>> @@ -479,6 +507,33 @@ static int _dpu_rm_reserve_intf(
>>       return 0;
>>   }
>> +static int _dpu_rm_reserve_wb(
>> +        struct dpu_rm *rm,
>> +        struct dpu_global_state *global_state,
>> +        uint32_t enc_id,
>> +        uint32_t id)
>> +{
>> +    int idx = id - WB_0;
>> +
>> +    if (idx < 0 || idx >= ARRAY_SIZE(rm->wb_blks)) {
>> +        DPU_ERROR("invalid intf id: %d", id);
>> +        return -EINVAL;
>> +    }
>> +
>> +    if (!rm->wb_blks[idx]) {
>> +        DPU_ERROR("couldn't find wb id %d\n", id);
>> +        return -EINVAL;
>> +    }
>> +
>> +    if (reserved_by_other(global_state->wb_to_enc_id, idx, enc_id)) {
>> +        DPU_ERROR("intf id %d already reserved\n", id);
>> +        return -ENAVAIL;
>> +    }
>> +
>> +    global_state->wb_to_enc_id[idx] = enc_id;
>> +    return 0;
>> +}
>> +
>>   static int _dpu_rm_reserve_intf_related_hw(
>>           struct dpu_rm *rm,
>>           struct dpu_global_state *global_state,
>> @@ -497,6 +552,15 @@ static int _dpu_rm_reserve_intf_related_hw(
>>               return ret;
>>       }
>> +    for (i = 0; i < ARRAY_SIZE(hw_res->wbs); i++) {
>> +        if (hw_res->wbs[i] == INTF_MODE_NONE)
>> +            continue;
>> +        id = i + WB_0;
>> +        ret = _dpu_rm_reserve_wb(rm, global_state, enc_id, id);
>> +        if (ret)
>> +            return ret;
>> +    }
>> +
>>       return ret;
>>   }
>> @@ -567,6 +631,8 @@ void dpu_rm_release(struct dpu_global_state 
>> *global_state,
>>           ARRAY_SIZE(global_state->ctl_to_enc_id), enc->base.id);
>>       _dpu_rm_clear_mapping(global_state->intf_to_enc_id,
>>           ARRAY_SIZE(global_state->intf_to_enc_id), enc->base.id);
>> +    _dpu_rm_clear_mapping(global_state->wb_to_enc_id,
>> +        ARRAY_SIZE(global_state->wb_to_enc_id), enc->base.id);
>>   }
>>   int dpu_rm_reserve(
>> @@ -635,6 +701,11 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>>           hw_to_enc_id = global_state->intf_to_enc_id;
>>           max_blks = ARRAY_SIZE(rm->intf_blks);
>>           break;
>> +    case DPU_HW_BLK_WB:
>> +        hw_blks = rm->wb_blks;
>> +        hw_to_enc_id = global_state->wb_to_enc_id;
>> +        max_blks = ARRAY_SIZE(rm->wb_blks);
>> +        break;
>>       case DPU_HW_BLK_DSPP:
>>           hw_blks = rm->dspp_blks;
>>           hw_to_enc_id = global_state->dspp_to_enc_id;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>> index 1f12c8d..a021409 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>> @@ -1,5 +1,6 @@
>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>   /*
>> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>>    * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
>>    */
>> @@ -30,6 +31,7 @@ struct dpu_rm {
>>       struct dpu_hw_blk *intf_blks[INTF_MAX - INTF_0];
>>       struct dpu_hw_blk *dspp_blks[DSPP_MAX - DSPP_0];
>>       struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
>> +    struct dpu_hw_blk *wb_blks[WB_MAX - WB_0];
>>       uint32_t lm_max_width;
>>   };
> 
> 
