Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AA95538FE
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 19:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB0F10EF6B;
	Tue, 21 Jun 2022 17:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8364110E1B8;
 Tue, 21 Jun 2022 17:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655833010; x=1687369010;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7dtSdv2ZTXpK2fsXDZe9XL2Qxe7+dC//5XeQcudEShM=;
 b=X3nFv0vfAFoxnHOMKrteS5hK5tozp478FNk9KXYN98A2iJyp5xGyh8/f
 cfDHrTGBgZdfvq4A8nwnDnFIEISG2/BPwZYwMvFbcJsoK0n2C72kHCEVo
 v23cPIRw3IUgEu+p0sqart+DBwBVM/ZT1APpC+Q1IMxCg1HqBcvU9ZoH3 o=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 21 Jun 2022 10:36:50 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 10:36:49 -0700
Received: from [10.71.110.111] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 21 Jun
 2022 10:36:48 -0700
Message-ID: <5b1f7e55-024e-3509-79b3-3da34766e2da@quicinc.com>
Date: Tue, 21 Jun 2022 10:36:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [Freedreno] [PATCH v3 4/4] drm/msm/dpu: Add interface support for
 CRC debugfs
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220621005033.274-1-quic_jesszhan@quicinc.com>
 <20220621005033.274-4-quic_jesszhan@quicinc.com>
 <CAA8EJpop8=4_2xGrNt0fL4qGjYQK9+0VuQ8nq=OOXVJF7aoauQ@mail.gmail.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <CAA8EJpop8=4_2xGrNt0fL4qGjYQK9+0VuQ8nq=OOXVJF7aoauQ@mail.gmail.com>
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



On 6/20/2022 11:36 PM, Dmitry Baryshkov wrote:
> On Tue, 21 Jun 2022 at 03:50, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>
>> Add support for writing CRC values for the interface block to
>> the debugfs by calling the necessary MISR setup/collect methods.
>>
>> Changes since V1:
>> - Set values_cnt to only include phys with backing hw_intf
>> - Loop over all drm_encs connected to crtc
>>
>> Changes since V2:
>> - Remove vblank.h inclusion
>> - Change `pos + i` to `pos + entries`
>> - Initialize values_cnt to 0 for encoder
>> - Change DPU_CRTC_CRC_SOURCE_INTF to DPU_CRTC_CRC_SOURCE_ENCODER (and
>>    "intf" to "enc")
>> - Change dpu_encoder_get_num_phys to dpu_encoder_get_num_hw_intfs
>> - Add checks for setup_misr and collect_misr in
>>    dpu_encoder_get_num_hw_intfs
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 50 +++++++++++++++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  3 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 64 +++++++++++++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 22 +++++++
>>   4 files changed, 138 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 69a1257d3b6d..b4e8a4432796 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -79,6 +79,8 @@ static enum dpu_crtc_crc_source dpu_crtc_parse_crc_source(const char *src_name)
>>          if (!strcmp(src_name, "auto") ||
>>              !strcmp(src_name, "lm"))
>>                  return DPU_CRTC_CRC_SOURCE_LAYER_MIXER;
>> +       if (!strcmp(src_name, "enc"))
> 
> "encoder" unless you have any strong reason (like being compatible
> with other platforms).

Sure

