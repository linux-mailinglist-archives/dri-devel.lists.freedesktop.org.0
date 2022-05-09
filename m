Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F11520478
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 20:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA00E10E16F;
	Mon,  9 May 2022 18:26:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A8810E16F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 18:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qrgEbqixeD6cq/8cTvbPL2tWjV1vUX66p1oiAZvOWeA=; b=LRT+T6g5t7DZ2G3Tj1D37qXE5q
 +BLGHXnzlePKEYm9pLQNyDG6Sx+KD3M1QpOux4JnjM3bS2Ea5G0SZWfUV4dHjL3m5vx7oFn9ippXH
 k1c5g3CKPhJR9WPBDOs/6ANUthBEo5HSDMrpbmgRJN3NNnOiDaoqsby9lEehjdIusGhCdGTGN2X8g
 CyIpmWZ4JqXk51yuzyjuvScCtnBxbbrcHvoQgATNdoZ5dKtrjQ3dUrsXOkm1mTeZ/4oczggxTCNZs
 4WvkikoanzYXZNGwiga7IEGftW7X0TmBfiXRlLuV5/sv0CLXu7htunDYLoZInXBUx4QxfU33jgtvJ
 SLq7SO2Q==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1no85T-0004mc-Ls; Mon, 09 May 2022 20:26:27 +0200
Date: Mon, 9 May 2022 17:26:13 -0100
From: Melissa Wen <mwen@igalia.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 00/14] drm/vc4: Properly separate v3d on BCM2711, and fix
 frame ordering
Message-ID: <20220509182613.kjdivwdpcwpxbv7d@mail.igalia.com>
References: <20220503121341.983842-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="asbiz5efz44xgrco"
Content-Disposition: inline
In-Reply-To: <20220503121341.983842-1-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--asbiz5efz44xgrco
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 05/03, Maxime Ripard wrote:
> Hi,
>=20
> Here's a series that fixes a significant issue we missed when adding supp=
ort
> for the BCM2711 / RaspberryPi4 in the vc4 driver.
>=20
> Indeed, before the introduction of the BCM2711 support, the GPU was fairly
> intertwined with the display hardware, and was thus supported by the vc4
> driver. Among other things, the driver needed to accomodate for a bunch of
> hardware limitations (such as a lack of IOMMU) by implementing a custom m=
emory
> management backend, tied with the v3d hardware.
>=20
> On the BCM2711, that GPU got moved into a completely separate hardware bl=
ock
> and thus we gained a new driver for it, v3d.
>=20
> However, when we introduced the display support for the BCM2711 in vc4, we
> didn't properly split out the v3d-related functions and ended up reusing a
> significant portion of the code supposed to be backed by the v3d.
>=20
> This created a bunch of easy to miss issues that would only pop up with I=
GT
> tests, or when heavily testing some features (like asynchronous page-flip=
ping).
>=20
> This series properly does the split now by creating separate code path wh=
ere
> relevant, adds a loud complain when we use a v3d entry-point on the BCM27=
11,
> and fixes an issue where we would just ignore any fence on an asynchronous
> page-flip, resulting in frames appearing out-of-order for some workloads.
>=20
> Let me know what you think,

Hi Maxime,

Overall lgtm. I didn't catch anything tricky and I did some tests to
verify the current behaviour is preserved. Unfortunately, I couldn't
test the async mechanisms much, let me know if you have any suggestions
for testing. I only concern about accommodate vc5 naming since vc4->v3d
vs v3d is already a little confusing. After addressing
dma_resv_get_singleton usage, this series is:

Reviewed-by: Melissa Wen <mwen@igalia.com>

