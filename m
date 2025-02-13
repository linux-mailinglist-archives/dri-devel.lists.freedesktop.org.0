Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DF6A34876
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 16:50:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7840110E418;
	Thu, 13 Feb 2025 15:50:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RSOnD7uK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D090C10E418
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 15:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739461832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1fVXikV8P1LkgFcbRBlcEvzt5syfU3+P/BigpIdLnzk=;
 b=RSOnD7uKANVHPPjQqwmUBr8bpaER8Mm8fCHqu9L/Ewk2q0P2gSjHlM1DpLwhgSiTDK9Y/R
 RHSuD4SGgftE3TGllouOHmPeb+JWjQssVVkM3MLqwoF/OYX75X3Chu82YQKDJQ/MSrppzU
 rY2w5/kNOBejivbfrhEftamaa2K0584=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-187-J6oyb48CNzyxvZ0MBGqsig-1; Thu,
 13 Feb 2025 10:50:27 -0500
X-MC-Unique: J6oyb48CNzyxvZ0MBGqsig-1
X-Mimecast-MFC-AGG-ID: J6oyb48CNzyxvZ0MBGqsig_1739461825
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0E8BB1801A10; Thu, 13 Feb 2025 15:50:25 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.44.33.58])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 772DC1800360; Thu, 13 Feb 2025 15:50:18 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
Date: Thu, 13 Feb 2025 16:49:15 +0100
Subject: [PATCH RFC 1/5] virtio_config: add page_size field to
 virtio_shm_region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-virtio-shm-page-size-v1-1-5ee1f9984350@redhat.com>
References: <20250213-virtio-shm-page-size-v1-0-5ee1f9984350@redhat.com>
In-Reply-To: <20250213-virtio-shm-page-size-v1-0-5ee1f9984350@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, fnkl.kernel@gmail.com
Cc: virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Sergio Lopez <slp@redhat.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1763; i=slp@redhat.com;
 h=from:subject:message-id; bh=+qQii47gVXmTejLfeLZU+l1N1V1AmJTe9gWUPiChZlk=;
 b=owEBbQKS/ZANAwAIAfRpJ40vDAI1AcsmYgBnrhSshG64fW01+xhzuZqXCMLC7NXEfn5yLipGi
 IaFlLqd0BSJAjMEAAEIAB0WIQS+1fz3US2GgJFC6KL0aSeNLwwCNQUCZ64UrAAKCRD0aSeNLwwC
 NbXfD/9qFc2tvGOvmLc1hX9AToxwFuJLODy+wh/JCKJ0kVlIFFawHMAuv7YgbNDQy8TaKg4SqYb
 2l4J66ckcb+K8r5LScEQQ5h5LuCFPrl9vMg5KRXqpAJDHGmSh5R1v0wZg+1bJLQ97cIl5HnokjR
 7CDf1ixnq+TBit7ow8qqwXUM5gSYnr4CUmElqLa8Iuhoc7PO52Qq4Wi3L9bLyrUxowu4evOvG9o
 /lAiFt2lgcWobvolGEet7TF61vsM1WrgwZTMOJhHUw3gXYFumykNve7r2xsDfeyn1NjIeN1U+rO
 49ExshVLhu9aYwqs/d9/PIZsGZcdxBAu2qhW7v8WBQ6nK+tc7/c64gME11wPCDWYFG1BhOgF+Di
 gl3TbTEeIgWnfLlPfh9l1xESbAuJ7g9neaJjt3kyFd4AhsqHLnk0+v/9VQtd9cZH9cFG78qCgMB
 QVraengJqP/e7MyUDG48qaZjpXY4lLU0qVjKBiazMJ9ULgXwKMRpynKZ2jyHmTyBDpxvED0jwY9
 k5es/7dEPsLKgLwem7D3bvevy3vUdraHeHjxW0Tj3S+ow4L0m7Pov1nMVzeIoEMX21T4dVVXF10
 vPJvo7erwJyeMkD4GTHVq2wA6glxZHtHekYcjCJ2QLn83LMNKkW1VfPe4ON8gr/OSrl7tFFSAxM
 VTT2zDaCu+V1hyg==
X-Developer-Key: i=slp@redhat.com; a=openpgp;
 fpr=BED5FCF7512D86809142E8A2F469278D2F0C0235
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
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

Add a page_size field to virtio_shm_region to store page size supported
by the device. This is required to support running VMs with a page size
smaller than the host, among other potential scenarios.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 drivers/virtio/virtio_mmio.c       | 2 ++
 drivers/virtio/virtio_pci_modern.c | 1 +
 include/linux/virtio_config.h      | 1 +
 3 files changed, 4 insertions(+)

diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
index 5d78c2d572abfcfe2b84cdd82df622320fe97d5d..cd0a0407659517e6a318b117ba67258c59f1f983 100644
--- a/drivers/virtio/virtio_mmio.c
+++ b/drivers/virtio/virtio_mmio.c
@@ -560,6 +560,8 @@ static bool vm_get_shm_region(struct virtio_device *vdev,
 
 	region->addr = addr;
 
+	region->page_size = 4096 >> 12;
+
 	return true;
 }
 
diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
index 5eaade7578606e4b02af0d66447417ad6aa11064..4e6c28aacd1b5dfc117337a689a25d668805e334 100644
--- a/drivers/virtio/virtio_pci_modern.c
+++ b/drivers/virtio/virtio_pci_modern.c
@@ -862,6 +862,7 @@ static bool vp_get_shm_region(struct virtio_device *vdev,
 
 	region->len = len;
 	region->addr = (u64) phys_addr + offset;
+	region->page_size = 4096 >> 12;
 
 	return true;
 }
diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
index 169c7d367facb36dcabf9596068580ea8b8516c7..21ada8fcdf655894bb725045f54c9db3a1492b13 100644
--- a/include/linux/virtio_config.h
+++ b/include/linux/virtio_config.h
@@ -14,6 +14,7 @@ struct irq_affinity;
 struct virtio_shm_region {
 	u64 addr;
 	u64 len;
+	u16 page_size; /* PAGE_SIZE >> 12 */
 };
 
 typedef void vq_callback_t(struct virtqueue *);

-- 
2.48.1

