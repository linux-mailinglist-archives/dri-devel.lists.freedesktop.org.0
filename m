Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DC486001A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 18:52:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD7710E9D7;
	Thu, 22 Feb 2024 17:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ucw.cz header.i=@ucw.cz header.b="ZzVGYOK7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A54B10E9D6
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 17:52:42 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 4D55D1C0080; Thu, 22 Feb 2024 18:52:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1708624361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rgaZB3SZMoEm9PLi7mMzZRU1B6wqFrPod6EkwKRjRo4=;
 b=ZzVGYOK7E/NNZ7Y0k17U6riqoM67HDxzV6hUt95CBUqilcDuL8/LIdy0M3gvhhO2kGe8Bl
 YT/zJJ0l9B2K87MNHPT2zkbavTw5pVb71w4Ri5CX3CUYflVZZzDgXIrNfoe6zFeqCLVqNo
 w7wZNZ9nYdDmnQmv3llexMrpOtxwMSw=
Date: Thu, 22 Feb 2024 18:52:40 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Gregor Riepl <onitake@gmail.com>, Werner Sembach <wse@tuxedocomputers.com>,
 Lee Jones <lee@kernel.org>, jikos@kernel.org,
 linux-kernel@vger.kernel.org, Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org
Subject: Re: Future handling of complex RGB devices on Linux v2
Message-ID: <ZdeJ6OV6iXTLSfzt@duo.ucw.cz>
References: <9851a06d-956e-4b57-be63-e10ff1fce8b4@tuxedocomputers.com>
 <1bc6d6f0-a13d-4148-80cb-9c13dec7ed32@redhat.com>
 <b70b2ea8-abfd-4d41-b336-3e34e5bdb8c6@tuxedocomputers.com>
 <477d30ee-247e-47e6-bc74-515fd87fdc13@redhat.com>
 <e21a7d87-3059-4a51-af04-1062dac977d2@tuxedocomputers.com>
 <247b5dcd-fda8-45a7-9896-eabc46568281@tuxedocomputers.com>
 <ZdZ2kMASawJ9wdZj@duo.ucw.cz>
 <b6d79727-ae94-44b1-aa88-069416435c14@redhat.com>
 <a21f6c49-2c05-4496-965c-a7524ed38634@gmail.com>
 <825129ea-d389-4c6c-8a23-39f05572e4b4@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="cyyKuWjF0GZgvTwP"
Content-Disposition: inline
In-Reply-To: <825129ea-d389-4c6c-8a23-39f05572e4b4@redhat.com>
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


--cyyKuWjF0GZgvTwP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> For all these reasons the display analogy really is a bit fit for these k=
eyboards
> we tried to come up with a universal coordinate system for these at the b=
eginning
> of the thread and we failed ...

I quite liked the coordinate system proposal. I can propose this:

Vendor maps the keyboard lights to a grid. That would be something
16x8 for thinkpad X220. Then we provide functionality to query "is a
working pixel there" and "what kind of key is at this pixel" -- I
guess we can use input keycodes for that. Multiple pixels can map to
one keycode.

(And then we make best effort to map normal keyboards into similar
grids).

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--cyyKuWjF0GZgvTwP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZdeJ6AAKCRAw5/Bqldv6
8swPAJ0eTXg7THv3YqztC+ECLpHU9tSEOQCghojVjFEBaej133t9yKUV1+jTrdE=
=g5GA
-----END PGP SIGNATURE-----

--cyyKuWjF0GZgvTwP--
