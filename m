Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3630B5935F2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 20:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12EA2D20AF;
	Mon, 15 Aug 2022 18:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1B9D2499
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 18:58:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 37B92B81082;
 Mon, 15 Aug 2022 18:58:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68762C433C1;
 Mon, 15 Aug 2022 18:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1660589882;
 bh=VZdlmM1yI6DDiCaE7reYOZ8qKqKYhTpxSZQNW8mwYrA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=msGIP1HDYk5KxLDjeDYGm0Gcx986g/CmOgNmmDjEnqOqiWJ3xR9EYcAFsjmDXaqzS
 T4ErQ9dHYoFbzdvfSLHK9wL5TsWG0HYl/UhYQhJPJ4aCPJbOH5OKxtePBVWhSCp0ax
 2RM2v36czVcDkWPBBU6iomT6U/GxkPWDUJlKqVkM=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.18 0079/1095] drm/hyperv-drm: Include framebuffer and EDID
 headers
Date: Mon, 15 Aug 2022 19:51:18 +0200
Message-Id: <20220815180432.787310852@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220815180429.240518113@linuxfoundation.org>
References: <20220815180429.240518113@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-hyperv@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Deepak Rawat <drawat.floss@gmail.com>,
 stable@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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


