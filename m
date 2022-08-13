Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 894D5591A6F
	for <lists+dri-devel@lfdr.de>; Sat, 13 Aug 2022 14:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17BB5B9D53;
	Sat, 13 Aug 2022 12:59:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5BB5B9D86
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Aug 2022 12:58:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 21B8960DC5;
 Sat, 13 Aug 2022 12:58:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CF5DC433D6;
 Sat, 13 Aug 2022 12:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1660395529;
 bh=5NyHQzKOCtGwkuR/g7cMMRpvWdI7KBgCgYJChVpKhtw=;
 h=Subject:To:Cc:From:Date:From;
 b=whf3/c+2O2Iz1XXROFoLwRLTCVIrYrQslSXpSP69uTelDAeMjfK91x91SBqgIuPzD
 /GizedibSxpWYwYHmIUxb+S5eBwSwLcXZcc2auB7Hl+AZPHirYeeBVukUnsR5lLVRL
 T2EXj9ZMchB/zh9yIXhZSXxnHFERvtgXRNf4DKwM=
Subject: Patch "drm/hyperv-drm: Include framebuffer and EDID headers" has been
 added to the 5.18-stable tree
To: drawat.floss@gmail.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, maarten.lankhorst@linux.intel.com,
 maxime@cerno.tech, mripard@kernel.org, tzimmermann@suse.de,
 ville.syrjala@linux.intel.com
From: <gregkh@linuxfoundation.org>
Date: Sat, 13 Aug 2022 14:57:22 +0200
Message-ID: <1660395442249150@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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
Cc: stable-commits@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm/hyperv-drm: Include framebuffer and EDID headers

to the 5.18-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-hyperv-drm-include-framebuffer-and-edid-headers.patch
and it can be found in the queue-5.18 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 009a3a52791f31c57d755a73f6bc66fbdd8bd76c Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Wed, 22 Jun 2022 10:34:13 +0200
Subject: drm/hyperv-drm: Include framebuffer and EDID headers
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Thomas Zimmermann <tzimmermann@suse.de>

commit 009a3a52791f31c57d755a73f6bc66fbdd8bd76c upstream.

Fix a number of compile errors by including the correct header
files. Examples are shown below.

  ../drivers/gpu/drm/hyperv/hyperv_drm_modeset.c: In function 'hyperv_blit_to_vram_rect':
  ../drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:25:48: error: invalid use of undefined type 'struct drm_framebuffer'
   25 |         struct hyperv_drm_device *hv = to_hv(fb->dev);
      |                                                ^~

  ../drivers/gpu/drm/hyperv/hyperv_drm_modeset.c: In function 'hyperv_connector_get_modes':
  ../drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:59:17: error: implicit declaration of function 'drm_add_modes_noedid' [-Werror=implicit-function-declaration]
   59 |         count = drm_add_modes_noedid(connector,
      |                 ^~~~~~~~~~~~~~~~~~~~

  ../drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:62:9: error: implicit declaration of function 'drm_set_preferred_mode'; did you mean 'drm_mm_reserve_node'? [-Werror=implicit-function-declaration]
   62 |         drm_set_preferred_mode(connector, hv->preferred_width,
      |         ^~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 76c56a5affeb ("drm/hyperv: Add DRM driver for hyperv synthetic video device")
Fixes: 720cf96d8fec ("drm: Drop drm_framebuffer.h from drm_crtc.h")
Fixes: 255490f9150d ("drm: Drop drm_edid.h from drm_crtc.h")
Cc: Deepak Rawat <drawat.floss@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: linux-hyperv@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.14+
Acked-by: Maxime Ripard <maxime@cerno.tech>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20220622083413.12573-1-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c |    2 ++
 1 file changed, 2 insertions(+)

--- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
@@ -7,9 +7,11 @@
 
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_format_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>


Patches currently in stable-queue which might be from tzimmermann@suse.de are

queue-5.18/drm-hyperv-drm-include-framebuffer-and-edid-headers.patch
