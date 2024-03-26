Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD50D88B5C5
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 01:05:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC44B10E893;
	Tue, 26 Mar 2024 00:05:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="bPz2PBSC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1599F10E893
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 00:05:39 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-6e6a9e2e2b6so2694586a34.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 17:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1711411539; x=1712016339;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sr6TytFlRA9Ba2OxQ6bF0U4yrgW4829phMzFJO/SyDo=;
 b=bPz2PBSCBYSkrNEVO01XeHWjNYUALCuxGRrIEcq6tpkIjK66plEQ/qXmOuOQ+pPfeg
 nz+uCTC1YvzGFc8fvYcMpf1MikwGkhy+no9EZLWleNyprkUt8HJRBfWBq3vmPkwtQlJl
 IwrptDa23veNZpkgzV1cJhEZmSkmvJ6saq+9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711411539; x=1712016339;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sr6TytFlRA9Ba2OxQ6bF0U4yrgW4829phMzFJO/SyDo=;
 b=HE5Zov/4rp+0CMthfojTKS6OkOqILokEkD6K2iZUxXzciZxixFShAd9ZC2il/UEP49
 ey4ZFCdHz47DeOrc0+s1MD59BASCrWPBkjref1p/4tTio+s/lxTjqZau1yMesEqpJEwc
 pdtZKV8oDjI//l9ly7HcyG0q2Xp7tCtCkt/m6Ue3YsA867MOWvO2AA/VMz1S2aN3yQsU
 EgTX+F89jPSw8PHor2A+aIrijJDOFYx9xqzszeuoL6Rs83TMvMc0+hUWbCXrnav4QCAk
 IqluRwfUN2vScrHJZ4lPIzDAEPYHbdiNWDFuCjNoN2GGDlQBD6AQp6o2Zt4qSmeN5QPv
 EPJQ==
X-Gm-Message-State: AOJu0Yye/X0t6E+yH+Q7WrvyhBUaFHfSelLmK8X4QW8HFMSZcEtzx4Rq
 QhX67uOg2+p1kFFApy+eUyMrdiEcLrnzuDwERc3b2Io77DxJL1VcFT+bdL5EEzueJjjtYuw9dEt
 bjwaYIpdUFkangJhnhQnkDxyOMlU0GldII1Re
X-Google-Smtp-Source: AGHT+IHJgVmV0p0vy2DP1h7+1kuY/rx97Jm0m6+cGbd8xnSRDxFpn0JBOdET0ZD92lhXCN2XkJ3NhjoK3mbDhSGmxz0=
X-Received: by 2002:a9d:6a1a:0:b0:6e4:e496:dd78 with SMTP id
 g26-20020a9d6a1a000000b006e4e496dd78mr9245476otn.2.1711411539192; Mon, 25 Mar
 2024 17:05:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240325215631.3804796-1-dianders@chromium.org>
 <20240325145626.2.Ia7a55a9657b0b6aa4644fd497a0bc595a771258c@changeid>
In-Reply-To: <20240325145626.2.Ia7a55a9657b0b6aa4644fd497a0bc595a771258c@changeid>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 25 Mar 2024 17:05:13 -0700
Message-ID: <CAJMQK-j0aCtH8KU5UiWuJbbgRLTmM4d6rkxXff1VBPsdXX2WHQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/panel-edp: If we fail to powerup/get EDID, use
 conservative timings
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
> If at boot we fail to power up the eDP panel (most often happens if
> the eDP panel never asserts HPD to us) or if we are unable to read the
> EDID at bootup to figure out the panel's ID then let's use the
> conservative eDP panel powerup/powerdown timings but _not_ fail the
> probe.
>
> It might seem strange to _not_ fail the probe in this case since we
> were unable to powerup the panel and confirm it's there. However,
> there is a reason to do this. Specifically, if we fail to probe the
> panel then it really throws the whole display pipeline for loop. Most
> DRM subsystems are written so that they wait until all components
> (including the panel) have probed before they set everything up. When
> the panel doesn't come up then this never happens. As a side effect of
> not setting everything up then other display adapters don't get
> initialized. As a practical example, I can see that if I open up a
> sc7180-trogdor based Chromebook that's using the generic "edp-panel"
> and unplug the eDP panel that it causes the _external_ DP monitor not
> to function. This is obviously bad because it means that a device with
> a dead eDP panel becomes e-waste when it could instead still be given
> useful life with an external display.
>
> NOTES:
> - When we fail to probe like this, boot is a bit slow because we try
>   several times to power the panel up. This doesn't feel horrible
>   because it'll eventually work and the retries are known to help
>   bring some panels up.
> - In the case where we hit the condition of failing to power up, the
>   display will likely _never_ have a chance to work again until
>   reboot. Once the panel-edp pm_runtime resume function fails it
>   doesn't ever seem to retry. This is probably for the best given that
>   we don't have any real timing/modes. eDP isn't expected to be
>   "hotplugged" so this makes some sense.
> - It turns out that this makes panel-edp behave more similarly for
>   users of the generic "edp-panel" compatible string and the old fixed
>   panel compatible string. With the old fixed panel compatible string
>   we don't talk to the panel during probe so we'd actually behave much
>   the same way that we'll now behave for the generic "edp-panel".
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>

> ---
>
>  drivers/gpu/drm/panel/panel-edp.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 8a19fea90ddf..607cdd6feda9 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -808,7 +808,10 @@ static int generic_edp_panel_probe(struct device *de=
v, struct panel_edp *panel)
>         /* Power the panel on so we can read the EDID */
>         ret =3D pm_runtime_get_sync(dev);
>         if (ret < 0) {
> -               dev_err(dev, "Couldn't power on panel to read EDID: %d\n"=
, ret);
> +               dev_err(dev,
> +                       "Couldn't power on panel to ID it; using conserva=
tive timings: %d\n",
> +                       ret);
> +               panel_edp_set_conservative_timings(panel, desc);
>                 goto exit;
>         }
>
> @@ -816,8 +819,8 @@ static int generic_edp_panel_probe(struct device *dev=
, struct panel_edp *panel)
>         if (base_block) {
>                 panel_id =3D drm_edid_get_panel_id(base_block);
>         } else {
> -               dev_err(dev, "Couldn't identify panel via EDID\n");
> -               ret =3D -EIO;
> +               dev_err(dev, "Couldn't read EDID for ID; using conservati=
ve timings\n");
> +               panel_edp_set_conservative_timings(panel, desc);
>                 goto exit;
>         }
>         drm_edid_decode_panel_id(panel_id, vend, &product_id);
> @@ -844,12 +847,11 @@ static int generic_edp_panel_probe(struct device *d=
ev, struct panel_edp *panel)
>                 desc->delay =3D *panel->detected_panel->delay;
>         }
>
> -       ret =3D 0;
>  exit:
>         pm_runtime_mark_last_busy(dev);
>         pm_runtime_put_autosuspend(dev);
>
> -       return ret;
> +       return 0;
>  }
>
>  static int panel_edp_probe(struct device *dev, const struct panel_desc *=
desc,
> --
> 2.44.0.396.g6e790dbe36-goog
>
