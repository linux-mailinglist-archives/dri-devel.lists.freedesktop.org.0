Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 092C6359311
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 05:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B3386E44C;
	Fri,  9 Apr 2021 03:36:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22326E44C
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 03:36:22 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FGkLr2qD6z9sW1;
 Fri,  9 Apr 2021 13:36:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1617939381;
 bh=IwQxss0MPfAy2uX0dCdAtFxmafidWn5oWAKM3E+z3Ic=;
 h=Date:From:To:Cc:Subject:From;
 b=Cbx0IJH1B3345SvFVnj0qL7KPAMaLiMOGlwUwwFkt2qwE90DW0vGtaQPkzRuyC/j2
 OVr3ORFzm7SVqfA+is1IEi4TuiEtnqmsBGlpNG1nQuCDufDtJvt2K9NysoydwN0GFz
 0/bhpxgzqYX+09CfeJZumGNe1y1J6JCBiBy66YDJif3H3uxGYlWyeJ3dhKi3Qean/V
 KW52Frpm7wc4exN5vRLmq7sZpGxbdiXjbTzPDz5L0tzlCs8p1xprNDK+L2h5DiAZjP
 dLWOVMfHKonSJJXudsxIQMut13qrSg488RP3wjchNR+nGw0PwhILsKNHJNlHx7rzO0
 rxtPDUlnCK+mg==
Date: Fri, 9 Apr 2021 13:36:19 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build failure after merge of the drm tree
Message-ID: <20210409133619.69c135ff@canb.auug.org.au>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: multipart/mixed; boundary="===============0683737235=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0683737235==
Content-Type: multipart/signed; boundary="Sig_/6fkHv07WnvS/lravUEQ/Ire";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6fkHv07WnvS/lravUEQ/Ire
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/gpu/drm/i915/display/intel_dp_link_training.c:43:13: error: redefin=
ition of 'intel_dp_reset_lttpr_common_caps'
   43 | static void intel_dp_reset_lttpr_common_caps(struct intel_dp *intel=
_dp)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/i915/display/intel_dp_link_training.c:38:13: note: previous=
 definition of 'intel_dp_reset_lttpr_common_caps' was here
   38 | static void intel_dp_reset_lttpr_common_caps(struct intel_dp *intel=
_dp)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/i915/display/intel_dp_link_training.c:38:13: warning: 'inte=
l_dp_reset_lttpr_common_caps' defined but not used [-Wunused-function]

Caused by commit

  9976ff61f045 ("Merge remote-tracking branch 'drm/drm-next'")

Because commit

  7dffbdedb96a ("drm/i915: Disable LTTPR support when the DPCD rev < 1.4")

from Linus' tree and commit

  264613b406eb ("drm/i915: Disable LTTPR support when the DPCD rev < 1.4")

from the drm tree are the same patch, git added the funtion twice :-(

I have applied a merge fix patch removing the second copy.

--=20
Cheers,
Stephen Rothwell

--Sig_/6fkHv07WnvS/lravUEQ/Ire
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBvy7MACgkQAVBC80lX
0Gy5yAf/U42Uq/AB7igWzd8a6NJkb/jaBLQE0Ee2eptP56lOYXjo+dcpgzctYZg6
vbNSzWBbCqfeBT4f/W5M/HTvJDs4f+/yKYrCR+T8iITMlDfSh/dDt+XqMTz4bt9A
ZQKnnRnyvf+ZPFmtca33XXhGiQ1RquTBQuReeGLki0xPnq3ukhyxJdBHuKUYU+QN
3X+cts3DRnzIAG9uqXpFpxuSPx65gl5tMvewM6X1OdQfYW4q7u8bMUNWUcqTiZsi
VrLlqmR4JX+ZlQgM4kVaJFpkCmZAUF/X0lZp5+YAHd3fYnmb3Q+EUmUcnsyJ3TPT
11n+haswRp7TtOzmxv4IvnqA92Ykew==
=jTb1
-----END PGP SIGNATURE-----

--Sig_/6fkHv07WnvS/lravUEQ/Ire--

--===============0683737235==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0683737235==--
