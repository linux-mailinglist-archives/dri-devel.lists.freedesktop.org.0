Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EEAA3487B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 16:50:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F5C510EB14;
	Thu, 13 Feb 2025 15:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="f+9V9dI0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C192110EB14
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 15:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739461845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xk1Yohdv6xG1LIYdCE6weZxWdHnGQzZeQusGiNbS4YE=;
 b=f+9V9dI0nul2b20g6a50ORvMOrETMO7sLgbBFmk8Z2Lqx23JF2Z10ayTogk9uW/PGXIu3g
 nFe86bwuXpzhyQ3phLfBZFWvdwLcnklY6XRcNRVA/305DY8IeLDfgVKp7pepvyodQ1t44s
 4/JVsvFgFS/S4qWCtE4jh9rJmbG/DOQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-369-xQRG1M1ZOk2Exaus-VHC1w-1; Thu,
 13 Feb 2025 10:50:40 -0500
X-MC-Unique: xQRG1M1ZOk2Exaus-VHC1w-1
X-Mimecast-MFC-AGG-ID: xQRG1M1ZOk2Exaus-VHC1w
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 95E9A1801A1A; Thu, 13 Feb 2025 15:50:38 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.44.33.58])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D250E1800365; Thu, 13 Feb 2025 15:50:31 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
Date: Thu, 13 Feb 2025 16:49:17 +0100
Subject: [PATCH RFC 3/5] virtio-pci: extend virtio_pci_cap to hold
 page_size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-virtio-shm-page-size-v1-3-5ee1f9984350@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3726; i=slp@redhat.com;
 h=from:subject:message-id; bh=th8ICZQzwvAj4jti147i6LTZteZNR2JRdjJgrinPxuc=;
 b=kA0DAAgB9GknjS8MAjUByyZiAGeuFK6g0IYF5gNoVdDWEYIgYw+KDGgrgUaUt6Ss3HnaKn8f5
 okCMwQAAQgAHRYhBL7V/PdRLYaAkULoovRpJ40vDAI1BQJnrhSuAAoJEPRpJ40vDAI12zkP/iYs
 PuEmv6T8Yt/q5MJgGj+Z3qujU/ygCd+imitAs8P6jGFZsAI82+UupJ+bTmoQpp9gsV7yR+5sLmT
 ik8o0shqm97DkSwU26UmT4Ny7pHoeo4fOxmMw+7KIxIbIsIUk/zDfT0xGGygXkKKfOy6l9BDL6j
 pyYQ8cG8JUfoCauMj/dwTcAUg+t3S9xq6+artRq85AS38zrlte2kgQqwZwajyjd9Z9+XFZW+cLf
 mbllQF7x8RlU+ibEnds0qwScmLx47kZi6G/K8FlcUpe197W3LlUZkHYmQINMvHeGtN5qUJgDRK+
 Ks8xl0mD2q52Rn0vRnbWElGjQ16fvg/opYjr5uBie3u5W4xbRxovh7xjZbAXM1wyycaNllgLUfv
 JyvrzCpRa2K/R8HNgwySlpZqlf7ybsSHK+Swy6Yl3K3qtqJuS0NhbAh8OhN1xda92SBtflPibBw
 ZlHWC1q89oEjcAORxPJOrHUslXx1NJbuprjTNJntzJwNBmSZmcypQgc0GfYeF0OxLNKUd8X9z+z
 M3F/grb33qsAgdcVRnOhEM5RIQf/LH+DDBYdryYWRgAYK5QHWRuYrhcgDRH7BS1t6SJk8VpSdGV
 4bzh2p+K0TvpZ39fD1Vjwpij0LncXAWsMEJ54MDZxZUYAhvUL79Y+50S2Zjs4C9SC6hDYIgeeeh
 HcTcN
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

Turn the 16 bit padding into a page_size field to allow the device to
pass its required page size with format PAGE_SIZE >> 12.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 drivers/virtio/virtio_pci_modern.c | 29 +++++++++++++++++++++++++----
 include/uapi/linux/virtio_pci.h    |  2 +-
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
index 79616ce5057bf3b2b88cae7e8fb7729efa9dd632..26e9cd5148c0f10209c34d12e65d64490a855d75 100644
--- a/drivers/virtio/virtio_pci_modern.c
+++ b/drivers/virtio/virtio_pci_modern.c
@@ -770,14 +770,16 @@ static void del_vq(struct virtio_pci_vq_info *info)
 	vring_del_virtqueue(vq);
 }
 
