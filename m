Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7EC96C694
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 20:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1137210E836;
	Wed,  4 Sep 2024 18:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dqBYCrhL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0210B10E838
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 18:41:35 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-6d47d860fc4so42722147b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2024 11:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725475294; x=1726080094; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1UsoRD5I9/OcwpVT0l8HcbEMWglcM4WiU2VwW1FbqqA=;
 b=dqBYCrhL44agdUapuwgdqmfnIvFCqOgqRxDJoncCfQFz9oznnBHDKVALYzLgS80QoT
 WsmK0d4i62osc/J9C9+v59dxKavJFcg2/OvwFfTePdtZJZ/tFQIPyGUcUGJ5QBJXc5i/
 AUtYiWE4VL1Beoohvei6prOPoNkoeGRR8kaARL5wrIsJOWa+qq3sQHTmlJFfQX2n6ses
 l6l+lxgNXkwyutenag34pLwPAffea1LsNigMXURPoWBnJm8wrA+e94Hr7TTS2Z+QbsRn
 PqmjFQhzFjTPVTvcmi3KeOUKT1MW5Gu7dA4RCxrfHc+vfuIXP07GC/GfWxhLuq34BWht
 k11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725475294; x=1726080094;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1UsoRD5I9/OcwpVT0l8HcbEMWglcM4WiU2VwW1FbqqA=;
 b=uKhxgU1ocr9fJ1pCcGm7+ErmaEQRbsFZJutZqTHJWoScWz7+20zBqfs4bqYgwWO5tb
 2mJ4i20+PUXf4d+XI5XnZC4Mtlw8EgJt+B7MimNN+p/NzyEDwM3DycnjsUhJ9jFaqz94
 z3lGk6iXmNYKf1wC8cAIHhQFCCoG6xtPVEvzL9ee91F93EgaPqPnl25Cf85fzzXGzRlk
 iCO9uIBBtHpr3c+ue2tDuR1GKtibbbw8iv72R2X0K6hWoZVXOENVC9O4EaSIl0zRadWj
 8463G2iKMuAlYywfy9y7BG/u3XabYa4GDwOBiUdE3pey2OHDz9Cx1qHVTGD4R1FTlPzd
 Nn9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvo5mOkJlRxnw/5u2gv+DBYCa/NXqKMbk2hxsHoFmXs3YKvkwsPh5KohVkjHHH/N5g6FBbyE/TCmI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNH7v3CApuUo6VeigoHRzlvX2DE4qz2ESGoFGwCtUEMVAiQftS
 IBmuYUvQTJ2AipK7NcdI2mHRjOiKcbSQWPQs1k2clDhgaikDyjNZzchd4iW4FgKcyhLyGgWoyCt
 5W0Y95vb0OMKgH8thG2hXo0DWlbReNcH5nWGKIA==
X-Google-Smtp-Source: AGHT+IFuskZq0UGQgmP4DjibP7i7FiVBXXGXy1UOcoBhtUO9qeXXooabJvPQYAhjWsZh98zkVqcHlTvpZ2+ncq2R+jo=
X-Received: by 2002:a05:690c:f0a:b0:6ae:1e27:c993 with SMTP id
 00721157ae682-6d652cc6539mr149253317b3.7.1725475293727; Wed, 04 Sep 2024
 11:41:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-7-502b16ae2ebb@quicinc.com>
 <uqtlpynjdszqyyikj64uxwuqnk3lmzma7kd2vwxipnj4fg2eje@7toj5kww7vk7>
 <9f95704d-0699-4b11-b8cb-40f1a57eeebd@quicinc.com>
In-Reply-To: <9f95704d-0699-4b11-b8cb-40f1a57eeebd@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 4 Sep 2024 21:41:23 +0300
Message-ID: <CAA8EJpqM0QBxLFCx22UuVmYAE258im_Up2-3fu6qez1GrOhOQg@mail.gmail.com>
Subject: Re: [PATCH 07/21] drm/msm/dpu: Check CRTC encoders are valid clones
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

On Wed, 4 Sept 2024 at 01:18, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
>
>
> On 8/30/2024 10:00 AM, Dmitry Baryshkov wrote:
> > On Thu, Aug 29, 2024 at 01:48:28PM GMT, Jessica Zhang wrote:
> >> Check that each encoder in the CRTC state's encoder_mask is marked as a
> >> possible clone for all other encoders in the encoder_mask and that only
> >> one CRTC is in clone mode at a time
> >>
> >> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 36 +++++++++++++++++++++++++++++++-
> >>   1 file changed, 35 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> index 5ec1b5a38922..bebae365c036 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> @@ -1,6 +1,6 @@
> >>   // SPDX-License-Identifier: GPL-2.0-only
> >>   /*
> >> - * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> >> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> >>    * Copyright (c) 2014-2021 The Linux Foundation. All rights reserved.
> >>    * Copyright (C) 2013 Red Hat
> >>    * Author: Rob Clark <robdclark@gmail.com>
> >> @@ -1204,6 +1204,36 @@ static struct msm_display_topology dpu_crtc_get_topology(
> >>      return topology;
> >>   }
> >>
> >> +static bool dpu_crtc_has_valid_clones(struct drm_crtc *crtc,
> >> +            struct drm_crtc_state *crtc_state)
> >> +{
> >> +    struct drm_encoder *drm_enc;
> >> +    struct drm_crtc *temp_crtc;
> >> +    int num_cwb_sessions = 0;
> >> +
> >> +    drm_for_each_crtc(temp_crtc, crtc->dev)
> >> +            if (drm_crtc_in_clone_mode(temp_crtc->state))
> >
> > No, get the state from drm_atomic_state. temp_crtc->state might be
> > irrelevant.
>
> Hi Dmitry,
>
> Ack.
>
> >
> >> +                    num_cwb_sessions++;
> >
> > Even simpler:
> > if (temp_crtc != crtc && drm_crtc_in_clone_mode(...))
> >       return false;
>
> Ack.
>
> >
> >> +
> >> +    /*
> >> +     * Only support a single concurrent writeback session running
> >> +     * at a time
> >
> > If it is not a hardware limitation, please add:
> > FIXME: support more than one session
>
> This is a hardware limitation.
>
> >
> >> +     */
> >> +    if (num_cwb_sessions > 1)
> >> +            return false;
> >> +
> >> +    drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask) {
> >> +            if ((crtc_state->encoder_mask & drm_enc->possible_clones) !=
> >> +                            crtc_state->encoder_mask) {
> >
> > Align to opening bracket, please. Granted that other drivers don't
> > perform this check, is it really necessary? Doesn't
> > validate_encoder_possible_clones() ensure the same, but during the
> > encoder registration?
>
> The difference here is that validate_encoder_possible_clones() is only
> called when the drm device is initially registered.
>
> The check here is to make sure that the encoders userspace is proposing
> to be cloned are actually possible clones of each other. This might not
> be necessary for drivers where all encoders are all possible clones of
> each other. But for MSM (and CWB), real-time display encoders can only
> be clones of writeback (and vice versa).

I had the feeling that encoder_mask should already take care of that,
but it seems I was wrong.
Please extract this piece as a generic helper. I think it should be
called from the generic atomic_check() codepath.




--
With best wishes
Dmitry
