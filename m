Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFBA8D2AE4
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 04:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A52112E96;
	Wed, 29 May 2024 02:35:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Rts1GErr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7235112E95;
 Wed, 29 May 2024 02:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1716950132;
 bh=i5TmU9yV0PI4EyOM3a6WHyyJ8VIjw9e4O1pSXH0Dlcc=;
 h=Date:From:To:Cc:Subject:From;
 b=Rts1GErrSQLI5NRtA6sa7Bxxqqnf6uj1hUUfRIA0LDQDhEVfn9ehV84mgJ22KLFKC
 pd95hE5wH42QThtq3d1LObI0lVoVrKeAylFjoekiBkGNkjflUGskrpMCpTCK9K6gg5
 NqQQwWEnRmBDC1I1R2pLcrBzlh7l9RuvmdluttxlqMvWbpJUGy/AB1z63ttdQsfzZR
 bjuPQFUtCoQ6aMamh0jxiiW0EJ8GsxpBYO5pPRp+eHVhPX//hwhQuqBzvFrNgUPm8U
 iL++BmGFNUNrgPXUancfbr5JtK9z6jgbi/ZhGXuFcPrJp5R+tH2l4VXw8gGrfjctJI
 3umQSuOaz0hJw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vptlm16Wqz4wqK;
 Wed, 29 May 2024 12:35:32 +1000 (AEST)
Date: Wed, 29 May 2024 12:35:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Maxime Ripard <mripard@kernel.org>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20240529123531.324226b4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sWwKsn.AeqU0RI8N+udYfdi";
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

--Sig_/sWwKsn.AeqU0RI8N+udYfdi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c: In function 'sun4i_hdmi_connector_m=
ode_valid':
drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c:213:17: error: implicit declaration =
of function 'drm_connector_hdmi_compute_mode_clock'; did you mean 'drm_hdmi=
_compute_mode_clock'? [-Werror=3Dimplicit-function-declaration]
  213 |                 drm_connector_hdmi_compute_mode_clock(mode, 8,
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                 drm_hdmi_compute_mode_clock
cc1: some warnings being treated as errors

Caused by commit

  ea64761a54a2 ("drm/sun4i: hdmi: Switch to HDMI connector")

I have used the drm-misc tree from next-20240528 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/sWwKsn.AeqU0RI8N+udYfdi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZWlHMACgkQAVBC80lX
0GweSQf/TJeYvl4unIeXnWL+HOHTA83UiOZHhpsW1EA7OWowgkXskxQKCeFt6wB8
8snvO+7+4F+XmxVewkN3NiH4UdT/bYN2S/Z89yMlQn9F+JgGN3SjR/Nd4A+pVSfT
IsiSXicRn+XQvsOhkSFYILjiWWf7LVDF3dQCyjJ1nlolGV0F9OMFZT89KsAHFKog
pzjVXX2rvV7D8Mt/0BVzwCQ+hA1B6/QLZOK2r4D2fX1QABJKNe5ZR41pqgwQEsBn
b+RhfGXfaEriC9/28XbWUNj+qVs/VkatBZN6k7wjSiBLWJrAhyy+GYh1eJAHQppe
5Yl6eUeGHWY7395orb+64W6rrykApA==
=NZY4
-----END PGP SIGNATURE-----

--Sig_/sWwKsn.AeqU0RI8N+udYfdi--
