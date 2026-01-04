Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEBFCF0B57
	for <lists+dri-devel@lfdr.de>; Sun, 04 Jan 2026 08:22:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6AC310E321;
	Sun,  4 Jan 2026 07:22:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nqfGXGim";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010045.outbound.protection.outlook.com [52.101.46.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D7A210E24F;
 Sun,  4 Jan 2026 07:22:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xHX9R4tNNPJJ2xQeXZciDQUYMH0r3hE0oN0opZJ4fSEWh16I5ptSART1tdO6YCw/EuIddqDKnebMTExLHBcJ7IN7Qow0ZBYQ4CXkBe6U7Sddcp/6vLn9M49p2F5hlUcYlwuNPE7FgGcKNNLlNFtCG0qrl+o0kCVQScM8cNyExvLmAUGf5cQEz6d6pt9G+Eh8d3/n9NUaPJ2Yc+FRND5ae+XvVeSOAHKZc575A5E0ZvlgEIX0aI0q2ClkbAmsDvebZnzWtlkXnAeSwAscSHzK410x9V7FFmj4sGujiMn9GGGcERY9ryeez+VxpIie5Rj9Otjq+kwv5anAuWUJZn/YuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5zU9R6IAy3MGGVBSAVnicJklp2RRVHKJDaaSm0oI9w=;
 b=CNOmjnt+rSiQWQEYUbsYubv14RzR1bppf87FFr52I6+NITN5gJOgO+fNeIYjxBnGR71E5s8lTsboenj2z5eU99hwRTa0KZ/4e8lMFTKm/yxKof32SyI8oYZXnoGJNXw6EpV1IGBrE4iISWQlcvCCumWoOrI3vRfGdoEzGg2Gk+uQvBcZUEArE4nFh98D3mVNF4hyrftR1v0kvcaVtyBQLv4RwLGb8VX4Lsn913YSgRFZdOmofgPOpxjWa5FCIt7C7Lj/YTTZ7jVAOzs0AAmkwOcl+jxGQtwKooDoR8CGxDFId6X7Rg0yE2GrL5tGoQzF/udasYKvwRP3bv1gy30yqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=collabora.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5zU9R6IAy3MGGVBSAVnicJklp2RRVHKJDaaSm0oI9w=;
 b=nqfGXGimOwxB7P4eMniVQAyEV8adxnhiQayn6d+kqKKYXNc2CV4VZ4sYRk7/hf+XK0YdcTBAvSsu9l3uJf1H7YbERRqdVYOxYLCbgK5muqslNP0MCXgeQW2RgxQYVjkUbJ/Si7/1YwFu/uE18i5uGwsaN4OfyEHUoJ5CurOQf/I=
