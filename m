Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PfIFNeWmGlaJwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 18:16:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF9C169A59
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 18:16:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F49610E83B;
	Fri, 20 Feb 2026 17:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MTA-13-4.privateemail.com (mta-13-4.privateemail.com
 [198.54.127.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB4E10E83B;
 Fri, 20 Feb 2026 17:16:03 +0000 (UTC)
Received: from mta-13.privateemail.com (localhost [127.0.0.1])
 by mta-13.privateemail.com (Postfix) with ESMTP id 4fHcN20Dmlz3hhTD;
 Fri, 20 Feb 2026 12:16:02 -0500 (EST)
Received: from localhost.localdomain
 (bras-base-toroon4332w-grc-26-174-91-51-28.dsl.bell.ca [174.91.51.28])
 by mta-13.privateemail.com (Postfix) with ESMTPA;
 Fri, 20 Feb 2026 12:15:35 -0500 (EST)
From: Hamza Mahfooz <someguy@effective-light.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Hamza Mahfooz <someguy@effective-light.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Alex Hung <alex.hung@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Ivan Lipski <ivan.lipski@amd.com>,
 Dominik Kaszewski <dominik.kaszewski@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] drm: introduce KMS recovery mechanism
Date: Fri, 20 Feb 2026 12:15:12 -0500
Message-ID: <20260220171518.711594-1-someguy@effective-light.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[effective-light.com];
	FREEMAIL_CC(0.00)[mailbox.org,amd.com,effective-light.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[someguy@effective-light.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[dri-devel];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,effective-light.com:mid,effective-light.com:email]
X-Rspamd-Queue-Id: AAF9C169A59
X-Rspamd-Action: no action

There should be a mechanism for drivers to respond to flip_done
timeouts. Since, as it stands it is possible for the display to stall
indefinitely, necessitating a hard reset. So, introduce a new mechanism
that tries various methods of recovery with increasing aggression, in
the following order:

1. Force a full modeset (have the compositor reprogram the state from
   scratch).
2. As a last resort, have the driver attempt a vendor specific reset
   (which they can do by reading the return value of
   drm_atomic_helper_wait_for_flip_done()).

Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
---
v2: new to the series
v3: get rid of page_flip_timeout() and have
    drm_atomic_helper_wait_for_flip_done() return a error.
v4: get rid of nested ret variable.
---
 drivers/gpu/drm/drm_atomic_helper.c | 47 ++++++++++++++++++++++++-----
 include/drm/drm_atomic_helper.h     |  4 +--
 include/drm/drm_device.h            | 24 +++++++++++++++
 3 files changed, 66 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 5840e9cc6f66..d905eb166225 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -42,6 +42,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_panic.h>
 #include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
 #include <drm/drm_self_refresh_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_writeback.h>
@@ -1864,30 +1865,62 @@ EXPORT_SYMBOL(drm_atomic_helper_wait_for_vblanks);
  *
  * This requires that drivers use the nonblocking commit tracking support
  * initialized using drm_atomic_helper_setup_commit().
+ *
+ * Returns:
+ * -ETIMEDOUT to indicate that drivers can attempt a vendor reset, 0 otherwise.
  */
-void drm_atomic_helper_wait_for_flip_done(struct drm_device *dev,
-					  struct drm_atomic_state *state)
+int drm_atomic_helper_wait_for_flip_done(struct drm_device *dev,
+					 struct drm_atomic_state *state)
 {
 	struct drm_crtc *crtc;
+	int ret = 0;
 	int i;
 
 	for (i = 0; i < dev->mode_config.num_crtc; i++) {
 		struct drm_crtc_commit *commit = state->crtcs[i].commit;
-		int ret;
 
 		crtc = state->crtcs[i].ptr;
 
 		if (!crtc || !commit)
 			continue;
 
-		ret = wait_for_completion_timeout(&commit->flip_done, 10 * HZ);
-		if (ret == 0)
-			drm_err(dev, "[CRTC:%d:%s] flip_done timed out\n",
-				crtc->base.id, crtc->name);
+		if (!wait_for_completion_timeout(&commit->flip_done, 10 * HZ)) {
+			switch (dev->reset_phase) {
+			case DRM_KMS_RESET_NONE:
+				drm_err(dev, "[CRTC:%d:%s] flip_done timed out\n",
+					crtc->base.id, crtc->name);
+				dev->reset_phase = DRM_KMS_RESET_FORCE_MODESET;
+				drm_kms_helper_hotplug_event(dev);
+				break;
+			case DRM_KMS_RESET_FORCE_MODESET:
+				drm_err(dev, "[CRTC:%d:%s] force full modeset failed\n",
+					crtc->base.id, crtc->name);
+				dev->reset_phase = DRM_KMS_RESET_VENDOR;
+				ret = -ETIMEDOUT;
+				break;
+			case DRM_KMS_RESET_VENDOR:
+				drm_err(dev, "[CRTC:%d:%s] KMS recovery failed!\n",
+					crtc->base.id, crtc->name);
+				dev->reset_phase = DRM_KMS_RESET_GIVE_UP;
+				break;
+			default:
+				break;
+			}
+
+			goto exit;
+		}
+	}
+
+	if (dev->reset_phase) {
+		drm_info(dev, "KMS recovery succeeded!\n");
+		dev->reset_phase = DRM_KMS_RESET_NONE;
 	}
 
+exit:
 	if (state->fake_commit)
 		complete_all(&state->fake_commit->flip_done);
+
+	return ret;
 }
 EXPORT_SYMBOL(drm_atomic_helper_wait_for_flip_done);
 
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 53382fe93537..298c8dff3993 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -79,8 +79,8 @@ int drm_atomic_helper_wait_for_fences(struct drm_device *dev,
 void drm_atomic_helper_wait_for_vblanks(struct drm_device *dev,
 					struct drm_atomic_state *old_state);
 
-void drm_atomic_helper_wait_for_flip_done(struct drm_device *dev,
-					  struct drm_atomic_state *old_state);
+int drm_atomic_helper_wait_for_flip_done(struct drm_device *dev,
+					 struct drm_atomic_state *old_state);
 
 void
 drm_atomic_helper_update_legacy_modeset_state(struct drm_device *dev,
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index bc78fb77cc27..1244d7527e7b 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -66,6 +66,23 @@ enum switch_power_state {
 	DRM_SWITCH_POWER_DYNAMIC_OFF = 3,
 };
 
+/**
+ * enum drm_kms_reset_phase - reset phase of drm device
+ */
+enum drm_kms_reset_phase {
+	/** @DRM_KMS_RESET_NONE: Not currently attempting recovery */
+	DRM_KMS_RESET_NONE,
+
+	/** @DRM_KMS_RESET_FORCE_MODESET: Force a full modeset */
+	DRM_KMS_RESET_FORCE_MODESET,
+
+	/** @DRM_KMS_RESET_VENDOR: Attempt a vendor reset */
+	DRM_KMS_RESET_VENDOR,
+
+	/** @DRM_KMS_RESET_GIVE_UP: All recovery methods failed */
+	DRM_KMS_RESET_GIVE_UP,
+};
+
 /**
  * struct drm_device - DRM device structure
  *
@@ -375,6 +392,13 @@ struct drm_device {
 	 * Root directory for debugfs files.
 	 */
 	struct dentry *debugfs_root;
+
+	/**
+	 * @reset_phase:
+	 *
+	 * Reset phase that the device is in.
+	 */
+	enum drm_kms_reset_phase reset_phase;
 };
 
 void drm_dev_set_dma_dev(struct drm_device *dev, struct device *dma_dev);
-- 
2.53.0

