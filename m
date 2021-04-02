Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BF4352A5E
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 13:49:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995866E152;
	Fri,  2 Apr 2021 11:49:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1531 seconds by postgrey-1.36 at gabe;
 Fri, 02 Apr 2021 11:49:25 UTC
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC596E152
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 11:49:24 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 2B485C9587
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 11:22:38 +0000 (UTC)
X-Originating-IP: 86.238.178.59
Received: from haruko.lan (lfbn-idf2-1-947-59.w86-238.abo.wanadoo.fr
 [86.238.178.59]) (Authenticated sender: schroder@emersion.fr)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 66D682000B;
 Fri,  2 Apr 2021 11:22:14 +0000 (UTC)
From: Simon Ser <contact@emersion.fr>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/connector: demote connector force-probes for non-master
 clients
Date: Fri,  2 Apr 2021 13:22:12 +0200
Message-Id: <20210402112212.5625-1-contact@emersion.fr>
X-Mailer: git-send-email 2.31.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Force-probing a connector can be slow and cause flickering. As this
affects the global KMS state, let's make it so only the DRM master
can force-probe a connector.

Non-master DRM clients won't be able to force-probe a connector
anymore. Instead, KMS will perform a regular read-only connector
query.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
---
 drivers/gpu/drm/drm_connector.c | 11 ++++++++---
 include/uapi/drm/drm_mode.h     |  7 ++++---
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 7631f76e7f34..2f70a52a892b 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -20,6 +20,7 @@
  * OF THIS SOFTWARE.
  */
 
+#include <drm/drm_auth.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
@@ -2374,9 +2375,13 @@ int drm_mode_getconnector(struct drm_device *dev, void *data,
 
 	mutex_lock(&dev->mode_config.mutex);
 	if (out_resp->count_modes == 0) {
-		connector->funcs->fill_modes(connector,
-					     dev->mode_config.max_width,
-					     dev->mode_config.max_height);
+		if (drm_is_current_master(file_priv))
+			connector->funcs->fill_modes(connector,
+						     dev->mode_config.max_width,
+						     dev->mode_config.max_height);
+		else
+			drm_dbg_kms(dev, "User-space requested a forced probe on [CONNECTOR:%d:%s] but is not the DRM master, demoting to read-only probe",
+				    connector->base.id, connector->name);
 	}
 
 	out_resp->mm_width = connector->display_info.width_mm;
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index a5e76aa06ad5..3efa2e38d89b 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -413,9 +413,10 @@ enum drm_mode_subconnector {
  *
  * **Force-probing a connector**
  *
- * If the @count_modes field is set to zero, the kernel will perform a forced
- * probe on the connector to refresh the connector status, modes and EDID.
- * A forced-probe can be slow, might cause flickering and the ioctl will block.
+ * If the @count_modes field is set to zero and the DRM client is the DRM
+ * master, the kernel will perform a forced probe on the connector to refresh
+ * the connector status, modes and EDID. A forced-probe can be slow, might
+ * cause flickering and the ioctl will block.
  *
  * User-space needs to force-probe connectors to ensure their metadata is
  * up-to-date at startup and after receiving a hot-plug event. User-space
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
