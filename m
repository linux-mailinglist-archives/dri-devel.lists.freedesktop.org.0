Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 594B6243482
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 09:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B46706E466;
	Thu, 13 Aug 2020 07:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0270A6E07D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 08:42:09 +0000 (UTC)
Received: from localhost (unknown [192.168.167.209])
 by lucky1.263xmail.com (Postfix) with ESMTP id 1D2F4C0C54;
 Wed, 12 Aug 2020 16:34:15 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED: 0
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [103.29.142.67])
 by smtp.263.net (postfix) whith ESMTP id
 P31771T140662796187392S1597221250509047_; 
 Wed, 12 Aug 2020 16:34:15 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <69b1af1b415bf5000b6580fc378eeefa>
X-RL-SENDER: algea.cao@rock-chips.com
X-SENDER: algea.cao@rock-chips.com
X-LOGIN-NAME: algea.cao@rock-chips.com
X-FST-TO: a.hajda@samsung.com
X-SENDER-IP: 103.29.142.67
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
From: Algea Cao <algea.cao@rock-chips.com>
To: a.hajda@samsung.com, kuankuan.y@gmail.com, hjc@rock-chips.com,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org, sam@ravnborg.org,
 airlied@linux.ie, heiko@sntech.de, jernej.skrabec@siol.net,
 algea.cao@rock-chips.com, Laurent.pinchart@ideasonboard.com,
 laurent.pinchart+renesas@ideasonboard.com, jonas@kwiboo.se,
 mripard@kernel.org, darekm@google.com, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, cychiang@chromium.org,
 linux-kernel@vger.kernel.org, narmstrong@baylibre.com,
 jbrunet@baylibre.com, maarten.lankhorst@linux.intel.com, daniel@ffwll.ch
Subject: [PATCH 1/6] drm: Add connector atomic_begin/atomic_flush
Date: Wed, 12 Aug 2020 16:34:07 +0800
Message-Id: <20200812083407.856-1-algea.cao@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200812083120.743-1-algea.cao@rock-chips.com>
References: <20200812083120.743-1-algea.cao@rock-chips.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 13 Aug 2020 07:12:31 +0000
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

In some situations, connector should get some work done
when plane is updating. Such as when change output color
format, hdmi should send AVMUTE to make screen black before
crtc updating color format, or screen may flash. After color
updating, hdmi should clear AVMUTE bring screen back to normal.

The process is as follows:
AVMUTE -> Update CRTC -> Update HDMI -> Clear AVMUTE

So we introduce connector atomic_begin/atomic_flush.

Signed-off-by: Algea Cao <algea.cao@rock-chips.com>

---

 drivers/gpu/drm/drm_atomic_helper.c      | 46 ++++++++++++++++++++++++
 include/drm/drm_modeset_helper_vtables.h | 19 ++++++++++
 2 files changed, 65 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index f68c69a45752..f4abd700d2c4 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2471,6 +2471,8 @@ void drm_atomic_helper_commit_planes(struct drm_device *dev,
 				     struct drm_atomic_state *old_state,
 				     uint32_t flags)
 {
+	struct drm_connector *connector;
+	struct drm_connector_state *old_connector_state, *new_connector_state;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	struct drm_plane *plane;
@@ -2479,6 +2481,28 @@ void drm_atomic_helper_commit_planes(struct drm_device *dev,
 	bool active_only = flags & DRM_PLANE_COMMIT_ACTIVE_ONLY;
 	bool no_disable = flags & DRM_PLANE_COMMIT_NO_DISABLE_AFTER_MODESET;
 
+	for_each_oldnew_connector_in_state(old_state, connector,
+					   old_connector_state,
+					   new_connector_state, i) {
+		const struct drm_connector_helper_funcs *funcs;
+
+		if (!connector->state->crtc)
+			continue;
+
+		if (!connector->state->crtc->state->active)
+			continue;
+
+		funcs = connector->helper_private;
+
+		if (!funcs || !funcs->atomic_begin)
+			continue;
+
+		DRM_DEBUG_ATOMIC("flush beginning [CONNECTOR:%d:%s]\n",
+				 connector->base.id, connector->name);
+
+		funcs->atomic_begin(connector, old_connector_state);
+	}
+
 	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
 		const struct drm_crtc_helper_funcs *funcs;
 
@@ -2550,6 +2574,28 @@ void drm_atomic_helper_commit_planes(struct drm_device *dev,
 
 		funcs->atomic_flush(crtc, old_crtc_state);
 	}
+
+	for_each_oldnew_connector_in_state(old_state, connector,
+					   old_connector_state,
+					   new_connector_state, i) {
+		const struct drm_connector_helper_funcs *funcs;
+
+		if (!connector->state->crtc)
+			continue;
+
+		if (!connector->state->crtc->state->active)
+			continue;
+
+		funcs = connector->helper_private;
+
+		if (!funcs || !funcs->atomic_flush)
+			continue;
+
+		DRM_DEBUG_ATOMIC("flushing [CONNECTOR:%d:%s]\n",
+				 connector->base.id, connector->name);
+
+		funcs->atomic_flush(connector, old_connector_state);
+	}
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_planes);
 
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index 421a30f08463..10f3f2e2fe28 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -1075,6 +1075,25 @@ struct drm_connector_helper_funcs {
 	void (*atomic_commit)(struct drm_connector *connector,
 			      struct drm_connector_state *state);
 
+	/**
+	 * @atomic_begin:
+	 *
+	 * flush atomic update
+	 *
+	 * This callback is used by the atomic modeset helpers but it is optional.
+	 */
+	void (*atomic_begin)(struct drm_connector *connector,
+			     struct drm_connector_state *state);
+
+	/**
+	 * @atomic_begin:
+	 *
+	 * begin atomic update
+	 *
+	 * This callback is used by the atomic modeset helpers but it is optional.
+	 */
+	void (*atomic_flush)(struct drm_connector *connector,
+			     struct drm_connector_state *state);
 	/**
 	 * @prepare_writeback_job:
 	 *
-- 
2.25.1



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
