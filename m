Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55288A1308D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 02:15:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0DF410E15B;
	Thu, 16 Jan 2025 01:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kftb+ogF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB0410E15B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 01:15:18 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-54021daa6cbso439399e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 17:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736990057; x=1737594857; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=r4e0IudMnukUFWD7viyoe0eoxw+YDzAgC6X7Oe6+VlY=;
 b=kftb+ogFFaUv8vvou516MRSbU1biIozc3yicgp3ocD7H9iZbOCgwDTwJvXpnOgvIt6
 B/On0avgUHfRfvPC2vkTcW/LBFe3haYgHhL8rye4EJtWtlJQLABdwhEUHoL6PuidNTjc
 1zk4Zg0TwYzO5FLmHkvSK70Jl3zGkfiTG3OPI5779Fcw+odOh9xm+Y1t+b9dXKoN1ugt
 fIOoEUnUTCTHiTQTqgPefw+OsnFw2c3TnAMxsiupV5rNaulWAbirXkyjI/qnp3n4eLdp
 AKStLVpeaTcaDkekRPkgCW+FYFiz2nxYAjbh3W/iQqkE/GlRWpQ6rzu1ogVHckvjZiDJ
 LwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736990057; x=1737594857;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r4e0IudMnukUFWD7viyoe0eoxw+YDzAgC6X7Oe6+VlY=;
 b=LkvLcVWITfofnJg6BckNyfPcJhmsCSoJKJVlWVzl8MVsFrpWKyZIQWJi4P6tdG3n99
 qX4Fl88tws3W3S3zV3XMvMix2UZQXn+eDPiF4H/h+0mCwLm0daHnKqbsevk/P/92LuEh
 nDcx0IKR8wXNhJH28+Sp8KwJOkcralrX+eLkSZA7t0ypNOiyP8MbTcH3sJfSu69jv99n
 YwcWHsuBzLlAI0LLrGHa99aBtvDJfNpSdbRs7dI/67TPVuz/9/JRzHHN7lEbVEiD34pE
 1TMvwLzH6w/QN38nXqsTEsD+WMfS6EMwvxEYtcRrTtv64EOAuCKNCDLPa1KOcWOpLOmj
 R9sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3KbcpRe5MJVnptxunm9uAXL70JehvXz59wi+ocBEk/AAF/3LXwRO+MUcwshCWsjvobObBwHBVhfQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydeOtJJDStUQTxlEAimWclNu1dQFuOkZ6+UTX29LpUJFiEwlnQ
 tRHBk4+MvP1l6luThUhxbRZTYwCtZd1m2Avqn4iXqjTLmONrLOfNOKW/nKHgKEc=
X-Gm-Gg: ASbGncvGWsQEXvZUDI+nWpo3rwkV1kDk4VmhYZTE7BHM8rrRl+s2HjDWrapCsHPRrSj
 CzQVMmXEIKxKn9N5ckwycYQ1k28WhCyBdafDffxHUPcNgneA0AjoTVxkZWvK9Mfvj0E0fwZ/rCm
 Y91Al4q5PrhtYXB7vRIycH8r6/NfHc1tk8dI/BqYENGZS70IhF0OHPKMez8q66PIuHbshA4WphS
 4UKiUJxtuM5Xpa5qKrxV7f3cNZhVpF+0FaAhY9sYQJ/tPVqq1IC9cCd/0KLDYnOxsohT1xWPPEg
 e8b37qZ3G4HX+vqrg4B/dq/GURXqYOsLxej9
X-Google-Smtp-Source: AGHT+IHcUh58pDRs3Rqutw/pYV92Q2PDhu6MhAiCX/8p7DwTj7+go5vUgCSXOd/KKHur5P9mxQJjeQ==
X-Received: by 2002:a05:6512:ac7:b0:540:3572:170c with SMTP id
 2adb3069b0e04-542845af111mr8135121e87.2.1736990056825; 
 Wed, 15 Jan 2025 17:14:16 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bec0664sm2190106e87.193.2025.01.15.17.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 17:14:15 -0800 (PST)
