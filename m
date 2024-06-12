Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B27E9049E1
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 06:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE9110E776;
	Wed, 12 Jun 2024 04:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MFKiELrB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3826E10E772;
 Wed, 12 Jun 2024 04:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1718165560;
 bh=9ZFs9kPnbsyJlJHuZTpWlbYutjebMjdcPR6NsGP867s=;
 h=Date:From:To:Cc:Subject:From;
 b=MFKiELrBw+18mcbwASGU9x+vIxbhtb6tfULSNb7dFbLbaaom+nGdGJWwmZcT9E12O
 GwemrVq47ex4domIUIZLCWI7XLmoPPjAtWZ8LYWQudSSWppWo5zKXzx9i1muvODIeK
 25RoB9cP5K+3iw95KwxrPo9b2bO//+YGW8zqzBOWGuHPNbAWYkHkal8Kd4vP1+LkIM
 /TNj21aQNvTQoT5/HHRyI4sxAZGB8RiAj7Qzek+sRrOA3IAXWNrjGAi5XoS9WOUEBB
 +YcW9/voUUxjSZdxDCWcJIghtwVTb5Qn6WgUkcT2M4p4jzlLKZg8CgpKsQc/2a0q4Z
 1gV9BUa3MAwNQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4VzXFN2mVmz4w2P;
 Wed, 12 Jun 2024 14:12:40 +1000 (AEST)
Date: Wed, 12 Jun 2024 14:12:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>, Suraj Kandpal
 <suraj.kandpal@intel.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-intel tree
Message-ID: <20240612141239.141ce8cc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.vbPo1=wII9KCPpenjrUXFl";
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

--Sig_/.vbPo1=wII9KCPpenjrUXFl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-intel tree, today's linux-next build (i386
defconfig) failed like this:

x86_64-linux-gnu-ld: drivers/gpu/drm/i915/display/intel_vrr.o: in function =
`intel_vrr_compute_config':
intel_vrr.c:(.text+0x4e4): undefined reference to `__udivdi3'

Caused by commit

  1676ecd303ac ("drm/i915: Compute CMRR and calculate vtotal")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/.vbPo1=wII9KCPpenjrUXFl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZpIDcACgkQAVBC80lX
0GzmZgf/WRH/KEgcppZo+Klh5uGzWYf340VlANrW37r9HaPEdpoT2+2sYkAGcqQY
R883y5nxFokZkRee3mRVZ4Lksdz9s8WRowvQdoOmBj7WHcljxCbhjscPQ0XVbMPy
XCUQuxoA8n/CEG62clXPTA0ssin1J6dtP5CrFbMhgT68F8to7zHue8Wr0c7i4Pfx
3sf7RVkia03hYTsNaIUSD/XZNZaUoDKfkKOMDW0+F3O0D8S4zk1qLn0WzqWx/0k5
vbjp9yu/gEA2Lt+JLfZfK5N9LmxCgQ6vNZCb4HtXPhOILP/OcWe1XwcKcgiWJfv9
iLbjMAWSjq/mKXIq6HTyzzcfk9Yolw==
=kVkc
-----END PGP SIGNATURE-----

--Sig_/.vbPo1=wII9KCPpenjrUXFl--
