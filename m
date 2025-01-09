Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E35E4A06D0F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 05:32:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 436CD10ECDC;
	Thu,  9 Jan 2025 04:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qr2R02re";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C25010ECDC
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 04:32:20 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5d3dce16a3dso918216a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 20:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736397079; x=1737001879; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RI105FXbZ+6c9MUX+ILr2CPbzR00w0PPtPZAHqBYykY=;
 b=qr2R02reSKKtGJ4Hr1xGTKgc64uYaYLk33SryALsRibjnJFzOlIuW3OWbQrcKpHDRJ
 Dk0+nBeUnQ4DkFPIteOGFC9edBQzlMiXTJ2K/m8Masb4DYcRB+8JM2KqNgh7JxUAy22o
 tV2u5ujD13heVj/AyvLHodnTZr91u9a4PryXDoScXE/+wf2C5kHnNe7w2clcs1BbqrdS
 RLEKDfeaEd8ZDCiK5YWIdxzYt4e5CPZWkRNEiNdKikSlfK+UhtTyUVGwMKO4GaDdQBdB
 fuD99yz2IHp1pcZdVti2rOPKMXaUESaFX6Q9iLbAGJxY5y8T0EVmh5TirxXnHQNdfLih
 Tb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736397079; x=1737001879;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RI105FXbZ+6c9MUX+ILr2CPbzR00w0PPtPZAHqBYykY=;
 b=vZ9tw6OW0vEkX13Bs1GZHSSOi59ZfH21PK8OTwRGZQ/CjsfyMnGkKUvOnQwYqPlkWo
 lfOdoLtYPuqZ4FLXlWev0MOjrtltaHp/Kq5kStRKd/o9eEbrtCvNRDnlMdEoYQ6qfmfI
 H/Qhlz72MnYWVzsu5tt/EilGo3RvuJb4ndGzRkuLp+te3svErFKvNT1rCw037E0Q4IV0
 7KeizSLsaOroeRvy8e6ZBGg/bEPy/vNxv92kpMhG0tmdpKYG3ZduPImvVvO0jZNj8wHZ
 fRV4E80yLkUv3WdPLaxN/3xy+PwvxstjW/JUflSneoKIjmP4qHBDvJzLBm3kpltRVR84
 u8gA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHWUOxGC08RfigMyXSxDtejSIqhpgtr1cQF2my4W6/l0+psUJhNz/QF/uWdoe44ej2EIT1dDteOT8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSW/aY8HYNAtHcWZtlK+GewDcwg8pDvyeRSzDg8hjaYOMULMX7
 evvbldJjMlA7BRlwW8NzqWVbRQY9MjflLQgoyr/whR3tWDSAJZKEJKUNK+QpErCqjiYut3nSar5
 C
X-Gm-Gg: ASbGncuiLiT8WdmliawlqRiWCcnBo3MmEJl1m3scvmr/ptz1vPXPha23N7GXbvPMI/r
 cSvP62QQIdFxmvOhQFW/ycPZ4M92iL+QPPVM3qxV7LGI8S4nELwwvPQ3ZQ7t2c5iTjmIsmoaTct
 QDg/D7fmn5nxpHto0m6cMdnNNeWRrMakxRWnFKVJaTwgv/vW9c5C5OnbjK2crbPczXKImdbEU+I
 j1wSw1TL5c/O7Gr6LtPUhMloOF1XSaG0N2N3OwKjod64JcvvP+PO0/ahEBuzSu/N2DZiApZJaUz
 1urLlFoNaOGl40pMrgzZc3gxRaNW3lO+JlFA
X-Google-Smtp-Source: AGHT+IHEZuHRIaKqakNLtv5UXX2C9mvMRn31Oci3NY2kR1ylrkyMAvDePp+/dCdXLT4ozAK/6FWpMw==
X-Received: by 2002:ac2:4c4a:0:b0:542:7f34:4df8 with SMTP id
 2adb3069b0e04-5428c1cfe56mr228114e87.2.1736396661334; 
 Wed, 08 Jan 2025 20:24:21 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be4a029sm71282e87.54.2025.01.08.20.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 20:24:20 -0800 (PST)
