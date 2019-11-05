Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3275FEF3C1
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 03:54:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5966E8E0;
	Tue,  5 Nov 2019 02:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC096E8E0
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 02:54:26 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 476Z4v1Hcyz9sP6;
 Tue,  5 Nov 2019 13:54:22 +1100 (AEDT)
Date: Tue, 5 Nov 2019 13:54:22 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build failure after merge of the drm tree
Message-ID: <20191105135422.46ddc865@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1572922464;
 bh=apINLqpoL1ArxoY3YZHvUGKkHEENAmWBBm7q4I02XPk=;
 h=Date:From:To:Cc:Subject:From;
 b=dG4gqwEbrYIzKUaSuOWEOec9y7I4BlEU8L9bPSJ8+u1QzLH8XRQev3z5oN1UY8Jfu
 EefPqlNqvGcuCvrYdECsjCh10evJ2PPKX0E302e0RL0eQc3Bp7ZyKQmleEIZJFetel
 4ZPM/JO0MilitNX7dsmO1IAalwJ1+Yqxw+0fEhoZgB1SZNWYhrlLVyhClhWriKRE/Y
 aQoKWe28Colf2llGrByWG8ElZ46IwNdP1kf5nt42gdk/xOK9vU8hxFsW/vX4TbUL1Q
 QQFJYvkkf1DFzyGhBOYMXPnZAK2JFD6LqpIo+ltyBm92anqYmUzc5qvyABKuSZB2Ih
 JxK2ehx9UcQpw==
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1210672680=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1210672680==
Content-Type: multipart/signed; boundary="Sig_/hQb8xY0vB02FYJL95wqmqq2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/hQb8xY0vB02FYJL95wqmqq2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

arch/powerpc/platforms/embedded6xx/Kconfig:2:error: recursive dependency de=
tected!
arch/powerpc/platforms/embedded6xx/Kconfig:2:   symbol EMBEDDED6xx depends =
on BROKEN_ON_SMP
init/Kconfig:79:        symbol BROKEN_ON_SMP depends on BROKEN
init/Kconfig:76:        symbol BROKEN is selected by DRM_I915_DEBUG
drivers/gpu/drm/i915/Kconfig.debug:20:  symbol DRM_I915_DEBUG depends on DR=
M_I915
drivers/gpu/drm/i915/Kconfig:2: symbol DRM_I915 depends on DRM
drivers/gpu/drm/Kconfig:8:      symbol DRM depends on AGP
drivers/char/agp/Kconfig:2:     symbol AGP depends on PCI
drivers/pci/Kconfig:16: symbol PCI depends on HAVE_PCI
drivers/pci/Kconfig:7:  symbol HAVE_PCI is selected by FORCE_PCI
drivers/pci/Kconfig:11: symbol FORCE_PCI is selected by MVME5100
arch/powerpc/platforms/embedded6xx/Kconfig:51:  symbol MVME5100 depends on =
EMBEDDED6xx
For a resolution refer to Documentation/kbuild/kconfig-language.rst
subsection "Kconfig recursive dependency limitations"

Caused by commit

  d9d54a530a70 ("drm/i915: Put future HW and their uAPIs under STAGING & BR=
OKEN")

You really should not select BROKEN.  It is assumed to always be false
so we can make actually broken code depend on it (and therefore not
be built).

I have used the drm tree from next-20191031 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/hQb8xY0vB02FYJL95wqmqq2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3A5F4ACgkQAVBC80lX
0GzuyAf+KXyUifG6em3g9mg+29qjxDCg0ln6ZOoslj73LdJMhIKwUTs+qVkNJW7w
s4y+XIRwROwSLgGFKZKGCycb4XQJLNk/IaxI5NyPj5s+zQ2s+P8Q38rNy/i+hcnJ
yqp/uW8iF7rW0IPm+yRWPDtYWMZ+h4SoQrPanTPRoq3N6o1OSqCNryZpFRRlFzQU
mu/2mCTWCVlD9ukx8RdVeebFtwdOtOIOmR/WmTUm9nzncbNPJqxL/xE+lBdjC6O8
M/UFMizFYOyBQXarGQjubPOhImzReqJiOHhBqgdQeoBy2knzST0IFundpmIKe1cG
FHDwjXsTPmaG6EgQF+llaOT78sIC9Q==
=imT/
-----END PGP SIGNATURE-----

--Sig_/hQb8xY0vB02FYJL95wqmqq2--

--===============1210672680==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1210672680==--
