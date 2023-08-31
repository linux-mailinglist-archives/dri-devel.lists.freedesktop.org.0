Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6698978E3CE
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 02:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9705A10E63C;
	Thu, 31 Aug 2023 00:14:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B9010E63B
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 00:14:14 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-d71dd633f33so95181276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 17:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693440854; x=1694045654; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=D0pDWt1SD7esxzH2zdhQyj7VibwqVSChN3krVpzS/9U=;
 b=JQ8i0rH7oEpVc3mKx2JPvYOLB5zq2D3cjSZH4VH0T/0v69+m5J53UYbxOTBDAr16Mf
 gsAxESp1SYdV7xkr+M2TDueFVlLuRJWHj88PbjFKPE6PbqiuE6ZWnAZFQEkGZW/Upb0e
 X5RHbLTb4XPXkO6PzHutJcryzvew6vOlCh6mh85bw/a/FVDdJ4YrRHzr7JJzTZohxoFH
 9j2askWNX6gUdsDA06J9iRqVre5QushlXGlW7D+JI3o4wAewqTnPZGJ+wpfpoS0MWlk0
 3Mc/AgkI3T+5zhaXEdRo0NKLAc00/vcCUwet3uKvWJjlMo9wP+C/pyq4lpShD9i2HRw7
 8ZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693440854; x=1694045654;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D0pDWt1SD7esxzH2zdhQyj7VibwqVSChN3krVpzS/9U=;
 b=PiyxuWVrZ3Wh41wV4zsUDqMJUVi0OLDsgIjTZZdMIBNfBQ1UhbcTG9SRJnBOlSzY6V
 wYKfRSDzLOjq8uOyVLdA8bHQLtdCjRpm5uAtuz9i0XlRKFmNtXj7MN29y18P5PqEn3F6
 p9Y/bhL4xtJMVX9IznvEQlrSqOXahAZO39su8qfWYZ9jATCBCTFYy3DZCU8cOJB6JZNR
 8BXU8jPChaEQccl/pPiBamKaKVkP/cOfDdrRIlm3CjfRsF+xF0sqTzTjJw93qHAIm/5v
 01CxX8Bbcjol8QTNTOTnBtS2hTKxxGRzmhqa+HcEzyMqG4GN7ZaMdjrXJSZecwuVdaNu
 ZVQQ==
X-Gm-Message-State: AOJu0YyQO3DWhHmgnQZeJ12OBtTBMdIb7Lr+7BFIZ3EkipxsliqKO6g2
 MThuuLWdo2SNfwHU0oSnAC9TQzrV4SRERIxkY33mWg==
X-Google-Smtp-Source: AGHT+IGjdg7tdadLV979AxMh54I/iLzF7k+QaRxwagpvUswfd7y+PPMFv8JDlUgmVjXJDF1nrooGR2Tl0iBl51S6ohs=
X-Received: by 2002:a05:6902:562:b0:d15:e204:a7be with SMTP id
 a2-20020a056902056200b00d15e204a7bemr3876141ybt.8.1693440853738; Wed, 30 Aug
 2023 17:14:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-11-quic_abhinavk@quicinc.com>
In-Reply-To: <20230830224910.8091-11-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Aug 2023 03:14:02 +0300
Message-ID: <CAA8EJpoUDjTEytGnx0NUKD_grY=azoXgm_sqwNBJVTD7LwCe0g@mail.gmail.com>
Subject: Re: [PATCH 10/16] drm/msm/dpu: add support to disable CDM block
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
 quic_khsieh@quicinc.com, quic_parellan@quicinc.com, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> In preparation of setting up CDM block, add the logic to disable it
> properly during encoder cleanup.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 8 ++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h | 2 ++
>  2 files changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 582680804016..1b1e07292a9e 100644
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
> @@ -2097,6 +2098,13 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>                                         phys_enc->hw_pp->merge_3d->idx);
>         }
>
> +       if (phys_enc->hw_cdm && phys_enc->hw_cdm->ops.bind_pingpong_blk && phys_enc->hw_pp) {
> +               phys_enc->hw_cdm->ops.bind_pingpong_blk(phys_enc->hw_cdm,
> +                                                       false, phys_enc->hw_pp->idx);

But it was already bound in the cdm->enable, wasn't it?

Also the update_pending_flush_cdm should be called even for DPU < 5.0,
where there should be no bind_pingpong_blk callback.

> +               if (phys_enc->hw_ctl->ops.update_pending_flush_cdm)
> +                       phys_enc->hw_ctl->ops.update_pending_flush_cdm(phys_enc->hw_ctl);
> +       }
> +
>         if (dpu_enc->dsc) {
>                 dpu_encoder_unprep_dsc(dpu_enc);
>                 dpu_enc->dsc = NULL;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index 24dbc28be4f8..510c1c41ddbc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -150,6 +150,7 @@ enum dpu_intr_idx {
>   * @hw_pp:             Hardware interface to the ping pong registers
>   * @hw_intf:           Hardware interface to the intf registers
>   * @hw_wb:             Hardware interface to the wb registers
> + * @hw_cdm:            Hardware interface to the CDM registers
>   * @dpu_kms:           Pointer to the dpu_kms top level
>   * @cached_mode:       DRM mode cached at mode_set time, acted on in enable
>   * @enabled:           Whether the encoder has enabled and running a mode
> @@ -178,6 +179,7 @@ struct dpu_encoder_phys {
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
