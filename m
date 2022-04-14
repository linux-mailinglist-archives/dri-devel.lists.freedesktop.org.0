Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 687BD501E32
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 00:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 685E210E3E1;
	Thu, 14 Apr 2022 22:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97AA610E392;
 Thu, 14 Apr 2022 22:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1649974889; x=1681510889;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=RCWmzH6k1OIPkZdayTRJiRqc9W3mKie2BPEv4LhQdd8=;
 b=mLGwy/w51QONKpPWe1qCTE8Llyp3QO8OehNPWqHoeAFim00D1I5kLJ/B
 KS0AVA30r1o30ldudEDg67iRHVlnxLLpkVRhq54rOUH+ezaqq6TtemkiP
 RVaNkBLeHnx+mKaZ+lhOeHX02R26tXN9UOmQk7FP6bQOgZP4iAywfe80e A=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 14 Apr 2022 15:21:29 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 15:21:28 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Apr 2022 15:21:27 -0700
Received: from [10.111.169.145] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 14 Apr
 2022 15:21:25 -0700
Message-ID: <3e1457f1-b29b-f205-6732-85e12a8ab838@quicinc.com>
Date: Thu, 14 Apr 2022 15:21:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH 10/12] drm/msm/dpu: initialize dpu encoder and
 connector for writeback
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <dri-devel@lists.freedesktop.org>
References: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
 <1644009445-17320-11-git-send-email-quic_abhinavk@quicinc.com>
 <22b47967-a393-221c-17ce-8f5cfa14cc56@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <22b47967-a393-221c-17ce-8f5cfa14cc56@linaro.org>
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



