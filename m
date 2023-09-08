Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3CC7988A9
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 16:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC5110E077;
	Fri,  8 Sep 2023 14:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC2410E077;
 Fri,  8 Sep 2023 14:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oD02VyAokDurfrZFf/tfrEEr7ulUA834ZVCfV8mMe5I=; b=myhNSfvmLe3eW6kLQsPgJO3zgk
 UC6FgbZ+PrzIkmepKvzH8ZVpIOmhdpX5QZ0ncjKS2EGkx1N+EqO8sgY0NEb7MfIRNhFHNYd0caHW8
 zGTJl0md5+sa2LhF0HxEFXHf1DVCYDzu2XlpeEvk6n4mY0EKHTxt4qVSK28qyRpjAWks2I3ptVbWM
 mnWCCt+8pL8YB2xtFsd5Asnjp2nJH4yS9utfW6Wqm+KUGgxXuSb3KozwXhXgHwyi4mu7zfpLMhiYm
 NBIvwjws3papL6B9pwj6LQ0piMcObnqGYWB5jWYkV8eEh5Ods01PP2aVKaAkXUwi0P1aIkvgTaWMp
 JY7VTyTQ==;
Received: from [38.44.68.151] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qecTO-001P8M-Dr; Fri, 08 Sep 2023 16:28:37 +0200
Date: Fri, 8 Sep 2023 13:28:22 -0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v2 29/34] drm/amd/display: allow newer DC hardware to use
 degamma ROM for PQ/HLG