Date: Thu, 16 Jan 2025 03:14:13 +0200
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
Message-ID: <2fnrfaafg5shswb2p6tsw3ua7y4ll43qzmbrgc4qo6oou3mvwt@5kxr7vifb62m>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
 <20250106-dpu-perf-rework-v4-7-00b248349476@linaro.org>
 <459422c9-c272-4389-9b05-487a0148a082@quicinc.com>
 <ab4wkauem3xb65wh3h22bcyzlpx26rrmsicrdlewomn55ykpqi@tggrsmb6qcmf>
 <8e6b6940-d155-4ab7-bdd6-a67e9506218a@quicinc.com>
 <4quxgv6n35np7fm7iqx5bw5xnkz7gxabh3ix5rexcq5nir5k7i@xi33w2wyj7om>
 <72c50442-5624-44ca-a954-64f7ddfa16f9@quicinc.com>
 <mvw34ny5en3dzt5ro6556daiktk6dc2azjotq26755dqscbu3b@fq7rxjqf7fg2>
 <b5a49ad8-02df-4418-911c-91bc57c4d05a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5a49ad8-02df-4418-911c-91bc57c4d05a@quicinc.com>
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

On Wed, Jan 15, 2025 at 04:40:39PM -0800, Abhinav Kumar wrote:
> 
> 
> On 1/15/2025 4:32 PM, Dmitry Baryshkov wrote:
> > On Wed, Jan 15, 2025 at 11:41:27AM -0800, Abhinav Kumar wrote:
> > > 
> > > 
> > > On 1/15/2025 12:27 AM, Dmitry Baryshkov wrote:
> > > > On Tue, Jan 14, 2025 at 01:18:26PM -0800, Abhinav Kumar wrote:
> > > > > 
> > > > > 
> > > > > On 1/14/2025 3:10 AM, Dmitry Baryshkov wrote:
> > > > > > On Mon, Jan 13, 2025 at 07:38:16PM -0800, Abhinav Kumar wrote:
> > > > > > > 
> > > > > > > 
> > > > > > > On 1/5/2025 7:07 PM, Dmitry Baryshkov wrote:
> > > > > > > > Move perf mode handling for the bandwidth to
> > > > > > > > _dpu_core_perf_crtc_update_bus() rather than overriding per-CRTC data
> > > > > > > > and then aggregating known values.
> > > > > > > > 
> > > > > > > > Note, this changes the fix_core_ab_vote. Previously it would be
> > > > > > > > multiplied per the CRTC number, now it will be used directly for
> > > > > > > > interconnect voting. This better reflects user requirements in the case
> > > > > > > > of different resolutions being set on different CRTCs: instead of using
> > > > > > > > the same bandwidth for each CRTC (which is incorrect) user can now
> > > > > > > > calculate overall bandwidth required by all outputs and use that value.
> > > > > > > > 
> > > > > > > 
> > > > > > > There are two things this change is doing:
> > > > > > > 
> > > > > > > 1) Dropping the core_clk_rate setting because its already handled inside
> > > > > > > _dpu_core_perf_get_core_clk_rate() and hence dpu_core_perf_crtc_update()
> > > > > > > will still work.
> > > > > > > 
> > > > > > > and
> > > > > > > 
> > > > > > > 2) Then this part of moving the ab/ib setting to
> > > > > > > _dpu_core_perf_crtc_update_bus().
> > > > > > > 
> > > > > > > Can we split this into two changes so that its clear that dropping
> > > > > > > core_clk_rate setting in this change will not cause an issue.
> > > > > > 
> > > > > > Ack
> > > > > > 
> > > > > 
> > > > > Actually I think this is incorrect.
> > > > > 
> > > > > If the user puts in an incorrect value beyond the bounds, earlier the code
> > > > > will reject that by failing the in _dpu_core_perf_calc_crtc().
> > > > 
> > > > This function doesn't perform any validation nor returns an error code.
> > > > Probably you've meant some other function.
> > > > 
> > > 
> > > Sorry, let me explain a little more to complete the flow I am seeing.
> > > 
> > > _dpu_core_perf_calc_crtc() gets called by dpu_core_perf_crtc_check().
> > > 
> > > That one checks against erroneous values.
> > > 
> > >                  if (!threshold) {
> > >                          DPU_ERROR("no bandwidth limits specified\n");
> > >                          return -E2BIG;
> > >                  } else if (bw > threshold) {
> > >                          DPU_ERROR("exceeds bandwidth: %ukb > %ukb\n", bw,
> > >                                          threshold);
> > >                          return -E2BIG;
> > >                  }
> > 
> > Here we are checking that the selected set of modes doesn't overload
> > defined platform requirements. However I think that it should be
> > possible for the user to attempt to overcome predefined bandwidth
> > limitations in attempt to debug the issue. ICC framework handles that
> > perfectly (and if you check, until the sync_state is reached all BW's
> > are assumed to be UINT_MAX). Maybe I should document it in the commit
> > message that after this commit forced BWs are not a subject to the
> > catalog limitations.
> > 
> 
> hmmm, yes this was the validation I was referring to.
> 
> I didnt get why a user should be allowed to go beyond the platform limits,
> what purpose does that serve , its not leading to any conclusion or towards
> the resolution of the issue. With the platform validation not only we are
> enforcing the limits but also making sure that random values given by the
> user dont cause more harm than good.

