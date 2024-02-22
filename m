Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 088CA860369
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 21:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 985D510EA5A;
	Thu, 22 Feb 2024 20:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WZmTbpeG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5ED10EA5A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 20:02:57 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a3d484a58f6so16123566b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 12:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708632175; x=1709236975; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D91+NNYRuFeok9CBgQ7kElLom/IZjF4ZNUVGAGFMcWc=;
 b=WZmTbpeG73BQCQ4L/VZ09BgQx0UM14BvC6H8nUtUF6DbjqaTny3/RkCH+2OVoXwp3n
 CnjHArEQWPGGVw1zC0tqizpZgxuHqSDum3JlwwD/sa87Mud7OPMuHhVIKa+6GUJu1HZc
 48gt/YVp1sC+S/yhEq2e+2jSiw/I9FqFYq7eVHsdNp72MJQtSwNLhiqLTqBAmlehaPsy
 sXcrKfEnrhRAAIcKYBpzjJEp17HhIV/LEA0us6UTUPhnrxoVR2CT+xb6G2kjZ6aHLq7C
 7qKC0FudvTNj95MlFy1hofzpn7X0l8/luna7ION/PyJkPKBPNIczibedXjEpKA5YiqJU
 KuIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708632175; x=1709236975;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D91+NNYRuFeok9CBgQ7kElLom/IZjF4ZNUVGAGFMcWc=;
 b=L7S5GmkhJVbbOYBrEwE3ndydV/Iz98No8kHwM9NbUCmIjgtAD4Azve7SdJ2g1lknDs
 Dgg3fsC05X8iNJt/74v6inN3ZCOHvJMqW8MESBJVHHU6DtZZVF3Kle4QcDFz4cTgBf0x
 63fxeXIYMaP+RC8zFmfDt80byFJf3RkCuK255+/ui+VIluf7dOg0WzDq1+sYvcF2Vbn3
 jwxpClIPnllO0iGQCIDHy6mwHq/pbRcB7OKHha3WbJhJqdoun1sEOeZWjo40hviLz+K6
 kQr3s3IsSGUreNzEP2qIN7OzT43R+Ea6qmi1NVpOLU1THhZS+oY7c/Q3hePinvggsF3W
 iHWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcU/gP7cQYzszjy1Z+lx55HyZ5C4FQGqNRKNprDYQR/hZROCCU7G4cdO48Tn5I+q5dwsomULX93jFI7jRuGjWi3JlwaO6dvrVSjqXZ+p3r
X-Gm-Message-State: AOJu0Yx6Tr8WEUfr+E0wJQ1u9d6tvf3rn7oueMA1q8PxLxElbrJH3oWF
 ny24eAeSyIEx/36wDScLyDCrclRKkvmaRw7ND5/RvPAE+NH//NQb
X-Google-Smtp-Source: AGHT+IEgvTKQkasQRFEm9qA5fvN8XNPWdx6hB/jSsMaHVhviWIDzjakARe/kyNDcFAl7qhoDmu/LtA==
X-Received: by 2002:a17:906:b106:b0:a3e:e869:a151 with SMTP id
 u6-20020a170906b10600b00a3ee869a151mr5856787ejy.45.1708632174997; 
 Thu, 22 Feb 2024 12:02:54 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net.
 [86.58.6.171]) by smtp.gmail.com with ESMTPSA id
 l20-20020a1709067d5400b00a3e85909a1csm4520555ejp.182.2024.02.22.12.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 12:02:54 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: =?utf-8?B?T25kxZllag==?= Jirman <megi@xff.cz>,
 Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/sun4i: Fix layer zpos change/atomic modesetting
Date: Thu, 22 Feb 2024 21:02:53 +0100
Message-ID: <2448947.jE0xQCEvom@jernej-laptop>
In-Reply-To: <inuhwnlexpt6dpre4uailtvytjhms4uqeerzehbntczurhcxol@fc4nvkdwffdd>
References: <20240216190430.1374132-1-megi@xff.cz>
 <20240216190430.1374132-4-megi@xff.cz>
 <inuhwnlexpt6dpre4uailtvytjhms4uqeerzehbntczurhcxol@fc4nvkdwffdd>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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

Dne sreda, 21. februar 2024 ob 14:45:20 CET je Maxime Ripard napisal(a):
> Hi,
>=20
> On Fri, Feb 16, 2024 at 08:04:26PM +0100, Ond=C5=99ej Jirman wrote:
> > From: Ondrej Jirman <megi@xff.cz>
> >=20
> > Identical configurations of planes can lead to different (and wrong)
> > layer -> pipe routing at HW level, depending on the order of atomic
> > plane changes.
> >=20
> > For example:
> >=20
> > - Layer 1 is configured to zpos 0 and thus uses pipe 0. No other layer
> >   is enabled. This is a typical situation at boot.
> >=20
> > - When a compositor takes over and layer 3 is enabled,
> >   sun8i_ui_layer_enable() will get called with old_zpos=3D0 zpos=3D1, w=
hich
> >   will lead to incorrect disabling of pipe 0 and enabling of pipe 1.
> >=20
> > What happens is that sun8i_ui_layer_enable() function may disable
> > blender pipes even if it is no longer assigned to its layer.
> >=20
> > To correct this, move the routing setup out of individual plane's
> > atomic_update into crtc's atomic_update, where it can be calculated
> > and updated all at once.
> >=20
> > Remove the atomic_disable callback because it is no longer needed.
> >=20
> > Signed-off-by: Ondrej Jirman <megi@xff.cz>
>=20
> I don't have enough knowledge about the mixers code to comment on your
> patch, so I'll let Jernej review it. However, this feels to me like the
> pipe assignment is typically the sort of things that should be dealt
> with device-wide, and in atomic_check.

In DE2 and DE3.0, you cannot move planes between mixers (crtcs), because ea=
ch
one is hardwired to specific mixer. Movable planes are the feature of DE3.3
and one of the pain points for upstreaming the code. Anyway, this commit on=
ly
addresses current issue of enabling and disabling planes and handling zpos.

In atomic check you can only precalculate final register values, but I don't
see any benefit doing that. I think that this code elegantly solves current
issue of enabling or disabling wrong plane in certain situations, so:

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Note, if there is new revision, please rewrite blender regmap_update_bits()
to regmap_write(). Since there is HW issue with reads, I would like to
get rid of regmap_update_bits() calls eventually.

Best regards,
Jernej

>=20
> If I'm talking non-sense, it would be great to mention at least why that
> can't be an option in the commit log.
>=20
> Maxime
>=20




