Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98074157152
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 09:59:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACBB86EB85;
	Mon, 10 Feb 2020 08:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 903 seconds by postgrey-1.36 at gabe;
 Sat, 08 Feb 2020 19:58:40 UTC
Received: from sender4-of-o58.zoho.com (sender4-of-o58.zoho.com
 [136.143.188.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC75689F03
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2020 19:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1581191015; 
 s=s; d=qubes-os.org; i=frederic.pierret@qubes-os.org;
 h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type;
 bh=4UMIRX/WyO4WPJxy81RyadUUcsnUGWlHOmbQ6Au+Adw=;
 b=aho9vRRvhnk2FpRErf38+/MEObzvwxaTurt+edbLy96tJbcgb/3dPKq74mB3lI5j
 QEepVG9fLYkVEltOPuE6wxCNAGPMZXkXolO5Ysv3mQCxggkZTUoaZcxkXI3Elnc5tn3
 AtDFkEXGsEDgpMgK8PUbchHwTyVHWq9Q7HAa2drk=
Received: from [10.137.0.45] (82.102.18.6 [82.102.18.6]) by mx.zohomail.com
 with SMTPS id 1581191012557842.0701714079564;
 Sat, 8 Feb 2020 11:43:32 -0800 (PST)
From: =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>
Subject: [PATCH] nv50_disp_chan_mthd: ensure mthd is not NULL
To: bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <dac89843-5258-5bed-ee86-7038e94e56da@qubes-os.org>
Date: Sat, 8 Feb 2020 20:43:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
X-Mailman-Approved-At: Mon, 10 Feb 2020 08:59:10 +0000
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
Content-Type: multipart/mixed; boundary="===============1341196888=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1341196888==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="B4yCyaNyqdN68C01OPt6rR5nIf1KF21jl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--B4yCyaNyqdN68C01OPt6rR5nIf1KF21jl
Content-Type: multipart/mixed; boundary="TIhELMerY5yoVKYrPM88CXOKjlxsWwbcW"

--TIhELMerY5yoVKYrPM88CXOKjlxsWwbcW
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Pointer to structure array is assumed not NULL by default. It has
the consequence to raise a kernel panic when it's not the case.

Basically, running at least a RTX2080TI on Xen makes a bad mmio error
which causes having 'mthd' pointer to be NULL in 'channv50.c'. From the
code, it's assumed to be not NULL by accessing directly 'mthd->data[0]'
which is the reason of the kernel panic. Simply check if the pointer
is not NULL before continuing.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=3D206299
Cc: stable@vger.kernel.org
Signed-off-by: Fr=C3=A9d=C3=A9ric Pierret (fepitre) <frederic.pierret@qub=
es-os.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c b/driver=
s/gpu/drm/nouveau/nvkm/engine/disp/channv50.c
index bcf32d92ee5a..50e3539f33d2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c
@@ -74,6 +74,8 @@ nv50_disp_chan_mthd(struct nv50_disp_chan *chan, int de=
bug)
=20
 	if (debug > subdev->debug)
 		return;
+	if (!mthd)
+		return;
=20
 	for (i =3D 0; (list =3D mthd->data[i].mthd) !=3D NULL; i++) {
 		u32 base =3D chan->head * mthd->addr;
--=20
2.21.0



--TIhELMerY5yoVKYrPM88CXOKjlxsWwbcW--

--B4yCyaNyqdN68C01OPt6rR5nIf1KF21jl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEn6ZLkvlecGvyjiymSEAQtc3FduIFAl4/D18ACgkQSEAQtc3F
duIJFhAAzN4V0d2b9UNZOSl5OOGjbUHnimbJA3Y51i+r3r+rEInrItxwl2c8asfm
mHaq3BdBfcGVrb0rkFssztpze7mtt+UBBvmDYSGGHrStyGEpeoZJ659PI0EmZr/U
PwRHspPkOwb5N2DSDZJ83j/O/lZE3x61YFOAum11JW6xOJOT7lTLlzO/NYosktnj
VNM/WAbUt5muS3ZZAlPCpaX8vMS3oFG7ssPCYtq56w9BaaOZuWiAA41vtCAc79Sm
pE6BjWEmcD22tBF19/V0wnbENXfv2AKgw2X1VIChjXDYW0+Rd7DVOMiNnRU+9brD
3pyyKppbrakHy6u9S7762NDCJvtLDL2dkYaN/VdtKw41jwTCRg0O/IG16jjRT/Z2
OZRPWBo1wibMsgXB6LfAvE6Y/GDS6N0imGsJgq/mZe6j7wexDTLwLu5GCLWUDFP3
RvBpHBx5w17KCMQ0pYnFkLdZTc7gkqhqdI5FeDK4QBbNTi8tKvmSNzs7/ZWLaUI9
vGqteuMnmrs8+mMZxrfIk7oijIFNKnv3JJIM2Hbovfx9e7haKuIZ7M5LqEC3fNuY
4d9BCj4xnF0S5UFM+VP0lGB5PoMXnTuwHzsIjBqDErpsFH3J69Inh/7+hVECbs2U
Yg3Ui9xyK9AEEFw83u9BXS90ZlvwIFWKJvgenDQs9zarslW0vQE=
=8SIN
-----END PGP SIGNATURE-----

--B4yCyaNyqdN68C01OPt6rR5nIf1KF21jl--

--===============1341196888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1341196888==--
