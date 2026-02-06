Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMGABJmJhWkWDQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 07:26:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BE5FAA0B
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 07:26:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0F510E36E;
	Fri,  6 Feb 2026 06:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aj/C8Wb0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010046.outbound.protection.outlook.com [52.101.201.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A4B610E36B;
 Fri,  6 Feb 2026 06:26:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wDOC2vsLmDBsxT7B0BNW9uCBjCl70ihNzMXPzuBid0+i5BKCFMyICI8/kGM6NxFIiRyi4KnTwZmzIn2pKXmIqdx7du/mF5a5F/FihF6N223TrbYQ6DCrniTZPK7K5CaK3xHRyKDCOTGr6DZ8a7kFjkrK9tZCLia59SZmyhRsV2+O2ua60pt7yr4s792KxOhHdSnlchTNgJgFl+nwUSTdRTwEwJWGMJMclhiC2Ay2LXRJSg01r+TGfV7EBfGc6nuGpvVdZZAPRy+sePBJEZUkDAdNminGezd9lVzPTHH6wqH+4NEqgr6wgHs+VcXLzDXRIBiR+bH1+UC4FcDRpUMQWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMbvLyaAvNXsFoSV0KbS9N3tGeqxMjOmorgMDw9FoPY=;
 b=F8gMEihpPcOsLES+ozyeyv7xVerSQT/JCvbdcJISZFErHnd9+oz7E1l36Au0CXyNeUDBwv5eiZ3HDZDtS1P9VVmbuCY0EBIlVPCUB6De0v1YhfEZPS4D7kEF1xBuZOGDj25u7V/eJ9oIfxY7uQuDZtJ9wS8jweUmGtGIyd0wRRd/y1H2CC1dI7HQ/WionRrvqn0YxxESWWbfKtEBrSYrffV3qTPfVmSfcKng0aZNdYbWb8e1Mti/VQn22CjYfNlJvDGVAOQt7Ex9AK7+1QWdtwvF/eIW6DJx5Q277vC6ELiMZWpuGNDYHfjQujVaU4PxKfUjnaOs1p/9UMhBtvrh3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=collabora.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMbvLyaAvNXsFoSV0KbS9N3tGeqxMjOmorgMDw9FoPY=;
 b=aj/C8Wb0uo6CLzsKj5B92Zo15siL+eKQoB/dNwDdXoSUlHrvw5oMmFFRLfg/PUiIHuuEWGv8jn/fVW+ppAe3C9OrJRiFD0iyIw2ZjPBjqngkTdc6IbYN/AOsrIf0/s1VI5+KLy6+7v34dd3VBEFb2G9Gm7upyVgiDgi5hJkOCsU=
Received: from MN2PR19CA0017.namprd19.prod.outlook.com (2603:10b6:208:178::30)
 by PH7PR12MB7331.namprd12.prod.outlook.com (2603:10b6:510:20e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 06:26:24 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:208:178:cafe::13) by MN2PR19CA0017.outlook.office365.com
 (2603:10b6:208:178::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 06:26:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 06:26:23 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Feb
 2026 00:26:19 -0600
From: Honglei Huang <honglei1.huang@amd.com>
To: <Felix.Kuehling@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Ray.Huang@amd.com>
CC: <dmitry.osipenko@collabora.com>, <Xinhui.Pan@amd.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <akpm@linux-foundation.org>, <honghuan@amd.com>
Subject: [PATCH v3 1/8] drm/amdkfd: Add userptr batch allocation UAPI
 structures
Date: Fri, 6 Feb 2026 14:25:50 +0800
Message-ID: <20260206062557.3718801-2-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260206062557.3718801-1-honglei1.huang@amd.com>
References: <20260206062557.3718801-1-honglei1.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|PH7PR12MB7331:EE_
X-MS-Office365-Filtering-Correlation-Id: 40bac1fc-05cb-4284-9b8f-08de6548a645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eEsZhCWrbj3cpHqRHpBd8dlmpw2kXA0mapk0SnsJIpakx84Og6Zx0VUPSKqf?=
 =?us-ascii?Q?f6Pf1QK9LSbuhRdeHAOLOQ6GlLiPYx7NGbuSyhD8L89XXmYCPgBmWVQ7prP3?=
 =?us-ascii?Q?RzCONzNafVxsjL7+xNJEWhXkUi/wBrsIitJJ8PoHlxSI4hRW6U9C7AJfF2kd?=
 =?us-ascii?Q?PFlc6vq+Bb+WnqsByP3DLuBQmi8XAXi32uIKHLDtgbG1K10iaD2tosTdzox5?=
 =?us-ascii?Q?oZLnAuJOESBpM8Mf1QZN07NCHxNZ1N/v/fKQOn1aiJz1C13Lv4VRBio4ZYOZ?=
 =?us-ascii?Q?UfC3gAM/tFcewEWiMa5xUnrHS1cwv3V+RiSiz3V6hPqqFo9NnGBNaA621npM?=
 =?us-ascii?Q?6VvpBNdTTHLsNCP+/+0M1EqewLPRZk8he2sneHm9lY8JSQamGJ6QlgwBjrAz?=
 =?us-ascii?Q?TyaQjQXIpSXDEvhJhsSl5sUkAcqwpzJN3ffkj0kmeu13n/yNBrrv947Pr3Sj?=
 =?us-ascii?Q?rIha/mWQ9HyTAmtMo+7VR3HiRchQUnMJvdG6DLEpIhC2OlgyVc3OPSHzYxvn?=
 =?us-ascii?Q?YQcxSfM3uUdXmd9OAqI5FwJlHxLT7LyD1mUVptdTXLHWUwm/q8MruKSZ1tDU?=
 =?us-ascii?Q?6HfO4mr0ujebm6Ytb0lD9DPvM0oPmAZSmMPBQgL7H95NWNRVQN0kO3wVoUOj?=
 =?us-ascii?Q?SFdWAI5dOKN+QHnwKLeyhR1oDf45ACmyQ72pr6t6lhsZJ9HxHhiINZqvfYN7?=
 =?us-ascii?Q?wd/0yQ4YYbh2zbT+aJcxW+aJPaM234FDMCEUanXYdUBIewZoO3WFmUh4efCn?=
 =?us-ascii?Q?fqh48kFiDjR9/NjcOcbaFG3ikclELlvRV2D/IIXKXXuZQJeDeF1mlq6Mhhn0?=
 =?us-ascii?Q?CnBXb1r2ccfekRYoHTEvo4bqlHlWCOkpfHYtamTrOBj0Pt78w5AxsPKIH8g4?=
 =?us-ascii?Q?WZ778K3CCP6LwNA3ryHPSH7mvRjrbweU2oA948D5OA7odfAw6ClnsKShuS3Q?=
 =?us-ascii?Q?5dJNymjNn4u60ZQzoZrk9t/eYYR0s1G/78kSFGXW/LeAANPbe0C4zh5RGsYV?=
 =?us-ascii?Q?ME4so9OWgdpeHQEkx4khfdabZTWcvGpwVwnRerm08kOqdpbdSc8cCIjSuXi5?=
 =?us-ascii?Q?LHUdgF9o3GfNbS63yNL2Z8Zh9gi5hLuYWmXWz8cIVSvTv6w6V+80tBrbqMmI?=
 =?us-ascii?Q?v3gXVQDkrmSdqyNG4RhztNcyl+4O/zP8bq3ZLcu2/Nyjw0mQYZyXAlZA4k4g?=
 =?us-ascii?Q?QvruxN0r/3N7pEP1plGCus+emCRsNCso5sh9/HFdxG/GLOVg38PAsX+dA7Lg?=
 =?us-ascii?Q?EI/WjNfRH+2Paoet9GrnJccLXeiDBDrROZoPEHz80tTbpL5r43Zh2oQP3pCQ?=
 =?us-ascii?Q?6Xa21kCjAFxl1i3gZyAJyCyjefplfzEVvwyrhtYQL+PXxbMLwdc76TJLzFQd?=
 =?us-ascii?Q?5iovCImZroPivDhDkke7Q23T3anf67BjUnLXuxmHki/NU6EJGexz0UItgiQ5?=
 =?us-ascii?Q?qJjfaDdE0MD+vcTwjAStmULIl5xCYpKAOFcYQ2yMXMgx4JsHkFTbgUQH8Sqk?=
 =?us-ascii?Q?jB2mO1DSjr4v0Ingt600IP0gl+tzkFWjv6fsX/ByTz19sBeGzoZwoPecpl7g?=
 =?us-ascii?Q?8GXfv0EHLqFoufCE1iwac1wNLzvd5lnhPq/tsxGusQHsBhg407j3LmM7xnN/?=
 =?us-ascii?Q?VM3HlxBY20GdpSHmubklckHoQfmpJ1/L+bt+fWWTUG3e5E4ZN66uIWyA0kIk?=
 =?us-ascii?Q?s5pOsw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: cF6WSFBq0CsnqAOEIz6544l2KRQYcbJ5azGt0XKaiWjz9twxvknuscRRtG/zZ3qDX6nlgK/aBiJCVIdO/TgksbRR/RGZrnO5VaYQ19Bqe15PxXJX3II2Vo0deoWvt6d9purHG4TDCFX0SIBf9SMZ5JkzxEoTqSqCe5N0Bh/N6jL1+Ugv2OjjAqydMmSyAmdE4XuLQnrTre6vvnIt0nwAvPRWxXdo88luyqYB88cOSCYrA3AtpiE6Y2eohWvyyYk5LxyBz1IYpgg0XUiUnMWFccsCq6lJWqr2n6IHIn/EJzT1Mle1ChR9NfV94ALB39FQgp0JWIJTJ13IpFCKkkSND8+2QD/h8ehAeuv7eqszO/LVvWBU/UD3kbDxQJWhR1m8KvVOC08bNw45yAwDLDyeOLRub3lIQ/c3WXHML0wyT0XiCYFXiZziSYZZu6cLfzEU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 06:26:23.4375 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40bac1fc-05cb-4284-9b8f-08de6548a645
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7331
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,kvack.org,linux-foundation.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[honglei1.huang@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B6BE5FAA0B
X-Rspamd-Action: no action

From: Honglei Huang <honghuan@amd.com>

Introduce new UAPI structures to support batch allocation of
non-contiguous userptr ranges in a single ioctl call.

add:
- KFD_IOC_ALLOC_MEM_FLAGS_USERPTR_BATCH flag
- struct kfd_ioctl_userptr_range for individual ranges
- struct kfd_ioctl_userptr_ranges_data for batch data

Signed-off-by: Honglei Huang <honghuan@amd.com>
---
 include/uapi/linux/kfd_ioctl.h | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
index 84aa24c02..579850e70 100644
--- a/include/uapi/linux/kfd_ioctl.h
+++ b/include/uapi/linux/kfd_ioctl.h
@@ -420,16 +420,45 @@ struct kfd_ioctl_acquire_vm_args {
 #define KFD_IOC_ALLOC_MEM_FLAGS_UNCACHED	(1 << 25)
 #define KFD_IOC_ALLOC_MEM_FLAGS_EXT_COHERENT	(1 << 24)
 #define KFD_IOC_ALLOC_MEM_FLAGS_CONTIGUOUS	(1 << 23)
+#define KFD_IOC_ALLOC_MEM_FLAGS_USERPTR_BATCH	(1 << 22)
+
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
+/* Complete userptr batch allocation data structure
+ *
+ * This structure combines the header and ranges array for convenience.
+ * User space can allocate memory for this structure with the desired
+ * number of ranges and pass a pointer to it via mmap_offset field.
+ *
+ * @num_ranges: number of ranges in the ranges array
+ * @reserved:   reserved for future use, must be 0
+ * @ranges:     flexible array of userptr ranges
+ */
+struct kfd_ioctl_userptr_ranges_data {
+	__u32 num_ranges;	/* to KFD */
+	__u32 reserved;		/* to KFD, must be 0 */
+	struct kfd_ioctl_userptr_range ranges[];	/* to KFD */
+};
 
 /* Allocate memory for later SVM (shared virtual memory) mapping.
  *
  * @va_addr:     virtual address of the memory to be allocated
  *               all later mappings on all GPUs will use this address
- * @size:        size in bytes
+ * @size:        size in bytes (total size for batch allocation)
  * @handle:      buffer handle returned to user mode, used to refer to
  *               this allocation for mapping, unmapping and freeing
  * @mmap_offset: for CPU-mapping the allocation by mmapping a render node
  *               for userptrs this is overloaded to specify the CPU address
+ *               for batch userptr (KFD_IOC_ALLOC_MEM_FLAGS_USERPTR_BATCH),
+ *               this should point to a kfd_ioctl_userptr_ranges_data structure
  * @gpu_id:      device identifier
  * @flags:       memory type and attributes. See KFD_IOC_ALLOC_MEM_FLAGS above
  */
-- 
2.34.1

