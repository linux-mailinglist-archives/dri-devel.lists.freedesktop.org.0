Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC173F8055
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 04:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C69B06E49C;
	Thu, 26 Aug 2021 02:05:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C71076E47B
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 02:04:59 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id u15so767436plg.13
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 19:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JaJZf2tGQVF+G0bzFRCFu7flyK66rvgq3U2niCjd6Q0=;
 b=X0k2S5uqP6GySYcYgmy+U2c4tqMvQp2tUgfD1dejH+eE6BCmBHOmA6yERrtp/4uPw7
 KWM+9/TozV4nvHvObBz2Tu8Gu/GMQk/BRyG9Ky4vbPGhYXXQ32P20IdA572N2zGPFVmq
 BUbdZ1VUU9rXSQWzKuxgJfugwpwDoAxD3SBRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JaJZf2tGQVF+G0bzFRCFu7flyK66rvgq3U2niCjd6Q0=;
 b=W6E7mP1aCiFzeTSrS0ZKN85xt5pp1MsJ1Hd4QjRWMU0QmlNTDDbUVRNZ+OiLnSUgEl
 MA7Eqf5wjaDal+LPwFl6ggWGxlnQyAOEFQ9iZn9jJuKH6FAujExuf3OXVxmQVHPmWGnV
 TtOyzoEWIl5hr7V/GbzCtOe2ejfLRzsaU651SHP7nmwzMEiRYlOoQnRmpTG+MRRtcTRF
 2PQA+X+7kJIJsTuMKb6aIHFMupZQH05Kf+pcudRkEQLDobL/UiiHFGkEAo3wA3CRtcRl
 tFjoRLceLecJsSJKPkueoIB3YX/+mk18/uGwJI3skWXaTUP8GxpN/Go8qPd9L7dgbhqL
 Ae2w==
X-Gm-Message-State: AOAM5304sXs35WFw3EP2j9WQPyqveFymN/n1DykJUPWbBHu9lDXqD3Ds
 9tmBDFCf9CSJdJ9NOWbULaTs8JcUP6pnfg==
X-Google-Smtp-Source: ABdhPJxzwy1Oy/DLu4J+k+tYt70U19IjCFWqqjR2fjrOCBXolz8wYVSjGwa8zVPfGHU3jNUmJWaUjQ==
X-Received: by 2002:a17:90a:4894:: with SMTP id
 b20mr1451939pjh.13.1629943499252; 
 Wed, 25 Aug 2021 19:04:59 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:faed:1e29:6bf7:3354])
 by smtp.gmail.com with ESMTPSA id o10sm704987pjg.34.2021.08.25.19.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 19:04:58 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [RFC PATCH 01/12] virtio-gpu api: multiple context types with
 explicit initialization
Date: Wed, 25 Aug 2021 19:04:44 -0700
Message-Id: <20210826020455.1081-2-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210826020455.1081-1-gurchetansingh@chromium.org>
References: <20210826020455.1081-1-gurchetansingh@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This feature allows for each virtio-gpu 3D context to be created
with a "context_init" variable.  This variable can specify:

 - the type of protocol used by the context via the capset id.
   This is useful for differentiating virgl, gfxstream, and venus
   protocols by host userspace.

 - other things in the future, such as the version of the context.

In addition, each different context needs one or more timelines, so
for example a virgl context's waiting can be independent on a
gfxstream context's waiting.

VIRTIO_GPU_FLAG_INFO_RING_IDX is introduced to specific to tell the
host which per-context command ring (or "hardware queue", distinct
from the virtio-queue) the fence should be associated with.

The new capability sets (gfxstream, venus etc.) are only defined in
the virtio-gpu spec and not defined in the header.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Lingfeng Yang <lfy@google.com>
---
 include/uapi/linux/virtio_gpu.h | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
index 97523a95781d..cf3c8a7eb888 100644
--- a/include/uapi/linux/virtio_gpu.h
+++ b/include/uapi/linux/virtio_gpu.h
@@ -59,6 +59,11 @@
  * VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB
  */
 #define VIRTIO_GPU_F_RESOURCE_BLOB       3
+/*
+ * VIRTIO_GPU_CMD_CREATE_CONTEXT with
+ * context_init
+ */
+#define VIRTIO_GPU_F_CONTEXT_INIT        4
 
 enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_UNDEFINED = 0,
@@ -122,14 +127,20 @@ enum virtio_gpu_shm_id {
 	VIRTIO_GPU_SHM_ID_HOST_VISIBLE = 1
 };
 
-#define VIRTIO_GPU_FLAG_FENCE (1 << 0)
+#define VIRTIO_GPU_FLAG_FENCE         (1 << 0)
+/*
+ * If the following flag is set, the lower 5 bits of info contains the index
+ * of the command ring that needs to used when creating the fence
+ */
+#define VIRTIO_GPU_FLAG_INFO_RING_IDX (1 << 1)
 
+#define VIRTIO_GPU_INFO_RING_IDX_MASK 0x0000001f
 struct virtio_gpu_ctrl_hdr {
 	__le32 type;
 	__le32 flags;
 	__le64 fence_id;
 	__le32 ctx_id;
-	__le32 padding;
+	__le32 info;
 };
 
 /* data passed in the cursor vq */
@@ -269,10 +280,11 @@ struct virtio_gpu_resource_create_3d {
 };
 
 /* VIRTIO_GPU_CMD_CTX_CREATE */
+#define VIRTIO_GPU_CONTEXT_INIT_CAPSET_ID_MASK 0x0000003f
 struct virtio_gpu_ctx_create {
 	struct virtio_gpu_ctrl_hdr hdr;
 	__le32 nlen;
-	__le32 padding;
+	__le32 context_init;
 	char debug_name[64];
 };
 
-- 
2.33.0.259.gc128427fd7-goog

