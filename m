Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F924BEFCC
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 04:12:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D4910E5D2;
	Tue, 22 Feb 2022 03:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A2410E5CC
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 03:12:07 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id x3so37571392qvd.8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 19:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zkwjd5lOCa4cW4bL7/bpFQz6lcs6TRUmGFz5ovEfIkI=;
 b=c44ekn4/IgS3rUVu5zK97aGkGy/pVUY15T9fOLA2rQRooU1G8n1E4RfFT9KviA/a9Z
 BMaDNrEo5/d9hev7YZOvWU2YIc2gQKdhu04+tQRv7akPW4Qfmj6jmZM+OeaMIYYe171Q
 pbzAwyM+OxVnxJm/JMWDog3eD9MOFbACk7UgoVgVpFMTGFltpq3LNc0bW/EEYNHDCnjH
 hM2j2+uxTXg+LezEZctFxp0hpxQ+9amsQxofAhOTrqJ33VFO2wKOAb2vb5kZNWq8a6re
 KLB4vWnO0UdIDrDumARfsMkrlPyX8NPqqupnsfMVkrnNPM6yUlguk3qPHWlE5lGne05X
 CHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zkwjd5lOCa4cW4bL7/bpFQz6lcs6TRUmGFz5ovEfIkI=;
 b=U0APbsm4k2ZvqGfarmbOcqdTG/+YKxfnvG9OjBBegtPpSm/slvSL1mHq0F4OEToGV8
 mSC+P6UmHE2dplv7LYSlSZaj/9vXMMUdCStnkAnJgVZiuOyOtmdXXzbYPiclUl8WyI7n
 X9sCVBJkvP6SnuPzrouJ5OLXUA9c7hBs57iziXVZ46C90mCCsM+4olkBBY8BjwRyOnUr
 Zc6xfGnWh4lzZkx+YAUue7Csu7z36dATVEoT5zZeAH0ctuKO579X9H3q3u1Sina3pVy5
 J2dtsqLkWd1QeSNP7gMKcP+QLQ/7s+qyH68b/2m/hhD0DRjou7wCms3kst9AGl+fYnhF
 6/Qw==
X-Gm-Message-State: AOAM5337qZwQCAH/EvJh1VecPsV9s+/gvle0z4lV87CgntNcxdTSb17b
 nhNxmnRfrrAxCX37DgI0dH6a/K35+n/aoNsysfrv0Q==
X-Google-Smtp-Source: ABdhPJyjC+COba0GIMgHjLcHMfAyx/gfy3+7irT0YpwmwmMnNHRZfZTBV+dv/U3nym3tu8mCf25jghBTIbNbh8K66Wg=
X-Received: by 2002:ac8:5ccf:0:b0:2dd:a371:68f4 with SMTP id
 s15-20020ac85ccf000000b002dda37168f4mr16140333qta.370.1645499526032; Mon, 21
 Feb 2022 19:12:06 -0800 (PST)
MIME-Version: 1.0
References: <1645455086-9359-1-git-send-email-quic_vpolimer@quicinc.com>
 <1645455086-9359-3-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1645455086-9359-3-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 22 Feb 2022 05:30:30 +0300
Message-ID: <CAA8EJpo8AnGhskdHPSxeN4Z1+KCKhrwprNF1x27Kr9qOG3CT8A@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/bridge: use atomic enable/disable for bridge
 callbacks
To: Vinod Polimera <quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 quic_sbillaka@quicinc.com, dianders@chromium.org, sam@ravnborg.org,
 krzysztof.kozlowski@canonical.com, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, quic_vproddut@quicinc.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org,
 seanpaul@chromium.org, thierry.reding@gmail.com, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 21 Feb 2022 at 17:52, Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
>
> Use atomic enable/disable for bridge callbacks to access certain
> states like self-refresh.
>
> This change avoids panel prepare/unprepare based on self-refresh
> state.

Please split this into two patches:
- change to atomic_* callbacks
- introduction of PSR support.

