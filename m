Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCn6HnCbiWm1/gQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 09:31:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8D210D022
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 09:31:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EAEE10E349;
	Mon,  9 Feb 2026 08:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="t8hIq6kQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010005.outbound.protection.outlook.com [52.101.85.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 960B810E345;
 Mon,  9 Feb 2026 08:31:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D9pCU2RXCGNLGlQsPeX5PAkzhOoxAMNnlJycoXLuGL5KghgoH2qL6P9vJbEAoTOmN6IEsylWYGDRoKpqWIYl++98OUs9/edO4Qz1FgdnSLQuZbs1uTeSPt4VFn7StyOHLE32ZAFKjR7Jkl3hMyGeb/r4HqZBQXlQflObKpwDDgT+JkbHZXAEccR82CDBCm6lnXqVrbyJ+sW/rixQwEiDdDVlClPL47vOvkkdLiA1uOWzE7oAPAI1jnpyZet7Hxjo5zyVJOsfueRuQYfHOOHbNDdW4yRantsQdfoFO7CqURKVPeyOVgDhaq9BCADWjdRzypbsej4bFlsv94OVdfsf6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pMBDex6Jz6/myRPUZ72oLaB4YPrzFKpkHqCfCJWwoQ=;
 b=Fpko8Qwt87dAYqMLdumLdtLIIOars52dP9dR4a4I4SATAP/RrtNnFDOhMXYLgsXrcQL2m4NWvTH3xMGRm/aDjpp0rop531ySfJauX/XyLG1DNCx2wQ6MRP8WZantCmeB0282XKmqA63nhOy/e0bMS0GIftVju2btC4bmZ0/xB/r4jTqd5+Xh5oem0+ujeU/9XC/PNUEnETw16h1XBoAiYizRaHh/HgZrv3qVIRkIdj2CAhspI68AjWRafYZO8QsvDayJw3ccFVA0wUUzaZZdrsvEge3lf+MQpM0NtFZeu/wqa/BAOCwwJiIJX7eWT2AQ1Ryb5qiRhNE+syrMyupx3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6pMBDex6Jz6/myRPUZ72oLaB4YPrzFKpkHqCfCJWwoQ=;
 b=t8hIq6kQ6GmBFKqkYezmrX9t2wmfZUK5BvgtOwLGr9nWYufy8UypM4NSNJkNlprMT0U8kr/ujMuW6lJdZ2dem7vbmsbJyMiRFFggpPvCBOaJiy16MVh8OP0sxs75sepX8pEbo3lOSoAUDABCeQ92hZ60maIHdN/LLUHc+C8QAj0=
Received: from PH7P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::13)
 by PH7PR12MB9066.namprd12.prod.outlook.com (2603:10b6:510:1f6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Mon, 9 Feb
 2026 08:31:35 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:510:326:cafe::6f) by PH7P220CA0007.outlook.office365.com
 (2603:10b6:510:326::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 08:31:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 08:31:35 +0000
Received: from arun-nv33.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 9 Feb
 2026 02:31:32 -0600
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <matthew.auld@intel.com>, <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v3 2/2] drm/buddy: Add KUnit test for offset-aligned
 allocations
