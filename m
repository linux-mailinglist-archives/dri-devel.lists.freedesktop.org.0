Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F43A0647A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 19:33:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0009410E31B;
	Wed,  8 Jan 2025 18:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cZi69Eg2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1225C10E0D1
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 18:33:31 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-3022484d4e4so31921fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 10:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736361149; x=1736965949; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0T+0mL7iv46IwFlcF+LpDNgC3tlPvqLC5ee3E8FWwhI=;
 b=cZi69Eg2Zj3br/rZWnildjWVaq+I6jGWCbHxJmtHIR9jWnvG8ZA2v3fs9GHU0P6NsW
 tqHmv18td8/ktr4iQQ2+T3y8ztCzLGXjcsCq1Bha7M6HkADKPlFssWGDwYjsO8hqOZbh
 mrmUZc+0IBEWM8vn53cQsTVUVahcIlE1Zaxq2Emk3H5Kms+S6j9aXQ090ijTzqCuem//
 KR3CrbhqT7oUeX5cYwH0JvUKfrae8ghfqhL/PDeo0k7+xiLosjVj3zOBFsZJtev+ltoR
 QNQhz+mUxzuokuOSyMhRQt5w7aEQscrPXXSDJdCaoQcYmOLxLiCDZIdN+9D6cblRnjwa
 s1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736361149; x=1736965949;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0T+0mL7iv46IwFlcF+LpDNgC3tlPvqLC5ee3E8FWwhI=;
 b=EG6+FEeo2cGQSHJOe/6OStgfMoni6RLmVpCu0cGwNfnuxBIcKBGPLagpgAmyEjou3a
 mtPmM33E4uMQUGql5BaX3VB+YnIdonobke790ja1iQF0MxD5J9Dg1fJB1MU7qwBLLFdG
 Y3oS3/pLB2oM88ug8TGauUv9Pj5hRcMm1d60C4ytszQ8mzV/mvA4DYb5xGPLilbr2Mh+
 WW7B5d46szA9OsqjiTBYOMjDVOpyT3R0DfzWTQWnE1GaZfuuCbtNhj8Kvb3RdOS3F3nZ
 gB2UyhIrXvAEESn4+NKdPw4jsi4c0feqf29z/m8fMd4Qgejt1mVwXmvt5aqmT6WcysJS
 XwcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXimBJSLbCQzjEZGJraNp2pu8KenTFt+/H9toauCb1a23J8JK/ij1Z4jr2DMQuzdajH5DvSozqaYo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzbQzNfM8gINGbb2Xo5sjq3nBXYQwa88fGHaQ6HZXGzDFOzuso
 EZ7ZOO2vPsQVDB/WYaw9qfWu3gV4t58j90xx4tTlWph/hsZ1GLU6DG3Lsw+4sJiZf/NY8DL4ZTg
 5
X-Gm-Gg: ASbGncvPEwhKZspYhyvV/mZV+oYx5hhMruHjsPOMWI7uj4Bv/nnpYxBqiYvt3PwFsmG
 X7E0b4ASWRWum3npRV40flueceHyQyX4l+4GPYp1DlTfszh1K1fy+YSbcnwGDYzgC49JXpWr96U
 NL2cjsOreDdgv+C0yAP0pmsQgzKIBgntRI97JZaUX0qJmY36Kmb5Oo8FVv8bLuuSx7dc4cNnVqz
 rYmUTLGdyl7zHPxrJiEqRsJ2cfHK2hof0gxTrXdI+Oc6wBwNY0gw8gJUdQx10pDxpb3SyIiLFuV
 lx+PktoIRRErc0rL+uBX009IEqLfrZhbBHKy
X-Google-Smtp-Source: AGHT+IG1xpbnZieMEXVc7bFuqI0b6Whc2XStjuLNuTmGUWrDF/JGwR78uXx5jK01HIrhoMocaKNhAQ==
X-Received: by 2002:a05:651c:556:b0:302:3356:7c55 with SMTP id
 38308e7fff4ca-305f454741fmr8733161fa.10.1736361149182; 
 Wed, 08 Jan 2025 10:32:29 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045b06a467sm63142631fa.90.2025.01.08.10.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 10:32:27 -0800 (PST)
Date: Wed, 8 Jan 2025 20:32:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Archit Taneja <architt@codeaurora.org>, Rajesh Yadav <ryadav@codeaurora.org>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 2/6] drm/atomic: prepare to check that drivers follow
 restrictions for needs_modeset
Message-ID: <qiqmaotvdfnq66oth6eqcun5n7stmfyw7zyyjxxlh72gst722a@t6zb764t2ttz>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
 <20241222-drm-dirty-modeset-v1-2-0e76a53eceb9@linaro.org>
 <Z367rzpzt00F0sK9@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z367rzpzt00F0sK9@phenom.ffwll.local>
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