If debugfs files are being used to overwrite the data, then the user is
an advanced user. Possible usage cases might include explicitly
overclocking the platform, performing validation checks or just
attempting to understand the underfill issues. Thus I belive the
advanced user should be given a power to shoot their leg by specifying
hugher values than specified in the catalog. As I wrote, ICC driver
already uses UINT_MAX for bandwidth values during the system bootup.
RPM(h) will enforce bandwidth limitations on those votes.

> 
> > > 
> > > > > 
> > > > > Now, if we move it to _dpu_core_perf_crtc_update_bus(), this is beyond the
> > > > > check phase so incorrect values cannot be rejected.
> > > > > 
> > > > > So we will still need to preserve overriding the values in
> > > > > _dpu_core_perf_calc_crtc().
> > > > > 
> > > > > > > 
> > > > > > > 
> > > > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > > > ---
> > > > > > > >      drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 40 +++++++++++++--------------
> > > > > > > >      1 file changed, 19 insertions(+), 21 deletions(-)
> > > > > > > > 
> > > > > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > > > > > > > index 70f43e8359caee2082f2ca9944a17a6a20aa3d49..7ff3405c6867556a8dc776783b91f1da6c86ef3f 100644
> > > > > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > > > > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > > > > > > > @@ -118,22 +118,9 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
> > > > > > > >      		return;
> > > > > > > >      	}
> > > > > > > > -	memset(perf, 0, sizeof(struct dpu_core_perf_params));
> > > > > > > > -
> > > > > > > > -	if (core_perf->perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> > > > > > > > -		perf->bw_ctl = 0;
> > > > > > > > -		perf->max_per_pipe_ib = 0;
> > > > > > > > -		perf->core_clk_rate = 0;
> > > > > > > > -	} else if (core_perf->perf_tune.mode == DPU_PERF_MODE_FIXED) {
> > > > > > > > -		perf->bw_ctl = core_perf->fix_core_ab_vote * 1000ULL;
> > > > > > > > -		perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
> > > > > > > > -		perf->core_clk_rate = core_perf->fix_core_clk_rate;
> > > > > > > > -	} else {
> > > > > > > > -		perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
> > > > > > > > -		perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
> > > > > > > > -		perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
> > > > > > > > -	}
> > > > > > > > -
> > > > > > > > +	perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
> > > > > > > > +	perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
> > > > > > > > +	perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
> > > > > > > >      	DRM_DEBUG_ATOMIC(
> > > > > > > >      		"crtc=%d clk_rate=%llu core_ib=%u core_ab=%u\n",
> > > > > > > >      			crtc->base.id, perf->core_clk_rate,
> > > > > > > > @@ -222,18 +209,29 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
> > > > > > > >      {
> > > > > > > >      	struct dpu_core_perf_params perf = { 0 };
> > > > > > > >      	int i, ret = 0;
> > > > > > > > -	u64 avg_bw;
> > > > > > > > +	u32 avg_bw;
> > > > > > > > +	u32 peak_bw;
> > > > > > > >      	if (!kms->num_paths)
> > > > > > > >      		return 0;
> > > > > > > > -	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> > > > > > > > +	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> > > > > > > > +		avg_bw = 0;
> > > > > > > > +		peak_bw = 0;
> > > > > > > > +	} else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
> > > > > > > > +		avg_bw = kms->perf.fix_core_ab_vote;
> > > > > > > > +		peak_bw = kms->perf.fix_core_ib_vote;
> > > > > > > > +	} else {
> > > > > > > > +		dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> > > > > > > > +
> > > > > > > > +		avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
> > > > > > > > +		peak_bw = perf.max_per_pipe_ib;
> > > > > > > > +	}
> > > > > > > > -	avg_bw = perf.bw_ctl;
> > > > > > > > -	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
> > > > > > > > +	avg_bw /= kms->num_paths;
> > > > > > > >      	for (i = 0; i < kms->num_paths; i++)
> > > > > > > > -		icc_set_bw(kms->path[i], avg_bw, perf.max_per_pipe_ib);
> > > > > > > > +		icc_set_bw(kms->path[i], avg_bw, peak_bw);
> > > > > > > >      	return ret;
> > > > > > > >      }
> > > > > > > > 
> > > > > > 
> > > > 
> > 

-- 
With best wishes
Dmitry
