Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AC988B0ED
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 21:09:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABF0110E5FA;
	Mon, 25 Mar 2024 20:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F8410E2ED
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 20:09:03 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7C61E37253;
 Mon, 25 Mar 2024 20:09:02 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 2D83D13A71;
 Mon, 25 Mar 2024 20:09:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id OD3bCd7ZAWaVcAAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 25 Mar 2024 20:09:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, sui.jingfeng@linux.dev,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v6 13/13] drm/ast: Automatically clean up poll helper
Date: Mon, 25 Mar 2024 21:06:58 +0100
Message-ID: <20240325200855.21150-14-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325200855.21150-1-tzimmermann@suse.de>
References: <20240325200855.21150-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	none
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 7C61E37253
X-Spam-Flag: NO
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Automatically clean up the conncetor-poll thread as part of the DRM
device release. The new helper drmm_kms_helper_poll_init() provides
a shared implementation for all drivers.

v6:
- fix kernel doc comment (Sui, kernel test robot)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/ast/ast_mode.c     |  4 +++-
 drivers/gpu/drm/drm_probe_helper.c | 27 +++++++++++++++++++++++++++
 include/drm/drm_probe_helper.h     |  2 ++
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index b4e1c812520cc..bb9b66aba9ee9 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1905,7 +1905,9 @@ int ast_mode_config_init(struct ast_device *ast)
 
 	drm_mode_config_reset(dev);
 
-	drm_kms_helper_poll_init(dev);
+	ret = drmm_kms_helper_poll_init(dev);
+	if (ret)
+		return ret;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 6223629b000db..90b04d370a5a5 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -37,6 +37,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
@@ -944,6 +945,32 @@ void drm_kms_helper_poll_fini(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_kms_helper_poll_fini);
 
+static void drm_kms_helper_poll_init_release(struct drm_device *dev, void *res)
+{
+	drm_kms_helper_poll_fini(dev);
+}
+
+/**
+ * drmm_kms_helper_poll_init - initialize and enable output polling
+ * @dev: drm_device
+ *
+ * This function initializes and then also enables output polling support for
+ * @dev similar to drm_kms_helper_poll_init(). Polling will automatically be
+ * cleaned up when the DRM device goes away.
+ *
+ * See drm_kms_helper_poll_init() for more information.
+ *
+ * Returns:
+ * 0 on success, or a negative errno code otherwise.
+ */
+int drmm_kms_helper_poll_init(struct drm_device *dev)
+{
+	drm_kms_helper_poll_init(dev);
+
+	return drmm_add_action_or_reset(dev, drm_kms_helper_poll_init_release, dev);
+}
+EXPORT_SYMBOL(drmm_kms_helper_poll_init);
+
 static bool check_connector_changed(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
diff --git a/include/drm/drm_probe_helper.h b/include/drm/drm_probe_helper.h
index e9dc32433631b..d6ce7b218b774 100644
--- a/include/drm/drm_probe_helper.h
+++ b/include/drm/drm_probe_helper.h
@@ -16,6 +16,8 @@ int drm_helper_probe_single_connector_modes(struct drm_connector
 int drm_helper_probe_detect(struct drm_connector *connector,
 			    struct drm_modeset_acquire_ctx *ctx,
 			    bool force);
+
+int drmm_kms_helper_poll_init(struct drm_device *dev);
 void drm_kms_helper_poll_init(struct drm_device *dev);
 void drm_kms_helper_poll_fini(struct drm_device *dev);
 bool drm_helper_hpd_irq_event(struct drm_device *dev);
-- 
2.44.0

