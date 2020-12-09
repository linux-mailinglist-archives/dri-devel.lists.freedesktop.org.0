Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6682D3799
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 01:28:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733226E0D4;
	Wed,  9 Dec 2020 00:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9075C6E0D4
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 00:28:04 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a3so27009wmb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Dec 2020 16:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bDyHyRcQlk9KBAG5ZAuNjIGs5SUAqYhYe3CqVjRl+bM=;
 b=ZoYP7fZ9j5o9mFjf4f2WG4Zcw4ze2E1JwCt+zMwsdp0+L8m/3xy9WsIvBowGhQh1lb
 KSWMVhULLKiBMK/0yZOfpBjR92I8U5rQbCwPzSYO6qnCQuoT4dxZe8XdCTPGbW+nFXwJ
 AvXNVemQm8y6Gox6sDlqC3JmCeCTptG54ZXdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bDyHyRcQlk9KBAG5ZAuNjIGs5SUAqYhYe3CqVjRl+bM=;
 b=GxLegIQhfRmShukD3FVs6JvY0lSoJkScvQrdFEd2F7ebkyF6j0vBCUvoMWvQBEJiF5
 p24QKr1V8MyMgMcq/HQ4gxwnMMtrSK6M55QsMk0Kvn0PMVzgNRrRcZ31R0SQpdEXO53V
 CVkneXMK1YW8pccQa2WAHfCTF1/CbpjGdiMfa7Wpyr7wiE7gz4ZUcKXuerfTD4l2mxwS
 /N0bgg6eczfW26c4RBhjj4piHYf/o/hqMlsy8WHGcy5R+5xNeINLwC12BJtZElsApass
 DEHFl0JxxlU40kgYzueyGQ2cRYBpPB6t/vOWxsD0i0IBm7AmW/OfttEhhf+zGzQrtj6E
 n6zg==
X-Gm-Message-State: AOAM531y2ZmjOJVzFrdSEzslyDzQSIctbJyafDtoofMBHnTEHZoYD6oS
 KbKF7egnvpOVQXwD+G6DExeP0g==
X-Google-Smtp-Source: ABdhPJyWnJD+71j6PerYSoRsSEKr4/lvD59D1BfIC5fKjEvdGmdxL9GtZEAmypPMcREd7PaVUh1GZA==
X-Received: by 2002:a1c:7c09:: with SMTP id x9mr4301wmc.98.1607473682962;
 Tue, 08 Dec 2020 16:28:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 35sm1111052wrf.9.2020.12.08.16.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 16:28:02 -0800 (PST)
Date: Wed, 9 Dec 2020 01:28:00 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 4/7] drm/vc4: kms: Wait on previous FIFO users before
 a commit
Message-ID: <20201209002800.GI401619@phenom.ffwll.local>
References: <20201204151138.1739736-1-maxime@cerno.tech>
 <20201204151138.1739736-5-maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201204151138.1739736-5-maxime@cerno.tech>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 04, 2020 at 04:11:35PM +0100, Maxime Ripard wrote:
