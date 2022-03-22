Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD6C4E46AB
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 20:28:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD8210E30C;
	Tue, 22 Mar 2022 19:27:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B51010E012
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 19:27:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B50431F38C;
 Tue, 22 Mar 2022 19:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1647977266; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bFNJcWDlMqie79VMg7Q7s5h5y8+d/qoKdYPDHY2Y/II=;
 b=FDXVXb376oaZLqCbxem8Qw9DVSluF4DHKXI2dd8vhPFgGE7yDGkpq5BB1OJ7lpRLon0rP9
 bdDyRRMcA+y+EzGJl7M0vHc13Dmh6YumHp+bvwYNwTDzniycWrsJPfmAg0YStETyZdXc82
 mYIXBhrcHp2APIuUQWRg5ytkU6oj/ew=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1647977266;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bFNJcWDlMqie79VMg7Q7s5h5y8+d/qoKdYPDHY2Y/II=;
 b=ztET12W3eE84jlE/VezfAv2j/bhAm0rYYhshGIcmH/mzRvYcah6VfPqLewqfsme15Su2/O
 T8vA3wNG86jWctDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 826E313479;
 Tue, 22 Mar 2022 19:27:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +OfiHjIjOmIZMAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 22 Mar 2022 19:27:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, jani.nikula@linux.intel.com, lyude@redhat.com
Subject: [PATCH 3/8] drm/display: Introduce a DRM display-helper module
Date: Tue, 22 Mar 2022 20:27:38 +0100
Message-Id: <20220322192743.14414-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220322192743.14414-1-tzimmermann@suse.de>
References: <20220322192743.14414-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the DP-helper module with a display-helper module. Update
all related Kconfig and Makefile rules.

Besides the existing code for DisplayPort, the new module will
contain helpers for other video-output standards, such as HDMI.
Drivers will still be able to select the required video-output
helpers. Linking all such code into a single module avoids the
proliferation of small kernel modules.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/Kconfig                                |  7 +++++++
 drivers/gpu/drm/display/Makefile                       |  9 +++++----
 .../{drm_dp_helper_mod.c => drm_display_helper_mod.c}  | 10 +++++-----
 drivers/gpu/drm/display/{drm_dp.c => drm_dp_helper.c}  |  0
 4 files changed, 17 insertions(+), 9 deletions(-)
 rename drivers/gpu/drm/display/{drm_dp_helper_mod.c => drm_display_helper_mod.c} (51%)
 rename drivers/gpu/drm/display/{drm_dp.c => drm_dp_helper.c} (100%)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index f1422bee3dcc..bffcd4d2314b 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -82,9 +82,16 @@ config DRM_DEBUG_SELFTEST
 
 	  If in doubt, say "N".
 
+config DRM_DISPLAY_HELPER
+	tristate
+	depends on DRM
+	help
+	  DRM helpers for display adapters.
+
 config DRM_DP_HELPER
 	tristate
 	depends on DRM
+	select DRM_DISPLAY_HELPER
 	help
 	  DRM helpers for DisplayPort.
 
diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
index 75faffc706b1..90f12e9b4735 100644
--- a/drivers/gpu/drm/display/Makefile
+++ b/drivers/gpu/drm/display/Makefile
@@ -2,8 +2,9 @@
 
 obj-$(CONFIG_DRM_DP_AUX_BUS) += drm_dp_aux_bus.o
 
-drm_dp_helper-y := drm_dp.o drm_dp_dual_mode_helper.o drm_dp_helper_mod.o drm_dp_mst_topology.o
-drm_dp_helper-$(CONFIG_DRM_DP_AUX_CHARDEV) += drm_dp_aux_dev.o
-drm_dp_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o
+drm_display_helper-y := drm_display_helper_mod.o
+drm_display_helper-$(CONFIG_DRM_DP_HELPER) := drm_dp_helper.o drm_dp_dual_mode_helper.o drm_dp_mst_topology.o
+drm_display_helper-$(CONFIG_DRM_DP_AUX_CHARDEV) += drm_dp_aux_dev.o
+drm_display_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o
 
-obj-$(CONFIG_DRM_DP_HELPER) += drm_dp_helper.o
+obj-$(CONFIG_DRM_DISPLAY_HELPER) += drm_display_helper.o
diff --git a/drivers/gpu/drm/display/drm_dp_helper_mod.c b/drivers/gpu/drm/display/drm_display_helper_mod.c
similarity index 51%
rename from drivers/gpu/drm/display/drm_dp_helper_mod.c
rename to drivers/gpu/drm/display/drm_display_helper_mod.c
index db753de24000..d8a6e6228773 100644
--- a/drivers/gpu/drm/display/drm_dp_helper_mod.c
+++ b/drivers/gpu/drm/display/drm_display_helper_mod.c
@@ -4,19 +4,19 @@
 
 #include "drm_dp_helper_internal.h"
 
-MODULE_DESCRIPTION("DRM DisplayPort helper");
+MODULE_DESCRIPTION("DRM display adapter helper");
 MODULE_LICENSE("GPL and additional rights");
 
-static int __init drm_dp_helper_module_init(void)
+static int __init drm_display_helper_module_init(void)
 {
 	return drm_dp_aux_dev_init();
 }
 
-static void __exit drm_dp_helper_module_exit(void)
+static void __exit drm_display_helper_module_exit(void)
 {
 	/* Call exit functions from specific dp helpers here */
 	drm_dp_aux_dev_exit();
 }
 
-module_init(drm_dp_helper_module_init);
-module_exit(drm_dp_helper_module_exit);
+module_init(drm_display_helper_module_init);
+module_exit(drm_display_helper_module_exit);
diff --git a/drivers/gpu/drm/display/drm_dp.c b/drivers/gpu/drm/display/drm_dp_helper.c
similarity index 100%
rename from drivers/gpu/drm/display/drm_dp.c
rename to drivers/gpu/drm/display/drm_dp_helper.c
-- 
2.35.1

