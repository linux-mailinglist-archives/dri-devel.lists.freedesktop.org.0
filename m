Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D71D388B599
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 00:52:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0254A10E85C;
	Mon, 25 Mar 2024 23:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="T7vgFwlN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27E110E85C
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 23:51:58 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-6e6d063e88bso1102071a34.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 16:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1711410717; x=1712015517;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2MrRPD0X2P2h7H+3eSPulHbHlM+c9Z5ydkL4v8ZwLYc=;
 b=T7vgFwlNZ/qB0htSYzqEiPuEY5GybsGuXvj4qtpqVE5AERz7DkB/gAwfhPp4DdXIz4
 A1JQypdfbonIIMzIetqiPIfkcRbN+9ovpa3mBfikyylAdAvKsmBPX8IF2NoKSum59s7t
 nJ5n2zd33p3FcMMphbuh/CgdzCj4LdzBr9bew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711410717; x=1712015517;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2MrRPD0X2P2h7H+3eSPulHbHlM+c9Z5ydkL4v8ZwLYc=;
 b=wii3TQjRHn0w83cnq4mLDQltT86hgLhZvtv//FkspB3ftK/Am9k0sdIHs7cMoJPp1U
 +JIF4gpXxcABgZu4ATFfwtaZx5+FdbHzdDNscsEVxvqWYrengUo5SCDikFPbTD8IGXhv
 BXnuA3uM7vTo97yd+DQX1flm78rMoJlowm11SjcUfXCFlvaHUHUQxDc2NRUgYWLvbWxd
 ZiXqJ35AemgGl1QaYtnL03IpWT035f6PpKYYGQF6/sDCB8KqmvHwA5/Znp8F2GgQQNSJ
 5ZyvBMqb2thgsHPSh+vQZb1p/oK6ntPB19NGg7W3MeVjL6b4uF+5RtsSg0H8XJfMZHPL
 UT2w==
X-Gm-Message-State: AOJu0YzIe5+jwakbU1Bj74gsB7dq5CoK63HixkACMj/uiriHp7uKuSoy
 rmz41coli8lYJljozCujI1TmUBMtOVdPQwT9VCaodV/15Z5Ei3jmcH4d7czcudoZZhVu7ClX5BY
 /epWlsEgfCZCy+UBGzbfkE14X90OWTNSsSEpi
X-Google-Smtp-Source: AGHT+IGbekR0Vue1xLl0EWSZ1BWGHK5l2W7TtzXDw/0HDGKWhLS9f4FhS58OXOS/D2ImlTRUf5Ts6pGmcmOJBXePe+s=
X-Received: by 2002:a05:6830:3103:b0:6e6:7d92:d5ab with SMTP id
 b3-20020a056830310300b006e67d92d5abmr1402055ots.10.1711410717736; Mon, 25 Mar
 2024 16:51:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240325215631.3804796-1-dianders@chromium.org>
 <20240325145626.1.I659b2517d9f619d09e804e071591ecab76335dfb@changeid>
In-Reply-To: <20240325145626.1.I659b2517d9f619d09e804e071591ecab76335dfb@changeid>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 25 Mar 2024 16:51:32 -0700
Message-ID: <CAJMQK-gcN06k2zFQoSYKZcxxoRvkXVqCFmFtQ0xUS=+1VG+92Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/panel-edp: Abstract out function to set
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

On Mon, Mar 25, 2024 at 2:56=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:
>
> If we're using the generic "edp-panel" compatible string and we fail
> to detect an eDP panel then we fall back to conservative timings for
> powering up and powering down the panel. Abstract out the function for
> setting these timings so it can be used in future patches.
>
> No functional change expected--just code movement.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>

> ---
>
>  drivers/gpu/drm/panel/panel-edp.c | 40 +++++++++++++++----------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index c4f851200aa2..8a19fea90ddf 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -760,6 +760,25 @@ static void panel_edp_parse_panel_timing_node(struct=
 device *dev,
>
>  static const struct edp_panel_entry *find_edp_panel(u32 panel_id, const =
struct drm_edid *edid);
>
> +static void panel_edp_set_conservative_timings(struct panel_edp *panel, =
struct panel_desc *desc)
> +{
> +       /*
> +        * It's highly likely that the panel will work if we use very
> +        * conservative timings, so let's do that.
> +        *
> +        * Nearly all panels have a "unprepare" delay of 500 ms though
> +        * there are a few with 1000. Let's stick 2000 in just to be
> +        * super conservative.
> +        *
> +        * An "enable" delay of 80 ms seems the most common, but we'll
> +        * throw in 200 ms to be safe.
> +        */
> +       desc->delay.unprepare =3D 2000;
> +       desc->delay.enable =3D 200;
> +
> +       panel->detected_panel =3D ERR_PTR(-EINVAL);
> +}
> +
>  static int generic_edp_panel_probe(struct device *dev, struct panel_edp =
*panel)
>  {
>         struct panel_desc *desc;
> @@ -816,26 +835,7 @@ static int generic_edp_panel_probe(struct device *de=
v, struct panel_edp *panel)
>                 dev_warn(dev,
>                          "Unknown panel %s %#06x, using conservative timi=
ngs\n",
>                          vend, product_id);
> -
> -               /*
> -                * It's highly likely that the panel will work if we use =
very
> -                * conservative timings, so let's do that. We already kno=
w that
> -                * the HPD-related delays must have worked since we got t=
his
> -                * far, so we really just need the "unprepare" / "enable"
> -                * delays. We don't need "prepare_to_enable" since that
> -                * overlaps the "enable" delay anyway.
> -                *
> -                * Nearly all panels have a "unprepare" delay of 500 ms t=
hough
> -                * there are a few with 1000. Let's stick 2000 in just to=
 be
> -                * super conservative.
> -                *
> -                * An "enable" delay of 80 ms seems the most common, but =
we'll
> -                * throw in 200 ms to be safe.
> -                */
> -               desc->delay.unprepare =3D 2000;
> -               desc->delay.enable =3D 200;
> -
> -               panel->detected_panel =3D ERR_PTR(-EINVAL);
> +               panel_edp_set_conservative_timings(panel, desc);
>         } else {
>                 dev_info(dev, "Detected %s %s (%#06x)\n",
>                          vend, panel->detected_panel->ident.name, product=
_id);
> --
> 2.44.0.396.g6e790dbe36-goog
>
