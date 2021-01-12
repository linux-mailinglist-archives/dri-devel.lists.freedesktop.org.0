Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DA32F29B7
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 09:10:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D106E0F7;
	Tue, 12 Jan 2021 08:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBCAB6E0EA;
 Tue, 12 Jan 2021 08:10:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 78A87B74C;
 Tue, 12 Jan 2021 08:10:39 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, alexander.deucher@amd.com, christian.koenig@amd.com
Subject: [PATCH 0/6] Move struct drm_device.hose to legacy section
Date: Tue, 12 Jan 2021 09:10:29 +0100
Message-Id: <20210112081035.6882-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset moves struct drm_device.hose to the section for legacy
drivers. As part of this, a number of other changes are applied in
order to protect all uses of hose by CONFIG_DRM_LEGACY.

Patches 1 to 3 move non-legacy code out put drm_memory.c and add the
remaining I/O-memory helpers to the legacy code.

Patch 4 addresses CONFIG_DRM_VM, which is only selected by legacy
drivers, so drm_vm.c can directly be compiled by CONFIG_DRM_LEGACY.

Patch 5 changes radeon to maintain its own copy of the hose field of
struct drm_device.

Patch 6 makes the hose field legacy.

The patchset has been compile-tested w/o CONFIG_DRM_LEGACY enabled.

Thomas Zimmermann (6):
  drm: Inline AGP wrappers into their only callers
  drm: Implement drm_need_swiotlb() in drm_cache.c
  drm: Build drm_memory.o only for legacy drivers
  drm: Merge CONFIG_DRM_VM into CONFIG_DRM_LEGACY
  drm/radeon: Store PCI controller in struct radeon_device.hose
  drm: Move struct drm_device.hose to legacy section

 drivers/gpu/drm/Kconfig             |  5 ---
 drivers/gpu/drm/Makefile            |  6 ++--
 drivers/gpu/drm/drm_agpsupport.c    | 12 +++----
 drivers/gpu/drm/drm_cache.c         | 32 ++++++++++++++++++
 drivers/gpu/drm/drm_file.c          |  2 ++
 drivers/gpu/drm/drm_legacy.h        |  2 +-
 drivers/gpu/drm/drm_memory.c        | 51 -----------------------------
 drivers/gpu/drm/radeon/radeon.h     |  3 ++
 drivers/gpu/drm/radeon/radeon_drv.c |  4 ---
 drivers/gpu/drm/radeon/radeon_kms.c |  4 +++
 drivers/gpu/drm/radeon/radeon_ttm.c |  2 +-
 include/drm/drm_agpsupport.h        | 18 ----------
 include/drm/drm_device.h            |  9 ++---
 13 files changed, 57 insertions(+), 93 deletions(-)


base-commit: cd0df21e28c36de80356344ff8683be2813c6ff2
prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
--
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
