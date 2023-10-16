Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D477CB2B1
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 20:42:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044EF10E240;
	Mon, 16 Oct 2023 18:42:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2914210E236
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 18:42:06 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6b87c1edfd5so1924552b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 11:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1697481725; x=1698086525;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qcVYSFrcn0wmcrVCWCtuQmtDHw9+zKA8hiKcgvGFiPY=;
 b=H7LnrRseYBw8zVOdA3L+o2EohJLQFTbN6SPPDj7/xAW0acMoWxf93nqEprXfbfyXns
 VEW3ZQm/k15TWGNLzv17f9FmFr15Q/hmaJnPN0OuUG7ProzzBBmZYBhM+/UjPELc2Hxl
 5dgXaiHTHsC+dbcn54bsMmRIgOBd3UkvQUgNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697481725; x=1698086525;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qcVYSFrcn0wmcrVCWCtuQmtDHw9+zKA8hiKcgvGFiPY=;
 b=YKPn20WoRODvLArp6aC78TkRdrMQVweSoL0T37Uiizhm6OJjyO9f2Zvi6firpnM9AT
 /EaaWGhayQ/eFG0QVcbkfrY0l7QBaJcWe2EnjmGyoOCJqZTdwOFNvAmAuV/30TOaNGCr
 FiWeJ889HeGGHKxc4lUclJKe40zh8ie9oUJadM7vedwOScPVcpGkqtCRnZNUOTkvKUPu
 wwXAosrvnP3bY68nmESgyHvqq8K5W9F4r0uqdBfKxKu1aigmFzftcJLhEhVzyG2u/lkT
 hT4kLx2RfsQaHQY74LuNdQPcbet99+cxIbKdBp//CntGU5vVh7nsQzpKZLdMqq0IWGNH
 mY2A==
X-Gm-Message-State: AOJu0YyFBrBsRgbISi8sV7tg3B6vrtMaDxUdHCDl1Iy6OyGGAk5f+uvX
 0tBWh1ub6IU6qrrZwK5ogBSj3WCNY6I2UwJuIIM=
X-Google-Smtp-Source: AGHT+IECFQNrnub37b3haZCrBbhuzh+qEYOSze5qKbRtY/g+1xlm+cAE1gweBqjdwd+J8BRbiFbEMw==
X-Received: by 2002:a05:6a00:2396:b0:6be:11ac:98a5 with SMTP id
 f22-20020a056a00239600b006be11ac98a5mr3693582pfc.27.1697481725006; 
 Mon, 16 Oct 2023 11:42:05 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:a7:2:9fd0:fd3c:780a:6af7])
 by smtp.gmail.com with ESMTPSA id
 x28-20020a056a00189c00b0068a46cd4120sm218735pfh.199.2023.10.16.11.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 11:42:04 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/virtio: implement debug name via CONTEXT_INIT
Date: Mon, 16 Oct 2023 11:42:00 -0700
Message-Id: <20231016184200.639-3-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20231016184200.639-1-gurchetansingh@chromium.org>
References: <20231016184200.639-1-gurchetansingh@chromium.org>
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
Cc: kraxel@redhat.com, dmitry.osipenko@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This allows setting the debug name during CONTEXT_INIT.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  4 +++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 38 ++++++++++++++++++++++----
 2 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 96365a772f77..c0702d630e05 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -58,6 +58,8 @@
 #define MAX_CAPSET_ID 63
 #define MAX_RINGS 64
 
+#define DEBUG_NAME_MAX_LEN 64
+
 struct virtio_gpu_object_params {
 	unsigned long size;
 	bool dumb;
@@ -274,6 +276,8 @@ struct virtio_gpu_fpriv {
 	uint64_t base_fence_ctx;
 	uint64_t ring_idx_mask;
 	struct mutex context_lock;
+	char debug_name[DEBUG_NAME_MAX_LEN];
+	char explicit_debug_name;
 };
 
 /* virtgpu_ioctl.c */
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 8d13b17c215b..4d6d44a4c899 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -42,12 +42,19 @@
 static void virtio_gpu_create_context_locked(struct virtio_gpu_device *vgdev,
 					     struct virtio_gpu_fpriv *vfpriv)
 {
-	char dbgname[TASK_COMM_LEN];
+	if (vfpriv->explicit_debug_name) {
+		virtio_gpu_cmd_context_create(vgdev, vfpriv->ctx_id,
+					      vfpriv->context_init,
+					      strlen(vfpriv->debug_name),
+					      vfpriv->debug_name);
+	} else {
+		char dbgname[TASK_COMM_LEN];
 
-	get_task_comm(dbgname, current);
-	virtio_gpu_cmd_context_create(vgdev, vfpriv->ctx_id,
-				      vfpriv->context_init, strlen(dbgname),
-				      dbgname);
+		get_task_comm(dbgname, current);
+		virtio_gpu_cmd_context_create(vgdev, vfpriv->ctx_id,
+					      vfpriv->context_init, strlen(dbgname),
+					      dbgname);
+	}
 
 	vfpriv->context_created = true;
 }
@@ -107,6 +114,9 @@ static int virtio_gpu_getparam_ioctl(struct drm_device *dev, void *data,
 	case VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs:
 		value = vgdev->capset_id_mask;
 		break;
+	case VIRTGPU_PARAM_EXPLICIT_DEBUG_NAME:
+		value = vgdev->has_context_init ? 1 : 0;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -580,7 +590,7 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
 		return -EINVAL;
 
 	/* Number of unique parameters supported at this time. */
-	if (num_params > 3)
+	if (num_params > 4)
 		return -EINVAL;
 
 	ctx_set_params = memdup_user(u64_to_user_ptr(args->ctx_set_params),
@@ -642,6 +652,22 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
 
 			vfpriv->ring_idx_mask = value;
 			break;
+		case VIRTGPU_CONTEXT_PARAM_DEBUG_NAME:
+			if (vfpriv->explicit_debug_name) {
+				ret = -EINVAL;
+				goto out_unlock;
+			}
+
+			ret = strncpy_from_user(vfpriv->debug_name,
+						(const char __user *)u64_to_user_ptr(value),
+						DEBUG_NAME_MAX_LEN);
+			if (ret < 0) {
+				ret = -EFAULT;
+				goto out_unlock;
+			}
+
+			vfpriv->explicit_debug_name = true;
+			break;
 		default:
 			ret = -EINVAL;
 			goto out_unlock;
-- 
2.42.0.655.g421f12c284-goog

