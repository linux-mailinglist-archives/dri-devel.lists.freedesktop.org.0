Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B182F29BE
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 09:10:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63FA16E116;
	Tue, 12 Jan 2021 08:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D7F6E0EA;
 Tue, 12 Jan 2021 08:10:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B7344B721;
 Tue, 12 Jan 2021 08:10:40 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, alexander.deucher@amd.com, christian.koenig@amd.com
Subject: [PATCH 3/6] drm: Build drm_memory.o only for legacy drivers
Date: Tue, 12 Jan 2021 09:10:32 +0100
Message-Id: <20210112081035.6882-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112081035.6882-1-tzimmermann@suse.de>
References: <20210112081035.6882-1-tzimmermann@suse.de>
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

The file contains I/O-memory functions that are only used by legacy
drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/Makefile | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index fefaff4c832d..ba0ecb7756c6 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -5,7 +5,7 @@
 
 drm-y       :=	drm_auth.o drm_cache.o \
 		drm_file.o drm_gem.o drm_ioctl.o drm_irq.o \
-		drm_memory.o drm_drv.o \
+		drm_drv.o \
 		drm_sysfs.o drm_hashtab.o drm_mm.o \
 		drm_crtc.o drm_fourcc.o drm_modes.o drm_edid.o \
 		drm_encoder_slave.o \
@@ -20,7 +20,8 @@ drm-y       :=	drm_auth.o drm_cache.o \
 		drm_client_modeset.o drm_atomic_uapi.o drm_hdcp.o \
 		drm_managed.o drm_vblank_work.o
 
-drm-$(CONFIG_DRM_LEGACY) += drm_legacy_misc.o drm_bufs.o drm_context.o drm_dma.o drm_scatter.o drm_lock.o
+drm-$(CONFIG_DRM_LEGACY) += drm_bufs.o drm_context.o drm_dma.o drm_legacy_misc.o drm_lock.o \
+		drm_memory.o drm_scatter.o
 drm-$(CONFIG_DRM_LIB_RANDOM) += lib/drm_random.o
 drm-$(CONFIG_DRM_VM) += drm_vm.o
 drm-$(CONFIG_COMPAT) += drm_ioc32.o
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
