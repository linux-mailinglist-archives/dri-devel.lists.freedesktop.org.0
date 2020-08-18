Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 847F0248004
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 09:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECBC89DC0;
	Tue, 18 Aug 2020 07:52:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F0BF89E7C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 01:38:05 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id r11so9133906pfl.11
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 18:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k/dwpDf9Rw0FIDL5Sc/gG8pBkCydPXuy0KjMx4jHUik=;
 b=fdP1kDUBSxES6CBl53KvmYKvwA0Z3vrdvU06fKTzc2faC/ipJowPp//eQgrYU/IjI+
 03e81fdMqVmLCHL8RLLdK90amj9EHOfIMrtMhkBIegA6+6JKv7+TVQy+VikU4L1coH6v
 gnWWxAUWbnsqfpxlyyWaPnWJEi1rr5S3uBpjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k/dwpDf9Rw0FIDL5Sc/gG8pBkCydPXuy0KjMx4jHUik=;
 b=ixdI54Rc/tjRpbD4fMAOS2y7q1NHJOIO+991WMQb2ADjx/yXgZPnUrmRhGeLAw/6F7
 s3X5uRyMI9gStN0vr/UJSWXv/54/Cn/uooNq3nC8J5jRC2AquqU9OsyOim8QSD3ZKUoK
 SmV6cB9UAhzeeD/jF8GscB34urOf+/rUAbrYmuezG2wXQbbzWaDmeXHlwaAP+ZgOG8jB
 W3WY/hERJPfrlmUjZ44ZyyIWP3FsUMAmX+3Im19lxb6X4H3EzL+rQGKBI6mXxEwcObgy
 19ExYNsKCJ+01A2b09tGPtBNeAlbdf16w+2AzV0+Hc987N7kkqhgOINxcVyHu/CK7GPc
 n3pA==
X-Gm-Message-State: AOAM533yHXHJtj7hvVU9EeTK/E3l+GxdM3JXQ4WSrvIJANjq04rj45XL
 Lw8rSLau+neyOJn5M5SmgDrnWQ==
X-Google-Smtp-Source: ABdhPJyE+G18ZED1RsIPBAHfBZVpK9X8xASvkbfseGEvCF+5Hsix7KEbBKj+Ji83FZjKueo2c9L1Sw==
X-Received: by 2002:a63:f24a:: with SMTP id d10mr11680932pgk.4.1597714685036; 
 Mon, 17 Aug 2020 18:38:05 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:f693:9fff:fef4:a930])
 by smtp.gmail.com with ESMTPSA id gz7sm18993784pjb.45.2020.08.17.18.38.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2020 18:38:04 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v6 2/3] virtio-gpu: add VIRTIO_GPU_F_RESOURCE_UUID feature
Date: Tue, 18 Aug 2020 10:37:43 +0900
Message-Id: <20200818013744.3327271-3-stevensd@chromium.org>
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
In-Reply-To: <20200818013744.3327271-1-stevensd@chromium.org>
References: <20200818013744.3327271-1-stevensd@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 18 Aug 2020 07:50:42 +0000
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
Cc: dri-devel@lists.freedesktop.org, virtio-dev@lists.oasis-open.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 David Stevens <stevensd@chromium.org>, linux-media@vger.kernel.org
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
2.28.0.220.ged08abb693-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
