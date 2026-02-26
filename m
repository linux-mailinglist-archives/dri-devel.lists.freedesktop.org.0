Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAqHBfnFoGnImQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 23:15:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFD31B03E2
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 23:15:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED5E10EA03;
	Thu, 26 Feb 2026 22:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.b="IH5UgA8r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9857C10E046
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 20:41:04 +0000 (UTC)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 61QGTBp63090278;
 Thu, 26 Feb 2026 12:23:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=s2048-2025-q2;
 bh=30cmGsfadDddfi+TV1dmEOO+sq6Mvzs/Yd6JYj3bT/4=; b=IH5UgA8rqx3J
 yG7UieTmc7KAzhfYG4KCzIrN5olHnXELliNLCEeVF6THHPFwsuLDZWaVJSnwWVMO
 e7fADPyvLa2dx9YLFQHPt69B+8oGFf5SfsRWJRTw8yNl+Bri3dkeu4HlQAL8VXuT
 dxQGWZY9MwOa4E51mzCZ9a2STkX5RtLCFpOdPwCLIK8wNW744+F9zcVPqAyk/OKE
 t6ReuBpJtUy05XLpe96Sm9+PljCabuWbUT0kCEtWIGvbBOsanTevbxXsi1FEdN9d
 8uCDnkKKqHuZ+5vY0IwXcw+SDvzzC81Wh4gSN87CEHNTQ4TzxabeLgbCQZxlsJkL
 O+yDRoeVKQ==
Received: from maileast.thefacebook.com ([163.114.135.16])
 by m0001303.ppops.net (PPS) with ESMTPS id 4cjsr4jsd4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 26 Feb 2026 12:22:59 -0800 (PST)
Received: from localhost (2620:10d:c0a8:1b::30) by mail.thefacebook.com
 (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.35; Thu, 26 Feb
 2026 20:22:58 +0000
From: Matt Evans <mattev@meta.com>
To: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>,
 Mahmoud Adam <mngyadam@amazon.de>, David Matlack <dmatlack@google.com>
CC: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>,
 Kevin Tian <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>,
 Pranjal Shrivastava <praan@google.com>, Alistair Popple
 <apopple@nvidia.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <kvm@vger.kernel.org>
Subject: [RFC PATCH 7/7] [RFC ONLY] selftests: vfio: Add standalone
 vfio_dmabuf_mmap_test
Date: Thu, 26 Feb 2026 12:22:03 -0800
Message-ID: <20260226202211.929005-8-mattev@meta.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260226202211.929005-1-mattev@meta.com>
References: <20260226202211.929005-1-mattev@meta.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2620:10d:c0a8:1b::30]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE4NiBTYWx0ZWRfX95vCTs1KcWNK
 jLzTP04M3+H+relHno8sjNGvCxamPInlF/yccBiSgSHfDQJIzaZoWUs+Y7zUh948Wsv5fXhRqpx
 ZyJ+PEfd2eU3q2clkBDMSbsqEZMkUUD/PyjRuKXDFGynXw++gpgflYuRmaIT+eXFBnkGLSfqNMV
 stGv5HwHt0vwdcQmx5JHsgau0wSE2Uj7CL5L30Rg5CtnLtTNahocFJ6dRTiLxhSjlCFaS2DRmmV
 qYKyOs2M/dHQ/9CeOlJ7+mxKbxsJ/y5K6WM1FklQKmZq2291v/U0yT6gBExrmywB1i+3tJQrdan
 2GpRN1A3nZ/zep9UDTY8x/Hv5RYjcBZopkxhmofJHFiESsHTVwCWNlf7kw/NXuNMX6x9CORu1ep
 NJ8U5YQazexMEmIkzTioiEBQq+cf/Sp+oMSZwMBwsnkIAIU0uB2DbamPmePTlBpS7NjUPl3Z8Qz
 q4yzJIAhtSY2U1gLByQ==
