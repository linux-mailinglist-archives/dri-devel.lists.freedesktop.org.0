Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 489064E7AB0
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 21:45:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC81E10E0A9;
	Fri, 25 Mar 2022 20:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3F810E0A9
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 20:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dNcYm2gNoOHWoiqQ+SE4ZkYCwAOUcBWPRjP9ir6fhnQ=; b=HXoejBRiBCjInbJDz/OhxkRxp1
 OlIL/btOq0AWT0A4r4auXCMaPQr3M3FfSPdLrOXhOAPN0PrgJ6Af2KtNd3li1PUGQd1eMaVwkADFX
 vbDKTSz65+mTb0pZyx937FMRfTnbmuKZhU68aqkFQzyFua6sU6FjfIrKc434wC2f7IchOFW58orX+
 Lf9rJYKxAFR/XwXi5KRnpnvmscoPorgI2GkeBH012qsCW65pOqYwPtqXtBBDcc/V2auPg/D9nVV97
 vBihbFgBdVyGw0HHc5jeCz5efnAJrNJKiJHveZT8Cso7xYXPtEY9FghVJNOTJfx2KR4R7e5yIOApi
 Zpp/X80Q==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nXqo1-00080U-Lj; Fri, 25 Mar 2022 21:45:09 +0100
Date: Fri, 25 Mar 2022 19:44:50 -0100
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Agustin Gutierrez <agustin.gutierrez@amd.com>, Zhan Liu <Zhan.Liu@amd.com>
Subject: [RFC PATCH] drm/amd/display: dont ignore alpha property
Message-ID: <20220325204450.kq7kjb7ez63p5srm@mail.igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vdmk5jeuzfrbujmk"
Content-Disposition: inline
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--vdmk5jeuzfrbujmk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm examining the IGT kms_plane_alpha_blend test, specifically the
alpha-7efc. It fails on AMD and Intel gen8 hw, but passes on Intel
gen11. At first, I thought it was a rounding issue. In fact, it may be
the problem for different results between intel hw generations.

However, I changed the test locally to compare CRCs for all alpha values
in the range before the test fails. Interestingly, it fails for all
values when running on AMD, even when comparing planes with zero alpha
(fully transparent). Moreover, I see the same CRC values regardless of
the value set in the alpha property.

To ensure that the blending mode is as expected, I explicitly set the
Pre-multiplied blending mode in the test. Then I tried using different
framebuffer data and alpha values. I've tried obvious comparisons too,
such as fully opaque and fully transparent.

As far as I could verify and understand, the value set for the ALPHA
property is totally ignored by AMD drivers. I'm not sure if this is a
matter of how we interpret the meaning of the premultiplied blend mode
or the driver's assumptions about the data in these blend modes.
For example, I made a change in the test as here:
https://paste.debian.net/1235620/
That basically means same framebuffer, but different alpha values for
each plane. And the result was succesful (but I expected it fails).

Besides that, I see that other subtests in kms_plane_alpha_blend are
skipped, use "None" pixel blend mode, or are not changing the
IGT_PLANE_ALPHA property. So, this alpha-7efc seems to be the only one
in the subset that is checking changes on alpha property under a
Pre-multiplied blend mode, and it is failing.

I see some inputs in this issue:
https://gitlab.freedesktop.org/drm/amd/-/issues/1769.
But them, I guessed there are different interpretations for handling
plane alpha in the pre-multiplied blend mode. Tbh, I'm not clear, but
there's always a chance of different interpretations, and I don't have
a third driver with CRC capabilities for further comparisons.

I made some experiments on blnd_cfg values, changing alpha_mode vs
global_gain and global_alpha. I think the expected behaviour for the
Pre-multiplied blend mode is achieved by applying this RFC patch (for
Cezanne).

Does it seems reasonable? Can anyone help me with more inputs to guide
me the right direction or point out what I misunderstood about these
concepts?

Thanks,

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 6633df7682ce..821ffafa441e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5438,7 +5438,7 @@ fill_blending_from_plane_state(const struct drm_plane=
_state *plane_state,
=20
 	if (plane_state->alpha < 0xffff) {
 		*global_alpha =3D true;
-		*global_alpha_value =3D plane_state->alpha >> 8;
+		*global_alpha_value =3D plane_state->alpha;
 	}
 }
=20
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c b/drivers/g=
pu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
index 4290eaf11a04..b4888f91a9d0 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
@@ -2367,6 +2367,10 @@ void dcn20_update_mpcc(struct dc *dc, struct pipe_ct=
x *pipe_ctx)
 			=3D=3D SURFACE_PIXEL_FORMAT_GRPH_RGBE_ALPHA)
 		blnd_cfg.pre_multiplied_alpha =3D false;
=20
+	if (blnd_cfg.pre_multiplied_alpha) {
+		blnd_cfg.alpha_mode =3D MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA_COMBINED_G=
LOBAL_GAIN;
+		blnd_cfg.global_gain =3D blnd_cfg.global_alpha;
+	}
 	/*
 	 * TODO: remove hack
 	 * Note: currently there is a bug in init_hw such that
--=20
2.35.1


--vdmk5jeuzfrbujmk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmI+Kb0ACgkQwqF3j0dL
ehzzUQ/7BBgIRtM5mA72d3XPZ4BcL1Jiyevs90XhOLuT/MTZhborIl5oQwzikdm0
L1R5tBjnWeAqQBp0oQ6FGJZVsJkYF+vUAtqHQzS3SQcp3RDhu3NFSK/nbypOESiF
2sd35zNKzyPkCeZ1oemz3e2G3ToEGNk+UQ4NgYZK/tMzXq+hu8TIzn4gBmdUXp5D
1AzrTSP2QPFekv/bm+GwpZ8Jj23yCE5+8OQdLWXnK7r1Z8jfjrqtfIUcyvuckXtj
o+YYV6oPv8Hqx5kcmjMhIDeTGeA+vvjxUq5RVza2P7hiOEroFyCNxCsUWcwTR0EP
JpXvyioZyYUVZ1UJQKt48+EK3hGmIzSUAXvkSmz7bpH+Jr5m2alXyeerjq7Wiwjv
cjU7eZnra3QafrMuY6HBCkjLc8+lwOf+hxe0s0SFQYUalXRM+Cl1j/IQheyrLwGE
yZy39P/51aoVkxEpNKwdGUzhrPWEFjJ2AU2KEJiT4zJyo0EjfC76Q6aCcHTx21pn
Qqv+Vzs/4WJgasiCHNghTazlddQf75KTB6P91VFG0GACdRqPRq8mKjO74NbEuh6o
ohi2NB0ydcqUsDl8Wi4cwDCqDuhMlChezet1NdoXSehoONw8DEtEDRt/0Pg9gwW7
2Rj6mdO6+xwumSlSkznbZ/2GQfgkSPyk0FjJkjnzHwWLvGu0vBo=
=rloN
-----END PGP SIGNATURE-----

--vdmk5jeuzfrbujmk--
