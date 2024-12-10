Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D33239EA458
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 02:30:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A1F10E5A3;
	Tue, 10 Dec 2024 01:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="N4Ed1XIy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3A210E5A3;
 Tue, 10 Dec 2024 01:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1733794208;
 bh=An6uolrgf00SGJ8E+TJg/LlT/r+g0QzjXRT5lhUqzD8=;
 h=Date:From:To:Cc:Subject:From;
 b=N4Ed1XIyDTsO8lZaqu0waqB+8djd/FB3UpH8uk/3yzQBavdwGZUyWlWG/xDk4TcrS
 QMIrmvF3xeD+yIu739ASkwAZxs0zCsd4Ek5/+pTcpKPXZutnVy74g7DVEDUECZgfLL
 kuPDj8kY1heGG48vl0t6m2AwpwsSCjtWIHR5tOJz4TpDF2t2+MtRtZ0FH222y54VxT
 fnGJJWHnfXDKbFoSRvw3hB7tIbqNH9cZz5NTLbv/WEtvGuCM8W9dARynRMPBIC814u
 P5ENS6UT1O32usMvWRaTZMiFDPGsBANP17Ved98SAdhM7NJCN/Pu6TLzZ6jTT+279A
 PZI43rgMDdg1A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y6h4H441sz4wcy;
 Tue, 10 Dec 2024 12:30:07 +1100 (AEDT)
Date: Tue, 10 Dec 2024 12:30:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Imre Deak <imre.deak@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-intel tree with Linus' tree
Message-ID: <20241210123011.503ddd5a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5nFw1kQmLV+O/LDFyqcNIaI";
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

--Sig_/5nFw1kQmLV+O/LDFyqcNIaI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/xe/display/xe_display.c

between commit:

  a4de6beb83fc ("drm/xe/display: Separate the d3cold and non-d3cold runtime=
 PM handling")

from Linus' tree and commit:

  f5d38d4fa884 ("drm/i915/display: convert intel_display_driver.[ch] to str=
uct intel_display")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/xe/display/xe_display.c
index b5502f335f53,b8bfb666ebe8..000000000000
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@@ -446,25 -470,20 +475,22 @@@ static void __xe_display_pm_resume(stru
  	if (has_display(xe))
  		drm_mode_config_reset(&xe->drm);
 =20
- 	intel_display_driver_init_hw(xe);
- 	intel_hpd_init(xe);
+ 	intel_display_driver_init_hw(display);
 =20
  	if (!runtime && has_display(xe))
- 		intel_display_driver_resume_access(xe);
+ 		intel_display_driver_resume_access(display);
 =20
- 	/* MST sideband requires HPD interrupts enabled */
- 	if (!runtime)
- 		intel_dp_mst_resume(xe);
+ 	intel_hpd_init(xe);
 =20
  	if (!runtime && has_display(xe)) {
- 		intel_display_driver_resume(xe);
+ 		intel_display_driver_resume(display);
  		drm_kms_helper_poll_enable(&xe->drm);
- 		intel_display_driver_enable_user_access(xe);
+ 		intel_display_driver_enable_user_access(display);
 -		intel_hpd_poll_disable(xe);
  	}
 =20
 +	if (has_display(xe))
 +		intel_hpd_poll_disable(xe);
 +
  	intel_opregion_resume(display);
 =20
  	if (!runtime)

--Sig_/5nFw1kQmLV+O/LDFyqcNIaI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdXmaMACgkQAVBC80lX
0GzrfAf8CQNQLyvtHwD0N8dm5jXXHlNMtQoirBpRCe1plSNol9py/L0e0L0H1UMV
Fg7OKElNC1p48U+R3XDdZEAKbF1LW5vXy78CTnDLNfcjpt5AIdICiYZtMq4hyz56
xwYMtQBNXVBYLViRfty5OvR+LMwr5dstAcM/wZDT18zjuuVbuoU/ozmVKagezqxM
Tdzi03oEoDi808Zn+6jClIYOSxTLbMjcoYgdKh9d8Z/yAHSpkNqd0dJFXInyBaKe
jlcyfREij63DtP4s1kJz8FHjC59pJahgfktmuqDWe34MJe7TJx8pmPeYAaPWdBv+
q7tbSO6Qs/bW1f40XqLqHLoRsRbuJw==
=TiTq
-----END PGP SIGNATURE-----

--Sig_/5nFw1kQmLV+O/LDFyqcNIaI--