On Wed, Jan 08, 2025 at 06:53:51PM +0100, Simona Vetter wrote:
> On Sun, Dec 22, 2024 at 07:00:42AM +0200, Dmitry Baryshkov wrote:
> > Some drivers might fail to follow the restrictions documented for
> > drm_atomic_helper_check_modesets(). In order to catch such an issues,
> > add the drm_atomic_state->dirty_needs_modeset field and check it in
> > drm_atomic_check_only(). Make sure that neither of atomic_check()
> > callbacks can set that field without calling
> > drm_atomic_helper_check_modesets() again.
> > 
> > Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Thanks a lot of creating this patch. But looking at it I'm not so sure I
> actually had a good idea, since there's still lots of ways for drivers to
> change drm_atomic_crtc_needs_modeset() that we miss. And trying to use an
> inverted bitfield of all crtc that we've run through in check_modeset, and
> then in atomic_check_only compare it against all crtc that need a modeset
> also has corner cases it gets wrong I think, like just not using the
> helpers in specific case, I think something like i915's fastset would trip
> that.

I think we should try to get something merged. I mean, the documentation
was there, but it didn't prevent driver authors from being creative, as
you wrote. So, having false negatives should be fine. We just have not
to trigger false warning reports. I will try giving it another tought.

> 
> Plus there's lots more corners that drivers have gotten creatively wrong,
> so I feel like really clear docs is the best we can do.
> 
> So unless you think it was really useful to fix msm I feel like best to
> skip this. Apologies for making you put work in here :-/

I think it's useful to prevent us (authors) from doing nasty things :-/

> -Sima
> 
> > ---
> >  drivers/gpu/drm/drm_atomic.c        |  3 ++
> >  drivers/gpu/drm/drm_atomic_helper.c | 77 +++++++++++++++++++++++++++++++++----
> >  include/drm/drm_atomic.h            | 10 +++++
> >  3 files changed, 82 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> > index 9ea2611770f43ce7ccba410406d5f2c528aab022..202e4e64bd31921d0a4d4b86605b501311e14c33 100644
> > --- a/drivers/gpu/drm/drm_atomic.c
> > +++ b/drivers/gpu/drm/drm_atomic.c
> > @@ -1449,6 +1449,9 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
> >  		}
> >  	}
> >  
> > +	WARN_RATELIMIT(state->dirty_needs_modeset,
> > +		       "Driver changed needs_modeset under drm_atomic_helper_check_modeset()");
> > +

Maybe it should be drm_warn or drm_info for now, instead of full WARN().

