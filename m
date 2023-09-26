Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F347AED15
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 14:43:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37BDC10E3C4;
	Tue, 26 Sep 2023 12:43:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB3AF10E3C4;
 Tue, 26 Sep 2023 12:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aZjvoDc64zYePPG5M/5meuIAXgyCszUl8Aqv2Wgmh8w=; b=sFazSm7QSmBYvQE3pqMZNoZfmx
 yeDunOrxZCa0xzaotvki7DiFSUVr4hmA5sElcwYWqxw/zyzPXbI7ch36nYHovCXz2vc5mI7j4vumV
 PvSMVAVVU0gSzgNnIJbc6jmiXguRVn4Oc86myl9WvtO2vpzo4GqAAgT6q5W85lNxKF8idIR/kiA3N
 je/JgIuIogU/d8RlpKjFp/topvk/zj+m94Ilo+tD/omc2EyalSkKt8uAgfmwin45VMnFwVKPpQLPj
 sLIV0m3MNL742J7wxQglW45I741QvlJ4ePumMJWdjNMjnkJ8BPo0tiV0o8WUdDYzrkkprMH06Yh89
 F96Do6CA==;
Received: from [102.213.205.115] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ql7Pi-008Vww-Ka; Tue, 26 Sep 2023 14:43:42 +0200
Date: Tue, 26 Sep 2023 11:43:38 -0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH v2 4/5] drm/amd/display: hook DCN30 color state
 logging to DTN log
Message-ID: <20230926124338.po3d2royboqepwjj@mail.igalia.com>
References: <20230913164329.123687-1-mwen@igalia.com>
 <20230913164329.123687-5-mwen@igalia.com>
 <e05bf889-453b-4d9b-b596-4c5263254fb3@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e05bf889-453b-4d9b-b596-4c5263254fb3@amd.com>
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
Cc: Krunoslav Kovac <krunoslav.kovac@amd.com>, kernel-dev@igalia.com,
 Shashank Sharma <Shashank.Sharma@amd.com>, sunpeng.li@amd.com,
 Xinhui.Pan@amd.com, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/25, Harry Wentland wrote:
