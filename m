Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FC97860D
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 09:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B90089C63;
	Mon, 29 Jul 2019 07:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749286ED7C
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 13:57:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id F0A262611D8
Date: Fri, 26 Jul 2019 06:57:08 -0700
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 6/7] drm/panfrost: Add support for GPU heap allocations
Message-ID: <20190726135708.GA8834@kevin>
References: <20190725011003.30837-1-robh@kernel.org>
 <20190725011003.30837-7-robh@kernel.org>
 <ab9c3277-9e34-2712-975b-7c59b64e52d0@arm.com>
 <9eaf879c-bd7b-aded-e8f6-8efc2394fef5@arm.com>
 <20190725161344.GA2950@kevin>
 <482dc837-3ca8-dd93-bbc6-0eb97f3627e7@arm.com>
 <20190725174006.GA2876@kevin>
 <1c54bd6c-a594-614d-7de0-badb00269ea1@arm.com>
MIME-Version: 1.0
In-Reply-To: <1c54bd6c-a594-614d-7de0-badb00269ea1@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 29 Jul 2019 07:16:44 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Robin Murphy <Robin.Murphy@arm.com>
Content-Type: multipart/mixed; boundary="===============0194078125=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0194078125==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Content-Disposition: inline


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> It looks like the driver might be allocated a depth or stencil buffer
> without knowing whether it will be used. The buffer is then "grown" if
> it is needed by the GPU. The problem is it is possible for the
> application to access it later.

Hmm. I "think" you should be able to use a dummy (unbacked) Z/S buffer
when it won't be used, and as soon as the *driver* decides it will be
used (e.g. by setting the MALI_MFBD_DEPTH_WRITE bit), *that* is when you
allocate a real memory-backed BO. Neither case needs to be growable;
growable just pushes the logic into kernelspace (instead of handling it
in userspace).

The only wrinkle is if you need to give out addresses a priori, but that
could be solved by a mechanism to mmap a BO to a particular CPU address,
I think. (I recall MEM_ALIAS in kbase might be relevant?)

> * Use HMM: CPU VA=3D=3DGPU VA. This nicely solves the problem, but falls =
over
> badly when the GPU VA size is smaller than the user space VA size - which=
 is
> sadly true on many 64 bit integrations.
>=20
> * Provide an allocation flag which causes the kernel driver to not pick a
> GPU address until the buffer is mapped on the CPU. The mmap callback would
> then need to look for a region that is free on both the CPU and GPU.
>=20
> The second is obviously most similar to the kbase approach. kbase simplif=
ies
> things because the kernel driver has the ultimate say over whether the
> buffer is SAME_VA or not. So on 64 bit user space we upgrade everything to
> be SAME_VA - which means the GPU VA space just follows the CPU VA (similar
> to HMM).

I'll let Rob chime in on this one. Thank you for the detailed write-up!

-Alyssa

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl07Bq8ACgkQ/v5QWgr1
WA1pwhAAn9fsxrbA+xLp7zfZPzLyVOGRLYko+8QNlfSXAB9/hdCY9u9sruCuvZNd
YS7PX4Sjh+uPSw5QQgi6ReIgOZFfU3idfDtNsJqaJRoJpkjLB3l+of6EvgSihtPo
F2OS0i/BjqesMJH8sPcjv9O49WhtohjYj4lCRZuPu02PBGc+3VfKUcgQ5DmqHvAE
q3ygzLRd97EIlmUXPZ3G4kAuARKV05Gtn2LQwJKi+jBfit0Pwtf90+HBvHxo/KGQ
98qwmSJb+dOWhy2RJgdomE8TmA6P2z1Lwt6jqLkatMnJ2S/h9ZNp7vRf0fqHghFF
BGP6ZlNhHPDE3xRim9sX+YRIwSwsgwMqQ3gtreE4zNcE8UCRgm9MGe1yzT3bXqXo
BOW4WJPDZmLTFTbVodHR4QsrZTk+XEtzk53B77fEC+DRJbPX+yHTsuxdvKQ9mWlz
ZyNF3LfMLU5Xf5Ks9z1yhP+gr88Dkf1hJOwKYLhqov+loN1jWAzQNqPxPb7sFwyD
0hHiM2t5s4VVQHhmomDqvCExhDSmgg/oK1IqXbHBfoxOyAoHmgtPBjuTJmjTfFa2
9dMiMumezD2QS7P94b1bf/QKYrYkdPa7vZSl6q52kCQbS1FbmnUNJ1FGiQ8TfK9I
JsxQ8dXzYChgR/MkOfRV1Sd41b6+YjaTAxP70q1bT6XLWOCQsmI=
=3Eqd
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--

--===============0194078125==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0194078125==--
