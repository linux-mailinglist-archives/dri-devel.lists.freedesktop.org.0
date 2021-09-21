Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF254413DEE
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 01:20:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B046E8FC;
	Tue, 21 Sep 2021 23:20:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61DF76E8EA
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 23:20:30 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id w11so464468plz.13
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 16:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r/ZoypjXGyNum7HHYvKRyrGSIJezmoRIf9S1n1Y37XA=;
 b=IoxniK9mXNfRzTrq7hnNC43mKDzjQAP4ji+1Owuy58MhtrcXi/Gtw3i3fVCmtXI3BO
 uc15pHqQ9//47OZMQzTWOGXiD79rDDdWrandvUrGJtAagPlM/cVlsBT9w69Kv7nkg/aW
 tWLfusC4zmKYKkZokLE2t6oOjhHv3Tv4SjZ00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r/ZoypjXGyNum7HHYvKRyrGSIJezmoRIf9S1n1Y37XA=;
 b=AKSQVzh2M+rwK75KMrDZKqpxlXoXwgIHP7vf7nL4W8U3EGRv+5anb7Gm5WfXimSxnC
 +i6N9aiFah5QKUPkPj6+HCaI9iRizJ1pkHZH3hsZJjMtheBln0GlP+OogVwrHSTqTOOU
 LwiW3HWck+5T/0y391EEd6KlsnmPXhj7vGaWM6H7sv5vxGGca+T4LRtXVuyMJ37+SVbU
 /cXHaFLSL6p604wkHfsH9ROoS5o+o9HNP3Jqey/EpTc90o8E7q6ovP9W+e4MEiFrDXLM
 d6hbLduMfjDhei17r28NPrUE+OhONVEd137nz/Oa2f6hPDNx0wdfrdNpdhtEzyZvdrsf
 PU3Q==
X-Gm-Message-State: AOAM531uTJwqefhXFHa1hNRYkMwM19pK2ymQjvHzbIax/dvpzYQ75nsJ
 7plrOfntxZZ6Dr/UMxpx+S/lqjA2Ry8A5g==
X-Google-Smtp-Source: ABdhPJztvt8Wsb6c6HJBWpWf+Tj13eDcn7UhYcVPJ6BbMgpbxThyng/5QskM1bsn3L78Q832vm2P0Q==
X-Received: by 2002:a17:902:c406:b0:13b:7b40:9c5a with SMTP id
 k6-20020a170902c40600b0013b7b409c5amr29749890plk.81.1632266429730; 
 Tue, 21 Sep 2021 16:20:29 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:a5ff:11c:6401:fce])
 by smtp.gmail.com with ESMTPSA id e2sm201906pfn.141.2021.09.21.16.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 16:20:29 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [PATCH v3 03/12] drm/virtio: implement context init: track valid
 capabilities in a mask
Date: Tue, 21 Sep 2021 16:20:15 -0700
Message-Id: <20210921232024.817-4-gurchetansingh@chromium.org>
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