On 2/4/2022 2:34 PM, Dmitry Baryshkov wrote:
> On 05/02/2022 00:17, Abhinav Kumar wrote:
>> Initialize dpu encoder and connector for writeback if the
>> target supports it in the catalog.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 37 ++++++++++++-----
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 62 
>> +++++++++++++++++++++++++++++
>>   2 files changed, 88 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index b51a677..3746432 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -2066,7 +2066,7 @@ static void dpu_encoder_early_unregister(struct 
>> drm_encoder *encoder)
>>   }
>>   static int dpu_encoder_virt_add_phys_encs(
>> -        u32 display_caps,
>> +        struct msm_display_info *disp_info,
>>           struct dpu_encoder_virt *dpu_enc,
>>           struct dpu_enc_phys_init_params *params)
>>   {
>> @@ -2085,7 +2085,7 @@ static int dpu_encoder_virt_add_phys_encs(
>>           return -EINVAL;
>>       }
>> -    if (display_caps & MSM_DISPLAY_CAP_VID_MODE) {
>> +    if (disp_info->capabilities & MSM_DISPLAY_CAP_VID_MODE) {
>>           enc = dpu_encoder_phys_vid_init(params);
>>           if (IS_ERR_OR_NULL(enc)) {
>> @@ -2098,7 +2098,7 @@ static int dpu_encoder_virt_add_phys_encs(
>>           ++dpu_enc->num_phys_encs;
>>       }
>> -    if (display_caps & MSM_DISPLAY_CAP_CMD_MODE) {
>> +    if (disp_info->capabilities & MSM_DISPLAY_CAP_CMD_MODE) {
>>           enc = dpu_encoder_phys_cmd_init(params);
>>           if (IS_ERR_OR_NULL(enc)) {
>> @@ -2111,6 +2111,19 @@ static int dpu_encoder_virt_add_phys_encs(
>>           ++dpu_enc->num_phys_encs;
>>       }
>> +    if (disp_info->intf_type == DRM_MODE_ENCODER_VIRTUAL) {
>> +        enc = dpu_encoder_phys_wb_init(params);
>> +
>> +        if (IS_ERR_OR_NULL(enc)) {
>> +            DPU_ERROR_ENC(dpu_enc, "failed to init wb enc: %ld\n",
>> +                    PTR_ERR(enc));
>> +            return enc == NULL ? -EINVAL : PTR_ERR(enc);
>> +        }
>> +
>> +        dpu_enc->phys_encs[dpu_enc->num_phys_encs] = enc;
>> +        ++dpu_enc->num_phys_encs;
>> +    }
>> +
>>       if (params->split_role == ENC_ROLE_SLAVE)
>>           dpu_enc->cur_slave = enc;
>>       else
>> @@ -2199,9 +2212,8 @@ static int dpu_encoder_setup_display(struct 
>> dpu_encoder_virt *dpu_enc,
>>           }
>>           if (!ret) {
>> -            ret = 
>> dpu_encoder_virt_add_phys_encs(disp_info->capabilities,
>> -                                                 dpu_enc,
>> -                                                 &phys_params);
>> +            ret = dpu_encoder_virt_add_phys_encs(disp_info,
>> +                    dpu_enc, &phys_params);
>>               if (ret)
>>                   DPU_ERROR_ENC(dpu_enc, "failed to add phys encs\n");
>>           }
>> @@ -2317,11 +2329,14 @@ struct drm_encoder *dpu_encoder_init(struct 
>> drm_device *dev,
>>       if (!dpu_enc)
>>           return ERR_PTR(-ENOMEM);
>> -    rc = drm_encoder_init(dev, &dpu_enc->base, &dpu_encoder_funcs,
>> -            drm_enc_mode, NULL);
>> -    if (rc) {
>> -        devm_kfree(dev->dev, dpu_enc);
>> -        return ERR_PTR(rc);
>> +    /* this is handled by drm_writeback_connector_init for virtual 
>> encoder */
>> +    if (drm_enc_mode != DRM_MODE_ENCODER_VIRTUAL) {
>> +        rc = drm_encoder_init(dev, &dpu_enc->base, &dpu_encoder_funcs,
>> +                              drm_enc_mode, NULL);
>> +        if (rc) {
>> +            devm_kfree(dev->dev, dpu_enc);
>> +            return ERR_PTR(rc);
>> +        }
>>       }
>>       drm_encoder_helper_add(&dpu_enc->base, &dpu_encoder_helper_funcs);
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index 47fe11a..6327ba9 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -1,5 +1,6 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>>   /*
>> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>>    * Copyright (c) 2014-2018, The Linux Foundation. All rights reserved.
>>    * Copyright (C) 2013 Red Hat
>>    * Author: Rob Clark <robdclark@gmail.com>
>> @@ -15,6 +16,7 @@
>>   #include <drm/drm_crtc.h>
>>   #include <drm/drm_file.h>
>>   #include <drm/drm_vblank.h>
>> +#include <drm/drm_writeback.h>
>>   #include "msm_drv.h"
>>   #include "msm_mmu.h"
>> @@ -29,6 +31,7 @@
>>   #include "dpu_kms.h"
>>   #include "dpu_plane.h"
>>   #include "dpu_vbif.h"
>> +#include "dpu_writeback.h"
>>   #define CREATE_TRACE_POINTS
>>   #include "dpu_trace.h"
>> @@ -642,6 +645,56 @@ static int _dpu_kms_initialize_displayport(struct 
>> drm_device *dev,
>>       return 0;
>>   }
>> +static int _dpu_kms_initialize_writeback(struct drm_device *dev,
>> +        struct msm_drm_private *priv, struct dpu_kms *dpu_kms)
>> +{
>> +    struct drm_encoder *encoder = NULL;
>> +    struct msm_display_info info;
>> +    int rc, i;
>> +    const u32 *wb_formats;
>> +    int n_formats;
>> +
>> +    encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_VIRTUAL);
>> +    if (IS_ERR(encoder)) {
>> +        DPU_ERROR("encoder init failed for dsi display\n");
>> +        return PTR_ERR(encoder);
>> +    }
>> +
>> +    memset(&info, 0, sizeof(info));
>> +
>> +    for (i = 0; i < dpu_kms->catalog->wb_count; i++) {
>> +        if (dpu_kms->catalog->wb[i].id == WB_2) {
>> +            wb_formats = dpu_kms->catalog->wb[i].format_list;
>> +            n_formats = dpu_kms->catalog->wb[i].num_formats;
>> +        }
>> +    }
> 
> If there is no WB_2 in the catalog, then both wb_formats and n_formats 
> would be unused. Also even if there is no WB_2 you'd still try creating 
> the writeback below.
> 
> I'd suggest to move dpu_encoder_init() + dpu_writeback_init() + 
> dpu_encoder_setup() to the separate function. Then you can loop over the 
> catslog->wb[] and once WB_2 is found, call this new function.

Makes sense. Will do this.

> 
>> +
>> +    rc = dpu_writeback_init(dev, encoder, encoder->helper_private, 
>> wb_formats,
>> +            n_formats);
>> +    if (rc) {
>> +        DPU_ERROR("dpu_writeback_init, rc = %d\n", rc);
>> +        drm_encoder_cleanup(encoder);
>> +        return rc;
>> +    }
>> +
>> +    priv->encoders[priv->num_encoders++] = encoder;
>> +
>> +    info.num_of_h_tiles = 1;
>> +    /* use only WB idx 2 instance for DPU */
>> +    info.h_tile_instance[0] = WB_2;
>> +    info.capabilities = MSM_DISPLAY_CAP_HOT_PLUG | MSM_DISPLAY_CAP_EDID;
> 
> these two capabilities are unused in the code. I'd suggest to drop them 
> from msm_drv.h at all.

Let me push that as a separate change but will do it for sure as i dont 
see its usage either. Will drop this line from this patch.

> 
>> +    info.intf_type = encoder->encoder_type;
>> +
>> +    rc = dpu_encoder_setup(dev, encoder, &info);
>> +    if (rc) {
>> +        DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
>> +                  encoder->base.id, rc);
>> +        return rc;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   /**
>>    * _dpu_kms_setup_displays - create encoders, bridges and connectors
>>    *                           for underlying displays
>> @@ -668,6 +721,15 @@ static int _dpu_kms_setup_displays(struct 
>> drm_device *dev,
>>           return rc;
>>       }
>> +    /* Since WB isn't a driver check the catalog before initializing */
>> +    if (dpu_kms->catalog->wb_count) {
>> +        rc = _dpu_kms_initialize_writeback(dev, priv, dpu_kms);
>> +        if (rc) {
>> +            DPU_ERROR("initialize_WB failed, rc = %d\n", rc);
>> +            return rc;
>> +        }
>> +    }
>> +
>>       return rc;
>>   }
> 
> 
