Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86907CD9D8D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 16:49:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB2010E041;
	Tue, 23 Dec 2025 15:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="gvZGSaAm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC1810E041
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 15:49:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3AB574E41D50;
 Tue, 23 Dec 2025 15:49:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0387960716;
 Tue, 23 Dec 2025 15:49:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5A6B610AB0B8A; Tue, 23 Dec 2025 16:49:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766504947; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=qwNYdPNwkNQfvtXRvdd/5N/fyJbUhxz9upsm5xT0pTc=;
 b=gvZGSaAmi8tCoDwVPHBrY+XGFfKGE/Mqyq2gyeowWwxUqSfq91TdWiGhf/0nSN+bdWA4K9
 eIpZu+NkXMBcJXMUPMnvJqhPwehcBXnsPVHIAjs41OsUmxlo54RraaP0m4AUAUGmBSfSqj
 O5EHOwy02DvWvbNI9h7QgNGxcMXyg+dsU+c9+gC0f525LBjDP1GyQJdSEsOOHvvTZTj/3u
 JytOyUCwRb3c+4QxTfiHq91vvXbQLkrqXxpKm9fAzhtdCKmZ0C/nIneDwoL/PzRQLmCguT
 GONpVwbnlZkU0XGt/BM5S3AMqYZEqY9y2SfCvPYj3ah/IrTaXELtYmDEy2otQg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 23 Dec 2025 16:48:49 +0100
Subject: [PATCH] drm/bridge: rename drm_for_each_bridge_in_chain_scoped()
 to drm_for_each_bridge_in_chain()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-drm-bridge-alloc-getput-for_each_bridge-2-v1-1-0362434ae0eb@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAOC5SmkC/y2N0QqDMAwAf0XyvMCasjH3K2NIbKMGnJVUx0D89
 xXx8Ti42yCLqWR4VhuYfDVrmgq4SwVh4KkX1FgY6Eo3R+Qx2gdb01gMj2MK2Msyrwt2yRrhMDS
 nJCTvHsy1b++1QOnNJp3+jtfrve9/RYpr0nsAAAA=
X-Change-ID: 20251223-drm-bridge-alloc-getput-for_each_bridge-2-2318aa93b69e
To: Miguel Ojeda <ojeda@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 llvm@lists.linux.dev, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
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

drm_for_each_bridge_in_chain_scoped() was added in commit e46efc6a7d28
("drm/bridge: add drm_for_each_bridge_in_chain_scoped()") to provide a
safer alternative to drm_for_each_bridge_in_chain().

Following commits converted all users to the _scoped variant.

Finally commit 2f08387a444c ("drm/bridge: remove
drm_for_each_bridge_in_chain()") removed the old
drm_for_each_bridge_in_chain() macro.

It's time to rename drm_for_each_bridge_in_chain_scoped() back to the
original name.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 .clang-format                                  | 2 +-
 drivers/gpu/drm/display/drm_bridge_connector.c | 4 ++--
 drivers/gpu/drm/drm_atomic.c                   | 2 +-
 drivers/gpu/drm/drm_bridge.c                   | 2 +-
 include/drm/drm_bridge.h                       | 5 ++---
 5 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/.clang-format b/.clang-format
index 2ceca764122f..f2b46d275d30 100644
--- a/.clang-format
+++ b/.clang-format
@@ -167,7 +167,7 @@ ForEachMacros:
   - 'drm_connector_for_each_possible_encoder'
   - 'drm_exec_for_each_locked_object'
   - 'drm_exec_for_each_locked_object_reverse'
-  - 'drm_for_each_bridge_in_chain_scoped'
+  - 'drm_for_each_bridge_in_chain'
   - 'drm_for_each_connector_iter'
   - 'drm_for_each_crtc'
   - 'drm_for_each_crtc_reverse'
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index a2d30cf9e06d..925aca7ae84a 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -139,7 +139,7 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 		to_drm_bridge_connector(connector);
 
 	/* Notify all bridges in the pipeline of hotplug events. */
-	drm_for_each_bridge_in_chain_scoped(bridge_connector->encoder, bridge) {
+	drm_for_each_bridge_in_chain(bridge_connector->encoder, bridge) {
 		if (bridge->funcs->hpd_notify)
 			bridge->funcs->hpd_notify(bridge, status);
 	}
@@ -684,7 +684,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	 * detection are available, we don't support hotplug detection at all.
 	 */
 	connector_type = DRM_MODE_CONNECTOR_Unknown;
-	drm_for_each_bridge_in_chain_scoped(encoder, bridge) {
+	drm_for_each_bridge_in_chain(encoder, bridge) {
 		if (!bridge->interlace_allowed)
 			connector->interlace_allowed = false;
 		if (!bridge->ycbcr_420_allowed)
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 52738b80ddbe..5b017d36f293 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1468,7 +1468,7 @@ drm_atomic_add_encoder_bridges(struct drm_atomic_state *state,
 		       "Adding all bridges for [encoder:%d:%s] to %p\n",
 		       encoder->base.id, encoder->name, state);
 
-	drm_for_each_bridge_in_chain_scoped(encoder, bridge) {
+	drm_for_each_bridge_in_chain(encoder, bridge) {
 		/* Skip bridges that don't implement the atomic state hooks. */
 		if (!bridge->funcs->atomic_duplicate_state)
 			continue;
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index db40c26d1cb3..bf39f19bd379 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1582,7 +1582,7 @@ static int encoder_bridges_show(struct seq_file *m, void *data)
 	struct drm_printer p = drm_seq_file_printer(m);
 	unsigned int idx = 0;
 
-	drm_for_each_bridge_in_chain_scoped(encoder, bridge)
+	drm_for_each_bridge_in_chain(encoder, bridge)
 		drm_bridge_debugfs_show_bridge(&p, bridge, idx++, false);
 
 	return 0;
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index d2683846cc61..cdd631582fe7 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1473,8 +1473,7 @@ drm_bridge_get_next_bridge_and_put(struct drm_bridge *bridge)
 }
 
 /**
- * drm_for_each_bridge_in_chain_scoped - iterate over all bridges attached
- *                                       to an encoder
+ * drm_for_each_bridge_in_chain - iterate over all bridges attached to an encoder
  * @encoder: the encoder to iterate bridges on
  * @bridge: a bridge pointer updated to point to the current bridge at each
  *	    iteration
@@ -1484,7 +1483,7 @@ drm_bridge_get_next_bridge_and_put(struct drm_bridge *bridge)
  * Automatically gets/puts the bridge reference while iterating, and puts
  * the reference even if returning or breaking in the middle of the loop.
  */
-#define drm_for_each_bridge_in_chain_scoped(encoder, bridge)		\
+#define drm_for_each_bridge_in_chain(encoder, bridge)			\
 	for (struct drm_bridge *bridge __free(drm_bridge_put) =		\
 	     drm_bridge_chain_get_first_bridge(encoder);		\
 	     bridge;							\

---
base-commit: e05b08d7d0162cf77fff119367fb1a2d5ab3e669
change-id: 20251223-drm-bridge-alloc-getput-for_each_bridge-2-2318aa93b69e

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

