Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E3F988BBC
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 23:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A9FF10ED26;
	Fri, 27 Sep 2024 21:13:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ucw.cz header.i=@ucw.cz header.b="kAuFu+HO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9A010ED26
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 21:13:05 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id DB0A41C00B3; Fri, 27 Sep 2024 23:03:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1727470995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SDyrJfOzttkCBWAPJJENDhELp/mHPzDrymXHNYlDyd0=;
 b=kAuFu+HO2SGrke+T3SD9lIoFQTaLsBFA29Qft2q5QnPTKWu1hhQd6pUo0XNcwRej/Y+8Qg
 15G/kZT5ylTIcwJscQ2g5aLTHBNv9zjaXJQnNvzkADK3p5YfuAUhF2qZ3O8IXrqsBZuA7e
 YDhk0rfYqlCb06k9Ff4q3ppQ4fnq5WI=
Date: Fri, 27 Sep 2024 23:03:14 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
 dri-devel@lists.freedesktop.org, hdegoede@redhat.com,
 jelle@vdwaa.nl, jikos@kernel.org, lee@kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
 ojeda@kernel.org, onitake@gmail.com
Subject: Re: [PATCH 0/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04
Message-ID: <ZvcdknJWzaLbhgyE@amd.ucw.cz>
References: <20240926174405.110748-1-wse@tuxedocomputers.com>
 <et3cv7i2lhsjoq26toweh4uv72yo34u3wqrj3q2urfnx2bhiq3@fdtkag4bcekh>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="8et7i8b3htfBrpbi"
Content-Disposition: inline
In-Reply-To: <et3cv7i2lhsjoq26toweh4uv72yo34u3wqrj3q2urfnx2bhiq3@fdtkag4bcekh>
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


--8et7i8b3htfBrpbi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2024-09-27 18:08:52, Benjamin Tissoires wrote:
> On Sep 26 2024, Werner Sembach wrote:
> > Hi,
> > took some time but now a first working draft of the suggested new way of
> > handling per-key RGB keyboard backlights is finished. See:
> > https://lore.kernel.org/all/1fb08a74-62c7-4d0c-ba5d-648e23082dcb@tuxedo=
computers.com/
> > First time for me sending a whole new driver to the LKML, so please exc=
use
> > mistakes I might have made.
> >=20
> > Known bugs:
> > - The device has a lightbar which is currently not implemented and
> >   therefore stuck to blue once the first backlight control command is s=
end.
> >=20
> > What is still missing:
> > - The leds fallback
> > - Lightbar control
> >=20
> > Some general noob questions:
> >=20
> > Initially I though it would be nice to have 2 modules, one jsut being t=
he
> > wmi initialization and utility stuff and one just being the backlight l=
ogic
> > stuff, being loaded automatically via module_alias, but that would still
> > require me to create the virtual hid device during the wmi_ab probe, and
> > that already needs the ll_driver, so i guess I have to do it statically
> > like i did now?
> > Or in other words: I would have liked to have a module dependency graph
> > like this:
> >     tuxedo_nb04_lamp_array depends on tuxedo_nb04_platform (combining *=
_wmi_init and *_wmi_utility)
> > but if i currently split it into modules i would get this:
> >     tuxedo_nb04_wmi_ab_init dpends on tuxedo_nb04_wmi_ab_lamp_array dep=
ends on tuxedo_nb04_wmi_utility
>=20
> On more general question to you: how much confident are you about your
> LampArray implementation?
>=20
> If you still need to add/fix stuff in it, I would advise you to have a
> simple HID device, with bare minimum functionality, and then add the
> LampArray functionality on top through HID-BPF. This way you can fix
> LampArray out of band with the kernel, while having a more stable kernel
> module. This should be possible with v6.11+.
>=20
> Another solution is to still have your wmi-to-hid module, and then a
> HID kernel module in drivers/hid that supports LampArray.
>=20
> But I would strongly suggest while you are figuring out the userspace
> part to stick to HID-BPF, and then once you are happy we can move to a
> full kernel module.

What about creating real kernel driver with real interface to
userland, instead? My preference would be treating this as a display,
but nearly anything is better than _this_.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--8et7i8b3htfBrpbi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZvcdkgAKCRAw5/Bqldv6
8rBlAKCfdrgp9aTsCLmDnhs2OYYXhvpJUgCglw2O3Bhu87qBixOdtRPMx4XXxIk=
=fk2l
-----END PGP SIGNATURE-----

--8et7i8b3htfBrpbi--
