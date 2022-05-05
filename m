Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EAE51B59D
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 04:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FAC710EB49;
	Thu,  5 May 2022 02:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B296A10EB16;
 Thu,  5 May 2022 02:06:59 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id q23so4227479wra.1;
 Wed, 04 May 2022 19:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DEPgWFnLOr771z8PKsdXSNpbwwQAe1tcA/QsjC8yy0M=;
 b=oKcEhcoJ84Xt4KNF3ZG193tKm8R8cuAzsjJmmUIOLMJMizzoOnLEwzVW04pTCMLeux
 IGlfFA2oRgJU5UvE73+gHVvVIENsKX5Oc4TGJTXKK/eHXKSaVnMPZD2VNZqbriWMpqLF
 4LA1LGnIa3z1km9fRXoPUzUo56hcYozcIJLsCzH/4bg0QD8wDolQ2fVoUSHr3GPQoLrQ
 UJVhKdmWVox4S0R7a+mlyn5Hw3KeBRXRV3uiF0TZ2oJVAOOyidKiVaaja5CGk6zNMBRq
 0cROseC9rJJIYBx3Lw1qBW+hXFX/xb8IU3XMJvcl1OXY/EOn9+rE5OycoXr8nNNG4pim
 cQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DEPgWFnLOr771z8PKsdXSNpbwwQAe1tcA/QsjC8yy0M=;
 b=g/IX/yFNAayZe1AnkWt/ieFRqM9cCDjVVirrGRdBrKZolMavNn0ocx+1tkjj2jVyWM
 qAivQ6ndMIDPqTIUE64mGYXi0djrd4FD6d9WclaXxZT9puXnNbhDabVSxcDANLtKsCYj
 iVgiiAAHIBerYuBZrqFu+St5f2/OnO2iXq6/Ihu5P5tkG7CS6sCc9YizcBEGPLMZrkH8
 cA8H/e5uyh25NOZGe5ek3lwkuH5JJPz217wvW2mTm+7dQj1GbhGKE7lgYW06cklY1QGs
 1ENIaigrJT7/HxHG35FTm+zWdbXsw5BhkMaaPcKc6zu1aYzPomncoAJMFTdn7bZ4rwPP
 iWYg==
X-Gm-Message-State: AOAM530rA/ihu3GS96A7vWQXGdXH5Oud4H7kO6EVIK40H23v0AJCjVlH
 51ay+amc+A+uwZchsD/4zQ29Zjt///iG2wGspEY=
X-Google-Smtp-Source: ABdhPJym27A8TrOOQOftDb3rc+bQ/X2D/JvrlqrlXqY2VGoPDqaVMsW/Kmby1WB/8U181nip3D3BxIqwa8uy+lHZvaY=
X-Received: by 2002:adf:fec2:0:b0:20c:6ffb:9598 with SMTP id
 q2-20020adffec2000000b0020c6ffb9598mr10410391wrs.418.1651716418103; Wed, 04
 May 2022 19:06:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220505015528.344-1-quic_jesszhan@quicinc.com>
In-Reply-To: <20220505015528.344-1-quic_jesszhan@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 4 May 2022 19:06:46 -0700
Message-ID: <CAF6AEGt1uFAgAo1+sp7KbamTb4DAn_MU-NR+UvGHLUGfm3oQ=A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/mdp5: Return error code in mdp5_pipe_release
 when deadlock is detected
To: Jessica Zhang <quic_jesszhan@quicinc.com>
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, quic_aravindh@quicinc.com,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 4, 2022 at 6:55 PM Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> mdp5_get_global_state runs the risk of hitting a -EDEADLK when acquiring
> the modeset lock, but currently mdp5_pipe_release doesn't check for if
> an error is returned. Because of this, there is a possibility of
> mdp5_pipe_release hitting a NULL dereference error.
>
> To avoid this, let's have mdp5_pipe_release check if
> mdp5_get_global_state returns an error and propogate that error.
>
> Changes since v1:
> - Separated declaration and initialization of *new_state to avoid
>   compiler warning
> - Fixed some spelling mistakes in commit message
>

Note that mdp5_mixer_release() needs the same treatment.. one more comment below

> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c  | 15 +++++++++++----
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h  |  2 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 20 ++++++++++++++++----
>  3 files changed, 28 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
> index ba6695963aa6..97887a2be082 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
> @@ -119,18 +119,23 @@ int mdp5_pipe_assign(struct drm_atomic_state *s, struct drm_plane *plane,
>         return 0;
>  }
>
> -void mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe)
> +int mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe)
>  {
>         struct msm_drm_private *priv = s->dev->dev_private;
>         struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
>         struct mdp5_global_state *state = mdp5_get_global_state(s);
> -       struct mdp5_hw_pipe_state *new_state = &state->hwpipe;
> +       struct mdp5_hw_pipe_state *new_state;
>
>         if (!hwpipe)
> -               return;
> +               return -EINVAL;

At least per the current code, !hwpipe is "normal".. I think that fits
the model of things like kfree(NULL), so lets make this just return 0

> +
> +       if (IS_ERR(state))
> +               return PTR_ERR(state);
> +
> +       new_state = &state->hwpipe;
>
>         if (WARN_ON(!new_state->hwpipe_to_plane[hwpipe->idx]))
> -               return;
> +               return -EINVAL;
>
>         DBG("%s: release from plane %s", hwpipe->name,
>                 new_state->hwpipe_to_plane[hwpipe->idx]->name);
> @@ -141,6 +146,8 @@ void mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe)
>         }
>
>         new_state->hwpipe_to_plane[hwpipe->idx] = NULL;
> +
> +       return 0;
>  }
>
>  void mdp5_pipe_destroy(struct mdp5_hw_pipe *hwpipe)
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h
> index 9b26d0761bd4..cca67938cab2 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h
> @@ -37,7 +37,7 @@ int mdp5_pipe_assign(struct drm_atomic_state *s, struct drm_plane *plane,
>                      uint32_t caps, uint32_t blkcfg,
>                      struct mdp5_hw_pipe **hwpipe,
>                      struct mdp5_hw_pipe **r_hwpipe);
> -void mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe);
> +int mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe);
>
>  struct mdp5_hw_pipe *mdp5_pipe_init(enum mdp5_pipe pipe,
>                 uint32_t reg_offset, uint32_t caps);
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> index 228b22830970..979458482841 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> @@ -311,12 +311,24 @@ static int mdp5_plane_atomic_check_with_state(struct drm_crtc_state *crtc_state,
>                                 mdp5_state->r_hwpipe = NULL;
>
>
> -                       mdp5_pipe_release(state->state, old_hwpipe);
> -                       mdp5_pipe_release(state->state, old_right_hwpipe);
> +                       ret = mdp5_pipe_release(state->state, old_hwpipe);
> +                       if (ret)
> +                               return ret;
> +
> +                       ret = mdp5_pipe_release(state->state, old_right_hwpipe);
> +                       if (ret)
> +                               return ret;
> +
>                 }
>         } else {
> -               mdp5_pipe_release(state->state, mdp5_state->hwpipe);
> -               mdp5_pipe_release(state->state, mdp5_state->r_hwpipe);
> +               ret = mdp5_pipe_release(state->state, mdp5_state->hwpipe);
> +               if (ret)
> +                       return ret;
> +
> +               ret = mdp5_pipe_release(state->state, mdp5_state->r_hwpipe);
> +               if (ret)
> +                       return ret;
> +
>                 mdp5_state->hwpipe = mdp5_state->r_hwpipe = NULL;
>         }
>
> --
> 2.35.1
>
