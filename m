Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJzmDIt6iWlm9wQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 07:11:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8FC10BF48
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 07:11:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2024A10E288;
	Mon,  9 Feb 2026 06:11:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="13/Hc8eD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011008.outbound.protection.outlook.com [52.101.52.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34ABA10E254;
 Mon,  9 Feb 2026 06:11:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VwV0L1CA8jgiIv/TdzRlg+j1dd647F/f15nXG6URN9sorn1OKUUFHXwVv+MYitA67bqWWpFkrEwp/+P3MArMMaHigNwG0i+IHZV6Tf5+pn5c49GMoaEW2oC6pC/Me326u+ZvAK2EKOFo+usKRO672m1yfIE57+H/3zr1WHCX+8wN3zxS4wdRTMY3rRyTjnauXUQK0Xtic8UZz2+MhBNcaEHZN3Danq4TUh4dG02LAz9u1a0P+04kKbHnLMOCJyPJ/BOKQoUkjqtBtRizbByiC7v7AUc1fYmOB4BnyQTfLuCnTmqUqHjpaOrP/7he8uiibltrlOXo3w14vL8nxYJpIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DuNX2/bfUoi4BGUO3MtdvWGsFfEgw11uVJsz6wEavKE=;
 b=BSQHSH9cu0/XsL7Gbs++eAhegMt8u05x4V8Uzy/cG3aS+BeRlb2RDvde8F3Jff7MeKMuDvXQ6ReDFpGG/e6C+Er/KTXgoacgYcPekghXibXqUHGEUG2CWPv37k+a4tQvjNR0j7bxBboyIr2bUeCwxjfmgr7a5zOYcUQd9Vagg6zP5c78fvUqFjCWgcSgu5m/ezvy62/2MlNdDbxM5hGhMX+ES8JFbu56JNdKrVYmwc+bXBuI95qyNVgadnQgh/ezKI/P6+mnoLxamr17q95OsITwyfyT5ELGgyiu6L5rOOnIhIfmzN5j9A8gBVKYI/Z8XiATnvkfbDEMP+y61xZF+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=collabora.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DuNX2/bfUoi4BGUO3MtdvWGsFfEgw11uVJsz6wEavKE=;
 b=13/Hc8eDia/XN7J8+rxAq9RDCb6RtMui3sVERT/ZUlODMEIUgmaUKu0emQJl47UDHPDpqKUONv45G7CStp7N3bfjtG0ERyrcnr87FL4rnTt86Epxfuzw0da3mekM7/EqOLXxWXXQP+Ku3WVdQ8ShhGJTY8Mhy3u+CAf1HlVMOpQ=