-static int virtio_pci_find_shm_cap(struct pci_dev *dev, u8 required_id,
-				   u8 *bar, u64 *offset, u64 *len)
+static int virtio_pci_find_shm_cap(struct virtio_device *vdev, struct pci_dev *dev,
+				   u8 required_id, u8 *bar, u64 *offset, u64 *len,
+				   u16 *page_size)
 {
 	int pos;
 
 	for (pos = pci_find_capability(dev, PCI_CAP_ID_VNDR); pos > 0;
 	     pos = pci_find_next_capability(dev, pos, PCI_CAP_ID_VNDR)) {
 		u8 type, cap_len, id, res_bar;
+		u16 res_psize = 0;
 		u32 tmp32;
 		u64 res_offset, res_length;
 
@@ -808,6 +810,23 @@ static int virtio_pci_find_shm_cap(struct pci_dev *dev, u8 required_id,
 		 * Looks good.
 		 */
 
+		if (__virtio_test_bit(vdev, VIRTIO_F_SHM_PAGE_SIZE)) {
+			pci_read_config_word(dev, pos + offsetof(struct virtio_pci_cap,
+								 page_size), &res_psize);
+			if (!res_psize) {
+				dev_err(&dev->dev, "%s: shm cap with invalid page size on "
+					"a device with VIRTIO_F_SHM_PAGE_SIZE feature\n",
+					__func__);
+				res_psize = 4096 >> 12;
+			}
+		}
+
+		/* For backwards compatibility, if the device didn't specify a
+		 * page size, assume it to be 4096.
+		 */
+		if (!res_psize)
+			res_psize = 4096 >> 12;
+
 		/* Read the lower 32bit of length and offset */
 		pci_read_config_dword(dev, pos + offsetof(struct virtio_pci_cap,
 							  offset), &tmp32);
@@ -829,6 +848,7 @@ static int virtio_pci_find_shm_cap(struct pci_dev *dev, u8 required_id,
 		*bar = res_bar;
 		*offset = res_offset;
 		*len = res_length;
+		*page_size = res_psize;
 
 		return pos;
 	}
@@ -841,11 +861,12 @@ static bool vp_get_shm_region(struct virtio_device *vdev,
 	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
 	struct pci_dev *pci_dev = vp_dev->pci_dev;
 	u8 bar;
+	u16 page_size;
 	u64 offset, len;
 	phys_addr_t phys_addr;
 	size_t bar_len;
 
-	if (!virtio_pci_find_shm_cap(pci_dev, id, &bar, &offset, &len))
+	if (!virtio_pci_find_shm_cap(vdev, pci_dev, id, &bar, &offset, &len, &page_size))
 		return false;
 
 	phys_addr = pci_resource_start(pci_dev, bar);
@@ -865,7 +886,7 @@ static bool vp_get_shm_region(struct virtio_device *vdev,
 
 	region->len = len;
 	region->addr = (u64) phys_addr + offset;
-	region->page_size = 4096 >> 12;
+	region->page_size = page_size;
 
 	return true;
 }
diff --git a/include/uapi/linux/virtio_pci.h b/include/uapi/linux/virtio_pci.h
index 8549d4571257142ac6c9dad5c01369923791a85a..fb0ccb7a125d8178c1f78333c4d2f43540e1764b 100644
--- a/include/uapi/linux/virtio_pci.h
+++ b/include/uapi/linux/virtio_pci.h
@@ -127,7 +127,7 @@ struct virtio_pci_cap {
 	__u8 cfg_type;		/* Identifies the structure. */
 	__u8 bar;		/* Where to find it. */
 	__u8 id;		/* Multiple capabilities of the same type */
-	__u8 padding[2];	/* Pad to full dword. */
+	__u16 page_size;	/* Device page size (PAGE_SIZE >> 12). */
 	__le32 offset;		/* Offset within bar. */
 	__le32 length;		/* Length of the structure, in bytes. */
 };

-- 
2.48.1

