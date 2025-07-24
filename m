Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92066B1100D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 18:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F58310E988;
	Thu, 24 Jul 2025 16:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=daenzer.net header.i=@daenzer.net header.b="DE1M8oZW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms7.webland.ch (ms7.webland.ch [92.43.217.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 797F610E988;
 Thu, 24 Jul 2025 16:58:52 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; t=1753375955; x=1753980755; s=webland;
 d=daenzer.net; c=relaxed/relaxed; v=1;
 bh=UQabIqJXTsg+5a5UcdCC4OgyxYV/HkxtSQ+bSLyB3yU=;
 h=From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References;
 b=DE1M8oZW9CD5EKkwIBOKoWL7pewwp7ty6Tmm57jgXQuaXVhFUz24/A+CqFZ6VLJaCuEpZ0XgweGoPzJoSntyQg/eL/0SDCl/i7sdvMIRT/cqnRqTLcTeka/62KCHjxnxPe7dm0Pjmm1H5TORjBintuYsVrBJLt4s4IuSiyYI0GewIDn0JyPiSZaeCBxZCOkBmA7LMb9z+HwjDwyFetXag1AxyTSm3sUe9ldzgPlWjHk52so8cQR0A+2xhrF55gLDpiMcxespDglDjG30RSZdsqvliVvvLiA6fmLhTqjDk0LG6Cm70L0PpPZZtHfHgGirFlESr+6zYuEoKharrDiC9w==
Received: from kaveri ([213.144.156.170])
 by ms7.webland.ch (12.3.0 build 2 x64) with ASMTP (SSL) id
 01202507241852340798; Thu, 24 Jul 2025 18:52:34 +0200
Received: from daenzer by kaveri with local (Exim 4.98.2)
 (envelope-from <michel@daenzer.net>) id 1uezBI-00000004zM2-2LK8;
 Thu, 24 Jul 2025 18:52:32 +0200
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Hung <alex.hung@amd.com>, Shankar@kaveri.local,
 Uma <uma.shankar@intel.com>, Xaver Hugl <xaver.hugl@kde.org>,
 victoria@system76.com, David Turner <david.turner@raspberrypi.com>
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/kms: Send event when atomic commit HW programming is
 done
Date: Thu, 24 Jul 2025 18:40:29 +0200
Message-ID: <20250724165220.1189129-3-michel@daenzer.net>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250724165220.1189129-1-michel@daenzer.net>
References: <20250724165220.1189129-1-michel@daenzer.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michel Dänzer <mdaenzer@redhat.com>

Also add DRM_CAP_ATOMIC_HW_DONE_EVENT to let user space know it can
use the DRM_MODE_ATOMIC_HW_DONE_EVENT flag.

Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
---
 drivers/gpu/drm/drm_atomic.c        |  1 +
 drivers/gpu/drm/drm_atomic_helper.c | 23 ++++++++++++++++++
 drivers/gpu/drm/drm_atomic_uapi.c   | 37 +++++++++++++++++++++++++++--
 drivers/gpu/drm/drm_ioctl.c         |  3 +++
 include/drm/drm_atomic.h            | 22 +++++++++++++++++
 include/uapi/drm/drm_mode.h         |  3 ++-
 6 files changed, 86 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 0138cf0b8b63..159894381a45 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -108,6 +108,7 @@ void drm_atomic_state_default_release(struct drm_atomic_state *state)
 	kfree(state->crtcs);
 	kfree(state->planes);
 	kfree(state->private_objs);
+	kfree(state->hw_done_event);
 }
 EXPORT_SYMBOL(drm_atomic_state_default_release);
 
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index ee64ca1b1bec..e55edc42a317 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2511,6 +2511,27 @@ void drm_atomic_helper_fake_vblank(struct drm_atomic_state *state)
 }
 EXPORT_SYMBOL(drm_atomic_helper_fake_vblank);
 
