Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 829EF30FD94
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 21:03:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C0676EE5C;
	Thu,  4 Feb 2021 20:03:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA6846EE5C
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 20:03:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 55052ACB7;
 Thu,  4 Feb 2021 20:03:12 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, hdegoede@redhat.com,
 sean@poorly.run, sam@ravnborg.org, noralf@tronnes.org
Subject: [PATCH 0/6] drm: Move vmap out of commit tail for SHMEM-based drivers
Date: Thu,  4 Feb 2021 21:03:02 +0100
Message-Id: <20210204200308.24216-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Several SHMEM-based drivers use the BO as shadow buffer for the real
framebuffer memory. Damage handling requires a vmap of the BO memory.
But vmap/vunmap can acquire the dma-buf reservation lock, which is not
allowed in commit tails.

This patchset introduces a set of helpers that implement vmap/vunmap
in the plane's prepare_fb and cleanup_fb; and provide the mapping's
address to commit-tail functions. Wrappers for simple KMS are provides,
as all of the involved drivers are built upon simple-KMS helpers.

Patch 1 adds the support for private plane state to the simple-KMS
helper library.

Patch 2 provides plane state for shadow-buffered planes. It's a
DRM plane with BO mappings into kernel address space. The involved
helpers take care of the details. The code is independent from GEM
SHMEM and can be used with other shadow-buffered planes. I put all
this in a new file. In a later patch, drm_gem_fb_prepare_fb() et al
could be moved there as well.

Patches 3 to 6 convert each involved driver to the new helpers. The
vmap operations are being removed from commit-tail functions. An
additional benefit is that vmap errors are now detected before the
commit starts. The original commit-tail functions could not
handle failed vmap operations.

I smoke-tested the code by running fbdev, Xorg and weston with the
converted mgag200 driver.

Thomas Zimmermann (6):
  drm/simple-kms: Add plane-state helpers
  drm: Add additional atomic helpers for shadow-buffered planes
  drm/mgag200: Move vmap out of commit tail
  drm/cirrus: Move vmap out of commit tail
  drm/gm12u320: Move vmap out of commit tail
  drm/udl: Move vmap out of commit tail

 Documentation/gpu/drm-kms-helpers.rst   |  12 ++
 drivers/gpu/drm/Makefile                |   3 +-
 drivers/gpu/drm/drm_gem_atomic_helper.c | 210 ++++++++++++++++++++++++
 drivers/gpu/drm/drm_simple_kms_helper.c |  40 ++++-
 drivers/gpu/drm/mgag200/mgag200_mode.c  |  23 +--
 drivers/gpu/drm/tiny/cirrus.c           |  43 ++---
 drivers/gpu/drm/tiny/gm12u320.c         |  28 ++--
 drivers/gpu/drm/udl/udl_modeset.c       |  34 ++--
 include/drm/drm_gem_atomic_helper.h     |  75 +++++++++
 include/drm/drm_simple_kms_helper.h     |  28 ++++
 10 files changed, 415 insertions(+), 81 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_gem_atomic_helper.c
 create mode 100644 include/drm/drm_gem_atomic_helper.h


base-commit: f9173d6435c6a9bb0b0076ebf9122d876da208ae
prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
prerequisite-patch-id: f8140f08b77c49beb6243d9a2a88ebcc7097e391
prerequisite-patch-id: 6bffaf03d01daeb29a0b0ffbc78b415e72907a17
prerequisite-patch-id: 6386ca949b8b677a7eada2672990dab2f84f734f
prerequisite-patch-id: 706e35d0b2185d2332f725e1c22d8ffed910ea7b
--
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
