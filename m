Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE999966C51
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2024 00:27:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31E9E10EB05;
	Fri, 30 Aug 2024 22:27:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dj6mvhpq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F25A010EB05
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 22:27:24 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-6b4412fac76so20192367b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 15:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725056844; x=1725661644; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=s2YyHYQPYgxsMsPEBmOViYLSp8VfKsvDm7dsGMy40Fw=;
 b=dj6mvhpqKebmltlB5iU8lM1UsfLZs/wk1I6voqG27K/ttflgb1kouNHhthfY9GDO7h
 22EAPvHtSo5I/2llXjE+6bwa77QB6GHrnCdBLa+VtWNNMaVO178HmV9N3HZelElez6t4
 jjKH3ezdXIl2BKZwhtDyc7BxtRBLfv0hDfKGqIOSt1AOmZ2X3LZMrDVLncIc3dEjqqyL
 Vi0GvYwK3ZeyxO/3cq9uNP0fPet1+hd2wIzDdBsrHZFERnNVmRsbLEkBwyxR742QGieP
 jdf0Rl6qwM9VgATURqEOj+bZdAzOi5lnHQeb4N79Pz88dgjli3fXCq+bou/8T4FI1Sp8
 NZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725056844; x=1725661644;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s2YyHYQPYgxsMsPEBmOViYLSp8VfKsvDm7dsGMy40Fw=;
 b=W35AyHjI5LDb6X+zCCmK4Vo1OSrl3ZF4MLL5U96jBwWd8m82FU4JgZOnwKmaRAb8cI
 PlE/bF3dsCxHlHHPW8lBF1QxkSkhjKNbZSV8e754QVTSbbIUnm6nTH0OGw/avat2WmdL
 2VBIcbmuDxqkZHgHj+6IPlpaha9bQGNYppe6RIZzsTPUT2meQhnHjNReWDaHH/uCF6x3
 Af5mieKVBgiy1xhytw0G/fIY8cEGeecN8f+iPTjcP7uX6lTHCrYbIbUWs4DeXvdw7k5P
 zZROzZH6SsHmLBxObP2CWTEai3G63NuRwtdlpacNrveCiTincwVVo90A7Mc3bTNsc79+
 yVpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkS16ME6uvJxfxUVaN4N5uYRhKtHPRLze3tFhuFhDQE6o8MYTW+LCz6R4U7AdpkiUvGw3kc/Y3CkU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNL5+wuMztr+SMWCBTN9do18LOZKUJpoEtiXjLChjcviEUyeLs
 /Ie6ED92yDBsBg2g0b6VIFH58d16scInFLdQ0rWompqWpGFO3CZIWqY0xIuDF3Mh4VklmnXcliq
 j9gyX03YpgMoAm3aetgCzovrMl6AZcDVQqx1r5Q==
X-Google-Smtp-Source: AGHT+IG5eeD0svxWOfKQwLe6u0kOlsZgvlnrOv/bBgjzxMzWKdezSyNigVWnbhK/aYuDYPPFgPzzOaztniLlErcg8Yk=
X-Received: by 2002:a05:690c:dc1:b0:643:92a8:ba00 with SMTP id
 00721157ae682-6d40b0f7ea3mr46607747b3.0.1725056843655; Fri, 30 Aug 2024
 15:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-14-502b16ae2ebb@quicinc.com>
 <yohtzxysheoybac24hxil6zzzsqi4inx6oh6x7vaoj5lvtdf3u@vd5nax37ilqd>
 <a73def5c-46f6-4467-958d-20f28ce8ad2c@quicinc.com>