X-Authority-Analysis: v=2.4 cv=daeNHHXe c=1 sm=1 tr=0 ts=69a0aba4 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VabnemYjAAAA:8 a=jgVWRkJC2vtQ8RevbvwA:9
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-GUID: CPOa9ihGe5gJqTztl1YxoiUyNX9Wxpeb
X-Proofpoint-ORIG-GUID: CPOa9ihGe5gJqTztl1YxoiUyNX9Wxpeb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_02,2026-02-26_01,2025-10-01_01
X-Mailman-Approved-At: Thu, 26 Feb 2026 22:15:13 +0000
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:praan@google.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[mattev@meta.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mattev@meta.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[meta.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.989];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7FFD31B03E2
X-Rspamd-Action: no action

This test exercises VFIO DMABUF mmap() to userspace, including various
revocation/shutdown cases (which make the VMA inacessible).

This is a TEMPORARY test, just to illustrate a new UAPI and
DMABUF/mmap() usage.  Since it originates from out-of-tree code, it
duplicates some of the VFIO device setup code in
.../selftests/vfio/lib.  Instead, the tests should be folded into the
existing VFIO tests.

Signed-off-by: Matt Evans <mattev@meta.com>
---
 tools/testing/selftests/vfio/Makefile         |   1 +
 .../vfio/standalone/vfio_dmabuf_mmap_test.c   | 822 ++++++++++++++++++
 2 files changed, 823 insertions(+)
 create mode 100644 tools/testing/selftests/vfio/standalone/vfio_dmabuf_mmap_test.c

diff --git a/tools/testing/selftests/vfio/Makefile b/tools/testing/selftests/vfio/Makefile
index 3c796ca99a50..3382a2617f2d 100644
--- a/tools/testing/selftests/vfio/Makefile
+++ b/tools/testing/selftests/vfio/Makefile
@@ -4,6 +4,7 @@ TEST_GEN_PROGS += vfio_iommufd_setup_test
 TEST_GEN_PROGS += vfio_pci_device_test
 TEST_GEN_PROGS += vfio_pci_device_init_perf_test
 TEST_GEN_PROGS += vfio_pci_driver_test
+TEST_GEN_PROGS += standalone/vfio_dmabuf_mmap_test
 
 TEST_FILES += scripts/cleanup.sh
 TEST_FILES += scripts/lib.sh
diff --git a/tools/testing/selftests/vfio/standalone/vfio_dmabuf_mmap_test.c b/tools/testing/selftests/vfio/standalone/vfio_dmabuf_mmap_test.c
new file mode 100644
index 000000000000..450d6e883bb0
--- /dev/null
+++ b/tools/testing/selftests/vfio/standalone/vfio_dmabuf_mmap_test.c
@@ -0,0 +1,822 @@
+/*
+ * Tests for VFIO DMABUF userspace mmap()
+ *
+ * As well as the basics (mmap() a BAR resource to userspace), test
+ * shutdown/unmapping, aliasing, and DMABUF revocation scenarios.
+ *
+ * This test relies on being attached to a QEMU EDU device (for a
+ * simple known MMIO layout).  Example invocation, assuming function
+ * 0000:00:03.0 is the target:
+ *
+ *  # lspci -n -s 00:03.0
+ *  00:03.0 00ff: 1234:11e8 (rev 10)
+ *
+ *  # readlink /sys/bus/pci/devices/0000\:00\:03.0/iommu_group
+ *  ../../../../../kernel/iommu_groups/3
+ *
+ *  (if there's a driver already attached)
+ *  # echo 0000:00:03.0 > /sys/bus/pci/devices/0000:00:03.0/driver/unbind
+ *
+ *  (and, might need)
+ *  # echo 1 > /sys/module/vfio_iommu_type1/parameters/allow_unsafe_interrupts
+ *
+ *  Attach to VFIO:
+ *  # echo 1234 11e8 > /sys/bus/pci/drivers/vfio-pci/new_id
+ *
+ *  There should be only one thing in the group:
+ *  # ls /sys/bus/pci/devices/0000:00:03.0/iommu_group/devices
+ *
+ *  Then given above an invocation would be:
+ *  # this_test -r 0000:00:03.0 -g 3
+ *
+ * However, note the QEMU EDU device has a very small address span of
+ * useful things in BAR0, which makes testing a non-zero BAR offset
+ * impossible.  An "extended EDU" device is supported, which just
+ * presents a large chunk of memory as a second BAR resource: this
+ * allows non-zero BAR offsets to be tested.  See below for a QEMU
+ * diff...
+ *
+ * Copyright (c) Meta Platforms, Inc. and affiliates.
+ *
+ * This software may be used and distributed according to the terms of the
+ * GNU General Public License version 2.
+ */
+
+/*
+diff --git a/hw/misc/edu.c b/hw/misc/edu.c
+index cece633e11..5f119e0642 100644
+--- a/hw/misc/edu.c
++++ b/hw/misc/edu.c
+@@ -47,6 +47,7 @@ DECLARE_INSTANCE_CHECKER(EduState, EDU,
+ struct EduState {
+     PCIDevice pdev;
+     MemoryRegion mmio;
++    MemoryRegion ram;
+ 
+     QemuThread thread;
+     QemuMutex thr_mutex;
+@@ -386,7 +387,12 @@ static void pci_edu_realize(PCIDevice *pdev, Error **errp)
+ 
+     memory_region_init_io(&edu->mmio, OBJECT(edu), &edu_mmio_ops, edu,
+                     "edu-mmio", 1 * MiB);
++    memory_region_init_ram(&edu->ram, OBJECT(edu), "edu-ram", 64 * MiB, &error_fatal);
+     pci_register_bar(pdev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &edu->mmio);
++    pci_register_bar(pdev, 1,
++                     PCI_BASE_ADDRESS_SPACE_MEMORY |
++                    PCI_BASE_ADDRESS_MEM_PREFETCH |
++                    PCI_BASE_ADDRESS_MEM_TYPE_64, &edu->ram);
+ }
+ 
+ static void pci_edu_uninit(PCIDevice *pdev)
+*/
+
+#include <errno.h>
+#include <inttypes.h>
+#include <fcntl.h>
+#include <limits.h>
+#include <linux/dma-buf.h>
+#include <linux/vfio.h>
+#include <setjmp.h>
+#include <signal.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <unistd.h>
+
+#define ROUND_UP(x, to) (((x) + (to) - 1) & ~((to) - 1))
+#define MiB(x)		((x) * 1024ULL * 1024)
+
+#define EDU_REG_MAGIC	0x00
+#define EDU_MAGIC_VAL	0x010000edu
+#define EDU_REG_INVERT	0x04
+
+#define FAIL_IF(cond, msg...)                  \
+	do {                                   \
+		if (cond) {                    \
+			printf("\n\nFAIL:\t"); \
+			printf(msg);           \
+			exit(1);               \
+		}                              \
+	} while (0)
+
+static int vfio_setup(int groupnr, char *rid_str,
+		      struct vfio_region_info *out_mappable_regions,
+		      int nr_regions, int *out_nr_regions, int *out_vfio_cfd,
+		      int *out_vfio_devfd)
+{
+	/* Create a new container, add group to it, open device, read
+	 * resource, reset, etc.  Based on the example code in
+	 * Documentation/driver-api/vfio.rst
+	 */
+
+	int container = open("/dev/vfio/vfio", O_RDWR);
+
+	int r = ioctl(container, VFIO_GET_API_VERSION);
+
+	if (r != VFIO_API_VERSION) {
+		/* Unknown API version */
+		printf("-E- Unknown API ver %d\n", r);
+		return 1;
+	}
+
+	if (ioctl(container, VFIO_CHECK_EXTENSION, VFIO_TYPE1_IOMMU) != 1) {
+		printf("-E- Doesn't support type 1\n");
+		return 1;
+	}
+
+	char devpath[PATH_MAX];
+
+	snprintf(devpath, PATH_MAX - 1, "/dev/vfio/%d", groupnr);
+	/* Open the group */
+	int group = open(devpath, O_RDWR);
+
+	if (group < 0) {
+		printf("-E- Can't open VFIO device (group %d)\n", groupnr);
+		return 1;
+	}
+
+	/* Test the group is viable and available */
+	struct vfio_group_status group_status = { .argsz = sizeof(
+							  group_status) };
+
+	if (ioctl(group, VFIO_GROUP_GET_STATUS, &group_status)) {
+		perror("-E- Can't get group status");
+		return 1;
+	}
+
+	if (!(group_status.flags & VFIO_GROUP_FLAGS_VIABLE)) {
+		/* Group is not viable (ie, not all devices bound for vfio) */
+		printf("-E- Group %d is not viable!\n", groupnr);
+		return 1;
+	}
+
+	/* Add the group to the container */
+	if (ioctl(group, VFIO_GROUP_SET_CONTAINER, &container)) {
+		perror("-E- Can't add group to container");
+		return 1;
+	}
+
+	/* Enable the IOMMU model we want */
+	if (ioctl(container, VFIO_SET_IOMMU, VFIO_TYPE1_IOMMU)) {
+		perror("-E- Can't select T1");
+		return 1;
+	}
+
+	/* Get addition IOMMU info */
+	struct vfio_iommu_type1_info iommu_info = { .argsz = sizeof(
+							    iommu_info) };
+
+	if (ioctl(container, VFIO_IOMMU_GET_INFO, &iommu_info)) {
+		perror("-E- Can't get VFIO info");
+		return 1;
+	}
+
+	/* Get a file descriptor for the device */
+	int device = ioctl(group, VFIO_GROUP_GET_DEVICE_FD, rid_str);
+
+	if (device < 0) {
+		perror("-E- Can't get device fd");
+		return 1;
+	}
+	close(group);
+
+	/* Test and setup the device */
+	struct vfio_device_info device_info = { .argsz = sizeof(device_info) };
+
+	if (ioctl(device, VFIO_DEVICE_GET_INFO, &device_info)) {
+		perror("-E- Can't get device info");
+		return 1;
+	}
+	printf("-i- %d device regions, flags 0x%x\n", device_info.num_regions,
+	       device_info.flags);
+
+	/* Regions are BAR0-5 then ROM, config, VGA */
+	int out_region = 0;
+
+	for (int i = 0; i < device_info.num_regions; i++) {
+		struct vfio_region_info reg = { .argsz = sizeof(reg) };
+
+		reg.index = i;
+
+		if (ioctl(device, VFIO_DEVICE_GET_REGION_INFO, &reg)) {
+			/* We expect EINVAL if there's no VGA region */
+			printf("-W- Region %d: ERROR %d\n", i, errno);
+		} else {
+			printf("-i- Region %d: flags 0x%08x (%c%c%c), cap_offs %d, size 0x%llx, offs 0x%llx\n",
+			       i, reg.flags,
+			       (reg.flags & VFIO_REGION_INFO_FLAG_READ) ? 'R' :
+									  '-',
+			       (reg.flags & VFIO_REGION_INFO_FLAG_WRITE) ? 'W' :
+									   '-',
+			       (reg.flags & VFIO_REGION_INFO_FLAG_MMAP) ? 'M' :
+									  '-',
+			       reg.cap_offset, reg.size, reg.offset);
+
+			if ((reg.flags & VFIO_REGION_INFO_FLAG_MMAP) &&
+			    (out_region < nr_regions))
+				out_mappable_regions[out_region++] = reg;
+		}
+	}
+	*out_nr_regions = out_region;
+
+#ifdef THERE_ARE_NO_IRQS_YET
+	for (i = 0; i < device_info.num_irqs; i++) {
+		struct vfio_irq_info irq = { .argsz = sizeof(irq) };
+
+		irq.index = i;
+
+		ioctl(device, VFIO_DEVICE_GET_IRQ_INFO, &irq);
+
+		/* Setup IRQs... eventfds, VFIO_DEVICE_SET_IRQS */
+	}
+#endif
+	/* Gratuitous device reset and go... */
+	if (ioctl(device, VFIO_DEVICE_RESET))
+		perror("-W- Can't reset device (continuing)");
+
+	*out_vfio_cfd = container;
+	*out_vfio_devfd = device;
+
+	return 0;
+}
+
+static int vfio_feature_present(int dev_fd, uint32_t feature)
+{
+	struct vfio_device_feature probeftr = {
+		.argsz = sizeof(probeftr),
+		.flags = VFIO_DEVICE_FEATURE_PROBE | VFIO_DEVICE_FEATURE_GET |
+			 feature,
+	};
+	return ioctl(dev_fd, VFIO_DEVICE_FEATURE, &probeftr) == 0;
+}
+
+static int vfio_create_dmabuf(int dev_fd, uint32_t region, uint64_t offset,
+			      uint64_t length)
+{
+	uint64_t ftrbuf
+		[ROUND_UP(sizeof(struct vfio_device_feature) +
+				  sizeof(struct vfio_device_feature_dma_buf) +
+				  sizeof(struct vfio_region_dma_range),
+			  8) /
+		 8];
+
+	struct vfio_device_feature *f = (struct vfio_device_feature *)ftrbuf;
+	struct vfio_device_feature_dma_buf *db =
+		(struct vfio_device_feature_dma_buf *)f->data;
+	struct vfio_region_dma_range *range =
+		(struct vfio_region_dma_range *)db->dma_ranges;
+
+	f->argsz = sizeof(ftrbuf);
+	f->flags = VFIO_DEVICE_FEATURE_GET | VFIO_DEVICE_FEATURE_DMA_BUF;
+	db->region_index = region;
+	db->open_flags = O_RDWR | O_CLOEXEC;
+	db->flags = 0;
+	db->nr_ranges = 1;
+	range->offset = offset;
+	range->length = length;
+
+	return ioctl(dev_fd, VFIO_DEVICE_FEATURE, &ftrbuf);
+}
+
+/* As above, but try multiple ranges in one dmabuf */
+static int vfio_create_dmabuf_dual(int dev_fd, uint32_t region,
+				   uint64_t offset0, uint64_t length0,
+				   uint64_t offset1, uint64_t length1)
+{
+	uint64_t ftrbuf
+		[ROUND_UP(sizeof(struct vfio_device_feature) +
+				  sizeof(struct vfio_device_feature_dma_buf) +
+				  (sizeof(struct vfio_region_dma_range) * 2),
+			  8) /
+		 8];
+
+	struct vfio_device_feature *f = (struct vfio_device_feature *)ftrbuf;
+	struct vfio_device_feature_dma_buf *db =
+		(struct vfio_device_feature_dma_buf *)f->data;
+	struct vfio_region_dma_range *range =
+		(struct vfio_region_dma_range *)db->dma_ranges;
+
+	f->argsz = sizeof(ftrbuf);
+	f->flags = VFIO_DEVICE_FEATURE_GET | VFIO_DEVICE_FEATURE_DMA_BUF;
+	db->region_index = region;
+	db->open_flags = O_RDWR | O_CLOEXEC;
+	db->flags = 0;
+	db->nr_ranges = 2;
+	range[0].offset = offset0;
+	range[0].length = length0;
+	range[1].offset = offset1;
+	range[1].length = length1;
+
+	return ioctl(dev_fd, VFIO_DEVICE_FEATURE, &ftrbuf);
+}
+
+static volatile uint32_t *mmap_resource_aligned(size_t size,
+						unsigned long align, int fd,
+						unsigned long offset)
+{
+	void *v;
+
+	if (align <= getpagesize()) {
+		v = mmap(0, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd,
+			 offset);
+		FAIL_IF(v == MAP_FAILED,
+			"Can't mmap fd %d (size 0x%lx, offset 0x%lx), %d\n", fd,
+			size, offset, errno);
+	} else {
+		size_t resv_size = size + align;
+		void *resv =
+			mmap(0, resv_size, 0, MAP_PRIVATE | MAP_ANON, -1, 0);
+		FAIL_IF(resv == MAP_FAILED,
+			"Can't mmap reservation, size 0x%lx, %d\n", resv_size,
+			errno);
+
+		uintptr_t pos = ((uintptr_t)resv + (align - 1)) & ~(align - 1);
+
+		v = mmap((void *)pos, size, PROT_READ | PROT_WRITE,
+			 MAP_SHARED | MAP_FIXED, fd, offset);
+		FAIL_IF(v == MAP_FAILED,
+			"Can't mmap-fixed fd %d (size 0x%lx, offset 0x%lx), %d\n",
+			fd, size, offset, errno);
+		madvise((void *)v, size, MADV_HUGEPAGE);
+
+		/* Tidy */
+		if (pos > (uintptr_t)resv)
+			munmap(resv, pos - (uintptr_t)resv);
+		if (pos + size < (uintptr_t)resv + resv_size)
+			munmap((void *)pos + size,
+			       (uintptr_t)resv + resv_size - (pos + size));
+	}
+
+	return (volatile uint32_t *)v;
+}
+
+static volatile uint32_t *mmap_resource(size_t size, int fd,
+					unsigned long offset)
+{
+	return mmap_resource_aligned(size, getpagesize(), fd, offset);
+}
+
+static void check_mmio(volatile uint32_t *base)
+{
+	static uint32_t magic = 0xdeadbeef;
+	uint32_t v;
+
+	printf("-i- MMIO check: ");
+
+	/* Trivial MMIO */
+	v = base[EDU_REG_MAGIC / 4];
+	FAIL_IF(v != EDU_MAGIC_VAL,
+		"Magic value %08x incorrect, BAR map bad?\n", v);
+
+	base[EDU_REG_INVERT / 4] = magic;
+	v = base[EDU_REG_INVERT / 4];
+	FAIL_IF(v != ~magic, "Inverterizer value %08x bad (should be %08x)\n",
+		v, ~magic);
+	printf("OK\n");
+
+	magic = (magic << 1) ^ (magic >> 1) ^ (magic << 7);
+}
+
+static jmp_buf jmpbuf;
+
+static void sighandler(int sig)
+{
+	printf("*** Signal %d ***\n", sig);
+	siglongjmp(jmpbuf, sig);
+}
+
+static void setup_signals(void)
+{
+	struct sigaction sa = {
+		.sa_handler = sighandler,
+		.sa_flags = 0,
+	};
+
+	sigaction(SIGBUS, &sa, NULL);
+}
+
+static int vfio_dmabuf_test(int groupnr, char *rid_str)
+{
+	/* Only expecting one or two regions */
+	struct vfio_region_info bar_region[2];
+	int num_regions = 0;
+	int container_fd, dev_fd;
+	int r = vfio_setup(groupnr, rid_str, &bar_region[0], 2, &num_regions,
+			   &container_fd, &dev_fd);
+
+	FAIL_IF(r, "VFIO setup failed\n");
+	FAIL_IF(!vfio_feature_present(dev_fd, VFIO_DEVICE_FEATURE_DMA_BUF),
+		"VFIO DMABUF support not available\n");
+
+	printf("-i- Container fd %d, device fd %d, and got DMA_BUF\n",
+	       container_fd, dev_fd);
+
+	setup_signals();
+
+	////////////////////////////////////////////////////////////////////////////////
+
+	/* Real basics:	 create DMABUF, and mmap it, and access MMIO through it.
+	 * Do this for 2nd BAR if present, too (just plain memory).
+	 */
+	printf("\nTEST: Create DMABUF, map it\n");
+	int bar_db_fd = vfio_create_dmabuf(dev_fd, /* region */ 0,
+					   /* offset */ 0, bar_region[0].size);
+	FAIL_IF(bar_db_fd < 0, "Can't create DMABUF, %d\n", errno);
+
+	volatile uint32_t *dbbar0 =
+		mmap_resource(bar_region[0].size, bar_db_fd, 0);
+
+	printf("-i- Mapped DMABUF BAR0 at %p+0x%llx\n", dbbar0,
+	       bar_region[0].size);
+	check_mmio(dbbar0);
+
+	/* TEST: Map the traditional VFIO one _second_; it should still work. */
+	printf("\nTEST: Map the regular VFIO BAR\n");
+	volatile uint32_t *vfiobar =
+		mmap_resource(bar_region[0].size, dev_fd, bar_region[0].offset);
+
+	printf("-i- Mapped VIRTIO BAR0 at %p+0x%llx\n", vfiobar,
+	       bar_region[0].size);
+	check_mmio(vfiobar);
+
+	/* Test plan:
+	 *
+	 * - Revoke the first DMABUF, check for fault
+	 * - Check VFIO BAR access still works
+	 * - Revoke first DMABUF fd again: -EBADFD
+	 * - create new DMABUF for same (previously-revoked) region: accessible
+	 *
+	 * - Create overlapping DMABUFs: map success, maps alias OK
+	 * - Create a second mapping of the second DMABUF, maps alias OK
+	 * - Destroy one by revoking through a dup()ed fd: check mapping revoked
+	 * - Check original is still accessible
+	 *
+	 * If we have a larger (>4K of accessible stuff!) second BAR resource:
+	 * - Map it, create an overlapping alias with offset != 0
+	 * - Check alias/offset is sane
+	 *
+	 * Last:
+	 * - close container_fd and dev_fd: check DMABUF mapping revoked
+	 * - try revoking that dmabuf_fd: -ENODEV
+	 */
+
+	printf("\nTEST: Revocation of first DMABUF\n");
+	r = ioctl(bar_db_fd, DMA_BUF_IOCTL_REVOKE);
+	FAIL_IF(r != 0, "Can't revoke: %d\n", r);
+
+	if (sigsetjmp(jmpbuf, 1) == 0) {
+		// Try an access: expect BOOM
+		check_mmio(dbbar0);
+		FAIL_IF(true, "Expecting fault after revoke!\n");
+	}
+	printf("-i- Revoked OK\n");
+
+	printf("\nTEST: Access through VFIO-mapped region still works\n");
+	if (sigsetjmp(jmpbuf, 1) == 0)
+		check_mmio(vfiobar);
+	else
+		FAIL_IF(true, "Expecting VFIO-mapped BAR to still work!\n");
+
+	printf("\nTEST: Double-revoke\n");
+	r = ioctl(bar_db_fd, DMA_BUF_IOCTL_REVOKE);
+	FAIL_IF(r != -1 || errno != EBADFD,
+		"Expecting 2nd revoke to give EBADFD, got %d errno %d\n", r,
+		errno);
+	printf("-i- Correctly failed second revoke\n");
+
+	printf("\nTEST: Can't mmap() revoked DMABUF\n");
+	void *dbfail = mmap(0, bar_region[1].size, PROT_READ | PROT_WRITE,
+			    MAP_SHARED, bar_db_fd, 0);
+	FAIL_IF(dbfail != MAP_FAILED, "mmap() should fail\n");
+	printf("-i- OK\n");
+
+	printf("\nTEST: Recreate new DMABUF for previously-revoked region\n");
+	int bar_db_fd_2 = vfio_create_dmabuf(
+		dev_fd, /* region */ 0, /* offset */ 0, bar_region[0].size);
+	FAIL_IF(bar_db_fd_2 < 0, "Can't create DMABUF, %d\n", errno);
+
+	volatile uint32_t *dbbar0_2 =
+		mmap_resource(bar_region[0].size, bar_db_fd_2, 0);
+
+	printf("-i- Mapped 2nd DMABUF BAR0 at %p+0x%llx\n", dbbar0_2,
+	       bar_region[0].size);
+	check_mmio(dbbar0_2);
+
+	munmap((void *)dbbar0, bar_region[0].size);
+	close(bar_db_fd);
+
+	printf("\nTEST: Create aliasing/overlapping DMABUF\n");
+	int bar_db_fd_3 = vfio_create_dmabuf(
+		dev_fd, /* region */ 0, /* offset */ 0, bar_region[0].size);
+	FAIL_IF(bar_db_fd_3 < 0, "Can't create DMABUF, %d\n", errno);
+
+	volatile uint32_t *dbbar0_3 =
+		mmap_resource(bar_region[0].size, bar_db_fd_3, 0);
+
+	printf("-i- Mapped 3rd DMABUF BAR0 at %p+0x%llx\n", dbbar0_3,
+	       bar_region[0].size);
+	check_mmio(dbbar0_3);
+
+	/* Basic aliasing check: Write value through 2nd, read back through 3rd */
+	uint32_t v;
+
+	dbbar0_2[EDU_REG_INVERT / 4] = 0xfacecace;
+	v = dbbar0_3[EDU_REG_INVERT / 4];
+	FAIL_IF(v != ~0xfacecace,
+		"Alias inverted MMIO value %08x bad (should be %08x)\n", v,
+		~0xfacecace);
+	printf("-i- Aliasing DMABUF OK\n");
+
+	printf("\nTEST: Create a double-mapping of DMABUF\n");
+	/* Create another mmap of the existing aliasing DMABUF fd */
+	volatile uint32_t *dbbar0_3_2 =
+		mmap_resource(bar_region[0].size, bar_db_fd_3, 0);
+
+	printf("-i- Mapped 3rd DMABUF BAR0 _again_ at %p+0x%llx\n", dbbar0_3_2,
+	       bar_region[0].size);
+	/* Can we see the value we wrote before? */
+	v = dbbar0_3_2[EDU_REG_INVERT / 4];
+	FAIL_IF(v != ~0xfacecace,
+		"Alias alias inverted MMIO value %08x bad (should be %08x)\n",
+		v, ~0xfacecace);
+	check_mmio(dbbar0_3_2);
+
+	printf("\nTEST: revoke aliasing DMABUF through dup()ed fd\n");
+	int dup_dbfd3 = dup(bar_db_fd_3);
+
+	r = ioctl(dup_dbfd3, DMA_BUF_IOCTL_REVOKE);
+	FAIL_IF(r != 0, "Can't revoke: %d\n", r);
+
+	/* Both of the mmap()s made should now be gone */
+	if (sigsetjmp(jmpbuf, 1) == 0) {
+		check_mmio(dbbar0_3);
+		FAIL_IF(true, "Expecting fault on 1st mmap after revoke!\n");
+	}
+
+	if (sigsetjmp(jmpbuf, 1) == 0) {
+		check_mmio(dbbar0_3_2);
+		FAIL_IF(true, "Expecting fault on 2nd mmap after revoke!\n");
+	}
+	printf("-i- Both aliasing DMABUF mappings revoked OK\n");
+
+	close(dup_dbfd3);
+	close(bar_db_fd_3);
+	munmap((void *)dbbar0_3, bar_region[0].size);
+	munmap((void *)dbbar0_3_2, bar_region[0].size);
+
+	/* And finally, although the aliasing DMABUF is gone, access
+	 * through the original one should still work:
+	 */
+	if (sigsetjmp(jmpbuf, 1) == 0)
+		check_mmio(dbbar0_2);
+	else
+		FAIL_IF(true,
+			"Expecting original DMABUF mapping to still work!\n");
+	printf("-i- Aliasing DMABUF removal OK, original still accessible\n");
+
+	/* If we're attached to a hacked/extended QEMU EDU device with
+	 * a large memory region 1 then we can test things like
+	 * offsets/aliasing.
+	 */
+	if (num_regions >= 2) {
+		printf("\nTEST: Second BAR: test overlapping+offset DMABUF\n");
+
+		printf("-i- Region 1 DMABUF: offset %llx, size %llx\n",
+		       bar_region[1].offset, bar_region[1].size);
+		int bar1_db_fd =
+			vfio_create_dmabuf(dev_fd, 1, 0, bar_region[1].size);
+
+		FAIL_IF(bar1_db_fd < 0, "Can't create DMABUF, %d\n", errno);
+
+		volatile uint32_t *dbbar1 = mmap_resource_aligned(
+			bar_region[1].size, MiB(32), bar1_db_fd, 0);
+		printf("-i- Mapped DMABUF Region 1 at %p+0x%llx\n", dbbar1,
+		       bar_region[1].size);
+
+		/* Init with known values */
+		for (unsigned long i = 0; i < (bar_region[1].size);
+		     i += getpagesize())
+			dbbar1[i / 4] = 0xca77face ^ i;
+
+		v = dbbar1[0];
+		FAIL_IF(v != 0xca77face,
+			"DB Region 1 read: Magic value %08x incorrect\n", v);
+		printf("-i- DB Region 1 read: Magic: 0x%08x\n", v);
+
+		/* TEST: Overlap/aliasing; map same BAR with a range
+		 * offset > 0.  Also test disjoint/multi-range DMABUFs
+		 * by creating a second range.  This appears as one
+		 * contiguous VA range mapped to a first BAR range
+		 * (starting from range0_offset), then skipping a few
+		 * physical pages, then a second range (starting at
+		 * range1_offset).
+		 */
+		unsigned long range0_offset = getpagesize() * 3;
+		unsigned long range1_skip_pages = 5;
+		unsigned long range1_skip = getpagesize() * range1_skip_pages;
+		unsigned long range_size =
+			(bar_region[1].size - range0_offset - range1_skip) / 2;
+		unsigned long range1_offset =
+			range0_offset + range_size + range1_skip;
+		unsigned long map_size = range_size * 2;
+
+		printf("\nTEST: Second BAR aliasing mapping, two ranges size 0x%lx:\n\t\t0x%lx-0x%lx, 0x%lx-0x%lx\n",
+		       range_size, range0_offset, range0_offset + range_size,
+		       range1_offset, range1_offset + range_size);
+
+		int bar1_2_db_fd = vfio_create_dmabuf_dual(
+			dev_fd, 1, range0_offset, range_size, range1_offset,
+			range_size);
+		FAIL_IF(bar1_2_db_fd < 0, "Can't create DMABUF, %d\n", errno);
+
+		volatile uint32_t *dbbar1_2 =
+			mmap_resource(map_size, bar1_2_db_fd, 0);
+
+		printf("-i- Mapped DMABUF Region 1 alias at %p+0x%lx\n",
+		       dbbar1_2, map_size);
+		FAIL_IF(dbbar1_2[0] != dbbar1[range0_offset / 4],
+			"slice2 value mismatch\n");
+
+		dbbar1[(range0_offset + 4) / 4] = 0xfacef00d;
+		/* Check we can see the value written above at +offset
+		 * from offset 0 of this mapping (since the DMABUF
+		 * itself is offsetted):
+		 */
+		v = dbbar1_2[4 / 4];
+		FAIL_IF(v != 0xfacef00d,
+			"DB Region 1 alias read: Magic value %08x incorrect\n",
+			v);
+		printf("-i- DB Region 1 alias read: Magic 0x%08x, OK\n", v);
+
+		/* Read back the known values across the two
+		 * sub-ranges of the dbbar1_2 mapping, accounting for
+		 * the physical pages skipped between them
+		 */
+		for (unsigned long i = 0; i < range_size; i += getpagesize()) {
+			unsigned long t = i + range0_offset;
+			uint32_t want = (0xca77face ^ t);
+
+			v = dbbar1_2[i / 4];
+			FAIL_IF(v != want,
+				"Expected %08x (got %08x) from range0 +%08lx (real %08lx)\n",
+				want, v, i, t);
+		}
+		for (unsigned long i = range_size; i < (range_size * 2);
+		     i += getpagesize()) {
+			unsigned long t = i + range1_offset - range_size;
+			uint32_t want = (0xca77face ^ t);
+
+			v = dbbar1_2[i / 4];
+			FAIL_IF(v != want,
+				"Expected %08x (got %08x) from range1 +%08lx (real %08lx)\n",
+				want, v, i, t);
+		}
+
+		printf("\nTEST: Third BAR aliasing mapping, testing mmap() non-zero offset:\n");
+
+		unsigned long smaller = range_size - 0x1000;
+		volatile uint32_t *dbbar1_3 = mmap_resource_aligned(
+			smaller, MiB(32), bar1_2_db_fd, range_size);
+		printf("-i- Mapped DMABUF Region 1 range 1 alias at %p+0x%lx\n",
+		       dbbar1_3, smaller);
+
+		for (unsigned long i = 0; i < smaller; i += getpagesize()) {
+			unsigned long t = i + range1_offset;
+			uint32_t want = (0xca77face ^ t);
+
+			v = dbbar1_3[i / 4];
+			FAIL_IF(v != want,
+				"Expected %08x (got %08x) from 3rd range1 +%08lx (real %08lx)\n",
+				want, v, i, t);
+		}
+		printf("-i- mmap offset OK\n");
+
+		/* TODO: If we can observe hugepages (mechanically,
+		 * rather than human reading debug), we can test
+		 * interesting alignment cases for the PFN search:
+		 *
+		 * - Deny hugepages at start/end of an mmap() that
+		 *   starts/ends at non-HP-aligned addresses
+		 *   (e.g. first pages are small, middle is fully
+		 *   aligned in VA and PFN so 2M, and buffer finishes
+		 *   before 2M boundary, so last pages are small).
+		 *
+		 * - Everything aligned nicely except the mmap() size
+		 *   is <2MB, so hugepage denied due to straddling
+		 *   end.
+		 *
+		 * - Buffer offsets into BAR not aligned, so no huge
+		 *   mappings even if mmap() is perfectly aligned.
+		 */
+
+		/* Check that access after DMABUF fd close still works
+		 * (VMA still holds refcount, obvs!)
+		 */
+		close(bar1_2_db_fd);
+		if (sigsetjmp(jmpbuf, 1) == 0)
+			v = dbbar1_2[0x4 / 4];
+		else
+			FAIL_IF(true,
+				"Expecting original DMABUF mapping to still work!\n");
+		printf("-i- DB Region 1 alias read 2: Magic 0x%08x, OK\n", v);
+		printf("-i- Offset check OK\n");
+	}
+
+	printf("\nTEST: Shutdown: close VFIO container/device fds, check DMABUF gone\n");
+
+	/* Closing all uses of dev_fd (including the VFIO BAR mmap()!)
+	 * will revoke the DMABUF; even though the DMABUF fd might
+	 * remain open, the mapping itself is zapped. Start with a
+	 * plain close (before unmapping the VFIO BAR mapping):
+	 */
+	close(dev_fd);
+	close(container_fd);
+	printf("-i- VFIO fds closed\n");
+
+	if (sigsetjmp(jmpbuf, 1) == 0)
+		check_mmio(dbbar0_2);
+	else
+		FAIL_IF(true,
+			"Expecting DMABUF mapping to still work if VFIO mapping still live!\n");
+
+	munmap((void *)vfiobar, bar_region[0].size);
+	printf("-i- VFIO BAR unmapped\n");
+
+	/* The final reference via VFIO should now be gone, and the
+	 * DMABUF should now be destroyed.  The mapping of it should
+	 * be inaccessible:
+	 */
+	if (sigsetjmp(jmpbuf, 1) == 0) {
+		check_mmio(dbbar0_2);
+		FAIL_IF(true,
+			"Expecting DMABUF mapping to fault after VFIO fd shutdown!\n");
+	}
+	printf("-i- DMABUF mappings inaccessible\n");
+
+	/* Ensure we can't mmap() DMABUF for closed device */
+	void *dbfail2 = mmap(0, bar_region[1].size, PROT_READ | PROT_WRITE,
+			     MAP_SHARED, bar_db_fd_2, 0);
+	FAIL_IF(dbfail2 != MAP_FAILED, "mmap() should fail\n");
+	printf("-i- Can't mmap DMABUF for closed device, OK\n");
+
+	/* The DMABUF fd is still open though; try a revoke on it: */
+	r = ioctl(bar_db_fd_2, DMA_BUF_IOCTL_REVOKE);
+	FAIL_IF(r != -1 || errno != ENODEV,
+		"Expecting revoke after shutdown to give ENODEV, got %d errno %d\n",
+		r, errno);
+	printf("-i- Correctly failed final revoke\n");
+
+	munmap((void *)dbbar0_2, bar_region[0].size);
+	close(bar_db_fd_2);
+
+	printf("\nPASS\n");
+
+	return 0;
+}
+
+static void usage(char *me)
+{
+	printf("Usage:\t%s -g <group_number> -r <RID/BDF>\n"
+	       "\n"
+	       "\t\tGroup is found via device path, e.g. cat /sys/bus/pci/devices/0000:03:1d.0/iommu_group\n"
+	       "\t\tRID is of the form 0000:03:1d.0\n"
+	       "\n",
+	       me);
+}
+
+int main(int argc, char *argv[])
+{
+	/* Get args: IOMMU group and BDF/path */
+	int groupnr = -1;
+	char *rid_str = NULL;
+	int arg;
+
+	while ((arg = getopt(argc, argv, "g:r:h")) != -1) {
+		switch (arg) {
+		case 'g':
+			groupnr = atoi(optarg);
+			break;
+
+		case 'r':
+			rid_str = strdup(optarg);
+			break;
+		case 'h':
+		default:
+			usage(argv[0]);
+			return 1;
+		}
+	}
+
+	if (rid_str == NULL || groupnr == -1) {
+		usage(argv[0]);
+		return 1;
+	}
+
+	printf("-i- Using group number %d, RID '%s'\n", groupnr, rid_str);
+
+	return vfio_dmabuf_test(groupnr, rid_str);
+}
-- 
2.47.3

