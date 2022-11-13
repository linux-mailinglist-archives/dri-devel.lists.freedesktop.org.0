Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65905627374
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 00:23:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D80D10E24F;
	Sun, 13 Nov 2022 23:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0370510E24C;
 Sun, 13 Nov 2022 23:23:35 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4N9T5X6QJRz4x1D;
 Mon, 14 Nov 2022 10:23:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1668381810;
 bh=65AmNELdQUu+5ZUFxLeHt1YFNVUSiBa9NN7XJDkLfcI=;
 h=Date:From:To:Cc:Subject:From;
 b=bCJ6EFhmvwL+L4257L0lSgATVHywjhbm2XWZI0I8HRFQ7QlkQLi+i6xY1iTWgsKsR
 XcM00TeNiMuhPVqo3db8u8Bgdf9OSMQJ7yICBe+R07reaz67quvS0rKNcFtE1fXny1
 VE1JVBNp/r5Kc2qvZtenrVBbltEiWlPgwImXR/+pObGp/zBkYkvs1RcVsguk42IM+o
 jDDZSYkHID1jV0ng02johKCkXsDKXrCHP0zjXBv3EuFRxyluqIjOdkxXyCLPRgv33k
 Z8tSI3/IRZVWCLO7ncZuT6jktCAIyPXuadwQ4uuatBs0goApetSkzBtiVNTu6LpDMz
 fUiLIdy9EI5wQ==
Date: Mon, 14 Nov 2022 10:23:27 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: linux-next: manual merge of the drm-intel tree with Linus' tree
Message-ID: <20221114102327.6d53341e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZnAXSQtQ1fl=ax+EWztprCE";
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Hans de Goede <hdegoede@redhat.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/ZnAXSQtQ1fl=ax+EWztprCE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/display/intel_backlight.c

between commit:

  b1d36e73cc1c ("drm/i915: Don't register backlight when another backlight =
should be used (v2)")

from Linus' tree and commit:

  801543b2593b ("drm/i915: stop including i915_irq.h from i915_trace.h")

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

diff --cc drivers/gpu/drm/i915/display/intel_backlight.c
index beba39a38c87,0438071f58cf..000000000000
--- a/drivers/gpu/drm/i915/display/intel_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_backlight.c
@@@ -8,8 -8,7 +8,9 @@@
  #include <linux/pwm.h>
  #include <linux/string_helpers.h>
 =20
 +#include <acpi/video.h>
 +
+ #include "i915_reg.h"
  #include "intel_backlight.h"
  #include "intel_backlight_regs.h"
  #include "intel_connector.h"

--Sig_/ZnAXSQtQ1fl=ax+EWztprCE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmNxfG8ACgkQAVBC80lX
0GxEfwf/ZY8+RcMKTXCLuurxKxq3aiF7cZqDEBXsSX75DF1hJbR4HJgviZevd33o
Xby2YRrl5W5+lGzBS7B3gbiE7fhvzHONuDFhTYBWEUZ3SozZaruwGjg/C9bzX8B6
Ch0G1haLNoP/+VfSPh8Efn3eLgnxKv4xWcz2NRXHPzWPOLg9xa9DdDu50X0OJyn3
vlYIaqC3doE1UyWv9alq0MBTjMu1tbxgAMy4ch47B5jA0zSrKmwQDVsvC1GOvbOJ
S09Fzemym++0a0NBl/9/VIXpGbtNFyGDgA7a2dQA4T/q7skXJIAwjeLO2YXHiVwT
SlKy0f/AaXHYTinLpBhpxMMyGURIag==
=6WTA
-----END PGP SIGNATURE-----

--Sig_/ZnAXSQtQ1fl=ax+EWztprCE--
