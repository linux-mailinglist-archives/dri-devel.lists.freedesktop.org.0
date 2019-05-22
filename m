Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E795127311
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 01:58:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C55989CAD;
	Wed, 22 May 2019 23:58:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1435C89CAD;
 Wed, 22 May 2019 23:58:19 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 458V2K0zG5z9s55;
 Thu, 23 May 2019 09:58:17 +1000 (AEST)
Date: Thu, 23 May 2019 09:58:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-misc tree with the drm-intel tree
Message-ID: <20190523095816.2fd950f6@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1558569497;
 bh=awSBY8QhuVpH2dy6Tjr+pBL7Q9+494tGdrCADPbp6JU=;
 h=Date:From:To:Cc:Subject:From;
 b=AkCaBfd81pV96IMrR/ZRSqiziOtr2nedXxnYOHwKBtvL8mxs2Rcfs0RrGH/avyVn7
 2HvfDbg9slu+9LeNCNWNbXn+6uEMNzAECO1RPJQ43X4fBJIzIXhrmM9+bgrpEDLHxf
 ioF1nKeosEkVVxp7wSsD1Zqulnm8yAgQig7gPDn1rHrIZWEtK7sDe/5t4mR9ryytlt
 2viGVPe+KD26LtZa2v2o/7hXf6S9q0cddu9MryVoO9517+SDepzYKaGX1wC4E4YWLF
 MbuBKBGZqUsjyKrKkgvTEg8bopi/bAvqcMPrjvbXELT980QIESSsRm3aKZx0PcS6CE
 6S9vMHyD0jgKA==
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Uma Shankar <uma.shankar@intel.com>
Content-Type: multipart/mixed; boundary="===============1389848129=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1389848129==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/iqoc+GgWuISAZa6f0roKMrT"; protocol="application/pgp-signature"

--Sig_/iqoc+GgWuISAZa6f0roKMrT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  include/drm/drm_mode_config.h

between commit:

  585b000de23b ("drm: move content protection property to mode_config")

from the drm-intel tree and commit:

  fbb5d0353c62 ("drm: Add HDR source metadata property")

from the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/drm/drm_mode_config.h
index 5764ee3c7453,c031b5a9d8d1..000000000000
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@@ -836,12 -836,13 +836,19 @@@ struct drm_mode_config=20
  	 */
  	struct drm_property *writeback_out_fence_ptr_property;
 =20
 +	/**
 +	 * @content_protection_property: DRM ENUM property for content
 +	 * protection. See drm_connector_attach_content_protection_property().
 +	 */
 +	struct drm_property *content_protection_property;
 +
+ 	/**
+ 	 * hdr_output_metadata_property: Connector property containing hdr
+ 	 * metatda. This will be provided by userspace compositors based
+ 	 * on HDR content
+ 	 */
+ 	struct drm_property *hdr_output_metadata_property;
+=20
  	/* dumb ioctl parameters */
  	uint32_t preferred_depth, prefer_shadow;
 =20

--Sig_/iqoc+GgWuISAZa6f0roKMrT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzl4hgACgkQAVBC80lX
0GwvNAf/e7CBkRU+Cwrf5MF74yDaDjYq1i+q6cdNZgWm1pjYAHtD+2QarsztG3fI
8Ln3ug+xGjuoWWDSWQ4kkDWRg2L//Viqt5EmUrQFKrvxvOBBWE4936f1kfJg9JGp
neOdvZEGjRgQo8xcKW/5KP7WQvNw+yelYPZ1p3IdQ2oigr7y0SewpICvWnIPEeUa
MAqY9sBmCp+S326XWvjlPoAnMZUbzzsnnUZUYMt3yzUui1k8UaYAG9WGPyx2WNgs
Qxi+1CsuV9GVpoAao+4s1QsLJDUZ9nCjT/GgN56mQR+NBFyfTTtfY/yBxyzAkxu/
kfA2Tk1W5TcIrEbrf3/mX/OifV3dgA==
=xKAU
-----END PGP SIGNATURE-----

--Sig_/iqoc+GgWuISAZa6f0roKMrT--

--===============1389848129==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1389848129==--
