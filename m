Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 951B285BE5
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 09:47:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0606E79B;
	Thu,  8 Aug 2019 07:46:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 399E288E33
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 14:20:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 3348B28A935
Date: Wed, 7 Aug 2019 07:19:55 -0700
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] drm/panfrost: Add "compute shader only" hint
Message-ID: <20190807141955.GB3285@kevin>
References: <20190806195259.3531-1-alyssa.rosenzweig@collabora.com>
 <CAL_Jsq+B1jv-TzQe8oQPLS8+JPH80spe=z_SK8umtpw5AXG3Qw@mail.gmail.com>
 <20190806201129.GA4119@kevin>
 <CAL_JsqLfiYScsBGe4C=n=WVTP+bNwig7HruO7FvrSsHqD5mEkg@mail.gmail.com>
 <20190806202546.GA4872@kevin>
 <cbd704ac-f8fd-a2ed-498c-056be221398b@arm.com>
MIME-Version: 1.0
In-Reply-To: <cbd704ac-f8fd-a2ed-498c-056be221398b@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 08 Aug 2019 07:46:20 +0000
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Content-Type: multipart/mixed; boundary="===============0208094294=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0208094294==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FkmkrVfFsRoUs1wW"
Content-Disposition: inline


--FkmkrVfFsRoUs1wW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Ah-ha! Thank you for the detailed explanation; this makes a lot more
sense now :)

> In practice all this only really matters on the T62x GPU. All other GPUs
> have only one core group[1]. So it only really makes sense to use JS2 on
> the T62x where you want to use both JS1 and JS2 to run two independent
> jobs: one on each core group.
>=20
> Oh, and there is one hardware workaround (BASE_HW_ISSUE_8987) that uses
> JS2. This is to avoid vertex and compute jobs landing on the same slot.
> This affects T604 "dev15" only and is because some state was not
> properly cleared between jobs.

On my end at least, our work with compute has been focused on
RK3399/T860. In userspace, it's tempting to limit T6xx/T720 to e.g.
OpenGL ES 2.0 (between this/other errata, and of course fake-MRT), at
least for the interim.

For completeness, we'll maybe need to deal with this Eventually, but it
doesn't sound like this needs to be handled right now? (It sounds like
there's no changes needed for compute on T700+, since #8987 doesn't
apply and there's only one core group.). In that case, maybe it's not
worth it to start mucking with the UABI for a feature that may or may
not ever be used.

--FkmkrVfFsRoUs1wW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl1K3gUACgkQ/v5QWgr1
WA308hAAreikYfMps5K2sY34RM7GLCE8MSGKc9v3fr/gRTPGfzaIlE4gFzyeJdzl
HmA0igkktJFv9Su58CZGAzTgLz5TwuT/rdCo6s11TMFihXwXg0bALeP2OvPLh8oF
ibxwf19wXqs7GMtR3HAaaNdY+6DSaO34Fv0OYGKkzDUT/O6zGgDsFaivlXOfljly
Xm9T6zEI1Z9rvpqKwsZFjnHkWXeuYmKzNUJlh94S5xLipkOyrTZnVv2AJjkE5oNo
MjPoqdgA9KoudmRiQF8PdGc5dhO9lcNgPKeqvbY8yorbRWqJxoc83grnd9cBQrHl
s+ceebnPoYekIxvqXGogi1GUGXSXILUQVQ750V0kbRnoSdOCEq2g3tStKMae0P5k
9hSLJIFBiUvgfkOwidSrxSiqg+r0Yb6u3C+Tgaa0LQuzzvjTA5I67y3ZRfa3Y0qN
OGyqovwH5dizD9Rusju8iTHeeR/VIFFTTvOnS3CbDxUdMtcstk9nkJd2+k7VZDIc
GnYBijFdOpE3wfDLOpy+DBtcYsZU6Bp6TVzrCeZlSZeX3hS9jkPbn5kslQZKEQWw
9HeDVfXwhzbF8WJGr6wlxFrCi+JIwfwfFvnFMkSiNI42NDS4pUp/1/6DqS7HWmMl
c62GikFqqcccYWlLaGKaLCXY7VO2Z8aeTif1uwLhQY0f5Hr/KhM=
=wMnQ
-----END PGP SIGNATURE-----

--FkmkrVfFsRoUs1wW--

--===============0208094294==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0208094294==--
