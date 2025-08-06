Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D70FEB1BF6D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 05:50:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B1410E2E0;
	Wed,  6 Aug 2025 03:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hoadD4uY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE9810E2E0
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 03:50:17 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-880f82dfc7fso307600839f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 20:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754452217; x=1755057017; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w3i5QRO+5MfhCKu77ANJ3jBdCFtUPuCB3IIfNSEzuAM=;
 b=hoadD4uYN0TzKrFUxbhzX5ESU4+rl5KYRMIkmJ+CbDK9PexNHLweFjqDkpLJZk5bC1
 gnXXDW7Rlkh695wCWgcMZexX//SzOC4yuk8xj8duEtqjbAocVjkp2AYBOY4NT4m5Ea3B
 pEuhZ+2RV0qdY/KAethQ7NO2XaDQyp50NJC3H0ujjcetvyIINJKs9EIC//E/JyYMHvE4
 Z3wBPQ5Jmfi4931NWtcyeOa2BC1j6OXGKoY/KT5jbfzQ9SB4JLIbmNgGZUtKAqLVFXd7
 XS6c0eapSdJA2dQtFTRPp81PhWa8ayP1iEbZ2rTK/TAmdMuM+e/QUbFho4KUFNemmlfr
 uukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754452217; x=1755057017;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w3i5QRO+5MfhCKu77ANJ3jBdCFtUPuCB3IIfNSEzuAM=;
 b=i3ezYlO5pJYDFjyw3tOJPYrwGC5DM1QQ5G9x3JZaLydyDdfhHVvQNRBCQL+0yy2w6D
 2SMc+3MDzOckkRGULNryFYR5/+hL4u9lZlVruWlJISSNdV3J66LssjCxjC5u/7y6QVAj
 TTFUUhB9+tYLXoxIrLThIgjtmHXb2hY9cd1Xu51SI7DGG79v+TrTfIntcXx8sR4lhpee
 NSyBRtA36xCjitA5n6LOmnpTs15JRpMhP51Vze2x5uPvVEGsMS0FNgSKVO4O6c22dCdO
 XncHuqvZ41frWRqLmCoNWlBysC4t9Rq7eGlFH+j2xDDhxtcJSfFwxQ5SSc4zb9HMwxfE
 3T+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2KRmbkQjdWoX7spIyHVD1j8ivaIbn3gtcsQk18WwpP/o4eoiRYHWStiJK4I8hbl6epqyMjEtVqCg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxaar/PmV89FZmRwgqAtDtb+Y4yKr6fYL5k3Og7QWxQ447MTPoF
 QEm3BaeM+bfRXFlGK9Fnjy9CtlwgNxcf55hUKY8z0yuVApimabM0ofvz6HLOuGkshN/ipC61fxm
 fiq1xtO4K4WDrGYfLQw6lPjKvWmjpv2g=
X-Gm-Gg: ASbGnctJSYdiqux0Po2v4JpLcOzDaDPLMAjHS62pmZfBOlt7K9tuV6JF7cmpKYHyURh
 oqMA0mFic40v778EcxBZPydRns6dT2cjq+NaOr6WQef6crDuKfxkdonAMV9qSp7a0rKoFDzgaxF
 hIhUuHAuhmw1sUAMAICdS/clW1qXp8LYKe06p2ZfPCVtR+DuHGHU9/yJE4YpK5YquOY+gR+Fx3y
 r75Hgk=
X-Google-Smtp-Source: AGHT+IFCQESUgdKuGOqs444QSzygbhrbLJwY9iG/XD2Q5CtWib3hxKckGgR3Hyw/Y4VQLjfx/NuyfuaWMxWrok5dFkc=
X-Received: by 2002:a05:6602:2b07:b0:881:7e3a:4a37 with SMTP id
 ca18e2360f4ac-8819f065f0bmr265326839f.6.1754452216814; Tue, 05 Aug 2025
 20:50:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250804104722.601440-1-shengjiu.wang@nxp.com>
 <20250804104722.601440-7-shengjiu.wang@nxp.com> <1932645.tdWV9SEqCh@steina-w>
