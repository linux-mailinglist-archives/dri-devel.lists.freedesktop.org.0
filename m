Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5499C413DEB
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 01:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CCB06E8EA;
	Tue, 21 Sep 2021 23:20:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63AD56E5A4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 23:20:28 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 nn5-20020a17090b38c500b0019af1c4b31fso833276pjb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 16:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IyKBnMXjks0vfupHyc1OPgdPov7J0VDxC5rjw1lJDlc=;
 b=haXavUf73lV5TZkEE8gUrZI5MT0dFzbPqKQcX1OkV3VBbZI+qxl8neUGg/pC4PFpKy
 Mt4ynzhV9X49OAbjv7ZJ+vjEQuRCsvarRPsHiLD6O31+EyEYSZyJKnJh02D+CLa/ro4H
 JB4XnOihwkDZCC5G4cjkdY8cENeelgDIMNvPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IyKBnMXjks0vfupHyc1OPgdPov7J0VDxC5rjw1lJDlc=;
 b=6zgEmDpgCq3pS9MvC9e7C0t35U/sZi+D8qzPmzLDLSuJ2vuT9aJTPb0KhzKjTipRWr
 amZvRlHhs+78IiDJxSxGuxODdq+luba5FfLBjp/WvVKxo5rrzmRj8j0IhY5lWPagre/j
 hJeoZ4EsKpf11F4LmeNlSWnCtiMnX3bncewV6Qcu0hfg9jcYgZUPOevEy+Wsj5FIBpWY
 6wmfV/AoTThBcd5r1os2FMHc1rSN6i5qsPjCpmCCMHJMI+JKHkSiamIrVrL85fqBWKBP
 sFEYbLQHT6+ICO61+fsfClMJOrxVST6N0yXFpWeVOwyz+lgfMI0nxhgbXbz4Qs2Bq5i4
 NN4w==
X-Gm-Message-State: AOAM533VzZJmlCpPWHVn7/5fzEZVaSESwsJQPtBU10P+tXi+LhCFkZZZ
 hOaRxtB+Mp+HEnndllbB4x33aVbJj35PZQ==
X-Google-Smtp-Source: ABdhPJy1pZHFS1WZ7Vb9DYHLNF4U8G0D1kIwB/3RZQBuv2cl55B/WS8FtJ75hHNRLjmNFIiFB6boRQ==
X-Received: by 2002:a17:90a:6708:: with SMTP id
 n8mr8001120pjj.219.1632266427818; 
 Tue, 21 Sep 2021 16:20:27 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:a5ff:11c:6401:fce])
 by smtp.gmail.com with ESMTPSA id e2sm201906pfn.141.2021.09.21.16.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 16:20:27 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [PATCH v3 01/12] virtio-gpu api: multiple context types with explicit
 initialization
Date: Tue, 21 Sep 2021 16:20:13 -0700
Message-Id: <20210921232024.817-2-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210921232024.817-1-gurchetansingh@chromium.org>
References: <20210921232024.817-1-gurchetansingh@chromium.org>
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
index 97523a95781d..f556fde07b76 100644
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
+	__u8 ring_idx;
+	__u8 padding[3];
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

