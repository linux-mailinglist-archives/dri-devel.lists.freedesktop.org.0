Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAA2B11017
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 19:00:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CBAF10E9A5;
	Thu, 24 Jul 2025 17:00:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=daenzer.net header.i=@daenzer.net header.b="Q9TI6YSR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms7.webland.ch (ms7.webland.ch [92.43.217.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B585F10E9A1;
 Thu, 24 Jul 2025 16:59:59 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; t=1753375955; x=1753980755; s=webland;
 d=daenzer.net; c=relaxed/relaxed; v=1;
 bh=iaVKPuzmpAQDt7xGC5CpA0Z7qFc3P3ZL/GrGKMIDRPY=;
 h=From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References;
 b=Q9TI6YSRBnZXkMpErQkITNgZD1JDx1haafUhbqEKIuldfY+OdFelUsERpcSNlWtx6xhBDOgvaK/RJo5+tAzIhj2DUF9kiGHpcEylZAMQTqgbZGen9nBWpYYzeu/Y3BHQMIYQoDlLYr+uM42y4UN7NcQbtaCIcgrwn50EPq+EruiKKUX5JF+hIn2IFxxZJFblLovgTfEQrVSOO2YEWN63+QkIuI2w6f6MWdI6uNZ46tYKfxvGpOEOJF/SaTcTCfUNS5nP9Re2h0N8XxVPyclXJk0TNKqh31dDhLHIBKUEcH7qAgIgwGdWFHShFJTZcOoNSw3eU0Ygk5mhTtf3D3yuFw==
Received: from kaveri ([213.144.156.170])
 by ms7.webland.ch (12.3.0 build 2 x64) with ASMTP (SSL) id
 01202507241852340802; Thu, 24 Jul 2025 18:52:34 +0200
Received: from daenzer by kaveri with local (Exim 4.98.2)
 (envelope-from <michel@daenzer.net>) id 1uezBI-00000004zLz-2BV3;
 Thu, 24 Jul 2025 18:52:32 +0200
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Hung <alex.hung@amd.com>, Shankar@kaveri.local,
 Uma <uma.shankar@intel.com>, Xaver Hugl <xaver.hugl@kde.org>,
 victoria@system76.com, David Turner <david.turner@raspberrypi.com>
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm/kms: Add DRM_EVENT_ATOMIC_HW_DONE event type
Date: Thu, 24 Jul 2025 18:40:28 +0200
Message-ID: <20250724165220.1189129-2-michel@daenzer.net>
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

It contains a timestamp corresponding to when the kernel driver finished
programming an atomic commit to HW.

Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
---
 include/uapi/drm/drm.h      | 31 ++++++++++++++++++++++++++++++-
 include/uapi/drm/drm_mode.h |  9 +++++++++
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index e63a71d3c607..6fd16861cd3e 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -781,6 +781,13 @@ struct drm_gem_open {
  * commits.
  */
 #define DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP	0x15
+/**
+ * DRM_CAP_ATOMIC_HW_DONE_EVENT
+ *
+ * If set to 1, the kernel supports &DRM_MODE_ATOMIC_HW_DONE_EVENT for atomic
+ * commits.
+ */
+#define DRM_CAP_ATOMIC_HW_DONE_EVENT	0x16
 
 /* DRM_IOCTL_GET_CAP ioctl argument type */
 struct drm_get_cap {
@@ -1332,7 +1339,7 @@ extern "C" {
  *
  * Event types 0 - 0x7fffffff are generic DRM events, 0x80000000 and
  * up are chipset specific. Generic DRM events include &DRM_EVENT_VBLANK,
- * &DRM_EVENT_FLIP_COMPLETE and &DRM_EVENT_CRTC_SEQUENCE.
+ * &DRM_EVENT_FLIP_COMPLETE, &DRM_EVENT_CRTC_SEQUENCE and &DRM_EVENT_ATOMIC_HW_DONE.
  */
 struct drm_event {
 	__u32 type;
@@ -1365,6 +1372,17 @@ struct drm_event {
  * The event payload is a struct drm_event_crtc_sequence.
  */
 #define DRM_EVENT_CRTC_SEQUENCE	0x03
+/**
+ * DRM_EVENT_ATOMIC_HW_DONE - atomic commit HW done event
+ *
+ * This event is sent in response to an atomic commit with the
+ * &DRM_MODE_ATOMIC_HW_DONE_EVENT flag set.
+ *
+ * One event is sent per commit.
+ *
+ * The event payload is a struct drm_event_atomic_hw_done.
+ */
+#define DRM_EVENT_ATOMIC_HW_DONE 0x04
 
 struct drm_event_vblank {
 	struct drm_event base;
@@ -1375,6 +1393,17 @@ struct drm_event_vblank {
 	__u32 crtc_id; /* 0 on older kernels that do not support this */
 };
 
+struct drm_event_atomic_hw_done {
+	struct drm_event base;
+	__u64 user_data;
+
+	/**
+	 * Timestamp corresponding to when programming the commit to HW completed.
+	 */
+	__u32 tv_sec;
+	__u32 tv_usec;
+};
+
 /* Event delivered at sequence. Time stamp marks when the first pixel
  * of the refresh cycle leaves the display engine for the display
  */
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index c082810c08a8..d7921e633f1a 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1136,6 +1136,15 @@ struct drm_mode_destroy_dumb {
  */
 #define DRM_MODE_ATOMIC_ALLOW_MODESET 0x0400
 
+/**
+ * DRM_MODE_ATOMIC_HW_DONE_EVENT
+ *
+ * Request that the kernel sends back an atomic commit HW done event (see
+ * struct drm_event_atomic_hw_done) with the &DRM_EVENT_ATOMIC_HW_DONE type when
+ * programming the atomic commit to HW completes.
+ */
+#define DRM_MODE_ATOMIC_HW_DONE_EVENT 0x0800
+
 /**
  * DRM_MODE_ATOMIC_FLAGS
  *
-- 
2.50.0

