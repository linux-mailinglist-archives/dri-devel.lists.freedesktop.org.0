Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7E432171C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 13:43:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD8B6E0E4;
	Mon, 22 Feb 2021 12:43:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4123B6E0E4;
 Mon, 22 Feb 2021 12:43:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C069AAD2B;
 Mon, 22 Feb 2021 12:43:30 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, yuq825@gmail.com, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, eric@anholt.net, sumit.semwal@linaro.org,
 christian.koenig@amd.com, stern@rowland.harvard.edu
Subject: [PATCH v2 0/3] drm/prime: Only call dma_map_sgtable() for devices
 with DMA support
Date: Mon, 22 Feb 2021 13:43:25 +0100
Message-Id: <20210222124328.27340-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.1
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
Cc: linaro-mm-sig@lists.linaro.org, Thomas Zimmermann <tzimmermann@suse.de>,
 lima@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

USB-based drivers cannot use DMA, so the importing of dma-buf attachments
currently fails for udl and gm12u320. This breaks joining/mirroring of
displays.

The fix is now a little series. To solve the issue on the importer
side (i.e., the affected USB-based driver), patch 1 introduces a new
PRIME callback, struct drm_driver.gem_prime_create_object, which creates
an object and gives more control to the importing driver. Specifically,
udl and gm12u320 can now avoid the creation of a scatter/gather table
for the imported pages. Patch 1 is self-contained in the sense that it
can be backported into older kernels.

Patches 2 and 3 update SHMEM and CMA helpers to use the new callback.
Effectively this moves the sg table setup from the PRIME helpers into
the memory managers. SHMEM now supports devices without DMA support,
so custom code can be removed from udl and g12u320.

Tested by joining/mirroring displays of udl and radeon under Gnome/X11.

v2:
	* move fix to importer side (Christian, Daniel)
	* update SHMEM and CMA helpers for new PRIME callbacks

Thomas Zimmermann (3):
  drm: Support importing dmabufs into drivers without DMA
  drm/shmem-helper: Implement struct drm_driver.gem_prime_create_object
  drm/cma-helper: Implement struct drm_driver.gem_prime_create_object

 drivers/gpu/drm/drm_gem_cma_helper.c    | 62 ++++++++++++++-----------
 drivers/gpu/drm/drm_gem_shmem_helper.c  | 38 ++++++++++-----
 drivers/gpu/drm/drm_prime.c             | 43 +++++++++++------
 drivers/gpu/drm/lima/lima_drv.c         |  2 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c |  2 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c |  6 +--
 drivers/gpu/drm/panfrost/panfrost_gem.h |  4 +-
 drivers/gpu/drm/pl111/pl111_drv.c       |  8 ++--
 drivers/gpu/drm/v3d/v3d_bo.c            |  6 +--
 drivers/gpu/drm/v3d/v3d_drv.c           |  2 +-
 drivers/gpu/drm/v3d/v3d_drv.h           |  5 +-
 include/drm/drm_drv.h                   | 12 +++++
 include/drm/drm_gem_cma_helper.h        | 12 ++---
 include/drm/drm_gem_shmem_helper.h      |  6 +--
 14 files changed, 120 insertions(+), 88 deletions(-)

--
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
