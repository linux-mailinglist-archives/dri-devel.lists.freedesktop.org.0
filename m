Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCAB24431E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 04:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 093366EACB;
	Fri, 14 Aug 2020 02:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C786EAC3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 02:40:18 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id 74so3819133pfx.13
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 19:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=guApKLRbDYnclyesf5t4V7yzAq8BfRFdMiq2KReY1vo=;
 b=Rux5ob85JNLc6CTehSQVLNwJ1wr16p3/XKPdzcnA8sSTLj+8o5EFX3zfpzZCgj5L+w
 DKLLT3obpxjUr9aX4dtgMAsiqPACcS+U5G1gS6juEEa/4DqnsWIDmtddzUgUVVvYJcMr
 h2Bb9aNEJ3mAqpr0u79jLdu1ynY21kONECiBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=guApKLRbDYnclyesf5t4V7yzAq8BfRFdMiq2KReY1vo=;
 b=pYUKTW4Hy3u8GtwAASRcrdeT9FPlBVSwwvD+7DGJemq+WJdDbNJZ93EXxHsiAcu+AJ
 PY85LVY2rkeIMFhy9xNN3MxOU3ppl8U1zyGVWCnaZtCpaAiih7HOTh0zgBNhEW03LdAI
 xOF0mmYI9FJNoMrgV+Br16YtRVOg3rDnQF5QD6tVoDP1MpNTNzPfcRNxHmxKevDAAgVh
 +8R4VJ1z5owpGL0HQRvteUAoZyz+hYX+dLo2rPL8mr4yLZFjRe7cv0k34xRNQgWLtzuu
 JtUKMgislUl+jsd739razT8/45iwSXvcGNXaHAIn5207l7n7CvjqNAiRS1DQShWKh56g
 w3YQ==
X-Gm-Message-State: AOAM532qOVp8t4QmGSjkwUfIJFUio8WElqfXZXw5AlJtnlyzyAUPUOtg
 HMc6WqPhUsyZurs7c9GN3MbrGdGX9qv2Vg==
X-Google-Smtp-Source: ABdhPJw4gF/7dbgkEMbxHetK9ycAVChgDEbpo1qBfUfUdS/VqziOzTJahmy9rf95bUkDE8/tVAm8Vw==
X-Received: by 2002:a63:6f02:: with SMTP id k2mr367273pgc.191.1597372817350;
 Thu, 13 Aug 2020 19:40:17 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m26sm7103539pfe.184.2020.08.13.19.40.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Aug 2020 19:40:16 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH 12/24] virtio-gpu api: cross-device feature
Date: Thu, 13 Aug 2020 19:39:48 -0700
Message-Id: <20200814024000.2485-13-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200814024000.2485-1-gurchetansingh@chromium.org>
References: <20200814024000.2485-1-gurchetansingh@chromium.org>
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
Cc: sebastien.boeuf@intel.com, kraxel@redhat.com, vgoyal@redhat.com,
 mst@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This feature was recently added to virtio-gpu, lets make
it userspace queryable.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 include/uapi/drm/virtgpu_drm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index e1b1518f9acc..b9ec26e9c646 100644
--- a/include/uapi/drm/virtgpu_drm.h
+++ b/include/uapi/drm/virtgpu_drm.h
@@ -74,6 +74,7 @@ struct drm_virtgpu_execbuffer {
 #define VIRTGPU_PARAM_CAPSET_QUERY_FIX 2 /* do we have the capset fix */
 #define VIRTGPU_PARAM_RESOURCE_BLOB 3 /* DRM_VIRTGPU_RESOURCE_CREATE_BLOB */
 #define VIRTGPU_PARAM_HOST_VISIBLE 4 /* Host blob resources are mappable */
+#define VIRTGPU_PARAM_CROSS_DEVICE 5 /* Cross virtio-device resource sharing  */
 
 struct drm_virtgpu_getparam {
 	__u64 param;
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
