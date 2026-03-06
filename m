Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIYxK/ptqmkPRQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 07:02:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 602F221BED0
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 07:02:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7A710E37D;
	Fri,  6 Mar 2026 06:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fkUYVh/7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011071.outbound.protection.outlook.com
 [40.93.194.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A0610E379;
 Fri,  6 Mar 2026 06:02:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GxCcls8flNWNSJK4wWefYlWqRWn8a9L62FAtEsKb5+C5Sw+xnXSQcJoVKGk5D1lJuEhBkIX8hPw4QcqrbH8P0qGO3UzxYDCx7ZCUc/veGTeIom/LGjy01L+HqawEmD/re2ya1Qj8mL/n0locWAFGMCT74+FtTYdsY3F54GeJWWWAEe5P1UUBPW8I11kBOqa/Sb2eSHGmC66P2Fv2LuJxvlEe1OKfpJxyKy2LMnQyYu/33Q0xb5nHUUHvBOEjAgsDYkm6eVKO0imQbbglSAsYz1AOBppgUVUfXWqUBtCpxjnZVkmfU3hXosKlZ9rJT3E2jMdrUFOR1dQDN11jsiRebg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QBfl+9oims3t3Swi/zhSvgibjb5glCOu6+xYIFlzV0A=;
 b=Ya/XRd3nO7CeaihsPwjc0zPNPNqEewXzoKSkQ8xslR8aZEagNVBMHdsd8U5vkuLfd9ER1Omxrvk4G+8a8KYBYu0Fo0BaQh/8LUphesmiaRxKjL5RSdXcaz9l/8UgE/U6mBNyfz3vwNiaA2ljcQs4zsNAexPErdMB8uYf4VGK6Gy0AQdOmDML5jOEs4d82BKmuSdxud9+0Q7NCuAzWxV6j7EGReXSUaW1T/vc9ktPIDO5sdilhCF9zj+m07yw3jBrvrff8laJY1FnTlXTeZEU+ib+gsPTQ83h6UmOIpT6LGXqxuAk5X8PjG6lY48V3yz/JVrQgXjMTIp2oDkRePZiJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QBfl+9oims3t3Swi/zhSvgibjb5glCOu6+xYIFlzV0A=;
 b=fkUYVh/7fpRyZMTRtq9WSuDKDL+tGz/2BKkAhzftzJVXEYwbMJXBmjq4Fad3sIcVzy2DhpkfHNJiprgh9T6GN7i61qZb01JiWSi8kNgkMsBBSI3sdqlcbV3cZubTgdop2sIjIRrq3/pulll3j95H2dfmOPoKUCNgkceDwdDL4/0=
Received: from BN9PR03CA0046.namprd03.prod.outlook.com (2603:10b6:408:fb::21)
 by SA1PR12MB7365.namprd12.prod.outlook.com (2603:10b6:806:2ba::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 06:02:21 +0000
Received: from BN1PEPF00004685.namprd03.prod.outlook.com
 (2603:10b6:408:fb:cafe::90) by BN9PR03CA0046.outlook.office365.com
 (2603:10b6:408:fb::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Fri,
 6 Mar 2026 06:02:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00004685.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 06:02:21 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Mar
 2026 00:02:20 -0600
Received: from arun-nv33.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 5 Mar
 2026 22:02:18 -0800
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <matthew.auld@intel.com>, <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v5 2/2] drm/buddy: Add KUnit test for offset-aligned
 allocations
Date: Fri, 6 Mar 2026 11:31:55 +0530
Message-ID: <20260306060155.2114-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260306060155.2114-1-Arunpravin.PaneerSelvam@amd.com>
References: <20260306060155.2114-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004685:EE_|SA1PR12MB7365:EE_
X-MS-Office365-Filtering-Correlation-Id: fb2c6507-ca3b-49bf-7b8e-08de7b45ee13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700016|7053199007; 
X-Microsoft-Antispam-Message-Info: Dho1hdALMrxaLLSEt5Zx8xlatcDHieaF8XQMiWVwUkjiaNS/nHwlaafKeGbHJJtrVj5JItzAzgAlc0e+K2umFTyTwi+dWe5ETxuX9J0UlF4xmhL4qjNOTItcSVwA1YoUzmEaKx+tt8ek49XjIpZ3D+0LSeCNmTcs3jA4ESHHjyvOdFVP8XQ1OuzfTt+8ZPnDD0/ApbL8IDySn8wsRI3uSi7eDhc7U9uMIbz42bG1eIyVHfSl7cHXdL3DhrV0vq577n4TXo4xmx1ydYGA5NVHzj2OyjtZZjReMZ7B7WBf7aFU0ZL7lX+dgKqYcnhwTx1glKvOrmy6f8kW2gdKIwPybq1KVC6XzMZUl6/NAGTnAQ4sdFhsZllrUZqRF6+n6mg+StALVa+erJ8tJ3NHXJb8N0WnjJ1k54oBjwgPYKoIx3V3SJL8ZuJZJ+Cwc9VgYp9TOcf/Xyj4ruSiEdfHTx55sX3aj9vbNXhewAPjTMo/sTBZiTmuuR/n9R8Ia3Qy1FKX48E5nl4jx9JlLcbgYXq4vLF0GoSAB88pNzDc4PDxGyWYJ3nJaTlp7uRhcuU4rpIOVd6OadELrUoekkFZ/2kjpDRD1gPBGHsB/TT33tFm9jpHMz2lPZGJm/f6r5o/eGQay7ahDa8/k1NbDlU3ZP4TvVE9aFFtuW6x4+WrFEBRLW0XtBnSbw8ros5QCYQ6xDbjANZEqvtk5LhfBK1436cWSVHKujgO7ey5OtGcMCrQEdUYjx+VRVELhxlZhyNLhcZL4gJ/jE0naF16BHSOT60LJQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9P1U32LrvuTVf8GeyYMoP+d6k0+IU+XzcgipEK3Y/TL9imhmoaNWv6J5OxId0hPut3w02Uuk8FZiCv4F0UZx7Uyes4YBtryBKWQP5myCbs4C1/bDwA7E6M14vKx27JA9zE9ZoawysxD5soCmqKuLXeWYoxWInJyOc4U0UGYlsoHthYg/XX1GkeWxI9eCNyMsE0713ACISQJlEglcF3NuyRQ9VOstApZ8LkgcaKmPIRQAMa03SMEhG8LPcPb+zO+YN0yh6WI7JhNzKK5bJpSOBsE4q5fCd4fNWgojgTCkvBC7jWEvhhKtEdgGohUu5yeUO6hOIICp7XebHUdmDjvmDS+RDxPP8eKOpYm9qJyrf5pCQTqvqnQmd82jT2SeqJcfm1aIJHUQX1Efv/MZbcKHopp8HlC2r/GX2a0XzpGakAOn8XMn0wyoy5bMV01t3qke
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 06:02:21.0001 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb2c6507-ca3b-49bf-7b8e-08de7b45ee13
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004685.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7365
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
X-Rspamd-Queue-Id: 602F221BED0
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:dkim,amd.com:email,amd.com:mid];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_XOIP(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
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

v3:
  - Fixed build warnings reported by kernel test robot <lkp@intel.com>

v4:(Matthew)
  - Use IS_ALIGNED() instead of manual alignment checks
  - Simplify order iteration loop for readability
  - Remove extra newline

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/tests/gpu_buddy_test.c | 166 +++++++++++++++++++++++++++++
 1 file changed, 166 insertions(+)

diff --git a/drivers/gpu/tests/gpu_buddy_test.c b/drivers/gpu/tests/gpu_buddy_test.c
index 5429010f34d3..6fdb51ba4602 100644
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
+	struct list_head allocated[ARRAY_SIZE(alignments)];
+	unsigned int i, max_subtree_align = 0;
+	int ret, tree, order;
+	struct gpu_buddy mm;
+
+	KUNIT_ASSERT_FALSE_MSG(test, gpu_buddy_init(&mm, mm_size, SZ_4K),
+			       "buddy_init failed\n");
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
+			KUNIT_EXPECT_TRUE(test, IS_ALIGNED(gpu_buddy_block_offset(block), align));
+		}
+
+		for (order = mm.max_order; order >= 0 && !root; order--) {
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
+				max_subtree_align = max(max_subtree_align,
+							block->subtree_max_alignment);
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
+		KUNIT_EXPECT_TRUE(test, IS_ALIGNED(gpu_buddy_block_offset(block), SZ_256K));
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
+		KUNIT_EXPECT_TRUE(test, IS_ALIGNED(gpu_buddy_block_offset(block), SZ_256K));
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
 	KUNIT_CASE_SLOW(gpu_test_buddy_fragmentation_performance),
 	KUNIT_CASE(gpu_test_buddy_alloc_exceeds_max_order),
+	KUNIT_CASE(gpu_test_buddy_offset_aligned_allocation),
+	KUNIT_CASE(gpu_test_buddy_subtree_offset_alignment_stress),
 	{}
 };
 
-- 
2.34.1

