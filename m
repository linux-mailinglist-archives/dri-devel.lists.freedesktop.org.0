Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EGFG7CJhWkWDQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 07:26:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 225CCFAA77
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 07:26:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 732BF10E391;
	Fri,  6 Feb 2026 06:26:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EZ4B/QnD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010061.outbound.protection.outlook.com [52.101.61.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 950E810E390;
 Fri,  6 Feb 2026 06:26:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IGD8826yedZP3G9U4dBJbsBRYp4IiwcJUMIpoNuEa9f3tYCGyvlmwwWSgv050KwcvZ16z+I4r9dj4Cnu6wbjgHBhhk5Wx87h1yMdyy3Rwv8KGPC88myXHtMp9djiXYfE5mSpkkxrdFldfniIoir9MrLRriycVtSALSZ0+dEUK3r5xeHYQKri3emZdX1UDZQHOzP0kIJL8yT6q1w6TDMxarLrTDJLcn+VirkRx3btO9rZk18hdvrlT5d0cJYWz4sn1SA68qV2H7jEBzkBnXdMCwDJkBsgPG8Z//Y0S4n8GMs/0WA/aXSLAZqbXbsYKZXkOeMY2dtOenjrOeY9HxmG8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VJTtTawA2Hmf4olaQXrPFzgodT38XQ6lbiOfeh8E2SQ=;
 b=FS29aNbAgI2QIWqSeAmAPu5j8XiH6GK2fI3iDeomUvSFep+SkHZUlHhHa4sRGtyWvpUh+leB0vnQUCag6XoADRa1EaqaGjdGjIK1cHL5eyiSERwrFJIXwYEHTR7oPbl8+IdJxuFih0B8iuVKIpAH451FuGPyXg1d4M1o6wn3QC8mbjCjOQGWLCvKuZTLHrpJr4CItVjk4zJky90KKs2YrcrGwnpI1Bg+eVlLfBO5JiVUIlqEg/TzEoP97blAVwXvybgyz9tdI3A7u0ppfl4AUg0FtNE2NOiRPjx2vktQUG07GTdSwD/Jb4+musnAdyTTotYX33wl+VkI2/f35HIHpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=collabora.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VJTtTawA2Hmf4olaQXrPFzgodT38XQ6lbiOfeh8E2SQ=;
 b=EZ4B/QnDVZPRV5Y1OYBxRoymrGUa17oIY/WpAGL3xNqbyQmHznaDhd7k2iMbcwdef2voNgXD5QDMWoY5N3KmxGTREbCUJMQv3l8Qgq7YOQQeCUuWRPJ7+Bn/TCEj2T/bWgKVRJAvbaJbe7jlLiA6o+MCjTIPAhnZL5MzGpPPc2Y=
Received: from MN0PR03CA0003.namprd03.prod.outlook.com (2603:10b6:208:52f::8)
 by BL1PR12MB5708.namprd12.prod.outlook.com (2603:10b6:208:387::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 06:26:47 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:208:52f:cafe::75) by MN0PR03CA0003.outlook.office365.com
 (2603:10b6:208:52f::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 06:26:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 06:26:47 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Feb
 2026 00:26:44 -0600
From: Honglei Huang <honglei1.huang@amd.com>
To: <Felix.Kuehling@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Ray.Huang@amd.com>
CC: <dmitry.osipenko@collabora.com>, <Xinhui.Pan@amd.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <akpm@linux-foundation.org>, <honghuan@amd.com>
Subject: [PATCH v3 8/8] drm/amdkfd: Wire up batch allocation in ioctl handler
Date: Fri, 6 Feb 2026 14:25:57 +0800
Message-ID: <20260206062557.3718801-9-honglei1.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|BL1PR12MB5708:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d63158a-ba1e-48e1-d373-08de6548b4c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?a7MVteIVpH26UczuMPT2fcAHfF+lTgSbRT+EK1lj7J4Qj4SZDYn2Dii2GDtl?=
 =?us-ascii?Q?OG6hn54R+ncm/LuRdP4W9bh0JKVMfnk5o8wyvi2bhv9OSEage9VeWALZl4AQ?=
 =?us-ascii?Q?V4jW+fDGiAkyfjKamU0UXE8kSaGWatMeedXfqZHe6gyYgnVdFzHaq9U/wIxY?=
 =?us-ascii?Q?vnx5tHo35CVBidEQB/x8ku2g0YSHx7Cu6Hv1mHPSlFbgx4vmPN7jYwCJP30o?=
 =?us-ascii?Q?JTCYAIYrBce5/kkyQT4SOkuLV2uOIr/KeNo8DbzraiX2Db1EhMQl0jAMqqdF?=
 =?us-ascii?Q?y2mdo/wKQDEu5IOBkz8mNWzreF0tQRjmZDP66zdg2ead5uIsmDLDcUTMbCOI?=
 =?us-ascii?Q?T2f2L2UIC7okrwaHAWImLlMitDoKxj7Ukxs0LmLv+M6rx8S1wB/8M6+WtnxZ?=
 =?us-ascii?Q?piLiFFC6E425XA5iEEN1Cn2FWq5kchehX2FJi+IRmI1gZpDD2FpPDprO89fA?=
 =?us-ascii?Q?ELrPjeHTCArEN/dgEymgTQ7J1hee4WmtydO5C17qh6+B21Hlxr+zGoMbLHkO?=
 =?us-ascii?Q?mT9FKjffbjSAkt0S0o35f01LgMaoDohrw+kpcuVbpnP2mFIDj2hwc54c/+oN?=
 =?us-ascii?Q?UrbRQvqfrAiUhUFANkDb1kjrSovFQtKTdNSEBh56NBrXoeqAfY5m2FS5+myp?=
 =?us-ascii?Q?hEkr8+Svf/bW+bnKjIuaGHtDZZae8cBZp7djknar6r7/aqpSEcT5+V31fw0l?=
 =?us-ascii?Q?VLZYH0OBvoA0r91VMl/tWs6HhbPpzuFiai2/YSV57FXfnpOlQFeS5/ttXD/F?=
 =?us-ascii?Q?HahKgjF+sDpP+/PVK2VIC5iB0OThpsXaJrJQHOweN5c0UD8aE6X3dIoL+PPq?=
 =?us-ascii?Q?g52an0xbfC1erIKLrou2jaiwZA3peuhMy8+dachsBbECmeQbcX+aXmJApAkj?=
 =?us-ascii?Q?Kr4jPeMLVSiM5Jz1RTHUWPEYDXUIn6PtmZthKnn+H9u9cBRhp9+HkVT98OfJ?=
 =?us-ascii?Q?8BKZZt4le4E3aVmPW4XhtDc6Yi97BNVzZ/M4hJDrkICA5mdcZwx6pQVxBc3T?=
 =?us-ascii?Q?0HPWkkX9bRVzQSNse1fspa5AIjUiq+vhWJrIo0soEkhMmZX+dm6rU05SQw1V?=
 =?us-ascii?Q?H2QHbhTEjOKiQH6jEvVemRHygoxvgMJSiml5WwNE+fx0F1nqds8zy+480csG?=
 =?us-ascii?Q?SejR7L55aXORJbRC47NcXfU57xdBvY8xwDWeerhfmIzukHjm2uTsOaUc+3Rm?=
 =?us-ascii?Q?xPVAnME9ITfabuL9XMCn45f1p3uNqVaCWpsA9E6dd5EsAPSazcHF6jvPfFtg?=
 =?us-ascii?Q?5P5IIWEG3bCHKbMLUgZ5uNYx/vrvVjKBw/jAl4Qsv0MGmx5Oqst3GUPANyXw?=
 =?us-ascii?Q?lcGcIugbb+sIqNkypLsPtr528QNIz9gZ74ViB4dpdwb0amCoTviCXQYburN2?=
 =?us-ascii?Q?IjLFi2RkzqDzuPABVlM9UZfA/5R+zq07uFONiNo8AN+LCfzdsCyhEcDsz+tZ?=
 =?us-ascii?Q?MAMp4M40grwFt80w7sfungu+oG1wEzruP7xEOC3OB9o/ulB3HgOqQwLppkRj?=
 =?us-ascii?Q?RAmFI1H2PV6Oh2P4HQwff1XDXJldVtHqdCq2gBAlbtT+iuRtm+N9AJL6gNGd?=
 =?us-ascii?Q?hMUb9mSjU7YwoKYQkThgzoXweeTBSP3AUkJVFF3b8aSfEkgLOeUe3G5ScvWw?=
 =?us-ascii?Q?6mtLh6i1bdKhBPRZZsdQqNLbiQHLAdmWiIRKS7XMwmsm5Ns6In4GwD1H7YzQ?=
 =?us-ascii?Q?Od0dCw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /wlwgGgIODKgPF93/DkBO5txWHpsHvcfgQwlKuC6G3Ts99cIHiPUWVL0MnVNCJlagJFdBPbVIVz347ZMwRdd0VuKD7ZhyrKhSvFOyDR81v6ZoxwmWyGAE+YGUDdXTPzoJdjhIJKKZX6rOKoFgNtcQq2fmY3ShmTlEGwJH2yw2c4H2Ttb1/OsIPsbXnBg+aS5JzW0eWl4eTepFN0rdmSLIkywwdDbQtDDlL4U/6sWfsRLytgq4eyvphBnBlnmyrvOOcypeMc9at6aZGEdKfiTjdNYaLLleeeuBnBWP06nJo1L00FCVFgXfqqmhlXLXnNLt9F4KT15M1BzhC63ecbI1bJOWvG+s/ZMYDCYd/63cLTFpeeZu49GcmahahuIcAGgPRKpQDK76POvXKjzrDVas2diUcIKs01hjRDsIwKN7MtelFz+a0KCJHOFU+E5qhLk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 06:26:47.7797 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d63158a-ba1e-48e1-d373-08de6548b4c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5708
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 225CCFAA77
X-Rspamd-Action: no action

From: Honglei Huang <honghuan@amd.com>

Integrate batch userptr allocation into the KFD ioctl interface.

This adds:
- kfd_copy_userptr_ranges(): validates and copies batch range data
  from userspace, checking alignment, sizes, and total size match
- Modifications to kfd_ioctl_alloc_memory_of_gpu() to detect batch
  mode and route to appropriate allocation function
- SVM conflict checking extended for batch ranges

Signed-off-by: Honglei Huang <honghuan@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 128 +++++++++++++++++++++--
 1 file changed, 122 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index a72cc980a..d0b56d5cc 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1047,10 +1047,79 @@ static int kfd_ioctl_get_available_memory(struct file *filep,
 	return 0;
 }
 
+static int kfd_copy_userptr_ranges(void __user *user_data, uint64_t expected_size,
+				   struct kfd_ioctl_userptr_range **ranges_out,
+				   uint32_t *num_ranges_out)
+{
+	struct kfd_ioctl_userptr_ranges_data ranges_header;
+	struct kfd_ioctl_userptr_range *ranges;
+	uint64_t total_size = 0;
+	uint32_t num_ranges;
+	size_t header_size;
+	uint32_t i;
+
+	if (!user_data) {
+		pr_err("Batch allocation: ranges pointer is NULL\n");
+		return -EINVAL;
+	}
+
+	header_size = offsetof(struct kfd_ioctl_userptr_ranges_data, ranges);
+	if (copy_from_user(&ranges_header, user_data, header_size)) {
+		pr_err("Failed to copy ranges data header from user space\n");
+		return -EFAULT;
+	}
+
+	num_ranges = ranges_header.num_ranges;
+	if (num_ranges == 0) {
+		pr_err("Batch allocation: invalid number of ranges %u\n", num_ranges);
+		return -EINVAL;
+	}
+
+	if (ranges_header.reserved != 0) {
+		pr_err("Batch allocation: reserved field must be 0\n");
+		return -EINVAL;
+	}
+
+	ranges = kvmalloc_array(num_ranges, sizeof(*ranges), GFP_KERNEL);
+	if (!ranges)
+		return -ENOMEM;
+
+	if (copy_from_user(ranges, user_data + header_size,
+			   num_ranges * sizeof(*ranges))) {
+		pr_err("Failed to copy ranges from user space\n");
+		kvfree(ranges);
+		return -EFAULT;
+	}
+
+	for (i = 0; i < num_ranges; i++) {
+		if (!ranges[i].start || !ranges[i].size ||
+		    (ranges[i].start & ~PAGE_MASK) ||
+		    (ranges[i].size & ~PAGE_MASK)) {
+			pr_err("Invalid range %u: start=0x%llx size=0x%llx\n",
+			       i, ranges[i].start, ranges[i].size);
+			kvfree(ranges);
+			return -EINVAL;
+		}
+		total_size += ranges[i].size;
+	}
+
+	if (total_size != expected_size) {
+		pr_err("Size mismatch: provided %llu != calculated %llu\n",
+		       expected_size, total_size);
+		kvfree(ranges);
+		return -EINVAL;
+	}
+
+	*ranges_out = ranges;
+	*num_ranges_out = num_ranges;
+	return 0;
+}
+
 static int kfd_ioctl_alloc_memory_of_gpu(struct file *filep,
 					struct kfd_process *p, void *data)
 {
 	struct kfd_ioctl_alloc_memory_of_gpu_args *args = data;
+	struct kfd_ioctl_userptr_range *ranges = NULL;
 	struct kfd_process_device *pdd;
 	void *mem;
 	struct kfd_node *dev;
@@ -1058,16 +1127,32 @@ static int kfd_ioctl_alloc_memory_of_gpu(struct file *filep,
 	long err;
 	uint64_t offset = args->mmap_offset;
 	uint32_t flags = args->flags;
+	uint32_t num_ranges = 0;
+	bool is_batch = false;
 
 	if (args->size == 0)
 		return -EINVAL;
 
+	if ((flags & KFD_IOC_ALLOC_MEM_FLAGS_USERPTR) &&
+	    (flags & KFD_IOC_ALLOC_MEM_FLAGS_USERPTR_BATCH)) {
+		is_batch = true;
+	}
+
 	if (p->context_id != KFD_CONTEXT_ID_PRIMARY && (flags & KFD_IOC_ALLOC_MEM_FLAGS_USERPTR)) {
 		pr_debug("USERPTR is not supported on non-primary kfd_process\n");
 
 		return -EOPNOTSUPP;
 	}
 
+	if (is_batch) {
+		err = kfd_copy_userptr_ranges((void __user *)args->mmap_offset,
+					      args->size, &ranges, &num_ranges);
+		if (err)
+			return err;
+
+		offset = 0;
+	}
+
 #if IS_ENABLED(CONFIG_HSA_AMD_SVM)
 	/* Flush pending deferred work to avoid racing with deferred actions
 	 * from previous memory map changes (e.g. munmap).
@@ -1086,13 +1171,15 @@ static int kfd_ioctl_alloc_memory_of_gpu(struct file *filep,
 		pr_err("Address: 0x%llx already allocated by SVM\n",
 			args->va_addr);
 		mutex_unlock(&p->svms.lock);
-		return -EADDRINUSE;
+		err = -EADDRINUSE;
+		goto err_free_ranges;
 	}
 
 	/* When register user buffer check if it has been registered by svm by
 	 * buffer cpu virtual address.
+	 * For batch mode, check each range individually below.
 	 */
-	if ((flags & KFD_IOC_ALLOC_MEM_FLAGS_USERPTR) &&
+	if ((flags & KFD_IOC_ALLOC_MEM_FLAGS_USERPTR) && !is_batch &&
 	    interval_tree_iter_first(&p->svms.objects,
 				     args->mmap_offset >> PAGE_SHIFT,
 				     (args->mmap_offset  + args->size - 1) >> PAGE_SHIFT)) {
@@ -1102,6 +1189,22 @@ static int kfd_ioctl_alloc_memory_of_gpu(struct file *filep,
 		return -EADDRINUSE;
 	}
 
+	/* Check each userptr range for SVM conflicts in batch mode */
+	if (is_batch) {
+		uint32_t i;
+		for (i = 0; i < num_ranges; i++) {
+			if (interval_tree_iter_first(&p->svms.objects,
+						     ranges[i].start >> PAGE_SHIFT,
+						     (ranges[i].start + ranges[i].size - 1) >> PAGE_SHIFT)) {
+				pr_err("Userptr range %u (0x%llx) already allocated by SVM\n",
+				       i, ranges[i].start);
+				mutex_unlock(&p->svms.lock);
+				err = -EADDRINUSE;
+				goto err_free_ranges;
+			}
+		}
+	}
+
 	mutex_unlock(&p->svms.lock);
 #endif
 	mutex_lock(&p->mutex);
@@ -1149,10 +1252,17 @@ static int kfd_ioctl_alloc_memory_of_gpu(struct file *filep,
 		}
 	}
 
-	err = amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
-		dev->adev, args->va_addr, args->size,
-		pdd->drm_priv, (struct kgd_mem **) &mem, &offset,
-		flags, false);
+	if (is_batch) {
+		err = amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu_batch(
+			dev->adev, args->va_addr, args->size, pdd->drm_priv,
+			(struct kgd_mem **)&mem, &offset, ranges, num_ranges,
+			flags, false);
+	} else {
+		err = amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
+			dev->adev, args->va_addr, args->size,
+			pdd->drm_priv, (struct kgd_mem **) &mem, &offset,
+			flags, false);
+	}
 
 	if (err)
 		goto err_unlock;
@@ -1184,6 +1294,9 @@ static int kfd_ioctl_alloc_memory_of_gpu(struct file *filep,
 		args->mmap_offset = KFD_MMAP_TYPE_MMIO
 					| KFD_MMAP_GPU_ID(args->gpu_id);
 
+	if (is_batch)
+		kvfree(ranges);
+
 	return 0;
 
 err_free:
@@ -1193,6 +1306,9 @@ static int kfd_ioctl_alloc_memory_of_gpu(struct file *filep,
 err_pdd:
 err_large_bar:
 	mutex_unlock(&p->mutex);
+err_free_ranges:
+	if (ranges)
+		kvfree(ranges);
 	return err;
 }
 
-- 
2.34.1