In-Reply-To: <a73def5c-46f6-4467-958d-20f28ce8ad2c@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 31 Aug 2024 01:27:12 +0300
Message-ID: <CAA8EJppTqdCvaxBwretFVM6wV-NOLpxNGJCyxO8EXvvqZXF=sw@mail.gmail.com>
Subject: Re: [PATCH 14/21] drm/msm/dpu: Reserve resources for CWB
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Rob Clark <robdclark@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 30 Aug 2024 at 23:28, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> On 8/30/2024 10:25 AM, Dmitry Baryshkov wrote:
> > On Thu, Aug 29, 2024 at 01:48:35PM GMT, Jessica Zhang wrote:
> >> Reserve dedicated pingpong blocks for CWB
> >
> > Please explain design ideas. Having just a single phrase is usually not
> > enough.
> >
> >>
> >> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 17 ++++++--
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 65 +++++++++++++++++++++++++++++
> >>   3 files changed, 79 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> index 36b677cf9c7a..f1bd14d1f89e 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> @@ -2,7 +2,7 @@
> >>   /*
> >>    * Copyright (C) 2013 Red Hat
> >>    * Copyright (c) 2014-2018, 2020-2021 The Linux Foundation. All rights reserved.
> >> - * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> >> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> >>    *
> >>    * Author: Rob Clark <robdclark@gmail.com>
> >>    */
> >> @@ -1054,6 +1054,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >>      struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> >>      struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> >>      int num_pp, num_dsc;
> >> +    bool is_cwb_encoder;
> >>      unsigned int dsc_mask = 0;
> >>      int i;
> >>
> >> @@ -1067,6 +1068,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >>
> >>      priv = drm_enc->dev->dev_private;
> >>      dpu_kms = to_dpu_kms(priv->kms);
> >> +    is_cwb_encoder = drm_crtc_in_clone_mode(crtc_state) &&
> >> +            dpu_enc->disp_info.intf_type == INTF_WB;
> >>
> >>      global_state = dpu_kms_get_existing_global_state(dpu_kms);
> >>      if (IS_ERR_OR_NULL(global_state)) {
> >> @@ -1077,9 +1080,15 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >>      trace_dpu_enc_mode_set(DRMID(drm_enc));
> >>
> >>      /* Query resource that have been reserved in atomic check step. */
> >> -    num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >> -            drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
> >> -            ARRAY_SIZE(hw_pp));
> >> +    if (is_cwb_encoder)
> >> +            num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >> +                    drm_enc->crtc, DPU_HW_BLK_DCWB_PINGPONG, hw_pp,
> >> +                    ARRAY_SIZE(hw_pp));
> >> +    else
> >> +            num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >> +                    drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
> >> +                    ARRAY_SIZE(hw_pp));
> >
> > Why is this necessary? Can we still use DPU_HW_BLK_PINGPONG?
>
> Hi Dmitry,
>
> Since both regular non-cwb pingpongs and pingpongs dedicated for cwb
> both share the same pingpong_to_crtc_id map, I need a way to distinguish
> between the real-time and dedicated cwb pingpongs.
>
> If I don't do that, get_assigned_resources would populate the hw_pp
> array for both the real-time and WB encoders with *only* the real-time
> display pingpongs.

I see. It looks like PINGPONG blocks should be allocated / filled
per-encoder, not per-CRTC. Likewise CDM is encoder-specific, not
CRTC-specific.
Does that solve the issue?

