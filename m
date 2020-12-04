Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 478622CF176
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 17:04:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4526E190;
	Fri,  4 Dec 2020 16:04:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3F96E190
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 16:04:27 +0000 (UTC)
Received: by mail-oo1-xc44.google.com with SMTP id l10so1489582oom.6
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Dec 2020 08:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B14rR4AZkurW75Q+ndSfco0uuoIDnVkupSwLEcF0bVg=;
 b=fXtum5RyfeG5XVamWMiv3u4tZLC9RYd2oYwdKwLKKssIun0NoBIehS8dJhwymA4ve0
 CnCrpQmtCZmP4A5qI2Rj/ZQVU616gsf2hobIh4gsL3MLvcBr2b4FeF7+f33oB7wr5Ony
 tcJKpHCh7VESFkqdZtGtZg5hIgwZiSgBvvEjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B14rR4AZkurW75Q+ndSfco0uuoIDnVkupSwLEcF0bVg=;
 b=H8klRa9sjSqLOUKp6qutKwNHjZKSmf/ymtKHCefNEswPzhW9SZY8TmiXE99tLFJyRY
 XYC9Amg683gPhtkzKkESw1gcYrvZmYM7GZlKpx8zPtxrz3fYvvTWuKKO9uJbfBEH0lSb
 u9LRSbEHXegLngDV1wH9IXyeUpXsRqSmYDPeZcGWxiXqJt+3sACodOwxFEeGByFVKUeO
 MhKKFhWdcOVNhjTG6qktu3VGYjCdubSWRPzuFw4dLUbhzvCEsy3o6w0lqGERHV5Cm92o
 4buTz7zw3KJU/NFJvFYAJt9jAYswPQMoC4Q7cDDADM7FnUm3nGFe1NGGU6WjzhQbHTEr
 OI9A==
X-Gm-Message-State: AOAM532KY1iFKbdLNEltCM4TuBHYAyOXdt0L/ZgfBJpNaQVCc46aUNVr
 Ik03DEf07caE//efQjvBsvI7VpIynJ5L7T5k6oMHYA==
X-Google-Smtp-Source: ABdhPJwpjgPd6FSBOBIa6aQ0a/8cbsEQNXUGYkVJJ2LUV16VhbmY+APbwmxZowptpZgCAF+PdhJa/vj8FTHcjA80oIY=
X-Received: by 2002:a4a:8582:: with SMTP id t2mr3979308ooh.89.1607097866631;
 Fri, 04 Dec 2020 08:04:26 -0800 (PST)
MIME-Version: 1.0
References: <20201204151138.1739736-1-maxime@cerno.tech>
 <20201204151138.1739736-2-maxime@cerno.tech>
In-Reply-To: <20201204151138.1739736-2-maxime@cerno.tech>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 4 Dec 2020 17:04:15 +0100
Message-ID: <CAKMK7uEZaRx9Bj_N_DLvut-Z9FmZU=xGmVtCps29DiH2YN9Pfg@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] drm: Introduce an atomic_commit_setup function
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 4, 2020 at 4:11 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
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

r-b: me too

Cheers, Daniel

> ---
>  drivers/gpu/drm/drm_atomic_helper.c      |  9 +++++++++
>  include/drm/drm_modeset_helper_vtables.h | 21 +++++++++++++++++++++
>  2 files changed, 30 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index f9170b4b22e7..f754e21b96eb 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -2034,6 +2034,9 @@ crtc_or_fake_commit(struct drm_atomic_state *state, struct drm_crtc *crtc)
>   * should always call this function from their
>   * &drm_mode_config_funcs.atomic_commit hook.
>   *
> + * Drivers that need to extend the commit setup to private objects can use the
> + * &drm_mode_config_helper_funcs.atomic_commit_setup hook.
> + *
>   * To be able to use this support drivers need to use a few more helper
>   * functions. drm_atomic_helper_wait_for_dependencies() must be called before
>   * actually committing the hardware state, and for nonblocking commits this call
> @@ -2077,8 +2080,11 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
>         struct drm_plane *plane;
>         struct drm_plane_state *old_plane_state, *new_plane_state;
>         struct drm_crtc_commit *commit;
> +       const struct drm_mode_config_helper_funcs *funcs;
>         int i, ret;
>
> +       funcs = state->dev->mode_config.helper_private;
> +
>         for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
>                 commit = kzalloc(sizeof(*commit), GFP_KERNEL);
>                 if (!commit)
> @@ -2155,6 +2161,9 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
>                 new_plane_state->commit = drm_crtc_commit_get(commit);
>         }
>
> +       if (funcs && funcs->atomic_commit_setup)
> +               return funcs->atomic_commit_setup(state);
> +
>         return 0;
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_setup_commit);
> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> index 4efec30f8bad..0ebb3f191bbc 100644
> --- a/include/drm/drm_modeset_helper_vtables.h
> +++ b/include/drm/drm_modeset_helper_vtables.h
> @@ -1406,6 +1406,27 @@ struct drm_mode_config_helper_funcs {
>          * drm_atomic_helper_commit_tail().
>          */
>         void (*atomic_commit_tail)(struct drm_atomic_state *state);
> +
> +       /**
> +        * @atomic_commit_setup:
> +        *
> +        * This hook is used by the default atomic_commit() hook implemented in
> +        * drm_atomic_helper_commit() together with the nonblocking helpers (see
> +        * drm_atomic_helper_setup_commit()) to extend the DRM commit setup. It
> +        * is not used by the atomic helpers.
> +        *
> +        * This function is called at the end of
> +        * drm_atomic_helper_setup_commit(), so once the commit has been
> +        * properly setup across the generic DRM object states. It allows
> +        * drivers to do some additional commit tracking that isn't related to a
> +        * CRTC, plane or connector, tracked in a &drm_private_obj structure.
> +        *
> +        * Note that the documentation of &drm_private_obj has more details on
> +        * how one should implement this.
> +        *
> +        * This hook is optional.
> +        */
> +       int (*atomic_commit_setup)(struct drm_atomic_state *state);
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
