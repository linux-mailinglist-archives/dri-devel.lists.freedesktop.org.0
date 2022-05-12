Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B085525182
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 17:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44427112513;
	Thu, 12 May 2022 15:45:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3632112513
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 15:45:57 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id h3so4760799qtn.4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 08:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gzXI5NJ5qtjmgqMULjjRprbZCIKKrKgAn672btBIfOw=;
 b=mtEUMiNlC06ZK7K6XsQ+ChLwtLHv4bAd5Ptp7pm/EqE/CTNJbdj3q6CTmeGV75u4Gr
 aRpFG9uxGFEl4h/+i9N0We2gx5nnDfRyrfkae9uJDH6PMAJuTbMpm6xgkeKR78eW5aS+
 Q4vS338y0C9rxBs9VQdszfCMPp1TfMwQVYOFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gzXI5NJ5qtjmgqMULjjRprbZCIKKrKgAn672btBIfOw=;
 b=DsgXCfMftBleHcXewd48j5zirNbSj2jTCF/gadNaPEPYdk9wdPze9iBeRvuSIFRfWv
 1EWpTSfEQHRZZAXVvrvH7d0PlC69QYvrF4Fg5pWG7ZOXhfQNdL2TW4q0HV7tD1tMgavb
 Dh12SrEgetS0Ve/jOKy7QHRFlIgS82L2k7///XaW81ImQaDLWi3J1ceEhA0e7R9UjkTj
 YfCH39T8royyq1BfK9cO/IwpgurbEqacm64FJ0W3CBkRajgocEp3GH/C+abA7SUb7wt/
 pbSmBr3eIq0cN/3o/zPqsb15Mc9GTLrfmuAvulQ14zGjr/x9fwQXByffApQR1ScMOdHW
 I+QQ==
X-Gm-Message-State: AOAM531G1ldsVBg+bX0jDtpr0FxjEBDMDoq+kKoealp2waeZimIMjmre
 3A/ygSy1m1gpp6YWWTm0Zhilz533T4k6+Q==
X-Google-Smtp-Source: ABdhPJzVZdH/b1mGR1jYOYXMzlt3WI6fCTgSG8uFU9hMwq4NQe66bDUluzDY1yWa6flo1rjjikNeHg==
X-Received: by 2002:a05:622a:296:b0:2f3:b7e6:f205 with SMTP id
 z22-20020a05622a029600b002f3b7e6f205mr324971qtw.613.1652370356426; 
 Thu, 12 May 2022 08:45:56 -0700 (PDT)
Received: from markyacoub.nyc.corp.google.com
 ([2620:0:1003:314:3111:9cd7:b10c:ffe5])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a05620a10a700b0069fc13ce23csm3038093qkk.109.2022.05.12.08.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 08:45:55 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm] xf86drmMode: Create drmModeCreatePropertyBlobWithFlags
Date: Thu, 12 May 2022 11:45:49 -0400
Message-Id: <20220512154549.2003425-1-markyacoub@chromium.org>
X-Mailer: git-send-email 2.36.0.512.ge40c2bad7a-goog
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
Cc: markyacoub@chromium.org, seanpaul@chromium.org, markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Why]
The kernel has support for creating a blob with flags, particularly
write only flag.
The user space should use libdrm library to make use of the blob flags.

[How]
Create drmModeCreatePropertyBlobWithFlags which has the same
implementation as the existing drmModeCreatePropertyBlob but with a flag
argument.

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 include/drm/drm_mode.h | 6 ++++++
 xf86drmMode.c          | 7 +++++++
 xf86drmMode.h          | 3 +++
 3 files changed, 16 insertions(+)

diff --git a/include/drm/drm_mode.h b/include/drm/drm_mode.h
index 9b6722d4..b0df381f 100644
--- a/include/drm/drm_mode.h
+++ b/include/drm/drm_mode.h
@@ -991,6 +991,9 @@ struct drm_format_modifier {
 	__u64 modifier;
 };
 
+#define DRM_MODE_CREATE_BLOB_WRITE_ONLY                                        \
+	(1 << 0) /* data of the blob can't be read by user space */
+
 /**
  * struct drm_mode_create_blob - Create New blob property
  *
@@ -1004,6 +1007,9 @@ struct drm_mode_create_blob {
 	__u32 length;
 	/** @blob_id: Return: new property ID. */
 	__u32 blob_id;
+	/** Flags for special handling. */
+	__u32 flags;
+	__u32 pad;
 };
 
 /**
diff --git a/xf86drmMode.c b/xf86drmMode.c
index 87e96603..072b395c 100644
--- a/xf86drmMode.c
+++ b/xf86drmMode.c
@@ -1592,6 +1592,12 @@ drm_public int
 drmModeCreatePropertyBlob(int fd, const void *data, size_t length,
                                      uint32_t *id)
 {
+  	return drmModeCreatePropertyBlobWithFlags(fd, data, length, id, 0);
+}
+
+extern int drmModeCreatePropertyBlobWithFlags(int fd, const void *data,
+                                              size_t length, uint32_t *id,
+                                              uint32_t flags) {
 	struct drm_mode_create_blob create;
 	int ret;
 
@@ -1603,6 +1609,7 @@ drmModeCreatePropertyBlob(int fd, const void *data, size_t length,
 	create.length = length;
 	create.data = (uintptr_t) data;
 	create.blob_id = 0;
+	create.flags = flags;
 	*id = 0;
 
 	ret = DRM_IOCTL(fd, DRM_IOCTL_MODE_CREATEPROPBLOB, &create);
diff --git a/xf86drmMode.h b/xf86drmMode.h
index 19bf91dd..f22b8174 100644
--- a/xf86drmMode.h
+++ b/xf86drmMode.h
@@ -450,6 +450,9 @@ extern int drmModeAtomicCommit(int fd,
 
 extern int drmModeCreatePropertyBlob(int fd, const void *data, size_t size,
 				     uint32_t *id);
+extern int drmModeCreatePropertyBlobWithFlags(int fd, const void *data,
+                                              size_t size, uint32_t *id,
+                                              uint32_t flags);
 extern int drmModeDestroyPropertyBlob(int fd, uint32_t id);
 
 /*
-- 
2.36.0.512.ge40c2bad7a-goog

