Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE00A36145
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 16:17:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C72C10ECDF;
	Fri, 14 Feb 2025 15:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Vikq2uAW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE4510ECDF
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 15:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739546246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nrLVSx70Fg0TM3/b/6u0W/Ki7vueT18k7SYrETRcIbc=;
 b=Vikq2uAWSOEA7m5djieLoY8JBoGQchKtpzRq3RYcZjOIFmkTAxR7M+XI9kGKSRyz2W7258
 K/EGquX5c3Sj2I4aGnnVWt8/bUT3OxuUM0f+eJiKPWRizVV0AW7/puhlt8RDBipCIcMP2p
 lhmxlhjgSDXTnNBM9ZsHIZSpF8TdvGw=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-48-trFNyZdhOTWBOp6J3u-xhw-1; Fri,
 14 Feb 2025 10:17:22 -0500
X-MC-Unique: trFNyZdhOTWBOp6J3u-xhw-1
X-Mimecast-MFC-AGG-ID: trFNyZdhOTWBOp6J3u-xhw_1739546240
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 939AA1944D00; Fri, 14 Feb 2025 15:17:20 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.45.225.8])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id DCA19191D7CE; Fri, 14 Feb 2025 15:17:13 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
Date: Fri, 14 Feb 2025 16:16:55 +0100
Subject: [PATCH RFC v2 1/5] virtio_config: add page_size field to
 virtio_shm_region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-virtio-shm-page-size-v2-1-aa1619e6908b@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1729; i=slp@redhat.com;
 h=from:subject:message-id; bh=8Gsx73LZ9WPOVGpMBiCSKKybBmw0f/p67JPch1vqO7A=;
 b=owEBbQKS/ZANAwAIAfRpJ40vDAI1AcsmYgBnr15sWESJ+OzItEn3E8aaGSdbpX3pjWcxS8IOP
 b8BlyFqbsSJAjMEAAEIAB0WIQS+1fz3US2GgJFC6KL0aSeNLwwCNQUCZ69ebAAKCRD0aSeNLwwC
 NdCFEACKtfP+IDc9rU4MZKQUdP0BbdgCZvIPrMqQ3S7fOP3xQN6FfkE0nn3/328NZUcR6GioIDs
 dfJH//humQuU77NKJ2b1r8RdCtAcD/zoktVOND1pRocXLBVEthAUnB5849+dTVpQn5gUvlLQjwt
 2WWkL3GFigTp3FWcHc2eWhfYZbOBVIG56aEvMsXsJvaERigb0mIuMRgm7UdvIgcZTrYwnRRoSUW
 Th/rKyGZBLXEZujoVAvG5ZkJ/yw5GPBC0hv3Jc1XT7glnD56bRcmIrVY+NzMyU4J8uEpr4V9m+E
 90N6qNYALgXYU9p6qbp70W4RBlLg6RbPbXovzl9fGjbVlJvEw4s3HA9I5C7of4nB6aH5n9G9fIh
 Au4nmVaG/B9C+FOsEbU3macr9EcCQisemNfAA4BFpRLWWZobW8MvJ6y/1vBV32yYyglb/QKjnH2
 X7c30s4RSpdqBSm9qfUz7sf8E472OM7OubFHMEl4IXgWYoGgS6PQZQbJliYtNCvzsoiKKqfWMoV
 2zMMDNbsPcug6VyQXKTX/v8n+6Rfr/Wlp0ysyPQrfCT2EOr7TfoWXFT/V50OW2w3JA6f9krV8rW
 BRla51VKOG/wdZErOX3fckyC/54y0hgre/gYkbD9nILZKizKRRERN4aIrl08PI9LwZa17tqp9kC
 Y4NLiuXBnbPBDUg==
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
index 5eaade7578606e4b02af0d66447417ad6aa11064..d7aeb2e50a3c499dfb68d58cb89b829ea2e50454 100644
--- a/drivers/virtio/virtio_pci_modern.c
+++ b/drivers/virtio/virtio_pci_modern.c
@@ -862,6 +862,7 @@ static bool vp_get_shm_region(struct virtio_device *vdev,
 
 	region->len = len;
 	region->addr = (u64) phys_addr + offset;
+	region->page_size = 4096;
 
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

-- 
2.48.1

