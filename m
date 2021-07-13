Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5CB3C75DF
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 19:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9FCE6E102;
	Tue, 13 Jul 2021 17:44:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADBFC6E102
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 17:44:24 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id m18so2162719oie.9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 10:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YM6mwOPhOFmuR5W+3oxkc/rlqYmdsrstoASxQRez5ew=;
 b=TMhR/h7Ck+r/kjSlCs3FDr/Jau72H/rnf2EY20+WlcPBXYEmAz96D4YC6ADD/N+KvB
 bexgK0pZhWgsv2yVpKkKsRksMVrMwn//FrS2JafQ6aTGY4rb6lRsYudb3BeAQHXm2AIa
 OwDHf5Gv5RbCZgxDHLhrdyn3uRDuppwi7m39s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YM6mwOPhOFmuR5W+3oxkc/rlqYmdsrstoASxQRez5ew=;
 b=UMnQ7EEUuAd7Lz/sphQxV8aEciOIwetMdb6FMx9pfJ5RUxqzyd/DuE9ENf788KFncQ
 XWcuKEE1Z7+LZNwHQ7BFgBuHpOTjluWYOIefl+RAp+MIxLSTTKIC3Vvir/H1FW9q75Od
 gZmm41hCeZ1t8Fjl76kEwe4irnlaNtffeKmJEYMsVwGUgOvj/dFpk0xh1/HcJ2gUSC/5
 l0a+s1RBFmIhvEE+7j3kpDYSbXs4JuiETBf3w33ls/iVKKeaLK17YDxDGHnxpyDOKi8H
 2NdCtCTJ1pUO9vz0yOaULtLSVxDHbhhblkTZnFe36FYvLnpPwM08xfzDQZwrtnAv3aiq
 p3+g==
X-Gm-Message-State: AOAM531jbjea6UKyZD9VT3NCwvspgmdu2WG8ZxORUTeR3pMQJfMehOAg
 6EPIFefgTxiJVVYApj0NZKtxSouzpIQVhrz3cdsIqw==
X-Google-Smtp-Source: ABdhPJwTA4IFS1zrTa6SZtTVF+HKn/thgr0wLyb0QfabiBxjH3coCb2AmYkg6eR9mjuDrd+K4z0014Ss9e91ZdQs5cQ=
X-Received: by 2002:aca:d4cf:: with SMTP id l198mr441684oig.14.1626198263812; 
 Tue, 13 Jul 2021 10:44:23 -0700 (PDT)
MIME-Version: 1.0
References: <1626196421-24595-1-git-send-email-gracan@codeaurora.org>
In-Reply-To: <1626196421-24595-1-git-send-email-gracan@codeaurora.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 13 Jul 2021 19:44:12 +0200
Message-ID: <CAKMK7uGcwLmvyPB1Z2HyOQg3bHYev5J=ad8Cjj=AQMVTTSHPNg@mail.gmail.com>
Subject: Re: [RFC] drm: return int error code from mode_fixup
To: Grace An <gracan@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>, pdhaval@codeaurora.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <khsieh@codeaurora.org>,
 Sean Paul <seanpaul@chromium.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, aravindh@codeaurora.org,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 13, 2021 at 7:14 PM Grace An <gracan@codeaurora.org> wrote:
> When CONFIG_PROVE_LOCKING is defined, the kernel randomly injects
> -EDEADLK errors for all the ww_mutex. This results in
> drm_atomic_get_private_obj_state randomly returning -EDEADLK.
> However, the mode_fixup functions do not propagate these error
> codes and return false, causing the atomic commit to fail with
> -EINVAL instead of retrying.
>
> Change encoder, crtc, and bridge mode_fixup functions to return
> an int instead of a boolean to indicate success or failure. If
> any of these functions fail, the mode_fixup function now returns
> the provided integer error code instead of -EINVAL.
>
> This change needs modifications across drivers, but before submitting
> the entire change, we want to get feedback on this RFC.
>
> Signed-off-by: Grace An <gracan@codeaurora.org>

