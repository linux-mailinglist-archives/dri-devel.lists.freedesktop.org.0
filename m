Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5B06FD959
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 10:30:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E1D10E459;
	Wed, 10 May 2023 08:30:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010E710E459
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 08:30:44 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-24e25e2808fso6355129a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 01:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683707444; x=1686299444;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Gj4rNe9q8jSfWDp/ypQzgo3GKje+dWPaI3Tr4ZM2VU=;
 b=dEPAnIzT0WteEAlWgQg7YSoPFVzNp99Rl56DGMWH71YEGSZPGGPwPhPRh38UGT1Clb
 nsQsUc0wzyj3CBgFs37GGPG1AYVWQzKwpVolW3wqGbXZeSU/VcFnLbdOQMnXL1ak/jxt
 wNIj/cmrWKZKK7Qq4jg9z6PAOTCYfA+1QHw/7/6EoTc5vWEoE1NPKBsNqyA4p5PwwVfe
 H7ZMTk7LoVHXZp7DjisXYZwEANq+XJeiQ0ZCImSmICgHyJ9NxPVJZLvBtxEh4ofJqydj
 qeNjcXL+AvyBhmK+7jp88LDQjmYPtxbtxe27bBdomNNIeIWzSRPeCaOp0HuBLNlNRYaw
 Ly/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683707444; x=1686299444;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+Gj4rNe9q8jSfWDp/ypQzgo3GKje+dWPaI3Tr4ZM2VU=;
 b=aftsioTUzU2UEvJWfCkFS/zjaoklPKD4hgA3z8OrFsLWLgsEJEasx/xKk50rchxOlu
 Q0idIUXdvALinxgDQt7Oq35Y2cxfG9U1DWP2a00ZWKYM9sNriD/taCATw8lGqBA3ekzV
 O6i9jHZ462UdYzNf8tr6q31x/k8jYcpQk58/Poo+5ktrIO1t11R31W1TEVCc0W2jYnON
 kih0gWcIbRfG3OH8TwBU1zDIX2kbw90Z7QOGdAEe2xDfV3gSJ9Lqc/+awm1GM8/YVXaQ
 DePiuOi+c0lTPvmz5Q+K5oYKiuDLqT5FCXm0u+lh0sbFYEkYSyhowUrkkUwYVrCm6yn1
 4X8A==
X-Gm-Message-State: AC+VfDw2ivmjfcxV29rrRLyZ2yTT4pugMPsMTyfkt5mP3M37td06M5ht
 /27zm7tb+K40dI67rTCTFXQEnFChtR+Jy1GZ420=
X-Google-Smtp-Source: ACHHUZ4Br5vyvQv5lHgaPPiZAKCUUEir6+fEHPRg8sLb5SXW3EPjOff6aRIYLKC9Qq/A4C4xPbWuMDqOdu9mxWX2M5w=
X-Received: by 2002:a17:90b:1997:b0:250:2337:9b96 with SMTP id
 mv23-20020a17090b199700b0025023379b96mr17550693pjb.9.1683707443869; Wed, 10
 May 2023 01:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230508055740.635256-1-victor.liu@nxp.com>
 <20230508055740.635256-3-victor.liu@nxp.com>
 <05b44685-d6a7-5f6e-0f55-04c96e94a9e1@denx.de>
In-Reply-To: <05b44685-d6a7-5f6e-0f55-04c96e94a9e1@denx.de>
From: Ying Liu <gnuiyl@gmail.com>
Date: Wed, 10 May 2023 16:30:32 +0800
Message-ID: <CAOcKUNXjvOMXtf2FVwjhWNbdwQy82T+wz-QN7ukAOmQo5DKQ2w@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] drm: lcdif: Drop unnecessary NULL pointer check on
 lcdif->bridge
To: Marek Vasut <marex@denx.de>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, kernel@pengutronix.de,
 Liu Ying <victor.liu@nxp.com>, s.hauer@pengutronix.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 alexander.stein@ew.tq-group.com, krzysztof.kozlowski@linaro.org,
 robh+dt@kernel.org, linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org,
 LW@karo-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 9, 2023 at 10:14=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:
