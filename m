Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3CA4C03AE
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 22:19:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE1A10E73B;
	Tue, 22 Feb 2022 21:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0B210E737
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 21:19:51 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 i10-20020a4aab0a000000b002fccf890d5fso19498500oon.5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 13:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=PZXGdH7QOkFGdyZL9vslSSuJH2T6cBvsFBVFd42Xdko=;
 b=RwQ1qfHBX5YIxEy+KPyWxkJlAkJ/VTS081sLpYhZ0tAeKOngBOgBWhMOaTMHHoekQ5
 seKF/z0Zlz2Lmun8lOKI8aBPHiQZHtZ9LDVAQTPhoRLdCa/L+35K1WP4BjQa1fRMMs0l
 CQ8EwktT9W/rqR0ixUMXRnp8SEpUEob+vtQLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=PZXGdH7QOkFGdyZL9vslSSuJH2T6cBvsFBVFd42Xdko=;
 b=Lo2PgJP6NjsRN9r4+3b9c5dFk+D2KjCzQ2Hld9hi3Mfy4LKROLm/agubxlHMfS2W8N
 lTRAy4MC2viq2jVoq/Jh6PrHBff+rqdRoaCo2NPke7PaOzl0hcxsCSiNDizsoCePz49r
 SEw+My5mmXzR5V3SXtEgxriXyUgsm03wlMOhdyWYVxgUdoJXC+SxOnO9+F66dx9hXQDA
 5aIQn4uYyEhOd0ewWfeA3KlYZ2Bp7VIJuh33HyuhQGjDHJEGYL5zGAAZ5Wq2yc5epEUZ
 Di6rvNoob9NQJvXh7Qnh207WWkFTvvrQkJTv5MouJVsQuU1b4rQMcohMpAMcRpGVvfTx
 up3A==
X-Gm-Message-State: AOAM532jTpH0b6LxPEYlAN7hwG9Kjl7iaFAPzyYxwR5nsDMBwM/HWkIz
 WA52poTIBsLN0M+oQ9C14a0WKWzEdAHnOtiWLMggmQ==
X-Google-Smtp-Source: ABdhPJy7r6Dp6z5t3lrBYpzhD+7i1xvLB2uoHm7Qkx145lEhXBxvO1W68wKoliw01/Yq59Ok3PUuUtXn3CmG57UGp7U=
X-Received: by 2002:a05:6870:5829:b0:c8:9f42:f919 with SMTP id
 r41-20020a056870582900b000c89f42f919mr2737701oap.54.1645564791160; Tue, 22
 Feb 2022 13:19:51 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Feb 2022 21:19:50 +0000
MIME-Version: 1.0
In-Reply-To: <1645455086-9359-3-git-send-email-quic_vpolimer@quicinc.com>
References: <1645455086-9359-1-git-send-email-quic_vpolimer@quicinc.com>
 <1645455086-9359-3-git-send-email-quic_vpolimer@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 22 Feb 2022 21:19:50 +0000
Message-ID: <CAE-0n53a5akPXSJjkD4SvnparcxBpN2LaGt_7J=6petTPukHeQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/bridge: use atomic enable/disable for bridge
 callbacks
To: Vinod Polimera <quic_vpolimer@quicinc.com>, agross@kernel.org,
 airlied@linux.ie, 
 bjorn.andersson@linaro.org, daniel@ffwll.ch, devicetree@vger.kernel.org, 
 dianders@chromium.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, krzysztof.kozlowski@canonical.com, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 robdclark@gmail.com, robh+dt@kernel.org, sam@ravnborg.org, 
 seanpaul@chromium.org, thierry.reding@gmail.com
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com,
 quic_vproddut@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Vinod Polimera (2022-02-21 06:51:24)
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index b32295a..5c7dc82 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
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

Can you please add some comment about why self_refresh_active means we
should bail out from this function? Such a comment would be helpful to
understand the code quickly vs. having to figure out what the intention
of the logic is. The analogix driver has

/* Don't touch the panel if we're coming back from PSR */

so even mentioning PSR here would be helpful.