Received: from MN0P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::32)
 by MN2PR12MB4287.namprd12.prod.outlook.com (2603:10b6:208:1dd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sun, 4 Jan
 2026 07:22:15 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2603:10b6:208:52e:cafe::60) by MN0P220CA0003.outlook.office365.com
 (2603:10b6:208:52e::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Sun, 4
 Jan 2026 07:22:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.0 via Frontend Transport; Sun, 4 Jan 2026 07:22:15 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 4 Jan
 2026 01:22:12 -0600
From: Honglei Huang <honglei1.huang@amd.com>
To: <Felix.Kuehling@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Ray.Huang@amd.com>
CC: <dmitry.osipenko@collabora.com>, <Xinhui.Pan@amd.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <akpm@linux-foundation.org>, <honghuan@amd.com>
Subject: [PATCH v2 1/4] drm/amdkfd: Add batch userptr allocation UAPI
Date: Sun, 4 Jan 2026 15:21:19 +0800
Message-ID: <20260104072122.3045656-2-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260104072122.3045656-1-honglei1.huang@amd.com>
References: <20260104072122.3045656-1-honglei1.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|MN2PR12MB4287:EE_
X-MS-Office365-Filtering-Correlation-Id: ec9927f1-3ed0-4a7e-374a-08de4b61fccf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?86DoUHa4f1iBelIuM9T+uguU71mmQ007aXc79CCI2j5yzfy820A/hNyUxkoa?=
 =?us-ascii?Q?MWvWD0455GFi1slRwTypB119D5dKvLdVkYagFLux4qbB5nghmWzgpA2L35HY?=
 =?us-ascii?Q?aaGV8Hc2gsSjwOq7rGMRUnJdkTMflGMyXCgYNUI7jzdgWVw95wHh5x0hyjeg?=
 =?us-ascii?Q?BWnSjKzS8GL3y+gYgkKZ+UtVfrJvU1xvndNG9hUXuYr01cqE7F5KsNizCnVs?=
 =?us-ascii?Q?+ZK5VI+67QEYGXLDxNE4hSXn4V5G2xpPq9vq9O0C7koEaj8FKMr5+iuw76go?=
 =?us-ascii?Q?Va9B2zBpHWyF1oqGi26KQ31uzTwrdPXSZAYYXO0xHoqQrFRv7buRS0rjrve8?=
 =?us-ascii?Q?igTwVU8QdaHZcU+PA+jnjmX8kjil8SCnmla3OpAZE7dRAlCtZES4gTDc5JRL?=
 =?us-ascii?Q?QToTC/rcRU4XreEh1+UP/lQnW3UMthepAps2b3j0hLaLtVB099iUmonY3l7r?=
 =?us-ascii?Q?aT/Wa+u0aDW0TuzUHocRhMCj6eCq8Sz9ucJE9hkrxcFB5Mj/mzpBpk03c1en?=
 =?us-ascii?Q?YO8ytM0dtJ1G7IWsdVLEEbQ5c1ldGoGuB8NTZcv+j8bI1DfH+pPOfLjtUF8k?=
 =?us-ascii?Q?SLxO4puN40c/S33tAv7q3x+vzdgXqVhLhBj1XrB1E5SNPaJ50LTtIfbZh1D3?=
 =?us-ascii?Q?eivloZXthNSeOMVwGJB15dgZ2I3rFXyH93ISaqzjz4HlO91e4b/C1cu7tPMW?=
 =?us-ascii?Q?EyNARMKKYRMai2SVzK04IWrRUo8LARrsIRHGYkqKPkwS3kNEkvvTF3HtK5SO?=
 =?us-ascii?Q?R3y9EF+DqXLgIHHgXyT7oD9cOb8isErR0IMmkqWOZ8uSVqVO7hqejUDqII5H?=
 =?us-ascii?Q?58oddltWZ8F8i2qfEy9R7GQYQfml8oM+JDHjzhohhywuQtW7gNnxWvmaGpif?=
 =?us-ascii?Q?pRER/MwmQTz4T0r/wgIY9EJXi6UMv3pcLHMUaLIatV2t1nz4CJi40P6vAwNq?=
 =?us-ascii?Q?WqCI+8cWeL6jj9KUZJbf4bKdhumoEf1v2p2YvqKZZ4wn9w8BNEX92YEQnhHE?=
 =?us-ascii?Q?MerzNMiTRaSrXeLgzTg3S28YBEF/yFQw9m/Mj1TEUm9LNn4paV5lLXa7IBQ8?=
 =?us-ascii?Q?EoIE6Slg+iBYUeD0qvPQs0k/6rzqy+Yk5sjHAmcqOZQkDS8Mn4dotAWxy9L7?=
 =?us-ascii?Q?0FFfDdspRiXLhDhWRMQpHVBLDU6mC99Gs1843JeQzZHskdJPRYs3CCWzc4F2?=
 =?us-ascii?Q?tXnL+zupNI6XAPpP1KLxLPVrHomuqiuhjJfymXQ6VB+fDzt0kQhaDQP7FUCO?=
 =?us-ascii?Q?qQmgKj2VPxHFgvTyGTx5KmruZejipJTt46C0VVboKOehqQWn1W7An8dDwz52?=
 =?us-ascii?Q?VCCauZiCQb6NTGMLPpgwXzDksi3vqXLbtqpXa6xmTQCnMDP3WEMXI996wXmm?=
 =?us-ascii?Q?ktonT1YFcrvy6AmV58a2pr0t1fFGeQT2oifUgTHVqMLrpIol3+8IZF/wrtQR?=
 =?us-ascii?Q?tEzEyxT/FT+EBUI5bwcFd+Ywm/gP5Km1GpRwAjliKR9nKRbZUc6zS9p1n1ch?=
 =?us-ascii?Q?z5V0gdzDgXUDbWDmu5/HXzLF4NuzhXnVgqVDVB5RVEqM3vDpm2N1YYk+1n0Q?=
 =?us-ascii?Q?vG+flypGx3oFlVGbNVU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2026 07:22:15.8147 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec9927f1-3ed0-4a7e-374a-08de4b61fccf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4287
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

From: Honglei Huang <honghuan@amd.com>

Introduce new ioctl AMDKFD_IOC_ALLOC_MEMORY_OF_GPU_BATCH to support
allocating multiple non-contiguous CPU virtual address ranges that
map to a single contiguous GPU virtual address.

This allows userspace to efficiently manage scattered memory buffers
by presenting them as a unified GPU address space, useful for
applications dealing with fragmented host memory.

Signed-off-by: Honglei Huang <honghuan@amd.com>
---
 include/uapi/linux/kfd_ioctl.h | 37 +++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
index 84aa24c02..c364aa971 100644
--- a/include/uapi/linux/kfd_ioctl.h
+++ b/include/uapi/linux/kfd_ioctl.h
@@ -442,6 +442,38 @@ struct kfd_ioctl_alloc_memory_of_gpu_args {
 	__u32 flags;
 };
 
+/* Userptr range for batch allocation
+ *
+ * @start: start address of user virtual memory range
+ * @size:  size of this user virtual memory range in bytes
+ */
+struct kfd_ioctl_userptr_range {
+	__u64 start;		/* to KFD */
+	__u64 size;		/* to KFD */
+};
+
+/* Allocate memory for batch of non-contiguous userptr ranges
+ * that map to a contiguous GPU virtual address
+ *
+ * @va_addr:     contiguous GPU virtual address where all ranges will be mapped
+ * @total_size:  total size in bytes (sum of all range sizes)
+ * @handle:      buffer handle returned to user mode
+ * @ranges_ptr:  pointer to array of kfd_ioctl_userptr_range structures
+ * @num_ranges:  number of ranges in the array
+ * @gpu_id:      device identifier
+ * @flags:       memory type and attributes (must include KFD_IOC_ALLOC_MEM_FLAGS_USERPTR)
+ */
+struct kfd_ioctl_alloc_memory_of_gpu_batch_args {
+	__u64 va_addr;		/* to KFD */
+	__u64 total_size;	/* to KFD */
+	__u64 handle;		/* from KFD */
+	__u64 ranges_ptr;	/* to KFD */
+	__u32 num_ranges;	/* to KFD */
+	__u32 gpu_id;		/* to KFD */
+	__u32 flags;		/* to KFD */
+	__u32 pad;
+};
+
 /* Free memory allocated with kfd_ioctl_alloc_memory_of_gpu
  *
  * @handle: memory handle returned by alloc
@@ -1675,7 +1707,10 @@ struct kfd_ioctl_dbg_trap_args {
 #define AMDKFD_IOC_CREATE_PROCESS		\
 		AMDKFD_IO(0x27)
 
+#define AMDKFD_IOC_ALLOC_MEMORY_OF_GPU_BATCH	\
+		AMDKFD_IOWR(0x28, struct kfd_ioctl_alloc_memory_of_gpu_batch_args)
+
 #define AMDKFD_COMMAND_START		0x01
-#define AMDKFD_COMMAND_END		0x28
+#define AMDKFD_COMMAND_END		0x29
 
 #endif
-- 
2.34.1

