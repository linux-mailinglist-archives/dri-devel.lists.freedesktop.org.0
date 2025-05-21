Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7132ABF6CA
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 15:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D111910EA73;
	Wed, 21 May 2025 13:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cVSNAXwt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA9714BCB9
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 13:10:51 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3a0adcc3e54so4292636f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 06:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747833050; x=1748437850; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r/i/cOKT8js+VBc0E/AJo6vob3UrWTCSL5Lk/36I7Dw=;
 b=cVSNAXwtxGuqnICWZ7wK2mm5kTlx8kh+xHRgBmEQXd3Dx2qj9/tQOb2QUikcgwBgxZ
 RBkvk2mlnr3hNqf8qkHenDJzH+VM2Y4cfh9TD6zyZi9Yri+fI/2aXWbCjVpYIebxsiW1
 dd/Zn4Ss+0eGQlBHUxQ3TPGYSC+LiW3u18kD+1JCq/KtU/sC0vqLHWQ1CvdUaOySdZAl
 IQxTmxNsUcMlGCKfGxh1xdNiCJxODwbKEY0BCUOKFAmkFlPQB10E1bgSzWz3UJ2U7Eu3
 PrVnz9P1rK5C/+10FOvQO/ILYACOAUiu4a8pYklybm+oTSEqP5q7aehs/79J4qCAyKZ7
 3j8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747833050; x=1748437850;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r/i/cOKT8js+VBc0E/AJo6vob3UrWTCSL5Lk/36I7Dw=;
 b=EOAL4eUNt1hrjSjNvD7ZuNNcYDadFjsbW8yftq0JyGSiJYSWuc43WYYZAbZ6kiXtdj
 lS1h6eQSmIL4MeQ7sG0OsMMqNzM2auovNfvcE28FmS3OaZgAsrT5nQhmNrTQ/hz/xyCu
 nshpneJdiegkD9NvYpUPPtcJLZp3OSsrHtBP8P8qIxXAU84OGK/9hEsQQmfs/kyl477h
 nuEwIalF2WobI4+ni8OQ5lGNhIT263IfhxGwgz1zRUUSD3lQJV24hMjtqbdOKDySgmCf
 XZuFVX8TRuR3Pz3XE725KcklKljeB085Asi25z+/CBoASJ3HkVEIlHu7HykgY6jBr9VS
 iCNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWefra/72xH2BHQGlCPl8ACy+t51Ar8P52oJ5MrxqqU42wtB5YoLKcCYGvSBpo4ybSTmTl4k9xdUYo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzeoStthpcd/EDyW1muYe49VYa8j4CSizKPOKQ7ExQMG5AdmbJX
 cBqXnPmcpm5md1zKQB04RWeIeZGfVOmiyvfsDL5X0yQIRzmM1FJKjOHX6khUTFYDLkYFMjuwMYh
 gNP5MgraeEAy7H3xuc2DZEU5i3fqbEFU=
X-Gm-Gg: ASbGncvh7IYRLS3aQEwn3YnuMQjLV1AEuOCCFH3Dd1KcfyKP/GLz/4DJsyXCin2G17t
 l36+EwmFVd5OT9mxEw2ysq9NDtLAYcf/AbEhZwD4HCfznsWNpyCFe5cq0vJHWmviKIcfeShGEbV
 hyjH7DPJjnmEUib/eTAcrJ73a8IVzHRXOqKhLT0A==
X-Google-Smtp-Source: AGHT+IH4oQ/KZkDKNtscP9U9jlsLlq7/1OVsl4bF4giaJPvt/bEthmSkeP9I6o3Q0H4C4/3CZLrskdHpBT1rmXrsgnM=
X-Received: by 2002:a05:6000:178c:b0:3a1:fe77:9e0b with SMTP id
 ffacd0b85a97d-3a35fe7962bmr16202099f8f.16.1747833050180; Wed, 21 May 2025
 06:10:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512182330.238259-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250520142815.GJ13321@pendragon.ideasonboard.com>
In-Reply-To: <20250520142815.GJ13321@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 21 May 2025 14:10:24 +0100
X-Gm-Features: AX0GCFvkUotq5lJN2WL25-xOX-EKusGynjFMjAQPIg56Hl9FpsKjDTJt3B7gMeI
Message-ID: <CA+V-a8sxHiddge_U7SLr6jBdjVvDFCzqsr6mgZBCoyVsjo9Uxg@mail.gmail.com>
Subject: Re: [PATCH v5 10/12] drm: renesas: rz-du: mipi_dsi: Add
 dphy_late_init() callback for RZ/V2H(P)
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

On Tue, May 20, 2025 at 3:28=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Mon, May 12, 2025 at 07:23:28PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Introduce the `dphy_late_init` callback in `rzg2l_mipi_dsi_hw_info` to
> > allow additional D-PHY register configurations after enabling data and
> > clock lanes. This is required for the RZ/V2H(P) SoC but not for the
> > RZ/G2L SoC.
> >
> > Modify `rzg2l_mipi_dsi_startup()` to invoke `dphy_late_init` if defined=
,
> > ensuring SoC-specific initialization is performed only when necessary.
> >
> > This change prepares for RZ/V2H(P) SoC support while maintaining
> > compatibility with existing platforms.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v4->v5:
> > - Added Reviewed tag from Biju
> >
> > v3->v4:
> > - No changes
> >
> > v2->v3:
> > - No changes
> >
> > v1->v2:
> > - No changes
> > ---
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/g=
pu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > index 55a1c1b043c8..e1ce21a9ddb3 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > @@ -34,6 +34,7 @@ struct rzg2l_mipi_dsi;
> >
> >  struct rzg2l_mipi_dsi_hw_info {
> >       int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, u64 hsfreq_millihz);
> > +     void (*dphy_late_init)(struct rzg2l_mipi_dsi *dsi);
>
> As this is called at startup time I would have called it dphy_startup.
> Up to you.
>
Agreed, I will rename this to dphy_startup_late_init().

Cheers,
Prabhakar

> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> >       void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
> >       u32 phy_reg_offset;
> >       u32 link_reg_offset;
> > @@ -320,6 +321,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi=
_dsi *dsi,
> >       txsetr =3D TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) | TXSE=
TR_CLEN;
> >       rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
> >
> > +     if (dsi->info->dphy_late_init)
> > +             dsi->info->dphy_late_init(dsi);
> > +
> >       hsfreq =3D DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
> >       /*
> >        * Global timings characteristic depends on high speed Clock Freq=
uency
>
> --
> Regards,
>
> Laurent Pinchart