Message-ID: <20230908142822.ee27buxk4bg3u4vh@mail.igalia.com>
References: <20230810160314.48225-1-mwen@igalia.com>
 <20230810160314.48225-30-mwen@igalia.com>
 <75118b7b-5753-41b0-a9f1-8047d79fa4ad@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75118b7b-5753-41b0-a9f1-8047d79fa4ad@amd.com>
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
> > From: Joshua Ashton <joshua@froggi.es>
> > 
> > Need to funnel the color caps through to these functions so it can check
> > that the hardware is capable.
> > 
> > v2:
> > - remove redundant color caps assignment on plane degamma map (Harry)
> > - pass color caps to degamma params
> > 
> > Signed-off-by: Joshua Ashton <joshua@froggi.es>
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 35 ++++++++++++-------
> >  1 file changed, 22 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > index f638e5b3a70b..4356846a2bce 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > @@ -538,6 +538,7 @@ static int amdgpu_dm_set_atomic_regamma(struct dc_stream_state *stream,
> >  /**
> >   * __set_input_tf - calculates the input transfer function based on expected
> >   * input space.
> > + * @caps: dc color capabilities
> >   * @func: transfer function
> >   * @lut: lookup table that defines the color space
> >   * @lut_size: size of respective lut.
> > @@ -545,7 +546,7 @@ static int amdgpu_dm_set_atomic_regamma(struct dc_stream_state *stream,
> >   * Returns:
> >   * 0 in case of success. -ENOMEM if fails.
> >   */
> > -static int __set_input_tf(struct dc_transfer_func *func,
> > +static int __set_input_tf(struct dc_color_caps *caps, struct dc_transfer_func *func,
> >  			  const struct drm_color_lut *lut, uint32_t lut_size)
> >  {
> >  	struct dc_gamma *gamma = NULL;
> > @@ -562,7 +563,7 @@ static int __set_input_tf(struct dc_transfer_func *func,
> >  		__drm_lut_to_dc_gamma(lut, gamma, false);
> >  	}
> >  
> > -	res = mod_color_calculate_degamma_params(NULL, func, gamma, gamma != NULL);
> > +	res = mod_color_calculate_degamma_params(caps, func, gamma, gamma != NULL);
> >  
> >  	if (gamma)
> >  		dc_gamma_release(&gamma);
> > @@ -725,7 +726,7 @@ static int amdgpu_dm_atomic_blend_lut(const struct drm_color_lut *blend_lut,
> >  		func_blend->tf = tf;
> >  		func_blend->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
> >  
> > -		ret = __set_input_tf(func_blend, blend_lut, blend_size);
> > +		ret = __set_input_tf(NULL, func_blend, blend_lut, blend_size);
> >  	} else {
> >  		func_blend->type = TF_TYPE_BYPASS;
> >  		func_blend->tf = TRANSFER_FUNCTION_LINEAR;
> > @@ -950,7 +951,8 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
> >  
> >  static int
> >  map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
> > -			     struct dc_plane_state *dc_plane_state)
> > +			     struct dc_plane_state *dc_plane_state,
> > +			     struct dc_color_caps *caps)
> >  {
> >  	const struct drm_color_lut *degamma_lut;
> >  	enum dc_transfer_func_predefined tf = TRANSFER_FUNCTION_SRGB;
> > @@ -1005,7 +1007,7 @@ map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
> >  			dc_plane_state->in_transfer_func->tf =
> >  				TRANSFER_FUNCTION_LINEAR;
> >  
> > -		r = __set_input_tf(dc_plane_state->in_transfer_func,
> > +		r = __set_input_tf(caps, dc_plane_state->in_transfer_func,
> >  				   degamma_lut, degamma_size);
> >  		if (r)
> >  			return r;
> > @@ -1018,7 +1020,7 @@ map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
> >  		dc_plane_state->in_transfer_func->tf = tf;
> >  
> >  		if (tf != TRANSFER_FUNCTION_SRGB &&
> > -		    !mod_color_calculate_degamma_params(NULL,
> > +		    !mod_color_calculate_degamma_params(caps,
> >  							dc_plane_state->in_transfer_func,
> >  							NULL, false))
> >  			return -ENOMEM;
> > @@ -1029,7 +1031,8 @@ map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
> >  
> >  static int
> >  __set_dm_plane_degamma(struct drm_plane_state *plane_state,
> > -		       struct dc_plane_state *dc_plane_state)
> > +		       struct dc_plane_state *dc_plane_state,
> > +		       struct dc_color_caps *color_caps)
> >  {
> >  	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
> >  	const struct drm_color_lut *degamma_lut;
> > @@ -1060,7 +1063,7 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
> >  		dc_plane_state->in_transfer_func->type =
> >  			TF_TYPE_DISTRIBUTED_POINTS;
> >  
> > -		ret = __set_input_tf(dc_plane_state->in_transfer_func,
> > +		ret = __set_input_tf(color_caps, dc_plane_state->in_transfer_func,
> >  				     degamma_lut, degamma_size);
> >  		if (ret)
> >  			return ret;
> > @@ -1068,7 +1071,7 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
> >  		dc_plane_state->in_transfer_func->type =
> >  			TF_TYPE_PREDEFINED;
> >  
> > -		if (!mod_color_calculate_degamma_params(NULL,
> > +		if (!mod_color_calculate_degamma_params(color_caps,
> >  		    dc_plane_state->in_transfer_func, NULL, false))
> >  			return -ENOMEM;
> >  	}
> > @@ -1077,7 +1080,8 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
> >  
> >  static int
> >  amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
> > -				     struct dc_plane_state *dc_plane_state)
> > +				     struct dc_plane_state *dc_plane_state,
> > +				     struct dc_color_caps *color_caps)
> 
> This seems unused.

Nice catch, it isn't. I'll remove in the next version.

Melissa

> 
> Harry
> 
> >  {
> >  	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
> >  	enum amdgpu_transfer_function shaper_tf = AMDGPU_TRANSFER_FUNCTION_DEFAULT;
> > @@ -1147,6 +1151,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
> >  				      struct dc_plane_state *dc_plane_state)
> >  {
> >  	struct amdgpu_device *adev = drm_to_adev(crtc->base.state->dev);
> > +	struct dc_color_caps *color_caps = NULL;
> >  	bool has_crtc_cm_degamma;
> >  	int ret;
> >  
> > @@ -1156,6 +1161,9 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
> >  		return ret;
> >  	}
> >  
> > +	if (dc_plane_state->ctx && dc_plane_state->ctx->dc)
> > +		color_caps = &dc_plane_state->ctx->dc->caps.color;
> > +
> >  	/* Initially, we can just bypass the DGM block. */
> >  	dc_plane_state->in_transfer_func->type = TF_TYPE_BYPASS;
> >  	dc_plane_state->in_transfer_func->tf = TRANSFER_FUNCTION_LINEAR;
> > @@ -1163,7 +1171,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
> >  	/* After, we start to update values according to color props */
> >  	has_crtc_cm_degamma = (crtc->cm_has_degamma || crtc->cm_is_degamma_srgb);
> >  
> > -	ret = __set_dm_plane_degamma(plane_state, dc_plane_state);
> > +	ret = __set_dm_plane_degamma(plane_state, dc_plane_state, color_caps);
> >  	if (ret == -ENOMEM)
> >  		return ret;
> >  
> > @@ -1189,10 +1197,11 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
> >  		 * linearize (implicit degamma) from sRGB/BT709 according to
> >  		 * the input space.
> >  		 */
> > -		ret = map_crtc_degamma_to_dc_plane(crtc, dc_plane_state);
> > +		ret = map_crtc_degamma_to_dc_plane(crtc, dc_plane_state, color_caps);
> >  		if (ret)
> >  			return ret;
> >  	}
> >  
> > -	return amdgpu_dm_plane_set_color_properties(plane_state, dc_plane_state);
> > +	return amdgpu_dm_plane_set_color_properties(plane_state,
> > +						    dc_plane_state, color_caps);
> >  }
> 
