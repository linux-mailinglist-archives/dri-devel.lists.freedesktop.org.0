Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDaLNtlOoGnvhwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 14:47:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD411A6E56
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 14:47:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A1310E931;
	Thu, 26 Feb 2026 13:47:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 361 seconds by postgrey-1.36 at gabe;
 Thu, 26 Feb 2026 13:47:00 UTC
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C86910E931
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 13:47:00 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CF3BA1A254A;
 Thu, 26 Feb 2026 14:41:06 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B7E371A253C;
 Thu, 26 Feb 2026 14:41:06 +0100 (CET)
Received: from lsv15149.swis.ro-buh01.nxp.com (lsv15149.swis.ro-buh01.nxp.com
 [10.162.246.145])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 0E9D92035B;
 Thu, 26 Feb 2026 14:41:05 +0100 (CET)
From: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
Date: Thu, 26 Feb 2026 15:40:47 +0200
Subject: [PATCH 8/9] accel/neutron: Add logging support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-neutron-v1-8-46eccb3bb50a@nxp.com>
References: <20260226-neutron-v1-0-46eccb3bb50a@nxp.com>
In-Reply-To: <20260226-neutron-v1-0-46eccb3bb50a@nxp.com>
To: Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Jiwei Fu <jiwei.fu@nxp.com>, 
 Forrest Shi <xuelin.shi@nxp.com>, Alexandru Taran <alexandru.taran@nxp.com>, 
 Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772113256; l=7700;
 i=ruxandra.radulescu@nxp.com; s=20260204; h=from:subject:message-id;
 bh=HFuzMjntYvhOCHE0AaufcFtwUGeRoiICS772u9gKCik=;
 b=JD6RNGZkvSwooK6itGN7AQtmsv1GIa1vMOZgr3/jI62PEolio3hc8V0Q3ylaLw9iGMO19geVk
 kkJRmvebtDwCd1nFbpiR2OGbaJpOMgkziFwnjKlIE468r+z2Lb7D0zF
X-Developer-Key: i=ruxandra.radulescu@nxp.com; a=ed25519;
 pk=zoq4b4OYR0c4faAH97xoTxdr6vfR8OvPbS+Cx0XhIBY=
X-Virus-Scanned: ClamAV using ClamSMTP
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), No valid DKIM,none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ogabbay@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Frank.Li@nxp.com,m:christian.koenig@amd.com,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:jiwei.fu@nxp.com,m:xuelin.shi@nxp.com,m:alexandru.taran@nxp.com,m:ruxandra.radulescu@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[ruxandra.radulescu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,nxp.com,amd.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ruxandra.radulescu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	NEURAL_HAM(-0.00)[-0.987];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nxp.com:mid,nxp.com:email]
X-Rspamd-Queue-Id: 2BD411A6E56
X-Rspamd-Action: no action

Expose the Neutron firmware log via debugfs interface. The log resides
in internal device memory.

Signed-off-by: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
---
 drivers/accel/neutron/Makefile          |  2 +
 drivers/accel/neutron/neutron_debugfs.c | 34 ++++++++++++++++
 drivers/accel/neutron/neutron_debugfs.h | 15 +++++++
 drivers/accel/neutron/neutron_device.c  | 69 +++++++++++++++++++++++++++++++++
 drivers/accel/neutron/neutron_device.h  | 17 ++++++++
 drivers/accel/neutron/neutron_driver.c  |  3 ++
 6 files changed, 140 insertions(+)

diff --git a/drivers/accel/neutron/Makefile b/drivers/accel/neutron/Makefile
index ac6dd576521c..6d5c204460af 100644
--- a/drivers/accel/neutron/Makefile
+++ b/drivers/accel/neutron/Makefile
@@ -8,3 +8,5 @@ neutron-y := \
 	neutron_gem.o \
 	neutron_job.o \
 	neutron_mailbox.o
