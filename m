Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 223B7A70A97
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 20:35:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A6FA10E5E8;
	Tue, 25 Mar 2025 19:35:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Pn5Calw9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F0810E294;
 Tue, 25 Mar 2025 19:35:16 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-6f666c94285so57855247b3.3; 
 Tue, 25 Mar 2025 12:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742931316; x=1743536116; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=42aHX7MDOHSOMSp6xeS+nFUOuh+iMMc1q+a6ux7j3PQ=;
 b=Pn5Calw9gwbUVjjcfGzkdUwTxsmcBhY6XG8btdxLz2GlwW/7jP88MbuxRtSf2/qJyK
 p5xoEs1E76nZ2DaU7/4O1OJH8BIyyvxFWL3RcvmWrns1xFIIgaJAJI31ScsmErHx3+in
 m1OZeqcjPNl8QHIQxd8+CX8QGIa6eB7ejhDlLxdyxppf4R050h8A/Kc6VlXHSZQUXpF3
 DF5nBSeaj4QRkTbQyU4SV+aRniGNxPsgmg0H2B7ohjhbLpLP03zBZ81XCLdOd9YK+J3/
 9YjuN8WCZPhS08d87TsCGt4IYzHNez70t9PV6qX5c6dkrN0d4o/CiSo5GTWaj0UmFvxb
 Yf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742931316; x=1743536116;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=42aHX7MDOHSOMSp6xeS+nFUOuh+iMMc1q+a6ux7j3PQ=;
 b=QQ5f7M/Q/0ABW9UFVcDFliyihTajBfrfGWq6T5vSbRIpjc9h8P4nMAMdOSWzh8WXqQ
 e8+6n9faVZ+Yhza91hOQCoOCKy+bZ+djFOIGp1f290fFJX6Jhhzj8Nuh5LPC+jvrrYFw
 +mXBLilF9SniTXGyuKtk+Acr3CUM1UjN2qSjQJUw4bFXMRH5fFWThhdSnTLmsSSVJqec
 l1S9yvXZXWgAekYihU2Tfpq8wx/vLt5YsJexqJJo58lYz0ExQGpL66Z/t6LSyUV2QD9j
 dGvO54hgRzKcU2kdQS/o+k2ZV19li7JjGTxEDC1ASqYHjL3vYV2ZcavB055PNhtG/TQh
 jYLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQtFiJaGStI03w3MbUatAXq9BNlddO1MgSm44M7VC1kuhnFnAUaNsLUpF+zE/pZYmpNoedCyjUvPyqekBzHgmOjw==@lists.freedesktop.org,
 AJvYcCV720I7nelzU0qh6Ibvg0DXKH6QgHm/ENDoX29guQxRT4HvF8ZMhrEkkFxIwI2uysLzUESb8eFnk8WsVUw4oQ==@lists.freedesktop.org,
 AJvYcCW9SBzmoZZqATHuzT6KRA2ceyx6ohFXR0uAblaEcGytbnsuhbxVlu6mnvfpQ+YUIfCCEpo1MX4B@lists.freedesktop.org,
 AJvYcCXkF6TsDbQn8ISGV/fuVW6QU2gYd0kIJ8yDJdMdO/+8UaoOiEnzGBgsED+ep1pDVb8gdwt5WOhYkb7z@lists.freedesktop.org,
 AJvYcCXtV9Y96QZsdz8c6QTBvNvvFWbtPXmF62QhiYMP7BKiqS5i6opWPTE7vIebtIasJXoyfjgEA5x13GwL@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8pWkVIGqXztPc85jec7eY5V04v0A7BcVGdYDlOgJU/i7MG96n
 oExUF1Kv/DisMfFYHX3/YPf2z+FVKguVNGHWFugnpClPXP6feL1uWqjFprKMxbGaa4Y1Fb6UiYE
 oyPRX59RoHEJ/U1DeoHi+u6ezixI=
X-Gm-Gg: ASbGncsl1e6MrNJt3zUaeoHM49N27/yoX2wp476OKKVbn16yvsRtqutHQcoV6g7Xo3g
 d9I0GRndvPtbwYsVjdfHSEAW2tu/YQAorjaptK/pjDhg/mesyLRYWZIuSox+zYcH5jcc2OtP8VW
 s+QvAODIir/NF022/5iGBQnXan
X-Google-Smtp-Source: AGHT+IHATNylw+gsEglZW+PXGiyYbRxUfbKIQGJtdl+fH3JTfXNCfGYjHvngrOpvTsOSzlZ94tSCZQ+ubU8QCVnzCek=
X-Received: by 2002:a05:690c:7512:b0:6fd:4473:5184 with SMTP id
 00721157ae682-700bad025bcmr232347107b3.35.1742931315686; Tue, 25 Mar 2025
 12:35:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250320185238.447458-1-jim.cromie@gmail.com>
 <20250320185238.447458-48-jim.cromie@gmail.com>
 <bec1c938-aafa-49cb-b173-5b876f77779f@bootlin.com>
In-Reply-To: <bec1c938-aafa-49cb-b173-5b876f77779f@bootlin.com>
From: jim.cromie@gmail.com
Date: Tue, 25 Mar 2025 13:34:49 -0600
X-Gm-Features: AQ5f1Jqa1QuPUv1TyJbyyX5GCLsktpgCTY8YYNpeF7kzWCBGQI4AZHsFZX61b_g
Message-ID: <CAJfuBxyR_x7tKUFZppXFA_dKFaXb9gTkGnZYfP5GGA7SnorScA@mail.gmail.com>
Subject: Re: [PATCH v2 47/59] drm-dyndbg: add DRM_CLASSMAP_USE to bochs
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org, 
 jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org, 
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com, 
 ville.syrjala@linux.intel.com
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

On Mon, Mar 24, 2025 at 9:03=E2=80=AFAM Louis Chauvet <louis.chauvet@bootli=
n.com> wrote:
>
>
>
> Le 20/03/2025 =C3=A0 19:52, Jim Cromie a =C3=A9crit :
> > tiny/bochs has 5 DRM_UT_* debugs, make them controllable when
> > CONFIG_DRM_USE_DYNAMIC_DEBUG=3Dy by telling dyndbg that the module has
> > class'd debugs.
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
>
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
>
> > ---
> >   drivers/gpu/drm/tiny/bochs.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.=
c
> > index 8706763af8fb..dbcc8ba70dfa 100644
> > --- a/drivers/gpu/drm/tiny/bochs.c
> > +++ b/drivers/gpu/drm/tiny/bochs.c
> > @@ -59,6 +59,8 @@ static int bochs_modeset =3D -1;
> >   static int defx =3D 1024;
> >   static int defy =3D 768;
> >
> > +DRM_CLASSMAP_USE(drm_debug_classes);
>
> Do we need to add it for each driver that use drm_* print macros? Is it
> reasonable to add this directly in drm_print.h, so there is no way to
> miss this call if you use drm_* macros.
>

Yes, AFAIK.
Ive tried to invoke declarators from a header,
It never works out.

59/59 was an attempt to do it for everyone, but it falls down...

> >   module_param_named(modeset, bochs_modeset, int, 0444);
> >   MODULE_PARM_DESC(modeset, "enable/disable kernel modesetting");
> >
>
> --
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
