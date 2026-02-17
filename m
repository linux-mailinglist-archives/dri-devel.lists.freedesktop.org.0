Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIgdGrlTlGl3CgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 12:40:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F3514B821
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 12:40:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4504C10E4BE;
	Tue, 17 Feb 2026 11:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oqZhVDQ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013052.outbound.protection.outlook.com
 [40.107.201.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26EF810E24F;
 Tue, 17 Feb 2026 11:40:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m6mytIQn6PnE0d6u2X/GDAKoECZoffGtAhWygZ9HLWRNlLVPjGNOJ+v44yM0cA0vv37DvSJMWAkfh4ustZhafaXV32dibrWdCYkwZvFCnGqTWjc6TOvidwUwAfBYfJxKYhCB/0rIvfpp33DtK+XYcvh7n/uhEjbWvbUMfoAcAcOtZFeNdXZj0t0XGJtp9Ey/qoZITBRC/yw+KX5ou/x/ESPKBh0efFQzykeywXpL9Lb+jVbMlNWV/Ms5HxL5TvSC8LWSGsmBMcBqJNODjt7MzbhnAe94g2Zqg2B5fcYcY48VJPKaGMyfpsjG8HlIPYafsY2Brs/ppBBb18yLZjNK/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=934s1XyDVmmULaBX4vwPeAd8SHgYf2IfQOUMHuOvDB0=;
 b=dNq9yUEIyMysUqCCpZoSes7eWGPpDk2IEjloV2dW2EQCf69UXUAdDMoehebTIht+k+V8b6B6003NGYpAHzh5qcjgEGCxmp2JJXlKykWNzXX83x84iuyXoybfDzy6dkLF35IRaM5K+dPaLR1EMzacpM0+8LUbYJjTAkZoBsBF148trLRPIH+TMQGkcChsJvsN00NTwTP7z2mRp9dkZTvpNDEWfSv5SIlw6MxbZ/r1C7WAswyIVd87FoJdip3MDe4Z4gDi+QH/BZKGtiQLtOrtpbMLzl6N7KcUvSS9eub8rRsj+iNzXyvKQKaw+XyEH5b9krjwbMrukrNA8tTysWN37g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=934s1XyDVmmULaBX4vwPeAd8SHgYf2IfQOUMHuOvDB0=;
 b=oqZhVDQ+GlEW93UjQvXT6uQWZ0VZhTAmaJ5XXQ1FqWtCKJEMZJQ+i3vSutHw9SHv2XChCri7nwJCSuLyx846W6qKtZHNnQiOWYw0GGOX+Ozuc096G9u336tMHubtxy5fBR7oDyw0Fyp+EHvvsVCiPfbWf87odxbn6yBzcFbsiOs=
Received: from CH0PR03CA0028.namprd03.prod.outlook.com (2603:10b6:610:b0::33)
 by LV3PR12MB9094.namprd12.prod.outlook.com (2603:10b6:408:19e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 11:40:31 +0000
Received: from CH2PEPF0000009C.namprd02.prod.outlook.com
 (2603:10b6:610:b0:cafe::7c) by CH0PR03CA0028.outlook.office365.com
 (2603:10b6:610:b0::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend
 Transport; Tue, 17 Feb 2026 11:40:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000009C.mail.protection.outlook.com (10.167.244.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 11:40:30 +0000
Received: from arun-nv33.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 17 Feb
 2026 05:40:27 -0600
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <matthew.auld@intel.com>, <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v4 2/2] drm/buddy: Add KUnit test for offset-aligned
 allocations
Date: Tue, 17 Feb 2026 17:09:00 +0530
Message-ID: <20260217113900.10675-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260217113900.10675-1-Arunpravin.PaneerSelvam@amd.com>
References: <20260217113900.10675-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009C:EE_|LV3PR12MB9094:EE_
X-MS-Office365-Filtering-Correlation-Id: 249dae71-01e4-4468-8a20-08de6e195acb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Zh4ZdTFuvl46Fm5yAySQzK3fyheb/wObNIO7W7FPT53QcdRyzcA6EbSGKBVw?=
 =?us-ascii?Q?3kM8Bqai210rPllwsV8L70MjGZgMnOUFTGbO4F1f48CENyzWXY5YK5HEQxx5?=
 =?us-ascii?Q?oWAJyb/rZ66zwVZl3+T8KBSQE50N6V1khA/TJZKCILlpW31PPIVIa239dkiN?=
 =?us-ascii?Q?+HW8T01ZbFNRNyVBKUv+w+1K1HSV2duSoTYpPztJI55e5SId9kiq9qLeM785?=
 =?us-ascii?Q?sIR6AxBPcYRFHj9sBzbofYCCQslyKU5LM3zJOAsYsukA+M/SK+MPCp9+bjUi?=
 =?us-ascii?Q?iSDVPkwBT8Fxxao/eK0wcThYD14ZIv/e/dCbIHToZxyLe0pkTphL7/oF7RRy?=
 =?us-ascii?Q?0h68c0ZzzqufxCrlyFrf/dmENZxvj0bGLkJO3QvkdyEeKFXfVEONvjz+4Yv9?=
 =?us-ascii?Q?9LbXL7LdFLb6ycN9NDq7ujEV1MqHn2WcCUr+jO/Sx6mOLT6uBMiKJMbXiTVC?=
 =?us-ascii?Q?sFm8AdgMTjFLCvXIx1fdI0I986usGbyu+X74BjCSDbOiklmPQ2I9d4kiNvPN?=
 =?us-ascii?Q?mtJvAq9xqE8r/VB5rMjTFajzvg9gh+ZckMAyqzVONOEn6UzoUp8v2VONzhCU?=
 =?us-ascii?Q?lmZnxppAsW04tb3WjcEWSBEG6aeJN6Tc+KR6KMW6rH2Vkuoh8awNixxHdp+7?=
 =?us-ascii?Q?JL2DQ60GbV93gKMkcrZY78u47+dI4iklwhYmhBXlm1VheCkkEyrhKQKpXSte?=
 =?us-ascii?Q?jXjn6JUiOAd6E9shI57uTqY6VBVcgpAvWOpa+CbV60tsKkkAjYJ+LlAUWTxY?=
 =?us-ascii?Q?P0pPNh4/6gubzC4gNn0RT0XvZgptMChNKDGPsw1uc1qeO4nGQ5NEy/TpBO/2?=
 =?us-ascii?Q?si5er38Befh+PaXRhMQ3BWrOBwTCY5oAUW7NgEwurS61HtREUyNQg1GcrbEO?=
 =?us-ascii?Q?cc9WZURT6SPRAzTSBMPZmV+Wk+tiVkxQe/LngnULzQlafz78ZdtCNKrunXIQ?=
 =?us-ascii?Q?JM2f6MqoA9wm8f6dgnj38xHiaI2GSGRxgmVqfGKiMSPlh/Vze+y5mUXU3HK7?=
 =?us-ascii?Q?OhzgyOBEDHRtORo22TbTW6hVYH5XYQqj1uFouz1PZTjoLTHho8W9w0wpDG+f?=
 =?us-ascii?Q?b6BDfkHMCNZ8xl4IxXkGDsV30DydLZ5vQJkblR/H3hziIzoOTH810dMCjl3T?=
 =?us-ascii?Q?O8vNY39YejvsEWulBkFehFDQ6i9z+7I3GHEu0lDOmD5BvI3jTB02ySBluPA6?=
 =?us-ascii?Q?RY1Vw7s6LGcsydoTzJDG+nj/CLY/pPIadVrtfmXfxHbcYrNf/9e2f3+gBwKE?=
 =?us-ascii?Q?AiDUBtxTwGFC3IJ8nvRk6B8xpCNKQGSL2ZDNFgwnlD2UZBWtQgzWvuPYLyZJ?=
 =?us-ascii?Q?hXucy1zpmk73d9EEIm4fZ1+JJQo6FpZKMiJG+xr8DCGGi4bOf5wsDw9WbblS?=
 =?us-ascii?Q?b/M3dUD3OnjELbm+EDdOim5GfEMa6qkl/XtBUBbSAiQFtm/BBFtGX9T0knsd?=
 =?us-ascii?Q?Eqh9pYdPuEff4LJVufBregeGC39qRT5+wOLKWuY2waE+/i7cATpALgAkwRN/?=
 =?us-ascii?Q?8IjU9sbL/o+L8hVvodSg0eP/ZxXQbM1YAg/QW2JHQVN4XatgSj8P9NFwRDuu?=
 =?us-ascii?Q?bxuYz3pvDMwRNbv2Du9b3huwiqF7sWtFLD/8ccPH7V/Ay5JTH1aWlTHsxNqX?=
 =?us-ascii?Q?R23ATwS/C6UKvmG5anztmp0HKYQqsHW3ksKCiNAe/wu1bnkQOVSuC6m4cHco?=
 =?us-ascii?Q?qVW3uw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: soOq2aI426kfJvi4tpw9mMGEZ9H66pZ6JZIxQVqHzw+qYYjsIogwpcLrRK/sjbvimIwNSVqKRmCuAS3JaQ+kceNHI3+NExQnka0vZY7hBNT48e/HVfZtDX471Yo92DX96c2X2wrFKz08jn3hecERSn3bbX3svUolq7AUNlk+86KWBSQl2qcQbT67CvWDMyLQsAqpNrGXf52ki4Vt2MuPhvkShXifuuavVwZoFu10Z+NZXDqBFYHkSvUn/Jq64xTCvEt7XJb5jgudYEyq9aDS583BLo2bVMI7lt6boJ/JMlx+JL3XiPxqGFvf9SngQYR8vcN96Otl/5hF4HW8UkHYGQqEHETeWlpE6zieIJFQ/FmkNkKg/Y9FEK4QlT4Ro+G37cxzauwVdmrCdgh68QiJfHLS5d4BfcEFTUAfpiVvO51sSxNenycVnB45v+6Xkkf1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 11:40:30.9182 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 249dae71-01e4-4468-8a20-08de6e195acb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9094
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[Arunpravin.PaneerSelvam@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: F1F3514B821
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

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/tests/gpu_buddy_test.c | 167 +++++++++++++++++++++++++++++
 1 file changed, 167 insertions(+)

diff --git a/drivers/gpu/tests/gpu_buddy_test.c b/drivers/gpu/tests/gpu_buddy_test.c
index 450e71deed90..2901d43f4bae 100644
--- a/drivers/gpu/tests/gpu_buddy_test.c
+++ b/drivers/gpu/tests/gpu_buddy_test.c
@@ -21,6 +21,171 @@ static inline u64 get_size(int order, u64 chunk_size)
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
@@ -912,6 +1077,8 @@ static struct kunit_case gpu_buddy_tests[] = {
 	KUNIT_CASE(gpu_test_buddy_alloc_range_bias),
 	KUNIT_CASE(gpu_test_buddy_fragmentation_performance),
 	KUNIT_CASE(gpu_test_buddy_alloc_exceeds_max_order),
+	KUNIT_CASE(gpu_test_buddy_offset_aligned_allocation),
+	KUNIT_CASE(gpu_test_buddy_subtree_offset_alignment_stress),
 	{}
 };
 
-- 
2.34.1

