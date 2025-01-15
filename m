Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C0FA11BE8
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 09:28:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F3E10E55F;
	Wed, 15 Jan 2025 08:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="y/ym9Nx3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 129D110E561
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 08:28:07 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-30229d5b229so56082941fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 00:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736929625; x=1737534425; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pZ4HRx7SsZZko5M+0b/vJqN2qjluOm4gJzYYS2wUfjU=;
 b=y/ym9Nx3iT3YrlXLviCxE03sy0wtCS3gtz98Dto1d+HE9I4V++xuoYcYvwW8mCheER
 NzECf3mogPkDIXEwbiAn35L/EyIMF55Kgo5o/nzRx9sH16Lwt31L196YGwbpGOSclFJn
 K5wujbq9N8yNb1w3xQRwcrQXMUGmKuotH8yP9wTBmFII2RLCucvctTM49TqcW/XeyqRC
 o/8vi/B0PCH/1jXr22X7Hx09SkZv5P2mhA8i8DhbqbGCfOWRzXz3CqPxs/Xt5nFBc241
 yHCmXWtufvhTtg6664jRNA9OK/tfvj+0NdX6e710inkGAkCoSJurGz0L7uRj1NO39HbF
 IbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736929625; x=1737534425;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pZ4HRx7SsZZko5M+0b/vJqN2qjluOm4gJzYYS2wUfjU=;
 b=IX1z5QBku+V+w05oXM24bTuFf24gQdeXcTroQHiYLrexTgRQ2/TSD8u5tgVtRgnqVO
 kQtO6Fs9S/Q5op1vC2c0WyCPHohPIqjvNSgIgAoeOlPla92ghXXZnXZGE4F9yxcJyQnS
 72I7/hNa/aGoHhKmVTZMIPBumgn5IIGZibx7aXr0F8MVTda5jOq2FB9LcNKd9V5VK7lz
 xWSuNrsxOUQy+HrVWVg/09A9sU6igdMMsF5g//g68Oqhwg6GXSW/TWrmKi02hnea22yk
 oRiHt+r1fOCv5Y8/KmYK3UHki2LYNwdGKPPDjKI7u6Jbs15PRBh2bDlgT80uLOes+EPQ
 Oa7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUU4CvRXLqvX/CiZpqdbX5hAN4Tb72MAyrTCgMOZ/KdF+h3Av2iuqJrg2pjLnmcBgGK9SzIRA6EFKA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz29taG/acqOkWehm1oi1VDMzg4okH4Ujro+SjdvRrMfftHoHBC
 i6fzrZrJqzf8ojEt7EMnk9vdYhaxEPKgdIpg/l/MWBJNrdBWWyv5T+D2dshsiVc=
X-Gm-Gg: ASbGncu1lpFcIFko3YG3+5+YSyQ+fEYItWKAEVFjMR5fNn139N1ksS89AFp7OgzFRDY
 GhGtE2YXQvzdwrQ3OAOPsWxIi3AhxlYxwpglY5iq9fGaaG20sH5+9ooamMDzsvJNLoxYuijz5eq
 QJhO6VQNe8OLUQtyw5mcr2bf6S2egNS961Yl3O1rxdMwvj/Ymy+5me8Kh/Bqs8PYBab1JlnIOzZ
 jeWqyqy2yCJkQp7EE+VmeBjRJE3eNkATDXRvthzuVCg5hpXCY3SSxmAzl7Y+MZyStlNoA4D73D1
 DdSUx9aNdcBLZ2uXEUCgqmH2sDOitFt3nzTR
X-Google-Smtp-Source: AGHT+IEa4wTdMIRF+GsL7h99ddXXaeUlR6bj66KVo6XSmN4DdnMNkhI7iraI/KfJn24NcdFDQUy/Zw==
X-Received: by 2002:a2e:bc1b:0:b0:302:2320:dc81 with SMTP id
 38308e7fff4ca-305f4626035mr86805911fa.29.1736929625271; 
 Wed, 15 Jan 2025 00:27:05 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff0cf1f8sm21006251fa.27.2025.01.15.00.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 00:27:04 -0800 (PST)
Date: Wed, 15 Jan 2025 10:27:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Stephen Boyd <swboyd@chromium.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 7/9] drm/msm/dpu: handle perf mode in
 _dpu_core_perf_crtc_update_bus()
Message-ID: <4quxgv6n35np7fm7iqx5bw5xnkz7gxabh3ix5rexcq5nir5k7i@xi33w2wyj7om>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
 <20250106-dpu-perf-rework-v4-7-00b248349476@linaro.org>
 <459422c9-c272-4389-9b05-487a0148a082@quicinc.com>
 <ab4wkauem3xb65wh3h22bcyzlpx26rrmsicrdlewomn55ykpqi@tggrsmb6qcmf>
 <8e6b6940-d155-4ab7-bdd6-a67e9506218a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e6b6940-d155-4ab7-bdd6-a67e9506218a@quicinc.com>
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

