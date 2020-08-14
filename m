Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE607244315
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 04:40:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE0476E58A;
	Fri, 14 Aug 2020 02:40:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98AF96E5A5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 02:40:09 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id kr4so3719469pjb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 19:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b8y1eVsBG+LDycaM7y2ShZlPVJo5saaUwiMzn7Km4fM=;
 b=GP9URCRqV3AxRvbVacw0XJDL2tG6Sg5+hk8Rx7Y0tetet7nS8qJ8VjoJRkSSDNgRvR
 w3tK/xCSj5S68Kj+dnBeH6Neb4jKSVDdk4vZ8hTKu5ILOuQa1wX6D0y8ra5jNIzLSVaO
 lJKu+QIzQWQoGfU6aZ+FpMkKPupwQu3d3OOjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b8y1eVsBG+LDycaM7y2ShZlPVJo5saaUwiMzn7Km4fM=;
 b=LGK/Zs968ozdv95SarmuLrDF90/iMNo0A0mlwTOrZ5l0QBcnVR0dgGefjx0pf0+kW7
 044PlwVH2NlbCPL1vw9jtTJtNMA7NREEQvVcOjv3e+QrrtwYtmq2bTca3qRBykgR4xq2
 DOQ6Lz8wpT62AicnrcnQLqQzWGbSP5y3SWcg6ba5AapNnZ+B+tAUQjLnX0AeVrg2frvr
 +2WUKc1U0rrBNT+Puk7ECmJ9wNLBkL1MGoy6N+Gl8In7RiEnZjqBVBLQw2tDdwOaNiUX
 aaoMsVLoyDDIbVMpM9tkp/s4rKyWhKdEhbVskXTn4qtmIUT/vjXmnbIrEAOIcTG5di/G
 qXMA==
X-Gm-Message-State: AOAM531A87idIGRUmvp+koakX4plQPtjfFeTpi9dkSQLGR04fnbd6F8d
 weAUedk2Drz5lLO9nU0u66dO3Fz/hlbmxw==
X-Google-Smtp-Source: ABdhPJyzBuxaWgmwIIV5uiRpsRXmuh49MkpCjnSS+dQeRW1bD7FaxAyL65bjfYOQSdoAsoJGv/5WNQ==
X-Received: by 2002:a17:90a:d252:: with SMTP id
 o18mr519078pjw.146.1597372808927; 
 Thu, 13 Aug 2020 19:40:08 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m26sm7103539pfe.184.2020.08.13.19.40.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Aug 2020 19:40:08 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH 05/24] virtio: Add get_shm_region method
Date: Thu, 13 Aug 2020 19:39:41 -0700
Message-Id: <20200814024000.2485-6-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200814024000.2485-1-gurchetansingh@chromium.org>
References: <20200814024000.2485-1-gurchetansingh@chromium.org>
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

From: Sebastien Boeuf <sebastien.boeuf@intel.com>

Virtio defines 'shared memory regions' that provide a continuously
shared region between the host and guest.

Provide a method to find a particular region on a device.

Signed-off-by: Sebastien Boeuf <sebastien.boeuf@intel.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 include/linux/virtio_config.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
index bb4cc4910750..af4d98addc61 100644
--- a/include/linux/virtio_config.h
+++ b/include/linux/virtio_config.h
@@ -10,6 +10,11 @@
 
 struct irq_affinity;
 
+struct virtio_shm_region {
+	u64 addr;
+	u64 len;
+};
+
 /**
  * virtio_config_ops - operations for configuring a virtio device
  * Note: Do not assume that a transport implements all of the operations
@@ -65,6 +70,9 @@ struct irq_affinity;
  *      the caller can then copy.
  * @set_vq_affinity: set the affinity for a virtqueue (optional).
  * @get_vq_affinity: get the affinity for a virtqueue (optional).
+ * @get_shm_region: get a shared memory region based on the index.
+ *      This does not reserve the resources and caller is expected to call
+ *      devm_request_mem_region() or similar to reserve resources.
  */
 typedef void vq_callback_t(struct virtqueue *);
 struct virtio_config_ops {
@@ -88,6 +96,8 @@ struct virtio_config_ops {
 			       const struct cpumask *cpu_mask);
 	const struct cpumask *(*get_vq_affinity)(struct virtio_device *vdev,
 			int index);
+	bool (*get_shm_region)(struct virtio_device *vdev,
+			       struct virtio_shm_region *region, u8 id);
 };
 
 /* If driver didn't advertise the feature, it will never appear. */
@@ -250,6 +260,15 @@ int virtqueue_set_affinity(struct virtqueue *vq, const struct cpumask *cpu_mask)
 	return 0;
 }
 
+static inline
+bool virtio_get_shm_region(struct virtio_device *vdev,
+			   struct virtio_shm_region *region, u8 id)
+{
+	if (!vdev->config->get_shm_region)
+		return false;
+	return vdev->config->get_shm_region(vdev, region, id);
+}
+
 static inline bool virtio_is_little_endian(struct virtio_device *vdev)
 {
 	return virtio_has_feature(vdev, VIRTIO_F_VERSION_1) ||
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