Date: Mon, 9 Feb 2026 14:00:51 +0530
Message-ID: <20260209083051.13376-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260209083051.13376-1-Arunpravin.PaneerSelvam@amd.com>
References: <20260209083051.13376-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|PH7PR12MB9066:EE_
X-MS-Office365-Filtering-Correlation-Id: a3006789-5eee-4dff-2f4f-08de67b5a2f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zm2HkvltahKHWQBPuCtFX5vgp3w5Uw470gjYOfzwvWuul4qbYMXgaEKCqrf9?=
 =?us-ascii?Q?gRQUhs+gGneyb5MeXdu8TjXXHOcjAZaiFNRRti6kjR4kMj5pooqDyPGXa864?=
 =?us-ascii?Q?ne8DFfMomsjURE5iJnhQl5om04kwNmUiieT4h6oV3HVh0/ECElHlTBEuohmJ?=
 =?us-ascii?Q?bs4pNSl0lkA/ilEw3edCn1co6J0kx+kRlgGrWPwXrBeqLLcwYc9soQvH4oig?=
 =?us-ascii?Q?/1+OKUZn4N4mbx0lGQl4gjRZ5kkOaXqv25Ilhdz3JYY9rVT3gDXb2i+JJq8j?=
 =?us-ascii?Q?Vp8rG+ByiEnkconhK3UBPfS2TLoOlvue+03aUGgbVSBLHBAMdUWVcR2EVMVr?=
 =?us-ascii?Q?87LWGDEfe3IjtVn2Cm+ESu513LZ9uAAeZHf3XDv3C8QdyfN/14/99CoGQlUw?=
 =?us-ascii?Q?NBZFaVcF5s4o2qIL6f5fJLlbeh15A+mcFkrKtnNjWn5+kDrtn372iMPfg6FN?=
 =?us-ascii?Q?YZ6h376fyUBJ1WgmmUuUhpUxnXXtXFTZe2cDhV/+qnp2CoS4STXd3H4XiOxz?=
 =?us-ascii?Q?lHkt/SOPPUPdIi68XEicXnz85ujrhJR6P4C2FnDE5kxGOTuumx/TwRcbXUp7?=
 =?us-ascii?Q?98mNQ9JAG1jrNw9d7vt3PUMzC1y0EtKYz1c1A+nkynd0iTfeWvgPEX+SBzj7?=
 =?us-ascii?Q?en8apU6rmTSmpE0Gg14N7MAAPqaHgDAwC6vcyjcNdbfFRvhW3fvmhFGRU/K7?=
 =?us-ascii?Q?fJjo0sKZKJVc1j5fNsXjgX7qf5xoruf/0QKemNE4uE2DurQMdrLYITT00Enm?=
 =?us-ascii?Q?NFyc97or1exLZhCVSVZp4FZUjd78qhFqLr9E6hpLjrF5iBOaOkIKe03Ek+Zb?=
 =?us-ascii?Q?/Uk+WpF10XL/oyAJCAYssI1L5G8vZjDca32T4tyy3zTJ7DfHxyTuUKvPuMiW?=
 =?us-ascii?Q?LcNcpmrdtBt0YGeyrXZjuh4CME+OB/rY5dRbw64Rdmy2Uhc1unm0LYfBmpKg?=
 =?us-ascii?Q?y9d/aSuGgXH+VFgIKi3atRiTAqm0HvkSXlkTwX2Ygqg9XlD2ie7q79fHWUFO?=
 =?us-ascii?Q?iFOxSwSiDahoeb0/57fdGuJA6+GCaffPKPrNUpuAvh6Cd9Q+aGZ0V1MPtGs9?=
 =?us-ascii?Q?Ta0Ar+CaYeUsK8K10MroGKroeHzbeUeE+Y9ho9Uc5OBYG9y4wR1apC7UPG24?=
 =?us-ascii?Q?Y+7yyKddmvqmGVt38tYEXYFSyl+6art3QGhbWHVMSCrVwzDPLpVEtQo2HMG6?=
 =?us-ascii?Q?JoQJvs+C00MCy8Fn/2eN9aCrB9aq/dB4V59gbOL6s7GER7Bi++4tZtNHu1kB?=
 =?us-ascii?Q?XUlMCUpFbHoQt9lXAYbhvCX65qmJEkruUsG5R4d/dKq2lCvEwZQLTQDlcrEj?=
 =?us-ascii?Q?560G33pMCpblWyuoyqCA+fyvKdr1Ru0wFTBA1WTgJUkkflzB8+fYN72cuhtD?=
 =?us-ascii?Q?AtJLPuqb0lY2Lf5bKWiAA4oHuFaOSLMI1QVz5BMEGxx3okaJyfpAIp1YTa7w?=
 =?us-ascii?Q?tiVviHXV8R1t15WA24MP1unwS/LqoxrjOy1c+kj9AjdbLnviuEDQ3CnJINcG?=
 =?us-ascii?Q?DrYJQfxhGFtZVwRGnITDjXf0k7Vx1nacc8QamzJxXtBOfYOcwuUvCS8EKmum?=
 =?us-ascii?Q?sM6J/j2NNo4xX0CpBBckpBs4Q8x/XNW5TaWIgK3kGYjwrVxtaErCoAewNQl2?=
 =?us-ascii?Q?xhqcJatI0UWEMEQOMP0BWAozHHh+ArWxkqYIoAEDQbQiniI+4aNAb6TqRI68?=
 =?us-ascii?Q?OY2++w=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MlqHO1Amb/MkLPDo/chuhecN5Pt0+wO2YpFqptj4el/7I9RoDLC4QeIemIZKNHwHmjdL8OXJcjm6z8hSI4tXQ6TnJUYvNjcV1YviJw1YnET2sWD7V71QB9fx21+iJnkKNOAOK9sW5XkYdoYniRNd44GvPjugiTXoBA8nqR+Sw1zSXjdbgE0zXdnEvwDiC9OfSQjbVQ4YYN4O1w5OpHbvGEVUyD2OiMs0JM9HyozOjreCLl6W/lW4YPej3hw28DgE3HW+EvdaSDof1fmeE+/x6T/2FNyvyD1MPgvrwfrWxIIT8+SHeueFGnamY3EVQtpghfekLZr6IWplDO2pt/9q8rU9KoGFq58SzW9BiMsgle14xKd4JY0UzGVp6G4/Z0mVxcDdECeUaXt6VzW8g4SV/gMRIAzqSTH6Mk7bPyOwMnvmbIb+mL4FQzczgW7QTrHk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 08:31:35.3327 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3006789-5eee-4dff-2f4f-08de67b5a2f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9066
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
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[Arunpravin.PaneerSelvam@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.981];
	HAS_XOIP(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2F8D210D022
X-Rspamd-Action: no action

Add KUnit test to validate offset-aligned allocations in the DRM buddy
allocator.

Validate offset-aligned allocation:
The test covers allocations with sizes smaller than the alignment constraint
and verifies correct size preservation, offset alignment, and behavior across
multiple allocation sizes. It also exercises fragmentation by freeing
alternating blocks and confirms that allocation fails once all aligned offsets
are consumed.

Stress subtree_max_alignment propagation:
Exercise subtree_max_alignment tracking by allocating blocks with descending
alignment constraints and freeing them in reverse order. This verifies that
free-tree augmentation correctly propagates the maximum offset alignment
present in each subtree at every stage.

v2:
  - Move the patch to gpu/tests/gpu_buddy_test.c file.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/tests/gpu_buddy_test.c | 166 +++++++++++++++++++++++++++++
 1 file changed, 166 insertions(+)

diff --git a/drivers/gpu/tests/gpu_buddy_test.c b/drivers/gpu/tests/gpu_buddy_test.c
index 450e71deed90..37f22655b5fb 100644
--- a/drivers/gpu/tests/gpu_buddy_test.c
+++ b/drivers/gpu/tests/gpu_buddy_test.c
@@ -21,6 +21,170 @@ static inline u64 get_size(int order, u64 chunk_size)
 	return (1 << order) * chunk_size;
 }
 
