Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 515E7376A2D
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 20:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B54A6E0FD;
	Fri,  7 May 2021 18:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8534B6EDE1;
 Fri,  7 May 2021 18:57:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D945BAF19;
 Fri,  7 May 2021 18:57:12 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, alexander.deucher@amd.com, christian.koenig@amd.com
Subject: [PATCH 0/4] drm: Mark DRM's AGP code as legacy
Date: Fri,  7 May 2021 20:57:05 +0200
Message-Id: <20210507185709.22797-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch moves the DRM core's AGP code behind CONFIG_DRM_LEGACY. The
only use besides legacy, UMS drivers is radeon, which can implement the
required functionality by itself.

This patchset has no impact on the AGP support of existing drivers.

Patches 1 and 2 move some AGP code from DRM core into radeon. Radeon
uses some of the AGP code for its internal purposes. But being a KMS
driver, there's no reason why radeon should provide the rsp AGP ioctls.
So duplicate the implementation in radeon and thus uncould it from
the legacy code.

Patch 3 moves some AGP-related PCI helpers behind CONFIG_DRM_LEGACY.

Patch 4 moves DRM's AGP code behind CONFIG_DRM_LEGACY. The files are
then only build when legacy drivers are active.

Built-tested with different config options selected.

Thomas Zimmermann (4):
  drm/radeon: Move AGP helpers into radeon driver
  drm/radeon: Move AGP data structures into radeon
  drm: Mark PCI AGP helpers as legacy
  drm: Mark AGP implementation and ioctls as legacy

 drivers/gpu/drm/Makefile            |   6 +-
 drivers/gpu/drm/drm_agpsupport.c    |  99 ++++++++++++-----------
 drivers/gpu/drm/drm_bufs.c          |   1 -
 drivers/gpu/drm/drm_drv.c           |   4 +-
 drivers/gpu/drm/drm_internal.h      |   5 --
 drivers/gpu/drm/drm_ioc32.c         |  19 +++--
 drivers/gpu/drm/drm_ioctl.c         |  24 +++---
 drivers/gpu/drm/drm_legacy.h        |  30 +++++++
 drivers/gpu/drm/drm_legacy_misc.c   |   1 -
 drivers/gpu/drm/drm_memory.c        |   1 -
 drivers/gpu/drm/drm_pci.c           |  23 +++---
 drivers/gpu/drm/drm_vm.c            |   2 -
 drivers/gpu/drm/i810/i810_dma.c     |   3 +-
 drivers/gpu/drm/mga/mga_dma.c       |  16 ++--
 drivers/gpu/drm/mga/mga_drv.h       |   1 -
 drivers/gpu/drm/r128/r128_cce.c     |   2 +-
 drivers/gpu/drm/radeon/radeon.h     |  42 ++++++++++
 drivers/gpu/drm/radeon/radeon_agp.c | 118 ++++++++++++++++++++++++----
 drivers/gpu/drm/radeon/radeon_drv.c |  13 ---
 drivers/gpu/drm/radeon/radeon_kms.c |  18 +++--
 drivers/gpu/drm/radeon/radeon_ttm.c |   6 +-
 drivers/gpu/drm/via/via_dma.c       |   1 -
 include/drm/drm_agpsupport.h        | 117 ---------------------------
 include/drm/drm_device.h            |   6 +-
 include/drm/drm_legacy.h            |  82 +++++++++++++++++++
 25 files changed, 375 insertions(+), 265 deletions(-)
 delete mode 100644 include/drm/drm_agpsupport.h

--
2.31.1

