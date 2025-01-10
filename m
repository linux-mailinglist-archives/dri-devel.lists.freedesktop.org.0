Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F09E9A08530
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 03:10:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A99D10EF70;
	Fri, 10 Jan 2025 02:10:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RGvHc/oF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E2610EF72
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 02:10:27 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-3003d7ca01cso14602191fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 18:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736475026; x=1737079826; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HuF+PDTZLa51ksUbL9ys8lpiPzQDblZtDnsaGpEQ4Pk=;
 b=RGvHc/oFWa1KkLB1aiRoso2r67BMUpFwNcNsHP8CRq5vQkvJrs66+d1324tZyT1hUe
 LVBJcbu8/vsZq08+SdK0/bWLk3r+QFj6S2OhSaGNGMLE3HYnAGsoGJKF19AjywZvFnEH
 OuPkiTWp7C7fB0C/4LcfoDsm6CDpkGT3f9XJRnBcblbtM4kC0uq5KmrGtqx/aD7A6ANI
 XBOPxA47hq1+V6+1l8REmYhXk8OZ9ZA3HzPzrJPOaLUXlANBUl4R0AAN1S85yNJnF4RK
 Jshusr0Ra2GHeyJXkf0aRnnZ1UVdOVH/ieZPGiWKTc7+392kk6KS8kp+GnDqmM/WV/n5
 tPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736475026; x=1737079826;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HuF+PDTZLa51ksUbL9ys8lpiPzQDblZtDnsaGpEQ4Pk=;
 b=G5aKP4PVVrGT40sQZK09tBW57jSCaKYa7Az/+YWgC5Zz5bnFtlrt8zul9Kl1POpMDv
 2u6xjBQDKE9FG6o4Hq2LzlGhJe1MVYzvqDKfLBADUdD0mIKWizi2YzZE6D4gFs8pDcMB
 vKaki+3nF4alB3YUHZ3zMjp8168hmP93wTwXLbY9VxU6zdErHI04jNTCapL1RrYc34BG
 gAE9j0axSLFo19xUStojWvSln5cncgswadOnqdNmSGY6pNKkC77+7OPEWlMOdP+r9fYY
 OZv2Q0wQMZQvDU3BZNrfEyGA3dbqNbKugOHd4HpLYbw5lC8uCqZ3TFjacyeatbwpXbQ8
 3STA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUS9V+XM4rnEREhm8rtZhe1kqWHGDke5QcKwPs0+sAW7CRV9UqYihxqGIXcRuW+wvmIGuLZ4HXuF5Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjWZ6WUuCTd0rzxsI6RTzS2HI7pn2RYsrwHP28yEw/Jddf+CGk
 tDCAaZEKDSqsRU+KV/RGg/fQmeEvnHp7LZMPw61RWLqXOTtgZvWgX+QjI6rwyJc=
X-Gm-Gg: ASbGncvYNC+QgiMn+eyMKy0EF3xs7nzRMKLBIQglsVd2oOzCLbESy9dQHe3e7eMtBkL
 hHTQJonDvE7CBpeFp6keSnwhRQdeh8HX2YsVyo8fYKgItloc42jiJQKMCK8rK5q27utNXbvJBMA
 LK6nIllVkQ1G/vGUFtI7LW3yePbomJZVsB3dhyrMFPDLGM9KDrm+ib7nJWkwN8B47fnF1tyB3Hi
 cIg+B8Wvd5PbqURjpOSBmLK/6EPkqkmyrHO+oOG9fKQKz6SYDQFSPALZfvvBNMYxDvT1G6F1n1U
 LcdH+ChcUl9hjTxmcjzB09bzufkq0zympAZe
X-Google-Smtp-Source: AGHT+IHIdXNP0uDJYI6s6RzE9hHm7Ve5TI47ub1eVeneAydvG48x9Ku9A8XERv0pX/THyzQY39IZ4g==
X-Received: by 2002:a2e:a544:0:b0:302:3c78:4e17 with SMTP id
 38308e7fff4ca-305f45ce4dcmr27587431fa.29.1736475025879; 
 Thu, 09 Jan 2025 18:10:25 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff1ec57csm3442351fa.104.2025.01.09.18.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 18:10:24 -0800 (PST)
Date: Fri, 10 Jan 2025 04:10:22 +0200
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
Subject: Re: [PATCH v4 15/25] drm/msm/dpu: Add CWB to msm_display_topology
Message-ID: <657hmty7qisg74pugmgxz4y4idze65ddozm25vnizcavqsubov@fk56ijbl23uv>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-15-fe220297a7f0@quicinc.com>
 <ki35rornnos35r3fzg5yyqzxnqua3dyfb6ewq2aefrh4u74vfi@opdnf44ntten>
 <4069bd6a-c37f-4dbe-bbd6-5b333ee54ad8@quicinc.com>
 <a4akor2liqafta53zeev22x2pkqwzo5szwidr2ruzdvttvze5h@jtio3jue7ez3>
 <e47b33e6-142d-42d6-8ae9-f2d2c7793d18@quicinc.com>
 <wheu3izj3pit6k3cmslpyegunmrcryy65y5eu432nec2y2aor6@kda3xnujhtnm>
 <0b741278-7c81-406b-bd28-e0cb9252e459@quicinc.com>
 <CAA8EJpogbq+iU-PA_ZXkTzU-1+MLaeLUaXWt_D+hTYnJ5_26Ew@mail.gmail.com>
 <fbba6424-f831-4cc5-8ed7-f508722c86bd@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbba6424-f831-4cc5-8ed7-f508722c86bd@quicinc.com>
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

