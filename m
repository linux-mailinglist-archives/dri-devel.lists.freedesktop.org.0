Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D1125B59F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 23:09:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC31F6E532;
	Wed,  2 Sep 2020 21:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93466E50E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 21:08:57 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id b124so357931pfg.13
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 14:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gw4OfzdO7jm144m/26ZFzhdjHfCO5EFSV76mk4Cm+iI=;
 b=biqb4NTTgbdOGGIph17H0vjJ0A4HgB1KeiDij3phJAHFwcmr3/aafUSowUvnQ013id
 x4q3CgwCoyWTY0EmXbiGz+OOgtlqHHgIG4ooxX9cyotyrGfJdKKkeeQ2K+pHBwHjU8LW
 R5S975tAD6V/LFl8Lj5nHQuIs9alT8cRp3vI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gw4OfzdO7jm144m/26ZFzhdjHfCO5EFSV76mk4Cm+iI=;
 b=jGF3bMJbEPGPGS+P89njnnyT+n9jrEDu6W09vVtT/b+Yglk9qvnnbBYGHpT0YChdq6
 r+dVomL726fbydu+D4HHmvzGE/zBeOvB7GKwITeavDDG1UIZaIX8DqfVDhJBXM8Gzlxo
 k0PdA9TE6f0PUOushakvt7WqXL7ywsSExG+tNDaybfovWIGnwTPL2pXKWmMjDqn5ltVQ
 eJZWMF3f0ynBSnTfGgQ2UmyauuUHFIWo0QF1J+QI7RnG3Ox3KrpC8VTq/5DJXiA7lbQv
 KTsKxr4XqS35JGYN+3xNG4cUcys7TWwzphAATRBB88Gcs7EBg160wX4NT36+3oQirPKH
 eMOw==
X-Gm-Message-State: AOAM533fwF7sF2CWkfGOZji2FbEW6iSvtevhs3Z4IrvZYuU1u4r7U7TS
 Gw4TDnOR7EI1WvxRX2oIVdKBXLcdhxsGcw==
X-Google-Smtp-Source: ABdhPJzbw1b/QpG4ef33ge6aOfWC1W7buvO/i6xyy4GcXSX2KTObEccQL2hrUGezI6r58HLW2iM/Jw==
X-Received: by 2002:a17:902:7e4b:: with SMTP id
 a11mr262491pln.325.1599080936982; 
 Wed, 02 Sep 2020 14:08:56 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m12sm301145pjd.35.2020.09.02.14.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 14:08:56 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH v2 05/23] virtio: Implement get_shm_region for PCI transport
Date: Wed,  2 Sep 2020 14:08:29 -0700
Message-Id: <20200902210847.2689-6-gurchetansingh@chromium.org>
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

On PCI the shm regions are found using capability entries;
find a region by searching for the capability.

Signed-off-by: Sebastien Boeuf <sebastien.boeuf@intel.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: kbuild test robot <lkp@intel.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Cc: kvm@vger.kernel.org
Cc: virtualization@lists.linux-foundation.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>
---
 drivers/virtio/virtio_pci_modern.c | 95 ++++++++++++++++++++++++++++++
 include/uapi/linux/virtio_pci.h    | 11 +++-
 2 files changed, 105 insertions(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
index 3e14e700b2312..dc09f75feb7cc 100644
--- a/drivers/virtio/virtio_pci_modern.c
+++ b/drivers/virtio/virtio_pci_modern.c
@@ -444,6 +444,99 @@ static void del_vq(struct virtio_pci_vq_info *info)
 	vring_del_virtqueue(vq);
 }
 