> 
>> +               return DPU_CRTC_CRC_SOURCE_ENCODER;
>>
>>          return DPU_CRTC_CRC_SOURCE_INVALID;
>>   }
>> @@ -94,8 +96,16 @@ static int dpu_crtc_verify_crc_source(struct drm_crtc *crtc,
>>                  return -EINVAL;
>>          }
>>
>> -       if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
>> +       if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER) {
>>                  *values_cnt = crtc_state->num_mixers;
>> +       } else if (source == DPU_CRTC_CRC_SOURCE_ENCODER) {
>> +               struct drm_encoder *drm_enc;
>> +
>> +               *values_cnt = 0;
>> +
>> +               drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc->state->encoder_mask)
>> +                       *values_cnt += dpu_encoder_get_num_hw_intfs(drm_enc);
>> +       }
>>
>>          return 0;
>>   }
>> @@ -116,6 +126,14 @@ static void dpu_crtc_setup_lm_misr(struct dpu_crtc_state *crtc_state)
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
>> @@ -164,6 +182,8 @@ static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
>>
>>          if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
>>                  dpu_crtc_setup_lm_misr(crtc_state);
>> +       else if (source == DPU_CRTC_CRC_SOURCE_ENCODER)
>> +               dpu_crtc_setup_encoder_misr(crtc);
>>          else
>>                  ret = -EINVAL;
>>
>> @@ -212,6 +232,28 @@ static int dpu_crtc_get_lm_crc(struct drm_crtc *crtc,
>>                          drm_crtc_accurate_vblank_count(crtc), crcs);
>>   }
>>
>> +static int dpu_crtc_get_encoder_crc(struct drm_crtc *crtc, u32 *crcs)
>> +{
>> +       struct drm_encoder *drm_enc;
>> +       int rc, pos = 0;
>> +
> 
> Extra empty line.

Noted.

> 
>> +
>> +       drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc->state->encoder_mask) {
>> +               rc = dpu_encoder_get_crc(drm_enc, crcs, pos);
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
>> +                       drm_crtc_accurate_vblank_count(crtc), crcs);
>> +}
>> +
>>   static int dpu_crtc_get_crc(struct drm_crtc *crtc)
>>   {
>>          struct dpu_crtc_state *crtc_state = to_dpu_crtc_state(crtc->state);
>> @@ -226,6 +268,12 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc)
>>          if (crtc_state->crc_source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER) {
>>                  BUILD_BUG_ON(ARRAY_SIZE(crcs) < ARRAY_SIZE(crtc_state->mixers));
>>                  return dpu_crtc_get_lm_crc(crtc, crtc_state, crcs);
>> +       } else if (crtc_state->crc_source == DPU_CRTC_CRC_SOURCE_ENCODER) {
>> +               if (ARRAY_SIZE(crcs) < INTF_MAX)
>> +                       DPU_ERROR("crcs array of size %ld less than %d\n",
>> +                                       ARRAY_SIZE(crcs), INTF_MAX);
> 
> Ok. With the crcs array being local you don't have to preallocate it
> here and pass it as an argument.
> Just declare it in the dpu_crtc_get_encoder_crc(). Then you can
> allocate it as `u32 crcs[INTF_MAX]` and remove the check.
> 

Sure.

>> +
>> +               return dpu_crtc_get_encoder_crc(crtc, crcs);
>>          }
>>
>>          return 0;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
>> index aa897ec28ad3..b49cf8ae126f 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
>> @@ -1,5 +1,6 @@
>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>   /*
>> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
>>    * Copyright (c) 2015-2021 The Linux Foundation. All rights reserved.
>>    * Copyright (C) 2013 Red Hat
>>    * Author: Rob Clark <robdclark@gmail.com>
>> @@ -78,11 +79,13 @@ struct dpu_crtc_smmu_state_data {
>>    * enum dpu_crtc_crc_source: CRC source
>>    * @DPU_CRTC_CRC_SOURCE_NONE: no source set
>>    * @DPU_CRTC_CRC_SOURCE_LAYER_MIXER: CRC in layer mixer
>> + * @DPU_CRTC_CRC_SOURCE_ENCODER: CRC in encoder
>>    * @DPU_CRTC_CRC_SOURCE_INVALID: Invalid source
>>    */
>>   enum dpu_crtc_crc_source {
>>          DPU_CRTC_CRC_SOURCE_NONE = 0,
>>          DPU_CRTC_CRC_SOURCE_LAYER_MIXER,
>> +       DPU_CRTC_CRC_SOURCE_ENCODER,
>>          DPU_CRTC_CRC_SOURCE_MAX,
>>          DPU_CRTC_CRC_SOURCE_INVALID = -1
>>   };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 52516eb20cb8..a8f841180383 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -225,6 +225,70 @@ bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
>>          return dpu_enc->wide_bus_en;
>>   }
>>
>> +int dpu_encoder_get_num_hw_intfs(const struct drm_encoder *drm_enc)
> 
> dpu_encoder_get_crc_values_cnt(), please.

Sure

Thanks,

Jessica Zhang

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
>> +               if (phys->hw_intf && phys->hw_intf->ops.setup_misr
>> +                               && phys->hw_intf->ops.collect_misr)
>> +                       num_intf++;
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
>> +               rc = phys->hw_intf->ops.collect_misr(phys->hw_intf, &crcs[pos + entries_added]);
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
>> index 781d41c91994..749e0144d2de 100644
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
>> + * dpu_encoder_get_num_hw_intfs - get number of physical encoders contained
>> + *     in virtual encoder
>> + * @drm_enc:    Pointer to previously created drm encoder structure
>> + * Returns:     Number of physical encoders for given drm encoder
>> + */
>> +int dpu_encoder_get_num_hw_intfs(const struct drm_encoder *drm_enc);
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
