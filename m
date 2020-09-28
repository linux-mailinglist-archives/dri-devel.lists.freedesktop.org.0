Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDBF27AF42
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 15:42:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A3EA89FA5;
	Mon, 28 Sep 2020 13:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A8489FA5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 13:42:45 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id y11so1323198lfl.5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 06:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=IgLUPlZ1uB6XwRe3UJlJQtWtNUp3LzmZtPqAI0gAQfw=;
 b=JyawWYv9RmnKOqbkoj/wNrOxh9mWSYYShd9hPOJMjDfYaGOjsJAwTfe1AEVrsvYR9G
 IgNpA4mq5rii+wDu4qu+KVc8OrY86D0zbLPYORMp2dFyhsKXkzqy/gK2vosdp47P6uUu
 7cViSt4b4WMT+Qwig54N8I2g9tYcdlBa5jpbV8ynTt8A+rXUJoG1jPyoyWR7Li7FWZjx
 adXTgeFcsj20x/fGr6hn10v89MrY7aZuwqAHWvj8wb3u/64otSbb9A1rkpBxxE3KXtnU
 3RL1Hc3qCnK4C/MfCE/c1qtQfnrRblnXyjtgNYDdsX6/JF7YXSzA6YxUe73qvSN7saqZ
 mJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=IgLUPlZ1uB6XwRe3UJlJQtWtNUp3LzmZtPqAI0gAQfw=;
 b=R6nDReks/lJJC5GQETX05UVlEdNXsFnoJACjBXUcBmhZmGmzdQL+a1xqN0txsT6sg9
 OhKzlsNYsWLvTlQjPJGwvYeXHQnEKofORGQmmWBgciIC2PHrL3n9DVCSBCHQibsG3zj2
 6Ko/gnWk+Aa1JfZeoOo/aFshbFtOCMsdQHG/p4MVTTnHwFl5qgrHrrvcGmjHLCU8+9pz
 Uit7OQN9wk6Mglx7FfFNiuH/jLZCeMpHH6on8O9ABSDaDtuPyujOuA5yREZvqQOl83V7
 8P7mBGd2xWiXLxJ/myU/NuAWFaEe+xs128cl/hJXn8iwFYlbc6pChM//QjThQDUZZnSg
 TtHA==
X-Gm-Message-State: AOAM532bymq4FbhhRoV6oRJbP/pTQMGjB9EYnH2Xpumu4lE+AntIsgQi
 JOVq5G20hrLwXx9p4sLtFU4=
X-Google-Smtp-Source: ABdhPJzjKlJ7+GOiUYhFPUy0hygksLcrXOlVpHytAeocmGOOYr1v/xOlf2aWOHgyOX3mo5wtWyE+9w==
X-Received: by 2002:ac2:4c9c:: with SMTP id d28mr535620lfl.93.1601300563879;
 Mon, 28 Sep 2020 06:42:43 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id n20sm2884354lfh.1.2020.09.28.06.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 06:42:43 -0700 (PDT)
Date: Mon, 28 Sep 2020 16:42:33 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 1/9] drm/format-helper: Pass destination pitch to
 drm_fb_memcpy_dstclip()
Message-ID: <20200928164233.5cc03332@eldfell>
In-Reply-To: <20200928102428.23kix246wli3knjs@sirius.home.kraxel.org>
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <20200625120011.16168-2-tzimmermann@suse.de>
 <20200629084044.GL3278063@phenom.ffwll.local>
 <89cff54c-789f-02fd-4939-35956b51cb56@suse.de>
 <CAKMK7uESYkP4Fa9mrN5dxT1bDxkHxhHkBF4FbosiOiyMzYJ=Bg@mail.gmail.com>
 <35822c4b-7821-7b33-d6ce-cfe51a85ff74@suse.de>
 <CAKMK7uGem0wKdmRwmk-ztNZbVW6UFmnPkXWSxicRG1S+8VszbA@mail.gmail.com>
 <20200928102428.23kix246wli3knjs@sirius.home.kraxel.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Dave Airlie <airlied@linux.ie>,
 Emil Velikov <emil.l.velikov@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============1128080632=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1128080632==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/aHX9ZHE3d05fiY0bQNCB+n_"; protocol="application/pgp-signature"

