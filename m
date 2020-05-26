Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C73E11E3A23
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 09:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6780E6E2A5;
	Wed, 27 May 2020 07:16:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB8A66E0A5
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 10:59:36 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id b190so10026069pfg.6
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 03:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sOsoHN4fXQCN9r3EwQQMoPQ7wEu7whxz64gA8BdJVX8=;
 b=k/ptBuQMW9xXNmDD0sqqPt9T74YcQoLy9NQeVObozUsHAsnxawePHofARFqBZADdk2
 uEsaQqECrXudlaY/E9TixC+HAzXMa7N0mSYcldjwYMsr1n/0dQ8Etpf5IAs+YFqSCrbj
 Rv0gqNy5UFodSX7aU/wHCuHdlfOblVxFrqIeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sOsoHN4fXQCN9r3EwQQMoPQ7wEu7whxz64gA8BdJVX8=;
 b=TRCL0C86ABne/qlfrEJp0VAzkrQ/3TBHDg9pPPXRkOiiR9QgPpYuT0WLvrFoBN7CfF
 OurDicgnHzIlib5+4etPbaA92+u0uQJpEkQONjpkLBtSWjIxlTuX1OrDGqMELEIcL6dm
 cBlaH9dn8LB7/K5S0oKifC2PNTttXUhnf37Fsu6/Rx0LO0lFHqeXTtIop5i7hr774fga
 8+W8kTj+7uAWCI65pp0LwCfLGD0s7O2z8BdTk7UwYDybtK8v/3B/QGY/S8Wdb4/Yaa3w
 +xaFsFTGYuH+16HDHGq2mFUHGvYyX3v2eCUNUrkv4M9E5mH4p85H9LXOXE/D4TfT+JR5
 FJzw==
X-Gm-Message-State: AOAM532bNRZgVmYHJjYMbTED91gGijFdMKjKki9Vpr6ZlFcEzSMf+YPJ
 joAwBpL3raX9dvR8gyFIEgIhCQ==
X-Google-Smtp-Source: ABdhPJySQvEfVD0v45/DoLGrywVkZ5ujfUgIBevN8GVj9NW8LcC3K7i00Bv3teenrgdD5JQMiplMhw==
X-Received: by 2002:a63:4563:: with SMTP id u35mr505559pgk.163.1590490776430; 
 Tue, 26 May 2020 03:59:36 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:30f2:7a9c:387e:6c7])
 by smtp.gmail.com with ESMTPSA id w192sm15578250pff.126.2020.05.26.03.59.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2020 03:59:35 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
To: Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH v4 2/3] virtio-gpu: add VIRTIO_GPU_F_RESOURCE_UUID feature
Date: Tue, 26 May 2020 19:58:10 +0900
Message-Id: <20200526105811.30784-3-stevensd@chromium.org>
X-Mailer: git-send-email 2.27.0.rc0.183.gde8f92d652-goog
In-Reply-To: <20200526105811.30784-1-stevensd@chromium.org>
References: <20200526105811.30784-1-stevensd@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 27 May 2020 07:15:42 +0000
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
Cc: virtio-dev@lists.oasis-open.org, dri-devel@lists.freedesktop.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, David Stevens <stevensd@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This feature allows the guest to request a UUID from the host for a
particular virtio_gpu resource. The UUID can then be shared with other
virtio devices, to allow the other host devices to access the
virtio_gpu's corresponding host resource.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 include/uapi/linux/virtio_gpu.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
index 0c85914d9369..9721d58b4d58 100644
--- a/include/uapi/linux/virtio_gpu.h
+++ b/include/uapi/linux/virtio_gpu.h
@@ -50,6 +50,10 @@
  * VIRTIO_GPU_CMD_GET_EDID
  */
 #define VIRTIO_GPU_F_EDID                1
+/*
+ * VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID
+ */
+#define VIRTIO_GPU_F_RESOURCE_UUID       2
 
 enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_UNDEFINED = 0,
@@ -66,6 +70,7 @@ enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_CMD_GET_CAPSET_INFO,
 	VIRTIO_GPU_CMD_GET_CAPSET,
 	VIRTIO_GPU_CMD_GET_EDID,
+	VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID,
 
 	/* 3d commands */
 	VIRTIO_GPU_CMD_CTX_CREATE = 0x0200,
@@ -87,6 +92,7 @@ enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_RESP_OK_CAPSET_INFO,
 	VIRTIO_GPU_RESP_OK_CAPSET,
 	VIRTIO_GPU_RESP_OK_EDID,
+	VIRTIO_GPU_RESP_OK_RESOURCE_UUID,
 
 	/* error responses */
 	VIRTIO_GPU_RESP_ERR_UNSPEC = 0x1200,
@@ -340,4 +346,17 @@ enum virtio_gpu_formats {
 	VIRTIO_GPU_FORMAT_R8G8B8X8_UNORM  = 134,
 };
 
+/* VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID */
+struct virtio_gpu_resource_assign_uuid {
+	struct virtio_gpu_ctrl_hdr hdr;
+	__le32 resource_id;
+	__le32 padding;
+};
+
+/* VIRTIO_GPU_RESP_OK_RESOURCE_UUID */
+struct virtio_gpu_resp_resource_uuid {
+	struct virtio_gpu_ctrl_hdr hdr;
+	__u8 uuid[16];
+};
+
 #endif
-- 
2.27.0.rc0.183.gde8f92d652-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
