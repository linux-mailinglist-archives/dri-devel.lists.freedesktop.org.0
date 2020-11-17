Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB15C2B62A4
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 14:32:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB9D6E219;
	Tue, 17 Nov 2020 13:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99506E20F;
 Tue, 17 Nov 2020 13:32:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 49169B127;
 Tue, 17 Nov 2020 13:31:58 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, yuq825@gmail.com, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, sean@poorly.run, eric@anholt.net,
 kraxel@redhat.com, rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 hamohammed.sa@gmail.com, hdegoede@redhat.com
Subject: [PATCH v3 0/2] Default to cachable mappings for GEM SHMEM
Date: Tue, 17 Nov 2020 14:31:54 +0100
Message-Id: <20201117133156.26822-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, lima@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

By default, SHMEM GEM helpers map pages using writecombine. Only a few
drivers require this setting. Others revert it to default mappings
flags. Some could benefit from caching, but don't care.

Unify the behaviour by switching the SHMEM GEM code to use cached
mappings (i.e., PAGE_KERNEL actually); just like regular shmem memory
does. The 3 drivers that require write combining explicitly select it
during GEM object creation.

The exception is dma-buf imported pages, which are always mapped
using writecombine mode.

v3:
	* fix dereferencing of an uninitialized pointer (Dan, kernel
	  test robot)
v2:
	* recreate patches on top of latest SHMEM helpers
	* update lima, panfrost, v3d (Daniel, Rob)
	* udl has been updated before separately.

Thomas Zimmermann (2):
  drm/shmem-helper: Use cached mappings by default
  drm/shmem-helper: Removed drm_gem_shmem_create_object_cached()

 drivers/gpu/drm/drm_gem_shmem_helper.c  | 40 +++++--------------------
 drivers/gpu/drm/lima/lima_gem.c         |  2 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c   |  1 -
 drivers/gpu/drm/panfrost/panfrost_gem.c |  2 +-
 drivers/gpu/drm/udl/udl_drv.c           |  2 --
 drivers/gpu/drm/v3d/v3d_bo.c            |  2 +-
 drivers/gpu/drm/virtio/virtgpu_object.c |  1 -
 drivers/gpu/drm/vkms/vkms_drv.c         |  1 -
 include/drm/drm_gem_shmem_helper.h      |  7 ++---
 9 files changed, 13 insertions(+), 45 deletions(-)

--
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
