Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0814D54CDE9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 18:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3CF11125C6;
	Wed, 15 Jun 2022 16:11:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4069E1125AF;
 Wed, 15 Jun 2022 16:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655309518; x=1686845518;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SOL+ffGS+r8v5ewHpIOkg75iNh8LzzO2LAlBqs9VkBs=;
 b=SzXx+aWoopXk85C/guaRfjhAEuTv2ilu5/qPlpL/giobonT0NBJ4/Gtl
 BV2YLIUTXZTXnnol/mxA/1Vc5GuoAq/FCIBrROmVhicG+1ws0hUDW8KVt
 VWEa5EY9JYVRtzbmtvX6/W3nfkXkKpzNahaXlMbYeGVJ/TnO7maNtW4Hj Q=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 15 Jun 2022 09:11:57 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 09:11:57 -0700
Received: from [10.71.110.111] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 15 Jun
 2022 09:11:57 -0700
Message-ID: <60fc83dd-b6ed-ba60-a116-6eecbf71784f@quicinc.com>
Date: Wed, 15 Jun 2022 09:11:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 3/3] drm/msm/dpu: Add interface support for CRC debugfs
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220614211328.216-1-quic_jesszhan@quicinc.com>
 <20220614211328.216-4-quic_jesszhan@quicinc.com>
 <CAA8EJprHBdbAfTEy7wsoyLday6hWR2pBuOrBWjckB_saYDE7DA@mail.gmail.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <CAA8EJprHBdbAfTEy7wsoyLday6hWR2pBuOrBWjckB_saYDE7DA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
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
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/15/2022 2:44 AM, Dmitry Baryshkov wrote:
> On Wed, 15 Jun 2022 at 00:13, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>
>> Add support for writing CRC values for the interface block to
>> the debugfs by calling the necessary MISR setup/collect methods.
>>
>> Changes since V1:
>> - Set values_cnt to only include phys with backing hw_intf
>> - Loop over all drm_encs connected to crtc
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 49 ++++++++++++++--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  3 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 64 +++++++++++++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 22 +++++++
>>   4 files changed, 134 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 16742a66878e..8c9933b2337f 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -79,6 +79,8 @@ static enum dpu_crtc_crc_source dpu_crtc_parse_crc_source(const char *src_name)
>>          if (!strcmp(src_name, "auto") ||
>>              !strcmp(src_name, "lm"))
>>                  return DPU_CRTC_CRC_SOURCE_LAYER_MIXER;
>> +       if (!strcmp(src_name, "intf"))
>> +               return DPU_CRTC_CRC_SOURCE_INTF;
> 
> What about "encoder" / DPU_CRTC_CRC_SOURCE_ENCODER? You basically
> offload CRC generation/collection to the dpu_encoder, so I'd ignore
> the fact that only INTF's support MISR generation and use a more
> generic word here.
> 
>>
>>          return DPU_CRTC_CRC_SOURCE_INVALID;
>>   }
>> @@ -99,8 +101,14 @@ static int dpu_crtc_verify_crc_source(struct drm_crtc *crtc,
>>                  return -EINVAL;
>>          }
>>
>> -       if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
>> +       if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER) {
>>                  *values_cnt = crtc_state->num_mixers;
>> +       } else if (source == DPU_CRTC_CRC_SOURCE_INTF) {
>> +               struct drm_encoder *drm_enc;
> 
> Zero values_cnt here.

Noted.

> 
>> +
>> +               drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc->state->encoder_mask)
>> +                       *values_cnt += dpu_encoder_get_num_phys(drm_enc);
>> +       }
>>
>>          crtc_state->crcs = kcalloc(*values_cnt, sizeof(crtc_state->crcs), GFP_KERNEL);
>>
>> @@ -123,6 +131,14 @@ static void dpu_crtc_setup_lm_misr(struct dpu_crtc_state *crtc_state)
>>          }
>>   }
>>
>> +static void dpu_crtc_setup_encoder_misr(struct drm_crtc *crtc)
>> +{
>> +       struct drm_encoder *drm_enc;
>> +
>> +       drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc->state->encoder_mask)
>> +               dpu_encoder_setup_misr(drm_enc);
>> +}
>> +
>>   static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
>>   {
>>          enum dpu_crtc_crc_source source = dpu_crtc_parse_crc_source(src_name);
>> @@ -175,6 +191,8 @@ static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
>>
>>          if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
>>                  dpu_crtc_setup_lm_misr(crtc_state);
>> +       else if (source == DPU_CRTC_CRC_SOURCE_INTF)
>> +               dpu_crtc_setup_encoder_misr(crtc);
> 
> else? >
>>
>>   cleanup:
>>          drm_modeset_unlock(&crtc->mutex);
>> @@ -220,11 +238,31 @@ static int dpu_crtc_get_lm_crc(struct drm_crtc *crtc, struct dpu_crtc_state *crt
>>                          drm_crtc_accurate_vblank_count(crtc), crtc_state->crcs);
>>   }
>>
>> -static int dpu_crtc_get_crc(struct drm_crtc *crtc)
>> +static int dpu_crtc_get_encoder_crc(struct drm_crtc *crtc)
>>   {
>> -       struct dpu_crtc_state *crtc_state;
>> +       struct drm_encoder *drm_enc;
>> +       struct dpu_crtc_state *crtc_state = to_dpu_crtc_state(crtc->state);
>> +       int rc, pos = 0;
>>
>> -       crtc_state = to_dpu_crtc_state(crtc->state);
>> +       drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc->state->encoder_mask) {
>> +               rc = dpu_encoder_get_crc(drm_enc, crtc_state->crcs, pos);
>> +               if (rc < 0) {
>> +                       if (rc != -ENODATA)
>> +                               DRM_DEBUG_DRIVER("MISR read failed\n");
>> +
>> +                       return rc;
>> +               }
>> +
>> +               pos += rc;
>> +       }
>> +
>> +       return drm_crtc_add_crc_entry(crtc, true,
>> +                       drm_crtc_accurate_vblank_count(crtc), crtc_state->crcs);
>> +}
>> +
>> +static int dpu_crtc_get_crc(struct drm_crtc *crtc)
>> +{
>> +       struct dpu_crtc_state *crtc_state = to_dpu_crtc_state(crtc->state);
> 
> Unnecessary change here. Please move it to the patch 1, which
> refactors this function.

Noted.

> 
>>
>>          /* Skip first 2 frames in case of "uncooked" CRCs */
>>          if (crtc_state->crc_frame_skip_count < 2) {
>> @@ -235,6 +273,9 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc)
>>          if (crtc_state->crc_source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
>>                  return dpu_crtc_get_lm_crc(crtc, crtc_state);
>>
>> +       if (crtc_state->crc_source == DPU_CRTC_CRC_SOURCE_INTF)
>> +               return dpu_crtc_get_encoder_crc(crtc);
>> +
>>          return 0;
>>   }
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
>> index 4bf45e3343ef..5db84ea796db 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
>> @@ -1,5 +1,6 @@
>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>   /*
>> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
>>    * Copyright (c) 2015-2021 The Linux Foundation. All rights reserved.
>>    * Copyright (C) 2013 Red Hat
>>    * Author: Rob Clark <robdclark@gmail.com>
>> @@ -73,11 +74,13 @@ struct dpu_crtc_smmu_state_data {
>>    * enum dpu_crtc_crc_source: CRC source
>>    * @DPU_CRTC_CRC_SOURCE_NONE: no source set
>>    * @DPU_CRTC_CRC_SOURCE_LAYER_MIXER: CRC in layer mixer
>> + * @DPU_CRTC_CRC_SOURCE_INTF: CRC in phys interface
>>    * @DPU_CRTC_CRC_SOURCE_INVALID: Invalid source
>>    */
>>   enum dpu_crtc_crc_source {
>>          DPU_CRTC_CRC_SOURCE_NONE = 0,
>>          DPU_CRTC_CRC_SOURCE_LAYER_MIXER,
>> +       DPU_CRTC_CRC_SOURCE_INTF,
>>          DPU_CRTC_CRC_SOURCE_MAX,
>>          DPU_CRTC_CRC_SOURCE_INVALID = -1
>>   };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 52516eb20cb8..2cbfed5c627e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -14,6 +14,7 @@
>>
>>   #include <drm/drm_crtc.h>
>>   #include <drm/drm_file.h>
>> +#include <drm/drm_vblank.h>
> 
> Why?

Leftover from the v1 patch -- not needed anymore since the 
`drm_crtc_add_crc_entry` call was moved to dpu_crtc.c. Will remove it.

> 
>>   #include <drm/drm_probe_helper.h>
>>
>>   #include "msm_drv.h"
>> @@ -225,6 +226,69 @@ bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
>>          return dpu_enc->wide_bus_en;
>>   }
>>
>> +int dpu_encoder_get_num_phys(const struct drm_encoder *drm_enc)
> 
> The function name is misleading. It doesn't return the number of phys.
> It returns a number of hw_intfs. And in reality you'd like to get the
> number of crc entries supported. If at some point WB (or any other
> possible dpu_encoder backend) gains support for CRC, we won't have to
> change the name.  Please consider adjusting it.

