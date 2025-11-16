Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50839C616F2
	for <lists+dri-devel@lfdr.de>; Sun, 16 Nov 2025 15:37:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E38A10E2C0;
	Sun, 16 Nov 2025 14:37:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hReJ0nw5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E4510E161
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 14:37:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 01E14601EB
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 14:37:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A71BBC113D0
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 14:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763303851;
 bh=2Bggx1JE8zrmrCOlLWA1b4H8PTZ9Hv6P2gnc61wAGjg=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=hReJ0nw5+W23nQcULZpkXPGjdtKIkKQRDDgXEWOZD6+yQH+WVgRoFy7kG3aPRjnW+
 TFgb1HBXGtzcJuNARqACSjFASZXzJGV7Ft4d8z40QcPUbI3WP4JDcC0RPtRUEW3Ozt
 cx3Gm5Oc6zSaRjff4fZhQ13GmgQxu19StTQ+DGj3r4QDr8SuWz+BzU+C82zNWPmg6T
 1T+pCCfVl/gbYn+54GfiDY/Hy17JCL7dDXxnXEyYXyndwXuS6OSODo1hh9N5g3ZHQ7
 8NmamzUtJFvLUVH6vhhyhS9q5l/akZF1NziwuzZVXNnruglfARaBd/wStr20lOxiiL
 nnhtovb7RvbVg==
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-37ba5af5951so28238171fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 06:37:31 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUbR6YBrkoQOcmrRUkPrwDcYs054kDqVN1e4tpF3HH+d3yKoQ2EMusFrXg0jhzJ+xnNWRSJaJBZmx8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzCiHR9o1kmyH6sff9qfmE2DyjxoUm6TeNpn9tOzRLltVSM+8T
 EZHk7QsCiDEEMEtvoSxZk+lQgwbeLvilc1oPoH3wi/quQPCv5Q+EjpPuNBDdsZ8x9JKTksDRYz3
 vNu75HgbvIv+BWnb5W/+jL285GSC+fhc=
X-Google-Smtp-Source: AGHT+IG7vqFgL8pcnoWY4X8bK83bCjs7yr5BwCnDCB4u5oYDjeQdmjUX3ZIX6NF6V8m3f8emPC7cEmlAcG+l7wyAhyk=
X-Received: by 2002:a2e:b952:0:b0:378:f267:3107 with SMTP id
 38308e7fff4ca-37babd46336mr21467291fa.37.1763303850006; Sun, 16 Nov 2025
 06:37:30 -0800 (PST)
MIME-Version: 1.0
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
 <20251116134609.447043-1-kuba@szczodrzynski.pl>
 <CAGb2v67V01k8zj2r+Dd+JDEsH2LX2Jtx+CP=i8aQfX_JyFtLfg@mail.gmail.com>
 <7ff30ae9-e4c0-47ae-80ad-726eaa557fd0@szczodrzynski.pl>
In-Reply-To: <7ff30ae9-e4c0-47ae-80ad-726eaa557fd0@szczodrzynski.pl>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 16 Nov 2025 22:37:15 +0800
X-Gmail-Original-Message-ID: <CAGb2v67iovqfErt20Oz0SrHC558zBDDFq1ZqRau83NOQ2w8AoQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnuktLAy6WzxMHGACOr-_rXESjXpP0XBu3tC1d0_mcaLovZAV-ch-mI9ko
Message-ID: <CAGb2v67iovqfErt20Oz0SrHC558zBDDFq1ZqRau83NOQ2w8AoQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] drm/sun4i: Support LVDS on D1s/T113 combo D-PHY
To: =?UTF-8?Q?Kuba_Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
Cc: Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, parthiban@linumiz.com, paulk@sys-base.io
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
Reply-To: wens@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 16, 2025 at 10:31=E2=80=AFPM Kuba Szczodrzy=C5=84ski
<kuba@szczodrzynski.pl> wrote:
>
> W dniu 2025-11-16 o 15:03:18, Chen-Yu Tsai pisze:
>
> > On Sun, Nov 16, 2025 at 9:46=E2=80=AFPM Kuba Szczodrzy=C5=84ski
> > <kuba@szczodrzynski.pl> wrote:
> >> [replying to v1 to keep the same series on Patchwork]
> > That is not the right way to do it.
> >
> > If you reply to an old series, the tooling does not pickup the new vers=
ion
> > as a separate series.
> >
> > ChenYu
>
> Hi,
>
> I noticed that it indeed didn't work. However, Patchwork didn't pick up t=
he v2 cover letter at all, so I thought replying to v2 would mess up the th=
read even more.
>
> That being said, the v3 cover letter is not visible there either.
>
> Should I resend this as v4 [which message to reply to?] or send a complet=
ely new series perhaps?

Each new version should be a completely new series.

If patchwork still didn't pick it up, then it's possible either your
patches didn't reach the mailing lists or the patchwork instances.
Please check lore to see if your patches are there.


ChenYu

> I apologize for the confusion, this is my first time doing that.
>
> Regards
> Kuba
>
> >> Some Allwinner chips (notably the D1s/T113 and the A100) have a "combo
> >> MIPI DSI D-PHY" which is required when using single-link LVDS0. The sa=
me
> >> PD0..PD9 pins are used for either DSI or LVDS.
> >>
> >> Other than having to use the combo D-PHY, LVDS output is configured in
> >> the same way as on older chips.
> >>
> >> This series enables the sun6i MIPI D-PHY to also work in LVDS mode. It
> >> is then configured by the LCD TCON, which allows connecting a
> >> single-link LVDS display panel.
> >>
> >> Changes in v2/v3:
> >> - Applied code formatting changes from review comments
> >> - Changed "dphy" to "combo-phy"
> >> - Made the LVDS setup/teardown functions abort early in case of error
> >>    (adding a proper return value would require changes in several leve=
ls
> >>     of caller functions; perhaps could be done in a separate patch)
> >> - Added the PHY properties to DT bindings
> >> - Renamed lvds0_pins to lcd_lvds0_pins
> >> - Rebased on top of drm/misc/kernel/for-linux-next
> >> - Hopefully corrected the incomplete patch list of v2, which happened
> >>    due to an SMTP error
> >>
> >> Kuba Szczodrzy=C5=84ski (6):
> >>    phy: allwinner: phy-sun6i-mipi-dphy: Support LVDS in combo D-PHY
> >>    drm/sun4i: Support LVDS using MIPI DSI combo D-PHY
> >>    drm/sun4i: Enable LVDS output on sun20i D1s/T113
> >>    dt-bindings: display: sun4i: Add D1s/T113 combo D-PHY bindings
> >>    riscv: dts: allwinner: d1s-t113: Add D-PHY to TCON LCD0
> >>    riscv: dts: allwinner: d1s-t113: Add LVDS0 pins
> >>
> >>   .../display/allwinner,sun4i-a10-tcon.yaml     |  6 ++
> >>   .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 11 +++
> >>   drivers/gpu/drm/sun4i/sun4i_tcon.c            | 50 +++++++++++++
> >>   drivers/gpu/drm/sun4i/sun4i_tcon.h            |  6 ++
> >>   drivers/phy/allwinner/phy-sun6i-mipi-dphy.c   | 70 +++++++++++++++++=
+-
> >>   5 files changed, 141 insertions(+), 2 deletions(-)
> >>
> >> --
> >> 2.25.1
> >>
>
