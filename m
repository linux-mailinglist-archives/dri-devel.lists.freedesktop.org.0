Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7963C4042C0
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 03:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 773336E40F;
	Thu,  9 Sep 2021 01:37:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C86A6E408
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 01:37:23 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id u18so210622pgf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 18:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ah0jrHbzuZcYE04nzgg66+kjUEbq3ztYCO++tYDALJs=;
 b=b0jNhQGQ2rLdGcDoxkDIwwVA6VDE/OeFRrO/RhrKiXZjgVuJaW+dHm+otQ+CR8WZQE
 jveTvVHie0GQK+mSCd8CzmCFbWshYLmO4W0awnFu+S+P+2f0PvJo4MidUGkLJzfDN1iK
 j4gKN9rYKIFaPb9kZJ7Oui8q5DqpFe90bJwCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ah0jrHbzuZcYE04nzgg66+kjUEbq3ztYCO++tYDALJs=;
 b=qmJ+rsFw2ygGTt03OexoA9iS5CmqfaqqtBJazurxMEgD9MO9e1KS0qcY8KWvzQvHzw
 /lO00N86sENLuceLL8auksg5MT88JZkdhCTYbJMtcTnv+uQMPm6maiGnPqAI/wxNAQK6
 ILM5u4EU+5FBEFAH+EcuJ6qj5ABN3eWQGMPyHcO7TfGd4My6OngUrSpoXYUdTGetSn20
 pg8Ayxc15xluFbTZyzPnQDaCZOiVA3eUerFFvz/YCotbAV5gAE8bOu8FOpT3PQoHALdk
 MdvErGUv9vxYY9uc+6C1uDzc65bWJEjc7uiLJsaENj2XfDe8k1YsQmLe55/2Uanj3I07
 fGyQ==
X-Gm-Message-State: AOAM533ISKFvXM/5Tnqw5kPbKwzDdIr1p+cwyE2cIRzk2kNBnSnFT4LQ
 y6dzZ5T/hcoo1IBvrlVf4z3nPAzwcefkf3MT
X-Google-Smtp-Source: ABdhPJwrcawCZtelyNZIi1F2Rp3FTzFtqteSRNP87G1Y0rNN9plhs5EiOy2v1nuFVOQUIDCzZkrlXw==
X-Received: by 2002:a62:7e41:0:b029:3e0:9c3f:ab50 with SMTP id
 z62-20020a627e410000b02903e09c3fab50mr597753pfc.57.1631151442864; 
 Wed, 08 Sep 2021 18:37:22 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:b3e5:2f81:d686:bc91])
 by smtp.gmail.com with ESMTPSA id h9sm142488pjg.9.2021.09.08.18.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 18:37:22 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [PATCH v1 03/12] drm/virtio: implement context init: track valid
 capabilities in a mask
Date: Wed,  8 Sep 2021 18:37:08 -0700
Message-Id: <20210909013717.861-4-gurchetansingh@chromium.org>
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

The valid capability IDs are between 1 to 63, and defined in the
virtio gpu spec.  This is used for error checking the subsequent
patches.  We're currently only using 2 capability IDs, so this
should be plenty for the immediate future.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Lingfeng Yang <lfy@google.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h |  3 +++
 drivers/gpu/drm/virtio/virtgpu_kms.c | 18 +++++++++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 0c4810982530..3023e16be0d6 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -55,6 +55,8 @@
 #define STATE_OK 1
 #define STATE_ERR 2
 
+#define MAX_CAPSET_ID 63
+
 struct virtio_gpu_object_params {
 	unsigned long size;
 	bool dumb;
@@ -245,6 +247,7 @@ struct virtio_gpu_device {
 
 	struct virtio_gpu_drv_capset *capsets;
 	uint32_t num_capsets;
+	uint64_t capset_id_mask;
 	struct list_head cap_cache;
 
 	/* protects uuid state when exporting */
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index f3379059f324..58a65121c200 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -65,6 +65,7 @@ static void virtio_gpu_get_capsets(struct virtio_gpu_device *vgdev,
 				   int num_capsets)
 {
 	int i, ret;
+	bool invalid_capset_id = false;
 
 	vgdev->capsets = kcalloc(num_capsets,
 				 sizeof(struct virtio_gpu_drv_capset),
@@ -78,19 +79,34 @@ static void virtio_gpu_get_capsets(struct virtio_gpu_device *vgdev,
 		virtio_gpu_notify(vgdev);
 		ret = wait_event_timeout(vgdev->resp_wq,
 					 vgdev->capsets[i].id > 0, 5 * HZ);
-		if (ret == 0) {
+		/*
+		 * Capability ids are defined in the virtio-gpu spec and are
+		 * between 1 to 63, inclusive.
+		 */
+		if (!vgdev->capsets[i].id ||
+		    vgdev->capsets[i].id > MAX_CAPSET_ID)
+			invalid_capset_id = true;
+
+		if (ret == 0)
 			DRM_ERROR("timed out waiting for cap set %d\n", i);
+		else if (invalid_capset_id)
+			DRM_ERROR("invalid capset id %u", vgdev->capsets[i].id);
+
+		if (ret == 0 || invalid_capset_id) {
 			spin_lock(&vgdev->display_info_lock);
 			kfree(vgdev->capsets);
 			vgdev->capsets = NULL;
 			spin_unlock(&vgdev->display_info_lock);
 			return;
 		}
+
+		vgdev->capset_id_mask |= 1 << vgdev->capsets[i].id;
 		DRM_INFO("cap set %d: id %d, max-version %d, max-size %d\n",
 			 i, vgdev->capsets[i].id,
 			 vgdev->capsets[i].max_version,
 			 vgdev->capsets[i].max_size);
 	}
+
 	vgdev->num_capsets = num_capsets;
 }
 
-- 
2.33.0.153.gba50c8fa24-goog

