Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E574D30DAA3
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 14:10:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502196EAA8;
	Wed,  3 Feb 2021 13:10:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402B06EAA3
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 13:10:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CDC39AD57;
 Wed,  3 Feb 2021 13:10:48 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, hdegoede@redhat.com,
 sean@poorly.run, sam@ravnborg.org, noralf@tronnes.org
Subject: [PATCH 0/6 RFC] drm: Move vmap out of commit tail for SHMEM drivers
Date: Wed,  3 Feb 2021 14:10:40 +0100
Message-Id: <20210203131046.22371-1-tzimmermann@suse.de>
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
Vmap/vunmap can acquire the dma-buf reservation lock, which is not
allowed in commit tails.

This patchset introduces a set of helpers that implement vmap/vunmap
in the plane's prepare_fb and cleanup_fb; and provide the mapping's
address to commit-tail functions. Wrapper sfor simple KMS are provides,
as all of the involved drivers are built upon simple-KMS helpers.

Patch 1 adds the support for private plane state to the simple-KMS
helper library.

Patch 2 provides plane state for SHMEM-based shadow planes. It's a
DRM plane with BO mappings into kernel address space. The involved
helpers take care of the details.

Patches 3 to 6 convert each involved driver to the new shadow-plane
helpers. The vmap operations are being removed from commit-tail
functions. An additional benefit is that vmap errors are now detected
before the commit starts. The original commit-tail functions could not
handle failed vmap operations.

I smoke-tested the code by running fbdev, Xorg and weston with the
converted mgag200 driver.

Thomas Zimmermann (6):
  drm/simple-kms: Add plane-state helpers
  drm/shmem-helper: Add additional KMS helpers
  drm/mgag200: Move vmap out of commit tail
  drm/cirrus: Move vmap out of commit tail
  drm/gm12u320: Move vmap out of commit tail
  drm/udl: Move vmap out of commit tail

 drivers/gpu/drm/Kconfig                    |   7 +
 drivers/gpu/drm/Makefile                   |   1 +
 drivers/gpu/drm/drm_gem_shmem_kms_helper.c | 159 +++++++++++++++++++++
 drivers/gpu/drm/drm_simple_kms_helper.c    |  40 +++++-
 drivers/gpu/drm/mgag200/Kconfig            |   1 +
 drivers/gpu/drm/mgag200/mgag200_mode.c     |  25 ++--
 drivers/gpu/drm/tiny/Kconfig               |   6 +-
 drivers/gpu/drm/tiny/cirrus.c              |  45 +++---
 drivers/gpu/drm/tiny/gm12u320.c            |  30 ++--
 drivers/gpu/drm/udl/Kconfig                |   1 +
 drivers/gpu/drm/udl/udl_modeset.c          |  36 ++---
 include/drm/drm_gem_shmem_kms_helper.h     |  56 ++++++++
 include/drm/drm_simple_kms_helper.h        |  28 ++++
 13 files changed, 353 insertions(+), 82 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_gem_shmem_kms_helper.c
 create mode 100644 include/drm/drm_gem_shmem_kms_helper.h


base-commit: 1e37c3960fd3910f3f65cd6927a6ebab8e8efc26
--
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
