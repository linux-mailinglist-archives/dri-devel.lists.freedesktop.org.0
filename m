Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF476A28229
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 03:50:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3F810E17B;
	Wed,  5 Feb 2025 02:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AL5t/26/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551AB10E71C
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 02:48:28 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-304e4562516so4004111fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2025 18:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738723706; x=1739328506; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KORfQaUKPciCl0b2CXyUX6rgFXA9enZCrhKR40wbesU=;
 b=AL5t/26/jbun5y21siiRId98EQ9kpDvtp7KqQlLsNmQt3gGn+uzHUNsuu5AMDgnVSy
 XmGGc1ZaZxn8NisnEYeZV9DZv2gUhqsRZc/NaeuKwYb/7U73nKrNB2QXOYvAyKswG8i/
 PA81zANrBq7Q2iUHeXnhm0lbboeDFK4oy7qUSrF/Q35Cfh1dmUEpBtvYpQegXDAU/diF
 vjfQHtCVSTB2VM6oRvMo9jMak6UrVQWwH3Tw9vGPDaLJer1DZSBWBrdw+xE2mjhXSLsm
 I2HdczltZO9P0uwFfXwUtHFRb/a1mrCF+m6DeQkzblSkrtDm+WxJtwMl6gAWQSe+tOB7
 7Jbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738723706; x=1739328506;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KORfQaUKPciCl0b2CXyUX6rgFXA9enZCrhKR40wbesU=;
 b=nEipKHFZMscgwj+LAqIGxHveCReWiRq1+KEFNZLn/+w3yYNQRfXk1g9LsZUqlcJ2G2
 DbT1wI1eGQ699gEIb0aTmLXsfAHtmyxlmLWskE11m72fdc19cf7eInargRiVvnFBkLr8
 akjV8EsVIQvqccI+M3AV4VotBi4kjGLlEP0PfMIbCozyKmHXxgmx3DxDRmRGn2I1S2Wm
 Pp1p2pdck2qu6cjCoRrp0bgTGPasEMA2MZZYkh2k5352Xc9mk0Z578JhhjVoejxEnWJb
 QUM+2FmJgb7GBSYzQSgDhZ8Qi722KR4Wgdt/XwGzO2y3F2xxBVmMZIH2WnxKpKX5T1DB
 oDFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjN3sDX/7cO6jGKZ1O++muLClbCBd3zwWQMRBHfLoTI/YxZ4GOBDgUVKAOrup19uK+reqhharb+OY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz41MncjRz0NIXWCK88nQscOziqtQwO3yEuEkCExPLo8OtMeK0f
 UiLhWG/1TZsQ/MS3upW3Yz9QJ1g3hW1bW9PMPPAqHfO0FobL5mHZTQj87dq/Q3g=
X-Gm-Gg: ASbGncv1F80Sl3TU23FoQyxdpj39fRqFPEodGnSkKKJG4VbD0xmyzYt7h2FH88WH/bb
 OBh9q8mG3jQdNOdJ2q1MmsX2e8+4frpHVj10I0c7miJMDz6jm13tmolZywXAa24O/uAS8ifGt26
 8VVRkEI+UbAMzFrxH41yRGoVRcVC9p1hU6tbf5IqvTsmZ8EpNspgGL0Bw5czpR43gvg9jmz7vYi
 1Ft/LO7OsCtCMOXzMarw7LI8IEf8lNAHxOJ9s0v7nMDVzjUlj+f9fE5/fjviM8ySR82AFcEm9GT
 BJ+3lV6L+AabGPDgZ4VhFYxeEjeRGZc1ldpe5vEJ6VK6coZ8BB7erVRp9PsO173oGkXIZ7A=
X-Google-Smtp-Source: AGHT+IH3/CvFzgTmuPgQIn8DGNcSY6VUA2bSSz/5MVHPj8kIo9Cj7Fku3ScseiRzS700dvIRYZlcxg==
X-Received: by 2002:a2e:8098:0:b0:300:31dc:8a4a with SMTP id
 38308e7fff4ca-307c695989fmr18686511fa.18.1738723706339; 
 Tue, 04 Feb 2025 18:48:26 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307a309faddsm19302181fa.61.2025.02.04.18.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 18:48:25 -0800 (PST)
Date: Wed, 5 Feb 2025 04:48:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v5 07/14] drm/msm/dpu: Reserve resources for CWB
Message-ID: <f4jlvjkwrw37v4dkelvispo2nnl7hkkxczjb3rk47sjpss6bnc@nsdk7qo3c7lg>
References: <20250128-concurrent-wb-v5-0-6464ca5360df@quicinc.com>
 <20250128-concurrent-wb-v5-7-6464ca5360df@quicinc.com>
 <2cc6pp6okhanqv5ndzm32aomgbhidgmvukc4lptrapgpl4utp4@gornklf5hhzp>
 <a69b7265-7a11-4dcb-b642-8a589770af6e@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a69b7265-7a11-4dcb-b642-8a589770af6e@quicinc.com>
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

