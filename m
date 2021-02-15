Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B15531B3A2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 01:39:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ECBB6E8C0;
	Mon, 15 Feb 2021 00:39:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 360696E8C0;
 Mon, 15 Feb 2021 00:39:44 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Df4xT22D4z9sCD;
 Mon, 15 Feb 2021 11:39:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1613349583;
 bh=uFXs6FazZwdmJJXEDY5BMxYgEb6dBY8CHEHbCc+nb8g=;
 h=Date:From:To:Cc:Subject:From;
 b=Yc31lJoiwdrZ3b8r9XLxGiC0W9oyIHxCk3e0XmiinlKyv6bgpxhlLrfQnIFWteiMD
 IIqp6hKnuZ1FVHBM+jnUFvgUDZebfItBriXn7Xt/cCNSf1K1kwokcGmMs0rfWqDH85
 mKdzeGbjX+DZa3vdQQQyG4A9Scu3+aa7Ek/+k3uU0eiocx86obE1SsgeSzG7IiGX9x
 ugd7btL3PZ1JJGlw8uO4Kj50oPjzgEOYtJbgaxrp5rrJxPJZ2w5XGPJHlYuNGqRgBh
 XNB1WOGXua57LsjPr9OhmR+7unJ3BnIQgXb5Qg3JNiD7vg6KS/1+HSbxIv3oZQKeB1
 1Yj4xJBA1VbYA==
Date: Mon, 15 Feb 2021 11:39:39 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Hans de Goede
 <hdegoede@redhat.com>, Mark Gross <mark.gross@intel.com>
Subject: linux-next: build warning after merge of the pm tree
Message-ID: <20210215113939.03e44e3c@canb.auug.org.au>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: multipart/mixed; boundary="===============0043604059=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0043604059==
Content-Type: multipart/signed; boundary="Sig_/PDghjjOr9SVghXChJ=m6El4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/PDghjjOr9SVghXChJ=m6El4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

In file included from drivers/gpu/drm/gma500/mdfld_output.c:28:
arch/x86/include/asm/intel_scu_ipc.h:23:12: warning: 'struct module' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
   23 |     struct module *owner);
      |            ^~~~~~
arch/x86/include/asm/intel_scu_ipc.h:33:17: warning: 'struct module' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
   33 |          struct module *owner);
      |                 ^~~~~~

Introduced by commit

  bfc838f8598e ("drm/gma500: Convert to use new SCU IPC API")

OK, these will go away when the drm-misc tree removes this file in commit

  e1da811218d2 ("drm/gma500: Remove Medfield support")

So, if you don't want to see these warnings in Linus' build testing,
you need to make sure that the drm-misc tree is merged before the pm
tree (or the drivers-x86 tree).  Or you need to include module.h in
mdfld_output.c before intel_scu_ipc.h (or in intel_scu_ipc.h itself).
--=20
Cheers,
Stephen Rothwell

--Sig_/PDghjjOr9SVghXChJ=m6El4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmApwswACgkQAVBC80lX
0Gx1PAgApAm7IJ91caUkHXOEEGcUtLHEugWxn52HSOHgE7cxWCbdbjiZs0rJMfk/
J0miNgljVhx6JZ/MfpGuzdDLGeJjZu/zuqFf6V9ues4oXwS0FjSxWc28lJyGDcQL
K2qgZQTFFnWtxP7Cr1sPAgzWR/IuJKttUNXkiAe+686+hOJwGRHN6s/bRKbyVWeN
rYTXgpnuuKhJjUfaccsCtqZd4gqpgfg1e2zfvI/bVLJgrtmWzouu4D/U/pDH0s7C
6HhHlct01UccTWFlxG+45pD+lSRtnxLl+4srJ1KLvBZmXD2Z4zvlTXEIKLkW0Wwm
GkrCLriLDcDfP6zXcVpCkTnEgV5s5A==
=nKkW
-----END PGP SIGNATURE-----

--Sig_/PDghjjOr9SVghXChJ=m6El4--

--===============0043604059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0043604059==--
