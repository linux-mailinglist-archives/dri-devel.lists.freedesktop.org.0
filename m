Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D73AE2B2627
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 22:02:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB5EA6E5C5;
	Fri, 13 Nov 2020 21:02:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B0C6E5C5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 21:02:44 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id d142so10910515wmd.4
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 13:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/9yPJV30pVcKkDL4/XdGIjl9qOHXH9yCBC3h+QTAx7c=;
 b=YEc1MMKTaPTIbTHLZH+Nl6FZMZP4Lkir8aiylqp9RQK6iKBY5jL+vOxEBj+y34os6d
 nOUtM3HxEhPE0+sFhHFUYLMVqu62BfN2JFJ4vIpZwQXxCDiN7qT7CjY8A0SOpyPz8DiJ
 643tv9q2wOSUHZN/40brvQ8oMycTrCv7AtO0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/9yPJV30pVcKkDL4/XdGIjl9qOHXH9yCBC3h+QTAx7c=;
 b=ZFIPtT5SXTivQhNjRrL0U39qLiP8S3p4p38eakouzOBLGKNSRyRXrhso92iDdJ+I/D
 I7xcdDPeVpYVHHS4SoFsLwLAX3hvy5Qc0gOXsnPCnFN4N/4yVY7XZWawALpyPuWI1nM0
 Ev66jz0OJpi9aEfT830jkwagtApF/OnihAHbpVGV+3g9MdsUkX+V/d1TgptA/FuCuWTa
 SdobGLXJbXeysWPT4iU8eSW44Hy/yn9yYtAkNIZEbJORofITosmPtzAmSutoxssiBNM3
 +4cAssKfM7lWzgU6DYfLsLYjKt3lM8Lblm7B0L6RUg9oNx9MmIW88Q+uR/Kw1yMfDXCD
 7Eag==
X-Gm-Message-State: AOAM533d0yLl4p52v3wMhjRAwl0nR47vhSzrRA71vsvAjZaRG7xhVmRm
 C0n1oD2aaJvRsfNlASjbnVuGTQ==
X-Google-Smtp-Source: ABdhPJycSjeEZ4roZjLqZrcoeszqo3iWVlMz1UIZF1iy5IlZnr3YJRfEkA8Z653H7SISTQAeFFhW3A==
X-Received: by 2002:a05:600c:2244:: with SMTP id
 a4mr4393082wmm.144.1605301363350; 
 Fri, 13 Nov 2020 13:02:43 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m21sm20856770wmi.3.2020.11.13.13.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 13:02:42 -0800 (PST)
Date: Fri, 13 Nov 2020 22:02:40 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 1/8] drm: Introduce an atomic_commit_setup function
Message-ID: <20201113210240.GX401619@phenom.ffwll.local>
References: <20201113152956.139663-1-maxime@cerno.tech>
 <20201113152956.139663-2-maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201113152956.139663-2-maxime@cerno.tech>
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
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 13, 2020 at 04:29:49PM +0100, Maxime Ripard wrote:
> Private objects storing a state shared across all CRTCs need to be
> carefully handled to avoid a use-after-free issue.
> 
> The proper way to do this to track all the commits using that shared
> state and wait for the previous commits to be done before going on with
> the current one to avoid the reordering of commits that could occur.
> 
> However, this commit setup needs to be done after
> drm_atomic_helper_setup_commit(), because before the CRTC commit
> structure hasn't been allocated before, and before the workqueue is
> scheduled, because we would be potentially reordered already otherwise.
> 
> That means that drivers currently have to roll their own
> drm_atomic_helper_commit() function, even though it would be identical
> if not for the commit setup.
> 
> Let's introduce a hook to do so that would be called as part of
> drm_atomic_helper_commit, allowing us to reuse the atomic helpers.
> 
> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Should probably wait with merging until we have the entire vc4 user ready
too. And I think the kerneldoc needs to be further improved, see
suggestions below.

> ---
>  drivers/gpu/drm/drm_atomic_helper.c      |  6 ++++++
>  include/drm/drm_modeset_helper_vtables.h | 18 ++++++++++++++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index ddd0e3239150..7d69c7844dfc 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -2083,8 +2083,11 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
>  	struct drm_plane *plane;
>  	struct drm_plane_state *old_plane_state, *new_plane_state;
>  	struct drm_crtc_commit *commit;
> +	const struct drm_mode_config_helper_funcs *funcs;
>  	int i, ret;
>  
> +	funcs = state->dev->mode_config.helper_private;
> +
>  	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
>  		commit = kzalloc(sizeof(*commit), GFP_KERNEL);
>  		if (!commit)
> @@ -2169,6 +2172,9 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
>  		new_plane_state->commit = drm_crtc_commit_get(commit);
>  	}
>  
> +	if (funcs && funcs->atomic_commit_setup)
> +		return funcs->atomic_commit_setup(state);
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_setup_commit);
> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> index f2de050085be..56470baf0513 100644
> --- a/include/drm/drm_modeset_helper_vtables.h
> +++ b/include/drm/drm_modeset_helper_vtables.h
> @@ -1396,6 +1396,24 @@ struct drm_mode_config_helper_funcs {
>  	 * drm_atomic_helper_commit_tail().
>  	 */
>  	void (*atomic_commit_tail)(struct drm_atomic_state *state);
> +
> +	/**
> +	 * @atomic_commit_setup:
> +	 *
> +	 * This hook is used by the default atomic_commit() hook implemented in
> +	 * drm_atomic_helper_commit() together with the nonblocking helpers (see
> +	 * drm_atomic_helper_setup_commit()) to extend the DRM commit setup. It

I think a link from drm_atomic_helper_setup_commit to this new hook here
would be useful too, maybe together with a note that waiting for these
additional synchronization points can be done at the start of
atomic_commit_tail.

> +	 * is not used by the atomic helpers.
> +	 *
> +	 * This function is called at the end of
> +	 * drm_atomic_helper_setup_commit(), so once the commit has been
> +	 * properly setup across the generic DRM object states. It allows
> +	 * drivers to do some additional commit tracking that isn't related to a
> +	 * CRTC, plane or connector, typically a private object.
> +	 *
> +	 * This hook is optional.
> +	 */
> +	int (*atomic_commit_setup)(struct drm_atomic_state *state);

I think the kerneldoc for drm_private_obj should also explain when it is
necessary to use this, and when not:

- when the private state is a tied to an existing drm object (drm_crtc,
  drm_plane or drm_crtc) and never moves, then sufficient synchronization
  is already guaranteed by that superior object. This could even hold
  when the private object can be e.g. reassigned between planes, but
  always stays on the same crtc.

- if the private state object can be globally reassigned, then
  drm_crtc_commit synchronization points need to be set up in
  ->atomic_commit_setup and waited on as the first step in
  ->atomic_commit_tail


Also I just realized that a drm_private_state->obj backpointer to
drm_private_obj might be rather useful. Or at least more consistent with
all the other state objects.

Cheers, Daniel


>  };
>  
>  #endif
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
