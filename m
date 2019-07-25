Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBBC76275
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 11:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 544E26ECF0;
	Fri, 26 Jul 2019 09:42:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CFFA6E7E6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 17:40:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id A7099283BEB
Date: Thu, 25 Jul 2019 10:40:06 -0700
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: Re: [PATCH v2 6/7] drm/panfrost: Add support for GPU heap
 allocations
Message-ID: <20190725174006.GA2876@kevin>
References: <20190725011003.30837-1-robh@kernel.org>
 <20190725011003.30837-7-robh@kernel.org>
 <ab9c3277-9e34-2712-975b-7c59b64e52d0@arm.com>
 <9eaf879c-bd7b-aded-e8f6-8efc2394fef5@arm.com>
 <20190725161344.GA2950@kevin>
 <482dc837-3ca8-dd93-bbc6-0eb97f3627e7@arm.com>
MIME-Version: 1.0
In-Reply-To: <482dc837-3ca8-dd93-bbc6-0eb97f3627e7@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Fri, 26 Jul 2019 09:41:34 +0000
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
 Maxime Ripard <maxime.ripard@bootlin.com>, Robin Murphy <Robin.Murphy@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>, Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============0193423976=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0193423976==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Content-Disposition: inline


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Sorry, I was being sloppy again![1] I meant CPU mmapped.=20

No worries, just wanted to check :)

> Apparently the blob in some cases creates a SAME_VA GROW_ON_GPF buffer -
> since SAME_VA means permanently mapped on the CPU this translated to
> mmapping a HEAP object. Why it does this I've no idea.

I'm not sure I follow. Conceptually, if you're permanently mapped,
there's nothing to grow, right? Is there a reason not to just disable
HEAP in this cases, i.e.:

	if (flags & SAME_VA)
		flags &=3D ~GROW_ON_GPF;

It may not be fully optimal, but that way the legacy code keeps working
and upstream userspace isn't held back :)

> The main use in the blob for
> this is being able to dump buffers when debugging (i.e. dump buffers
> before/after every GPU job).=20

Could we disable HEAP support in userspace (not setting the flags) for
debug builds that need to dump buffers? In production the extra memory
usage matters, hence this patch, but in dev, there's plenty of memory to
spare.

> Ideally you also need a way of querying which pages have been backed
> by faults (much easier with kbase where that's always just the number
> of pages).

Is there a use case for this with one of the userland APIs? (Maybe
Vulkan?)

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl056W4ACgkQ/v5QWgr1
WA3Ing//VYMnCHKc6vVqs61m+6X+phJVa3UNlcK1U7ypIOSJtliwxHDGJJMey8jh
cO+Gu2fOqb5ecCtnPrrtzCIqFwmpaEpzwKnFqJ436i9OAh1lJ+i9n9I4eyc/L1Ms
vKA9aYhZEE/K8hqu2Ovztyz7U8EhfNOFhrpMi16cdnHyoYw1X/0HNcYQ6oNNk7HB
NeyBj+S+bXj+X5RzZz3YkLSHoRi6HVR26VIVmy6+B1XuwcLMcN4AES9v+pmrl0n/
TL0vT9v732bKeZgvxM4cQYS0LiBzWN8/RBv9qQiHKTvilSqnhW54sRyp0SrUgVu0
U/HytZcgsLlenE1LqLp9zVMeeK3jTnftldTnUxNjb43iU/iNFVnZvSHf+muL69jO
SBvFPkpN4KIVKmmnH41eKgg5WqkckJ76aoX3Q+zzdklGdAiK86rqBwaUFLKPa8J5
qFmRC5Bvd2bLB/o5+V5bKNXBOe6HY8tGbucFXyNwHcw1qiagRJ7P3+v2+9kbToaK
QJzwggkKdE7KZm7sPbJZAgJ7UAtKVZKZdg3rrSuEUlrdoWMYfmPMzja3081i/dxZ
nTl6Ykk0JL59kyD4+/HRtJvOwpscUBWGFxWJwwUA6vPv8oVM2fwWBCY924GlyXuQ
KYf23HU579MDqyQP8RQ9E/GCBeGRXElPo99wip2ifnQKwFqwPBI=
=QdVs
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--

--===============0193423976==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0193423976==--