Noted.

> 
>> +{
>> +       struct dpu_encoder_virt *dpu_enc;
>> +       int i, num_intf = 0;
>> +
>> +       dpu_enc = to_dpu_encoder_virt(drm_enc);
>> +
>> +       for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>> +               struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>> +
>> +               if (phys->hw_intf)
>> +                       num_intf++;
> 
> You have to check for hw_intf->ops.setup_misr too.

Noted.

> 
>> +       }
>> +
>> +       return num_intf;
>> +}
>> +
>> +void dpu_encoder_setup_misr(const struct drm_encoder *drm_enc)
>> +{
>> +       struct dpu_encoder_virt *dpu_enc;
>> +
>> +       int i;
>> +
>> +       dpu_enc = to_dpu_encoder_virt(drm_enc);
>> +
>> +       for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>> +               struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>> +
>> +               if (!phys->hw_intf || !phys->hw_intf->ops.setup_misr)
>> +                       continue;
>> +
>> +               phys->hw_intf->ops.setup_misr(phys->hw_intf, true, 1);
>> +       }
>> +}
>> +
>> +int dpu_encoder_get_crc(const struct drm_encoder *drm_enc, u32 *crcs, int pos)
>> +{
>> +       struct dpu_encoder_virt *dpu_enc;
>> +
>> +       int i, rc = 0, entries_added = 0;
>> +
>> +       if (!drm_enc->crtc) {
>> +               DRM_ERROR("no crtc found for encoder %d\n", drm_enc->index);
>> +               return -EINVAL;
>> +       }
>> +
>> +       dpu_enc = to_dpu_encoder_virt(drm_enc);
>> +
>> +       for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>> +               struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>> +
>> +               if (!phys->hw_intf || !phys->hw_intf->ops.collect_misr)
>> +                       continue;
>> +
>> +               rc = phys->hw_intf->ops.collect_misr(phys->hw_intf, &crcs[pos + i]);
> 
> No, you should be indexing the crcs with entries_added rather than i.

Noted.

Thanks,

Jessica Zhang

> 
>> +               if (rc)
>> +                       return rc;
>> +               entries_added++;
>> +       }
>> +
>> +       return entries_added;
>> +}
>> +
>>   static void _dpu_encoder_setup_dither(struct dpu_hw_pingpong *hw_pp, unsigned bpc)
>>   {
>>          struct dpu_hw_dither_cfg dither_cfg = { 0 };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> index 781d41c91994..375370029cb9 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> @@ -1,5 +1,6 @@
>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>   /*
>> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
>>    * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>>    * Copyright (C) 2013 Red Hat
>>    * Author: Rob Clark <robdclark@gmail.com>
>> @@ -174,6 +175,27 @@ int dpu_encoder_get_vsync_count(struct drm_encoder *drm_enc);
>>
>>   bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc);
>>
>> +/**
>> + * dpu_encoder_get_num_phys - get number of physical encoders contained in virtual
>> + *                            encoder
>> + * @drm_enc:    Pointer to previously created drm encoder structure
>> + * Returns:     Number of physical encoders for given drm encoder
>> + */
>> +int dpu_encoder_get_num_phys(const struct drm_encoder *drm_enc);
>> +
>> +/**
>> + * dpu_encoder_setup_misr - enable misr calculations
>> + * @drm_enc:    Pointer to previously created drm encoder structure
>> + */
>> +void dpu_encoder_setup_misr(const struct drm_encoder *drm_encoder);
>> +
>> +/**
>> + * dpu_encoder_get_crc - get the crc value from interface blocks
>> + * @drm_enc:    Pointer to previously created drm encoder structure
>> + * Returns:     0 on success, error otherwise
>> + */
>> +int dpu_encoder_get_crc(const struct drm_encoder *drm_enc, u32 *crcs, int pos);
>> +
>>   /**
>>    * dpu_encoder_use_dsc_merge - returns true if the encoder uses DSC merge topology.
>>    * @drm_enc:    Pointer to previously created drm encoder structure
>> --
>> 2.35.1
>>
> 
> 
> -- 
> With best wishes
> Dmitry
