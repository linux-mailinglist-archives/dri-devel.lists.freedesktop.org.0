Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6282AC5CBC
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 00:02:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C26C110E0D0;
	Tue, 27 May 2025 22:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eReWF2z2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BFCE10E0D0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 22:02:16 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3a4e742dc97so203474f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 15:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748383334; x=1748988134; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=45g7cTsi43/UtEC2z2Icfcjh5OvH49gjNKxt8eXISRs=;
 b=eReWF2z2XnhKot5DbrVZ6wgCmTlbiXXikjAkcKwiBbHPqGQLD8bIi8bXq+4dQ9CYpW
 AZYLe8g+6U35vkbKDJp7O+j46h50XgyGNJ5yp7cWXhPEzvsoqqhpiUu4XtNLgxjSAwd6
 rmCExcCbeSyXrd9A9pWvtB8NzS3vMIdar9CmD+W7yHIDMpzTpTFJRlqZEjOw5vrYQk/O
 Y/IvpI/PqsHLEH3b9c8eOkae1G8NT01kTLbVHbLSyGx/YyUIpA3K+CwF015TcLQqbdsl
 N26Fe2dkH+6xrSrBXAvDYE2lWmqhVtG7yePNHp+zZD79WVnZ95//77pNorLteZUkQpQg
 CcYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748383335; x=1748988135;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=45g7cTsi43/UtEC2z2Icfcjh5OvH49gjNKxt8eXISRs=;
 b=S2JJJpy3QdN+d0c/0++vEzXKpDGjnZMrio1yPXwg+yNQSHGHQaxCGgiEVFE2nIJOS8
 tYdmmkGwJsDbkLtuTxL1zX600wVzSBlnwOMd7uUS8PQC1Shs+JU+8DpNiDU2McdpJ+XT
 D5nQgZ7dn6Qoz34NGh1XA/1+ETepEzAAMbpua5yio014VP/3cMEZV02kPbmdzRNnEUPd
 rLIpQeY71p1RfcqMZtsmm2qbkMEVwbBdWV7i2sbZ+TjMBC6ThnCXBDqPHvgcvXqFtZN1
 vYZaSHTszJh1E/tCA8gC4T8EuiDuqlFij6LArGT5dixty/zphgBsSUPgeqsFXK/JhgGR
 j0fQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwWIYi/NNib66UI+/0r6z/0Npst/on9lnLUiHWSYs3pM4QzRfIUfYMahg4FZ9RonB4ROiuTP2UGZE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMuqXLXYqqd7qfe1/a6/WY9NLJQD73eBd05ISbOLs3+dh6o8ez
 WrG6Gr1sMfTX5FZxQemRSVy8nAyPBnhvHf140ArTJdqNbWsVeLqVaD9A9y/MUg6GmG80ONlUEk/
 Guxz5CsHc2E2jvyVeWN3ykuQNKDN+Vt8=
X-Gm-Gg: ASbGncsPbkENFISXT4msOG2uKSwLdAqrCAVFo4wQTdbpNowJMSnCIFPUCT5SyAmZvRF
 Y7Pt56Je66rLjd+UG0wQxVOCzsfq7bW7SMXdmjQ/8IuAjb4lUJg40HVah/d6K7ApsAUNtwyywSL
 MBsLd975tK5Jwc7r+VL8V6MxxH1itSbBt7Wt4EZdNthMg6dK4iv6PzLFauoFmCOepzjg==
X-Google-Smtp-Source: AGHT+IFV2BFPgujhQs4DdxUDNb0iFOQ+SgBxmAaYbPCrwwOVCCCvsVFgokrJDqO5z7MDKzRcAoB+dMACMrcQtNTeHsY=
X-Received: by 2002:a05:6000:2087:b0:3a3:70ab:b274 with SMTP id
 ffacd0b85a97d-3a4e5e5e733mr1937547f8f.12.1748383334572; Tue, 27 May 2025
 15:02:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250512184302.241417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512184302.241417-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdV9NM3SPeZAxDnh=ez0uBvt9077_64oJe9A727p1r9QOg@mail.gmail.com>
In-Reply-To: <CAMuHMdV9NM3SPeZAxDnh=ez0uBvt9077_64oJe9A727p1r9QOg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 27 May 2025 23:01:48 +0100
X-Gm-Features: AX0GCFv-92KbzruYA4EmbsOqV1BnynHkN1flWzPNsQopGLMTzP2wm88SqFOuVcU
Message-ID: <CA+V-a8svK52e-o=EYR=+NH4BZU42A8ytwdVkmG9JB+3Gfvuoaw@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] clk: renesas: r9a09g057: Add clock and reset
 entries for DSI and LCDC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Hi Geert,

Thank you for the review.

On Fri, May 23, 2025 at 3:46=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar, Fabrizio,
>
> On Mon, 12 May 2025 at 20:43, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add clock and reset entries for the DSI and LCDC peripherals.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/clk/renesas/r9a09g057-cpg.c
> > +++ b/drivers/clk/renesas/r9a09g057-cpg.c
>
> > @@ -58,6 +60,9 @@ enum clk_ids {
> >         CLK_SMUX2_GBE0_RXCLK,
> >         CLK_SMUX2_GBE1_TXCLK,
> >         CLK_SMUX2_GBE1_RXCLK,
> > +       CLK_DIV_PLLETH_LPCLK,
>
> CLK_CDIV4_PLLETH_LPCLK?
>
Agreed, I'll rename it as above.

> > +       CLK_CSDIV_PLLETH_LPCLK,
>
> CLK_PLLETH_LPCLK_GEAR?
>
Agreed, I'll rename it as above.

> > +       CLK_PLLDSI_SDIV2,
>
> CLK_PLLDSI_GEAR?
>
Agreed, I'll rename it as above.

> >         CLK_PLLGPU_GEAR,
> >
> >         /* Module Clocks */
>
> > @@ -148,6 +182,12 @@ static const struct cpg_core_clk r9a09g057_core_cl=
ks[] __initconst =3D {
> >         DEF_SMUX(".smux2_gbe0_rxclk", CLK_SMUX2_GBE0_RXCLK, SSEL0_SELCT=
L3, smux2_gbe0_rxclk),
> >         DEF_SMUX(".smux2_gbe1_txclk", CLK_SMUX2_GBE1_TXCLK, SSEL1_SELCT=
L0, smux2_gbe1_txclk),
> >         DEF_SMUX(".smux2_gbe1_rxclk", CLK_SMUX2_GBE1_RXCLK, SSEL1_SELCT=
L1, smux2_gbe1_rxclk),
> > +       DEF_FIXED(".cdiv4_plleth_lpclk", CLK_DIV_PLLETH_LPCLK, CLK_PLLE=
TH, 1, 4),
> > +       DEF_CSDIV(".plleth_lpclk_gear", CLK_CSDIV_PLLETH_LPCLK, CLK_DIV=
_PLLETH_LPCLK,
> > +                 CSDIV0_DIVCTL2, dtable_16_128),
> > +
> > +       DEF_PLLDSI_DIV(".plldsi_sdiv2", CLK_PLLDSI_SDIV2, CLK_PLLDSI,
>
> ".plldsi_gear", CLK_PLLDSI_GEAR ...
>
Agreed, I'll rename it as above.

Cheers,
Prabhakar

>
> > +                      CSDIV1_DIVCTL2, dtable_2_32),
> >
> >         DEF_DDIV(".pllgpu_gear", CLK_PLLGPU_GEAR, CLK_PLLGPU, CDDIV3_DI=
VCTL1, dtable_2_64),
> >
>
> The rest LGTM.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