>
> >
> >> +
> >>      dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >>                      drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >> index c43cb55fe1d2..c87790a1b940 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >> @@ -77,6 +77,7 @@ enum dpu_hw_blk_type {
> >>      DPU_HW_BLK_LM,
> >>      DPU_HW_BLK_CTL,
> >>      DPU_HW_BLK_PINGPONG,
> >> +    DPU_HW_BLK_DCWB_PINGPONG,
> >>      DPU_HW_BLK_INTF,
> >>      DPU_HW_BLK_WB,
> >>      DPU_HW_BLK_DSPP,
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >> index 13f84375e15d..afad26556cd5 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >> @@ -236,6 +236,48 @@ static int _dpu_rm_get_lm_peer(struct dpu_rm *rm, int primary_idx)
> >>      return -EINVAL;
> >>   }
> >>
> >> +static int _dpu_rm_reserve_cwb_pingpong(struct dpu_rm *rm,
> >> +            struct dpu_global_state *global_state, uint32_t crtc_id,
> >> +            struct msm_display_topology *topology)
> >> +{
> >> +    int num_cwb_pp = topology->num_lm, cwb_pp_count = 0;
> >> +    int cwb_pp_idx[MAX_BLOCKS];
> >> +
> >> +    /*
> >> +     * Reserve additional dedicated CWB pingpong blocks for each mixer
> >> +     *
> >> +     * TODO: add support for reserving non-dedicated CWB pingpong blocks
> >> +     */
> >> +    for (int i = 0; i < ARRAY_SIZE(rm->mixer_blks) &&
> >> +                    cwb_pp_count < num_cwb_pp; i++) {
> >> +            for (int j = PINGPONG_CWB_0 - PINGPONG_0;
> >> +                            j < ARRAY_SIZE(rm->pingpong_blks); j++) {
> >
> > Alignment...
>
> Ack -- for future reference, should I always align the second line with
> the bracket of the previous line?
>
> I thought the general guideline was 2 tabs, but I might be misremembering.

I can't find the textual reference, however .clang-format in the root
dir has 'AlignAfterOpenBracket: Align'. I'm more or less ignorant for
the function argument alignment (especially if an old function is
being modified), but aligning the conditions and loops makes it easier
to read the code.

>
> Thanks,
>
> Jessica Zhang
>
> >
> >> +                    /*
> >> +                     * Odd LMs must be assigned to odd pingpongs and even
> >> +                     * LMs with even pingpongs
> >> +                     */
> >> +                    if (reserved_by_other(global_state->pingpong_to_crtc_id,
> >> +                                            j, crtc_id) ||
> >> +                                    i % 2 != j % 2)
> >> +                            continue;
> >> +
> >> +                    cwb_pp_idx[cwb_pp_count] = j;
> >> +                    cwb_pp_count++;
> >> +                    break;
> >> +            }
> >> +    }
> >> +
> >> +    if (cwb_pp_count != num_cwb_pp) {
> >> +            DPU_ERROR("Unable to reserve all cwb pingpongs\n");
> >> +            return -ENAVAIL;
> >> +    }
> >> +
> >> +    for (int i = 0; i < cwb_pp_count; i++)
> >> +            global_state->pingpong_to_crtc_id[cwb_pp_idx[i]] = crtc_id;
> >> +
> >> +    return 0;
> >> +}
> >> +
> >>   /**
> >>    * _dpu_rm_check_lm_and_get_connected_blks - check if proposed layer mixer meets
> >>    * proposed use case requirements, incl. hardwired dependent blocks like
> >> @@ -617,6 +659,14 @@ static int _dpu_rm_make_reservation(
> >>              return ret;
> >>      }
> >>
> >> +    if (topology->cwb_enabled) {
> >> +            ret = _dpu_rm_reserve_cwb_pingpong(rm, global_state,
> >> +                            crtc_id, topology);
> >> +            if (ret) {
> >> +                    DPU_ERROR("unable to find appropriate dcwb pingpongs\n");
> >> +                    return ret;
> >> +            }
> >> +    }
> >>
> >>      ret = _dpu_rm_reserve_ctls(rm, global_state, crtc_id,
> >>                      topology);
> >> @@ -706,6 +756,7 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
> >>
> >>      switch (type) {
> >>      case DPU_HW_BLK_PINGPONG:
> >> +    case DPU_HW_BLK_DCWB_PINGPONG:
> >>              hw_blks = rm->pingpong_blks;
> >>              hw_to_crtc_id = global_state->pingpong_to_crtc_id;
> >>              max_blks = ARRAY_SIZE(rm->pingpong_blks);
> >> @@ -745,6 +796,20 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
> >>              if (hw_to_crtc_id[i] != crtc_id)
> >>                      continue;
> >>
> >> +            if (type == DPU_HW_BLK_PINGPONG) {
> >> +                    struct dpu_hw_pingpong *pp = to_dpu_hw_pingpong(hw_blks[i]);
> >> +
> >> +                    if (pp->idx >= PINGPONG_CWB_0)
> >> +                            continue;
> >> +            }
> >> +
> >> +            if (type == DPU_HW_BLK_DCWB_PINGPONG) {
> >> +                    struct dpu_hw_pingpong *pp = to_dpu_hw_pingpong(hw_blks[i]);
> >> +
> >> +                    if (pp->idx < PINGPONG_CWB_0)
> >> +                            continue;
> >> +            }
> >> +
> >>              if (num_blks == blks_size) {
> >>                      DPU_ERROR("More than %d resources assigned to crtc %d\n",
> >>                                blks_size, crtc_id);
> >>
> >> --
> >> 2.34.1
> >>
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry

On Fri, 30 Aug 2024 at 23:28, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
>
>
> On 8/30/2024 10:25 AM, Dmitry Baryshkov wrote:
> > On Thu, Aug 29, 2024 at 01:48:35PM GMT, Jessica Zhang wrote:
> >> Reserve dedicated pingpong blocks for CWB
> >
> > Please explain design ideas. Having just a single phrase is usually not
> > enough.
> >
> >>
> >> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 17 ++++++--
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 65 +++++++++++++++++++++++++++++
> >>   3 files changed, 79 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> index 36b677cf9c7a..f1bd14d1f89e 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> @@ -2,7 +2,7 @@
> >>   /*
> >>    * Copyright (C) 2013 Red Hat
> >>    * Copyright (c) 2014-2018, 2020-2021 The Linux Foundation. All rights reserved.
> >> - * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> >> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> >>    *
> >>    * Author: Rob Clark <robdclark@gmail.com>
> >>    */
> >> @@ -1054,6 +1054,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >>      struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> >>      struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> >>      int num_pp, num_dsc;
> >> +    bool is_cwb_encoder;
> >>      unsigned int dsc_mask = 0;
> >>      int i;
> >>
> >> @@ -1067,6 +1068,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >>
> >>      priv = drm_enc->dev->dev_private;
> >>      dpu_kms = to_dpu_kms(priv->kms);
> >> +    is_cwb_encoder = drm_crtc_in_clone_mode(crtc_state) &&
> >> +            dpu_enc->disp_info.intf_type == INTF_WB;
> >>
> >>      global_state = dpu_kms_get_existing_global_state(dpu_kms);
> >>      if (IS_ERR_OR_NULL(global_state)) {
> >> @@ -1077,9 +1080,15 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >>      trace_dpu_enc_mode_set(DRMID(drm_enc));
> >>
> >>      /* Query resource that have been reserved in atomic check step. */
> >> -    num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >> -            drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
> >> -            ARRAY_SIZE(hw_pp));
> >> +    if (is_cwb_encoder)
> >> +            num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >> +                    drm_enc->crtc, DPU_HW_BLK_DCWB_PINGPONG, hw_pp,
> >> +                    ARRAY_SIZE(hw_pp));
> >> +    else
> >> +            num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >> +                    drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
> >> +                    ARRAY_SIZE(hw_pp));
> >
> > Why is this necessary? Can we still use DPU_HW_BLK_PINGPONG?
>
> Hi Dmitry,
>
> Since both regular non-cwb pingpongs and pingpongs dedicated for cwb
> both share the same pingpong_to_crtc_id map, I need a way to distinguish
> between the real-time and dedicated cwb pingpongs.
>
> If I don't do that, get_assigned_resources would populate the hw_pp
> array for both the real-time and WB encoders with *only* the real-time
> display pingpongs.
>
> >
> >> +
> >>      dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >>                      drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >> index c43cb55fe1d2..c87790a1b940 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >> @@ -77,6 +77,7 @@ enum dpu_hw_blk_type {
> >>      DPU_HW_BLK_LM,
> >>      DPU_HW_BLK_CTL,
> >>      DPU_HW_BLK_PINGPONG,
> >> +    DPU_HW_BLK_DCWB_PINGPONG,
> >>      DPU_HW_BLK_INTF,
> >>      DPU_HW_BLK_WB,
> >>      DPU_HW_BLK_DSPP,
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >> index 13f84375e15d..afad26556cd5 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >> @@ -236,6 +236,48 @@ static int _dpu_rm_get_lm_peer(struct dpu_rm *rm, int primary_idx)
> >>      return -EINVAL;
> >>   }
> >>
> >> +static int _dpu_rm_reserve_cwb_pingpong(struct dpu_rm *rm,
> >> +            struct dpu_global_state *global_state, uint32_t crtc_id,
> >> +            struct msm_display_topology *topology)
> >> +{
> >> +    int num_cwb_pp = topology->num_lm, cwb_pp_count = 0;
> >> +    int cwb_pp_idx[MAX_BLOCKS];
> >> +
> >> +    /*
> >> +     * Reserve additional dedicated CWB pingpong blocks for each mixer
> >> +     *
> >> +     * TODO: add support for reserving non-dedicated CWB pingpong blocks
> >> +     */
> >> +    for (int i = 0; i < ARRAY_SIZE(rm->mixer_blks) &&
> >> +                    cwb_pp_count < num_cwb_pp; i++) {
> >> +            for (int j = PINGPONG_CWB_0 - PINGPONG_0;
> >> +                            j < ARRAY_SIZE(rm->pingpong_blks); j++) {
> >
> > Alignment...
>
> Ack -- for future reference, should I always align the second line with
> the bracket of the previous line?
>
> I thought the general guideline was 2 tabs, but I might be misremembering.
>
> Thanks,
>
> Jessica Zhang
>
> >
> >> +                    /*
> >> +                     * Odd LMs must be assigned to odd pingpongs and even
> >> +                     * LMs with even pingpongs
> >> +                     */
> >> +                    if (reserved_by_other(global_state->pingpong_to_crtc_id,
> >> +                                            j, crtc_id) ||
> >> +                                    i % 2 != j % 2)
> >> +                            continue;
> >> +
> >> +                    cwb_pp_idx[cwb_pp_count] = j;
> >> +                    cwb_pp_count++;
> >> +                    break;
> >> +            }
> >> +    }
> >> +
> >> +    if (cwb_pp_count != num_cwb_pp) {
> >> +            DPU_ERROR("Unable to reserve all cwb pingpongs\n");
> >> +            return -ENAVAIL;
> >> +    }
> >> +
> >> +    for (int i = 0; i < cwb_pp_count; i++)
> >> +            global_state->pingpong_to_crtc_id[cwb_pp_idx[i]] = crtc_id;
> >> +
> >> +    return 0;
> >> +}
> >> +
> >>   /**
> >>    * _dpu_rm_check_lm_and_get_connected_blks - check if proposed layer mixer meets
> >>    * proposed use case requirements, incl. hardwired dependent blocks like
> >> @@ -617,6 +659,14 @@ static int _dpu_rm_make_reservation(
> >>              return ret;
> >>      }
> >>
> >> +    if (topology->cwb_enabled) {
> >> +            ret = _dpu_rm_reserve_cwb_pingpong(rm, global_state,
> >> +                            crtc_id, topology);
> >> +            if (ret) {
> >> +                    DPU_ERROR("unable to find appropriate dcwb pingpongs\n");
> >> +                    return ret;
> >> +            }
> >> +    }
> >>
> >>      ret = _dpu_rm_reserve_ctls(rm, global_state, crtc_id,
> >>                      topology);
> >> @@ -706,6 +756,7 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
> >>
> >>      switch (type) {
> >>      case DPU_HW_BLK_PINGPONG:
> >> +    case DPU_HW_BLK_DCWB_PINGPONG:
> >>              hw_blks = rm->pingpong_blks;
> >>              hw_to_crtc_id = global_state->pingpong_to_crtc_id;
> >>              max_blks = ARRAY_SIZE(rm->pingpong_blks);
> >> @@ -745,6 +796,20 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
> >>              if (hw_to_crtc_id[i] != crtc_id)
> >>                      continue;
> >>
> >> +            if (type == DPU_HW_BLK_PINGPONG) {
> >> +                    struct dpu_hw_pingpong *pp = to_dpu_hw_pingpong(hw_blks[i]);
> >> +
> >> +                    if (pp->idx >= PINGPONG_CWB_0)
> >> +                            continue;
> >> +            }
> >> +
> >> +            if (type == DPU_HW_BLK_DCWB_PINGPONG) {
> >> +                    struct dpu_hw_pingpong *pp = to_dpu_hw_pingpong(hw_blks[i]);
> >> +
> >> +                    if (pp->idx < PINGPONG_CWB_0)
> >> +                            continue;
> >> +            }
> >> +
> >>              if (num_blks == blks_size) {
> >>                      DPU_ERROR("More than %d resources assigned to crtc %d\n",
> >>                                blks_size, crtc_id);
> >>
> >> --
> >> 2.34.1
> >>
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry
