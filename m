Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FD0A36147
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 16:17:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D48F10ECE3;
	Fri, 14 Feb 2025 15:17:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TodWrV9A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF7AD10ECE0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 15:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739546254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Uvb7bYa9Ne8SlfnrGE22VOdL8DG3p7aSwPX9jSVaTk=;
 b=TodWrV9A+Ypv5ei39X6sefWlWsvEWK2c2kGLFXWbBT3KD+WSyO5wfnMDv/Y68cuXxV5WFB
 /aQrliq+4jTTUAnewtIQn9WhFP2hz5TbOtojxQHSQb7HTYtgFuVa7TaRsYxuAjXs8mmImg
 PVpz1FqafTTir1NN4VNDKS4FDceO8f0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-55-f8IZxBFHP5yk8uRYiD9qVQ-1; Fri,
 14 Feb 2025 10:17:30 -0500
X-MC-Unique: f8IZxBFHP5yk8uRYiD9qVQ-1
X-Mimecast-MFC-AGG-ID: f8IZxBFHP5yk8uRYiD9qVQ_1739546247
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 702101800874; Fri, 14 Feb 2025 15:17:27 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.45.225.8])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 210F219373C4; Fri, 14 Feb 2025 15:17:20 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
Date: Fri, 14 Feb 2025 16:16:56 +0100
Subject: [PATCH RFC v2 2/5] virtio: introduce VIRTIO_F_SHM_PAGE_SIZE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-virtio-shm-page-size-v2-2-aa1619e6908b@redhat.com>
References: <20250214-virtio-shm-page-size-v2-0-aa1619e6908b@redhat.com>
In-Reply-To: <20250214-virtio-shm-page-size-v2-0-aa1619e6908b@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2345; i=slp@redhat.com;
 h=from:subject:message-id; bh=4QcTCYeEiFXjqS+XrMv1FhbL69PRzpsj9vK8zReTdEE=;
 b=owEBbQKS/ZANAwAIAfRpJ40vDAI1AcsmYgBnr15tvWt9Axv+YNZc1miTy/xjWRzL/C+1gA9YT
 fvZe6xw9OiJAjMEAAEIAB0WIQS+1fz3US2GgJFC6KL0aSeNLwwCNQUCZ69ebQAKCRD0aSeNLwwC
 NUWLD/0a6MqcTXdKDD5awJeigZBKrFm0xA1a3LKLfHry0m5xXJwW8mQ74DGHp9xfJtcMl59ZhDy
 26UXYmVAKc3AAX+mTbg2qHa0MtFsnSf3WbddjQfOKaf9/NDzUHi8CqOVE8w/mv5Gph3eY61d3mF
 pWd9/BAcmh+o5QdlPgzlg0wo0HG/3rfPH9z4yc3x/pHEUj61cbplLrXb5iTCM26WzrzO7Pr/t0E
 95mBwNMK21+cu0VPXpYacuje2cXqj0A2xQ5Wj7WyhcA0tMOFzXYpSUe+NS/ULNFws0GvBCkUq9e
 7tHDhOINcocGdmn21+0wDp1rh3hjq4S4i5ODDBUquMYoQ4+0CcfbyYJSE7u6mcOz3iFj0ok7Gwg
 hS7R8Foa7iWI+U0FcYXZc1fOrq8l7IEAVxZ6CvhOe6QJtDAJNVXqXCHBtuxK9947k59aowNloCq
 4b15XpGnSVJkFYXYg33a8mNxhU5C+1mBJpKiQdXBh8pVDtBcKMuV20s0+ypBdmaSZnxGsZrePOr
 km5c7MB7nZZZq8sjWT1q5fleg6ETy5x/7nOv+zdfXSa5OpqdojBADgReKI0FLcG4ihD6Az6MFzm
 AU21wzwI2uCPVrcTHDaCls5bKCeZ4TSeW0+Mv8qkcelXCTrNK/0QN2UP1UkKVabQ9Pm2xaGUStN
 zyu2o7/TSETOcZA==
X-Developer-Key: i=slp@redhat.com; a=openpgp;
 fpr=BED5FCF7512D86809142E8A2F469278D2F0C0235
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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

Introduce VIRTIO_F_SHM_PAGE_SIZE, a feature bit which indicates that the
transport provides the page size for SHM regions.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 drivers/virtio/virtio_pci_modern.c | 3 +++
 drivers/virtio/virtio_ring.c       | 2 ++
 include/uapi/linux/virtio_config.h | 7 ++++++-
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
index d7aeb2e50a3c499dfb68d58cb89b829ea2e50454..ab0e1d9148057c431676bfacfe5f68cc97eebb12 100644
--- a/drivers/virtio/virtio_pci_modern.c
+++ b/drivers/virtio/virtio_pci_modern.c
@@ -367,6 +367,9 @@ static void vp_transport_features(struct virtio_device *vdev, u64 features)
 
 	if (features & BIT_ULL(VIRTIO_F_ADMIN_VQ))
 		__virtio_set_bit(vdev, VIRTIO_F_ADMIN_VQ);
+
+	if (features & BIT_ULL(VIRTIO_F_SHM_PAGE_SIZE))
+		__virtio_set_bit(vdev, VIRTIO_F_SHM_PAGE_SIZE);
 }
 
 static int __vp_check_common_size_one_feature(struct virtio_device *vdev, u32 fbit,
diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index fdd2d2b07b5a2aca864bc917306536685afb66a6..d853d5cf7e553be8bbe0ff461dc7312b258c6e58 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -2983,6 +2983,8 @@ void vring_transport_features(struct virtio_device *vdev)
 			break;
 		case VIRTIO_F_NOTIFICATION_DATA:
 			break;
+		case VIRTIO_F_SHM_PAGE_SIZE:
+			break;
 		default:
 			/* We don't understand this bit. */
 			__virtio_clear_bit(vdev, i);
diff --git a/include/uapi/linux/virtio_config.h b/include/uapi/linux/virtio_config.h
index 2445f365bce74b4e926c6929322b269252ab6830..3171e3792263c2cd472ac09da18e593ab400751d 100644
--- a/include/uapi/linux/virtio_config.h
+++ b/include/uapi/linux/virtio_config.h
@@ -52,7 +52,7 @@
  * rest are per-device feature bits.
  */
 #define VIRTIO_TRANSPORT_F_START	28
-#define VIRTIO_TRANSPORT_F_END		42
+#define VIRTIO_TRANSPORT_F_END		43
 
 #ifndef VIRTIO_CONFIG_NO_LEGACY
 /* Do we get callbacks when the ring is completely used, even if we've
@@ -120,4 +120,9 @@
  */
 #define VIRTIO_F_ADMIN_VQ		41
 
+/*
+ * This feature indicates that the transport provides the SHM page size.
+ */
+#define VIRTIO_F_SHM_PAGE_SIZE		42
+
 #endif /* _UAPI_LINUX_VIRTIO_CONFIG_H */

-- 
2.48.1

