Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 553B124431A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 04:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7696EAC3;
	Fri, 14 Aug 2020 02:40:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BA76E593
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 02:40:12 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id ha11so3701379pjb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 19:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uj5OwUKa209o97sWiZ8+oJYiTV5SSBDKEvlfe64N9L8=;
 b=KdUVPzJTMT767jjPo/nucZht365NWp0Stit1h/H6WAUkEGMlQJ0iPmRjTUaTE8fZK8
 5gUixXbgyNjsv1tkGwp1ct2ctDTKUVEf1NVjXaSN7yLiVKlecH+nJRvRQrr2KsbK7Glr
 Z7XtgSpywVO8TabW7e+AMxrr6ICjc5UAi+3UA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uj5OwUKa209o97sWiZ8+oJYiTV5SSBDKEvlfe64N9L8=;
 b=VHOsbboGRzDnVqjEDYHpzAIl36+6AseVCILKn14ek0wdxdqHl1xNmiYka0Vpr34Hp2
 BFrQwBx4TrpPJVzqFT1QRegr4VQe7/UBDXhI3iWUd3UA9Nwpk5EMsEIt4hGd5yPLKeaW
 kJ228fvpDstmcUMUJCPvED3ggxBPvXEcNabsluV/tMZNPqXrfBoQK7qTCxjMA8+fICGN
 8nUqiazsqFUlpAeyQcfvEKHdL/GebV5HaOXRIZMeeaS9Y5OsH5Wu6CXocpLNZsFOvRYn
 FwnQzjI9G+KdkwxeGuPSu/4JIPuISwCrZxlCEgbD1BbOesRBl9I1hkGX3rDCs/JV1au3
 n6lg==
X-Gm-Message-State: AOAM531ygqNKa9LHCLapj20ZU+4vXczMdGHg5bNnFPD822p5cC2Cl3pK
 j7cAfYJtZbU2Z3O7B6pYb33LMytK7/S2VQ==
X-Google-Smtp-Source: ABdhPJynBsLNCwJH59tVEiEPwPTY9amIU0I7LSvfTMlnYjGrMFmKTML+5ML934JIbWMLqzdBBeR8Bg==
X-Received: by 2002:a17:902:8d89:: with SMTP id
 v9mr534890plo.113.1597372811379; 
 Thu, 13 Aug 2020 19:40:11 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m26sm7103539pfe.184.2020.08.13.19.40.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Aug 2020 19:40:10 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH 07/24] virtio: Implement get_shm_region for MMIO transport
Date: Thu, 13 Aug 2020 19:39:43 -0700
Message-Id: <20200814024000.2485-8-gurchetansingh@chromium.org>
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

On MMIO a new set of registers is defined for finding SHM
regions.  Add their definitions and use them to find the region.

Signed-off-by: Sebastien Boeuf <sebastien.boeuf@intel.com>
---
 drivers/virtio/virtio_mmio.c     | 31 +++++++++++++++++++++++++++++++
 include/uapi/linux/virtio_mmio.h | 11 +++++++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
index 627ac0487494..238383ff1064 100644
--- a/drivers/virtio/virtio_mmio.c
+++ b/drivers/virtio/virtio_mmio.c
@@ -498,6 +498,36 @@ static const char *vm_bus_name(struct virtio_device *vdev)
 	return vm_dev->pdev->name;
 }
 
+static bool vm_get_shm_region(struct virtio_device *vdev,
+			      struct virtio_shm_region *region, u8 id)
+{
+	struct virtio_mmio_device *vm_dev = to_virtio_mmio_device(vdev);
+	u64 len, addr;
+
+	/* Select the region we're interested in */
+	writel(id, vm_dev->base + VIRTIO_MMIO_SHM_SEL);
+
+	/* Read the region size */
+	len = (u64) readl(vm_dev->base + VIRTIO_MMIO_SHM_LEN_LOW);
+	len |= (u64) readl(vm_dev->base + VIRTIO_MMIO_SHM_LEN_HIGH) << 32;
+
+	region->len = len;
+
+	/* Check if region length is -1. If that's the case, the shared memory
+	 * region does not exist and there is no need to proceed further.
+	 */
+	if (len == ~(u64)0)
+		return false;
+
+	/* Read the region base address */
+	addr = (u64) readl(vm_dev->base + VIRTIO_MMIO_SHM_BASE_LOW);
+	addr |= (u64) readl(vm_dev->base + VIRTIO_MMIO_SHM_BASE_HIGH) << 32;
+
+	region->addr = addr;
+
+	return true;
+}
+
 static const struct virtio_config_ops virtio_mmio_config_ops = {
 	.get		= vm_get,
 	.set		= vm_set,
@@ -510,6 +540,7 @@ static const struct virtio_config_ops virtio_mmio_config_ops = {
 	.get_features	= vm_get_features,
 	.finalize_features = vm_finalize_features,
 	.bus_name	= vm_bus_name,
+	.get_shm_region = vm_get_shm_region,
 };
 
 
diff --git a/include/uapi/linux/virtio_mmio.h b/include/uapi/linux/virtio_mmio.h
index c4b09689ab64..0650f91bea6c 100644
--- a/include/uapi/linux/virtio_mmio.h
+++ b/include/uapi/linux/virtio_mmio.h
@@ -122,6 +122,17 @@
 #define VIRTIO_MMIO_QUEUE_USED_LOW	0x0a0
 #define VIRTIO_MMIO_QUEUE_USED_HIGH	0x0a4
 
+/* Shared memory region id */
+#define VIRTIO_MMIO_SHM_SEL             0x0ac
+
+/* Shared memory region length, 64 bits in two halves */
+#define VIRTIO_MMIO_SHM_LEN_LOW         0x0b0
+#define VIRTIO_MMIO_SHM_LEN_HIGH        0x0b4
+
+/* Shared memory region base address, 64 bits in two halves */
+#define VIRTIO_MMIO_SHM_BASE_LOW        0x0b8
+#define VIRTIO_MMIO_SHM_BASE_HIGH       0x0bc
+
 /* Configuration atomicity value */
 #define VIRTIO_MMIO_CONFIG_GENERATION	0x0fc
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
