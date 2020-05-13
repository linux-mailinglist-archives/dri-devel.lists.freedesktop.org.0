Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F25E1D1894
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 17:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC696EA0B;
	Wed, 13 May 2020 15:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA066E226
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 15:03:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 51EEDAF37;
 Wed, 13 May 2020 15:03:17 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, sean@poorly.run, kraxel@redhat.com,
 emil.l.velikov@gmail.com, sam@ravnborg.org
Subject: [PATCH 0/2] Default to cachable mappings for GEM SHMEM
Date: Wed, 13 May 2020 17:03:10 +0200
Message-Id: <20200513150312.21421-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.2
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset complements Daniel's recent patches for SHMEM. [1]

By default SHMEM maps pages using writecombine. Only virtio sets the
SHMEM implmentation to use cached mappings. Udl implements its own
vmap/mmap functions, which always maps pages with caching.

Unify the settings by switching the SHMEM code to use cached mappings
(i.e., PAGE_KERNEL actually). The exception is dma-buf imported pages,
which are still mapped using writecombine.

Tested with udl-driven hardware.

[1] https://lists.freedesktop.org/archives/dri-devel/2020-May/265468.html

Thomas Zimmermann (2):
  drm/shmem: Use cached mappings by default
  drm/udl: Use GEM vmap/mmap function from SHMEM helpers

 drivers/gpu/drm/drm_gem_shmem_helper.c  |   6 +-
 drivers/gpu/drm/udl/Makefile            |   2 +-
 drivers/gpu/drm/udl/udl_drv.c           |   3 -
 drivers/gpu/drm/udl/udl_drv.h           |   3 -
 drivers/gpu/drm/udl/udl_gem.c           | 106 ------------------------
 drivers/gpu/drm/virtio/virtgpu_object.c |   1 -
 include/drm/drm_gem_shmem_helper.h      |   4 +-
 7 files changed, 7 insertions(+), 118 deletions(-)
 delete mode 100644 drivers/gpu/drm/udl/udl_gem.c

--
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
