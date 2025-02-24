Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E80A41F41
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 13:38:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9FF10E0C0;
	Mon, 24 Feb 2025 12:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB6510E0C0;
 Mon, 24 Feb 2025 12:38:34 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 64D8D1F554;
 Mon, 24 Feb 2025 13:38:24 +0100 (CET)
Date: Mon, 24 Feb 2025 13:38:22 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] drm/msm/dpu: allocate single CTL for DPU >= 5.0
Message-ID: <n6cljmchentiycfbnlxoptl6gtrv5n5353gdmvbrrssfp7mkiy@lenjcbxn732p>
References: <20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org>
 <20250220-dpu-active-ctl-v1-6-71ca67a564f8@linaro.org>
 <4aix26abutkas2fpj6ubu2hbqeljpgr5e3m24akeb3jz33limj@c7rymwz6zmft>
 <7vcnej2hh3knti66dfyatbcyrlygbwqtwdlumpf4aqmupuopcf@pcpkbn6fs4h4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7vcnej2hh3knti66dfyatbcyrlygbwqtwdlumpf4aqmupuopcf@pcpkbn6fs4h4>
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

On 2025-02-21 01:58:58, Dmitry Baryshkov wrote:
> On Fri, Feb 21, 2025 at 12:34:12AM +0100, Marijn Suijten wrote:
> > On 2025-02-20 12:26:23, Dmitry Baryshkov wrote:
> > > Unlike previous generation, since DPU 5.0 it is possible to use just one
> > > CTL to handle all INTF and WB blocks for a single output. And one has to
> > > use single CTL to support bonded DSI config. Allocate single CTL for
> > > these DPU versions.
> > > 
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 17 +++++++++++++----
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h |  2 ++
> > >  2 files changed, 15 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > index 5baf9df702b84b74ba00e703ad3cc12afb0e94a4..4dbc9bc7eb4f151f83055220665ee5fd238ae7ba 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > @@ -53,6 +53,8 @@ int dpu_rm_init(struct drm_device *dev,
> > >  	/* Clear, setup lists */
> > >  	memset(rm, 0, sizeof(*rm));
> > >  
> > > +	rm->has_legacy_ctls = (cat->mdss_ver->core_major_ver < 5);
> > > +
> > >  	/* Interrogate HW catalog and create tracking items for hw blocks */
> > >  	for (i = 0; i < cat->mixer_count; i++) {
> > >  		struct dpu_hw_mixer *hw;
> > > @@ -381,10 +383,16 @@ static int _dpu_rm_reserve_ctls(
> > >  	int i = 0, j, num_ctls;
> > >  	bool needs_split_display;
> > >  
> > > -	/* each hw_intf needs its own hw_ctrl to program its control path */
> > > -	num_ctls = top->num_intf;
> > > +	if (rm->has_legacy_ctls) {
> > > +		/* each hw_intf needs its own hw_ctrl to program its control path */
> > > +		num_ctls = top->num_intf;
> > >  
> > > -	needs_split_display = _dpu_rm_needs_split_display(top);
> > > +		needs_split_display = _dpu_rm_needs_split_display(top);
> > > +	} else {
> > > +		/* use single CTL */
> > > +		num_ctls = 1;
> > > +		needs_split_display = false;
> > > +	}
> > >  
> > >  	for (j = 0; j < ARRAY_SIZE(rm->ctl_blks); j++) {
> > >  		const struct dpu_hw_ctl *ctl;
> > > @@ -402,7 +410,8 @@ static int _dpu_rm_reserve_ctls(
> > >  
> > >  		DPU_DEBUG("ctl %d caps 0x%lX\n", j + CTL_0, features);
> > >  
> > > -		if (needs_split_display != has_split_display)
> > > +		if (rm->has_legacy_ctls &&
> > > +		    needs_split_display != has_split_display)
> > 
> > I deduced a long time ago that the check for rm->has_legacy_ctls is not needed.
> > 
> > needs_split_display is always false on DPU >= 5, and neither of those SoCs has
> > DPU_CTRL_SPLIT_DISPLAY which means false != false is false, and this condition
> > never triggers on active CTLs even without checking has_legacy_ctls.
> 
> During the transition time of 1 or 2 patches there is a window of
> DPU >= 5 and DPU_CTRL_SPLIT_DISPLAY.

Correct, but would there be any harm in reordering the patches?  Before this
patch DPU_CTL_SPLIT_DISPLAY seems to have caused wrongfully allocating multiple
CTLs when multiple intfs are requested anyway.

- Marijn

> > Other than that, this is all successfully tested and:
> > 
> > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> > 
> > >  			continue;
> > >  
> > >  		ctl_idx[i] = j;
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > > index 99bd594ee0d1995eca5a1f661b15e24fdf6acf39..130f753c36338544e84a305b266c3b47fa028d84 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > > @@ -24,6 +24,7 @@ struct dpu_global_state;
> > >   * @dspp_blks: array of dspp hardware resources
> > >   * @hw_sspp: array of sspp hardware resources
> > >   * @cdm_blk: cdm hardware resource
> > > + * @has_legacy_ctls: DPU uses pre-ACTIVE CTL blocks.
> > >   */
> > >  struct dpu_rm {
> > >  	struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
> > > @@ -37,6 +38,7 @@ struct dpu_rm {
> > >  	struct dpu_hw_blk *dsc_blks[DSC_MAX - DSC_0];
> > >  	struct dpu_hw_sspp *hw_sspp[SSPP_MAX - SSPP_NONE];
> > >  	struct dpu_hw_blk *cdm_blk;
> > > +	bool has_legacy_ctls;
> > >  };
> > >  
> > >  struct dpu_rm_sspp_requirements {
> > > 
> > > -- 
> > > 2.39.5
> > > 
> 
> -- 
> With best wishes
> Dmitry
