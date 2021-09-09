Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0D04042BD
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 03:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E2596E3F2;
	Thu,  9 Sep 2021 01:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F6C6E3F9
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 01:37:21 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 rj12-20020a17090b3e8c00b001991428ded8so147385pjb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 18:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zWid5JCBE5pTgfebNQvRMdNQHA6x0hK3JfcUicb99Go=;
 b=Mn1rdG3nBixR4AKevG9s2/g0CvL1E1gVwCaTAVd4QYD8x33jwGPz9zA83K54KDTAcf
 yCJyRh8tsRK3NoztgNgLENZxjw7VfdZQpZWsl73swTwWGpC66o65Jo9pKXbcWnjWuVm7
 K8YBPGB9niJYL5UpNkGZfwWrJiDz6vzoUZv0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zWid5JCBE5pTgfebNQvRMdNQHA6x0hK3JfcUicb99Go=;
 b=MYKPJY/iFSj6uNw4H1Sxe29563uK133JGOMUfqr5uAPnY4TITCFr6959LTp4umL8Pr
 ImtwqazM2K/URp1qfCGCmWdos3zulHeAHaEF5qV/OT+SVlIyd2zksQ5iYuxX2p7nFTar
 Ad7myrQX2P3o1wD3LMeUQP6R4wvzjHDu5cUCmZqEHTDmcDqWYuKATdjjH58SJl2WcBwB
 aw6l6EaO75wSFBiJaQAqVQwgVGLaU0YgwROXQYozm50HnTz4YNS5cZwBun3s6bnE7IAT
 XQktxnqnHJMJZvYDEyVB+eCXk7cyyx6+Nxe4r7JqifUe6zPbUQqVQqCb3YYxJhPyXvGR
 Qy2g==
X-Gm-Message-State: AOAM5308vdRX9+qrzzQtEsL5/q3Q8YhF0r+YNPNnfSbMAWrhQWeSE3nn
 pzzkOJSrhHNQzkJnoqgMZT1xVHyRzPZqTIef
X-Google-Smtp-Source: ABdhPJyV5QgLEXySoUtsekllG9vInxrgZw0kz8qKH4lEROlwB5yFO2HC9PO6/O4Q7+nsWniMkqFMOw==
X-Received: by 2002:a17:90a:7d05:: with SMTP id g5mr657857pjl.14.1631151441039; 
 Wed, 08 Sep 2021 18:37:21 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:b3e5:2f81:d686:bc91])
 by smtp.gmail.com with ESMTPSA id h9sm142488pjg.9.2021.09.08.18.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 18:37:20 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [PATCH v1 01/12] virtio-gpu api: multiple context types with explicit
 initialization
Date: Wed,  8 Sep 2021 18:37:06 -0700
Message-Id: <20210909013717.861-2-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210909013717.861-1-gurchetansingh@chromium.org>
References: <20210909013717.861-1-gurchetansingh@chromium.org>
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
index 97523a95781d..b0e3d91dfab7 100644
--- a/include/uapi/linux/virtio_gpu.h
+++ b/include/uapi/linux/virtio_gpu.h
@@ -59,6 +59,11 @@
  * VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB
  */
 #define VIRTIO_GPU_F_RESOURCE_BLOB       3
+/*
+ * VIRTIO_GPU_CMD_CREATE_CONTEXT with
+ * context_init and multiple timelines
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
+ * If the following flag is set, then ring_idx contains the index
+ * of the command ring that needs to used when creating the fence
+ */
+#define VIRTIO_GPU_FLAG_INFO_RING_IDX (1 << 1)
 
 struct virtio_gpu_ctrl_hdr {
 	__le32 type;
 	__le32 flags;
 	__le64 fence_id;
 	__le32 ctx_id;
-	__le32 padding;
+	u8 ring_idx;
+	u8 padding[3];
 };
 
 /* data passed in the cursor vq */
@@ -269,10 +280,11 @@ struct virtio_gpu_resource_create_3d {
 };
 
 /* VIRTIO_GPU_CMD_CTX_CREATE */
+#define VIRTIO_GPU_CONTEXT_INIT_CAPSET_ID_MASK 0x000000ff
 struct virtio_gpu_ctx_create {
 	struct virtio_gpu_ctrl_hdr hdr;
 	__le32 nlen;
-	__le32 padding;
+	__le32 context_init;
 	char debug_name[64];
 };
 
-- 
2.33.0.153.gba50c8fa24-goog

