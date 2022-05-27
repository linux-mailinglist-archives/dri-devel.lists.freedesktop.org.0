Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C81D05368C0
	for <lists+dri-devel@lfdr.de>; Sat, 28 May 2022 00:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB4E510E2C9;
	Fri, 27 May 2022 22:23:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6F410E29D;
 Fri, 27 May 2022 22:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1653690199; x=1685226199;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=d3ybgd+j98hFLsLFVZGUhgJXO1i7HlMfXDPK/GPoSVw=;
 b=JN6QdVou+GMRiCxGC9b02iocV86q8qr2PN5joSMxmdLwVvpPvmKyaOpI
 lLd8jCjdHzSbT+wIAeJLyPJqS0+E722FLetUps0CYbYBE2GnBnIACT0Uw
 Bm1hEGdTJINFAszvHnzYnCaPk19wTakZWSTrDTuuVJ+hYN0o8kf1V1lUp w=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 27 May 2022 15:23:19 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2022 15:23:18 -0700
Received: from [10.110.56.216] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 27 May
 2022 15:23:17 -0700
Message-ID: <aa4617f6-65fd-73c6-61b1-686a72c515d7@quicinc.com>
Date: Fri, 27 May 2022 15:23:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [Freedreno] [PATCH 3/3] drm/msm/dpu: Add interface support for
 CRC debugfs
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <20220527185407.162-1-quic_jesszhan@quicinc.com>
 <20220527185407.162-4-quic_jesszhan@quicinc.com>
 <266fdac1-db57-a729-3d73-42d2b34017cd@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <266fdac1-db57-a729-3d73-42d2b34017cd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/27/2022 12:46 PM, Dmitry Baryshkov wrote:
