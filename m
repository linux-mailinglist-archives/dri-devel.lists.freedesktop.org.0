Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC48BA3E7AA
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 23:41:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3280E10E9EC;
	Thu, 20 Feb 2025 22:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bf43vY9D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2509D10E9EC
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 22:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740091276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/7k0XXlNxEqpDf9N8EuStsB+1DUOQB7jNTqRmsmfZ9I=;
 b=bf43vY9DDL/b83osHGSttWZ3b006l3YWA/jZfFQSAbjp02w+q04AaHTebwYc+PeSqlQThT
 tPfq+5Ij6e2eywtjy35sardfr3g1WjpsNVADWsbIm7kkRskbiYAa+flDwa9umIAhyJCVPz
 XjdX87MGvjZVFPEhRg0Clbwtghka7os=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-259--ymU3MD2M2-xoYuMkle9wg-1; Thu,
 20 Feb 2025 17:41:11 -0500
X-MC-Unique: -ymU3MD2M2-xoYuMkle9wg-1
X-Mimecast-MFC-AGG-ID: -ymU3MD2M2-xoYuMkle9wg_1740091270
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8A20F1800982; Thu, 20 Feb 2025 22:41:09 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.44.32.26])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4C9071800D96; Thu, 20 Feb 2025 22:41:03 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
Date: Thu, 20 Feb 2025 23:40:31 +0100
Subject: [PATCH RFC v4 2/4] virtio-pci: extend virtio_pci_cap with page_shift
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-virtio-shm-page-size-v4-2-ddaed7b6f734@redhat.com>
References: <20250220-virtio-shm-page-size-v4-0-ddaed7b6f734@redhat.com>
In-Reply-To: <20250220-virtio-shm-page-size-v4-0-ddaed7b6f734@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, 
 Daniel Verkamp <dverkamp@chromium.org>, Jason Wang <jasowang@redhat.com>, 
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5186; i=slp@redhat.com;
 h=from:subject:message-id; bh=fZBejds3HxqJhAuzRZLMFlVcJOBja/rtJP0lwiQ8O5E=;
 b=owEBbQKS/ZANAwAIAfRpJ40vDAI1AcsmYgBnt69s4aAv98lez51Dix//1YmMYHMENrdboZrQB
 9DYOfByMhqJAjMEAAEIAB0WIQS+1fz3US2GgJFC6KL0aSeNLwwCNQUCZ7evbAAKCRD0aSeNLwwC
 NXcvEACp7nTShPCmE5cAB83dIYQqfN2w0uMbywW1NZ3RIJm9opp7FPpykU/R/YI4hr8AOLv91yK
 GnAx9DCuCH96cNO6hO6saxk67d+0Ofz14BDkoIn+/hjZDbq02GdU8YOcrpLSRMyJh7/n202TFgP
 VNErQ9NjEjfzNUbntqdSQDTiWy8oyCMu3Z+xTX2b6xB2PA70my3/q0Mi2wv8Eqqs/0+q7ZQXxwf
 JCqJUpcgsKgjlihy+mrNfZ6ZV9AiwBjfzbqx+zIVUimqHODas3Yz39hL6R1ZjaQ+7hpvUl9RtGi
 n/jz6qFtTYlgr6bjG2eGmkakvm6VuEWKKPwewRGCa+oM0q9B+Un5NBRDZHUpmZRzvDVFDkMP9fX
 Bi0Zw2DZTsYyvRSPcYFZv8qVJX9kfqb7tI2k9HD3K6Io4P31yN6Kj8h3/hs3IbGzfVRBwJoqDXf
 zHuFdjhFy9xLkK9pRgHT8pkjQThbwwb+AbGN55AnK/0ExEue1c3cKsP5jkpABRfrK4D0on/Hee8
 1Rr8PcxPkLgXHqQb+4liOSbaesPQQr6oJDivBnazD8ne/XpgohIyw9ZaUMvFVIrPfRcZZnQZl5c
 nJQa3RzwbV9o2Kww+zlcwsKITJs42rRuyw/naqAgAC4DKIr+fqDxG4ehalnzbK4rR3tb2bxrZOw
 PXv16eyPKD2vWvw==
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

If VIRTIO_F_SHM_PAGE_SIZE has been negotiated and cfg_type is
VIRTIO_PCI_CAP_SHARED_MEMORY_CFG, the driver must read the page_shift
field, derive the supported page size from it, and honor it when
requesting the map of memory into the shared memory region to the
device.

Extend virtio_pci_cap to hold that field, and use it to feed
virtio_shm_region with the corresponding page size.

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Reviewed-by: Daniel Verkamp <dverkamp@chromium.org>
Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 drivers/virtio/virtio_mmio.c       |  2 ++
 drivers/virtio/virtio_pci_modern.c | 29 +++++++++++++++++++++++++----
 include/linux/virtio_config.h      |  1 +
 include/uapi/linux/virtio_pci.h    |  3 ++-
 4 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
index 5d78c2d572abfcfe2b84cdd82df622320fe97d5d..1f594b626d7a7734e8ec58766737a118c26bad94 100644
--- a/drivers/virtio/virtio_mmio.c
+++ b/drivers/virtio/virtio_mmio.c
@@ -560,6 +560,8 @@ static bool vm_get_shm_region(struct virtio_device *vdev,
 
 	region->addr = addr;
 
+	region->page_size = 4096;
+
 	return true;
 }
 
diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
index 104ba08f82d4a6268240bbad15385dd44b3a71d6..2c83b4a261e62614a6526ea13e41f2a05af34cad 100644
--- a/drivers/virtio/virtio_pci_modern.c
+++ b/drivers/virtio/virtio_pci_modern.c
@@ -770,14 +770,15 @@ static void del_vq(struct virtio_pci_vq_info *info)
 	vring_del_virtqueue(vq);
 }
 
-static int virtio_pci_find_shm_cap(struct pci_dev *dev, u8 required_id,
-				   u8 *bar, u64 *offset, u64 *len)
+static int virtio_pci_find_shm_cap(struct virtio_device *vdev, struct pci_dev *dev,
+				   u8 required_id, u8 *bar, u64 *offset, u64 *len,
+				   u32 *page_size)
 {
 	int pos;
 
 	for (pos = pci_find_capability(dev, PCI_CAP_ID_VNDR); pos > 0;
 	     pos = pci_find_next_capability(dev, pos, PCI_CAP_ID_VNDR)) {
-		u8 type, cap_len, id, res_bar;
+		u8 type, cap_len, id, res_bar, page_shift = 0;
 		u32 tmp32;
 		u64 res_offset, res_length;
 
@@ -808,6 +809,23 @@ static int virtio_pci_find_shm_cap(struct pci_dev *dev, u8 required_id,
 		 * Looks good.
 		 */
 
+		/* Read the page shift if supported. The page_shift variable is
+		 * initialized to zero above, so if this feature isn't supported it
+		 * will result in a page_size of 4096, a default safe value.
+		 */
+		if (__virtio_test_bit(vdev, VIRTIO_F_SHM_PAGE_SIZE)) {
+			pci_read_config_byte(dev, pos + offsetof(struct virtio_pci_cap,
+								 page_shift), &page_shift);
+			/* The value derived from page_shift must fit into a 32-bit
+			 * unsigned integer.
+			 */
+			if ((page_shift + 12) >= 32) {
+				dev_err(&dev->dev, "%s: shm cap with bad page shift: %d\n",
+					__func__, page_shift);
+				continue;
+			}
+		}
+
 		/* Read the lower 32bit of length and offset */
 		pci_read_config_dword(dev, pos + offsetof(struct virtio_pci_cap,
 							  offset), &tmp32);
@@ -829,6 +847,7 @@ static int virtio_pci_find_shm_cap(struct pci_dev *dev, u8 required_id,
 		*bar = res_bar;
 		*offset = res_offset;
 		*len = res_length;
+		*page_size = 1U << (page_shift + 12);
 
 		return pos;
 	}
@@ -841,11 +860,12 @@ static bool vp_get_shm_region(struct virtio_device *vdev,
 	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
 	struct pci_dev *pci_dev = vp_dev->pci_dev;
 	u8 bar;
+	u32 page_size;
 	u64 offset, len;
 	phys_addr_t phys_addr;
 	size_t bar_len;
 
-	if (!virtio_pci_find_shm_cap(pci_dev, id, &bar, &offset, &len))
+	if (!virtio_pci_find_shm_cap(vdev, pci_dev, id, &bar, &offset, &len, &page_size))
 		return false;
 
 	phys_addr = pci_resource_start(pci_dev, bar);
@@ -865,6 +885,7 @@ static bool vp_get_shm_region(struct virtio_device *vdev,
 
 	region->len = len;
 	region->addr = (u64) phys_addr + offset;
+	region->page_size = page_size;
 
 	return true;
 }
diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
index 169c7d367facb36dcabf9596068580ea8b8516c7..c1b2ce71ea55e81978e18db05494deab193fa4fb 100644
--- a/include/linux/virtio_config.h
+++ b/include/linux/virtio_config.h
@@ -14,6 +14,7 @@ struct irq_affinity;
 struct virtio_shm_region {
 	u64 addr;
 	u64 len;
+	u32 page_size;
 };
 
 typedef void vq_callback_t(struct virtqueue *);
diff --git a/include/uapi/linux/virtio_pci.h b/include/uapi/linux/virtio_pci.h
index 8549d4571257142ac6c9dad5c01369923791a85a..1a76df52b4eccf548df78a8ee7d3a04591f55522 100644
--- a/include/uapi/linux/virtio_pci.h
+++ b/include/uapi/linux/virtio_pci.h
@@ -127,7 +127,8 @@ struct virtio_pci_cap {
 	__u8 cfg_type;		/* Identifies the structure. */
 	__u8 bar;		/* Where to find it. */
 	__u8 id;		/* Multiple capabilities of the same type */
-	__u8 padding[2];	/* Pad to full dword. */
+	__u8 page_shift;	/* Page shift for VIRTIO_PCI_CAP_SHARED_MEMORY_CFG. */
+	__u8 padding[1];	/* Pad to full dword. */
 	__le32 offset;		/* Offset within bar. */
 	__le32 length;		/* Length of the structure, in bytes. */
 };

-- 
2.48.1

