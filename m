Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3130B9F8A39
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 03:50:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28CC10EE3B;
	Fri, 20 Dec 2024 02:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ybi1JurR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D13DB10E4E8
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 02:50:14 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-3011c7b39c7so17519521fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 18:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734663013; x=1735267813; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OQxnzZwa+ZnAwPhXEuB51NoHRLnVz5kTCi7LiEOiNBA=;
 b=Ybi1JurRBCUxbZKCsO+k1nWRO9OtUlrcc31wpdI+B4doBJu3Oo2jc2OJ2W/GWK68Ik
 8LSHO77xmkgRM9AYnqc90j0zAdybvWChSeMSPjG0kiW3Yi9IN0jYUPCZdltvl9apcXMt
 SWFG96oVso3OuSTv8nIV4ThIV7Wyl6mqS0sopEJeQmAsX7aUOsypa5bIUetzSbd1VZOQ
 YOoHpLKkNMD4OmGN4xyIc4FVkDNTwjdoVwfd50TVqDuZb6WLr00LfiM4zrEkDFDcSGFI
 /qjNASsiRX2VxnU25/6sN3iPl7D15vCpyg/S1XkCyULqNFw+mZaluHlp/YYrRspLlcpf
 GXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734663013; x=1735267813;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OQxnzZwa+ZnAwPhXEuB51NoHRLnVz5kTCi7LiEOiNBA=;
 b=MxiFbqFOWeHXE4B3gcNqrRlQVcWUbjx+OC7DHhyEl5zjbZ6GDM3R6zvbanozNj5v4y
 Qhe4nmPWLIl2EuqJBpHzQhBr9sOC9QfbYuDiAw0Kycf85sQg1cj7Gt/KZqMGxZp//UKu
 Gz36bwUaYGqdbOc5zmqJfg4kR+Il0gnblOMnzH09nrL4ZO4KoPmPjDq1CSIH1L3jpdgJ
 y9eKjTxYS+/0bhb9tbw8E8g1RAQCtCbdB7ASe+TQcRjnwodqJ9GlDo4rKwkbTs1cDCOn
 dQMwERlDfsdgApdMx8BU9iAm5QJka5qo4MndnJ4nHyALt8BiuYEBUxpZZiJ0982tbTAd
 b51w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/DBCNKx9ygrT+Tzu4izs8zS+YixetgRo0xK6YK8K0BC+kgoE9LCBbQAgwrlvScgcDT4PzNaugLJM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxB2H9epRI2t7Len1jgb8F7m1CyBWBUk2ANpakbm5ewyBrw9KSy
 1ljxe0tMoALxnJR2Gu9zE5RY7uatn6sOADW1g6vKa7PiXoayWx1pQC3ka1AXQPE=
X-Gm-Gg: ASbGncvI2UtU+QkOE3cL4SlX9nYsFK1ghIIS7tCfPvdq+Dax2x1s8xeYX9DkwAQ0F1W
 lXOFx8EwskSPrc0afkdI53LexrQI2SosD1zWbhOdmNQiOMmH0v2ZfitVj86DvCErcXjdnlZEeHb
 MwjhxKwWiYPmXIv+/CuV4LSXph7R46vtZrgvguH5GK8vYO/rjpzezqf1yuFZMm1iaCnArYwGKFl
 KvrbiH0pEgey/dDXZxb1alKrYGsmEmfmRMu+gMPSjscV7nuF9f7c485YM2UNoDpfU0RvCUbC7Hb
 wP0JO2dqXzF+57KjyhLfMKWa5GRCrMKSc+cf
X-Google-Smtp-Source: AGHT+IHdCv0cpuv0cv13SlSAzLvj/BCq6RPapfQEGLkKmPf/kAnzx0OxyR7cOGcNzeydGUW5qnYdAQ==
X-Received: by 2002:a05:651c:198a:b0:302:3c78:4ea4 with SMTP id
 38308e7fff4ca-304685f7231mr3770121fa.30.1734663013096; 
 Thu, 19 Dec 2024 18:50:13 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad6c504sm4057041fa.10.2024.12.19.18.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 18:50:11 -0800 (PST)
