Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3807AC90D1
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 15:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C4C10E84B;
	Fri, 30 May 2025 13:58:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="XolpLGhH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C341710E813;
 Fri, 30 May 2025 13:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1748613510;
 bh=S8/E7ll4dARKhPnoLH44EgVYxvFxRNTJ8+4nXDAWXb4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XolpLGhHvWcjAt2uJRg6JGmMx9WyXtSaXRfoftSPFEUQQt1VaVrf6DRYBbZsZYpAZ
 XWpbmOfDrXvy+6NbSF0JI0BUHBd/6CXas5F7/qQoLQ3GNi9717R+r04m6d6ZS0ZRKr
 Tcan2lK5HySGlZPVi+wCCprAW5edRb1X3IkneS0sJppXDlxzhKGJWmXFyg6NIE/WNI
 o2DSm2dAyd4Fi+cKXg2TAFSm1urFxsqmouhKTyDxtesQ1v3Vkqxr/aNzX/QfMHxF9P
 39lbdt3oahbTQxzU5Sa9+oacjmbpoz9Vb8FPTMm4ku6HcFSzp18fgfwXvMdlrdj1s+
 8cUZQSYooLnrw==
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1FC1A17E0C37;
 Fri, 30 May 2025 15:58:29 +0200 (CEST)
Date: Fri, 30 May 2025 16:58:17 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: "Shankar, Uma" <uma.shankar@intel.com>
Cc: Simon Ser <contact@emersion.fr>, Harry Wentland
 <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "wayland-devel@lists.freedesktop.org"
 <wayland-devel@lists.freedesktop.org>, "leo.liu@amd.com" <leo.liu@amd.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "mwen@igalia.com" <mwen@igalia.com>, "jadahl@redhat.com"
 <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "agoins@nvidia.com" <agoins@nvidia.com>,
 "joshua@froggi.es" <joshua@froggi.es>, "mdaenzer@redhat.com"
 <mdaenzer@redhat.com>, "aleixpol@kde.org" <aleixpol@kde.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>, "victoria@system76.com"
 <victoria@system76.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "quic_naseer@quicinc.com" <quic_naseer@quicinc.com>,
 "quic_cbraga@quicinc.com" <quic_cbraga@quicinc.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>, "marcan@marcan.st"
 <marcan@marcan.st>, "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>,
 "sashamcintosh@google.com" <sashamcintosh@google.com>, "Borah, Chaitanya
 Kumar" <chaitanya.kumar.borah@intel.com>, "louis.chauvet@bootlin.com"
 <louis.chauvet@bootlin.com>
Subject: Re: [PATCH V8 32/43] drm/colorop: Add 1D Curve Custom LUT type
Message-ID: <20250530165818.0e6cb846@eldfell>
In-Reply-To: <DM4PR11MB6360CE0C5C99FB02CD6CC0BFF499A@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-33-alex.hung@amd.com>
 <CY5PR11MB63441E057180C043C51230A3F4B22@CY5PR11MB6344.namprd11.prod.outlook.com>
 <fzuE3KXuocsKA0I9kWXruyw7IVbw3jwH2yeh59SfE0Qb0SGxa29rrj9X_XgNCdmj1vWgxLO619xyJY3r5R3hsZK6ElIkTvbyNfu40x1SiZM=@emersion.fr>
 <CY5PR11MB63449DBA54519766E345CADAF4B22@CY5PR11MB6344.namprd11.prod.outlook.com>
 <3ca1958f-62e0-4a5c-837b-3cd705acc181@amd.com>
 <ZqHOWK3X_Ici9wNgijgeUt9r3asi4jhqw-0-keIfXYAFxbsGLaFTIozGHHR64SnkAzPA4CM-zmc6OwVtrKMKjVyoblti88KpRf9wEu8daP0=@emersion.fr>
 <DM4PR11MB6360CE0C5C99FB02CD6CC0BFF499A@DM4PR11MB6360.namprd11.prod.outlook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/r7.3hMmy35MS7Y8d+OflcKb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/r7.3hMmy35MS7Y8d+OflcKb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 22 May 2025 11:33:00 +0000
"Shankar, Uma" <uma.shankar@intel.com> wrote:

> One request though: Can we enhance the lut samples from existing 16bits t=
o 32bits as lut precision is
> going to be more than 16 in certain hardware. While adding the new UAPI, =
lets extend this to 32 to make it future proof.
> Reference: https://patchwork.freedesktop.org/patch/642592/?series=3D12981=
1&rev=3D4
>=20
> +/**
> + * struct drm_color_lut_32 - Represents high precision lut values
> + *
> + * Creating 32 bit palette entries for better data
> + * precision. This will be required for HDR and
> + * similar color processing usecases.
> + */
> +struct drm_color_lut_32 {
> +	/*
> +	 * Data for high precision LUTs
> +	 */
> +	__u32 red;
> +	__u32 green;
> +	__u32 blue;
> +	__u32 reserved;
> +};

Hi,

I suppose you need this much precision for optical data? If so,
floating-point would be much more appropriate and we could probably
keep 16-bit storage.

What does the "more than 16-bit" hardware actually use? ISTR at least
AMD having some sort of float'ish point internal pipeline?

This sounds the same thing as non-uniformly distributed taps in a LUT.
That mimics floating-point input while this feels like floating-point
output of a LUT.

I've recently decided for myself (and Weston) that I will never store
optical data in an integer format, because it is far too wasteful. That's
why the electrical encodings like power-2.2 are so useful, not just for
emulating a CRT.


Thanks,
pq

--Sig_/r7.3hMmy35MS7Y8d+OflcKb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmg5uXoACgkQI1/ltBGq
qqejGw/+P66661AgnwMG6hSSGJYd+h7+Hobil42SkBMKhgUEjDG8ux8laMg+3s+t
y0iu4/1exQhTMZXXDqsSZeRLApYNKOPN6+JWS+YhYUljwo6sANBXGq6yTmjni/tP
caek1AQDxNRl6WtPVuMMHW9g1Ebp0CtXn0lYPDqyuKtLRWwKzlMNvPcEpaPV+YC1
5kI4U4az8JsAIXpijzdEUcq21GboFd8Q0GB7wF5HGNmRFtUAzeaWcDHCaSGyXjhJ
IAnWoFt9uDrT5dnv77hsnb2iP0OtV+X5+YBbmyRnuCr1XgTK0uxfHGggJce37GXm
vdm0drjkwP/dfUBV40+76bFMKHdIfbCxMR0n4aRwKBGtHuLu6rEXENQcdQ1puzmC
xiyyZKCo7xSv+cjmB4EcExFk5FgqJzyDqlAhG20b8AwRorGMXpyRT6ed2QyRY1Go
RvqkQaQhlETAoYdgjjW/aXXoW9f7H/YiUgf99SZdS3xosVPFSVxJsPlynEqv1QyN
a2zoSElg88+Nwmoqkq3D1JfSGU6I5E8t2VmBvRmhWCIpT3LPfrwwYwvWuh2IwP7e
4WHc/TD0OLDbP5yRuPPc011AOvA2z+kjXghrxHYsdwlUnikF7XpvlEPsU2aPrN3S
UH2oexN3XaWoGkRTniY1o/rjPivjDT1PhSU/BjvsoPZKO+4kYyY=
=sOuM
-----END PGP SIGNATURE-----

--Sig_/r7.3hMmy35MS7Y8d+OflcKb--
