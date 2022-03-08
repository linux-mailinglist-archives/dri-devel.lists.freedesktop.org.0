Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E494D29A4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 08:40:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A651110E3EC;
	Wed,  9 Mar 2022 07:40:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B4810E301;
 Tue,  8 Mar 2022 18:04:15 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id dr20so40960705ejc.6;
 Tue, 08 Mar 2022 10:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JyOC3AtfamkTzi//22nHDHd+VjR8L1NjkAGyV+gd6kU=;
 b=GLqsQUKX2rW4Bh9t3iHWFYlkZqVehovBHHS42QGvXr1i0w31eAkNKPBIB+MJwGQFr8
 QLqKwQJx2xHWKwJJkr6LQtlxLc0thhHPtQlWHixTavVVKQkbrsOW9EkQS5C6OjWH9hhd
 qQL4sVmQP2OScQ5fYu08mrm0KY/3EGHo7/yzcaDg+Dn7HGiUYaPtpLHuKtYvoa9Gubyh
 Qi53tNSiz/6Dq81wE6GtjMIIU19WBAV1dIa3XaariOgsEvFafIzGlrrrb7kkyw25WeIw
 yKMNnTX7NsGbmDKEu1v+NbNINQsnTByNOZtiMp8ouk/Lh8gF2zftQJe9A5Uld3tZzbom
 l3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JyOC3AtfamkTzi//22nHDHd+VjR8L1NjkAGyV+gd6kU=;
 b=4T2tY/Eg1uvfasGZm/cFxak8wZCy/EiBJC3G5wIGfjXDpEpW0HuAK0tsa3DxafvSdf
 G1fDFO2RdLeh4VtNmXvb2j7W8MxOZ10ark5bWRzWn+DXXoH7mEqEB7jsx1dx6QO5sV3I
 EUXb1vMHsb44VeRLyXPKcv/MtcfHSBi/JTD5QHRh92cEaLLHYFLHF0hsmXANimmg9YYn
 nYWD5+rVTRR02nSnA7T28fZSm3eCYCxMSYl2ZQ1xy6O7H+yyJIM7112e8hJXN15t2tDK
 kOz3A0bI7KESlbjKHY/EArMBCJe2FTofW71HB/GLlR//ER2geUeKXKYir5UEl78Ncrbe
 260w==
X-Gm-Message-State: AOAM532ypDwuqjk4aDl7arHX0hbqj5JkubosgO1+7S4889ZgJO3EM7L5
 cXz9L+WTupuBN1yDOCg9wS7XgpA1Ysk1O+pIHbT5eg==
X-Google-Smtp-Source: ABdhPJwFStH7Nt+PEo8vGPlUVPPEIut4lyLDcqaK8KhW74OGqJAfX94WlSrVFxXH1ExHi8QveYoaUA==
X-Received: by 2002:a17:907:9691:b0:6d1:711d:9050 with SMTP id
 hd17-20020a170907969100b006d1711d9050mr15063375ejc.755.1646762651871; 
 Tue, 08 Mar 2022 10:04:11 -0800 (PST)
Received: from shashanks-buildpc.amd.com
 (ip5f5bf208.dynamic.kabel-deutschland.de. [95.91.242.8])
 by smtp.gmail.com with ESMTPSA id
 fx3-20020a170906b74300b006daecedee44sm4515985ejb.220.2022.03.08.10.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 10:04:11 -0800 (PST)
From: Shashank Sharma <contactshashanksharma@gmail.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm: Add GPU reset sysfs event
Date: Tue,  8 Mar 2022 19:04:02 +0100
Message-Id: <20220308180403.75566-1-contactshashanksharma@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 09 Mar 2022 07:40:04 +0000
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
Cc: Alexandar Deucher <alexander.deucher@amd.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org,
 Shashank Sharma <shashank.sharma@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Shashank Sharma <shashank.sharma@amd.com>

This patch adds a new sysfs event, which will indicate
the userland about a GPU reset, and can also provide
some information like:
- process ID of the process involved with the GPU reset
- process name of the involved process
- the GPU status info (using flags)

This patch also introduces the first flag of the flags
bitmap, which can be appended as and when required.

V2: Addressed review comments from Christian and Amar
   - move the reset information structure to DRM layer
   - drop _ctx from struct name
   - make pid 32 bit(than 64)
   - set flag when VRAM invalid (than valid)
   - add process name as well (Amar)

Cc: Alexandar Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Amaranath Somalapuram <amaranath.somalapuram@amd.com>
Signed-off-by: Shashank Sharma <shashank.sharma@amd.com>
---
 drivers/gpu/drm/drm_sysfs.c | 31 +++++++++++++++++++++++++++++++
 include/drm/drm_sysfs.h     | 10 ++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index 430e00b16eec..840994810910 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -409,6 +409,37 @@ void drm_sysfs_hotplug_event(struct drm_device *dev)
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
+void drm_sysfs_reset_event(struct drm_device *dev, struct drm_reset_event *reset_info)
+{
+	unsigned char pid_str[13];
+	unsigned char flags_str[15];
+	unsigned char pname_str[TASK_COMM_LEN + 6];
+	unsigned char reset_str[] = "RESET=1";
+	char *envp[] = { reset_str, pid_str, pname_str, flags_str, NULL };
+
+	if (!reset_info) {
+		DRM_WARN("No reset info, not sending the event\n");
+		return;
+	}
+
+	DRM_DEBUG("generating reset event\n");
+
+	snprintf(pid_str, ARRAY_SIZE(pid_str), "PID=%u", reset_info->pid);
+	snprintf(pname_str, ARRAY_SIZE(pname_str), "NAME=%s", reset_info->pname);
+	snprintf(flags_str, ARRAY_SIZE(flags_str), "FLAGS=%u", reset_info->flags);
+	kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
+}
+EXPORT_SYMBOL(drm_sysfs_reset_event);
+
 /**
  * drm_sysfs_connector_hotplug_event - generate a DRM uevent for any connector
  * change
diff --git a/include/drm/drm_sysfs.h b/include/drm/drm_sysfs.h
index 6273cac44e47..5ba11c760619 100644
--- a/include/drm/drm_sysfs.h
+++ b/include/drm/drm_sysfs.h
@@ -1,16 +1,26 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #ifndef _DRM_SYSFS_H_
 #define _DRM_SYSFS_H_
+#include <linux/sched.h>
+
+#define DRM_GPU_RESET_FLAG_VRAM_INVALID (1 << 0)
 
 struct drm_device;
 struct device;
 struct drm_connector;
 struct drm_property;
 
+struct drm_reset_event {
+	uint32_t pid;
+	uint32_t flags;
+	char pname[TASK_COMM_LEN];
+};
+
 int drm_class_device_register(struct device *dev);
 void drm_class_device_unregister(struct device *dev);
 
 void drm_sysfs_hotplug_event(struct drm_device *dev);
+void drm_sysfs_reset_event(struct drm_device *dev, struct drm_reset_event *reset_info);
 void drm_sysfs_connector_hotplug_event(struct drm_connector *connector);
 void drm_sysfs_connector_status_event(struct drm_connector *connector,
 				      struct drm_property *property);
-- 
2.32.0