On Tue, Jan 14, 2025 at 01:18:26PM -0800, Abhinav Kumar wrote:
> 
> 
> On 1/14/2025 3:10 AM, Dmitry Baryshkov wrote:
> > On Mon, Jan 13, 2025 at 07:38:16PM -0800, Abhinav Kumar wrote:
> > > 
> > > 
> > > On 1/5/2025 7:07 PM, Dmitry Baryshkov wrote:
> > > > Move perf mode handling for the bandwidth to
> > > > _dpu_core_perf_crtc_update_bus() rather than overriding per-CRTC data
> > > > and then aggregating known values.
> > > > 
> > > > Note, this changes the fix_core_ab_vote. Previously it would be
> > > > multiplied per the CRTC number, now it will be used directly for
> > > > interconnect voting. This better reflects user requirements in the case
> > > > of different resolutions being set on different CRTCs: instead of using
> > > > the same bandwidth for each CRTC (which is incorrect) user can now
> > > > calculate overall bandwidth required by all outputs and use that value.
> > > > 
> > > 
> > > There are two things this change is doing:
> > > 
> > > 1) Dropping the core_clk_rate setting because its already handled inside
> > > _dpu_core_perf_get_core_clk_rate() and hence dpu_core_perf_crtc_update()
> > > will still work.
> > > 
> > > and
> > > 
> > > 2) Then this part of moving the ab/ib setting to
> > > _dpu_core_perf_crtc_update_bus().
> > > 
> > > Can we split this into two changes so that its clear that dropping
> > > core_clk_rate setting in this change will not cause an issue.
> > 
> > Ack
> > 
> 
> Actually I think this is incorrect.
> 
> If the user puts in an incorrect value beyond the bounds, earlier the code
> will reject that by failing the in _dpu_core_perf_calc_crtc().

This function doesn't perform any validation nor returns an error code.
Probably you've meant some other function.

> 
> Now, if we move it to _dpu_core_perf_crtc_update_bus(), this is beyond the
> check phase so incorrect values cannot be rejected.
> 
> So we will still need to preserve overriding the values in
> _dpu_core_perf_calc_crtc().
> 
> > > 
> > > 
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 40 +++++++++++++--------------
> > > >    1 file changed, 19 insertions(+), 21 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > > > index 70f43e8359caee2082f2ca9944a17a6a20aa3d49..7ff3405c6867556a8dc776783b91f1da6c86ef3f 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > > > @@ -118,22 +118,9 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
> > > >    		return;
> > > >    	}
> > > > -	memset(perf, 0, sizeof(struct dpu_core_perf_params));
> > > > -
> > > > -	if (core_perf->perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> > > > -		perf->bw_ctl = 0;
> > > > -		perf->max_per_pipe_ib = 0;
> > > > -		perf->core_clk_rate = 0;
> > > > -	} else if (core_perf->perf_tune.mode == DPU_PERF_MODE_FIXED) {
> > > > -		perf->bw_ctl = core_perf->fix_core_ab_vote * 1000ULL;
> > > > -		perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
> > > > -		perf->core_clk_rate = core_perf->fix_core_clk_rate;
> > > > -	} else {
> > > > -		perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
> > > > -		perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
> > > > -		perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
> > > > -	}
> > > > -
> > > > +	perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
> > > > +	perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
> > > > +	perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
> > > >    	DRM_DEBUG_ATOMIC(
> > > >    		"crtc=%d clk_rate=%llu core_ib=%u core_ab=%u\n",
> > > >    			crtc->base.id, perf->core_clk_rate,
> > > > @@ -222,18 +209,29 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
> > > >    {
> > > >    	struct dpu_core_perf_params perf = { 0 };
> > > >    	int i, ret = 0;
> > > > -	u64 avg_bw;
> > > > +	u32 avg_bw;
> > > > +	u32 peak_bw;
> > > >    	if (!kms->num_paths)
> > > >    		return 0;
> > > > -	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> > > > +	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> > > > +		avg_bw = 0;
> > > > +		peak_bw = 0;
> > > > +	} else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
> > > > +		avg_bw = kms->perf.fix_core_ab_vote;
> > > > +		peak_bw = kms->perf.fix_core_ib_vote;
> > > > +	} else {
> > > > +		dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> > > > +
> > > > +		avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
> > > > +		peak_bw = perf.max_per_pipe_ib;
> > > > +	}
> > > > -	avg_bw = perf.bw_ctl;
> > > > -	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
> > > > +	avg_bw /= kms->num_paths;
> > > >    	for (i = 0; i < kms->num_paths; i++)
> > > > -		icc_set_bw(kms->path[i], avg_bw, perf.max_per_pipe_ib);
> > > > +		icc_set_bw(kms->path[i], avg_bw, peak_bw);
> > > >    	return ret;
> > > >    }
> > > > 
> > 

-- 
With best wishes
Dmitry