--Sig_/aHX9ZHE3d05fiY0bQNCB+n_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 28 Sep 2020 12:24:28 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
>=20
> > > I don't quite remember where exactly this was implemented. It was not=
 a
> > > shared buffer, though. IIRC the buffer allocation code in one of the
> > > libs rounded the size towards multiples of 64. I remember thinking th=
at
> > > it was probably done for tiled rendering. =20
>=20
> Happens when running gnome in wayland mode, so whatever the display
> server is in that case (mutter?) or one of the libraries it uses.
>=20
> > Yeah, but you don't do rendering on dumb buffers. Like ever. So this
> > smells like a userspace bug.
> >=20
> > If it's for shared buffers then I think that sounds more reasonable. =20
>=20
> Well, wayland can use dma-bufs for buffer sharing between wayland server
> and wayland client.  Dunno whenever it also does that for the software
> rendering case, and I have absolutely no idea how the buffer allocation
> code paths look like.  But possibly it isn't known at buffer allocation
> time whenever a given buffer will be touched by a gpu at some point in
> the future?

Hi,

generally, all buffer allocation is in Mesa GBM with Mutter, even for
software rendering, as IIRC Mutter does not have a software renderer at
all, it only has (various?) GL paths.

Mutter does have code for allocating dumb buffers on "secondary GPUs"
that I touched this or last year, and I'm fairly certain that does not
do any tricks with size or stride. You also never touch that code if
you only have one DRM device in use.

Wayland apps OTOH should not have access to allocate dumb buffers in
the first place, AFAIU, unless maybe vgem or something.

Added Jonas to CC.


Thanks,
pq

--Sig_/aHX9ZHE3d05fiY0bQNCB+n_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl9x6EkACgkQI1/ltBGq
qqdV5Q/+Lp8MZ4BIJaGQB58lhoxaIjT7XvfntlnO+6dVlyDvj0UG1VYaqZYxJSqV
ClwgdAirpsaAKqRSQd4iPTWfnWsUwGsK/ZFbncF7YWUtD3c80V1Lh6P9lfzqG+48
5gRDmiiD6rN9V1heZG3s+WpAKSTgvK7CDUYZgTUAfMKFQXIkHVJ46F58V4cgy1ox
n+s3+uXS9BTJbz9SVC4EFLlzjVZ53bqIXai2N6RlV5BJJdIFmHoDuRhHqFKUh9LP
XkXRt283NOC81vhzhRYHTQJ4raOCyyBk2ERSjW1dYhZlR9GcEhDVo+lpIbRvvYmY
/GFAS9ZBHZ2mU2LlMxajbd+/1cUU/YdEYygF6R9H7XGi+2HT0+5DR6vaOAblHWnu
iTI1N8V3dgL9iqyyz+UXX5+YRE+/pgHKa8hPCG38/C6x/4CkhdeAU/tNJ9eGCFOR
ySHxLZjU3AgP1B3nWtJptBWj7693FhBHAfBk7cA6QbcV1vnIvaTBov0XT3bARZfH
UoivDpIidCkR/G0VBMKBBskK3zHh1RP3zt3D5Miji8C9vxtVr9YEk8qccV29NCoX
w7jXMaWzjsAqRMcbgajJ15AmxF3Sf+jNhA18w87Y/VIQFJyX4v3mtoyAITYaHJhf
BEdqjxakKxfmv/6fmGT/9U0BXnKZn6tIK+gSK0pqaybOXGE0+lU=
=Vwde
-----END PGP SIGNATURE-----

--Sig_/aHX9ZHE3d05fiY0bQNCB+n_--

--===============1128080632==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1128080632==--