> If we're having two subsequent, non-blocking, commits on two different
> CRTCs that share no resources, there's no guarantee on the order of
> execution of both commits.
> 
> However, the second one will consider the first one as the old state,
> and will be in charge of freeing it once that second commit is done.
> 
> If the first commit happens after that second commit, it might access
> some resources related to its state that has been freed, resulting in a
> use-after-free bug.
> 
> The standard DRM objects are protected against this, but our HVS private
> state isn't so let's make sure we wait for all the previous FIFO users
> to finish their commit before going with our own.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_kms.c | 123 +++++++++++++++++++++++++++++++++-
>  1 file changed, 122 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> index 8937eb0b751d..fdd698df5fbe 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -40,6 +40,11 @@ static struct vc4_ctm_state *to_vc4_ctm_state(struct drm_private_state *priv)
>  struct vc4_hvs_state {
>  	struct drm_private_state base;
>  	unsigned int unassigned_channels;
> +
> +	struct {
> +		unsigned in_use: 1;
> +		struct drm_crtc_commit *pending_commit;
> +	} fifo_state[HVS_NUM_CHANNELS];
>  };
>  
>  static struct vc4_hvs_state *
> @@ -182,6 +187,32 @@ vc4_ctm_commit(struct vc4_dev *vc4, struct drm_atomic_state *state)
>  		  VC4_SET_FIELD(ctm_state->fifo, SCALER_OLEDOFFS_DISPFIFO));
>  }
>  
> +static struct vc4_hvs_state *
> +vc4_hvs_get_new_global_state(struct drm_atomic_state *state)
> +{
> +	struct vc4_dev *vc4 = to_vc4_dev(state->dev);
> +	struct drm_private_state *priv_state;
> +
> +	priv_state = drm_atomic_get_new_private_obj_state(state, &vc4->hvs_channels);
> +	if (IS_ERR(priv_state))
> +		return ERR_CAST(priv_state);
> +
> +	return to_vc4_hvs_state(priv_state);
> +}
> +
> +static struct vc4_hvs_state *
> +vc4_hvs_get_old_global_state(struct drm_atomic_state *state)
> +{
> +	struct vc4_dev *vc4 = to_vc4_dev(state->dev);
> +	struct drm_private_state *priv_state;
> +
> +	priv_state = drm_atomic_get_old_private_obj_state(state, &vc4->hvs_channels);
> +	if (IS_ERR(priv_state))
> +		return ERR_CAST(priv_state);
> +
> +	return to_vc4_hvs_state(priv_state);
> +}
> +
>  static struct vc4_hvs_state *
>  vc4_hvs_get_global_state(struct drm_atomic_state *state)
>  {
> @@ -308,8 +339,10 @@ vc4_atomic_complete_commit(struct drm_atomic_state *state)
>  	struct drm_device *dev = state->dev;
>  	struct vc4_dev *vc4 = to_vc4_dev(dev);
>  	struct vc4_hvs *hvs = vc4->hvs;
> +	struct drm_crtc_state *old_crtc_state;
>  	struct drm_crtc_state *new_crtc_state;
>  	struct drm_crtc *crtc;
> +	struct vc4_hvs_state *old_hvs_state;
>  	int i;
>  
>  	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
> @@ -329,6 +362,36 @@ vc4_atomic_complete_commit(struct drm_atomic_state *state)
>  
>  	drm_atomic_helper_wait_for_dependencies(state);
>  
> +	old_hvs_state = vc4_hvs_get_old_global_state(state);
> +	if (!old_hvs_state)
> +		return;
> +
> +	for_each_old_crtc_in_state(state, crtc, old_crtc_state, i) {
> +		struct vc4_crtc_state *vc4_crtc_state =
> +			to_vc4_crtc_state(old_crtc_state);
> +		struct drm_crtc_commit *commit;
> +		unsigned int channel = vc4_crtc_state->assigned_channel;
> +		unsigned long done;
> +
> +		if (channel == VC4_HVS_CHANNEL_DISABLED)
> +			continue;
> +
> +		if (!old_hvs_state->fifo_state[channel].in_use)
> +			continue;
> +
> +		commit = old_hvs_state->fifo_state[i].pending_commit;
> +		if (!commit)
> +			continue;
> +
> +		done = wait_for_completion_timeout(&commit->hw_done, 10 * HZ);
> +		if (!done)
> +			drm_err(dev, "Timed out waiting for hw_done\n");
> +
> +		done = wait_for_completion_timeout(&commit->flip_done, 10 * HZ);
> +		if (!done)
> +			drm_err(dev, "Timed out waiting for flip_done\n");

Idea for a follow-up patch: Add something like drm_crtc_commit_wait which
skips on a NULL commit and does the two waits here. And use it here and in
drm_atomic_helper_wait_for_dependencies, we have four copies of the same
code by now :-)

> +	}
> +
>  	drm_atomic_helper_commit_modeset_disables(dev, state);
>  
>  	vc4_ctm_commit(vc4, state);
> @@ -368,6 +431,36 @@ static void commit_work(struct work_struct *work)
>  	vc4_atomic_complete_commit(state);
>  }
>  
> +static int vc4_atomic_commit_setup(struct drm_atomic_state *state)
> +{
> +	struct drm_crtc_state *crtc_state;
> +	struct vc4_hvs_state *hvs_state;
> +	struct drm_crtc *crtc;
> +	unsigned int i;
> +
> +	hvs_state = vc4_hvs_get_new_global_state(state);
> +	if (!hvs_state)
> +		return -EINVAL;
> +
> +	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
> +		struct vc4_crtc_state *vc4_crtc_state =
> +			to_vc4_crtc_state(crtc_state);
> +		unsigned int channel =
> +			vc4_crtc_state->assigned_channel;
> +
> +		if (channel == VC4_HVS_CHANNEL_DISABLED)
> +			continue;
> +
> +		if (!hvs_state->fifo_state[channel].in_use)
> +			continue;
> +
> +		hvs_state->fifo_state[channel].pending_commit =
> +			drm_crtc_commit_get(crtc_state->commit);
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * vc4_atomic_commit - commit validated state object
>   * @dev: DRM device
> @@ -697,6 +790,7 @@ vc4_hvs_channels_duplicate_state(struct drm_private_obj *obj)
>  {
>  	struct vc4_hvs_state *old_state = to_vc4_hvs_state(obj->state);
>  	struct vc4_hvs_state *state;
> +	unsigned int i;
>  
>  	state = kzalloc(sizeof(*state), GFP_KERNEL);
>  	if (!state)
> @@ -706,6 +800,16 @@ vc4_hvs_channels_duplicate_state(struct drm_private_obj *obj)
>  
>  	state->unassigned_channels = old_state->unassigned_channels;
>  
> +	for (i = 0; i < HVS_NUM_CHANNELS; i++) {
> +		state->fifo_state[i].in_use = old_state->fifo_state[i].in_use;
> +
> +		if (!old_state->fifo_state[i].pending_commit)
> +			continue;
> +
> +		state->fifo_state[i].pending_commit =
> +			drm_crtc_commit_get(old_state->fifo_state[i].pending_commit);
> +	}
> +
>  	return &state->base;
>  }
>  
> @@ -713,6 +817,14 @@ static void vc4_hvs_channels_destroy_state(struct drm_private_obj *obj,
>  					   struct drm_private_state *state)
>  {
>  	struct vc4_hvs_state *hvs_state = to_vc4_hvs_state(state);
> +	unsigned int i;
> +
> +	for (i = 0; i < HVS_NUM_CHANNELS; i++) {
> +		if (!hvs_state->fifo_state[i].pending_commit)
> +			continue;
> +
> +		drm_crtc_commit_put(hvs_state->fifo_state[i].pending_commit);
> +	}
>  
>  	kfree(hvs_state);
>  }
> @@ -805,7 +917,10 @@ static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
>  
>  		/* If we're disabling our CRTC, we put back our channel */
>  		if (!new_crtc_state->enable) {
> -			hvs_new_state->unassigned_channels |= BIT(old_vc4_crtc_state->assigned_channel);
> +			channel = old_vc4_crtc_state->assigned_channel;
> +
> +			hvs_new_state->unassigned_channels |= BIT(channel);
> +			hvs_new_state->fifo_state[channel].in_use = false;
>  			new_vc4_crtc_state->assigned_channel = VC4_HVS_CHANNEL_DISABLED;
>  			continue;
>  		}
> @@ -841,6 +956,7 @@ static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
>  		channel = ffs(matching_channels) - 1;
>  		new_vc4_crtc_state->assigned_channel = channel;
>  		hvs_new_state->unassigned_channels &= ~BIT(channel);
> +		hvs_new_state->fifo_state[channel].in_use = true;
>  	}
>  
>  	return 0;
> @@ -866,6 +982,10 @@ vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
>  	return vc4_load_tracker_atomic_check(state);
>  }
>  
> +static struct drm_mode_config_helper_funcs vc4_mode_config_helpers = {
> +	.atomic_commit_setup	= vc4_atomic_commit_setup,
> +};
> +
>  static const struct drm_mode_config_funcs vc4_mode_funcs = {
>  	.atomic_check = vc4_atomic_check,
>  	.atomic_commit = vc4_atomic_commit,
> @@ -909,6 +1029,7 @@ int vc4_kms_load(struct drm_device *dev)
>  	}
>  
>  	dev->mode_config.funcs = &vc4_mode_funcs;
> +	dev->mode_config.helper_private = &vc4_mode_config_helpers;
>  	dev->mode_config.preferred_depth = 24;
>  	dev->mode_config.async_page_flip = true;
>  	dev->mode_config.allow_fb_modifiers = true;

Since I suggested this entire thing kinda:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> -- 
> 2.28.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
