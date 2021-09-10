Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D7F407226
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 21:54:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD166EA8B;
	Fri, 10 Sep 2021 19:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2083.outbound.protection.outlook.com [40.107.243.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1D66EA8B;
 Fri, 10 Sep 2021 19:54:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LsbqjGrmr0WmGXlJUqZhFd4avxfUtODh/Tjgp1IgVegwnpw3MUgQ3sJaGZkRMJYaBYkKriUWoYCOKgzcPxcHLa/m9cIO0AJXn7nq3qjU/QhuPVU+so6JfFQkmQkS9IwV+rJF6XapPSXqPqQurQtqAsedBO0ifpl5yQ2HPlVKN9reAFqnnq6rVO2bL1PW9kLH/CgKz7IPorO00eQhkYKx34bzijwfvXXh3EghGFMMMumVVksJmAh3KUEd4InJQwiBlUn7koOwOojje/y11dgTjLSMG1QYCVDRQi64+XtrgaOXEcNac4/C//mjqeEOgtH40ToxKF3rku/LQcTr2BOOJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=T1Bb4WFOmcf0X8YIfvYKIWdVS4PK0/1DWKvYFVulMnU=;
 b=Ga8+HPrYd54qef8w3/XrnIBZuWuU7SgGrZpN9Rw8nb7kHxGnTAa5h9+uNPcKXxORRWXAiI4waqr9mckh+qH3Bwe3eBTE9zMjGpUW5M3IRoradoX5trA7oadRDx3IQ6+r1j3SS41Eb0HgOm1443UajqSTFmD1GgKW1PS3mznPM2EIfuBjJ6IRqQ1slT0SaT7qUGDtwBT8EFqwya+Ya/lE35Gk+GWmzv25p/5W+h3P4poe6npYotOSj+AapzcHQ9dd/83VIj10HwD1J8knk4BS7f81s77BJ79vhrxqDCzPG47vCKNOYoxVNoxC0dO491HLKyLlKl08VGX8BaCIYaw6Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1Bb4WFOmcf0X8YIfvYKIWdVS4PK0/1DWKvYFVulMnU=;
 b=DnWX2SU7DB2oG5wnLQzUe+fergzm2kimd9pKHvroCbLHOdY8BSJJE8qdDk6ndQowhq8aooQ90HNT1vUYTZa9miBmPo6MEAzO8r3h+JUq9A7gfKfwas5oDF8D/roGL1rdr62WIlrcOc2g+RlxIcbnwKquaQTW1rURM2O2jenfh0I=
Received: from MWHPR11CA0002.namprd11.prod.outlook.com (2603:10b6:301:1::12)
 by BN8PR12MB3491.namprd12.prod.outlook.com (2603:10b6:408:41::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 19:54:14 +0000
Received: from CO1NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:1:cafe::9) by MWHPR11CA0002.outlook.office365.com
 (2603:10b6:301:1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Fri, 10 Sep 2021 19:54:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT053.mail.protection.outlook.com (10.13.175.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 19:54:13 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Fri, 10 Sep
 2021 14:54:12 -0500
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/1] drm/amdkfd: Add sysfs bitfields and enums to uAPI
Date: Fri, 10 Sep 2021 15:53:47 -0400
Message-ID: <20210910195347.2352884-1-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3625f05c-adc9-49f4-95d7-08d97494c3c6
X-MS-TrafficTypeDiagnostic: BN8PR12MB3491:
X-Microsoft-Antispam-PRVS: <BN8PR12MB34914DD818F0C19BEF89F13892D69@BN8PR12MB3491.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9otFpGgxbzLFZtTj1NTuTuBYap35Gh+GtF3q8bzPo7D6WkJWauw5o2JbXbEYrcn5bY+kPy+kF2kZrCDaMCrKGsx9etmbsC+yj8+6WdxbSDN/uazhuW5JMdrxJuXYSbpguhDRLqM9YBKzTTF32K0KtSO5RMktjE9RBf3oaQJoZuvgSoD1qHVOnFRaMdVzg6sqCdkA/01WqdbiUnILvpJfP0eWGrVzK1SouJQcwx1I4ZIlUhdgyH5x9R3iSRO4WUALjDXNoiWGvzRXhNVzRBeZWsVSaRMot72xgY3PAlAl8cXo5TYdRbuq/YywjWXDMzGcuYaAMohyHr/B8qCwqnlAlhqRCHVBAgDHjnInHN367f6z0v1XCw06EO6WE3vN3S0u4YhsxTdN126Vea7Lrl9guczCNGEPi5VtdrqhyMd+FXh7Zb360tzx/w7NTquCK4hzunFuWSkntyyMC3khVlCZn5DMdCCDmt1Y7meHizyAL3WhnQUb4LFaHL2XQCYeC7+dE4QOThW7pkVtQuOSpZZa4RV4+XnuKikhkhx4epquf+Fwxnp3vpNfydIoOuAfiHHMQyGZL+NkwD/9GBzVP6Jw7gMk0yD8rxiBWGF4BaRWt3x81kMGBlEyjr2oSQIxYzARREz1PSnSMrC0mejpZUMwF6oumNWK+9Xc6vto3ad+7yoz8W58qgvHKiDC/RgzUyeLwLRNTgyUp7HL1YQm8fCSXTBpMcAGvCthiOjrxh98e9Q=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(136003)(39860400002)(46966006)(36840700001)(336012)(7696005)(81166007)(110136005)(47076005)(356005)(450100002)(82310400003)(82740400003)(426003)(6666004)(316002)(478600001)(186003)(26005)(16526019)(2616005)(70586007)(86362001)(2906002)(5660300002)(8676002)(36860700001)(83380400001)(70206006)(36756003)(8936002)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 19:54:13.6610 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3625f05c-adc9-49f4-95d7-08d97494c3c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3491
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

These bits are de-facto part of the uAPI, so declare them in a uAPI header.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 MAINTAINERS                               |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h |  46 +--------
 include/uapi/linux/kfd_sysfs.h            | 108 ++++++++++++++++++++++
 3 files changed, 110 insertions(+), 45 deletions(-)
 create mode 100644 include/uapi/linux/kfd_sysfs.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 84cd16694640..7554ec928ee2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -930,6 +930,7 @@ F:	drivers/gpu/drm/amd/include/kgd_kfd_interface.h
 F:	drivers/gpu/drm/amd/include/v9_structs.h
 F:	drivers/gpu/drm/amd/include/vi_structs.h
 F:	include/uapi/linux/kfd_ioctl.h
+F:	include/uapi/linux/kfd_sysfs.h
 
 AMD SPI DRIVER
 M:	Sanjay R Mehta <sanju.mehta@amd.com>
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
index a8db017c9b8e..f0cc59d2fd5d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
@@ -25,38 +25,11 @@
 
 #include <linux/types.h>
 #include <linux/list.h>
+#include <linux/kfd_sysfs.h>
 #include "kfd_crat.h"
 
 #define KFD_TOPOLOGY_PUBLIC_NAME_SIZE 32
 
-#define HSA_CAP_HOT_PLUGGABLE			0x00000001
-#define HSA_CAP_ATS_PRESENT			0x00000002
-#define HSA_CAP_SHARED_WITH_GRAPHICS		0x00000004
-#define HSA_CAP_QUEUE_SIZE_POW2			0x00000008
-#define HSA_CAP_QUEUE_SIZE_32BIT		0x00000010
-#define HSA_CAP_QUEUE_IDLE_EVENT		0x00000020
-#define HSA_CAP_VA_LIMIT			0x00000040
-#define HSA_CAP_WATCH_POINTS_SUPPORTED		0x00000080
-#define HSA_CAP_WATCH_POINTS_TOTALBITS_MASK	0x00000f00
-#define HSA_CAP_WATCH_POINTS_TOTALBITS_SHIFT	8
-#define HSA_CAP_DOORBELL_TYPE_TOTALBITS_MASK	0x00003000
-#define HSA_CAP_DOORBELL_TYPE_TOTALBITS_SHIFT	12
-
-#define HSA_CAP_DOORBELL_TYPE_PRE_1_0		0x0
-#define HSA_CAP_DOORBELL_TYPE_1_0		0x1
-#define HSA_CAP_DOORBELL_TYPE_2_0		0x2
-#define HSA_CAP_AQL_QUEUE_DOUBLE_MAP		0x00004000
-
-#define HSA_CAP_RESERVED_WAS_SRAM_EDCSUPPORTED	0x00080000 /* Old buggy user mode depends on this being 0 */
-#define HSA_CAP_MEM_EDCSUPPORTED		0x00100000
-#define HSA_CAP_RASEVENTNOTIFY			0x00200000
-#define HSA_CAP_ASIC_REVISION_MASK		0x03c00000
-#define HSA_CAP_ASIC_REVISION_SHIFT		22
-#define HSA_CAP_SRAM_EDCSUPPORTED		0x04000000
-#define HSA_CAP_SVMAPI_SUPPORTED		0x08000000
-#define HSA_CAP_FLAGS_COHERENTHOSTACCESS	0x10000000
-#define HSA_CAP_RESERVED			0xe00f8000
-
 struct kfd_node_properties {
 	uint64_t hive_id;
 	uint32_t cpu_cores_count;
@@ -93,17 +66,6 @@ struct kfd_node_properties {
 	char name[KFD_TOPOLOGY_PUBLIC_NAME_SIZE];
 };
 
-#define HSA_MEM_HEAP_TYPE_SYSTEM	0
-#define HSA_MEM_HEAP_TYPE_FB_PUBLIC	1
-#define HSA_MEM_HEAP_TYPE_FB_PRIVATE	2
-#define HSA_MEM_HEAP_TYPE_GPU_GDS	3
-#define HSA_MEM_HEAP_TYPE_GPU_LDS	4
-#define HSA_MEM_HEAP_TYPE_GPU_SCRATCH	5
-
-#define HSA_MEM_FLAGS_HOT_PLUGGABLE		0x00000001
-#define HSA_MEM_FLAGS_NON_VOLATILE		0x00000002
-#define HSA_MEM_FLAGS_RESERVED			0xfffffffc
-
 struct kfd_mem_properties {
 	struct list_head	list;
 	uint32_t		heap_type;
@@ -116,12 +78,6 @@ struct kfd_mem_properties {
 	struct attribute	attr;
 };
 
-#define HSA_CACHE_TYPE_DATA		0x00000001
-#define HSA_CACHE_TYPE_INSTRUCTION	0x00000002
-#define HSA_CACHE_TYPE_CPU		0x00000004
-#define HSA_CACHE_TYPE_HSACU		0x00000008
-#define HSA_CACHE_TYPE_RESERVED		0xfffffff0
-
 struct kfd_cache_properties {
 	struct list_head	list;
 	uint32_t		processor_id_low;
diff --git a/include/uapi/linux/kfd_sysfs.h b/include/uapi/linux/kfd_sysfs.h
new file mode 100644
index 000000000000..e1fb78b4bf09
--- /dev/null
+++ b/include/uapi/linux/kfd_sysfs.h
@@ -0,0 +1,108 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT WITH Linux-syscall-note */
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef KFD_SYSFS_H_INCLUDED
+#define KFD_SYSFS_H_INCLUDED
+
+/* Capability bits in node properties */
+#define HSA_CAP_HOT_PLUGGABLE			0x00000001
+#define HSA_CAP_ATS_PRESENT			0x00000002
+#define HSA_CAP_SHARED_WITH_GRAPHICS		0x00000004
+#define HSA_CAP_QUEUE_SIZE_POW2			0x00000008
+#define HSA_CAP_QUEUE_SIZE_32BIT		0x00000010
+#define HSA_CAP_QUEUE_IDLE_EVENT		0x00000020
+#define HSA_CAP_VA_LIMIT			0x00000040
+#define HSA_CAP_WATCH_POINTS_SUPPORTED		0x00000080
+#define HSA_CAP_WATCH_POINTS_TOTALBITS_MASK	0x00000f00
+#define HSA_CAP_WATCH_POINTS_TOTALBITS_SHIFT	8
+#define HSA_CAP_DOORBELL_TYPE_TOTALBITS_MASK	0x00003000
+#define HSA_CAP_DOORBELL_TYPE_TOTALBITS_SHIFT	12
+
+#define HSA_CAP_DOORBELL_TYPE_PRE_1_0		0x0
+#define HSA_CAP_DOORBELL_TYPE_1_0		0x1
+#define HSA_CAP_DOORBELL_TYPE_2_0		0x2
+#define HSA_CAP_AQL_QUEUE_DOUBLE_MAP		0x00004000
+
+/* Old buggy user mode depends on this being 0 */
+#define HSA_CAP_RESERVED_WAS_SRAM_EDCSUPPORTED	0x00080000
+
+#define HSA_CAP_MEM_EDCSUPPORTED		0x00100000
+#define HSA_CAP_RASEVENTNOTIFY			0x00200000
+#define HSA_CAP_ASIC_REVISION_MASK		0x03c00000
+#define HSA_CAP_ASIC_REVISION_SHIFT		22
+#define HSA_CAP_SRAM_EDCSUPPORTED		0x04000000
+#define HSA_CAP_SVMAPI_SUPPORTED		0x08000000
+#define HSA_CAP_FLAGS_COHERENTHOSTACCESS	0x10000000
+#define HSA_CAP_RESERVED			0xe00f8000
+
+/* Heap types in memory properties */
+#define HSA_MEM_HEAP_TYPE_SYSTEM	0
+#define HSA_MEM_HEAP_TYPE_FB_PUBLIC	1
+#define HSA_MEM_HEAP_TYPE_FB_PRIVATE	2
+#define HSA_MEM_HEAP_TYPE_GPU_GDS	3
+#define HSA_MEM_HEAP_TYPE_GPU_LDS	4
+#define HSA_MEM_HEAP_TYPE_GPU_SCRATCH	5
+
+/* Flag bits in memory properties */
+#define HSA_MEM_FLAGS_HOT_PLUGGABLE		0x00000001
+#define HSA_MEM_FLAGS_NON_VOLATILE		0x00000002
+#define HSA_MEM_FLAGS_RESERVED			0xfffffffc
+
+/* Cache types in cache properties */
+#define HSA_CACHE_TYPE_DATA		0x00000001
+#define HSA_CACHE_TYPE_INSTRUCTION	0x00000002
+#define HSA_CACHE_TYPE_CPU		0x00000004
+#define HSA_CACHE_TYPE_HSACU		0x00000008
+#define HSA_CACHE_TYPE_RESERVED		0xfffffff0
+
+/* Link types in IO link properties (matches CRAT link types) */
+#define HSA_IOLINK_TYPE_UNDEFINED	0
+#define HSA_IOLINK_TYPE_HYPERTRANSPORT	1
+#define HSA_IOLINK_TYPE_PCIEXPRESS	2
+#define HSA_IOLINK_TYPE_AMBA		3
+#define HSA_IOLINK_TYPE_MIPI		4
+#define HSA_IOLINK_TYPE_QPI_1_1	5
+#define HSA_IOLINK_TYPE_RESERVED1	6
+#define HSA_IOLINK_TYPE_RESERVED2	7
+#define HSA_IOLINK_TYPE_RAPID_IO	8
+#define HSA_IOLINK_TYPE_INFINIBAND	9
+#define HSA_IOLINK_TYPE_RESERVED3	10
+#define HSA_IOLINK_TYPE_XGMI		11
+#define HSA_IOLINK_TYPE_XGOP		12
+#define HSA_IOLINK_TYPE_GZ		13
+#define HSA_IOLINK_TYPE_ETHERNET_RDMA	14
+#define HSA_IOLINK_TYPE_RDMA_OTHER	15
+#define HSA_IOLINK_TYPE_OTHER		16
+
+/* Flag bits in IO link properties (matches CRAT flags, excluding the
+ * bi-directional flag, which is not offially part of the CRAT spec, and
+ * only used internally in KFD)
+ */
+#define HSA_IOLINK_FLAGS_ENABLED		(1 << 0)
+#define HSA_IOLINK_FLAGS_NON_COHERENT		(1 << 1)
+#define HSA_IOLINK_FLAGS_NO_ATOMICS_32_BIT	(1 << 2)
+#define HSA_IOLINK_FLAGS_NO_ATOMICS_64_BIT	(1 << 3)
+#define HSA_IOLINK_FLAGS_NO_PEER_TO_PEER_DMA	(1 << 4)
+#define HSA_IOLINK_FLAGS_RESERVED		0xffffffe0
+
+#endif
-- 
2.32.0