Date: Thu, 9 Jan 2025 06:24:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Archit Taneja <architt@codeaurora.org>, Rajesh Yadav <ryadav@codeaurora.org>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH 6/6] drm/msm/dpu: don't set crtc_state->mode_changed from
 atomic_check()
Message-ID: <ag7drc3bwzlmktbknoo2gzulaziva2mj7d2ze4wc26ng23336k@f5o6ue2skit5>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
 <20241222-drm-dirty-modeset-v1-6-0e76a53eceb9@linaro.org>
 <91dff265-5e13-45db-b46d-0eef4a95f5f6@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91dff265-5e13-45db-b46d-0eef4a95f5f6@quicinc.com>
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

On Wed, Jan 08, 2025 at 06:27:13PM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/21/2024 9:00 PM, Dmitry Baryshkov wrote:
> > The MSM driver uses drm_atomic_helper_check() which mandates that none
> > of the atomic_check() callbacks toggles crtc_state->mode_changed.
> > Perform corresponding check before calling the drm_atomic_helper_check()
> > function.
> > 
> > Fixes: 8b45a26f2ba9 ("drm/msm/dpu: reserve cdm blocks for writeback in case of YUV output")
> > Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
> > Closes: https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 32 +++++++++++++++++++++++++----
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26 +++++++++++++++++++++++
> >   drivers/gpu/drm/msm/msm_atomic.c            | 13 +++++++++++-
> >   drivers/gpu/drm/msm/msm_kms.h               |  7 +++++++
> >   5 files changed, 77 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 209e6fb605b2d8724935b62001032e7d39540366..b7c3aa8d0e2ca58091deacdeaccb0819d2bf045c 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -753,6 +753,34 @@ static void dpu_encoder_assign_crtc_resources(struct dpu_kms *dpu_kms,
> >   	cstate->num_mixers = num_lm;
> >   }
> > +/**
> > + * dpu_encoder_virt_check_mode_changed: check if full modeset is required
> > + * @drm_enc:    Pointer to drm encoder structure
> > + * @crtc_state:	Corresponding CRTC state to be checked
> > + * @conn_state: Corresponding Connector's state to be checked
> > + *
> > + * Check if the changes in the object properties demand full mode set.
> > + */
> > +int dpu_encoder_virt_check_mode_changed(struct drm_encoder *drm_enc,
> > +					struct drm_crtc_state *crtc_state,
> > +					struct drm_connector_state *conn_state)
> > +{
> > +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> > +	struct msm_display_topology topology;
> > +
> > +	DPU_DEBUG_ENC(dpu_enc, "\n");
> > +
> > +	/* Using mode instead of adjusted_mode as it wasn't computed yet */
> > +	topology = dpu_encoder_get_topology(dpu_enc, &crtc_state->mode, crtc_state, conn_state);
> > +
> > +	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
> > +		crtc_state->mode_changed = true;
> > +	else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
> > +		crtc_state->mode_changed = true;
> > +
> > +	return 0;
> > +}
> 
> How will this work exactly?
> 
> needs_cdm is set in the encoder's atomic_check which is called inside
> drm_atomic_helper_check(). But this function is called before that.
> 
> So needs_cdm will never hit.
> 

Please refer to the previous patch, it should answer your question.

> 
> > +
> >   static int dpu_encoder_virt_atomic_check(
> >   		struct drm_encoder *drm_enc,
> >   		struct drm_crtc_state *crtc_state,
> > @@ -786,10 +814,6 @@ static int dpu_encoder_virt_atomic_check(
> >   	topology = dpu_encoder_get_topology(dpu_enc, adj_mode, crtc_state, conn_state);
> > -	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
> > -		crtc_state->mode_changed = true;
> > -	else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
> > -		crtc_state->mode_changed = true;
> >   	/*
> >   	 * Release and Allocate resources on every modeset
> >   	 */

-- 
With best wishes
Dmitry
