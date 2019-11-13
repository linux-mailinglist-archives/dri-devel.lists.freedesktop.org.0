Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82ECEF9F7F
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 01:46:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507C96E057;
	Wed, 13 Nov 2019 00:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F856E057
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 00:46:22 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47CQsS1bYjz9sPh;
 Wed, 13 Nov 2019 11:46:20 +1100 (AEDT)
Date: Wed, 13 Nov 2019 11:46:19 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20191113114619.0562659e@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1573605980;
 bh=Cfu0M8kThALcEqe2HrOjz3qJOIlvCWAsX9fy7Q9sPdo=;
 h=Date:From:To:Cc:Subject:From;
 b=p1v6IzOA/1nkHRibV1EEAj6npc1X8TbGFHkw6s2wkIFRboqNAMaDaXA4G6bzv5TEn
 mVaNOckns/uBs6JUmB08/AF7FAno+NGsqPgm98kTSmYS14I1+ZwROvojoFaiCQqpGE
 upnuAWyDLxlqopCmED1GbhkFwcIzX6pe9kr+w/HaH6q3+2wnYhq77vj+55wT8IG3sm
 YE5OIiy//kV7ppOCuVsz1nVae8AwuSd7K/MgtcWAPR6pWJjiewl7FhPhwiow2vN8rx
 LcOuaOx6aEOF7EPMdheRcL2RsvO5vJv+sKCnEqbt1dOsIKlQ/v48imRV5kj2toYnYf
 xtdSfjEIs18RQ==
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
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1575872856=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1575872856==
Content-Type: multipart/signed; boundary="Sig_/XebMLZ8drmtbK6hvw.rdWJY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/XebMLZ8drmtbK6hvw.rdWJY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/i915/gt/intel_engine_types.h

between commit:

  311a50e76a33 ("drm/i915: Add support for mandatory cmdparsing")

from Linus' tree and commits:

  cdb736fa8b8b ("drm/i915: Use engine relative LRIs on context setup")
  058179e72e09 ("drm/i915/gt: Replace hangcheck by heartbeats")

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

diff --cc drivers/gpu/drm/i915/gt/intel_engine_types.h
index 9dd8c299cb2d,c5d1047a4bc5..000000000000
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@@ -473,15 -454,13 +454,14 @@@ struct intel_engine_cs=20
  	/* status_notifier: list of callbacks for context-switch changes */
  	struct atomic_notifier_head context_status_notifier;
 =20
- 	struct intel_engine_hangcheck hangcheck;
-=20
 -#define I915_ENGINE_NEEDS_CMD_PARSER BIT(0)
 +#define I915_ENGINE_USING_CMD_PARSER BIT(0)
  #define I915_ENGINE_SUPPORTS_STATS   BIT(1)
  #define I915_ENGINE_HAS_PREEMPTION   BIT(2)
  #define I915_ENGINE_HAS_SEMAPHORES   BIT(3)
  #define I915_ENGINE_NEEDS_BREADCRUMB_TASKLET BIT(4)
  #define I915_ENGINE_IS_VIRTUAL       BIT(5)
+ #define I915_ENGINE_HAS_RELATIVE_MMIO BIT(6)
 +#define I915_ENGINE_REQUIRES_CMD_PARSER BIT(7)
  	unsigned int flags;
 =20
  	/*

--Sig_/XebMLZ8drmtbK6hvw.rdWJY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3LUlsACgkQAVBC80lX
0GzODwgAg+bP1OkJ2gbZDoB+jKhaV82WRM2N3AhBzfgXgIRNmr3yzN/NUgSyipM8
Lf2qRmBbw08V6inl1YMZQ+5Xn+iws0xqrD1TuRJTzJN9qU1VCU6QF1hFfN7FbYtJ
pkWlhhLdYzg861FjoDPge+Rxa1PbPFSU7HE8p6l9in2o7w38dOXZKJLDneiAK9f6
x9GRg1BMeTQVJWHtvKuTvCq4kizeVmG4g1tPQK/0vFi3fFlH7XVV4dBYaV7EQSsr
loXzs3S51neZFwM5ZFS4mHjmV08TCeoD5pubAYbifpaYN4preb0TsYFp6bMfdsY3
3BJ9ytD2hiQfRno2luu/m9N3wCc6gw==
=ZgeW
-----END PGP SIGNATURE-----

--Sig_/XebMLZ8drmtbK6hvw.rdWJY--

--===============1575872856==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1575872856==--