+static void send_hw_done_event(struct drm_device *dev,
+			       struct drm_pending_atomic_hw_done_event **e,
+			       ktime_t done)
+{
+	struct timespec64 tv;
+	unsigned long irqflags;
+
+	if (!*e)
+		return;
+
+	tv = ktime_to_timespec64(done);
+	(*e)->event.tv_sec = tv.tv_sec;
+	(*e)->event.tv_usec = tv.tv_nsec / 1000;
+
+	spin_lock_irqsave(&dev->event_lock, irqflags);
+	drm_send_event_timestamp_locked(dev, &(*e)->base, done);
+	spin_unlock_irqrestore(&dev->event_lock, irqflags);
+
+	*e = NULL;
+}
+
 /**
  * drm_atomic_helper_commit_hw_done - setup possible nonblocking commit
  * @state: atomic state object being committed
@@ -2533,6 +2554,8 @@ void drm_atomic_helper_commit_hw_done(struct drm_atomic_state *state)
 	struct drm_crtc_commit *commit;
 	int i;
 
+	send_hw_done_event(state->dev, &state->hw_done_event, ktime_get());
+
 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
 		commit = new_crtc_state->commit;
 		if (!commit)
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index c2726af6698e..43c16bfe65a9 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -939,6 +939,21 @@ static struct drm_pending_vblank_event *create_vblank_event(
 	return e;
 }
 
+static struct drm_pending_atomic_hw_done_event *create_hw_done_event(uint64_t user_data)
+{
+	struct drm_pending_atomic_hw_done_event *e = NULL;
+
+	e = kzalloc(sizeof *e, GFP_KERNEL);
+	if (!e)
+		return NULL;
+
+	e->event.base.type = DRM_EVENT_ATOMIC_HW_DONE;
+	e->event.base.length = sizeof(e->event);
+	e->event.user_data = user_data;
+
+	return e;
+}
+
 int drm_atomic_connector_commit_dpms(struct drm_atomic_state *state,
 				     struct drm_connector *connector,
 				     int mode)
@@ -1314,6 +1329,24 @@ static int prepare_signaling(struct drm_device *dev,
 		return -EINVAL;
 	}
 
+	if (arg->flags & DRM_MODE_ATOMIC_HW_DONE_EVENT &&
+	    file_priv) {
+		struct drm_pending_atomic_hw_done_event *e;
+
+		e = create_hw_done_event(arg->user_data);
+		if (!e)
+			return -ENOMEM;
+
+		ret = drm_event_reserve_init(dev, file_priv, &e->base,
+					     &e->event.base);
+		if (ret) {
+			kfree(e);
+			return ret;
+		}
+
+		state->hw_done_event = e;
+	}
+
 	return 0;
 }
 
@@ -1431,9 +1464,9 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 
 	/* can't test and expect an event at the same time. */
 	if ((arg->flags & DRM_MODE_ATOMIC_TEST_ONLY) &&
-			(arg->flags & DRM_MODE_PAGE_FLIP_EVENT)) {
+	    (arg->flags & (DRM_MODE_PAGE_FLIP_EVENT | DRM_MODE_ATOMIC_HW_DONE_EVENT))) {
 		drm_dbg_atomic(dev,
-			       "commit failed: page-flip event requested with test-only commit\n");
+			       "commit failed: event requested with test-only commit\n");
 		return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index f593dc569d31..3b2221748dca 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -304,6 +304,9 @@ static int drm_getcap(struct drm_device *dev, void *data, struct drm_file *file_
 		req->value = drm_core_check_feature(dev, DRIVER_ATOMIC) &&
 			     dev->mode_config.async_page_flip;
 		break;
+	case DRM_CAP_ATOMIC_HW_DONE_EVENT:
+		req->value = 1;
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 38636a593c9d..e34c2b08e759 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -29,8 +29,23 @@
 #define DRM_ATOMIC_H_
 
 #include <drm/drm_crtc.h>
+#include <drm/drm_file.h>
 #include <drm/drm_util.h>
 
+/**
+ * struct drm_pending_atomic_hw_done_event - pending atomic HW done event tracking
+ */
+struct drm_pending_atomic_hw_done_event {
+	/**
+	 * @base: Base structure for tracking pending DRM events.
+	 */
+	struct drm_pending_event base;
+	/**
+	 * @event: Actual event which will be sent to userspace.
+	 */
+	struct drm_event_atomic_hw_done event;
+};
+
 /**
  * struct drm_crtc_commit - track modeset commits on a CRTC
  *
@@ -517,6 +532,13 @@ struct drm_atomic_state {
 	 */
 	struct drm_crtc_commit *fake_commit;
 
+	/**
+	 * @hw_done_event:
+	 *
+	 * Used for sending an event to user space when programming a commit to HW is done.
+	 */
+	struct drm_pending_atomic_hw_done_event *hw_done_event;
+
 	/**
 	 * @commit_work:
 	 *
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index d7921e633f1a..463e32919093 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1156,7 +1156,8 @@ struct drm_mode_destroy_dumb {
 		DRM_MODE_PAGE_FLIP_ASYNC |\
 		DRM_MODE_ATOMIC_TEST_ONLY |\
 		DRM_MODE_ATOMIC_NONBLOCK |\
-		DRM_MODE_ATOMIC_ALLOW_MODESET)
+		DRM_MODE_ATOMIC_ALLOW_MODESET |\
+		DRM_MODE_ATOMIC_HW_DONE_EVENT)
 
 struct drm_mode_atomic {
 	__u32 flags;
-- 
2.50.0

