Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A5240EE89
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 02:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4F66EA42;
	Fri, 17 Sep 2021 00:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C143C6EA3B;
 Fri, 17 Sep 2021 00:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1631840279;
 bh=RuX66OxFWoS0HDfqpgFCs8AC9nKRS0uV9pHUrXlk8wA=;
 h=Date:From:To:Cc:Subject:From;
 b=YHqoahSnvwgzkWOLXkV7xXS6LmRJbrTMUzZ/tTEYtFAYFngtrSGBzGB8VZfhjQb7z
 3mQfcgazN+WeNp9BpSd2vizG4+fzDadtIqFuGfmO5USEvBjmZy+9SoeeyWSD4/yMwo
 8RUdOSiNG2HFhN/r/pcWLIv42wSmUG/naeI51ABKa4Un5PL0ISUH+65SCgEA+7ONY9
 3evurreYf4s/i/pp0l0GyeC33wUcgCtDIKyBJC6BvXVm4pnofxPEjRdl14JkU8Iv1W
 OpnYLy/Zs8vnAxpfm0IiAOrw7FzPP2DoSuwtghmVVGRYzJ7AMQ/x861pdq2I2uuewg
 RiSjufrl6QxSw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H9bCn3tTJz9sSn;
 Fri, 17 Sep 2021 10:57:57 +1000 (AEST)
Date: Fri, 17 Sep 2021 10:57:56 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>, Intel
 Graphics <intel-gfx@lists.freedesktop.org>
Subject: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20210917105756.5dadb04f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HugLTVrN6UZUSxE31.c3uqD";
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

--Sig_/HugLTVrN6UZUSxE31.c3uqD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from include/drm/ttm/ttm_bo_driver.h:40,
                 from include/drm/drm_gem_ttm_helper.h:11,
                 from drivers/gpu/drm/drm_gem_ttm_helper.c:5:
include/drm/ttm/ttm_device.h:274:19: error: duplicate member 'pinned'
  274 |  struct list_head pinned;
      |                   ^~~~~~

Caused by commit

  59084e464297 ("drm/ttm: Create pinned list")

interacting with commit

  32eadf52d449 ("drm/ttm: Create pinned list")

from the drm-misc tree.

The automatic merge proved incorrect, so I have removed one of the
insertions.

--=20
Cheers,
Stephen Rothwell

--Sig_/HugLTVrN6UZUSxE31.c3uqD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFD6BQACgkQAVBC80lX
0GwRPwf/Tt0n9y8x90B941oTzeKwtNQCKq6uafkNwpGKusptbV/GeUGCHq/nlob6
FCxU0bPgYGc3ikvA2b5g9VrmABPgQPzS03b0WM0+LjGNkyXwc41IfdHrKV1Vwo4V
3xe7XowJgUdLl5/PG2IdMsZx+2sTHjJ7uCXv3FY+Q77WPibp6wCevcJtED6d1nKf
DoBznPm1oQ2UULxvkPLn5z1K/kuuT2pvf9jZP7K92EJxYDi/jErJTe+l5sQ++U6O
e8Ra+R/MSXRNNaz94+blXQEqsyW7Gavobz5GEI73V55dprtUzx35qEfm151t5sbe
qx7rRB2Yr12HY/JDfr/fwyqu2QP9mg==
=rv2/
-----END PGP SIGNATURE-----

--Sig_/HugLTVrN6UZUSxE31.c3uqD--
