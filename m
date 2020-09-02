Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F136625B59E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 23:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6982F6E513;
	Wed,  2 Sep 2020 21:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A9C6E50D
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 21:08:56 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id 67so309448pgd.12
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 14:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pNt+U2jOzpBpg8KKNIHmyI8kxxx3SNHyuTrRy//l9Gs=;
 b=c0ZCdMfWuyDnotpXqmEnmAPETI0nWsvOa4I/Hbg8lNXpCKkJns7p08Zdab5rsjOtkq
 ohNZXGTa8z8yEf93WuoMMfkn5dY/uw6xFaGU1tbUczebJ3RQzaagMIHqO6JOIPrXrKJ4
 iN0MF9LloTElVi3lsUkn03AXkqcHinuZi0WGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pNt+U2jOzpBpg8KKNIHmyI8kxxx3SNHyuTrRy//l9Gs=;
 b=Rse+fb+vhYC+i0CxsjZUd/LlNW6PNeSsuldbvGUwuFt4slGcP1g2bppoEsKcWKp2NW
 RTf4EUso0U4iJCGeWWywUe3PcG5IdFeLTDzKhqbp2Dqk1AibSVT98Yp/2hOxodkqfPcX
 auEjPQooFyY2ixQgkNFlFXASEfjC3GynqWbVbQdXijjz8jwCjjr3YewZH39Aj0vVJH7s
 KBjxMGA7/ROg80XHUQru13tlhbudleFQC1r7+wVYgQ9D+afsd1GFO2wOzXKZQnvOHWbW
 VhuuTnx3LLnlTeJ+9WKS7TKz6XhUVvHXbDmu44fHhoobcZqMbjLGhqF+FQIxJ8rNou9X
 knGQ==
X-Gm-Message-State: AOAM5300HznEbHEUjM8trqIRQxHMxPMwp0N4atmyWuV6Qlq47Eiad6cF
 tIdqg5XtpXW8Cq5iB3wtnJyJzsuRUcmxLA==
X-Google-Smtp-Source: ABdhPJwNZwEchvciaun934YlOqodjHQ/Mfk+rGM4moH6JEsKKUOUWNaOnRTxQN2GMJi2icn6/BXw0Q==
X-Received: by 2002:a17:902:b289:: with SMTP id
 u9mr307878plr.226.1599080935759; 
 Wed, 02 Sep 2020 14:08:55 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m12sm301145pjd.35.2020.09.02.14.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 14:08:55 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH v2 04/23] virtio: Add get_shm_region method
Date: Wed,  2 Sep 2020 14:08:28 -0700
Message-Id: <20200902210847.2689-5-gurchetansingh@chromium.org>
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

From: Sebastien Boeuf <sebastien.boeuf@intel.com>

Virtio defines 'shared memory regions' that provide a continuously
shared region between the host and guest.

Provide a method to find a particular region on a device.

Signed-off-by: Sebastien Boeuf <sebastien.boeuf@intel.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Cc: kvm@vger.kernel.org
Cc: virtualization@lists.linux-foundation.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>
---
 include/linux/virtio_config.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
index 8fe857e27ef32..4b8e38c5c4d8c 100644
--- a/include/linux/virtio_config.h
+++ b/include/linux/virtio_config.h
@@ -11,6 +11,11 @@
 
 struct irq_affinity;
 
+struct virtio_shm_region {
+	u64 addr;
+	u64 len;
+};
+
 /**
  * virtio_config_ops - operations for configuring a virtio device
  * Note: Do not assume that a transport implements all of the operations
@@ -66,6 +71,7 @@ struct irq_affinity;
  *      the caller can then copy.
  * @set_vq_affinity: set the affinity for a virtqueue (optional).
  * @get_vq_affinity: get the affinity for a virtqueue (optional).
+ * @get_shm_region: get a shared memory region based on the index.
  */
 typedef void vq_callback_t(struct virtqueue *);
 struct virtio_config_ops {
@@ -89,6 +95,8 @@ struct virtio_config_ops {
 			       const struct cpumask *cpu_mask);
 	const struct cpumask *(*get_vq_affinity)(struct virtio_device *vdev,
 			int index);
+	bool (*get_shm_region)(struct virtio_device *vdev,
+			       struct virtio_shm_region *region, u8 id);
 };
 
 /* If driver didn't advertise the feature, it will never appear. */
@@ -251,6 +259,15 @@ int virtqueue_set_affinity(struct virtqueue *vq, const struct cpumask *cpu_mask)
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
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
