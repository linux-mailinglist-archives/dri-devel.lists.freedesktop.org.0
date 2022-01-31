Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB624A5256
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 23:27:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA66989D83;
	Mon, 31 Jan 2022 22:27:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC1589D83;
 Mon, 31 Jan 2022 22:27:44 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JnjP46VS2z4xcR;
 Tue,  1 Feb 2022 09:27:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1643668058;
 bh=6zdO+QRlqy6ZLwcdl/K3VM9cvcTFOAPhdPY6ABA2x/U=;
 h=Date:From:To:Cc:Subject:From;
 b=nqj30PCA+v7dUgNT8bzmCEhuWO0L2WodR6X42tFLAHVUP/y+QrnCsFHNr1VipYnPH
 QXg90PfgQM2kqa0aKkFOU38PgrjwUPtTB8CKpfYDJp70JwPF3utXlWPbee0zDdXmL0
 oJANbKbPAkNS/9pAacfCxjjxS4jcEndvqagGxXSSImSEacq1HtOgCRMnfqTl198XN/
 webdUcVH+a9Fc5+9+8fXttTdp0+ysuZhckFFW5Gw/LhOPhBS2WydVW7RFvtRQVlhNq
 IrD3jWwCkbEDVpNnhGUNwMny8iha6628xVqFJcSN83iMCaquepwM1DMytj/fcIbMd1
 /hY6lZZElC6Yw==
Date: Tue, 1 Feb 2022 09:27:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: build failure after merge of the drm-intel-fixes tree
Message-ID: <20220201092735.1d5b38d3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P0jXNpzxGM5MKBdivRc5/.o";
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/P0jXNpzxGM5MKBdivRc5/.o
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-intel-fixes tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/i915/i915_vma.c: In function 'i915_vma_bind':
drivers/gpu/drm/i915/i915_vma.c:451:25: error: 'ret' undeclared (first use =
in this function); did you mean 'net'?
  451 |                         ret =3D i915_gem_object_wait_moving_fence(v=
ma->obj, true);
      |                         ^~~
      |                         net

Caused by commit

  2e872d87cbf2 ("drm/i915: delete shadow "ret" variable")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/P0jXNpzxGM5MKBdivRc5/.o
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmH4YlcACgkQAVBC80lX
0Gy3cwf/brC2EFiNiIpdHNyA+Otwx6kgE3B0cDHwQF3xWcjAq/DfGqMeY1buwpN4
XifRhRRZWIuIiStMWbLOgMyEU2FqMDDNpa7Ek0mEGuY+xYw9Dqac1Hudti7KfjFq
OLAzTOSjeETHtVyL7HCqGxSZPqybyc21//hnixrF4lrTz/97c/DOGzid97Jz2huM
JSQHll4qDlLr4hxUmfO4jb7Xyqr0CSadW5UHcC04kiF3zWxhwrXBbdSXBh3GdCGL
5/useiTgWbsAEOuk0Lzs5ewnR/X/z0PU1b4VK47W/nr4C0w4eArQMK66zYFYILYR
TGY1jtNFb8ULvJCPcUPgnPF6Oxa8GA==
=EBQN
-----END PGP SIGNATURE-----

--Sig_/P0jXNpzxGM5MKBdivRc5/.o--