>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
>
> Changes in V2:
> - As per review suggestion by Dmitry.
> ---
>  drivers/gpu/drm/bridge/panel.c | 102 +++++++++++++++++++++++++++++++++++++----
>  1 file changed, 94 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index b32295a..5c7dc82 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -41,6 +41,40 @@ static int panel_bridge_connector_get_modes(struct drm_connector *connector)
>         return drm_panel_get_modes(panel_bridge->panel, connector);
>  }
>
> +static struct drm_crtc *bridge_drm_get_old_connector_crtc(struct drm_encoder *encoder,
> +                                               struct drm_atomic_state *state)
> +{
> +       struct drm_connector *connector;
> +       struct drm_connector_state *conn_state;
> +
> +       connector = drm_atomic_get_old_connector_for_encoder(state, encoder);
> +       if (!connector)
> +               return NULL;
> +
> +       conn_state = drm_atomic_get_old_connector_state(state, connector);
> +       if (!conn_state)
> +               return NULL;
> +
> +       return conn_state->crtc;
> +}
> +
> +static struct drm_crtc *bridge_drm_get_new_connector_crtc(struct drm_encoder *encoder,
> +                                               struct drm_atomic_state *state)
> +{
> +       struct drm_connector *connector;
> +       struct drm_connector_state *conn_state;
> +
> +       connector = drm_atomic_get_new_connector_for_encoder(state, encoder);
> +       if (!connector)
> +               return NULL;
> +
> +       conn_state = drm_atomic_get_new_connector_state(state, connector);
> +       if (!conn_state)
> +               return NULL;
> +
> +       return conn_state->crtc;
> +}
> +
>  static const struct drm_connector_helper_funcs
>  panel_bridge_connector_helper_funcs = {
>         .get_modes = panel_bridge_connector_get_modes,
> @@ -102,30 +136,82 @@ static void panel_bridge_detach(struct drm_bridge *bridge)
>                 drm_connector_cleanup(connector);
>  }
>
> -static void panel_bridge_pre_enable(struct drm_bridge *bridge)
> +static void panel_bridge_pre_enable(struct drm_bridge *bridge,
> +               struct drm_bridge_state *old_bridge_state)
>  {
>         struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
> +       struct drm_atomic_state *old_state = old_bridge_state->base.state;
> +       struct drm_encoder *encoder = bridge->encoder;
> +       struct drm_crtc *crtc;
> +       struct drm_crtc_state *old_crtc_state;
> +
> +       crtc = bridge_drm_get_new_connector_crtc(encoder, old_state);
> +       if (!crtc)
> +               return;
> +
> +       old_crtc_state = drm_atomic_get_old_crtc_state(old_state, crtc);
> +       if (old_crtc_state && old_crtc_state->self_refresh_active)
> +               return;
>
>         drm_panel_prepare(panel_bridge->panel);
>  }
>
> -static void panel_bridge_enable(struct drm_bridge *bridge)
> +static void panel_bridge_enable(struct drm_bridge *bridge,
> +               struct drm_bridge_state *old_bridge_state)
>  {
>         struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
> +       struct drm_atomic_state *old_state = old_bridge_state->base.state;
> +       struct drm_encoder *encoder = bridge->encoder;
> +       struct drm_crtc *crtc;
> +       struct drm_crtc_state *old_crtc_state;
> +
> +       crtc = bridge_drm_get_new_connector_crtc(encoder, old_state);
> +       if (!crtc)
> +               return;
> +
> +       old_crtc_state = drm_atomic_get_old_crtc_state(old_state, crtc);
> +       if (old_crtc_state && old_crtc_state->self_refresh_active)
> +               return;
>
>         drm_panel_enable(panel_bridge->panel);
>  }
>
> -static void panel_bridge_disable(struct drm_bridge *bridge)
> +static void panel_bridge_disable(struct drm_bridge *bridge,
> +               struct drm_bridge_state *old_bridge_state)
>  {
>         struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
> +       struct drm_atomic_state *old_state = old_bridge_state->base.state;
> +       struct drm_encoder *encoder = bridge->encoder;
> +       struct drm_crtc *crtc;
> +       struct drm_crtc_state *new_crtc_state;
> +
> +       crtc = bridge_drm_get_old_connector_crtc(encoder, old_state);
> +       if (!crtc)
> +               return;
> +
> +       new_crtc_state = drm_atomic_get_new_crtc_state(old_state, crtc);
> +       if (new_crtc_state && new_crtc_state->self_refresh_active)
> +               return;
>
>         drm_panel_disable(panel_bridge->panel);
>  }
>
> -static void panel_bridge_post_disable(struct drm_bridge *bridge)
> +static void panel_bridge_post_disable(struct drm_bridge *bridge,
> +               struct drm_bridge_state *old_bridge_state)
>  {
>         struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
> +       struct drm_atomic_state *old_state = old_bridge_state->base.state;
> +       struct drm_encoder *encoder = bridge->encoder;
> +       struct drm_crtc *crtc;
> +       struct drm_crtc_state *new_crtc_state;
> +
> +       crtc = bridge_drm_get_old_connector_crtc(encoder, old_state);
> +       if (!crtc)
> +               return;
> +
> +       new_crtc_state = drm_atomic_get_new_crtc_state(old_state, crtc);
> +       if (new_crtc_state && new_crtc_state->self_refresh_active)
> +               return;
>
>         drm_panel_unprepare(panel_bridge->panel);
>  }
> @@ -141,10 +227,10 @@ static int panel_bridge_get_modes(struct drm_bridge *bridge,
>  static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
>         .attach = panel_bridge_attach,
>         .detach = panel_bridge_detach,
> -       .pre_enable = panel_bridge_pre_enable,
> -       .enable = panel_bridge_enable,
> -       .disable = panel_bridge_disable,
> -       .post_disable = panel_bridge_post_disable,
> +       .atomic_pre_enable = panel_bridge_pre_enable,
> +       .atomic_enable = panel_bridge_enable,
> +       .atomic_disable = panel_bridge_disable,
> +       .atomic_post_disable = panel_bridge_post_disable,

Please change callback names to reflect that we are using atomic_ interfaces.

>         .get_modes = panel_bridge_get_modes,
>         .atomic_reset = drm_atomic_helper_bridge_reset,
>         .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
