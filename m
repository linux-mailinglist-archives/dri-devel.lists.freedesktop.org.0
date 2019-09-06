Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E859AB306
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 09:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 521EF6E15A;
	Fri,  6 Sep 2019 07:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B9C89292;
 Fri,  6 Sep 2019 07:05:06 +0000 (UTC)
X-Originating-IP: 82.195.192.6
Received: from localhost (unknown [82.195.192.6])
 (Authenticated sender: maxime.ripard@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id A6BAB1BF209;
 Fri,  6 Sep 2019 07:05:01 +0000 (UTC)
Date: Fri, 6 Sep 2019 10:05:00 +0300
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20190906070500.dfxacpgxoxalcha3@flea>
MIME-Version: 1.0
User-Agent: NeoMutt/20180716
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1874794514=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1874794514==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hrja3wxz3awu3gn3"
Content-Disposition: inline


--hrja3wxz3awu3gn3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel, Dave,

Here is a drm-misc-next-fixes PR with a significant number of fixes
for panfrost.

Maxime

drm-misc-next-fixes-2019-09-06:
 - A significant number of panfrost fixes for runtime_pm, MMU and GEM support
 - A fix for DCS transfers on mcde
The following changes since commit 578d2342ec702e5fb8a77983fabb3754ae3e9660:

  Merge tag 'drm-next-5.4-2019-08-23' of git://people.freedesktop.org/~agd5f/linux into drm-next (2019-08-27 17:22:15 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2019-09-06

for you to fetch changes up to 88537ddbbe4c755e193aa220a306395edf08a4cf:

  drm/mcde: Fix DSI transfers (2019-09-04 22:05:34 +0200)

----------------------------------------------------------------
 - A significant number of panfrost fixes for runtime_pm, MMU and GEM support
 - A fix for DCS transfers on mcde

----------------------------------------------------------------
Linus Walleij (1):
      drm/mcde: Fix DSI transfers

Rob Herring (12):
      drm/panfrost: Fix possible suspend in panfrost_remove
      drm/shmem: Do dma_unmap_sg before purging pages
      drm/shmem: Use mutex_trylock in drm_gem_shmem_purge
      drm/panfrost: Use mutex_trylock in panfrost_gem_purge
      drm/panfrost: Rework runtime PM initialization
      drm/panfrost: Hold runtime PM reference until jobs complete
      drm/panfrost: Remove unnecessary mmu->lock mutex
      drm/panfrost: Rework page table flushing and runtime PM interaction
      drm/panfrost: Split mmu_hw_do_operation into locked and unlocked version
      drm/panfrost: Add cache/TLB flush before switching address space
      drm/panfrost: Flush and disable address space when freeing page tables
      drm/panfrost: Remove unnecessary hwaccess_lock spin_lock

Steven Price (1):
      drm/panfrost: Add missing check for pfdev->regulator

 drivers/gpu/drm/drm_gem_shmem_helper.c           | 13 +++-
 drivers/gpu/drm/mcde/mcde_dsi.c                  | 68 ++++++++++++------
 drivers/gpu/drm/panfrost/panfrost_devfreq.c      |  6 +-
 drivers/gpu/drm/panfrost/panfrost_device.c       | 10 ---
 drivers/gpu/drm/panfrost/panfrost_device.h       |  3 -
 drivers/gpu/drm/panfrost/panfrost_drv.c          | 16 +++--
 drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c | 11 +--
 drivers/gpu/drm/panfrost/panfrost_job.c          | 43 +++++++----
 drivers/gpu/drm/panfrost/panfrost_mmu.c          | 91 +++++++++++-------------
 include/drm/drm_gem_shmem_helper.h               |  2 +-
 10 files changed, 149 insertions(+), 114 deletions(-)

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--hrja3wxz3awu3gn3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXXIFHAAKCRDj7w1vZxhR
xbaAAP9XD9dGLlB/dkwzTDtTrtsHgJrwiEx1BCPq6+wN7YRsrQD9H9In3tNBBDD7
Qw03QWiqasMOuqUmtfCXPTeN3mTKxQI=
=43kx
-----END PGP SIGNATURE-----

--hrja3wxz3awu3gn3--

--===============1874794514==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1874794514==--
