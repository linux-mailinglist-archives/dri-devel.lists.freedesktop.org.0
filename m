Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2D780A25C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 12:36:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2065210EA75;
	Fri,  8 Dec 2023 11:36:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F58D10EA75
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 11:36:37 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-5d6b9143782so17189467b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 03:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702035396; x=1702640196; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9vphCG37O8eMkMC8HIffZ3tk8WXWBglaXiyl76vCMdg=;
 b=MzjMlwD7o7iqjSL9Qeh77SapYI5s6EzZw3QAvrglrpINHMM6khI6g0PBr7UMYLB7UM
 g+U7QkOBNqDUYJWXY++Dh5rJ2Cj/0cBR+sksyRgvK7MY3uKWnfP/bZmmEsyj2sWczQ/i
 HglCMAr8sOCc05ktyY1UOFhjx2FUQCOzcG90BnYvHOPNkud5wZgC5kqwnZdflgk5eKJC
 O/ehw2mobn8emeePG4oqCIJ0RUOVDIQ+gJJ/pc5Ev88dXQ8Ck1jCk6lorpA8prQdmQy/
 iN2cFl4OeZ2EGKtzIYRER1EXfzAqI/UsE37mzEhIl84d4EyBh2lahbAy++lsoyDNI8g8
 88lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702035396; x=1702640196;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9vphCG37O8eMkMC8HIffZ3tk8WXWBglaXiyl76vCMdg=;
 b=IrLPFFPhHrCMYElM6VvkDpdwhpY9SpRCrcrcO0PbCOhmMDws9xpymC8kDNNZ3Ukb2k
 NZnKlEIRV+ISC60xFEVeU6cpaDseNyoaRMYbNDZy2Fg/yQL8UCpfXJVgkAMQ5C2Mojak
 I8/G8e+y7iV4ynCZGrDCCO8BQzDOBfE2jAoxRKAeoE43KwadWE1adrQ70vOZ+WMEmLFU
 waL3c85mRjtLYzAauu1mmBu0xAvNd3pfdzOhpatVISyJwrEB+TmxQ4buCvC9GCAIYPIc
 aLXHUZC5JWpWBBT/WspH3ypZ+bs18kJlI1Fn+kd7iFV82Xu5wBxNpyae9uWtmckY1Zty
 3OTQ==
X-Gm-Message-State: AOJu0YyKMkBnrD19Y2SrTz0YMRtKDhXYiDaqiVZMKmuBXCYF/SEdEuJv
 yMWbE6QLOA8dek0hkOyn9QZR0K8LRxZEhblFBhmYOA==
X-Google-Smtp-Source: AGHT+IGNbm4h8qNGjXg60DMzqF5TvBlaPsJbNi3hCXSZ1UuSvxxiPwgPotz2EPuscLJPFJRKdrmJugMk2E/Rs8uOkp4=
X-Received: by 2002:a0d:ea0b:0:b0:5d7:1940:7d79 with SMTP id
 t11-20020a0dea0b000000b005d719407d79mr3847704ywe.80.1702035396669; Fri, 08
 Dec 2023 03:36:36 -0800 (PST)
MIME-Version: 1.0
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
 <20231208050641.32582-12-quic_abhinavk@quicinc.com>
In-Reply-To: <20231208050641.32582-12-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 13:36:25 +0200
Message-ID: <CAA8EJpo6=5mq8zCoBvdr73TsEFH96JS-mUo3Ks9go4VjBCm8uA@mail.gmail.com>
Subject: Re: [PATCH v2 11/16] drm/msm/dpu: add support to disable CDM block
 during encoder cleanup
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_parellan@quicinc.com, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> In preparation of setting up CDM block, add the logic to disable it
> properly during encoder cleanup.
>
> changes in v2:
>         - call update_pending_flush_cdm even when bind_pingpong_blk
>           is not present
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 10 ++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 ++
>  2 files changed, 12 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Minor nit below

>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index aa1a1646b322..862912727925 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -26,6 +26,7 @@
>  #include "dpu_hw_dspp.h"
>  #include "dpu_hw_dsc.h"
>  #include "dpu_hw_merge3d.h"
> +#include "dpu_hw_cdm.h"
>  #include "dpu_formats.h"
>  #include "dpu_encoder_phys.h"
>  #include "dpu_crtc.h"
> @@ -2050,6 +2051,15 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>                                         phys_enc->hw_pp->merge_3d->idx);
>         }
>
> +       if (phys_enc->hw_cdm) {
> +               if (phys_enc->hw_cdm->ops.bind_pingpong_blk && phys_enc->hw_pp)
> +                       phys_enc->hw_cdm->ops.bind_pingpong_blk(phys_enc->hw_cdm,
> +                                                               false, phys_enc->hw_pp->idx);

PINGPONG_NONE

> +               if (phys_enc->hw_ctl->ops.update_pending_flush_cdm)
> +                       phys_enc->hw_ctl->ops.update_pending_flush_cdm(phys_enc->hw_ctl,
> +                                                                      phys_enc->hw_cdm->idx);
> +       }
> +
>         if (dpu_enc->dsc) {
>                 dpu_encoder_unprep_dsc(dpu_enc);
>                 dpu_enc->dsc = NULL;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index b6b48e2c63ef..410f6225789c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -151,6 +151,7 @@ enum dpu_intr_idx {
>   * @hw_pp:             Hardware interface to the ping pong registers
>   * @hw_intf:           Hardware interface to the intf registers
>   * @hw_wb:             Hardware interface to the wb registers
> + * @hw_cdm:            Hardware interface to the CDM registers
>   * @dpu_kms:           Pointer to the dpu_kms top level
>   * @cached_mode:       DRM mode cached at mode_set time, acted on in enable
>   * @enabled:           Whether the encoder has enabled and running a mode
> @@ -179,6 +180,7 @@ struct dpu_encoder_phys {
>         struct dpu_hw_pingpong *hw_pp;
>         struct dpu_hw_intf *hw_intf;
>         struct dpu_hw_wb *hw_wb;
> +       struct dpu_hw_cdm *hw_cdm;
>         struct dpu_kms *dpu_kms;
>         struct drm_display_mode cached_mode;
>         enum dpu_enc_split_role split_role;
> --
> 2.40.1
>


-- 
With best wishes
Dmitry
