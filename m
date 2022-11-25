Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F1E638F5B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 18:52:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99BB410E780;
	Fri, 25 Nov 2022 17:52:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5190110E77F;
 Fri, 25 Nov 2022 17:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vQnZdDaeMZRvzZ/f0hEi9Onn6iiUNEza8dUpGkzrSeM=; b=eBfRP+3pYLn7TV2us+hnRzIDk/
 u/PT+0Tj/Wck/hBuidjtLiwownsVUSKnoQ/m6CxTwrXC+VxNzJkQEbvMxhPnkWHMOOb7XM0+RA46a
 UhVTuBUvTfAR+9LVVVz0lDcVKMpQXqttHI4SXQiOIarZoZlmAyslMSY4PfPr1mfigllJdD/XUmF+9
 IyT0s1YXh2A9SxDqP3bmqnIIazJ4+UVUVXDgThO+JBhIqJDQHi/e5fcNM9Jq+FkIZ6d/DR37T5gbl
 ZKkHVwS9Guc6LB4SYhXAqFlEzCJrFpFPZhwH8gQpnhkdfIdPe/H3M5E3D2koBAz/eyi6PqKqYwUvg
 OvGbfbSw==;
Received: from 200-148-10-170.dsl.telesp.net.br ([200.148.10.170]
 helo=steammachine.lan) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oycsI-008yzi-Fe; Fri, 25 Nov 2022 18:52:30 +0100
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] drm: Add GPU reset sysfs event
Date: Fri, 25 Nov 2022 14:52:02 -0300
Message-Id: <20221125175203.52481-2-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125175203.52481-1-andrealmeid@igalia.com>
References: <20221125175203.52481-1-andrealmeid@igalia.com>
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>, amaranath.somalapuram@amd.com,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Shashank Sharma <shashank.sharma@amd.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, contactshashanksharma@gmail.com,
 christian.koenig@amd.com,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Shashank Sharma <shashank.sharma@amd.com>

Add a sysfs event to notify userspace about GPU resets providing:
- PID that triggered the GPU reset, if any. Resets can happen from
  kernel threads as well, in that case no PID is provided
- Information about the reset (e.g. was VRAM lost?)

Co-developed-by: André Almeida <andrealmeid@igalia.com>
Signed-off-by: André Almeida <andrealmeid@igalia.com>
Signed-off-by: Shashank Sharma <shashank.sharma@amd.com>
---

V3:
   - Reduce information to just PID and flags
   - Use pid pointer instead of just pid number
   - BUG() if no reset info is provided

V2:
   - Addressed review comments from Christian and Amar
   - move the reset information structure to DRM layer
   - drop _ctx from struct name
   - make pid 32 bit(than 64)
   - set flag when VRAM invalid (than valid)
   - add process name as well (Amar)
---
 drivers/gpu/drm/drm_sysfs.c | 26 ++++++++++++++++++++++++++
 include/drm/drm_sysfs.h     | 13 +++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index 430e00b16eec..85777abf4194 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -409,6 +409,32 @@ void drm_sysfs_hotplug_event(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_sysfs_hotplug_event);
 
+/**
+ * drm_sysfs_reset_event - generate a DRM uevent to indicate GPU reset
+ * @dev: DRM device
+ * @reset_info: The contextual information about the reset (like PID, flags)
+ *
+ * Send a uevent for the DRM device specified by @dev. This informs
+ * user that a GPU reset has occurred, so that an interested client
+ * can take any recovery or profiling measure.
+ */
+void drm_sysfs_reset_event(struct drm_device *dev, struct drm_reset_event_info *reset_info)
+{
+	unsigned char pid_str[13];
+	unsigned char flags_str[18];
+	unsigned char reset_str[] = "RESET=1";
+	char *envp[] = { reset_str, pid_str, flags_str, NULL };
+
+	DRM_DEBUG("generating reset event\n");
+
+	BUG_ON(!reset_info);
+
+	snprintf(pid_str, sizeof(pid_str), "PID=%u", pid_vnr(reset_info->pid));
+	snprintf(flags_str, sizeof(flags_str), "FLAGS=0x%llx", reset_info->flags);
+	kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
+}
+EXPORT_SYMBOL(drm_sysfs_reset_event);
+
 /**
  * drm_sysfs_connector_hotplug_event - generate a DRM uevent for any connector
  * change
diff --git a/include/drm/drm_sysfs.h b/include/drm/drm_sysfs.h
index 6273cac44e47..dbb0ac6230b8 100644
--- a/include/drm/drm_sysfs.h
+++ b/include/drm/drm_sysfs.h
@@ -2,15 +2,28 @@
 #ifndef _DRM_SYSFS_H_
 #define _DRM_SYSFS_H_
 
+#define DRM_RESET_EVENT_VRAM_LOST (1 << 0)
+
 struct drm_device;
 struct device;
 struct drm_connector;
 struct drm_property;
 
+/**
+ * struct drm_reset_event_info - Information about a GPU reset event
+ * @pid: Process that triggered the reset, if any
+ * @flags: Extra information around the reset event (e.g. is VRAM lost?)
+ */
+struct drm_reset_event_info {
+	struct pid *pid;
+	uint64_t flags;
+};
+
 int drm_class_device_register(struct device *dev);
 void drm_class_device_unregister(struct device *dev);
 
 void drm_sysfs_hotplug_event(struct drm_device *dev);
+void drm_sysfs_reset_event(struct drm_device *dev, struct drm_reset_event_info *reset_info);
 void drm_sysfs_connector_hotplug_event(struct drm_connector *connector);
 void drm_sysfs_connector_status_event(struct drm_connector *connector,
 				      struct drm_property *property);
-- 
2.38.1