+static int virtio_pci_find_shm_cap(struct pci_dev *dev, u8 required_id,
+				   u8 *bar, u64 *offset, u64 *len)
+{
+	int pos;
+
+	for (pos = pci_find_capability(dev, PCI_CAP_ID_VNDR); pos > 0;
+	     pos = pci_find_next_capability(dev, pos, PCI_CAP_ID_VNDR)) {
+		u8 type, cap_len, id;
+		u32 tmp32;
+		u64 res_offset, res_length;
+
+		pci_read_config_byte(dev, pos + offsetof(struct virtio_pci_cap,
+							 cfg_type), &type);
+		if (type != VIRTIO_PCI_CAP_SHARED_MEMORY_CFG)
+			continue;
+
+		pci_read_config_byte(dev, pos + offsetof(struct virtio_pci_cap,
+							 cap_len), &cap_len);
+		if (cap_len != sizeof(struct virtio_pci_cap64)) {
+			dev_err(&dev->dev, "%s: shm cap with bad size offset:"
+				" %d size: %d\n", __func__, pos, cap_len);
+			continue;
+		}
+
+		pci_read_config_byte(dev, pos + offsetof(struct virtio_pci_cap,
+							 id), &id);
+		if (id != required_id)
+			continue;
+
+		/* Type, and ID match, looks good */
+		pci_read_config_byte(dev, pos + offsetof(struct virtio_pci_cap,
+							 bar), bar);
+
+		/* Read the lower 32bit of length and offset */
+		pci_read_config_dword(dev, pos + offsetof(struct virtio_pci_cap,
+							  offset), &tmp32);
+		res_offset = tmp32;
+		pci_read_config_dword(dev, pos + offsetof(struct virtio_pci_cap,
+							  length), &tmp32);
+		res_length = tmp32;
+
+		/* and now the top half */
+		pci_read_config_dword(dev,
+				      pos + offsetof(struct virtio_pci_cap64,
+						     offset_hi), &tmp32);
+		res_offset |= ((u64)tmp32) << 32;
+		pci_read_config_dword(dev,
+				      pos + offsetof(struct virtio_pci_cap64,
+						     length_hi), &tmp32);
+		res_length |= ((u64)tmp32) << 32;
+
+		*offset = res_offset;
+		*len = res_length;
+
+		return pos;
+	}
+	return 0;
+}
+
+static bool vp_get_shm_region(struct virtio_device *vdev,
+			      struct virtio_shm_region *region, u8 id)
+{
+	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
+	struct pci_dev *pci_dev = vp_dev->pci_dev;
+	u8 bar;
+	u64 offset, len;
+	phys_addr_t phys_addr;
+	size_t bar_len;
+
+	if (!virtio_pci_find_shm_cap(pci_dev, id, &bar, &offset, &len))
+		return false;
+
+	phys_addr = pci_resource_start(pci_dev, bar);
+	bar_len = pci_resource_len(pci_dev, bar);
+
+	if ((offset + len) < offset) {
+		dev_err(&pci_dev->dev, "%s: cap offset+len overflow detected\n",
+			__func__);
+		return false;
+	}
+
+	if (offset + len > bar_len) {
+		dev_err(&pci_dev->dev, "%s: bar shorter than cap offset+len\n",
+			__func__);
+		return false;
+	}
+
+	region->len = len;
+	region->addr = (u64)phys_addr + offset;
+
+	return true;
+}
+
 static const struct virtio_config_ops virtio_pci_config_nodev_ops = {
 	.get		= NULL,
 	.set		= NULL,
@@ -458,6 +551,7 @@ static const struct virtio_config_ops virtio_pci_config_nodev_ops = {
 	.bus_name	= vp_bus_name,
 	.set_vq_affinity = vp_set_vq_affinity,
 	.get_vq_affinity = vp_get_vq_affinity,
+	.get_shm_region  = vp_get_shm_region,
 };
 
 static const struct virtio_config_ops virtio_pci_config_ops = {
@@ -474,6 +568,7 @@ static const struct virtio_config_ops virtio_pci_config_ops = {
 	.bus_name	= vp_bus_name,
 	.set_vq_affinity = vp_set_vq_affinity,
 	.get_vq_affinity = vp_get_vq_affinity,
+	.get_shm_region  = vp_get_shm_region,
 };
 
 /**
diff --git a/include/uapi/linux/virtio_pci.h b/include/uapi/linux/virtio_pci.h
index 90007a1abcab1..3a86f36d7e3d9 100644
--- a/include/uapi/linux/virtio_pci.h
+++ b/include/uapi/linux/virtio_pci.h
@@ -113,6 +113,8 @@
 #define VIRTIO_PCI_CAP_DEVICE_CFG	4
 /* PCI configuration access */
 #define VIRTIO_PCI_CAP_PCI_CFG		5
+/* Additional shared memory capability */
+#define VIRTIO_PCI_CAP_SHARED_MEMORY_CFG 8
 
 /* This is the PCI capability header: */
 struct virtio_pci_cap {
@@ -121,11 +123,18 @@ struct virtio_pci_cap {
 	__u8 cap_len;		/* Generic PCI field: capability length */
 	__u8 cfg_type;		/* Identifies the structure. */
 	__u8 bar;		/* Where to find it. */
-	__u8 padding[3];	/* Pad to full dword. */
+	__u8 id;		/* Multiple capabilities of the same type */
+	__u8 padding[2];	/* Pad to full dword. */
 	__le32 offset;		/* Offset within bar. */
 	__le32 length;		/* Length of the structure, in bytes. */
 };
 
+struct virtio_pci_cap64 {
+	struct virtio_pci_cap cap;
+	__le32 offset_hi;             /* Most sig 32 bits of offset */
+	__le32 length_hi;             /* Most sig 32 bits of length */
+};
+
 struct virtio_pci_notify_cap {
 	struct virtio_pci_cap cap;
 	__le32 notify_off_multiplier;	/* Multiplier for queue_notify_off. */
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