> >  	if (!state->allow_modeset) {
> >  		for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
> >  			if (drm_atomic_crtc_needs_modeset(new_crtc_state)) {
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > index f26887c3fe8b194137200f9f2426653274c50fda..2c62840416f4b807d6a880b5c30ae024a16af528 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -433,6 +433,7 @@ mode_fixup(struct drm_atomic_state *state)
> >  
> >  	for_each_new_connector_in_state(state, connector, new_conn_state, i) {
> >  		const struct drm_encoder_helper_funcs *funcs;
> > +		bool old_needs_modeset = false;
> >  		struct drm_encoder *encoder;
> >  		struct drm_bridge *bridge;
> >  
> > @@ -451,6 +452,9 @@ mode_fixup(struct drm_atomic_state *state)
> >  		encoder = new_conn_state->best_encoder;
> >  		funcs = encoder->helper_private;
> >  
> > +		if (new_crtc_state)
> > +			old_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
> > +
> >  		bridge = drm_bridge_chain_get_first_bridge(encoder);
> >  		ret = drm_atomic_bridge_chain_check(bridge,
> >  						    new_crtc_state,
> > @@ -479,6 +483,12 @@ mode_fixup(struct drm_atomic_state *state)
> >  				return -EINVAL;
> >  			}
> >  		}
> > +
> > +		if (new_crtc_state) {
> > +			bool new_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
> > +
> > +			state->dirty_needs_modeset |= (new_needs_modeset != old_needs_modeset);
> > +		}
> >  	}
> >  
> >  	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
> > @@ -574,6 +584,36 @@ mode_valid(struct drm_atomic_state *state)
> >  	return 0;
> >  }
> >  
> > +static int
> > +connector_atomic_check(struct drm_atomic_state *state,
> > +		       struct drm_connector *connector,
> > +		       struct drm_connector_state *old_connector_state,
> > +		       struct drm_connector_state *new_connector_state)
> > +{
> > +	const struct drm_connector_helper_funcs *funcs = connector->helper_private;
> > +	struct drm_crtc_state *new_crtc_state;
> > +	bool old_needs_modeset = false;
> > +	int ret;
> > +
> > +	if (new_connector_state->crtc)
> > +		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_connector_state->crtc);
> > +	if (new_crtc_state)
> > +		old_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
> > +
> > +	if (funcs->atomic_check)
> > +		ret = funcs->atomic_check(connector, state);
> > +	else
> > +		ret = 0;
> > +
> > +	if (new_crtc_state) {
> > +		bool new_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
> > +
> > +		state->dirty_needs_modeset |= (new_needs_modeset != old_needs_modeset);
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> >  /**
> >   * drm_atomic_helper_check_modeset - validate state object for modeset changes
> >   * @dev: DRM device
> > @@ -628,6 +668,8 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
> >  	int i, ret;
> >  	unsigned int connectors_mask = 0, user_connectors_mask = 0;
> >  
> > +	state->dirty_needs_modeset = false;
> > +
> >  	for_each_oldnew_connector_in_state(state, connector, old_connector_state, new_connector_state, i)
> >  		user_connectors_mask |= BIT(i);
> >  
> > @@ -683,8 +725,6 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
> >  		return ret;
> >  
> >  	for_each_oldnew_connector_in_state(state, connector, old_connector_state, new_connector_state, i) {
> > -		const struct drm_connector_helper_funcs *funcs = connector->helper_private;
> > -
> >  		WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex));
> >  
> >  		/*
> > @@ -710,8 +750,8 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
> >  				new_crtc_state->connectors_changed = true;
> >  		}
> >  
> > -		if (funcs->atomic_check)
> > -			ret = funcs->atomic_check(connector, state);
> > +		ret = connector_atomic_check(state, connector,
> > +					     old_connector_state, new_connector_state);
> >  		if (ret) {
> >  			drm_dbg_atomic(dev,
> >  				       "[CONNECTOR:%d:%s] driver check failed\n",
> > @@ -752,13 +792,11 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
> >  	 * has been called on them when a modeset is forced.
> >  	 */
> >  	for_each_oldnew_connector_in_state(state, connector, old_connector_state, new_connector_state, i) {
> > -		const struct drm_connector_helper_funcs *funcs = connector->helper_private;
> > -
> >  		if (connectors_mask & BIT(i))
> >  			continue;
> >  
> > -		if (funcs->atomic_check)
> > -			ret = funcs->atomic_check(connector, state);
> > +		ret = connector_atomic_check(state, connector,
> > +					     old_connector_state, new_connector_state);
> >  		if (ret) {
> >  			drm_dbg_atomic(dev,
> >  				       "[CONNECTOR:%d:%s] driver check failed\n",
> > @@ -994,6 +1032,7 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
> >  
> >  	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
> >  		const struct drm_plane_helper_funcs *funcs;
> > +		bool old_needs_modeset = false;
> >  
> >  		WARN_ON(!drm_modeset_is_locked(&plane->mutex));
> >  
> > @@ -1006,6 +1045,12 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
> >  		if (!funcs || !funcs->atomic_check)
> >  			continue;
> >  
> > +		if (new_plane_state->crtc)
> > +			new_crtc_state = drm_atomic_get_new_crtc_state(state,
> > +								       new_plane_state->crtc);
> > +		if (new_crtc_state)
> > +			old_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
> > +
> >  		ret = funcs->atomic_check(plane, state);
> >  		if (ret) {
> >  			drm_dbg_atomic(plane->dev,
> > @@ -1013,16 +1058,26 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
> >  				       plane->base.id, plane->name);
> >  			return ret;
> >  		}
> > +
> > +		if (new_crtc_state) {
> > +			bool new_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
> > +
> > +			state->dirty_needs_modeset |= (new_needs_modeset != old_needs_modeset);
> > +		}
> >  	}
> >  
> >  	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
> >  		const struct drm_crtc_helper_funcs *funcs;
> > +		bool old_needs_modeset = false;
> >  
> >  		funcs = crtc->helper_private;
> >  
> >  		if (!funcs || !funcs->atomic_check)
> >  			continue;
> >  
> > +		if (new_crtc_state)
> > +			old_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
> > +
> >  		ret = funcs->atomic_check(crtc, state);
> >  		if (ret) {
> >  			drm_dbg_atomic(crtc->dev,
> > @@ -1030,6 +1085,12 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
> >  				       crtc->base.id, crtc->name);
> >  			return ret;
> >  		}
> > +
> > +		if (new_crtc_state) {
> > +			bool new_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
> > +
> > +			state->dirty_needs_modeset |= (new_needs_modeset != old_needs_modeset);
> > +		}
> >  	}
> >  
> >  	return ret;
> > diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> > index 31ca88deb10d262fb3a3f8e14d2afe24f8410cb1..7b0dbd3c8a3df340399a458aaf79263f0fdc24e5 100644
> > --- a/include/drm/drm_atomic.h
> > +++ b/include/drm/drm_atomic.h
> > @@ -408,6 +408,16 @@ struct drm_atomic_state {
> >  	 */
> >  	bool duplicated : 1;
> >  
> > +	/**
> > +	 * @dirty_needs_modeset:
> > +	 *
> > +	 * Indicates whether the drm_atomic_crtc_needs_modeset() changed in an
> > +	 * unexpected way. Usually this means that driver implements atomic
> > +	 * helpers using drm_atomic_crtc_needs_modeset(), but mode_changed has
> > +	 * toggled by one of its atomic_check() callbacks.
> > +	 */
> > +	bool dirty_needs_modeset : 1;
> > +
> >  	/**
> >  	 * @planes:
> >  	 *
> > 
> > -- 
> > 2.39.5
> > 
> 
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
With best wishes
Dmitry
