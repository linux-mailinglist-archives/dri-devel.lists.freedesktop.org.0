Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B5240EE96
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 03:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE5E6EA7E;
	Fri, 17 Sep 2021 01:08:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDAA26EA6C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 01:08:46 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id q22so7678489pfu.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 18:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kDWFj5galYc7b7n68Nh83qV8QpolvPSwd75u8KlBzWU=;
 b=FCdi43ys8LARSEC8Bl6HAKmlEvzDGFBJtbDQ+VY7LyY8iZemDJuRclVdXKhQWCfc5V
 3CjxJtQzmoweyqZ6E/lEQBKSCgG6PyJD8kQiWVtEusG1+31la1Vnnt2GbfSaEEORgXdq
 4uS7+0SHUb2U70kaD7j4Ri7/6zMmJA0KkgcjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kDWFj5galYc7b7n68Nh83qV8QpolvPSwd75u8KlBzWU=;
 b=NV/2riuwBLmVmBu3RA21lHm6vS+QC2AodrXTNAfRpQOf4VUoYxLtM1H6hnUuwSFCOl
 cjy+UQ225vuZtL6r9CNRIEYkcbFXJNgHhoIXtYG7n4jcgo8jDjdN6rERAzO+agnzG6vI
 SYNWjpAyCFTl2hZW37LnQKO9wdp5nOqEapqtA56HPEmEyhB6MrNXc/zmKc9J93wrQ5V3
 A/jL7y7BdRevzZl96gf0/JTm/TCRUDQWuRsdRDCL6aL3OAA/DHN+64ksNffyVBiIA+Tn
 kJlD8nOFLrW7oMGxVzmuL0mO25ta/vptF9Zi26gE+0H6UVnpRuylAcGM3JlZL5SMmxDi
 IkXg==
X-Gm-Message-State: AOAM533U5IlgyiyZ0i9Xih7jBmJSGtQAxu+mrRK2TYwNGi/n/IPe/HUf
 pE9Z0WCkY7SMPMWrPKFPVOe3LydSbYJFgeQ5
X-Google-Smtp-Source: ABdhPJzn5n4QW/GGNqQ2a5DGSYWKRqnnkjkUiASJLInZ9GdsWyxR5MiskjeGEXikzRxZ/xv20ya9EA==
X-Received: by 2002:a63:af18:: with SMTP id w24mr7547016pge.471.1631840926226; 
 Thu, 16 Sep 2021 18:08:46 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:dc20:9a88:c41:f0dd])
 by smtp.gmail.com with ESMTPSA id v4sm4215812pff.11.2021.09.16.18.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 18:08:45 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [PATCH v2 01/12] virtio-gpu api: multiple context types with explicit
 initialization
Date: Thu, 16 Sep 2021 18:08:31 -0700
Message-Id: <20210917010842.503-2-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210917010842.503-1-gurchetansingh@chromium.org>
References: <20210917010842.503-1-gurchetansingh@chromium.org>
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
2.33.0.464.g1972c5931b-goog