> Maxime
>=20
> Maxime Ripard (14):
>   drm/vc4: plane: Prevent async update if we don't have a dlist
>   drm/vc4: Consolidate Hardware Revision Check
>   drm/vc4: bo: Rename vc4_dumb_create
>   drm/vc4: bo: Split out Dumb buffers fixup
>   drm/vc4: drv: Register a different driver on BCM2711
>   drm/vc4: kms: Register a different drm_mode_config_funcs on BCM2711
>   drm/vc4: plane: Register a different drm_plane_helper_funcs on BCM2711
>   drm/vc4: drv: Skip BO Backend Initialization on BCM2711
>   drm/vc4: crtc: Use an union to store the page flip callback
>   drm/vc4: crtc: Move the BO handling out of common page-flip callback
>   drm/vc4: crtc: Move the BO Handling out of Common Page-Flip Handler
>   drm/vc4: crtc: Don't call into BO Handling on Async Page-Flips on
>     BCM2711
>   drm/vc4: crtc: Fix out of order frames during asynchronous page flips
>   drm/vc4: Warn if some v3d code is run on BCM2711
>=20
>  drivers/gpu/drm/vc4/vc4_bo.c               |  62 ++++++-
>  drivers/gpu/drm/vc4/vc4_crtc.c             | 193 +++++++++++++++------
>  drivers/gpu/drm/vc4/vc4_drv.c              |  97 +++++++++--
>  drivers/gpu/drm/vc4/vc4_drv.h              |  19 +-
>  drivers/gpu/drm/vc4/vc4_gem.c              |  40 +++++
>  drivers/gpu/drm/vc4/vc4_hvs.c              |  18 +-
>  drivers/gpu/drm/vc4/vc4_irq.c              |  16 ++
>  drivers/gpu/drm/vc4/vc4_kms.c              |  24 ++-
>  drivers/gpu/drm/vc4/vc4_perfmon.c          |  41 +++++
>  drivers/gpu/drm/vc4/vc4_plane.c            |  29 +++-
>  drivers/gpu/drm/vc4/vc4_render_cl.c        |   4 +
>  drivers/gpu/drm/vc4/vc4_v3d.c              |  15 ++
>  drivers/gpu/drm/vc4/vc4_validate.c         |  16 ++
>  drivers/gpu/drm/vc4/vc4_validate_shaders.c |   4 +
>  14 files changed, 470 insertions(+), 108 deletions(-)
>=20
> --=20
> 2.35.1
>=20

--asbiz5efz44xgrco
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmJ5XL0ACgkQwqF3j0dL
ehyziQ/8D7A59J72VCw/4WvKrJP0Me8l2B0T42oyvwjULevf3i+WYbv2wmRfOYAd
D7j73Z26OmtyDLTm7QzzDML1MrqZwWRESKo71z0wpTTsjitjP0Dakhh9KHyuKMrm
juCBvgg03oDLTEeujGwOupAESvamaFm7ycGr10mY+R9OoFJyCgp59WCBbnrmSTW/
8d8j4U3eQ93c7Nw9zq+pSu4QtoSekdDgE7tWHK9UWjaJyc9RIXI1R/0YQvEbsaD6
Mch6gAbLpDIqBgzcVM1+456S4JozaHchaQX1klK8X7PfEVIG3H4JNRjKfjRqPyLR
G+n/nkoQvsF+4Ag8iWUp8MXmFxCbQV/OJ2nBCYlC0xzRi26F5H/ROJzzdB7ks/F+
yZ9pwAiU9e38NcmWk+pIOhqvn8NbBZBn6JKKVu1L2m7kpBG8RCCs+Vthubp0YbR3
IrtlwB+450WRkqll/4wSyIQx6jcYUpyET8ir0EzxxIgRKZgWbuzWUqAgPlDqIrJw
qhaVtg0ifObcgGv2xEGaVDai4eF/wWz9IjBjGrMdcq0u1PWoevv3bsor9eRrH3Lh
3o/aBRXdmW99y7g+wvz0YjK26KvMhFmN0/zWC9Jx3HVfHHaHn9VkgN2NCzHGhdTJ
LnHjTAgLutYf83TM9ZGkJE5nPtPrt8xTIorFkAha/6wpbyhU01M=
=7uAL
-----END PGP SIGNATURE-----

--asbiz5efz44xgrco--
