Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BACD22A9884
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 16:26:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5766EAA5;
	Fri,  6 Nov 2020 15:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E256EA9B;
 Fri,  6 Nov 2020 15:26:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2C94FABA2;
 Fri,  6 Nov 2020 15:26:35 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, yuq825@gmail.com, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, sean@poorly.run, eric@anholt.net,
 kraxel@redhat.com, rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 hamohammed.sa@gmail.com
Subject: [PATCH v2 0/2] Default to cachable mappings for GEM SHMEM
Date: Fri,  6 Nov 2020 16:26:30 +0100
Message-Id: <20201106152632.26530-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, lima@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Shmem-allocated memory uses the system's default caching flags,
usually involving cached mappings.

By default, SHMEM GEM helpers map pages using writecombine. Only a few
drivers require this setting. Others revert it to default mappings
flags. Some could benefit from caching, but don't care.

Unify the behaviour by switching the SHMEM GEM code to use cached
mappings (i.e., PAGE_KERNEL actually); just like regular shmem memory
does. The 3 drivers that require write combining explicitly select it
during GEM object creation.

The exception is dma-buf imported pages, which are always mapped
using writecombine mode.

v2:
	* recreate patches on top of latest SHMEM helpers
	* update lima, panfrost, v3d (Daniel, Rob)
	* udl has been updated before separately.

Thomas Zimmermann (2):
  drm/shmem-helper: Use cached mappings by default
  drm/shmem-helper: Removed drm_gem_shmem_create_object_cached()

 drivers/gpu/drm/drm_gem_shmem_helper.c  | 37 ++++---------------------
 drivers/gpu/drm/lima/lima_gem.c         |  2 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c   |  1 -
 drivers/gpu/drm/panfrost/panfrost_gem.c |  2 +-
 drivers/gpu/drm/udl/udl_drv.c           |  2 --
 drivers/gpu/drm/v3d/v3d_bo.c            |  2 +-
 drivers/gpu/drm/virtio/virtgpu_object.c |  1 -
 drivers/gpu/drm/vkms/vkms_drv.c         |  1 -
 include/drm/drm_gem_shmem_helper.h      |  7 ++---
 9 files changed, 11 insertions(+), 44 deletions(-)

--
2.29.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
