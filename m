Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B1998B1D7
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 03:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F79610E5B5;
	Tue,  1 Oct 2024 01:38:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="S6gJRfsV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB09010E5B2;
 Tue,  1 Oct 2024 01:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1727746712;
 bh=7AJU3cM5clBinSxqOdEFLA7CLsu9mIr7mYElmD4jpFM=;
 h=Date:From:To:Cc:Subject:From;
 b=S6gJRfsVMBjeXX39wf0sFrYNyNM8bkz9tQ73G9D9Ecc0PcFIfrYyXBljNBKn/+ADJ
 5M8qRvYV0+KPFuMWhf+YHkurv7geHvCWiEHJidTZklxepWDwsY3Xx/aXCX7ChG2C6B
 gI5W1+0/w+0isKWOnFqIa9flPLmnBDbDHNjf/0m8xZqpIkPvJ/13Tcweuj5A2IO63N
 Y2mP2JEyoX7KCc4iJvWur2c1grfS92POS6xyuVkvwG3xniRmJUXoKf/e13dFocR0bX
 JjwGPoJT/sqFm96gvNfk8o5rWETEUORYNfIUGDs/oxzCd+2JjUWOYLcj1bnqg8fnpa
 Hzq64DEAQ2Amg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XHgZG5llRz4wd6;
 Tue,  1 Oct 2024 11:38:30 +1000 (AEST)
Date: Tue, 1 Oct 2024 11:38:30 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Cc: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 DRM XE List <intel-xe@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-xe tree
Message-ID: <20241001113830.4ff4d3e5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9mfbDZ=TY.A9jZJ4sWb9Wd/";
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

--Sig_/9mfbDZ=TY.A9jZJ4sWb9Wd/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-xe tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/xe/display/xe_display.c: In function 'xe_display_pm_shutdow=
n':
drivers/gpu/drm/xe/display/xe_display.c:382:27: error: passing argument 1 o=
f 'intel_dmc_suspend' from incompatible pointer type [-Wincompatible-pointe=
r-types]
  382 |         intel_dmc_suspend(xe);
      |                           ^~
      |                           |
      |                           struct xe_device *
In file included from drivers/gpu/drm/xe/display/xe_display.c:24:
drivers/gpu/drm/i915/display/intel_dmc.h:22:46: note: expected 'struct inte=
l_display *' but argument is of type 'struct xe_device *'
   22 | void intel_dmc_suspend(struct intel_display *display);
      |                        ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~

Caused by commit

  501d799a47e2 ("drm/xe: Wire up device shutdown handler")

interacting with commit

  5c30cfa295cc ("drm/i915/dmc: Convert DMC code to intel_display")

from the drm-intel tree.

I have applied the following merge fix patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 1 Oct 2024 11:30:00 +1000
Subject: [PATCH] fix up for "drm/xe: Wire up device shutdown handler"

interacting with commit

  5c30cfa295cc ("drm/i915/dmc: Convert DMC code to intel_display")

from the drm-intel tree.
---
 drivers/gpu/drm/xe/display/xe_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/d=
isplay/xe_display.c
index 957ae763531d..ca00a365080f 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -379,7 +379,7 @@ void xe_display_pm_shutdown(struct xe_device *xe)
=20
 	intel_opregion_suspend(display, PCI_D3cold);
=20
-	intel_dmc_suspend(xe);
+	intel_dmc_suspend(display);
 }
=20
 void xe_display_pm_runtime_suspend(struct xe_device *xe)
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/9mfbDZ=TY.A9jZJ4sWb9Wd/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb7UpYACgkQAVBC80lX
0Gxe8Af9GC2HLN+iD7eWl5fVq5mGoFpjRcByK7GJ24ry3qKhxOjQCuwSm8fBWi9s
QrZOFShUXufLUJmUO4tCrjI7C+qFKbegIyLMHYDR2kVXqus3asFkt0sVgoR769zm
6N2QNrra2p8AP8HE6tZ1TmunD6XiOspHItiyudb/+WFVJEiwlA+opFEuBQpmWx+n
AJ243TnFoc+7Ht/Gn6UI3uz49hwuhIE7sDvUjtp6GdIPsofNX0BIt3qP8tcz6DZX
yttEXSGnLWw7Loe6fcMjeVYx6SGplO54owBbq4WINrhmwU4FCPjeXtOFOf7E2VZ0
RiO2fgr7o1zKnLPUKr5SJB8FJ7FM8A==
=bMbn
-----END PGP SIGNATURE-----

--Sig_/9mfbDZ=TY.A9jZJ4sWb9Wd/--