On Tue, Feb 04, 2025 at 01:29:23PM -0800, Jessica Zhang wrote:
> 
> 
> On 1/29/2025 2:11 PM, Dmitry Baryshkov wrote:
> > On Tue, Jan 28, 2025 at 07:20:39PM -0800, Jessica Zhang wrote:
> > > Add support for RM to reserve dedicated CWB PINGPONGs and CWB muxes
> > > 
> > > For concurrent writeback, even-indexed CWB muxes must be assigned to
> > > even-indexed LMs and odd-indexed CWB muxes for odd-indexed LMs. The same
> > > even/odd rule applies for dedicated CWB PINGPONGs.
> > > 
> > > Track the CWB muxes in the global state and add a CWB-specific helper to
> > > reserve the correct CWB muxes and dedicated PINGPONGs following the
> > > even/odd rule.
> > > 
> > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > 
> > > ---
> > > Changes in v5:
> > > - Allocate CWB muxes first then allocate PINGPONG block based on CWB mux
> > >    index
> > > - Corrected comment doc on odd/even rule
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 34 ++++++++++--
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  2 +
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 +
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 82 +++++++++++++++++++++++++++++
> > >   4 files changed, 115 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > index 99db194f5d095e83ac72f2830814e649a25918ef..17bd9762f56a392e8e9e8d7c897dcb6e06bccbb3 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > @@ -2,7 +2,7 @@
> > >   /*
> > >    * Copyright (C) 2013 Red Hat
> > >    * Copyright (c) 2014-2018, 2020-2021 The Linux Foundation. All rights reserved.
> > > - * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> > > + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> > >    *
> > >    * Author: Rob Clark <robdclark@gmail.com>
> > >    */
> > > @@ -28,6 +28,7 @@
> > >   #include "dpu_hw_dsc.h"
> > >   #include "dpu_hw_merge3d.h"
> > >   #include "dpu_hw_cdm.h"
> > > +#include "dpu_hw_cwb.h"
> > >   #include "dpu_formats.h"
> > >   #include "dpu_encoder_phys.h"
> > >   #include "dpu_crtc.h"
> > > @@ -133,6 +134,9 @@ enum dpu_enc_rc_states {
> > >    * @cur_slave:		As above but for the slave encoder.
> > >    * @hw_pp:		Handle to the pingpong blocks used for the display. No.
> > >    *			pingpong blocks can be different than num_phys_encs.
> > > + * @hw_cwb:		Handle to the CWB muxes used for concurrent writeback
> > > + *			display. Number of CWB muxes can be different than
> > > + *			num_phys_encs.
> > >    * @hw_dsc:		Handle to the DSC blocks used for the display.
> > >    * @dsc_mask:		Bitmask of used DSC blocks.
> > >    * @intfs_swapped:	Whether or not the phys_enc interfaces have been swapped
> > > @@ -177,6 +181,7 @@ struct dpu_encoder_virt {
> > >   	struct dpu_encoder_phys *cur_master;
> > >   	struct dpu_encoder_phys *cur_slave;
> > >   	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
> > > +	struct dpu_hw_cwb *hw_cwb[MAX_CHANNELS_PER_ENC];
> > >   	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
> > >   	unsigned int dsc_mask;
> > > @@ -1137,7 +1142,10 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> > >   	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
> > >   	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> > >   	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> > > +	struct dpu_hw_blk *hw_cwb[MAX_CHANNELS_PER_ENC];
> > >   	int num_ctl, num_pp, num_dsc;
> > > +	int num_cwb = 0;
> > > +	bool is_cwb_encoder;
> > >   	unsigned int dsc_mask = 0;
> > >   	int i;
> > > @@ -1151,6 +1159,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> > >   	priv = drm_enc->dev->dev_private;
> > >   	dpu_kms = to_dpu_kms(priv->kms);
> > > +	is_cwb_encoder = drm_crtc_in_clone_mode(crtc_state) &&
> > > +			dpu_enc->disp_info.intf_type == INTF_WB;
> > >   	global_state = dpu_kms_get_existing_global_state(dpu_kms);
> > >   	if (IS_ERR_OR_NULL(global_state)) {
> > > @@ -1161,9 +1171,25 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> > >   	trace_dpu_enc_mode_set(DRMID(drm_enc));
> > >   	/* Query resource that have been reserved in atomic check step. */
> > > -	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > -		drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
> > > -		ARRAY_SIZE(hw_pp));
> > > +	if (is_cwb_encoder) {
> > > +		num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > +						       drm_enc->crtc,
> > > +						       DPU_HW_BLK_DCWB_PINGPONG,
> > > +						       hw_pp, ARRAY_SIZE(hw_pp));
> > > +		num_cwb = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > +						       drm_enc->crtc,
> > > +						       DPU_HW_BLK_CWB,
> > > +						       hw_cwb, ARRAY_SIZE(hw_cwb));
> > > +	} else {
> > > +		num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > +						       drm_enc->crtc,
> > > +						       DPU_HW_BLK_PINGPONG, hw_pp,
> > > +						       ARRAY_SIZE(hw_pp));
> > > +	}
> > > +
> > > +	for (i = 0; i < num_cwb; i++)
> > > +		dpu_enc->hw_cwb[i] = to_dpu_hw_cwb(hw_cwb[i]);
> > > +
> > >   	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > >   		drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > index ba7bb05efe9b8cac01a908e53121117e130f91ec..8d820cd1b5545d247515763039b341184e814e32 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > @@ -77,12 +77,14 @@ enum dpu_hw_blk_type {
> > >   	DPU_HW_BLK_LM,
> > >   	DPU_HW_BLK_CTL,
> > >   	DPU_HW_BLK_PINGPONG,
> > > +	DPU_HW_BLK_DCWB_PINGPONG,
> > >   	DPU_HW_BLK_INTF,
> > >   	DPU_HW_BLK_WB,
> > >   	DPU_HW_BLK_DSPP,
> > >   	DPU_HW_BLK_MERGE_3D,
> > >   	DPU_HW_BLK_DSC,
> > >   	DPU_HW_BLK_CDM,
> > > +	DPU_HW_BLK_CWB,
> > >   	DPU_HW_BLK_MAX,
> > >   };
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > > index 54ef6cfa2485a8a3886bd26b7ec3692d037dc35e..a57ec2ec106083e8f93578e4307e8b13ae549c08 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > > @@ -132,6 +132,7 @@ struct dpu_global_state {
> > >   	uint32_t cdm_to_crtc_id;
> > >   	uint32_t sspp_to_crtc_id[SSPP_MAX - SSPP_NONE];
> > > +	uint32_t cwb_to_crtc_id[CWB_MAX - CWB_0];
> > >   };
> > >   struct dpu_global_state
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > index dca3107d1e8265a864ac62d6b845d6cb966965ed..2d5cf97a75913d51b2568ce85ec0c79a4a34deb4 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > @@ -233,6 +233,54 @@ static int _dpu_rm_get_lm_peer(struct dpu_rm *rm, int primary_idx)
> > >   	return -EINVAL;
> > >   }
> > > +static int _dpu_rm_reserve_cwb_mux_and_pingpongs(struct dpu_rm *rm,
> > > +						 struct dpu_global_state *global_state,
> > > +						 uint32_t crtc_id,
> > > +						 struct msm_display_topology *topology)
> > > +{
> > > +	int num_cwb_mux = topology->num_lm, cwb_mux_count = 0;
> > > +	int cwb_pp_start_idx = PINGPONG_CWB_0 - PINGPONG_0;
> > > +	int cwb_pp_idx[MAX_BLOCKS];
> > > +	int cwb_mux_idx[MAX_BLOCKS];
> > > +
> > > +	/*
> > > +	 * Reserve additional dedicated CWB PINGPONG blocks and muxes for each
> > > +	 * mixer
> > > +	 *
> > > +	 * TODO: add support reserving resources for platforms with no
> > > +	 *       PINGPONG_CWB
> > > +	 */
> > > +	for (int i = 0; i < ARRAY_SIZE(rm->mixer_blks) &&
> > > +	     cwb_mux_count < num_cwb_mux; i++) {
> > > +		for (int j = 0; j < ARRAY_SIZE(rm->cwb_blks); j++) {
> > > +			/*
> > > +			 * Odd LMs must be assigned to odd CWB muxes and even
> > > +			 * LMs with even CWB muxes
> > > +			 */
> > > +			if (reserved_by_other(global_state->cwb_to_crtc_id, j, crtc_id) ||
> > > +			    i % 2 != j % 2)
> > 
> > Should't it be a loop over allocated LMs with the check that
> > lm[i]->idx % 2 != j % 2 ?
> > Otherwise you are looping over some random LMs and trying to match CWB
> > indices against them.
> 
> Hi Dmitry,
> 
> The RM array idx are based of the hw block ids [1] so there isn't much
> difference using i and lm[i]->id.

Ack. Please add a comment (as I think there will be another revision).

> 
> Thanks,
> 
> Jessica Zhang
> 
> [1] https://elixir.bootlin.com/linux/v6.13.1/source/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c#L74
> 

-- 
With best wishes
Dmitry
