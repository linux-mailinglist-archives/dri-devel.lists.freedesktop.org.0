Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CA12EC885
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:03:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6586E3F9;
	Thu,  7 Jan 2021 03:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF026E3E5;
 Thu,  7 Jan 2021 03:02:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRgCAcOLcA2fSJiO97swI7k8J/k0D3bzbiQQ9/ikrGKhd/B7Yee3RSZRySpkrLG6C5av2VsxGQ7RAPMPI2Qq1PBbCZbUyTiBWE5LSm4q5qAlq2/r9eWZoFi3HoZdxz4wA40wXAYLm7qPg6Mv4ZcJ8L34+acQ3bTFlC1npA0gcrRqwg7ICIDaZZ6e0M1HrgRBnpG2JGfwIx6nYiXyG1JPuISwjOWeY2/zvQ+41w+xlcUyQuwfm+Qq43zwlfw0xkDucLlG063vg+Y4aKDqNOsL5GHM9aBm22kH7HISAOI5+A5b08v5SysAyL6DFjpxd5ponelfAFbDoBtrGH0hlIqHww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HvdqkgDCzQdyRlQg9PY77JoS/xxfKR1KSZq3QqXmiz4=;
 b=gaJ6/bt/dQebcDrH54lmH6UWn0qzfKUfiq2cgQqbDs8oh7k47M/UOy7qgkNX6UhVXwqT6Ge+s1OCkmtk4PLW4FJ71Q2t9+6CCHE9S1mtjjPpNaNNIWtE/ZouICYX6ZodIKqawxCSQ97mnmtJOYg0s/NlGrqyZOtbYs1JhlA1vRHIPWsBPT+/dd0xEQU+lyTv8WzyOIKaRUgp84/g15h9NRR8ERr5sL6lBQ9MUPCw/vXODWmEbazz5etW5fS4zrnzszyUqT6fjoq9MZWADCD0ORLlxk8gvD+qBYfc11ZSIsTjySjs6rPn4IQkkdYiNrt0fma36EksWhl98U0FhOHjPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HvdqkgDCzQdyRlQg9PY77JoS/xxfKR1KSZq3QqXmiz4=;
 b=ZCGZBn0NyxPFoHvXykMIo0JhRJJr6ijFLbNp4gSuxOAMCsHtzjLQE6Rv6XqBFV0zWoLNAMcWemLtclMUtgcVDSMIhgsIDeRSvW7wKOuW+ScNMcG+Qn5LoYj73yckkEIMaWhWcXavz6xIGCaLZT6mS6+cXpuKfeCt+Qdo8wEOjKU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3999.namprd12.prod.outlook.com (2603:10b6:208:158::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24; Thu, 7 Jan
 2021 03:02:48 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 03:02:48 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 04/35] drm/amdkfd: add svm ioctl API
