Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5D2A247CE
	for <lists+dri-devel@lfdr.de>; Sat,  1 Feb 2025 09:55:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C76310E1DD;
	Sat,  1 Feb 2025 08:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ucw.cz header.i=@ucw.cz header.b="Cc6GyaHj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 421 seconds by postgrey-1.36 at gabe;
 Sat, 01 Feb 2025 08:55:49 UTC
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5046310E1DD
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Feb 2025 08:55:49 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id B9C5C1C01A4; Sat,  1 Feb 2025 09:48:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1738399725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S9/h32gsK9ywKqz5Lw4yDI62fcqfLayMm/eCbggP/f4=;
 b=Cc6GyaHjdGK5vJNZmBRJZdW6cD7JZ5/g+lRg3vUYzcbG8jlBBAWeaIwJQ4wfcxU2Rog8nW
 TmbodGUmcppl4wDtqneQdxt+PgGjRw8EcJj6lizfx+v5JYKlpDWrBg/55HhgDV9snGysTX
 M1H958VDKPut1DTqxg5ljm2G82rF3Xk=
Date: Sat, 1 Feb 2025 09:48:45 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Armin Wolf <W_Armin@gmx.de>
Cc: Werner Sembach <wse@tuxedocomputers.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, bentiss@kernel.org,
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org,
 onitake@gmail.com, cs@tuxedo.de,
 platform-driver-x86@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH v5 0/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
Message-ID: <Z53f7VNIgUWWFn9l@duo.ucw.cz>
References: <20250121225510.751444-1-wse@tuxedocomputers.com>
 <aa91e17f-0ea8-4645-a0f9-57c016e36a9e@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="t+WGy4gS/jMLitDQ"
Content-Disposition: inline
In-Reply-To: <aa91e17f-0ea8-4645-a0f9-57c016e36a9e@gmx.de>
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


--t+WGy4gS/jMLitDQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > I now got my feet a little wet with hid-bpf regarding something else, a=
nd
> > with that knowledge I would leave the long arrays in the beginning in t=
he
> > kernel code for the time being:
> >=20
> > sirius_16_ansii_kbl_mapping and sirius_16_iso_kbl_mapping are required
> > during initialization so they have to exist in the kernel code anyway.
> >=20
> > report_descriptor will most likly not change even for future models and
> > afaik having report_descriptors in kernel drivers is not unheard of.
> >=20
> > So the only things that could be meaningfully moved to a hid-bpf program
> > are the sirius_16_*_kbl_mapping_pos_* arrays. But for these is have to =
give
> > out some fallback value anyway for the case where a hid-bpf file is mis=
sing
> > or fails to load. So why not use real world values from my test device =
for
> > these values?
> >=20
> > As soon as there is a future device that can use the same driver with j=
ust
> > these pos arrays different, then I would implement that change via a bpf
> > program instead of a change to the kernel driver.
> >=20
> > Let me know if you too think this is a sensefull approach?
> >=20
> >=20
> > Another question: Would this patch need to wait for a userspace
> > implementation of lamp array before it can get accepted?
>=20
> It would be nice if you could test the LampArray implementation. But othe=
r than that
> userspace can catch up later.
>=20
> Still, i am interested in the opinion of the LED maintainers
> regarding the fake HID interface.

Comments from previous review were not addressed.

Most importantly, this is not a way to do kernel interface. We want
reasonable interface that can be documented and modified as needed. We
want to pass /dev/input to userspace, not raw HID. This is not ok.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--t+WGy4gS/jMLitDQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZ53f7QAKCRAw5/Bqldv6
8r1XAJ9ybQ25RhK01bbqWLJeDafym4vE7wCfcUwxRi+iQ738e+ZzEgfvabQY5NE=
=upCv
-----END PGP SIGNATURE-----

--t+WGy4gS/jMLitDQ--
