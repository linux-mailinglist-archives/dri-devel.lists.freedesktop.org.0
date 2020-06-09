Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 529C51F34F1
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 09:35:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF2C6E26C;
	Tue,  9 Jun 2020 07:35:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685D16E9DD
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 01:26:05 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id o6so9582242pgh.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jun 2020 18:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0JcU5U23cBSwvRc+LtHthzK2bgv5UkiuTgYVD/tH+hs=;
 b=Cclz/uvTZow4B0U1qRKpIfedIS/qqqFD/W97f4FWTTgUSIgv5MGyWTfjOvzKfgeLOS
 XucPlkUB5NvC6iuas7lwY8RoBFAaZwTSekkX5ONXimlVNrv/IdRe4I+ZIXYigrvhnBa1
 4eV20PnF8eKBbiOw07YVzba/YTQJnkyoClYnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0JcU5U23cBSwvRc+LtHthzK2bgv5UkiuTgYVD/tH+hs=;
 b=XvRAqmA5lqcYsSdtI14rzs4IT1NzUCfXGyFSuJqBUxxcQmWAhMWtp5VwsH6tSDlURS
 5o+zveFEUXlvV6KYuBsa/apRckIjBwrSEbImkjiFJiVw3gjViulLmhfj99CNNKh8Yfy4
 RFrc8Yg/14B+Ux0nsXEfRWh63D/EWNZ+7FZwcyxPeYtZr/S11kV4p9hIQThuEsrvAhYX
 lO/srE2DIfvVGZmYOOhO44mYQpIXaJcqZqDZlA1Y0UltdZL+aiPAaD/S4IK8eyvF/Iv5
 b8igxZuMC/DMqw22xMFiDtjci4LQ87LX+gMLxNPZh0FSMXA1dj3xWs9T4urLgYm6v9bE
 IPzA==
X-Gm-Message-State: AOAM531SDNQfapcNdsGFjQvA3cbqrSbff+9n4D8DRq9abf3+5Oh0pZuA
 3BuW/NJNLDYnbNFI/6nrNhbRew==
X-Google-Smtp-Source: ABdhPJxDYHDpKVwmHopOckTvIsUrO91C7ORl9ZYyWvYZJF7nmNr+1OKYYDjRxDMq6z9pHOquVX5rcw==
X-Received: by 2002:a62:2ccb:: with SMTP id
 s194mr17897487pfs.127.1591665965055; 
 Mon, 08 Jun 2020 18:26:05 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:30f2:7a9c:387e:6c7])
 by smtp.gmail.com with ESMTPSA id w65sm8051336pfb.160.2020.06.08.18.26.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2020 18:26:04 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
To: Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PATCH v5 2/3] virtio-gpu: add VIRTIO_GPU_F_RESOURCE_UUID feature
Date: Tue,  9 Jun 2020 10:25:17 +0900
Message-Id: <20200609012518.198908-3-stevensd@chromium.org>
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
In-Reply-To: <20200609012518.198908-1-stevensd@chromium.org>
References: <20200609012518.198908-1-stevensd@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 09 Jun 2020 07:35:06 +0000
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
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 David Stevens <stevensd@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-media@vger.kernel.org
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
2.27.0.278.ge193c7cf3a9-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