Received: from SN6PR2101CA0020.namprd21.prod.outlook.com
 (2603:10b6:805:106::30) by PH7PR12MB7308.namprd12.prod.outlook.com
 (2603:10b6:510:20c::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 06:11:13 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:805:106:cafe::32) by SN6PR2101CA0020.outlook.office365.com
 (2603:10b6:805:106::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.4 via Frontend Transport; Mon, 9
 Feb 2026 06:11:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 06:11:13 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 9 Feb
 2026 00:11:09 -0600
From: Honglei Huang <honglei1.huang@amd.com>
To: <Felix.Kuehling@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Philip.Yang@amd.com>, <Ray.Huang@amd.com>
CC: <dmitry.osipenko@collabora.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <akpm@linux-foundation.org>, <honghuan@amd.com>
Subject: [PATCH v4 3/8] drm/amdkfd: Implement interval tree for userptr ranges
Date: Mon, 9 Feb 2026 14:10:42 +0800
Message-ID: <20260209061047.3881808-4-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260209061047.3881808-1-honglei1.huang@amd.com>
References: <20260209061047.3881808-1-honglei1.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|PH7PR12MB7308:EE_
X-MS-Office365-Filtering-Correlation-Id: 97a79a6d-39fd-4799-44b0-08de67a206ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NG0TYTIH1vnPR8g0Ul4vQkCQGb6ZshGFh9wHQbOr+UWAVJTwh9pw+vwnMeLy?=
 =?us-ascii?Q?S7qD8c21ssqJMVMkYjaoP3rbn0ogJIviCVyHu+IPJ7HTrft1AcsvDUek2fid?=
 =?us-ascii?Q?5h1Nz5eeDhbEsnS/2cM/nilZcKL7But516iZJiQPN4ka51lImZeGJgOJWWhz?=
 =?us-ascii?Q?NaKu2j3bCNlyTjFrXZ5+CxeUwu7+a99Pet6I4I26T8dTAkhVo8g1fr7BcG7j?=
 =?us-ascii?Q?Yh6PiGfvtrwS9p+yvXjH024rMq47rAZpdBSAmyK/EhqJAFrqUV97WgMHyxsP?=
 =?us-ascii?Q?8syg+TYnryqTW0Hoq2Aet9cRZkMSpKjzritiwKIp7V6Jt8Fk77C/wa6xLKER?=
 =?us-ascii?Q?JSoqqB5etjdJ1IuDdalA+7Wa6jJO3Z/B5JxLLSahWcRN4nrJ6/slV8v+c2Wz?=
 =?us-ascii?Q?CpEG914cvYwnESKA302ZrVANRAP7RDCLZWOW81wUlmLhVYZglM8S9GRKMBlz?=
 =?us-ascii?Q?iYBH7vZdRBzw5XrX1shfT/xG89nmVx52uTIH0hc77xsqg1SaTU4cl0+egWLU?=
 =?us-ascii?Q?FIfdTOKCeScnDm4ZgQADDKQxg51iOf0iDSuHcBDlBDOBXiHNJruKsTTzbXZ7?=
 =?us-ascii?Q?pS9cIUVQr1G6W5DVw6RHXfA7ZcdpOKEGhVYm/6XUivtmFwTuqjmZJOE8osEB?=
 =?us-ascii?Q?nh7RXiyp3pUJWwrEwxMIxgFaPNHxHYFkKfOVgcZDuvso0hQFIWBN+shE2TaS?=
 =?us-ascii?Q?wJdsWEz678o3ek3nKGSUYVfovZFD1EeLzhcMrOFnhTp7m5hCf/RzNpacF9ok?=
 =?us-ascii?Q?G5PJwtBra8llETtvQgsuojgG0ElMANUL9Qk9yRIqMtycLXyIvR2rGhGA8bUy?=
 =?us-ascii?Q?rduT1J0+xSm/nnZbNRhkc2N9AMGfsMGyHjysAJDVI0LwhMfm7aV6b3rWzgkW?=
 =?us-ascii?Q?RrldaZpaNniI2JaevbdEmVX25CmCzd/jmQ+ekhnpvA7fgDIPah5FjZhczT3o?=
 =?us-ascii?Q?uDN5OJnkk53lStse5JfslDiDRE7r76ZieUezut22cN9PbAjDkszCwLy+Ewk4?=
 =?us-ascii?Q?3mod0CFiZlOWxSEryfako4n8fifEfntwNnJ5GIH5WVpaJYw3AlVhgXMMVmP6?=
 =?us-ascii?Q?OeZhiaaEwpBbcyRxcdzEM6cwoixgrmqcA1SlHGl9+c9dWwzUdcWYnPCSx/jS?=
 =?us-ascii?Q?GgARtS6oyDDKGAouSE7/gMjXwxOrXPO0Z8gIQs51OZ1WKk0avRc55xihsjwd?=
 =?us-ascii?Q?bWqGrsg0qMQC67eAcZx11Enqyxdx92yrERT0SQO13VY/6H3+ai3MRsBoPUqB?=
 =?us-ascii?Q?iP8YWp/dfyBOCeGbwyYOJ+eoH2roDlyNxC9+c/2ftHGJdqpy4coIlecqH4UD?=
 =?us-ascii?Q?R1wPXHhmEtfkRyE8Jjwe9XEiiBgV/fcu+hBLZA7UFskSEwAXB4PuX8E5U5FW?=
 =?us-ascii?Q?12+/iFPbIsV5iqeVE2KxPgNIkpai9P8E8GCVwZ+32YC1Eoh2gabqm6edrfBF?=
 =?us-ascii?Q?wx5IL55/43JpgafDgdhX8BR5oqeHWi0GwOravybIJTS1TLvDKOHOChg+7HIa?=
 =?us-ascii?Q?AU7ssdOcwA49tL2Qo2j8w+UEOKwFglq0k/vjeK0m0FKAEfeyWceDrBsfisbo?=
 =?us-ascii?Q?4/O1Fdn21JXjJQx63uWLio3L8dd6v+34FNjAbSIEMHIEGTqBYQRw1OjeGI43?=
 =?us-ascii?Q?cBiQc2LO/RfLP4OBcSiq9LpLFU5lQ/POA67MnXogtb6Z9gperoTgMRm6Nan1?=
 =?us-ascii?Q?JZ1raw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LjCRTNxd1KGugFIiaawG2fAe9yPEOlGQhZ3t+fDLhC9O1A7xhRJOXABcivH36oPLNqhzu7+F0v2ep7rApOIxY+omh1cUw9EPVxhAAzh7q8UJOtT909qUMpVPi1eDbBMvbz4HsjAVOvz7UMDLeWzjWQM8bdwxTQYVuOT+D4gHqBfjwsuh7gv0Z8wm4rYeSIpjEkD71FAjDMmgSWniL2ktAReODATKlNsUx1vX+8I9OEO7Go1Xwa2pVifikC9/NUvKwib4LEyK2n3FNHVnst5OYB+uwHhxrN5dHi3IzN6wPNmtYdFEW9Q3ipqq/yA5K1j0nA1yvZrByEGa+JwmVXIXZHJh9aGYxnlyEBo1IU2u2TOveD9aJcNwqxc2CuAuzwnmHXepD8/6SwE9FuJ0eWaxz0b3ISOKh+wvFHTYP6FrqSQLosCd0Su33ydoHse9hh9f
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 06:11:13.1207 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97a79a6d-39fd-4799-44b0-08de67a206ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7308
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
	FREEMAIL_CC(0.00)[collabora.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,kvack.org,linux-foundation.org,amd.com];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[honglei1.huang@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DA8FC10BF48
X-Rspamd-Action: no action

From: Honglei Huang <honghuan@amd.com>

Add interval tree support for efficient lookup of affected userptr
ranges during MMU notifier callbacks.

add:
- Include linux/interval_tree.h
- discard_invalid_ranges() function that uses interval tree to
  identify and mark ranges affected by a given invalidation event

Signed-off-by: Honglei Huang <honghuan@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index a32b46355..6fe4ed22c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -25,6 +25,7 @@
 #include <linux/pagemap.h>
 #include <linux/sched/mm.h>
 #include <linux/sched/task.h>
+#include <linux/interval_tree.h>
 #include <drm/ttm/ttm_tt.h>
 
 #include <drm/drm_exec.h>
@@ -1122,6 +1123,26 @@ static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr,
 	return ret;
 }
 
+static bool discard_invalid_ranges(struct kgd_mem *mem,
+				unsigned long inv_start, unsigned long inv_end)
+{
+	struct interval_tree_node *node;
+	struct user_range_info *range_info;
+	bool any_invalid = false;
+
+	for (node = interval_tree_iter_first(&mem->user_ranges_itree, inv_start, inv_end - 1);
+		 node;
+		 node = interval_tree_iter_next(node, inv_start, inv_end - 1)) {
+		range_info = container_of(node, struct user_range_info, it_node);
+
+		range_info->valid = false;
+		any_invalid = true;
+		pr_debug("Range [0x%llx-0x%llx) marked invalid\n",
+			 range_info->start, range_info->start + range_info->size);
+	}
+	return any_invalid;
+}
+
 /* Reserving a BO and its page table BOs must happen atomically to
  * avoid deadlocks. Some operations update multiple VMs at once. Track
  * all the reservation info in a context structure. Optionally a sync
-- 
2.34.1