Date: Wed,  6 Jan 2021 22:00:56 -0500
Message-Id: <20210107030127.20393-5-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107030127.20393-1-Felix.Kuehling@amd.com>
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::17) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 03:02:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f3966ff8-b4d1-4343-252d-08d8b2b8b6be
X-MS-TrafficTypeDiagnostic: MN2PR12MB3999:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB399903439686E0FAE9ED095A92AF0@MN2PR12MB3999.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 59ejKEmfuRePuKjG86gBrzxk7R1MHJZV+Mi73JN7WF4dyskAz+AI59BoQ7BV0NZNipmayf7aRfA/Y6MF5GvktNqwkdSyeenI4XIU1LKdyruociTaav5bbHR+nOWyfdfKuiVWhlEamMS38U+dwKb0MAs0dWpts2KX76rZrDNg0BAFxEKPtMdDSbk3uBxVqDm7/lKjMHVSpDCoWrBWg/F84I9YOSAaw/dKw2CFS0DnPccc9jZWowGjCQ0xYog2nO+FhlsE5n0es4al/rIsErgp5UfNZQsM3oCzph6k1Qp8+uPHz5eNi2IyuQiFUuMWdhu5k+UJc6GLuAaq5GWoB6B6GPq9MX9dogJdrlw09pTvDwcgUBSKLsUw3gC6YdNtne4szLEZKRQu5B5nTEJrumpxrA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(316002)(6666004)(7696005)(2616005)(956004)(8936002)(4326008)(66476007)(8676002)(478600001)(5660300002)(26005)(52116002)(1076003)(86362001)(16526019)(66946007)(450100002)(186003)(6486002)(36756003)(83380400001)(2906002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?EVf6tpVXgxkJHcnBFDiU4KuLaC45bK6CZ9eNRO57PY66sTgC8lSgpE526BRj?=
 =?us-ascii?Q?YhriU5S92u7fjiyOcczPfkZiIKknHDzPsbfWClYqAoraY/2JJ5+z4E4TcKK4?=
 =?us-ascii?Q?IgNBTB5BjItAGz/SaqOK4UjGoQEk4OQygeQWlfRbj7HwCU0HZ8P+h5A1HbwB?=
 =?us-ascii?Q?wAzWLja++O4Sx2vwbhRi6XlEuxRq0O0DIX+Q5tHztgDtUYWGURu2PQVQjmmV?=
 =?us-ascii?Q?3N3DCCzzHq9ZgWpoi8WRw8+LQtJkmypsoVmRvu90ScNfLqTNjbKl+4orKcPT?=
 =?us-ascii?Q?F4iH8er2JsidG7twgIAtWwDMeK0bwA0JbMWe1Nb1DCUGr3d72GBzuicZFaJg?=
 =?us-ascii?Q?8dGX8Easj8OPaA35gx7OIQhefhRU/jGAC4XW1CisWMz2YJeuBFW6+Auvfr6C?=
 =?us-ascii?Q?zKrAJV4o1g899dHwlHClCKIb8F3nA9EJrVKHts2vkyY9u30pjb52UQwwpsb3?=
 =?us-ascii?Q?XlI4QBzR2doHuMBBMfpWmZxtvCTUQklo0JX6umnizqL2zKD2ly7G+as88KAX?=
 =?us-ascii?Q?bABInVczAvbzS9JuHXER1cY0+BI+TbPmKJj3kobBF5kPLXHzzneKtPxd7v2N?=
 =?us-ascii?Q?sYs7TEkHQhQnjcNBF21NO2BhAL/YpBEbWxLAzF4bxc5nyJuKUFTD13XcuLyw?=
 =?us-ascii?Q?E4Y4F2DSWPeEbE87oWZUjs9MjIphFLic69LZp5a95waOFZ2MOBazN9Ez6MgH?=
 =?us-ascii?Q?C+xKLmIlE79qsQui7JF90Ml6g2wbto7ujLQDT9ALLO1Q3FZfgr+lcDLv9gH9?=
 =?us-ascii?Q?6JbJUhqJszjYxATS34a/g4WtTE68+Jop+SWR43g7HwilE0YBeX7EJ75o8Uqy?=
 =?us-ascii?Q?8nowypXkAl95okEWgVQnFP+CpNPtWFS6tm9kWDxPUDCdJ5b84YjYwFZys49a?=
 =?us-ascii?Q?GD0Qd5PL+v2/lnUk+CIfWBHop5/i+NvAj+nxRb2o6Hzia3z+cicgMgXm0Th5?=
 =?us-ascii?Q?Zd0XrLkGcb4fNtu0hX/aFGl/uFGLTLJrq9I+roBxw20FQ6A35PhVZwQKF72v?=
 =?us-ascii?Q?hAxc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 03:02:48.1759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: f3966ff8-b4d1-4343-252d-08d8b2b8b6be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KI+SOLnUmlozslaH0IooIyy/fEYjHz7Hd66nwhjxKyB7G7/KARf6t137QJXVPjJTP8CaVb1jJchxIfbcW7fdRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3999
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
Cc: alex.sierra@amd.com, Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

Add svm (shared virtual memory) ioctl data structure and API definition.

The svm ioctl API is designed to be extensible in the future. All
operations are provided by a single IOCTL to preserve ioctl number
space. The arguments structure ends with a variable size array of
attributes that can be used to set or get one or multiple attributes.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |   7 ++
 include/uapi/linux/kfd_ioctl.h           | 128 ++++++++++++++++++++++-
 2 files changed, 133 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 8c87afce12df..c5288a6e45b9 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1746,6 +1746,11 @@ static int kfd_ioctl_smi_events(struct file *filep,
 	return kfd_smi_event_open(dev, &args->anon_fd);
 }
 
+static int kfd_ioctl_svm(struct file *filep, struct kfd_process *p, void *data)
+{
+	return -EINVAL;
+}
+
 #define AMDKFD_IOCTL_DEF(ioctl, _func, _flags) \
 	[_IOC_NR(ioctl)] = {.cmd = ioctl, .func = _func, .flags = _flags, \
 			    .cmd_drv = 0, .name = #ioctl}
@@ -1844,6 +1849,8 @@ static const struct amdkfd_ioctl_desc amdkfd_ioctls[] = {
 
 	AMDKFD_IOCTL_DEF(AMDKFD_IOC_SMI_EVENTS,
 			kfd_ioctl_smi_events, 0),
+
+	AMDKFD_IOCTL_DEF(AMDKFD_IOC_SVM, kfd_ioctl_svm, 0),
 };
 
 #define AMDKFD_CORE_IOCTL_COUNT	ARRAY_SIZE(amdkfd_ioctls)
diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
index 695b606da4b1..5d4a4b3e0b61 100644
--- a/include/uapi/linux/kfd_ioctl.h
+++ b/include/uapi/linux/kfd_ioctl.h
@@ -29,9 +29,10 @@
 /*
  * - 1.1 - initial version
  * - 1.3 - Add SMI events support
+ * - 1.4 - Add SVM API
  */
 #define KFD_IOCTL_MAJOR_VERSION 1
-#define KFD_IOCTL_MINOR_VERSION 3
+#define KFD_IOCTL_MINOR_VERSION 4
 
 struct kfd_ioctl_get_version_args {
 	__u32 major_version;	/* from KFD */
@@ -471,6 +472,127 @@ enum kfd_mmio_remap {
 	KFD_MMIO_REMAP_HDP_REG_FLUSH_CNTL = 4,
 };
 
+/* Guarantee host access to memory */
+#define KFD_IOCTL_SVM_FLAG_HOST_ACCESS 0x00000001
+/* Fine grained coherency between all devices with access */
+#define KFD_IOCTL_SVM_FLAG_COHERENT    0x00000002
+/* Use any GPU in same hive as preferred device */
+#define KFD_IOCTL_SVM_FLAG_HIVE_LOCAL  0x00000004
+/* GPUs only read, allows replication */
+#define KFD_IOCTL_SVM_FLAG_GPU_RO      0x00000008
+/* Allow execution on GPU */
+#define KFD_IOCTL_SVM_FLAG_GPU_EXEC    0x00000010
+
+/**
+ * kfd_ioctl_svm_op - SVM ioctl operations
+ *
+ * @KFD_IOCTL_SVM_OP_SET_ATTR: Modify one or more attributes
+ * @KFD_IOCTL_SVM_OP_GET_ATTR: Query one or more attributes
+ */
+enum kfd_ioctl_svm_op {
+	KFD_IOCTL_SVM_OP_SET_ATTR,
+	KFD_IOCTL_SVM_OP_GET_ATTR
+};
+
+/** kfd_ioctl_svm_location - Enum for preferred and prefetch locations
+ *
+ * GPU IDs are used to specify GPUs as preferred and prefetch locations.
+ * Below definitions are used for system memory or for leaving the preferred
+ * location unspecified.
+ */
+enum kfd_ioctl_svm_location {
+	KFD_IOCTL_SVM_LOCATION_SYSMEM = 0,
+	KFD_IOCTL_SVM_LOCATION_UNDEFINED = 0xffffffff
+};
+
+/**
+ * kfd_ioctl_svm_attr_type - SVM attribute types
+ *
+ * @KFD_IOCTL_SVM_ATTR_PREFERRED_LOC: gpuid of the preferred location, 0 for
+ *                                    system memory
+ * @KFD_IOCTL_SVM_ATTR_PREFETCH_LOC: gpuid of the prefetch location, 0 for
+ *                                   system memory. Setting this triggers an
+ *                                   immediate prefetch (migration).
+ * @KFD_IOCTL_SVM_ATTR_ACCESS:
+ * @KFD_IOCTL_SVM_ATTR_ACCESS_IN_PLACE:
+ * @KFD_IOCTL_SVM_ATTR_NO_ACCESS: specify memory access for the gpuid given
+ *                                by the attribute value
+ * @KFD_IOCTL_SVM_ATTR_SET_FLAGS: bitmask of flags to set (see
+ *                                KFD_IOCTL_SVM_FLAG_...)
+ * @KFD_IOCTL_SVM_ATTR_CLR_FLAGS: bitmask of flags to clear
+ * @KFD_IOCTL_SVM_ATTR_GRANULARITY: migration granularity
+ *                                  (log2 num pages)
+ */
+enum kfd_ioctl_svm_attr_type {
+	KFD_IOCTL_SVM_ATTR_PREFERRED_LOC,
+	KFD_IOCTL_SVM_ATTR_PREFETCH_LOC,
+	KFD_IOCTL_SVM_ATTR_ACCESS,
+	KFD_IOCTL_SVM_ATTR_ACCESS_IN_PLACE,
+	KFD_IOCTL_SVM_ATTR_NO_ACCESS,
+	KFD_IOCTL_SVM_ATTR_SET_FLAGS,
+	KFD_IOCTL_SVM_ATTR_CLR_FLAGS,
+	KFD_IOCTL_SVM_ATTR_GRANULARITY
+};
+
+/**
+ * kfd_ioctl_svm_attribute - Attributes as pairs of type and value
+ *
+ * The meaning of the @value depends on the attribute type.
+ *
+ * @type: attribute type (see enum @kfd_ioctl_svm_attr_type)
+ * @value: attribute value
+ */
+struct kfd_ioctl_svm_attribute {
+	__u32 type;
+	__u32 value;
+};
+
+/**
+ * kfd_ioctl_svm_args - Arguments for SVM ioctl
+ *
+ * @op specifies the operation to perform (see enum
+ * @kfd_ioctl_svm_op).  @start_addr and @size are common for all
+ * operations.
+ *
+ * A variable number of attributes can be given in @attrs.
+ * @nattr specifies the number of attributes. New attributes can be
+ * added in the future without breaking the ABI. If unknown attributes
+ * are given, the function returns -EINVAL.
+ *
+ * @KFD_IOCTL_SVM_OP_SET_ATTR sets attributes for a virtual address
+ * range. It may overlap existing virtual address ranges. If it does,
+ * the existing ranges will be split such that the attribute changes
+ * only apply to the specified address range.
+ *
+ * @KFD_IOCTL_SVM_OP_GET_ATTR returns the intersection of attributes
+ * over all memory in the given range and returns the result as the
+ * attribute value. If different pages have different preferred or
+ * prefetch locations, 0xffffffff will be returned for
+ * @KFD_IOCTL_SVM_ATTR_PREFERRED_LOC or
+ * @KFD_IOCTL_SVM_ATTR_PREFETCH_LOC resepctively. For
+ * @KFD_IOCTL_SVM_ATTR_SET_FLAGS, flags of all pages will be
+ * aggregated by bitwise AND. The minimum  migration granularity
+ * throughout the range will be returned for
+ * @KFD_IOCTL_SVM_ATTR_GRANULARITY.
+ *
+ * Querying of accessibility attributes works by initializing the
+ * attribute type to @KFD_IOCTL_SVM_ATTR_ACCESS and the value to the
+ * GPUID being queried. Multiple attributes can be given to allow
+ * querying multiple GPUIDs. The ioctl function overwrites the
+ * attribute type to indicate the access for the specified GPU.
+ *
+ * @KFD_IOCTL_SVM_ATTR_CLR_FLAGS is invalid for
+ * @KFD_IOCTL_SVM_OP_GET_ATTR.
+ */
+struct kfd_ioctl_svm_args {
+	__u64 start_addr;
+	__u64 size;
+	__u32 op;
+	__u32 nattr;
+	/* Variable length array of attributes */
+	struct kfd_ioctl_svm_attribute attrs[0];
+};
+
 #define AMDKFD_IOCTL_BASE 'K'
 #define AMDKFD_IO(nr)			_IO(AMDKFD_IOCTL_BASE, nr)
 #define AMDKFD_IOR(nr, type)		_IOR(AMDKFD_IOCTL_BASE, nr, type)
@@ -571,7 +693,9 @@ enum kfd_mmio_remap {
 #define AMDKFD_IOC_SMI_EVENTS			\
 		AMDKFD_IOWR(0x1F, struct kfd_ioctl_smi_events_args)
 
+#define AMDKFD_IOC_SVM	AMDKFD_IOWR(0x20, struct kfd_ioctl_svm_args)
+
 #define AMDKFD_COMMAND_START		0x01
-#define AMDKFD_COMMAND_END		0x20
+#define AMDKFD_COMMAND_END		0x21
 
 #endif
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
