Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAScGBCqhWlhEwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 09:45:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D092FBA82
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 09:45:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C416810E5B0;
	Fri,  6 Feb 2026 08:44:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GOAHUgzv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012008.outbound.protection.outlook.com [52.101.43.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD4B710E0D3;
 Fri,  6 Feb 2026 08:44:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUjdxGTEwHDF6ZCzIWJ54xeq1eo1os+rbC3NxtrQRSikLVaEXMJVyKXllbkSja9UbPNX7nImaqkPBUoO6lXDt64qPqkvH61yBz9WUbOoQQEqx36yJlkGweoP18R+3Azi67vUhJuOjDM0f6SDB9iPk+Vbc4ZA21bPqcdYnS40FTNqJqmnndxlQ5lG0H4UtFEuo9MGr0NFqG5JT8EUb0VoHNw4Y8oRu+CFfXJOCGN8slA8iY4JJQ2Xka2lbgClXVozZOdgK5ft77Xlzy8vEm1mt5LyC1rvFVzkET6XnhDRh6U8VX8qkv5gl9e/S8lqz1fHzsU5GDjAt8M62AGOjELUPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1wRNRn1ro80tcWVxUnIl3uqt9qPUWlBIxvvXYKzv0Ps=;
 b=xWnTHZ3GO5ylAMHKs5L3SKzbbnyukfgeuHo3SZiJOYUzUnMEVGDc2Gw4kO9VT5kSr8IxQl2a2EBSUl8Wzzkpk73cgRisHWCWZ8Zkqb15CHMfZFZC1GxS9WOV0wb8v3432dBsQ6gpvmO+zGcbZvBSI4RDjhbN79JfduxBdHh8KD2GVGNEhmWUUprwxHJfLZFFHpEHpRYxjlFjBTITh/6Smw7b6ZyGYCKdTkxxixEFBgZrgYBygcq0cz23sxtRA6OkicTsdlrUYR3E7EM10S75GcF/enq1qdc6yOWuJjEqr2VRVrZkrc02b/s1vok/QkJr5/VSvM625+esXPCYE1AQQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1wRNRn1ro80tcWVxUnIl3uqt9qPUWlBIxvvXYKzv0Ps=;
 b=GOAHUgzv4cepBWp/tOVKy/xF/S8aqQv38QcBTf2S/+IsMv+vyzDuKnBZ78KQkplAj0JhlFalMQwkjWP050t0PdknZFl5oGC1kvov516HOyAsn8nygFCRXcZySf1rcGdTIFXEGa09cstlBU3kCZfcko6LDJZqhAvmKBMkSy6ek4k=
Received: from CH0P221CA0012.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::16)
 by BL3PR12MB9049.namprd12.prod.outlook.com (2603:10b6:208:3b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 08:44:53 +0000
Received: from DS3PEPF000099E2.namprd04.prod.outlook.com
 (2603:10b6:610:11c:cafe::92) by CH0P221CA0012.outlook.office365.com
 (2603:10b6:610:11c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16 via Frontend
 Transport; Fri, 6 Feb 2026 08:44:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099E2.mail.protection.outlook.com (10.167.17.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 08:44:53 +0000
Received: from arun-nv33.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Feb
 2026 02:44:50 -0600
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <matthew.auld@intel.com>, <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v2 2/2] drm/buddy: Add KUnit test for offset-aligned
 allocations
Date: Fri, 6 Feb 2026 14:14:24 +0530
Message-ID: <20260206084424.7360-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260206084424.7360-1-Arunpravin.PaneerSelvam@amd.com>
References: <20260206084424.7360-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E2:EE_|BL3PR12MB9049:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ad67b60-dab7-49fe-83f7-08de655bff37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tpsRxqRCLBGgVLxKaN68gBOM7ZIb1sfPZ6cUmuBinKwTia+XbIi75+VYh9F9?=
 =?us-ascii?Q?M/+HrxXVfra0i+9hVU0+6RjSbwdWprrXEAtag4JYwTcn7sPMGYD8Atovk+G3?=
 =?us-ascii?Q?CxT1Ev2KcDrf7NsCwTA57dOYmvpvnqk81uNnq6EvAPtx/t+wGrebJvVz1mnw?=
 =?us-ascii?Q?gGsMxPn9c/uIYoPbuk3c9aSNTob5121eBOTuf1X7zCjAKD8RQrSN7Pj+oXn6?=
 =?us-ascii?Q?n16cjuNu5zZmJ8vHIOuygoSVXlvWWuSuDSuWGIvDpjdzlih4bdXeZ/OCH0t1?=
 =?us-ascii?Q?Cg/amlFsL8PBoDqJah94dQ5n2XwkXBaKUSF6PxHF0afaVCvPy8HToH1BjaNn?=
 =?us-ascii?Q?d4As0D8EE57HKl1aDsfCW2H6GvU1QG+NfTHz9CoQHWH799ptzYD3fcWVnc/y?=
 =?us-ascii?Q?9ln1A6oeeQx5gxDrx2azPh1U2UoQIUqRRGn+KGUrnWqA0oTt/VCZ9uAFEURt?=
 =?us-ascii?Q?bDeUBoaCSnJCUX9zQGUwIFdZec7mglMolVtSByYKt6OXy5nt07Y1VzdWWfCJ?=
 =?us-ascii?Q?sTW/TgLo317Xbt0Mead7acM//RZdlkhAnNXrqP8i1ogbtJRlvUx7MuiGlcJz?=
 =?us-ascii?Q?USefsWVss1fJxLYNHikQlXjEJTSuiGyBNfR1H0T5kr6D8DDniFkhmQx/fXnV?=
 =?us-ascii?Q?fAM5dhGjDyfbBjkTqwYTa187Km2q5JByUwvJuzDkEmeWrFlnn5uCEnINgE6+?=
 =?us-ascii?Q?42QcaE1BZFqXwBP1WptyiiYavWFaB+Trlv6bQuZI2k4nu6wL7W948LzK/cP+?=
 =?us-ascii?Q?WQx3090yzgwHa22DRrAB4on3InMWBt9YmpAW4cSQ9NDncFZE/teTBgE8lChI?=
 =?us-ascii?Q?zV6mQybtfdYPSw5EOHEWT7m9cMA8NrTcK7CURSCtiJediNnLxSyz9aMGwo5j?=
 =?us-ascii?Q?vrO3ILV+PvShEU6rh+IGzPTxSjw9tms58W14DtC3zOX0nw8W3J0ReBIqXjt/?=
 =?us-ascii?Q?lWrBR6LNPRvhopaq57i63VtBu5pBrAt+r7m60o3eyz10Tk2DrhWb6+0W3Wft?=
 =?us-ascii?Q?Oz6jebXwq7/SPq0PnncWUZ7t3RmSkEiV3c2gOdY9kOnc3i/SzYyF/hmLbqw8?=
 =?us-ascii?Q?m0SwTBb+hPuZaC1BqxRd7Ct2xtP2Q6uKCwpjpmBTk4YaAbfRy9tMM1TCo053?=
 =?us-ascii?Q?wHs0pJPysawzwfKrkQZtm2X/SQZKIbHoDS7BRWNWa4EEPuHjfrWfUNFdK47Y?=
 =?us-ascii?Q?9cwbGJ7vcQtlFRj8IqOXfDNNLjD6GWjwjkBDIqWI9yUx3ouArR091a3yNN85?=
 =?us-ascii?Q?J3T809OKxHuBkY5mT9iaAGWEvnRs4QLbOIVhb5Zs4xD5zMjOC7IDhIylwVQJ?=
 =?us-ascii?Q?LNGvLsfIc05konhcZGxAn4NNU0BVixR0AjKkK+IU7B+pD3YsH/wnSDv7tc0P?=
 =?us-ascii?Q?fI21vWb95d89fEvMba35s8rEnb3k0rodapZZePprJ7IfaZ78Oar1PgR+V5l7?=
 =?us-ascii?Q?F7SUd8glIRF0eqcFedeUKQl544xrkphecnBinocztA6xaPLvEiwxP0muYXQm?=
 =?us-ascii?Q?0nYMpdtlOaOyi9eyMpzn0kowfnkxp7bt6nNMx3zQZk9l17ZHhiNPYlrOUGVg?=
 =?us-ascii?Q?yl55Zt0p5ZjI3I2OlKMf4TIrRNe2hSDud7ZNhsHVE6p/IgbP0WIgOzr+dN9F?=
 =?us-ascii?Q?zQ8ECwmPRjtGo5ObM/X+1ThE0mUz++Vz3S06B7tfz1eYad09LKeTuLMEc6Rw?=
 =?us-ascii?Q?2Zqezw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jFsUn1WAhl3inNWAcu05Y1zJ9aHHCRqsfo8SnE6GdZk0sqYLLWS9BU7D502O6HD2b203ITdFRMmdTI6osF8IlGZU2erAassRDdzVUDnkz7oz+VBCGs89X4JQJCfN7E4HcY03XwLTRCnwhRsXLduLumtpD59A+HK02lFJAAlBavWgZxJlVMQ6DCc5Tm5awHfHoD/NAye5B8qPb+JLfGmqr7F0xBwt45mJrYR34Gd9pAd1F7g+UTrxbplYjIStQp3QIQPws3gVyb8URIsLSWu1SYDXTYPvQq1oqJi8xhXMBOwRJsvbcOO/U1aLTaLbEyfukXp77xovjZhOWh2+hD6gfMA22Kef+ZraEOJXJVR9wYxk8QLBDE9LVmRn/WIvLS0SMgDRLOymbrMAcmkMgqRiS9zO0ZmjrefYa4KTXCmONIe1ZEY450a69YU9yCHmCDhm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 08:44:53.1002 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ad67b60-dab7-49fe-83f7-08de655bff37
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB9049
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
	NEURAL_HAM(-0.00)[-1.000];
	HAS_XOIP(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 0D092FBA82
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

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/tests/drm_buddy_test.c | 167 +++++++++++++++++++++++++
 1 file changed, 167 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index 5f40b5343bd8..b24302ef4188 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -21,6 +21,171 @@ static inline u64 get_size(int order, u64 chunk_size)
 	return (1 << order) * chunk_size;
 }
 
+static void drm_test_buddy_subtree_offset_alignment_stress(struct kunit *test)
+{
+	struct drm_buddy_block *block;
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
+	struct drm_buddy mm;
+	int ret, tree;
+
+	KUNIT_ASSERT_FALSE(test, drm_buddy_init(&mm, mm_size, SZ_4K),
+			   "buddy_init failed\n")
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
+		struct drm_buddy_block *root = NULL;
+		unsigned int expected;
+		u64 align;
+
+		align = alignments[i];
+		expected = ilog2(align) - 1;
+
+		for (;;) {
+			ret = drm_buddy_alloc_blocks(&mm,
+						     0, mm_size,
+						     SZ_4K, align,
+						     &allocated[i],
+						     0);
+			if (ret)
+				break;
+
+			block = list_last_entry(&allocated[i],
+						struct drm_buddy_block,
+						link);
+			KUNIT_EXPECT_EQ(test, drm_buddy_block_offset(block) & (align - 1), 0ULL);
+		}
+
+		for (order = mm.max_order + 1; order-- > 0 && !root; ) {
+			for (tree = 0; tree < 2; tree++) {
+				node = mm.free_trees[tree][order].rb_node;
+				if (node) {
+					root = container_of(node,
+							    struct drm_buddy_block,
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
+		drm_buddy_free_list(&mm, &allocated[i], 0);
+
+		for (order = 0; order <= mm.max_order; order++) {
+			for (tree = 0; tree < 2; tree++) {
+				node = mm.free_trees[tree][order].rb_node;
+				if (!node)
+					continue;
+
+				block = container_of(node, struct drm_buddy_block, rb);
+				max_subtree_align = max(max_subtree_align, block->subtree_max_alignment);
+			}
+		}
+
+		KUNIT_EXPECT_GE(test, max_subtree_align, ilog2(alignments[i]));
+	}
+
+	drm_buddy_fini(&mm);
+}
+
+static void drm_test_buddy_offset_aligned_allocation(struct kunit *test)
+{
+	struct drm_buddy_block *block, *tmp;
+	int num_blocks, i, count = 0;
+	LIST_HEAD(allocated);
+	struct drm_buddy mm;
+	u64 mm_size = SZ_4M;
+	LIST_HEAD(freed);
+
+	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_init(&mm, mm_size, SZ_4K),
+			       "buddy_init failed\n");
+
+	num_blocks = mm_size / SZ_256K;
+
+	/*
+	 * Allocate multiple sizes under a fixed offset alignment.
+	 * Ensures alignment handling is independent of allocation size and
+	 * exercises subtree max-alignment pruning for small requests.
+	 */
+	for (i = 0; i < num_blocks; i++)
+		KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size, SZ_8K, SZ_256K,
+								    &allocated, 0),
+					"buddy_alloc hit an error size=%u\n", SZ_8K);
+
+	list_for_each_entry(block, &allocated, link) {
+		/* Ensure the allocated block uses the expected 8 KB size */
+		KUNIT_EXPECT_EQ(test, drm_buddy_block_size(&mm, block), SZ_8K);
+		/* Ensure the block starts at a 256 KB-aligned offset for proper alignment */
+		KUNIT_EXPECT_EQ(test, drm_buddy_block_offset(block) & (SZ_256K - 1), 0ULL);
+	}
+	drm_buddy_free_list(&mm, &allocated, 0);
+
+	for (i = 0; i < num_blocks; i++)
+		KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size, SZ_16K, SZ_256K,
+								    &allocated, 0),
+					"buddy_alloc hit an error size=%u\n", SZ_16K);
+
+	list_for_each_entry(block, &allocated, link) {
+		/* Ensure the allocated block uses the expected 16 KB size */
+		KUNIT_EXPECT_EQ(test, drm_buddy_block_size(&mm, block), SZ_16K);
+		/* Ensure the block starts at a 256 KB-aligned offset for proper alignment */
+		KUNIT_EXPECT_EQ(test, drm_buddy_block_offset(block) & (SZ_256K - 1), 0ULL);
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
+	drm_buddy_free_list(&mm, &freed, 0);
+
+	for (i = 0; i < num_blocks / 2; i++)
+		KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size, SZ_16K, SZ_256K,
+								    &allocated, 0),
+					"buddy_alloc hit an error size=%u\n", SZ_16K);
+
+	/*
+	 * Allocate with offset alignment after all slots are used; must fail.
+	 * Confirms that no aligned offsets remain.
+	 */
+	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size, SZ_16K, SZ_256K,
+							   &allocated, 0),
+			       "buddy_alloc hit an error size=%u\n", SZ_16K);
+	drm_buddy_free_list(&mm, &allocated, 0);
+	drm_buddy_fini(&mm);
+}
+
 static void drm_test_buddy_fragmentation_performance(struct kunit *test)
 {
 	struct drm_buddy_block *block, *tmp;
@@ -877,6 +1042,8 @@ static struct kunit_case drm_buddy_tests[] = {
 	KUNIT_CASE(drm_test_buddy_alloc_clear),
 	KUNIT_CASE(drm_test_buddy_alloc_range_bias),
 	KUNIT_CASE(drm_test_buddy_fragmentation_performance),
+	KUNIT_CASE(drm_test_buddy_offset_aligned_allocation),
+	KUNIT_CASE(drm_test_buddy_subtree_offset_alignment_stress),
 	{}
 };
 
-- 
2.34.1

