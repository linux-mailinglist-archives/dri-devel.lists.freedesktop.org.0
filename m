Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7811CBC92B1
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 15:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D227410EA3B;
	Thu,  9 Oct 2025 13:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f3z+hpId";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA2110EA3B
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 13:03:36 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3ee1221ceaaso757432f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 06:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760015015; x=1760619815; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zla+EsFG4nzRnArXGImEQSCTyHGK3J4mv7lfg4FYjWQ=;
 b=f3z+hpIdPGffjz9R63+Fe5BRlt87plXe5rtDjN4QCVBEVHZ1CU9SxjMP1iw1X+ancT
 TnzypuiKcpB3PSPEu1mHYyCT9IewR8Fq1X8flB7u2RGU4OYSqpJUbv1U63c0mB3QKUMR
 G/B6+TgetTCcXkcUSIwD3jP900fmkmYuXOdAdTwTNVkQfMhPQMNOmhGVkfgr6U+DoOD1
 9nFYGTwsOAL/AQ1D2Vi3CjS+MZHajSyVEHfyiXDDhw3z8TJsh+HzHiT/UQZEDbQGZD7+
 I9fgAoZi/OauRSj6VF5c1WM2bEyBJ4TM41VxBIDulVwBcR9+yirwDkdjF3oCGzX5GN7s
 T6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760015015; x=1760619815;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zla+EsFG4nzRnArXGImEQSCTyHGK3J4mv7lfg4FYjWQ=;
 b=cJQq+v7xxbAxwrJJh63/FJy23Wk+kwYQI9/aiWiwxhzwvBK4cFu/hEzBM5g5gFg3ex
 wL5Q7VUfwYv0dqPymE01ZzXOD/wGJS4Vh84qMqmZFeWRffAzJImw3rZdlB8qAGTej+5v
 8Jc6WFv1RcGCmebPmZ2o+8AFPXyimuPz4qKc2acZ2AaGUptKU1wTT8/FRjBwdORaaZsn
 QwBJXyKfwo/ix5uZyv1si8rB9oa8bjTRViV8ehIcSuqx8KYEGVBH85URHRFsxsJAsO2l
 ItCyLczZEwOZYhNngFmbiWba0xMGIvqimtlD8D1sk1K29z/Gn98yKu8++797jsLemB3O
 4ioA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUA9rb5zahSOe6Oy2Tu3mjPW3qvdejTfTLqIyUzjD6AvwJECimBTzxj+mLfYLaWKcka6ycIU3s61zE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1zbE4Sd0cIadIDl1YFZcy8XOZ/adfyf5YrQ0wwoBQh1PQrEIm
 GcE4vWXhek/2BLW3z+Us5jzs09qQUpg4Er4dYneMdYJXpDLD44RWHVXsBl0xS221EJ3ecBTJAJN
 SFe2nyJw1AuJHQLW6InlgUnMpGu2Be6A=
X-Gm-Gg: ASbGncvFZ0itc0gWcP5htuQWT+m0/JpV843endv/7MU2ob6LH7ZYSR6Upbq8SLFLD7T
 lkpbNdk1FbzYru+v26mcCtXGCDWel6mNaNY9RIr0qV0NzkfDks+SOGf/rlCdL3HOz4LPmVU1H6j
 PJVju6oZbRNJl97xX2ZK2c5SaBw2dNKV/iedYK9bsQmnmijM44bQGv9kHJEIIPcpCl1XD4aUm0t
 VQOniV663EV6ybnZ4ueLHaOv0VOIj5IvyiVK4yaz9eLSBXf2yV2Ea0NnakhSbGCC7wbZqjoMHw=
X-Google-Smtp-Source: AGHT+IG/ELPHmCCIZvciJbhA0k36idMhkGgCEPRr06+VPS042eX0V2JX9JR4zJTZ7TPW7Buub8nsqgeW9JGjesjwXe0=
X-Received: by 2002:a05:6000:2681:b0:413:473f:5515 with SMTP id
 ffacd0b85a97d-4266e8dd718mr4549664f8f.48.1760015014251; Thu, 09 Oct 2025
 06:03:34 -0700 (PDT)
MIME-Version: 1.0
References: <20251002161728.186024-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251002161728.186024-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUugFOOvHqjRyoPErh6rqpVuAS_Yr6mGqerKT0VQ-Y6KQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUugFOOvHqjRyoPErh6rqpVuAS_Yr6mGqerKT0VQ-Y6KQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 9 Oct 2025 14:03:06 +0100
X-Gm-Features: AS18NWB5J7UqnUnaUM9kOBg5egFn9pDXfiyyxgzQNRfPJ7AfsT8nEGf8oxH6wq0
Message-ID: <CA+V-a8t7AQH5LpJaMgq9FUnA6qiUH=d5ngp0qr523BUWu88d+A@mail.gmail.com>
Subject: Re: [PATCH v9 6/6] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
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

On Mon, Oct 6, 2025 at 1:49=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 2 Oct 2025 at 18:17, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add MIPI DSI support for the Renesas RZ/V2H(P) SoC. Compared to the
> > RZ/G2L family, the RZ/V2H(P) requires dedicated D-PHY PLL programming,
> > different clock configuration, and additional timing parameter handling=
.
> > The driver introduces lookup tables and helpers for D-PHY timings
> > (TCLK*, THS*, TLPX, and ULPS exit) as specified in the RZ/V2H(P) hardwa=
re
> > manual. ULPS exit timing depends on the LPCLK rate and is now handled
> > explicitly.
> >
> > The implementation also adds support for 16 bpp RGB format, updates the
> > clock setup path to use the RZ/V2H PLL divider limits, and provides new
> > .dphy_init, .dphy_conf_clks, and .dphy_startup_late_init callbacks to
> > match the RZ/V2H sequence.
> >
> > With these changes, the RZ/V2H(P) can operate the MIPI DSI interface in
> > compliance with its hardware specification while retaining support for
> > existing RZ/G2L platforms.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > ---
> > v8->v9:
> > - Updated Kconfig to select CLK_RZV2H
> > - Updated to use renesas.h
> > - Added reviewed-by tag from Tomi
>
> Thanks for the update!
>
> > --- a/drivers/gpu/drm/renesas/rz-du/Kconfig
> > +++ b/drivers/gpu/drm/renesas/rz-du/Kconfig
> > @@ -19,6 +19,7 @@ config DRM_RZG2L_USE_MIPI_DSI
> >         depends on DRM_BRIDGE && OF
> >         depends on DRM_RZG2L_DU || COMPILE_TEST
> >         default DRM_RZG2L_DU
> > +       select CLK_RZV2H
>
> As the kernel test robot has already told you, this is not a good idea.
> RZ/V2H support is optional, just rely on (dummy) rzv2h_get_pll_*()
> helpers returning false if CLK_RZV2H is not enabled.
>
Agreed, I will add static inline helpers in renesas.h if !CLK_RZV2H.

Cheers,
Prabhakar

> >         help
> >           Enable support for the RZ/G2L Display Unit embedded MIPI DSI =
encoders.
> >
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
>
