Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AC62FC52E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 00:57:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C464D6E046;
	Tue, 19 Jan 2021 23:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 075556E042;
 Tue, 19 Jan 2021 23:57:20 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DL5DY2223z9s2g;
 Wed, 20 Jan 2021 10:57:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1611100638;
 bh=aU6XNAzQbH3IDoetYyr1Fi183CHr/Mb4lTKH65/VU0o=;
 h=Date:From:To:Cc:Subject:From;
 b=Yj4HKl1AzKXbJ+uKLZfAtSLYrs9hb5aJ2Wqz8S8SEIBshqrwSmJ8j5eaamtwE6bfz
 jo0df5vZ/iGg8FJIHU/i8s+Z5FuwQJEe6ozl4Heb21YF6zIRAwlp7vLPt+4XBMA+p5
 XkCEUZmG40OUHVq/3NRCDt+8sK5IXiV+3yCS2/xRzb2LSWMOS42vdmaoWBpCw5KVet
 SA5uKfg5eQX7sDZ4nijP6GQiSu1Q3Xrn+wFV1lqlIBOF9X1p5f0WNNYBsMgHGkN6Sk
 bD8qEEzyThymTLpr5n84yTscnF3i2un6Bq6rX1m9R93B4lsOtQrsjVVsczq4bzkugb
 +9qDyU8eSf+Ag==
Date: Wed, 20 Jan 2021 10:57:15 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: build failure after merge of the drm-intel tree
Message-ID: <20210120105715.4391dd95@canb.auug.org.au>
MIME-Version: 1.0
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0913186505=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0913186505==
Content-Type: multipart/signed; boundary="Sig_/7BT8h2PLWsOJZo2F4=5Rm_T";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7BT8h2PLWsOJZo2F4=5Rm_T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-intel tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/gpu/drm/msm/dp/dp_ctrl.c: In function 'dp_ctrl_use_fixed_nvid':
drivers/gpu/drm/msm/dp/dp_ctrl.c:1425:16: error: implicit declaration of fu=
nction 'drm_dp_get_edid_quirks'; did you mean 'drm_do_get_edid'? [-Werror=
=3Dimplicit-function-declaration]
 1425 |  edid_quirks =3D drm_dp_get_edid_quirks(ctrl->panel->edid);
      |                ^~~~~~~~~~~~~~~~~~~~~~
      |                drm_do_get_edid
drivers/gpu/drm/msm/dp/dp_ctrl.c:1431:11: error: too many arguments to func=
tion 'drm_dp_has_quirk'
 1431 |   return (drm_dp_has_quirk(&ctrl->panel->desc, edid_quirks,
      |           ^~~~~~~~~~~~~~~~
In file included from drivers/gpu/drm/msm/dp/dp_ctrl.c:15:
include/drm/drm_dp_helper.h:2087:1: note: declared here
 2087 | drm_dp_has_quirk(const struct drm_dp_desc *desc, enum drm_dp_quirk =
quirk)
      | ^~~~~~~~~~~~~~~~

Caused by commit

  7c553f8b5a7d ("drm/dp: Revert "drm/dp: Introduce EDID-based quirks"")

Since the drm-intel tree still has its other build failure, I used the
version from next-20210108 again today.

--=20
Cheers,
Stephen Rothwell

--Sig_/7BT8h2PLWsOJZo2F4=5Rm_T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAHcdsACgkQAVBC80lX
0GyL0gf9Gykgwv1C+podlywSGDeNb325PRn53gcy3mTvRd319wLt8Kna1AT/js1V
lACULa7REx8bsskFFYlqIBuDBtr/ynoSM5Ptti+WRvBVwoPHzXfwlRNwIJnjepIb
UgCDcuFz6V+FWEQL2VhPL2ZmI+BkaNPTfZiiJGrwT2MKChkiq0dB/3EtxTxn6hP1
6e2oNmiX/byN+hPWfKBM7L1mI0C8mpglDT60vipysRsvUFT0TGMRgOdSNYYIfa23
RWbn4icWFGv8XQEhIfbMg4rhYwU0V7qkg7vxw6SrPDZdm/1lZz6l26ep8Aq6Dwr7
sEXT+ctNIffoWWjfSxpkXMbxmw3l5g==
=0Jnl
-----END PGP SIGNATURE-----

--Sig_/7BT8h2PLWsOJZo2F4=5Rm_T--

--===============0913186505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0913186505==--
