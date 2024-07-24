Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 651B993B60B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 19:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE9310E780;
	Wed, 24 Jul 2024 17:36:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ucw.cz header.i=@ucw.cz header.b="Wf2ZI1L8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9CFB10E780
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 17:36:51 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 7B2661C009D; Wed, 24 Jul 2024 19:36:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1721842610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=an3NqH+1POnuE0beDev8aj+SC67nRWyTt2QwUTuBvJg=;
 b=Wf2ZI1L80VoiKf0pRGMckpaygLO6rn19EUfxCYXkPO1XwvCDoTea5PyGdak/2bkd7zdqsF
 nSlnfqqQCl/67cUoLvnxx790Kr8iaBslYEh72AWlZ4+URtcNSc7L/U72Q64mO7RcxMjJit
 g6VosIXwfCnhRHl+4jxyzkWlQ6Czq/Y=
Date: Wed, 24 Jul 2024 19:36:50 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Benjamin Tissoires <bentiss@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Lee Jones <lee@kernel.org>,
 jikos@kernel.org, linux-kernel@vger.kernel.org,
 Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org,
 linux-leds@vger.kernel.org, Gregor Riepl <onitake@gmail.com>
Subject: Re: In kernel virtual HID devices (was Future handling of complex
 RGB devices on Linux v3)
Message-ID: <ZqE7sk0ZW0q8ueul@duo.ucw.cz>
References: <247b5dcd-fda8-45a7-9896-eabc46568281@tuxedocomputers.com>
 <ZdZ2kMASawJ9wdZj@duo.ucw.cz>
 <b6d79727-ae94-44b1-aa88-069416435c14@redhat.com>
 <a21f6c49-2c05-4496-965c-a7524ed38634@gmail.com>
 <825129ea-d389-4c6c-8a23-39f05572e4b4@redhat.com>
 <adbfdf6c-fb59-4fae-a472-17b04dd8a3f6@tuxedocomputers.com>
 <1fb08a74-62c7-4d0c-ba5d-648e23082dcb@tuxedocomputers.com>
 <aec1d22d-9e59-4dfc-b108-5ba339b0e76a@redhat.com>
 <siebkhaauocqkuox73q2e5p2mbsyc7j4gvpzfvt4c3gvncdpap@oxh5pp4gxpuo>
 <870cca8a-1a1b-4d17-874e-a26c30aca2bf@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="PO2vVUoo5RSgWJzT"
Content-Disposition: inline
In-Reply-To: <870cca8a-1a1b-4d17-874e-a26c30aca2bf@tuxedocomputers.com>
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


--PO2vVUoo5RSgWJzT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > IMO working with the HID LampArray is the way forward. So I would
> > suggest to convert any non-HID RGB "LED display" that we are talking
> > about as a HID LampArray device through `hid_allocate_device()` in the
> > kernel. Basically what you are suggesting Hans. It's just that you don't
> > need a formal transport layer, just a child device that happens to be
> > HID.
> >=20
> > The next question IMO is: do we want the kernel to handle such
> > machinery? Wouldn't it be simpler to just export the HID device and let
> > userspace talk to it through hidraw, like what OpenRGB does?
>=20
> That's already part of my plan: The kernels main goal is to give devices a
> LampArray interface that don't have one already (e.g. because they are no
> HID devices to begin with).
>=20
> The actual handling of LampArray will happen in userspace.
>=20
> Exception is that maybe it could be useful to implement a small subset of
> LampArray in a generic leds-subsystem driver for backwards compatibility =
to
> userspace applications that only implement that (e.g. UPower). It would
> treat the whole keyboard as a single led.

Are you sure LampArray is good-enough interface? OpenRGB exposes
keycode-to-LED interface, how will that work with LampArray?

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--PO2vVUoo5RSgWJzT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZqE7sgAKCRAw5/Bqldv6
8ga8AJ9BT/RPUldd2PgRbjEZ62iTLLo7HQCgpJKSBBtTvzqxW31MSQlB/aghnwY=
=B9/0
-----END PGP SIGNATURE-----

--PO2vVUoo5RSgWJzT--
