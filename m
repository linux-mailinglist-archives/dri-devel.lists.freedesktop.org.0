Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2586231F77
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 15:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F5E96E504;
	Wed, 29 Jul 2020 13:41:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75626E504
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 13:41:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 03F4DABE2;
 Wed, 29 Jul 2020 13:42:04 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, kraxel@redhat.com,
 b.zolnierkie@samsung.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, jani.nikula@intel.com, peda@axentia.se,
 dan.carpenter@oracle.com, natechancellor@gmail.com
Subject: [RFC][PATCH 0/5] Support GEM object mappings from I/O memory
Date: Wed, 29 Jul 2020 15:41:43 +0200
Message-Id: <20200729134148.6855-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM's fbdev console uses regular load and store operations to update
framebuffer memory. The bochs driver on sparc64 requires the use of
I/O-specific load and store operations. We have a workaround, but need
a long-term sulotion tothe problem.

This patchset adds a GEM object function that returns framebuffers as
I/O memory. It further updates fbdev to use the new functionality and
implements vmap_iomem for VRAM helpers.

This is an RFC patchset to discuss the approach. It still needs testing
and polish. Patch #4 has to be rebased onto the recent workaround.

Thomas Zimmermann (5):
  fbdev: Remove trailing whitespace
  fbdev/core: Export framebuffer read and write code as cfb_ function
  drm: Add infrastructure for vmap operations of I/O memory
  drm/fb_helper: Use I/O-memory mappings if available
  drm/vram_helper: Implement struct drm_gem_object_funcs.vmap_iomem

 drivers/gpu/drm/ast/ast_cursor.c      |  12 ++-
 drivers/gpu/drm/drm_client.c          |  52 +++++++++-
 drivers/gpu/drm/drm_fb_helper.c       | 132 ++++++++++++++++++++++----
 drivers/gpu/drm/drm_gem.c             |  19 ++++
 drivers/gpu/drm/drm_gem_vram_helper.c | 106 +++++++++++++++++++--
 drivers/gpu/drm/drm_internal.h        |   1 +
 drivers/video/fbdev/core/fbmem.c      |  61 ++++++++----
 include/drm/drm_client.h              |   8 +-
 include/drm/drm_gem.h                 |  17 +++-
 include/drm/drm_gem_vram_helper.h     |   1 +
 include/linux/fb.h                    |  23 +++--
 11 files changed, 369 insertions(+), 63 deletions(-)

--
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