> 
> 
> On 2023-09-13 12:43, Melissa Wen wrote:
> > Color caps changed between HW versions which caused DCN10 color state
> > sections on DTN log no longer fit DCN3.0 versions. Create a
> > DCN3.0-specific color state logging and hook it to drivers of DCN3.0
> > family.
> > 
> > rfc-v2:
> > - detail RAM mode for gamcor and blnd gamma blocks
> > 
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >  .../amd/display/dc/dcn10/dcn10_hw_sequencer.c |  5 +-
> >  .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    | 88 +++++++++++++++++++
> >  .../drm/amd/display/dc/dcn30/dcn30_hwseq.h    |  3 +
> >  .../gpu/drm/amd/display/dc/dcn30/dcn30_init.c |  1 +
> >  .../drm/amd/display/dc/dcn301/dcn301_init.c   |  1 +
> >  .../gpu/drm/amd/display/dc/inc/hw_sequencer.h |  2 +
> >  6 files changed, 99 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> > index a0c489ed218c..9255425ef794 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> > @@ -358,7 +358,10 @@ void dcn10_log_hw_state(struct dc *dc,
> >  
> >  	dcn10_log_hubp_states(dc, log_ctx);
> >  
> > -	dcn10_log_color_state(dc, log_ctx);
> > +	if (dc->hwss.log_color_state)
> > +		dc->hwss.log_color_state(dc, log_ctx);
> > +	else
> > +		dcn10_log_color_state(dc, log_ctx);
> >  
> >  	DTN_INFO("OTG:  v_bs  v_be  v_ss  v_se  vpol  vmax  vmin  vmax_sel  vmin_sel  h_bs  h_be  h_ss  h_se  hpol  htot  vtot  underflow blank_en\n");
> >  
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
> > index 255713ec29bb..47119ae80e98 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
> > @@ -69,6 +69,94 @@
> >  #define FN(reg_name, field_name) \
> >  	hws->shifts->field_name, hws->masks->field_name
> >  
> > +void
> > +dcn30_log_color_state(struct dc *dc,
> > +		      struct dc_log_buffer_ctx *log_ctx)
> > +{
> > +	struct dc_context *dc_ctx = dc->ctx;
> > +	struct resource_pool *pool = dc->res_pool;
> > +	int i;
> > +
> > +	DTN_INFO("DPP:  DGAM ROM  DGAM ROM type  DGAM LUT  SHAPER mode"
> > +		 "  3DLUT mode  3DLUT bit depth  3DLUT size  RGAM mode"
> > +		 "  GAMUT mode  "
> > +		 "C11 C12   C13 C14   C21 C22   C23 C24   C31 C32   C33 C34\n");
> > +
> > +	for (i = 0; i < pool->pipe_count; i++) {
> > +		struct dpp *dpp = pool->dpps[i];
> > +		struct dcn_dpp_state s = {0};
> > +
> > +		dpp->funcs->dpp_read_state(dpp, &s);
> > +
> > +		if (!s.is_enabled)
> > +			continue;
> > +
> > +		DTN_INFO("[%2d]:  %7x  %13s  %8s  %11s  %10s  %15s  %10s  %9s"
> > +			 "  %10x  %08xh %08xh %08xh %08xh %08xh %08xh",
> > +			dpp->inst,
> > +			s.pre_dgam_mode,
> > +			(s.pre_dgam_select == 0) ? "sRGB" :
> > +			 ((s.pre_dgam_select == 1) ? "Gamma 2.2" :
> > +			 ((s.pre_dgam_select == 2) ? "Gamma 2.4" :
> > +			 ((s.pre_dgam_select == 3) ? "Gamma 2.6" :
> > +			 ((s.pre_dgam_select == 4) ? "BT.709" :
> > +			 ((s.pre_dgam_select == 5) ? "PQ" :
> > +			 ((s.pre_dgam_select == 6) ? "HLG" :
> > +						     "Unknown")))))),
> > +			(s.gamcor_mode == 0) ? "Bypass" :
> > +			 ((s.gamcor_mode == 1) ? "RAM A" :
> > +						 "RAM B"),
> > +			(s.shaper_lut_mode == 1) ? "RAM A" :
> > +			 ((s.shaper_lut_mode == 2) ? "RAM B" :
> > +						     "Bypass"),
> > +			(s.lut3d_mode == 1) ? "RAM A" :
> > +			 ((s.lut3d_mode == 2) ? "RAM B" :
> > +						"Bypass"),
> > +			(s.lut3d_bit_depth <= 0) ? "12-bit" : "10-bit",
> > +			(s.lut3d_size == 0) ? "17x17x17" : "9x9x9",
> > +			(s.rgam_lut_mode == 0) ? "Bypass" :
> > +			 ((s.rgam_lut_mode == 1) ? "RAM A" :
> > +						   "RAM B"),
> > +			s.gamut_remap_mode,
> > +			s.gamut_remap_c11_c12, s.gamut_remap_c13_c14,
> > +			s.gamut_remap_c21_c22, s.gamut_remap_c23_c24,
> > +			s.gamut_remap_c31_c32, s.gamut_remap_c33_c34);
> > +		DTN_INFO("\n");
> > +	}
> > +	DTN_INFO("\n");
> > +
> > +	DTN_INFO("MPCC:  OPP  DPP  MPCCBOT  MODE  ALPHA_MODE  PREMULT  OVERLAP_ONLY  IDLE"
> > +		 "  SHAPER mode  3DLUT mode  3DLUT bit-depth  3DLUT size  OGAM mode  OGAM LUT"
> > +		 "  GAMUT mode  C11 C12   C33 C34\n");
> > +
> > +	for (i = 0; i < pool->pipe_count; i++) {
> > +		struct mpcc_state s = {0};
> > +
> > +		pool->mpc->funcs->read_mpcc_state(pool->mpc, i, &s);
> > +		if (s.opp_id != 0xf)
> > +			DTN_INFO("[%2d]:  %2xh  %2xh  %6xh  %4d  %10d  %7d  %12d  %4d  %11s %11s %16s %11s %10s %9s"
> > +				 "  %10x %08xh %08xh\n",
> > +				i, s.opp_id, s.dpp_id, s.bot_mpcc_id,
> > +				s.mode, s.alpha_mode, s.pre_multiplied_alpha, s.overlap_only,
> > +				s.idle,
> > +				(s.shaper_lut_mode == 1) ? "RAM A" :
> > +				 ((s.shaper_lut_mode == 2) ? "RAM B" :
> > +							     "Bypass"),
> > +				(s.lut3d_mode == 1) ? "RAM A" :
> > +				 ((s.lut3d_mode == 2) ? "RAM B" :
> > +							"Bypass"),
> > +				(s.lut3d_bit_depth <= 0) ? "12-bit" : "10-bit",
> > +				(s.lut3d_size == 0) ? "17x17x17" : "9x9x9",
> > +				(s.rgam_mode == 0) ? "Bypass" :
> > +				 ((s.rgam_mode == 2) ? "RAM" :
> > +						       "Unknown"),
> > +				(s.rgam_mode == 1) ? "B" : "A",
> > +				s.gamut_remap_mode,
> > +				s.gamut_remap_c11_c12, s.gamut_remap_c33_c34);
> > +	}
> > +	DTN_INFO("\n");
> > +}
> > +
> >  bool dcn30_set_blend_lut(
> >  	struct pipe_ctx *pipe_ctx, const struct dc_plane_state *plane_state)
> >  {
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h
> > index ce19c54097f8..cfb3646d6740 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h
> > @@ -52,6 +52,9 @@ bool dcn30_mmhubbub_warmup(
> >  	unsigned int num_dwb,
> >  	struct dc_writeback_info *wb_info);
> >  
> > +void dcn30_log_color_state(struct dc *dc,
> > +			   struct dc_log_buffer_ctx *log_ctx);
> > +
> >  bool dcn30_set_blend_lut(struct pipe_ctx *pipe_ctx,
> >  		const struct dc_plane_state *plane_state);
> >  
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c
> > index 0de8b2783cf6..58e4d7e1753b 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c
> > @@ -68,6 +68,7 @@ static const struct hw_sequencer_funcs dcn30_funcs = {
> >  	.setup_stereo = dcn10_setup_stereo,
> >  	.set_avmute = dcn30_set_avmute,
> >  	.log_hw_state = dcn10_log_hw_state,
> > +	.log_color_state = dcn30_log_color_state,
> >  	.get_hw_state = dcn10_get_hw_state,
> >  	.clear_status_bits = dcn10_clear_status_bits,
> >  	.wait_for_mpcc_disconnect = dcn10_wait_for_mpcc_disconnect,
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c
> > index 61205cdbe2d5..227e611f25b8 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c
> > @@ -72,6 +72,7 @@ static const struct hw_sequencer_funcs dcn301_funcs = {
> >  	.setup_stereo = dcn10_setup_stereo,
> >  	.set_avmute = dcn30_set_avmute,
> >  	.log_hw_state = dcn10_log_hw_state,
> > +	.log_color_state = dcn30_log_color_state,
> 
> Can we do this for all dcn3+ versions?

Sure, I'll include in the next version. I want to update the color state
log for DCN2+ too, since it also has some specific outputs.

> 
> Harry
> 
> >  	.get_hw_state = dcn10_get_hw_state,
> >  	.clear_status_bits = dcn10_clear_status_bits,
> >  	.wait_for_mpcc_disconnect = dcn10_wait_for_mpcc_disconnect,
> > diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h b/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h
> > index e0dd56182841..a480c1092486 100644
> > --- a/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h
> > +++ b/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h
> > @@ -343,6 +343,8 @@ struct hw_sequencer_funcs {
> >  
> >  	/* HW State Logging Related */
> >  	void (*log_hw_state)(struct dc *dc, struct dc_log_buffer_ctx *log_ctx);
> > +	void (*log_color_state)(struct dc *dc,
> > +				struct dc_log_buffer_ctx *log_ctx);
> >  	void (*get_hw_state)(struct dc *dc, char *pBuf,
> >  			unsigned int bufSize, unsigned int mask);
> >  	void (*clear_status_bits)(struct dc *dc, unsigned int mask);
> 