Date: Fri, 20 Dec 2024 04:50:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 07/25] drm/msm/dpu: move resource allocation to CRTC
Message-ID: <nkb5dr5v3vs4h4rcg4q2hwy6iubjfzihrx2cafarbf2qq7axhd@qdqncv6kfwp2>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-7-fe220297a7f0@quicinc.com>
 <b329e872-3e1e-45e3-bff6-bf6ad2c11144@quicinc.com>
 <y2qtp2avw7hjkweh3svfwr6ytvg54lmhqiowfjeiufnyhxiryw@vb4mwnyi2ict>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <y2qtp2avw7hjkweh3svfwr6ytvg54lmhqiowfjeiufnyhxiryw@vb4mwnyi2ict>
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

On Fri, Dec 20, 2024 at 04:32:34AM +0200, Dmitry Baryshkov wrote:
> On Mon, Dec 16, 2024 at 05:47:50PM -0800, Abhinav Kumar wrote:
> > 
> > 
> > On 12/16/2024 4:43 PM, Jessica Zhang wrote:
> > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > 
> > > All resource allocation is centered around the LMs. Then other blocks
> > > (except DSCs) are allocated basing on the LMs that was selected, and LM
> > > powers up the CRTC rather than the encoder.
> > > 
> > > Moreover if at some point the driver supports encoder cloning,
> > > allocating resources from the encoder will be incorrect, as all clones
> > > will have different encoder IDs, while LMs are to be shared by these
> > > encoders.
> > > 
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > [quic_abhinavk@quicinc.com: Refactored resource allocation for CDM]
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > [quic_jesszhan@quicinc.com: Changed to grabbing exising global state]
> > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  86 ++++++++++
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 256 ++++++++++------------------
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |   8 +
> > >   3 files changed, 181 insertions(+), 169 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > index 9f6ffd344693ecfb633095772a31ada5613345dc..186ed84f59f16997716fe216e635b8dce07a63a1 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > @@ -1182,6 +1182,78 @@ static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
> > >   	return false;
> > >   }
> > 
> > <snip>
> > 
> > > +static bool dpu_encoder_needs_dsc_merge(struct drm_encoder *drm_enc)
> > >   {
> > > -	struct dpu_crtc_state *cstate;
> > > -	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> > > -	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> > > -	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC];
> > > -	int num_lm, num_ctl, num_dspp, i;
> > > -
> > > -	cstate = to_dpu_crtc_state(crtc_state);
> > > -
> > > -	memset(cstate->mixers, 0, sizeof(cstate->mixers));
> > > -
> > > -	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > -		drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> > > -	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > -		drm_enc->crtc, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> > > -	num_dspp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > -		drm_enc->crtc, DPU_HW_BLK_DSPP, hw_dspp,
> > > -		ARRAY_SIZE(hw_dspp));
> > > +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> > > +	u32 num_intf = 0;
> > > +	u32 num_dsc = 0;
> > > +	int i;
> > > -	for (i = 0; i < num_lm; i++) {
> > > -		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
> > > +	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
> > > +		if (dpu_enc->phys_encs[i])
> > > +			num_intf++;
> > > -		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
> > > -		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
> > > -		cstate->mixers[i].hw_dspp = i < num_dspp ? to_dpu_hw_dspp(hw_dspp[i]) : NULL;
> > > -	}
> > > +	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
> > > +	if (dpu_enc->dsc)
> > > +		num_dsc += 2;
> > 
> > As we requested in v3, can you please explain why we have num_dsc +=2
> > instead of just num_dsc = 2? If we are hard-coding 2:2:1, this should be
> > just num_dsc = 2.
> 
> I'll drop it while applying a first part of the series. Granted that
> num_dsc is initialized to 0 few lines above, it should be fine.
> 
> If later there is a need to change the lane, it can be done in a
> consequent patch.

Forgot to add:

With that change,

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