On Thu, Jan 09, 2025 at 05:50:16PM -0800, Jessica Zhang wrote:
> 
> 
> On 1/9/2025 5:42 PM, Dmitry Baryshkov wrote:
> > On Fri, 10 Jan 2025 at 02:30, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> > > 
> > > 
> > > 
> > > On 1/9/2025 4:00 PM, Dmitry Baryshkov wrote:
> > > > On Thu, Jan 09, 2025 at 02:34:44PM -0800, Jessica Zhang wrote:
> > > > > 
> > > > > 
> > > > > On 1/3/2025 10:16 AM, Dmitry Baryshkov wrote:
> > > > > > On Fri, Jan 03, 2025 at 10:03:35AM -0800, Jessica Zhang wrote:
> > > > > > > 
> > > > > > > 
> > > > > > > On 12/19/2024 9:03 PM, Dmitry Baryshkov wrote:
> > > > > > > > On Mon, Dec 16, 2024 at 04:43:26PM -0800, Jessica Zhang wrote:
> > > > > > > > > Add the cwb_enabled flag to msm_display topology and adjust the toplogy
> > > > > > > > > to account for concurrent writeback
> > > > > > > > 
> > > > > > > > Why?
> > > > > > > 
> > > > > > > Hi Dmitry,
> > > > > > > 
> > > > > > > This flag is necessary to specify that CWB mux(es) need to be assigned for
> > > > > > > the given reqeusted topology.
> > > > > > 
> > > > > > Why is necessary? Please rephrase your statement (we need foo bar, so do
> > > > > > baz).
> > > > > 
> > > > > Ack, what do you think of rephrasing the commit msg to this:
> > > > > 
> > > > > ```
> > > > > Add support for adjusting topology based on if concurrent writeback is
> > > > > enabled.
> > > > > 
> > > > > Currently, the topology is calculated based on the assumption that the user
> > > > > cannot request real-time and writeback simultaneously. For example, the
> > > > > number of LMs and CTLs are currently based off the number of phys encoders
> > > > > under the assumption there will be at least 1 LM/CTL per phys encoder.
> > > > > 
> > > > > This will not hold true for concurrent writeback as 2 phys encoders (1
> > > > > real-time and 1 writeback) can be driven by 1 LM/CTL when concurrent
> > > > > writeback is enabled.
> > > > > 
> > > > > To account for this, add a cwb_enabled flag and only adjust the number of
> > > > > CTL/LMs needed by a given topology based on the number of phys encoders only
> > > > > if CWB is not enabled.
> > > > > 
> > > > > ```
> > > > > 
> > > > > > 
> > > > > > > 
> > > > > > > > 
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > > > > > > > ---
> > > > > > > > >      drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 11 ++++++++++-
> > > > > > > > >      drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c   | 10 ++++++++--
> > > > > > > > >      drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h   |  2 ++
> > > > > > > > >      3 files changed, 20 insertions(+), 3 deletions(-)
> > > > > > > > > 
> > > > > > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > > > > > index b4bfded3d53025853cee112ca598533ece290318..b063c8fe4c0594772d84401fa56c9c21afc0ad18 100644
> > > > > > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > > > > > @@ -1198,6 +1198,8 @@ static struct msm_display_topology dpu_crtc_get_topology(
> > > > > > > > >                   dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
> > > > > > > > >                                               &crtc_state->adjusted_mode);
> > > > > > > > > +        topology.cwb_enabled = drm_crtc_in_clone_mode(crtc_state);
> > > > > > > > > +
> > > > > > > > >           /*
> > > > > > > > >            * Datapath topology selection
> > > > > > > > >            *
> > > > > > > > > @@ -1209,9 +1211,16 @@ static struct msm_display_topology dpu_crtc_get_topology(
> > > > > > > > >            * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
> > > > > > > > >            *
> > > > > > > > >            * Add dspps to the reservation requirements if ctm is requested
> > > > > > > > > +         *
> > > > > > > > > +         * Only hardcode num_lm to 2 for cases where num_intf == 2 and CWB is not
> > > > > > > > > +         * enabled. This is because in cases where CWB is enabled, num_intf will
> > > > > > > > > +         * count both the WB and real-time phys encoders.
> > > > > > > > > +         *
> > > > > > > > > +         * For non-DSC CWB usecases, have the num_lm be decided by the
> > > > > > > > > +         * (mode->hdisplay > MAX_HDISPLAY_SPLIT) check.
> > > > > > > > >            */
> > > > > > > > > -        if (topology.num_intf == 2)
> > > > > > > > > +        if (topology.num_intf == 2 && !topology.cwb_enabled)
> > > > > > > > >                   topology.num_lm = 2;
> > > > > > > > >           else if (topology.num_dsc == 2)
> > > > > > > > >                   topology.num_lm = 2;
> > > > > > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > > > > > > > index b763ef19f4c60ae8a35df6a6ffb19e8411bc63f8..85adaf256b2c705d2d7df378b6ffc0e578f52bc3 100644
> > > > > > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > > > > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > > > > > > > @@ -382,8 +382,14 @@ static int _dpu_rm_reserve_ctls(
> > > > > > > > >           int i = 0, j, num_ctls;
> > > > > > > > >           bool needs_split_display;
> > > > > > > > > -        /* each hw_intf needs its own hw_ctrl to program its control path */
> > > > > > > > > -        num_ctls = top->num_intf;
> > > > > > > > > +        /*
> > > > > > > > > +         * For non-CWB mode, each hw_intf needs its own hw_ctl to program its
> > > > > > > > > +         * control path. Hardcode num_ctls to 1 if CWB is enabled
> > > > > > > > > +         */
> > > > > > > > 
> > > > > > > > Why?
> > > > > > > 
> > > > > > > This is because num_intf is based on the number of phys_encs. Since in the
> > > > > > > CWB case, the WB and real-time encoders will be driven by the same CTL. I
> > > > > > > can add this to the comment doc.
> > > > > > 
> > > > > > Why are they driven by the same CTL? Is it also the case for platforms
> > > > > > before DPU 5.x?
> > > > > 
> > > > > This is because the WB and real-time path for a given topology would be
> > > > > driven by the same data path so the same CTL should enable the real-time and
> > > > > WB active bits.
> > > > > 
> > > > > This is the same for pre-DPU 5.x.
> > > > 
> > > > But pre-5.x platforms didn't have ACTIVE_CTL, so they should be using
> > > > separte CTL for each of the physical encoders.
> > > 
> > > For pre-DPU 5.x, enabling CWB would mean configuring the registers under
> > > both the WB and MODE_SEL_* cases here [1]
> > 
> > But do we still have to use a single CTL or would we use two different
> > CTLs, one for the main output and one for WB?
> 
> We would have to enable both WB and the real-time output on the same CTL

Thanks for the confirmation. Then the text your wrote above should be
mostly okay. Please drop the first ("Add support...") sentence and s/can
be driven by/must be driven by/ .

> 
> > 
> > > 
> > > [1]
> > > https://elixir.bootlin.com/linux/v6.12.6/source/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c#L588
> > > 
> > > > 
> > > > > 
> > > > > > 
> > > > > > > 
> > > > > > > Thanks,
> > > > > > > 
> > > > > > > Jessica Zhang
> > > > > > > 
> > > > > > > > 
> > > > > > > > > +        if (top->cwb_enabled)
> > > > > > > > > +                num_ctls = 1;
> > > > > > > > > +        else
> > > > > > > > > +                num_ctls = top->num_intf;
> > > > > > > > >           needs_split_display = _dpu_rm_needs_split_display(top);
> > > > > > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > > > > > > > > index b061dfdab52e04ab7d777e912a30173273cb3db7..12db21a2403ec6930894c36a58e898c5d94c2568 100644
> > > > > > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > > > > > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > > > > > > > > @@ -46,6 +46,7 @@ struct dpu_rm {
> > > > > > > > >       * @num_dspp:     number of dspp blocks used
> > > > > > > > >       * @num_dsc:      number of Display Stream Compression (DSC) blocks used
> > > > > > > > >       * @needs_cdm:    indicates whether cdm block is needed for this display topology
> > > > > > > > > + * @cwb_enabled:  indicates whether CWB is enabled for this display topology
> > > > > > > > >       */
> > > > > > > > >      struct msm_display_topology {
> > > > > > > > >           u32 num_lm;
> > > > > > > > > @@ -53,6 +54,7 @@ struct msm_display_topology {
> > > > > > > > >           u32 num_dspp;
> > > > > > > > >           u32 num_dsc;
> > > > > > > > >           bool needs_cdm;
> > > > > > > > > +        bool cwb_enabled;
> > > > > > > > >      };
> > > > > > > > >      int dpu_rm_init(struct drm_device *dev,
> > > > > > > > > 
> > > > > > > > > --
> > > > > > > > > 2.34.1
> > > > > > > > > 
> > > > > > > > 
> > > > > > > > --
> > > > > > > > With best wishes
> > > > > > > > Dmitry
> > > > > > > 
> > > > > > 
> > > > > > --
> > > > > > With best wishes
> > > > > > Dmitry
> > > > > 
> > > > 
> > > > --
> > > > With best wishes
> > > > Dmitry
> > > 
> > 
> > 
> > -- 
> > With best wishes
> > Dmitry
> 

-- 
With best wishes
Dmitry
