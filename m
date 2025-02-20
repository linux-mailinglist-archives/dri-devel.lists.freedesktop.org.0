Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21220A3E7AC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 23:41:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7770210E9ED;
	Thu, 20 Feb 2025 22:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SOnwPIrf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE63D10E9EF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 22:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740091284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x+F1eHhpCOtGRCps9D9sPa5vqYZpX8AGVB3hKqFOcK4=;
 b=SOnwPIrfGu2at3QvQyToEXk5YQfASUOSyfHDGPuEW6Q+2s1xuFpaEi1BGHB4F4fQxl3SAq
 TkoOAKwmI2Twrz7h9Yq/ttDOUbfvINELQNJWtuqH23e1r/uZhcgkznndNyMhQTjNq+J2Yc
 3OXrsrVobY+cbrzgiWJal3i/GinZWHc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-552-XiyJNyuFOnuNGvTbdyAzBg-1; Thu,
 20 Feb 2025 17:41:20 -0500
X-MC-Unique: XiyJNyuFOnuNGvTbdyAzBg-1
X-Mimecast-MFC-AGG-ID: XiyJNyuFOnuNGvTbdyAzBg_1740091278
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9F7F21979057; Thu, 20 Feb 2025 22:41:17 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.44.32.26])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1CA6F1800359; Thu, 20 Feb 2025 22:41:09 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
Date: Thu, 20 Feb 2025 23:40:32 +0100
Subject: [PATCH RFC v4 3/4] virtio-mmio: read shm region page size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-virtio-shm-page-size-v4-3-ddaed7b6f734@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2425; i=slp@redhat.com;
 h=from:subject:message-id; bh=Ehj8/j16O8eT/oyoXvssheCZbXxBfefe7YN3dkYS8pA=;
 b=owEBbQKS/ZANAwAIAfRpJ40vDAI1AcsmYgBnt69txYXyawKpopF3mRu4vuKWWmiWXOzHXeg8b
 dlMQo7n/g6JAjMEAAEIAB0WIQS+1fz3US2GgJFC6KL0aSeNLwwCNQUCZ7evbQAKCRD0aSeNLwwC
 Ne4cD/9Y14GppRUWfTPTUgZUvWhFCX3/t575waWpyGh3UONuPgsMzIRajm0Lrse4JWGg/SefzA3
 2DC8qKFJJIx3HS8iaROUiGHLsSyiTe6n9bj5Me8dlK583tSJZ8KVpyUijwZXhRhQCvQX+EWSjjj
 5dhsLhFW9x2rTlyO4MvB5iOg+Z5MUezx2ocpqZ90/9LCXD/w6hX75sOkbI3bOQVD4O6FUYRal6+
 M1xDA0afOROOn3pCApNHw3ZWVkpNkllX0CxvpwpKChdnB33Uj/ZAkHwMnLHONrGMS800kokTS+O
 wOWf2vXGHOz2akaIEhqbSH3dh47Xer2qQWMyBWM35cksHqzCJgKA1AkcZSHX0h0aedPYg3ZGq9y
 5Pj3crXk10uivWk8hudxf13Kaf1YAKoSEOOowTWz9A790vmjG4HlOpJpdRHkXC3SByLB+lyPWv9
 mX95mD4vb8g6w+oNOJros1NmnId8NMwl01LVJ/gHHBmQCTWoTQXoFJgOGZONrsag1U6GCaqWhrr
 9/2T26PdzOrwjwI3kMwj13yhe7neaNvgYwOuX8RtPFc7MqeNWwl6axXMVCsPmMMcC/c+aPeuL0D
 w4Ryz81KwoxNtQ0gJmsJ45HcQ3dPCvJ14Lu5HmAQvTeP+FqGqJMcmZ6rwpZ+L597nrRm3Nr6XWn
 PVlKyHMJVE/d0lA==
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

Use the newly introduced SHM_PAGE_SHIFT register to read the page shift
for the shared memory region, derive the page size from it and store the
resulting value into virtio_shm_region.

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 drivers/virtio/virtio_mmio.c     | 20 +++++++++++++++++++-
 include/uapi/linux/virtio_mmio.h |  3 +++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
index 1f594b626d7a7734e8ec58766737a118c26bad94..5532450c9e9935399efbe9c5c6257293b6dcfc9e 100644
--- a/drivers/virtio/virtio_mmio.c
+++ b/drivers/virtio/virtio_mmio.c
@@ -537,6 +537,7 @@ static bool vm_get_shm_region(struct virtio_device *vdev,
 			      struct virtio_shm_region *region, u8 id)
 {
 	struct virtio_mmio_device *vm_dev = to_virtio_mmio_device(vdev);
+	u8 page_shift = 0;
 	u64 len, addr;
 
 	/* Select the region we're interested in */
@@ -560,7 +561,24 @@ static bool vm_get_shm_region(struct virtio_device *vdev,
 
 	region->addr = addr;
 
-	region->page_size = 4096;
+	/* If supported by the device transport, read the region page size.
+	 * The page_shift variable is initialized to zero above, so if this
+	 * feature isn't supported it will result in a page_size of 4096, a
+	 * default safe value.
+	 */
+	if (__virtio_test_bit(vdev, VIRTIO_F_SHM_PAGE_SIZE)) {
+		page_shift = (u8) readl(vm_dev->base + VIRTIO_MMIO_SHM_PAGE_SHIFT);
+		/* The value derived from page_shift must fit into a 32-bit
+		 * unsigned integer.
+		 */
+		if ((page_shift + 12) >= 32) {
+			dev_err(&vdev->dev, "%s: device returned an invalid page shift: %d\n",
+				__func__, page_shift);
+			return false;
+		}
+	}
+
+	region->page_size = 1U << (page_shift + 12);
 
 	return true;
 }
diff --git a/include/uapi/linux/virtio_mmio.h b/include/uapi/linux/virtio_mmio.h
index 0650f91bea6c70f935764070d825d181a2379afb..43348be30eff90ee228b6490b9d3c35ba4c50aa5 100644
--- a/include/uapi/linux/virtio_mmio.h
+++ b/include/uapi/linux/virtio_mmio.h
@@ -133,6 +133,9 @@
 #define VIRTIO_MMIO_SHM_BASE_LOW        0x0b8
 #define VIRTIO_MMIO_SHM_BASE_HIGH       0x0bc
 
+/* Shared memory region page shift */
+#define VIRTIO_MMIO_SHM_PAGE_SHIFT      0x0c4
+
 /* Configuration atomicity value */
 #define VIRTIO_MMIO_CONFIG_GENERATION	0x0fc
 

-- 
2.48.1

