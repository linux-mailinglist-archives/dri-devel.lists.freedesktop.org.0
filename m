Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1E655296D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 04:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C9111232D;
	Tue, 21 Jun 2022 02:37:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E8D11232D;
 Tue, 21 Jun 2022 02:37:16 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LRrJR2N9Fz4xXj;
 Tue, 21 Jun 2022 12:37:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1655779032;
 bh=E2bt6Hqtp6F5DJLwZ0iF2cXMIpskMQ1W7uOyDJJZhrs=;
 h=Date:From:To:Cc:Subject:From;
 b=qLwfmR/5EaWCtqQfwoLOR69le/bV0Civ+NfNfAKOAZulNmdf1AoBr3AEng6tr1LNb
 +cvvXGlqU/mCp0+7AHyH1+seV2dI/SnaBk8oNmNZl0z1BYXwXyR2+ka47S60fKQrql
 nbblfV5IuQKpNc1KrXa8gZjIOSsM+IxxG4roQ4b6Hb7gDacGN8qqLC0FMsgWRy71uB
 6r7nmYloBTfItf8rCvmRtyntRVt7HWvCZ8Qu7uyAeXGRw2hxzx3BBCqf4E3HF2e+Vu
 qkczqAg9R3fdzfAZnx4/udrqhokHp74UtsOjvBT68qL74SkfElcQV0aBIf45vuTW+9
 1+7/PYbKDD0wA==
Date: Tue, 21 Jun 2022 12:36:56 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20220621123656.7a479ad9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gVQErqL6wYsDqhSe=SaTGRP";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/gVQErqL6wYsDqhSe=SaTGRP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/xlnx/zynqmp_disp.c: In function 'zynqmp_disp_create_planes':
drivers/gpu/drm/xlnx/zynqmp_disp.c:1260:17: error: implicit declaration of =
function 'drm_plane_create_zpos_immutable_property'; did you mean 'drm_plan=
e_create_scaling_filter_property'? [-Werror=3Dimplicit-function-declaration]
 1260 |                 drm_plane_create_zpos_immutable_property(&layer->pl=
ane, i);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                 drm_plane_create_scaling_filter_property
drivers/gpu/drm/xlnx/zynqmp_disp.c:1262:25: error: implicit declaration of =
function 'drm_plane_create_alpha_property'; did you mean 'drm_plane_create_=
color_properties'? [-Werror=3Dimplicit-function-declaration]
 1262 |                         drm_plane_create_alpha_property(&layer->pla=
ne);
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                         drm_plane_create_color_properties
cc1: all warnings being treated as errors

Presumably caused by one of the commits that dropped includes from
drm-ctrc.h.

I have used the drm-misc tree from next-20220620 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/gVQErqL6wYsDqhSe=SaTGRP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmKxLsgACgkQAVBC80lX
0GxVBwgAmClKyEbVOckxAjfBs5vNr2SJFtdNCTsAESyYKFo6OehLESFMGM4PYowd
1qIVF0LV4+ei7tqzU7v78DqJeYPyhhP378ZKVUPVePyFTCeCl0XoF++mseQPhsSL
vVVrK0fPvn7IQYnZ2D3xDd6x3EdWgTb4c6Pzgws5FfttFs6kywz2ovX5M0a5/SIP
nN4Y0Hgss3Yuz4N+hBiIBLFwQ7rbe7mgGOYXZGFLqqHtcHX0kbyDEtK5AIYU38P0
JuxtMGFceec+eur+VpKMuBt3ZcCeTseOTatwQaqQJV31w42+MqIaXfsq42XHAoii
x864eJ112U9CjGfohugEwax5baZcbQ==
=UKNF
-----END PGP SIGNATURE-----

--Sig_/gVQErqL6wYsDqhSe=SaTGRP--