In-Reply-To: <1932645.tdWV9SEqCh@steina-w>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 6 Aug 2025 11:49:57 +0800
X-Gm-Features: Ac12FXyh9zIEFgIR4jwpAfqlHLcCdIoWysUI9X5TL5LXhlIGHinLI0hUpNeMIog
Message-ID: <CAA+D8AM7hEcyVaZF7MHN-jY_NOS+cdhrXGdTXeQ48-WV=bnLMA@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] arm64: dts: imx8mp: Add hdmi parallel audio
 interface node
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org, 
 l.stach@pengutronix.de, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
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

On Tue, Aug 5, 2025 at 3:10=E2=80=AFPM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Am Montag, 4. August 2025, 12:47:22 CEST schrieb Shengjiu Wang:
> > The HDMI TX Parallel Audio Interface (HTX_PAI) is a bridge between the
> > Audio Subsystem to the HDMI TX Controller.
> >
> > Shrink register map size of hdmi_pvi to avoid overlapped hdmi_pai devic=
e.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp-evk.dts |  4 +++
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi    | 28 +++++++++++++++++++-
>
> Please separate commits for SoC and board files. Thanks

Ok.

Best regards
Shengjiu Wang
>
> Best regards,
> Alexander
>
> >  2 files changed, 31 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/=
boot/dts/freescale/imx8mp-evk.dts
> > index c0cc5611048e..cc9351a5bd65 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > @@ -442,6 +442,10 @@ &flexcan2 {
> >       status =3D "disabled";/* can2 pin conflict with pdm */
> >  };
> >
> > +&hdmi_pai {
> > +     status =3D "okay";
> > +};
> > +
> >  &hdmi_pvi {
> >       status =3D "okay";
> >  };
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boo=
t/dts/freescale/imx8mp.dtsi
> > index 841d155685ee..00d8474bd1b1 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -2066,7 +2066,7 @@ irqsteer_hdmi: interrupt-controller@32fc2000 {
> >
> >                       hdmi_pvi: display-bridge@32fc4000 {
> >                               compatible =3D "fsl,imx8mp-hdmi-pvi";
> > -                             reg =3D <0x32fc4000 0x1000>;
> > +                             reg =3D <0x32fc4000 0x800>;
> >                               interrupt-parent =3D <&irqsteer_hdmi>;
> >                               interrupts =3D <12>;
> >                               power-domains =3D <&hdmi_blk_ctrl IMX8MP_=
HDMIBLK_PD_PVI>;
> > @@ -2092,6 +2092,24 @@ pvi_to_hdmi_tx: endpoint {
> >                               };
> >                       };
> >
> > +                     hdmi_pai: audio-bridge@32fc4800 {
> > +                             compatible =3D "fsl,imx8mp-hdmi-pai";
> > +                             reg =3D <0x32fc4800 0x800>;
> > +                             interrupt-parent =3D <&irqsteer_hdmi>;
> > +                             interrupts =3D <14>;
> > +                             clocks =3D <&clk IMX8MP_CLK_HDMI_APB>;
> > +                             clock-names =3D "apb";
> > +                             power-domains =3D <&hdmi_blk_ctrl IMX8MP_=
HDMIBLK_PD_PAI>;
> > +                             status =3D "disabled";
> > +
> > +                             port {
> > +
> > +                                     pai_to_hdmi_tx: endpoint {
> > +                                             remote-endpoint =3D <&hdm=
i_tx_from_pai>;
> > +                                     };
> > +                             };
> > +                     };
> > +
> >                       lcdif3: display-controller@32fc6000 {
> >                               compatible =3D "fsl,imx8mp-lcdif";
> >                               reg =3D <0x32fc6000 0x1000>;
> > @@ -2143,6 +2161,14 @@ port@1 {
> >                                               reg =3D <1>;
> >                                               /* Point endpoint to the =
HDMI connector */
> >                                       };
> > +
> > +                                     port@2 {
> > +                                             reg =3D <2>;
> > +
> > +                                             hdmi_tx_from_pai: endpoin=
t {
> > +                                                     remote-endpoint =
=3D <&pai_to_hdmi_tx>;
> > +                                             };
> > +                                     };
> >                               };
> >                       };
> >
> >
>
>
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> http://www.tq-group.com/
>
>
