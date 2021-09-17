Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E22940EE95
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 03:08:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A2616EA84;
	Fri, 17 Sep 2021 01:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9283B6EA6C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 01:08:48 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id c1so4669862pfp.10
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 18:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r/ZoypjXGyNum7HHYvKRyrGSIJezmoRIf9S1n1Y37XA=;
 b=DbZmK7w5LA1Pu+nOy9vD36/OyChNAVEChQXKSzfsYLf5SR0HzD2JNqYv4f/xB+mKtC
 Vr4ESdowCH9WWzIt5iu1QAHDgCTOY8QHB1WuIeo8eZXpRl0kfG+isr9GuiOQM77H4WoN
 Y1sEXayjIMfGUdEI090BZHHvfUZSUJY0Fnlqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r/ZoypjXGyNum7HHYvKRyrGSIJezmoRIf9S1n1Y37XA=;
 b=OrBabps17W9VLUBT+vvf2LjjJsWxWsIckFemoEK529lkSl6uzIxT8KFTHVpPVQgpti
 PC/G2J5X+0ZpVvTkYDxx5iH4IY2A2YuIgwMRNHQ5A16bikm8D8FCsfpCCR3Nh7hEX94A
 Wej8xIbMKQAM2AOa4lN6IuBZcATqNdd3jIJLA+HlkMzpykku17Dtg4DCiocrwB4vVhu8
 ENmKODXf7KnxPiTezfAfHbEKM8pCkeFCTGRihHrjKyDmp9QVNZdTrSdqmrEgsFhaAl2H
 fHIgFIqJB/NoaZc3Qs0IagL1zNB+V2AcZPR9zy7youqoMGwD4DLUBPL9SEQUpHulHGQC
 EHiw==
X-Gm-Message-State: AOAM530SEShUnLtHRhk85tFmkc0RX8gB9I5xpnwg4/jlfbckinVu8RjQ
 C75EyniXVxph7s/Z1m8Tzq365Mty11MeGfm8
X-Google-Smtp-Source: ABdhPJyTGoVhN1flelpOptURVZGkZ6LTpWfAJ28sRKX11nYT7nbgAqjHa2dteG6miOeD+LFdpW34WA==
X-Received: by 2002:a63:4c5c:: with SMTP id m28mr7467271pgl.67.1631840927976; 
 Thu, 16 Sep 2021 18:08:47 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:dc20:9a88:c41:f0dd])
 by smtp.gmail.com with ESMTPSA id v4sm4215812pff.11.2021.09.16.18.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 18:08:47 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [PATCH v2 03/12] drm/virtio: implement context init: track valid
 capabilities in a mask
Date: Thu, 16 Sep 2021 18:08:33 -0700
Message-Id: <20210917010842.503-4-gurchetansingh@chromium.org>
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
2.33.0.464.g1972c5931b-goog

