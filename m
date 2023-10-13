Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2577C8E22
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 22:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5848410E42D;
	Fri, 13 Oct 2023 20:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2261910E42D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 20:06:22 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 09C301C0050; Fri, 13 Oct 2023 21:56:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1697226979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Jq/F5+J9wLO4vOEhN66CaFJA8HdsP3GorB/oM4sdsIk=;
 b=NmBrcN46bAlqAc8k37gS9CZrPYzsUOwBg8fUDhRwlNDqgS5VquJq2CY4yjOylgR3A4vz9l
 70V6+FXAp1jm0a2SpCNbYeY0QedxzxEF9hRgRMglLN6A/ryHq7p6V/LEEqAM+SYxLFcb0T
 8YwyenZY1bnk6O3EP/GZ39yZd0sA6kM=
Date: Fri, 13 Oct 2023 21:56:18 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: Implement per-key keyboard backlight as auxdisplay?
Message-ID: <ZSmg4tqXiYiX18K/@duo.ucw.cz>
References: <20231011190017.1230898-1-wse@tuxedocomputers.com>
 <ZSe1GYLplZo5fsAe@duo.ucw.cz>
 <0440ed38-c53b-4aa1-8899-969e5193cfef@tuxedocomputers.com>
 <ZSf9QneKO/8IzWhd@duo.ucw.cz>
 <a244a00d-6be4-44bc-9d41-6f9df14de8ee@tuxedocomputers.com>
 <ZSk16iTBmZ2fLHZ0@duo.ucw.cz>
 <aac81702-df1e-43a2-bfe9-28e9cb8d2282@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="N7n33QpGAkTgmfyU"
Content-Disposition: inline
In-Reply-To: <aac81702-df1e-43a2-bfe9-28e9cb8d2282@tuxedocomputers.com>
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
Cc: Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--N7n33QpGAkTgmfyU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> coming from the leds mailing list I'm writing with Pavel how to best hand=
le
> per-key RGB keyboards.
>=20
> His suggestion was that it could be implemented as an aux display, but he
> also suggested that I ask first if this fits.

Thanks for doing this.

> The specific keyboard RGB controller I want to implement takes 6*21 rgb
> values. However not every one is actually mapped to a physical key. e.g. =
the
> bottom row needs less entries because of the space bar. Additionally the
> keys are ofc not in a straight line from top to bottom.

So... a bit of rationale. The keyboard does not really fit into the
LED subsystem; LEDs are expected to be independent ("hdd led") and not
a matrix of them.

We do see various strange displays these days -- they commonly have
rounded corners and holes in them. I'm not sure how that's currently
supported, but I believe it is reasonable to view keyboard as a
display with slightly weird placing of pixels.

Plus, I'd really like to play tetris on one of those :-).

So, would presenting them as auxdisplay be acceptable? Or are there
better options?

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--N7n33QpGAkTgmfyU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZSmg4gAKCRAw5/Bqldv6
8vs1AJ9BZjtk1gkmyD0cS+oSxeJwzwcjKwCdGTjWT+VUCWYHDh3v+eArFhOO+go=
=OCDY
-----END PGP SIGNATURE-----

--N7n33QpGAkTgmfyU--