+
+neutron-$(CONFIG_DEBUG_FS) += neutron_debugfs.o
diff --git a/drivers/accel/neutron/neutron_debugfs.c b/drivers/accel/neutron/neutron_debugfs.c
new file mode 100644
index 000000000000..a392286e40b7
--- /dev/null
+++ b/drivers/accel/neutron/neutron_debugfs.c
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Copyright 2025 NXP */
+
+#include <linux/debugfs.h>
+
+#include "neutron_device.h"
+#include "neutron_debugfs.h"
+
+static ssize_t fw_log_read(struct file *f, char __user *buf, size_t count, loff_t *pos)
+{
+	struct neutron_device *ndev = file_inode(f)->i_private;
+
+	if (!ndev->log.size)
+		return 0;
+
+	if (ndev->flags & NEUTRON_BOOTED)
+		neutron_read_log(ndev, count);
+
+	return simple_read_from_buffer(buf, count, pos, ndev->log.buf,
+				       ndev->log.buf_count);
+}
+
+static const struct file_operations fw_log_fops = {
+	.owner = THIS_MODULE,
+	.read = fw_log_read,
+};
+
+void neutron_debugfs_init(struct neutron_device *ndev)
+{
+	struct dentry *debugfs_root;
+
+	debugfs_root = ndev->base.debugfs_root;
+	debugfs_create_file("fw_log", 0444, debugfs_root, ndev, &fw_log_fops);
+}
diff --git a/drivers/accel/neutron/neutron_debugfs.h b/drivers/accel/neutron/neutron_debugfs.h
new file mode 100644
index 000000000000..7cd4b5af55a6
--- /dev/null
+++ b/drivers/accel/neutron/neutron_debugfs.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/* Copyright 2025 NXP */
+
+#ifndef __NEUTRON_DEBUGFS_H__
+#define __NEUTRON_DEBUGFS_H__
+
+struct neutron_device;
+
+#if defined(CONFIG_DEBUG_FS)
+void neutron_debugfs_init(struct neutron_device *ndev);
+#else
+static inline void neutron_debugfs_init(struct neutron_device *ndev) {}
+#endif
+
+#endif /* __NEUTRON_DEBUGFS_H__ */
diff --git a/drivers/accel/neutron/neutron_device.c b/drivers/accel/neutron/neutron_device.c
index 571ec906ad72..a5cedc91ad25 100644
--- a/drivers/accel/neutron/neutron_device.c
+++ b/drivers/accel/neutron/neutron_device.c
@@ -77,6 +77,70 @@ static void neutron_stop(struct neutron_device *ndev)
 			   100, 100 * USEC_PER_MSEC);
 }
 