Why don't you just use the various atomic_check hooks we have for
this? There you get passed the state and everything, have a full int
return value, and things actually work.

->mode_fixup is for compatibility with legacy crtc modeset helpers
from the pre-atomic times. If the kerneldoc isn't clear yet, please do
a patch to fix that up so that @mode_fixup points at the relevant
@atomic_check as the recommended function.
-Daniel

> ---
>  drivers/gpu/drm/drm_atomic_helper.c      | 8 ++++----
>  drivers/gpu/drm/drm_bridge.c             | 4 ++--
>  include/drm/drm_bridge.h                 | 2 +-
>  include/drm/drm_modeset_helper_vtables.h | 4 ++--
>  4 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index f2b3e28..d75f09a 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -457,10 +457,10 @@ mode_fixup(struct drm_atomic_state *state)
>                 } else if (funcs && funcs->mode_fixup) {
>                         ret = funcs->mode_fixup(encoder, &new_crtc_state->mode,
>                                                 &new_crtc_state->adjusted_mode);
> -                       if (!ret) {
> +                       if (ret) {
>                                 DRM_DEBUG_ATOMIC("[ENCODER:%d:%s] fixup failed\n",
>                                                  encoder->base.id, encoder->name);
> -                               return -EINVAL;
> +                               return ret;
>                         }
>                 }
>         }
> @@ -481,10 +481,10 @@ mode_fixup(struct drm_atomic_state *state)
>
>                 ret = funcs->mode_fixup(crtc, &new_crtc_state->mode,
>                                         &new_crtc_state->adjusted_mode);
> -               if (!ret) {
> +               if (ret) {
>                         DRM_DEBUG_ATOMIC("[CRTC:%d:%s] fixup failed\n",
>                                          crtc->base.id, crtc->name);
> -                       return -EINVAL;
> +                       return ret;
>                 }
>         }
>
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 64f0eff..3ad16b5 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -736,9 +736,9 @@ static int drm_atomic_bridge_check(struct drm_bridge *bridge,
>                 if (ret)
>                         return ret;
>         } else if (bridge->funcs->mode_fixup) {
> -               if (!bridge->funcs->mode_fixup(bridge, &crtc_state->mode,
> +               if (bridge->funcs->mode_fixup(bridge, &crtc_state->mode,
>                                                &crtc_state->adjusted_mode))
> -                       return -EINVAL;
> +                       return ret;
>         }
>
>         return 0;
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 2195daa..5d02dfc 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -153,7 +153,7 @@ struct drm_bridge_funcs {
>          * True if an acceptable configuration is possible, false if the modeset
>          * operation should be rejected.
>          */
> -       bool (*mode_fixup)(struct drm_bridge *bridge,
> +       int (*mode_fixup)(struct drm_bridge *bridge,
>                            const struct drm_display_mode *mode,
>                            struct drm_display_mode *adjusted_mode);
>         /**
> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> index f3a4b47..e305c97 100644
> --- a/include/drm/drm_modeset_helper_vtables.h
> +++ b/include/drm/drm_modeset_helper_vtables.h
> @@ -184,7 +184,7 @@ struct drm_crtc_helper_funcs {
>          * True if an acceptable configuration is possible, false if the modeset
>          * operation should be rejected.
>          */
> -       bool (*mode_fixup)(struct drm_crtc *crtc,
> +       int (*mode_fixup)(struct drm_crtc *crtc,
>                            const struct drm_display_mode *mode,
>                            struct drm_display_mode *adjusted_mode);
>
> @@ -599,7 +599,7 @@ struct drm_encoder_helper_funcs {
>          * True if an acceptable configuration is possible, false if the modeset
>          * operation should be rejected.
>          */
> -       bool (*mode_fixup)(struct drm_encoder *encoder,
> +       int (*mode_fixup)(struct drm_encoder *encoder,
>                            const struct drm_display_mode *mode,
>                            struct drm_display_mode *adjusted_mode);
>
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
