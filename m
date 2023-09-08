Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA343798933
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 16:50:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B10410E8DC;
	Fri,  8 Sep 2023 14:50:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8BD10E8DC;
 Fri,  8 Sep 2023 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7CsbEU9fx8LTBLkq6AyVZmjr235jVh/NHMPa791ymNE=; b=Ft/dtsQy4TfpdFd0Q7WiZLeqmj
 JcbzzSReg13ya9ZpwtvZoVz/vgTZ0ZPUuDrBSE/JKW7jsbzvmqvQFgHyb0IjZz3HLVkSfev+cqKga
 m1W+Z2vzSYISFojiFuj9Gg599Bdi9p5xQTUBkGBIZWzU2X6J24ZRk1sbkv2x7ac04HXZwimWviduo
 A2RUf1nfV8FbiV/7k/5TfFyALkFxEtIdqlx9Of27zthuFuq54Je67BUwtR9wv7lbMhOfExcpAQ8GP
 vNbn1aLnr8pIPcTX4XSCYvFLu7yfVdLxHcodNL1ED+AR98MqUIyu8C5a4hD34SiuK7C7S9jdGNzI7
 0OL3UcjA==;
Received: from [38.44.68.151] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qeco0-001PYn-24; Fri, 08 Sep 2023 16:49:55 +0200
Date: Fri, 8 Sep 2023 13:49:47 -0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v2 33/34] drm/amd/display: add plane CTM support
Message-ID: <20230908144947.ih5z4x6wol2mcrod@mail.igalia.com>
References: <20230810160314.48225-1-mwen@igalia.com>
 <20230810160314.48225-34-mwen@igalia.com>
 <f6903055-5abc-4a1f-9a23-3f9bb9c31c4a@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6903055-5abc-4a1f-9a23-3f9bb9c31c4a@amd.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, kernel-dev@igalia.com,
 Shashank Sharma <Shashank.Sharma@amd.com>, sunpeng.li@amd.com,
 Xinhui.Pan@amd.com, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Joshua Ashton <joshua@froggi.es>,
 sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/06, Harry Wentland wrote:
> 
> 
> On 2023-08-10 12:03, Melissa Wen wrote:
> > Map the plane CTM driver-specific property to DC plane, instead of DC
> > stream. The remaining steps to program DPP block are already implemented
> > on DC shared-code.
> > 
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  1 +
> >  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 25 +++++++++++++++++++
> >  2 files changed, 26 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index dfe61c5ed49e..f239410234b3 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -9578,6 +9578,7 @@ static bool should_reset_plane(struct drm_atomic_state *state,
> >  		if (dm_old_other_state->degamma_tf != dm_new_other_state->degamma_tf ||
> >  		    dm_old_other_state->degamma_lut != dm_new_other_state->degamma_lut ||
> >  		    dm_old_other_state->hdr_mult != dm_new_other_state->hdr_mult ||
> > +		    dm_old_other_state->ctm != dm_new_other_state->ctm ||
> >  		    dm_old_other_state->shaper_lut != dm_new_other_state->shaper_lut ||
> >  		    dm_old_other_state->shaper_tf != dm_new_other_state->shaper_tf ||
> >  		    dm_old_other_state->lut3d != dm_new_other_state->lut3d ||
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > index 86a918ab82be..7ff329101fd4 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > @@ -1158,6 +1158,8 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
> >  				      struct dc_plane_state *dc_plane_state)
> >  {
> >  	struct amdgpu_device *adev = drm_to_adev(crtc->base.state->dev);
> > +	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
> > +	struct drm_color_ctm *ctm = NULL;
> >  	struct dc_color_caps *color_caps = NULL;
> >  	bool has_crtc_cm_degamma;
> >  	int ret;
> > @@ -1209,6 +1211,29 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
> >  			return ret;
> >  	}
> >  
> > +	/* Setup CRTC CTM. */
> > +	if (dm_plane_state->ctm) {
> > +		ctm = (struct drm_color_ctm *)dm_plane_state->ctm->data;
> > +
> > +		/*
> > +		 * So far, if we have both plane and CRTC CTM, plane CTM takes
> > +		 * the priority and we discard data for CRTC CTM, as
> > +		 * implemented in dcn10_program_gamut_remap().  However, we
> 
> Isn't it the opposite? If stream (crtc) has a CTM we program that, only if
> stream doesn't have a CTM we program the plane one?

yeah, you're right. It was an intermediate approach that was discarded.
Indeed, I think I need to rewrite it to better describe that CRTC CTM
priority regarding DPP gamut remap matrix.

Thanks for pointing it out.

Melissa

> 
> Harry
> 
> > +		 * have MPC gamut_remap_matrix from DCN3 family, therefore we
> > +		 * can remap MPC programing of the matrix to MPC block and
> > +		 * provide support for both DPP and MPC matrix at the same
> > +		 * time.
> > +		 */
> > +		__drm_ctm_to_dc_matrix(ctm, dc_plane_state->gamut_remap_matrix.matrix);
> > +
> > +		dc_plane_state->gamut_remap_matrix.enable_remap = true;
> > +		dc_plane_state->input_csc_color_matrix.enable_adjustment = false;
> > +	} else {
> > +		/* Bypass CTM. */
> > +		dc_plane_state->gamut_remap_matrix.enable_remap = false;
> > +		dc_plane_state->input_csc_color_matrix.enable_adjustment = false;
> > +	}
> > +
> >  	return amdgpu_dm_plane_set_color_properties(plane_state,
> >  						    dc_plane_state, color_caps);
> >  }
> 