+static void neutron_init_logging(struct neutron_device *ndev)
+{
+	size_t old_size = ndev->log.size;
+	u32 ringctrl;
+
+	ringctrl = readl_relaxed(NEUTRON_REG(ndev, RINGCTRL));
+
+	ndev->log.base = ndev->mem_regions[NEUTRON_MEM_DTCM].va +
+			 NEUTRON_DTCM_BANK1_OFFSET +
+			 FIELD_GET(RINGCTRL_ADDR_MASK, ringctrl);
+	ndev->log.size = FIELD_GET(RINGCTRL_SIZE_MASK, ringctrl) *
+			 RINGCTRL_SIZE_MULT;
+
+	if (ndev->log.size == 0) {
+		dev_info(ndev->dev, "Firmware logging is disabled\n");
+		return;
+	}
+
+	/* If size didn't change, keep using the old buffer */
+	if (old_size == ndev->log.size)
+		return;
+
+	devm_kfree(ndev->dev, ndev->log.buf);
+	ndev->log.buf = devm_kmalloc(ndev->dev, ndev->log.size, GFP_KERNEL);
+	if (!ndev->log.buf) {
+		ndev->log.size = 0;
+		dev_warn(ndev->dev, "Failed to allocate log buffer, logging is disabled\n");
+	}
+}
+
+/* Read up to count bytes from device log into local buffer */
+void neutron_read_log(struct neutron_device *ndev, size_t count)
+{
+	size_t bytes, remaining;
+	u32 head, tail;
+
+	ndev->log.buf_count = 0;
+
+	if (!(ndev->flags & NEUTRON_BOOTED) || !ndev->log.size)
+		return;
+
+	tail = readl_relaxed(NEUTRON_REG(ndev, TAIL));
+	head = readl_relaxed(NEUTRON_REG(ndev, HEAD));
+
+	if (tail == head)
+		return;
+
+	/* Read from head to end of buffer or tail */
+	bytes = (head < tail) ? (tail - head) : (ndev->log.size - head);
+	bytes = min(count, bytes);
+	memcpy_fromio(ndev->log.buf, ndev->log.base + head, bytes);
+	ndev->log.buf_count = bytes;
+
+	/* Read from start of buffer, if it wraps around */
+	if (head > tail && bytes < count) {
+		remaining = min(count - bytes, tail);
+		memcpy_fromio(ndev->log.buf + bytes, ndev->log.base, remaining);
+		ndev->log.buf_count += remaining;
+	}
+
+	head = (head + ndev->log.buf_count) % ndev->log.size;
+	writel_relaxed(head, NEUTRON_REG(ndev, HEAD));
+}
+
 static void __iomem *neutron_tcm_da_to_va(struct neutron_device *ndev, u64 da)
 {
 	struct neutron_mem_region *mem;
@@ -158,6 +222,8 @@ int neutron_boot(struct neutron_device *ndev)
 	/* Prepare device to receive jobs */
 	neutron_mbox_reset_state(ndev);
 
+	neutron_init_logging(ndev);
+
 	ndev->flags |= NEUTRON_BOOTED;
 
 	return 0;
@@ -165,6 +231,9 @@ int neutron_boot(struct neutron_device *ndev)
 
 void neutron_shutdown(struct neutron_device *ndev)
 {
+	/* Device log becomes unavailable after shutdown, save it */
+	neutron_read_log(ndev, ndev->log.size);
+
 	neutron_stop(ndev);
 	ndev->flags &= ~NEUTRON_BOOTED;
 }
diff --git a/drivers/accel/neutron/neutron_device.h b/drivers/accel/neutron/neutron_device.h
index 0ed72965774d..bf06878ac370 100644
--- a/drivers/accel/neutron/neutron_device.h
+++ b/drivers/accel/neutron/neutron_device.h
@@ -85,11 +85,26 @@ enum neutron_mem_id {
 	NEUTRON_MEM_MAX
 };
 
+/**
+ * struct neutron_log - Neutron log buffer descriptor
+ * @base: base address of the log buffer in device memory
+ * @size: Size of the log buffer
+ * @buf: Kernel buffer for log data
+ * @buf_count: Number of bytes available in the kernel buffer
+ */
+struct neutron_log {
+	void __iomem *base;
+	size_t size;
+	void *buf;
+	size_t buf_count;
+};
+
 /**
  * struct neutron_device - Neutron device structure
  * @base: Base DRM device
  * @dev: Pointer to underlying device
  * @mem_regions: Array of memory region descriptors
+ * @log: Log buffer descriptor
  * @irq: IRQ number
  * @clks: Neutron clocks
  * @num_clks: Number of clocks
@@ -107,6 +122,7 @@ struct neutron_device {
 	struct device *dev;
 
 	struct neutron_mem_region mem_regions[NEUTRON_MEM_MAX];
+	struct neutron_log log;
 
 	int irq;
 	struct clk_bulk_data *clks;
@@ -137,5 +153,6 @@ void neutron_shutdown(struct neutron_device *ndev);
 void neutron_enable_irq(struct neutron_device *ndev);
 void neutron_disable_irq(struct neutron_device *ndev);
 void neutron_handle_irq(struct neutron_device *ndev);
+void neutron_read_log(struct neutron_device *ndev, size_t bytes);
 
 #endif /* __NEUTRON_DEVICE_H__ */
diff --git a/drivers/accel/neutron/neutron_driver.c b/drivers/accel/neutron/neutron_driver.c
index ceae1f7e8359..14b4bc3a79d1 100644
--- a/drivers/accel/neutron/neutron_driver.c
+++ b/drivers/accel/neutron/neutron_driver.c
@@ -18,6 +18,7 @@
 
 #include "neutron_device.h"
 #include "neutron_driver.h"
+#include "neutron_debugfs.h"
 #include "neutron_gem.h"
 #include "neutron_job.h"
 
@@ -168,6 +169,8 @@ static int neutron_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_reserved;
 
+	neutron_debugfs_init(ndev);
+
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		goto free_job;

-- 
2.34.1

