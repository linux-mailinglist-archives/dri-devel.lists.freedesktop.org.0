Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF83A3487E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 16:50:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7DEE10E468;
	Thu, 13 Feb 2025 15:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZmaAZsf3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B43910E468
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 15:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739461851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CPDMwS7WtZbaodmU1wGmDq5U/O9YW9budAUbZ3K875k=;
 b=ZmaAZsf3BnyjX42m2BiOBWXd5n4PHSky2DcFBpDSIdEenv6mQ/Je5qiExONI596iVnmXtX
 1HSTo8vsWcypGBOHemI3vOOvcHwmhAyYsR8s2xlfIi1kh/7YiJ/lt/mJ7l0SMK/sGJMDCM
 vxpqWtn5WKZrJZWmk0U+UdoAYtXiUI8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-687-_FzdwdRkNT2W6LkuU2I1vA-1; Thu,
 13 Feb 2025 10:50:47 -0500
X-MC-Unique: _FzdwdRkNT2W6LkuU2I1vA-1
X-Mimecast-MFC-AGG-ID: _FzdwdRkNT2W6LkuU2I1vA
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 41D03180087A; Thu, 13 Feb 2025 15:50:45 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.44.33.58])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 399FD1800365; Thu, 13 Feb 2025 15:50:38 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
Date: Thu, 13 Feb 2025 16:49:18 +0100
Subject: [PATCH RFC 4/5] virtio-mmio: read shm region page size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-virtio-shm-page-size-v1-4-5ee1f9984350@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2018; i=slp@redhat.com;
 h=from:subject:message-id; bh=4BHYqTf3/QJ4WE/gAmQswAKbmL+cD4+SAvyJx3zmY/M=;
 b=owEBbQKS/ZANAwAIAfRpJ40vDAI1AcsmYgBnrhSvDxI+WiTFN3JL/Qzuc2xiWNP3Mq2/qlssR
 XCntYrlp4eJAjMEAAEIAB0WIQS+1fz3US2GgJFC6KL0aSeNLwwCNQUCZ64UrwAKCRD0aSeNLwwC
 NcgyEACLL8igsV/fv85sL628B2GV9AZjCunwvzxWR2iisluQIOSnZCHY+0QygQbUzoiTicAsuDm
 pc1Lt/w68Q2kicl2BPqt00LuLWEJW+dqD6KHg1QL8y81xwyr0o/9TJtcTGMTKpnVKCNUt78FELL
 3p57CcqBHqx1XnB4zA6g55eXVRCLgeFcDQTU+To18nWO/TGBA9tqZ7LGwUQ4xoS9QLnfLTdxKDw
 4uxV2jlWwcM7aF/b9ppSvaysZmSz7u9CRjE1Yj2a2+fuMuIJ0e23kh7Vswkq5XVYKfpRrxqt5S9
 K0BiVzJfXX8tnsw03vVv6O1BoNoLtpCmJF/5tk8XklLuLWl/TPX3vMhTgrPwVWfMHp4wDgyOe92
 ApmaolMa0EFOSkFnBKQChdy8mVndj199Lv6m5VVn84Os8FjryN5U56IxiK1d7BW3spvROFbDSDc
 JHZEDzzTlDwWvBdXaflKCl91v4TEbM/+DCClnJog/We9b7Lc2IjhZOogQByvtLYzuA7gJilev7/
 R4upFNDmmJyR/R0s5BCDFtsD84ksi+zIVGSAfAuWsGhMtH+FgX4QM4YYLwR7VzszydWHVWcraSZ
 wZpZscSrkW3Y58y80OkSFnAEmy1fROyRuNV2eFZJnQsfaWKvEQ7qIYoQgBhEq6K94FZBN13SQkB
 3SflZNBJcWr/tvQ==
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

Use the newly introduced SHM_PAGE_SIZE register to read the page size
and store it into virtio_shm_region.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 drivers/virtio/virtio_mmio.c     | 13 ++++++++++++-
 include/uapi/linux/virtio_mmio.h |  3 +++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
index cd0a0407659517e6a318b117ba67258c59f1f983..92590c77901bee453d8c1a1ac60ad9cca90d1b59 100644
--- a/drivers/virtio/virtio_mmio.c
+++ b/drivers/virtio/virtio_mmio.c
@@ -537,6 +537,7 @@ static bool vm_get_shm_region(struct virtio_device *vdev,
 			      struct virtio_shm_region *region, u8 id)
 {
 	struct virtio_mmio_device *vm_dev = to_virtio_mmio_device(vdev);
+	u16 page_size = 0;
 	u64 len, addr;
 
 	/* Select the region we're interested in */
@@ -560,7 +561,17 @@ static bool vm_get_shm_region(struct virtio_device *vdev,
 
 	region->addr = addr;
 
-	region->page_size = 4096 >> 12;
+	/* If supported by the device transport, read the region page size */
+	if (__virtio_test_bit(vdev, VIRTIO_F_SHM_PAGE_SIZE))
+		page_size = (u16) readl(vm_dev->base + VIRTIO_MMIO_SHM_PAGE_SIZE);
+
+	/* For backwards compatibility, if the device didn't specify a
+	 * page size, assume it to be 4096.
+	 */
+	if (page_size == 0)
+		page_size = 4096 >> 12;
+
+	region->page_size = page_size;
 
 	return true;
 }
diff --git a/include/uapi/linux/virtio_mmio.h b/include/uapi/linux/virtio_mmio.h
index 0650f91bea6c70f935764070d825d181a2379afb..c5a1cdad5a1c9bc954d7facfd8c05e2acbb28e96 100644
--- a/include/uapi/linux/virtio_mmio.h
+++ b/include/uapi/linux/virtio_mmio.h
@@ -133,6 +133,9 @@
 #define VIRTIO_MMIO_SHM_BASE_LOW        0x0b8
 #define VIRTIO_MMIO_SHM_BASE_HIGH       0x0bc
 
+/* Shared memory region page size, in format PAGE_SIZE >> 12 */
+#define VIRTIO_MMIO_SHM_PAGE_SIZE       0x0c4
+
 /* Configuration atomicity value */
 #define VIRTIO_MMIO_CONFIG_GENERATION	0x0fc
 

-- 
2.48.1

