Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6353EABF687
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 15:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2353F10F6D0;
	Wed, 21 May 2025 13:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ngYDWRvQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE96D14B8A0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 13:02:05 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-442ccf0e1b3so84065065e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 06:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747832524; x=1748437324; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bmXU8KBDB233JjIK1ODnuLy3coNih7UFHZ8VsOcgN+0=;
 b=ngYDWRvQzGsdPNU7Zyu063zcMh+MJsHBSNWGXmwQbOrMiglOxk5gPQ9W+/jC69nvwD
 EA44b/ZkazZvSeSDGYuzTAgP0TP+IzTlbwJIgL83t3zjVdd6anwgAMYbXz60yGm4dGVR
 RJFSarmmxExAgtPh8KEG5OSe2AUpqhH0LMTqGKQz6UuBTocRXDy+/dmTcZK9cB8aDIEI
 bNqjkT5K/xlGPTrC/FQ9TUoFU4BK13qup5nxkLKIdHTjxP2rd2bY1CGUJQw4cN+hPAbi
 Y6eu2irC49/cZyJVFf4lJe5iqI4QZ4Y3e0RQ4phkxoBqsdpBxB7AQ2uCyhpzJVTh9Rl4
 ZrqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747832524; x=1748437324;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bmXU8KBDB233JjIK1ODnuLy3coNih7UFHZ8VsOcgN+0=;
 b=acB5U3ViPuwcJIf8sivKjPKUvG9Wqp+tiNe2QxEuKcVM4SNiiXBMKbUclvZG115wzW
 /QymoG6ulYC8uJ3E8snkQ1ZW4TnuT5fybguSBUbCi614YWfMv9PA7yZkXHiGW3RJQs74
 5SpuB6/D1jqnKinNCUN3vhvLhETHh3saLAylTIkz+EtY2aZijlPE6axlHABtbJPWGfq0
 F5u+QmFx9iXQl1wm06fVbuRRVX8IC0XOggpXmMjHNJ6aJNxTWlE/ByNj0SH4K6jVIdqT
 gx599aDRGaGkRYVwKqY/6DQPnYGP1mEQ5BCzbwJDJ2CQHCeYXPWhvvNN36ixPi9dA8jX
 /21w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3Zfan4p4QGU2j4D6TZ3aynhA77bxhg/TBgvWkclJOiGQirgWmaAKaqO0dtMXsjN4i2G6McbCYtfA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyg3u36N/vRKTYu/iyr+vREz2uHZvleRpXmA8WUUYzBsN2gRWcM
 qo6aEP9e2GhlnPEXtvZncDt351GyTCFROtqk8HEKgpkXvlzDy1wSKPtujP+HH84cUFp+VJec4HG
 /VL1WyhNoDdiR8xZ0juYtFdmeaiqDrug=
X-Gm-Gg: ASbGnctyzPZABYME20wM4GKW4LzaghTn6XawiyqEyAyV5D37w4VwDrxgrsHS1VmB1ZQ
 x/YoNNkKgOtnkOOcrqrp76NfeXRb2poo1VgLHQDVPUXNrrLDH5VGs6mMyjRE4ZI3JB9dq0+O8Sy
 CAnqmM1wdDovsXLzwUfhThxj3j2eZ7Tzt/3uFJIw==
X-Google-Smtp-Source: AGHT+IFoWwKL0JlRqJiqoNHNvz66aPp7wIa51xRehBMoBO1ScvekUMbPVG/LKrbcj5M69N6ry5MNkYl3/sR/JqNxWuE=
X-Received: by 2002:a05:600c:6487:b0:43c:fe15:41c9 with SMTP id
 5b1f17b1804b1-442fd622e97mr179727585e9.9.1747832523172; Wed, 21 May 2025
 06:02:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512182330.238259-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250520135820.GC13321@pendragon.ideasonboard.com>
In-Reply-To: <20250520135820.GC13321@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 21 May 2025 14:01:35 +0100
X-Gm-Features: AX0GCFt7GSGvdoA8i47pvJvno_4NO5uT_BXI_Lak85lev8oBUTuihwtydPWscd8
Message-ID: <CA+V-a8swf=LeUxmEFkMCOK-rJ8w+yZK_ALG=GvFRq7VRF_NW+Q@mail.gmail.com>
Subject: Re: [PATCH v5 03/12] drm: renesas: rz-du: mipi_dsi: Add min check for
 VCLK range
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
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

Hi Laurent,

Thank you for the review.

On Tue, May 20, 2025 at 2:58=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> On Mon, May 12, 2025 at 07:23:21PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The VCLK range for Renesas RZ/G2L SoC is 148.5 MHz to 5.803 MHz. Add a
>
> I would write "5.803 MHz to 148.5 MHz" as ranges are usually expressed
> in increasing order.
>
Ok, I will update the commit message as above.

Cheers,
Prabhakar

> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> > minimum clock check in the mode_valid callback to ensure that the clock
> > value does not fall below the valid range.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v4->v5:
> > - No changes
> >
> > v3->v4:
> > - No changes
> >
> > v2->v3:
> > - No changes
> >
> > v1->v2:
> > - Added reviewed tag from Biju
> > ---
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/g=
pu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > index 4550c6d84796..ec8baecb9ba5 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > @@ -584,6 +584,9 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge =
*bridge,
> >       if (mode->clock > 148500)
> >               return MODE_CLOCK_HIGH;
> >
> > +     if (mode->clock < 5803)
> > +             return MODE_CLOCK_LOW;
> > +
> >       return MODE_OK;
> >  }
> >
>
> --
> Regards,
>
> Laurent Pinchart