>
> On 5/8/23 07:57, Liu Ying wrote:
>
> Hi,

Hi,

>
> > diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/=
lcdif_kms.c
> > index 262bc43b1079..e54200a9fcb9 100644
> > --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > @@ -394,7 +394,7 @@ static void lcdif_crtc_mode_set_nofb(struct lcdif_d=
rm_private *lcdif,
> >       struct drm_display_mode *m =3D &lcdif->crtc.state->adjusted_mode;
> >       u32 bus_flags =3D 0;
> >
> > -     if (lcdif->bridge && lcdif->bridge->timings)
> > +     if (lcdif->bridge->timings)
> >               bus_flags =3D lcdif->bridge->timings->input_bus_flags;
> >       else if (bridge_state)
> >               bus_flags =3D bridge_state->input_bus_cfg.flags;
> > @@ -463,30 +463,21 @@ static void lcdif_crtc_atomic_enable(struct drm_c=
rtc *crtc,
> >       struct drm_display_mode *m =3D &lcdif->crtc.state->adjusted_mode;
> >       struct drm_bridge_state *bridge_state =3D NULL;
> >       struct drm_device *drm =3D lcdif->drm;
> > -     u32 bus_format =3D 0;
> > +     u32 bus_format;
> >       dma_addr_t paddr;
> >
> > -     /* If there is a bridge attached to the LCDIF, use its bus format=
 */
> > -     if (lcdif->bridge) {
> > -             bridge_state =3D
> > -                     drm_atomic_get_new_bridge_state(state,
> > -                                                     lcdif->bridge);
> > -             if (!bridge_state)
> > -                     bus_format =3D MEDIA_BUS_FMT_FIXED;
> > -             else
> > -                     bus_format =3D bridge_state->input_bus_cfg.format=
;
> > -
> > -             if (bus_format =3D=3D MEDIA_BUS_FMT_FIXED) {
> > -                     dev_warn_once(drm->dev,
> > -                                   "Bridge does not provide bus format=
, assuming MEDIA_BUS_FMT_RGB888_1X24.\n"
> > -                                   "Please fix bridge driver by handli=
ng atomic_get_input_bus_fmts.\n");
> > -                     bus_format =3D MEDIA_BUS_FMT_RGB888_1X24;
> > -             }
> > -     }
> > +     bridge_state =3D drm_atomic_get_new_bridge_state(state, lcdif->br=
idge);
> > +     if (!bridge_state)
> > +             bus_format =3D MEDIA_BUS_FMT_FIXED;
> > +     else
> > +             bus_format =3D bridge_state->input_bus_cfg.format;
>
> The code below seems to change the logic slightly.
>
> Could it happen that:
> - bridge_state is valid (i.e. non-NULL)
> - bridge_state->input_bus_cfg.format is set to 0 (i.e. not set) ?
>    (note that MEDIA_BUS_FMT_FIXED is defined as 0x0001)

Yes, bridge_state->input_bus_cfg.format could be zero.
Will keep the below default MEDIA_BUS_FMT_RGB888_1X24
bus format setting in next version.

Regards,
Liu Ying

>
> > -     /* If all else fails, default to RGB888_1X24 */
> > -     if (!bus_format)
> > +     if (bus_format =3D=3D MEDIA_BUS_FMT_FIXED) {
> > +             dev_warn_once(drm->dev,
> > +                           "Bridge does not provide bus format, assumi=
ng MEDIA_BUS_FMT_RGB888_1X24.\n"
> > +                           "Please fix bridge driver by handling atomi=
c_get_input_bus_fmts.\n");
> >               bus_format =3D MEDIA_BUS_FMT_RGB888_1X24;
> > +     }
> >
> >       clk_set_rate(lcdif->clk, m->crtc_clock * 1000);
>
> [...]
