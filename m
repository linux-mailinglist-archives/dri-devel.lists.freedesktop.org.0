Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E1B88B5CB
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 01:07:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49C110E937;
	Tue, 26 Mar 2024 00:07:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ctIOBo0o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D4C10E937
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 00:07:48 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-6e6e37d33c5so327564a34.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 17:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1711411668; x=1712016468;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tYeKsmV2r7g+5PcUym8Kx46wv3d2A5owIUauWGUarMM=;
 b=ctIOBo0oLJKZGjqC5o+QHJoMvgFS+3nr0PpWdvjNhTjCFQ3IBVV0VSGQrqXRLFFy3x
 9Z/XoPeK30x7+SKtpht5/272938lzp+v6P/5dEv5MrsmsirWjLekh1Yp52jdRI3XLlxh
 J6y7ZBurQen2XOdmRIy9/cPbhEc7VjQzXmJzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711411668; x=1712016468;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tYeKsmV2r7g+5PcUym8Kx46wv3d2A5owIUauWGUarMM=;
 b=SHYDbirO7URa39LBn8ckPA/YLfBm52vAJidcSjTIpmrghkveDPHLHVO9q/lTbFTvzW
 EF+MSJvujJyYyKVIQrhdyeU9qiWVksUykI8O7LMKatvJpI51u7r+4SgvCB5OuxxQ6RSM
 yqfTsT0N4M3oiCkUAxp5Kq4myhv09vUIXd3gz3ea0c34ofbTjky8oqvKFr2+4tPNVVMH
 zg8kKdEX56GhFypv82RgAGy0bl+B+1Yfr2Bo9J4oYEqAkocU87JDeeGYrSUViss22QeG
 utmUASVPp9qtXxhlrOnuTyzpkFh3da5Bt7yeg20Pb36toZV2vtxdQg/npSepfasdzlLU
 HQcg==
X-Gm-Message-State: AOJu0YyWq7owI0YbYCHvlfJdlijwhmch66oNgMthxaEuWUOT87q+ebd9
 zzq5hlJvxv79sng2zgCPxVic3GwJsDMxP+h78oPv8YyMVDVNA1B22ePBat6V0zOYn7uLHy9oNHP
 7hhmbfkM/uBUqhJyf0M4ZEL6M4TfZygb8A1cG
X-Google-Smtp-Source: AGHT+IHmbf8f+HuCGnIfN0RBk/EEGKt2beufnVRwM8q6gQlWevq1HJEVzWv+oy02rn1rYbfzW4qrBqrz3iKeJWhhPxQ=
X-Received: by 2002:a9d:480f:0:b0:6e6:d042:87dd with SMTP id
 c15-20020a9d480f000000b006e6d04287ddmr6743728otf.35.1711411667934; Mon, 25
 Mar 2024 17:07:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240325215631.3804796-1-dianders@chromium.org>
 <20240325145626.3.I552e8af0ddb1691cc0fe5d27ea3d8020e36f7006@changeid>
In-Reply-To: <20240325145626.3.I552e8af0ddb1691cc0fe5d27ea3d8020e36f7006@changeid>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 25 Mar 2024 17:07:22 -0700
Message-ID: <CAJMQK-iu6Z5kfEij1K8TdAxpCOoR3FL_gfRQMT2LS=e9o6C6qg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm-panel: If drm_panel_dp_aux_backlight() fails,
 don't fail panel probe
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Pin-yen Lin <treapking@chromium.org>, 
 Prahlad Kilambi <prahladk@google.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Mar 25, 2024 at 2:57=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:
>
> If we're using the AUX channel for eDP backlight and it fails to probe
> for some reason, let's _not_ fail the panel probe.
>
> At least one case where we could fail to init the backlight is because
> of a dead or physically missing panel. As talked about in detail in
> the earlier patch in this series, ("drm/panel-edp: If we fail to
> powerup/get EDID, use conservative timings"), this can cause the
> entire system's display pipeline to fail to come up and that's
> non-ideal.
>
> If we fail to init the backlight for some transitory reason, we should
> dig in and see if there's a way to fix this (perhaps retries?). Even
> in that case, though, having a panel whose backlight is stuck at 100%
> (the default, at least in the panel Samsung ATNA33XC20 I tested) is
> better than having no panel at all.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>

> ---
> If needed, I could split this into two patches: one for each of the
> two panels that use drm_panel_dp_aux_backlight(). Since they both go
> through drm-misc, though, it doesn't feel worth it.
>
>  drivers/gpu/drm/panel/panel-edp.c                | 8 +++++++-
>  drivers/gpu/drm/panel/panel-samsung-atna33xc20.c | 9 +++++++--
>  2 files changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 607cdd6feda9..0bf66d9dd5b8 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -944,8 +944,14 @@ static int panel_edp_probe(struct device *dev, const=
 struct panel_desc *desc,
>                 err =3D drm_panel_dp_aux_backlight(&panel->base, panel->a=
ux);
>                 pm_runtime_mark_last_busy(dev);
>                 pm_runtime_put_autosuspend(dev);
> +
> +               /*
> +                * Warn if we get an error, but don't consider it fatal. =
Having
> +                * a panel where we can't control the backlight is better=
 than
> +                * no panel.
> +                */
>                 if (err)
> -                       goto err_finished_pm_runtime;
> +                       dev_warn(dev, "failed to register dp aux backligh=
t: %d\n", err);
>         }
>
>         drm_panel_add(&panel->base);
> diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers/g=
pu/drm/panel/panel-samsung-atna33xc20.c
> index 9c336c71562b..6828a4f24d14 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
> @@ -328,9 +328,14 @@ static int atana33xc20_probe(struct dp_aux_ep_device=
 *aux_ep)
>         ret =3D drm_panel_dp_aux_backlight(&panel->base, aux_ep->aux);
>         pm_runtime_mark_last_busy(dev);
>         pm_runtime_put_autosuspend(dev);
> +
> +       /*
> +        * Warn if we get an error, but don't consider it fatal. Having
> +        * a panel where we can't control the backlight is better than
> +        * no panel.
> +        */
>         if (ret)
> -               return dev_err_probe(dev, ret,
> -                                    "failed to register dp aux backlight=
\n");
> +               dev_warn(dev, "failed to register dp aux backlight: %d\n"=
, ret);
>
>         drm_panel_add(&panel->base);
>
> --
> 2.44.0.396.g6e790dbe36-goog
>
