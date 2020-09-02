Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F73825B59B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 23:09:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CDB36E504;
	Wed,  2 Sep 2020 21:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D0B6E503
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 21:08:52 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id u13so345691pgh.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 14:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uC/H1b3+KhcQGjglZw/M5arenYChmgb2HD8dYcjPkos=;
 b=csoQrJzEAFsMKwdTrct3P6TSDc0IPOarNG7pgZdP3pdBWivVxEvvcSgUHwZ+lNFKWF
 TfHPkw09LRDQGMSce7d+Es15FEAj7Ck3On2KGJQAuazmUfWVw+OXzaUtyvFsLSMArRXT
 9m6i2ro+Vcp6Gi3eHcYme9agwyF0NVe4EOt/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uC/H1b3+KhcQGjglZw/M5arenYChmgb2HD8dYcjPkos=;
 b=tTYDoI78PyvYEbOp2vFM9RmBaArtrMSCIJq2ggiFHwofeozyb076Bx1legWCuV3CQe
 hfWU+7NqpJC68y7pi7xr+RMC+0dg8UrzLDYpNnwxFo2bN3lReMalbQmC06+z5dMInXjm
 wJNrPdmeplZetysFySHTPbGMv29hloRSGRnrSWL2UDGYcwTMIXrVzzns0UzVyj0e+C/J
 UtSR69btf8K6KKKmMdmHR7MjJsi/x4PeH65Gu1JdjDUUCNzASSILqoLrH0/Y7HYpW3Bc
 u5sAIOKp7DEQQ6f6k1yQi4iPeg9lG1k6O7Qg9iIPUJSUpIyNtLCInktD3hxKb1Esf9y0
 hM7g==
X-Gm-Message-State: AOAM530XtvEG/3kl/HttzGb3ghTNoRQ3/mYB2UZKrxrQoX3BIfCZYFWQ
 G+N5fQIDOeteSLHeGQzQw1FpbN3BG3tCoA==
X-Google-Smtp-Source: ABdhPJxbVSiWNJ40LGxSTmm/YTx5vJjftekLAaSXA3Mw/hCkFVBV6u2fS/eulIWCJ5lDiFjP/u4/oQ==
X-Received: by 2002:a63:541e:: with SMTP id i30mr3417033pgb.47.1599080931997; 
 Wed, 02 Sep 2020 14:08:51 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m12sm301145pjd.35.2020.09.02.14.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 14:08:51 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH v2 01/23] Fix use after free in get_capset_info callback.
Date: Wed,  2 Sep 2020 14:08:25 -0700
Message-Id: <20200902210847.2689-2-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200902210847.2689-1-gurchetansingh@chromium.org>
References: <20200902210847.2689-1-gurchetansingh@chromium.org>
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

From: Doug Horn <doughorn@google.com>

If a response to virtio_gpu_cmd_get_capset_info takes longer than
five seconds to return, the callback will access freed kernel memory
in vg->capsets.

Signed-off-by: Doug Horn <doughorn@google.com>
---
 drivers/gpu/drm/virtio/virtgpu_kms.c |  2 ++
 drivers/gpu/drm/virtio/virtgpu_vq.c  | 10 +++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 75d0dc2f6d285..5ba389e0a02fb 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -80,8 +80,10 @@ static void virtio_gpu_get_capsets(struct virtio_gpu_device *vgdev,
 					 vgdev->capsets[i].id > 0, 5 * HZ);
 		if (ret == 0) {
 			DRM_ERROR("timed out waiting for cap set %d\n", i);
+			spin_lock(&vgdev->display_info_lock);
 			kfree(vgdev->capsets);
 			vgdev->capsets = NULL;
+			spin_unlock(&vgdev->display_info_lock);
 			return;
 		}
 		DRM_INFO("cap set %d: id %d, max-version %d, max-size %d\n",
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index c93c2db35aaf3..7436705ba5a22 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -684,9 +684,13 @@ static void virtio_gpu_cmd_get_capset_info_cb(struct virtio_gpu_device *vgdev,
 	int i = le32_to_cpu(cmd->capset_index);
 
 	spin_lock(&vgdev->display_info_lock);
-	vgdev->capsets[i].id = le32_to_cpu(resp->capset_id);
-	vgdev->capsets[i].max_version = le32_to_cpu(resp->capset_max_version);
-	vgdev->capsets[i].max_size = le32_to_cpu(resp->capset_max_size);
+	if (vgdev->capsets) {
+		vgdev->capsets[i].id = le32_to_cpu(resp->capset_id);
+		vgdev->capsets[i].max_version = le32_to_cpu(resp->capset_max_version);
+		vgdev->capsets[i].max_size = le32_to_cpu(resp->capset_max_size);
+	} else {
+		DRM_ERROR("invalid capset memory.");
+	}
 	spin_unlock(&vgdev->display_info_lock);
 	wake_up(&vgdev->resp_wq);
 }
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
