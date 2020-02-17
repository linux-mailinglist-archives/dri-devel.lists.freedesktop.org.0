Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 917271611CE
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 13:15:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BCC06E937;
	Mon, 17 Feb 2020 12:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A85656E936
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 12:15:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D6E930E;
 Mon, 17 Feb 2020 04:15:14 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB6FB3F703;
 Mon, 17 Feb 2020 04:15:13 -0800 (PST)
Date: Mon, 17 Feb 2020 12:15:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [RFC 6/9] regmap: Speed up _regmap_raw_write_impl() for large
 buffers
Message-ID: <20200217121512.GC9304@sirena.org.uk>
References: <20200216172117.49832-1-noralf@tronnes.org>
 <20200216172117.49832-7-noralf@tronnes.org>
MIME-Version: 1.0
In-Reply-To: <20200216172117.49832-7-noralf@tronnes.org>
X-Cookie: There was a phone call for you.
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: balbi@kernel.org, linux-usb@vger.kernel.org, lee.jones@linaro.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1470759001=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1470759001==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f0KYrhQ4vYSV2aJu"
Content-Disposition: inline


--f0KYrhQ4vYSV2aJu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 16, 2020 at 06:21:14PM +0100, Noralf Tr=F8nnes wrote:

> When writing a 3MB buffer the unwritable check in _regmap_raw_write_impl()
> adds a ~20ms overhead on a Raspberry Pi 4.
> Amend this by avoiding the check if it's not necessary.

This is a generic optimization, why is it mixed in with the rest of this
series?  There is no dependency either way :(

>  	/* Check for unwritable registers before we start */
> -	for (i =3D 0; i < val_len / map->format.val_bytes; i++)
> -		if (!regmap_writeable(map,
> -				     reg + regmap_get_offset(map, i)))
> -			return -EINVAL;
> +	if (map->max_register || map->writeable_reg || map->wr_table) {
> +		for (i =3D 0; i < val_len / map->format.val_bytes; i++)
> +			if (!regmap_writeable(map,
> +					      reg + regmap_get_offset(map, i)))
> +				return -EINVAL;
> +	}

This is going to break if there is any change to the implementation of
regmap_writeable().  The code should at least be next to that if not
actually shared so that this doesn't happen.  I'd suggest implementing a
function regmap_writeable_range() and then making regmap_writeable()
call that.

--f0KYrhQ4vYSV2aJu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5Kg88ACgkQJNaLcl1U
h9Cqvwf/b0w5H5olLei00kwpkml0bAiaSqYNvHWjnvPQy5UyJuoRvZzGKOzzd3Pd
xYUkjSU9pYQbSq1vTg7gjw4RjiUxdAWAiaeTAOxF6CEzbZ23oP8xavpEf+ZlSkjU
WUB4muajVxmpQOa+iQxXOO1RYL1KLcNE23nQeaoPSXQxCfqjKM13avtXqEjFxRvi
xH+HJ+ZljukvM+pEqYc4q6SlWJ4mOxuXm8hkOcVBa2JbvbOJd2b9pGXp502iSURi
TiKdf2YXr+pn1tp2XiRAaBOLVzRbQcAb6Y4ZnSJmLMR584fhgzBJUbJDmIHDeklJ
q5v8iZXWrEPSQbQq7++Ce80mkC9oxg==
=Yug8
-----END PGP SIGNATURE-----

--f0KYrhQ4vYSV2aJu--

--===============1470759001==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1470759001==--
