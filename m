Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB645F9FF6
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 02:13:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC436EC42;
	Wed, 13 Nov 2019 01:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1179A6EC42
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 01:13:56 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47CRTG1wJQz9s7T;
 Wed, 13 Nov 2019 12:13:54 +1100 (AEDT)
Date: Wed, 13 Nov 2019 12:13:52 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20191113121352.3b1e85bd@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1573607635;
 bh=g15OSr6tjmM8WcvHvyRJcU3qjqAKy7LsnWP62p1/2ec=;
 h=Date:From:To:Cc:Subject:From;
 b=TPjuu9KEwIeDO+zaUMiErTaMyUTqkvrU8tWgyvZ6HUhV3w0H4ZFzbD7zDAcsTmaXW
 puBRd7LOmkdn+y4V9GIimnDqsQf37It7u/2wG2owFmpuULsYMJgknkndMN9R55xmOH
 s/ZwVoLEpmR1Kr1O5jV+EJLOdQLLiGZP5SfYdCm1g99/IYbULBLeO+PLNFixShk0+m
 aKlxYgLYaoIDU1FWrVKcFO7LwjvICb5AKTxP6JVGLsZ6PprqASuKzbmKQD7W66QhKT
 HrsfTRF2SSv+a+nZq/d/JNH2uFtqxfxbjQ/ZFwGx1s+52h0orAMeLD37lU1YVe8HiM
 YLZs+BaxjJ7UQ==
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
Cc: Anshuman Gupta <anshuman.gupta@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>, Uma Shankar <uma.shankar@intel.com>
Content-Type: multipart/mixed; boundary="===============0117592060=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0117592060==
Content-Type: multipart/signed; boundary="Sig_//WkbiqEZT/2qZv01sZ8IkdP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//WkbiqEZT/2qZv01sZ8IkdP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/i915/i915_reg.h

between commit:

  1d85a299c4db ("drm/i915: Lower RM timeout to avoid DSI hard hangs")

from Linus' tree and commit:

  41286861b4c9 ("drm/i915/tgl: Add DC3CO counter in i915_dmc_info")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/i915_reg.h
index f8ee9aba3955,53c280c4e741..000000000000
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@@ -7217,10 -7351,8 +7357,12 @@@ enum=20
  #define TGL_DMC_DEBUG_DC5_COUNT	_MMIO(0x101084)
  #define TGL_DMC_DEBUG_DC6_COUNT	_MMIO(0x101088)
 =20
+ #define DMC_DEBUG3		_MMIO(0x101090)
+=20
 +/* Display Internal Timeout Register */
 +#define RM_TIMEOUT		_MMIO(0x42060)
 +#define  MMIO_TIMEOUT_US(us)	((us) << 0)
 +
  /* interrupts */
  #define DE_MASTER_IRQ_CONTROL   (1 << 31)
  #define DE_SPRITEB_FLIP_DONE    (1 << 29)

--Sig_//WkbiqEZT/2qZv01sZ8IkdP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3LWNEACgkQAVBC80lX
0GzBsQf/SeCccVFD+GcevT0QOZ+vm/36MyNCG9lj8yBWcW6KlCaLwBpRSNDSg+kq
4E36ofkUyXvUQb/Sun0TRQ+382a96ynjGv9EaUv4zBQ+ZfTBFi2ed9Vtjdk22UsD
i01ek9OT3p9+6FeZn6Bzro6E9d6JE/5KQZcO4sb0F9NG0HmONwBdgTv8pfQPPrDS
LvTbDpvOwYLVc8fqkaYgaAdup0EJUeROwgwp5tuYgDRvup4LZfLVPtv4pB0lvvU6
YsRtA+bDe/ri7hq6gULxCNvN+tRBF9wjZE+Fs4L/tWvd4Fi0CICu+9zrLHnXgQ49
tp55aJtzd0ELPjSF+US3MAhU5Ga+IQ==
=edsz
-----END PGP SIGNATURE-----

--Sig_//WkbiqEZT/2qZv01sZ8IkdP--

--===============0117592060==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0117592060==--
