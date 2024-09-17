Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC2697AB4B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 08:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E9910E416;
	Tue, 17 Sep 2024 06:13:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="A5PB+ZYV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5532B10E410
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 06:13:42 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5365cc68efaso5271662e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 23:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726553620; x=1727158420; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jVYJdvkFkNlxeJMRsZ4TNMxACduPDS+BlYyHwRQEdIQ=;
 b=A5PB+ZYVd18f1Y5d+WmYVSuCnmNsc+zIkOJ0uxrBsUU4btrnmojQ5SXms7214dDPnm
 iYu7xBQJTKBRuimQBEZ3FIbhY2v/eV8LleYiCfNZXxlwFheP7dCfD9QSFi/97q8pPSqu
 bYEWdS5tuSGDsXQnRzg9MCEuRPdRt0TR539eO5jXG5yzPOxGac8lvAJAi8iMALKyKvt7
 wc59jIs/PkO6Yy2icI0LykJcJIUvUmlQKmy9uxxGNwqz3dbvgdbp74OdZxPzpkkGcCH1
 ZdrekbONzJREK90WhbEphtdQn9hxPQRtkdLmVHn8De5O2MT0gtG5cp+SIRqCba05Aei+
 c1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726553620; x=1727158420;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jVYJdvkFkNlxeJMRsZ4TNMxACduPDS+BlYyHwRQEdIQ=;
 b=phCH5K2LqLoZIMZyVHZHVF64ztV/gnYZ+cbqVGukW/seViLDaXpAdBc812dG5gyZQN
 WQvEAjv6Ltjry21XoM+B3jTPjIJXlPWVleagwbgHmsy1IsmC/GY0wLlyQVC5YLjZjzsh
 l/eSJjFyQc2ub98qX78eiN3IkbZFgDaQOsFXpQsPwiYViPCmH7W26FlfgjEqnOrcwkqZ
 gxykR81ASE9akbXBCGOPCGDVfhX6L+mVGMHSTuqW9jPDiRXt6oR9h00Bj5x+Z7ge/MYr
 USvQaZgf2Gl0a/ZZXw0CWDrhMHigDiPvN89Ri85LB+8By8d3qZkHO5Jkv4I2jZJem8Fk
 RJ0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+N/g9n6uv/40X3QZQqvC1It3Nuk9lD2huNmJZ4JCdqirQVNGgFtvIjrs2aQUU41384pvqEKtCBnE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWzMwuQSbFVB8AYmODHNJjHjdu7yQAimOeD7jqUJd4OvrIVtRu
 FoLp6W6Dq2noyl1xdR5L4IKyAYrz7Kr0BlHesOJFm8S077xku51XLEwIJvBJvYU=
X-Google-Smtp-Source: AGHT+IFdBF7B4QyEPBZPGOnaXJlYt4ba+AFuUcaY/D5OQvGqZTdStRahA8ylEs0QG75e1xb02yE0Yw==
X-Received: by 2002:a05:6512:2384:b0:536:55b3:470e with SMTP id
 2adb3069b0e04-53678fb70a0mr9815758e87.19.1726553619760; 
 Mon, 16 Sep 2024 23:13:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-536870967a5sm1107728e87.181.2024.09.16.23.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 23:13:39 -0700 (PDT)
Date: Tue, 17 Sep 2024 09:13:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v6 02/15] drm/msm/dpu: move CRTC resource assignment to
 dpu_encoder_virt_atomic_check
Message-ID: <rpmp4pvv2fcg3iprcesco4a73vd457cdvlqtjtl6tzrmxkdlw6@jczni6cbi226>
References: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
 <20240903-dpu-mode-config-width-v6-2-617e1ecc4b7a@linaro.org>
 <013aa39c-90d3-464a-9cb2-d52be4e51f17@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <013aa39c-90d3-464a-9cb2-d52be4e51f17@quicinc.com>
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

On Mon, Sep 16, 2024 at 06:04:08PM GMT, Abhinav Kumar wrote:
> 
> 
> On 9/2/2024 8:22 PM, Dmitry Baryshkov wrote:
> > Historically CRTC resources (LMs and CTLs) were assigned in
> > dpu_crtc_atomic_begin(). The commit 9222cdd27e82 ("drm/msm/dpu: move hw
> > resource tracking to crtc state") simply moved resources to
> > struct dpu_crtc_state, without changing the code sequence. Later on the
> > commit b107603b4ad0 ("drm/msm/dpu: map mixer/ctl hw blocks in encoder
> > modeset") rearanged the code, but still kept the cstate->num_mixers
> > assignment to happen during commit phase. This makes dpu_crtc_state
> > inconsistent between consequent atomic_check() calls.
> > 
> > Move CRTC resource assignment to happen at the end of
> > dpu_encoder_virt_atomic_check().
> > 
> 
> Mostly LGTM now, a couple of comments/questions below:
> 
> > Fixes: b107603b4ad0 ("drm/msm/dpu: map mixer/ctl hw blocks in encoder modeset")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  3 --
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 59 +++++++++++++++++++----------
> >   2 files changed, 38 insertions(+), 24 deletions(-)
> > 

> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 949ebda2fa82..bd3698bf0cf7 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -624,6 +624,40 @@ static struct msm_display_topology dpu_encoder_get_topology(
> >   	return topology;
> >   }
> > +static void dpu_encoder_assign_crtc_resources(struct dpu_kms *dpu_kms,
> > +					      struct drm_encoder *drm_enc,
> > +					      struct dpu_global_state *global_state,
> > +					      struct drm_crtc_state *crtc_state)
> > +{
> > +	struct dpu_crtc_state *cstate;
> > +	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> > +	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> > +	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC];
> > +	int num_lm, num_ctl, num_dspp, i;
> > +
> > +	cstate = to_dpu_crtc_state(crtc_state);
> > +
> > +	memset(cstate->mixers, 0, sizeof(cstate->mixers));
> > +
> > +	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > +		drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> > +	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > +		drm_enc->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> > +	num_dspp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > +		drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
> > +		ARRAY_SIZE(hw_dspp));
> > +
> > +	for (i = 0; i < num_lm; i++) {
> > +		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
> > +
> > +		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
> > +		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
> > +		cstate->mixers[i].hw_dspp = i < num_dspp ? to_dpu_hw_dspp(hw_dspp[i]) : NULL;
> > +	}
> > +
> > +	cstate->num_mixers = num_lm;
> > +}
> > +
> >   static int dpu_encoder_virt_atomic_check(
> >   		struct drm_encoder *drm_enc,
> >   		struct drm_crtc_state *crtc_state,
> > @@ -692,6 +726,9 @@ static int dpu_encoder_virt_atomic_check(
> >   		if (!crtc_state->active_changed || crtc_state->enable)
> >   			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
> >   					drm_enc, crtc_state, topology);
> > +		if (!ret)
> > +			dpu_encoder_assign_crtc_resources(dpu_kms, drm_enc,
> > +							  global_state, crtc_state);
> >   	}
> 
> This is now under the drm_atomic_crtc_needs_modeset() condition which is
> good, but shouldnt this also move under the same if condition as
> dpu_rm_reserve()? There cannot be any assignment without reservation right?

Maybe it's not that obvious from the function name, but it will also
clear previously assigned resources. So, I think it is correct to be
called even if the resources were released without further assignment.

> 
> 
> <snip>

-- 
With best wishes
Dmitry