+static void gpu_test_buddy_subtree_offset_alignment_stress(struct kunit *test)
+{
+	struct gpu_buddy_block *block;
+	struct rb_node *node = NULL;
+	const u64 mm_size = SZ_2M;
+	const u64 alignments[] = {
+		SZ_1M,
+		SZ_512K,
+		SZ_256K,
+		SZ_128K,
+		SZ_64K,
+		SZ_32K,
+		SZ_16K,
+		SZ_8K,
+	};
+
+	struct list_head allocated[ARRAY_SIZE(alignments)];
+	unsigned int i, order, max_subtree_align = 0;
+	struct gpu_buddy mm;
+	int ret, tree;
+
+	KUNIT_ASSERT_FALSE(test, gpu_buddy_init(&mm, mm_size, SZ_4K),
+			   "buddy_init failed\n");
+
+	for (i = 0; i < ARRAY_SIZE(allocated); i++)
+		INIT_LIST_HEAD(&allocated[i]);
+
+	/*
+	 * Exercise subtree_max_alignment tracking by allocating blocks with descending
+	 * alignment constraints and freeing them in reverse order. This verifies that
+	 * free-tree augmentation correctly propagates the maximum offset alignment
+	 * present in each subtree at every stage.
+	 */
+
+	for (i = 0; i < ARRAY_SIZE(alignments); i++) {
+		struct gpu_buddy_block *root = NULL;
+		unsigned int expected;
+		u64 align;
+
+		align = alignments[i];
+		expected = ilog2(align) - 1;
+
+		for (;;) {
+			ret = gpu_buddy_alloc_blocks(&mm,
+						     0, mm_size,
+						     SZ_4K, align,
+						     &allocated[i],
+						     0);
+			if (ret)
+				break;
+
+			block = list_last_entry(&allocated[i],
+						struct gpu_buddy_block,
+						link);
+			KUNIT_EXPECT_EQ(test, gpu_buddy_block_offset(block) & (align - 1), 0ULL);
+		}
+
+		for (order = mm.max_order + 1; order-- > 0 && !root; ) {
+			for (tree = 0; tree < 2; tree++) {
+				node = mm.free_trees[tree][order].rb_node;
+				if (node) {
+					root = container_of(node,
+							    struct gpu_buddy_block,
+							    rb);
+					break;
+				}
+			}
+		}
+
+		KUNIT_ASSERT_NOT_NULL(test, root);
+		KUNIT_EXPECT_EQ(test, root->subtree_max_alignment, expected);
+	}
+
+	for (i = ARRAY_SIZE(alignments); i-- > 0; ) {
+		gpu_buddy_free_list(&mm, &allocated[i], 0);
+
+		for (order = 0; order <= mm.max_order; order++) {
+			for (tree = 0; tree < 2; tree++) {
+				node = mm.free_trees[tree][order].rb_node;
+				if (!node)
+					continue;
+
+				block = container_of(node, struct gpu_buddy_block, rb);
+				max_subtree_align = max(max_subtree_align, block->subtree_max_alignment);
+			}
+		}
+
+		KUNIT_EXPECT_GE(test, max_subtree_align, ilog2(alignments[i]));
+	}
+
+	gpu_buddy_fini(&mm);
+}
+
+static void gpu_test_buddy_offset_aligned_allocation(struct kunit *test)
+{
+	struct gpu_buddy_block *block, *tmp;
+	int num_blocks, i, count = 0;
+	LIST_HEAD(allocated);
+	struct gpu_buddy mm;
+	u64 mm_size = SZ_4M;
+	LIST_HEAD(freed);
+
+	KUNIT_ASSERT_FALSE_MSG(test, gpu_buddy_init(&mm, mm_size, SZ_4K),
+			       "buddy_init failed\n");
+
+	num_blocks = mm_size / SZ_256K;
+	/*
+	 * Allocate multiple sizes under a fixed offset alignment.
+	 * Ensures alignment handling is independent of allocation size and
+	 * exercises subtree max-alignment pruning for small requests.
+	 */
+	for (i = 0; i < num_blocks; i++)
+		KUNIT_ASSERT_FALSE_MSG(test, gpu_buddy_alloc_blocks(&mm, 0, mm_size, SZ_8K, SZ_256K,
+								    &allocated, 0),
+					"buddy_alloc hit an error size=%u\n", SZ_8K);
+
+	list_for_each_entry(block, &allocated, link) {
+		/* Ensure the allocated block uses the expected 8 KB size */
+		KUNIT_EXPECT_EQ(test, gpu_buddy_block_size(&mm, block), SZ_8K);
+		/* Ensure the block starts at a 256 KB-aligned offset for proper alignment */
+		KUNIT_EXPECT_EQ(test, gpu_buddy_block_offset(block) & (SZ_256K - 1), 0ULL);
+	}
+	gpu_buddy_free_list(&mm, &allocated, 0);
+
+	for (i = 0; i < num_blocks; i++)
+		KUNIT_ASSERT_FALSE_MSG(test, gpu_buddy_alloc_blocks(&mm, 0, mm_size, SZ_16K, SZ_256K,
+								    &allocated, 0),
+					"buddy_alloc hit an error size=%u\n", SZ_16K);
+
+	list_for_each_entry(block, &allocated, link) {
+		/* Ensure the allocated block uses the expected 16 KB size */
+		KUNIT_EXPECT_EQ(test, gpu_buddy_block_size(&mm, block), SZ_16K);
+		/* Ensure the block starts at a 256 KB-aligned offset for proper alignment */
+		KUNIT_EXPECT_EQ(test, gpu_buddy_block_offset(block) & (SZ_256K - 1), 0ULL);
+	}
+
+	/*
+	 * Free alternating aligned blocks to introduce fragmentation.
+	 * Ensures offset-aligned allocations remain valid after frees and
+	 * verifies subtree max-alignment metadata is correctly maintained.
+	 */
+	list_for_each_entry_safe(block, tmp, &allocated, link) {
+		if (count % 2 == 0)
+			list_move_tail(&block->link, &freed);
+		count++;
+	}
+	gpu_buddy_free_list(&mm, &freed, 0);
+
+	for (i = 0; i < num_blocks / 2; i++)
+		KUNIT_ASSERT_FALSE_MSG(test, gpu_buddy_alloc_blocks(&mm, 0, mm_size, SZ_16K, SZ_256K,
+								    &allocated, 0),
+					"buddy_alloc hit an error size=%u\n", SZ_16K);
+
+	/*
+	 * Allocate with offset alignment after all slots are used; must fail.
+	 * Confirms that no aligned offsets remain.
+	 */
+	KUNIT_ASSERT_TRUE_MSG(test, gpu_buddy_alloc_blocks(&mm, 0, mm_size, SZ_16K, SZ_256K,
+							   &allocated, 0),
+			       "buddy_alloc hit an error size=%u\n", SZ_16K);
+	gpu_buddy_free_list(&mm, &allocated, 0);
+	gpu_buddy_fini(&mm);
+}
+
 static void gpu_test_buddy_fragmentation_performance(struct kunit *test)
 {
 	struct gpu_buddy_block *block, *tmp;
@@ -912,6 +1076,8 @@ static struct kunit_case gpu_buddy_tests[] = {
 	KUNIT_CASE(gpu_test_buddy_alloc_range_bias),
 	KUNIT_CASE(gpu_test_buddy_fragmentation_performance),
 	KUNIT_CASE(gpu_test_buddy_alloc_exceeds_max_order),
+	KUNIT_CASE(gpu_test_buddy_offset_aligned_allocation),
+	KUNIT_CASE(gpu_test_buddy_subtree_offset_alignment_stress),
 	{}
 };
 
-- 
2.34.1