> On 27/05/2022 21:54, Jessica Zhang wrote:
>> Add support for writing CRC values for the interface block to
>> the debugfs by calling the necessary MISR setup/collect methods.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 43 ++++++++++++++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  3 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 61 +++++++++++++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 22 ++++++++
>>   4 files changed, 128 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index ae09466663cf..e830fb1e910d 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -79,6 +79,8 @@ static enum dpu_crtc_crc_source 
>> dpu_crtc_parse_crc_source(const char *src_name)
>>       if (!strcmp(src_name, "auto") ||
>>           !strcmp(src_name, "lm"))
>>           return DPU_CRTC_CRC_SOURCE_LAYER_MIXER;
>> +    if (!strcmp(src_name, "intf"))
>> +        return DPU_CRTC_CRC_SOURCE_INTF;
>>       return DPU_CRTC_CRC_SOURCE_INVALID;
>>   }
>> @@ -94,8 +96,18 @@ static int dpu_crtc_verify_crc_source(struct 
>> drm_crtc *crtc,
>>           return -EINVAL;
>>       }
>> -    if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
>> +    if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER) {
>>           *values_cnt = crtc_state->num_mixers;
>> +    } else if (source == DPU_CRTC_CRC_SOURCE_INTF) {
>> +        struct drm_encoder *drm_enc = get_encoder_from_crtc(crtc);
> 
> Let's do this correctly from the beginning. The CRTC can drive several 
> encoders. Do we want to get CRC from all of them or just from the first 
> one?

In the case of multiple encoders, it would be better to collect CRCs 
from all of them.

> 
>> +
>> +        if (!drm_enc) {
>> +            DRM_ERROR("no encoder found for crtc %d\n", crtc->index);
>> +            return -ENODATA;
>> +        }
>> +
>> +        *values_cnt = dpu_encoder_get_num_phys(drm_enc);
>> +    }
>>       return 0;
>>   }
>> @@ -116,6 +128,18 @@ static void dpu_crtc_setup_lm_misr(struct 
>> dpu_crtc_state *crtc_state)
>>       }
>>   }
>> +static void dpu_crtc_setup_encoder_misr(struct drm_crtc *crtc)
>> +{
>> +    struct drm_encoder *drm_enc = get_encoder_from_crtc(crtc);
>> +
>> +    if (!drm_enc) {
>> +        DRM_ERROR("no encoder found for crtc %d\n", crtc->index);
>> +        return;
>> +    }
>> +
>> +    dpu_encoder_setup_misr(drm_enc);
>> +}
>> +
>>   static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char 
>> *src_name)
>>   {
>>       enum dpu_crtc_crc_source source = 
>> dpu_crtc_parse_crc_source(src_name);
>> @@ -164,6 +188,8 @@ static int dpu_crtc_set_crc_source(struct drm_crtc 
>> *crtc, const char *src_name)
>>       if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
>>           dpu_crtc_setup_lm_misr(crtc_state);
>> +    else if (source == DPU_CRTC_CRC_SOURCE_INTF)
>> +        dpu_crtc_setup_encoder_misr(crtc);
>>   cleanup:
>>       drm_modeset_unlock(&crtc->mutex);
>> @@ -212,6 +238,18 @@ static int dpu_crtc_get_lm_crc(struct drm_crtc 
>> *crtc, struct dpu_crtc_state *crt
>>               drm_crtc_accurate_vblank_count(crtc), crcs);
>>   }
>> +static int dpu_crtc_get_encoder_crc(struct drm_crtc *crtc)
>> +{
>> +    struct drm_encoder *drm_enc =  get_encoder_from_crtc(crtc);
>> +
>> +    if (!drm_enc) {
>> +        DRM_ERROR("no encoder found for crtc %d\n", crtc->index);
>> +        return -EINVAL;
>> +    }
>> +
>> +    return dpu_encoder_get_crc(drm_enc);
>> +}
>> +
>>   static int dpu_crtc_get_crc(struct drm_crtc *crtc)
>>   {
>>       struct dpu_crtc_state *crtc_state;
>> @@ -227,6 +265,9 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc)
>>       if (crtc_state->crc_source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
>>           return dpu_crtc_get_lm_crc(crtc, crtc_state);
>> +    if (crtc_state->crc_source == DPU_CRTC_CRC_SOURCE_INTF)
>> +        return dpu_crtc_get_encoder_crc(crtc);
>> +
>>       return 0;
>>   }
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
>> index b8785c394fcc..a60af034905d 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
>> @@ -1,5 +1,6 @@
>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>   /*
>> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>>    * Copyright (c) 2015-2021 The Linux Foundation. All rights reserved.
>>    * Copyright (C) 2013 Red Hat
>>    * Author: Rob Clark <robdclark@gmail.com>
>> @@ -73,11 +74,13 @@ struct dpu_crtc_smmu_state_data {
>>    * enum dpu_crtc_crc_source: CRC source
>>    * @DPU_CRTC_CRC_SOURCE_NONE: no source set
>>    * @DPU_CRTC_CRC_SOURCE_LAYER_MIXER: CRC in layer mixer
>> + * @DPU_CRTC_CRC_SOURCE_INTF: CRC in phys interface
>>    * @DPU_CRTC_CRC_SOURCE_INVALID: Invalid source
>>    */
>>   enum dpu_crtc_crc_source {
>>       DPU_CRTC_CRC_SOURCE_NONE = 0,
>>       DPU_CRTC_CRC_SOURCE_LAYER_MIXER,
>> +    DPU_CRTC_CRC_SOURCE_INTF,
>>       DPU_CRTC_CRC_SOURCE_MAX,
>>       DPU_CRTC_CRC_SOURCE_INVALID = -1
>>   };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 52516eb20cb8..7740515f462d 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -14,6 +14,7 @@
>>   #include <drm/drm_crtc.h>
>>   #include <drm/drm_file.h>
>> +#include <drm/drm_vblank.h>
>>   #include <drm/drm_probe_helper.h>
>>   #include "msm_drv.h"
>> @@ -225,6 +226,66 @@ bool dpu_encoder_is_widebus_enabled(const struct 
>> drm_encoder *drm_enc)
>>       return dpu_enc->wide_bus_en;
>>   }
>> +int dpu_encoder_get_num_phys(const struct drm_encoder *drm_enc)
>> +{
>> +    struct dpu_encoder_virt *dpu_enc;
>> +
>> +    dpu_enc = to_dpu_encoder_virt(drm_enc);
>> +
>> +    return dpu_enc->num_phys_encs;
>> +}
>> +
>> +void dpu_encoder_setup_misr(const struct drm_encoder *drm_enc)
>> +{
>> +    struct dpu_encoder_virt *dpu_enc;
>> +
>> +    int i;
>> +
>> +    dpu_enc = to_dpu_encoder_virt(drm_enc);
>> +
>> +    for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>> +        struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>> +
>> +        if (!phys->hw_intf || !phys->hw_intf->ops.setup_misr)
>> +            continue;
> 
> Does WB support CRC?

AFAIK, no.

> 
>> +
>> +        phys->hw_intf->ops.setup_misr(phys->hw_intf, true, 1);
>> +    }
>> +}
>> +
>> +int dpu_encoder_get_crc(const struct drm_encoder *drm_enc)
>> +{
>> +    struct dpu_encoder_virt *dpu_enc;
>> +    u32 crcs[MAX_PHYS_ENCODERS_PER_VIRTUAL];
>> +
>> +    int i, rc;
>> +
>> +    if (!drm_enc->crtc) {
>> +        DRM_ERROR("no crtc found for encoder %d\n", drm_enc->index);
>> +        return -EINVAL;
>> +    }
>> +
>> +    dpu_enc = to_dpu_encoder_virt(drm_enc);
>> +
>> +    for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>> +        struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>> +
>> +        if (!phys->hw_intf || !phys->hw_intf->ops.collect_misr)
>> +            continue;
>> +
>> +        rc = phys->hw_intf->ops.collect_misr(phys->hw_intf, &crcs[i]);
> 
> This doesn't look fully correct. Do we need to skip the indices for the 
> phys without a backing hw_intf?

Sorry if I'm misunderstanding your question, but don't we need to have a 
backing hw_intf (and skip if there isn't any) since the methods for 
collecting/setting MISR registers is within the hw_intf?

> 
>> +
> 
> Extra empty line.

Noted

> 
>> +        if (rc) {
>> +            if (rc != -ENODATA)
> 
> Do we need to handle ENODATA in any specific way (like zeroing the 
> crcs[i])? If not, I'd suggest to drop this return code. Let's make an 
> error always an error.

This is a carry-over from this change [1]. We wanted to have the ENODATA 
check to avoid spamming the driver debug logs when CRC is disabled for 
this block.

[1] 
https://gitlab.freedesktop.org/drm/msm/-/commit/3ce8bdca394fc606b55e7c5ed779d171aaae5d09

Thanks,
Jessica Zhang

> 
>> +                DRM_DEBUG_DRIVER("MISR read failed\n");
>> +            return rc;
>> +        }
>> +    }
>> +
>> +    return drm_crtc_add_crc_entry(drm_enc->crtc, true,
>> +            drm_crtc_accurate_vblank_count(drm_enc->crtc), crcs);
>> +}
>> +
>>   static void _dpu_encoder_setup_dither(struct dpu_hw_pingpong *hw_pp, 
>> unsigned bpc)
>>   {
>>       struct dpu_hw_dither_cfg dither_cfg = { 0 };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> index 781d41c91994..8345599dd01a 100644
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
>> @@ -174,6 +175,27 @@ int dpu_encoder_get_vsync_count(struct 
>> drm_encoder *drm_enc);
>>   bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc);
>> +/**
>> + * dpu_encoder_get_num_phys - get number of physical encoders 
>> contained in virtual
>> + *                            encoder
>> + * @drm_enc:    Pointer to previously created drm encoder structure
>> + * Returns:    Number of physical encoders for given drm encoder
>> + */
>> +int dpu_encoder_get_num_phys(const struct drm_encoder *drm_enc);
>> +
>> +/**
>> + * dpu_encoder_setup_misr - enable misr calculations
>> + * @drm_enc:    Pointer to previously created drm encoder structure
>> + */
>> +void dpu_encoder_setup_misr(const struct drm_encoder *drm_encoder);
>> +
>> +/**
>> + * dpu_encoder_get_crc - get the crc value from interface blocks
>> + * @drm_enc:    Pointer to previously created drm encoder structure
>> + * Returns:     0 on success, error otherwise
>> + */
>> +int dpu_encoder_get_crc(const struct drm_encoder *drm_enc);
>> +
>>   /**
>>    * dpu_encoder_use_dsc_merge - returns true if the encoder uses DSC 
>> merge topology.
>>    * @drm_enc:    Pointer to previously created drm encoder structure
> 
> 
> -- 
> With best wishes
> Dmitry
