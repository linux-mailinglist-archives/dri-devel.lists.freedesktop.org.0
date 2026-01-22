Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AP8BGMgxcmmadwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 15:18:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA70567CFD
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 15:18:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D595010E9CB;
	Thu, 22 Jan 2026 14:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="03Vws1no";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010040.outbound.protection.outlook.com [52.101.61.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA40710E9C0;
 Thu, 22 Jan 2026 14:18:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t3/S9MlIX9WFXGi3NaMu8UxkS27CesEJnZyqp0sxi3xyUxSmFSJzNF2kYhblUDHC73D18Gn6jqEC8Phei2v9TRn/9TxeLp3B3ZyKiK5y3bz2+Zpg81J/bQulHbgTqJswD21lxOA6pxer7XVbTttZ2AXb0WYlXvvD8mJjQ2dE3B7jkZbrnuCzsfRJ1DPOEz9qTqJrCFR0hBZmh5Sq2hoUB2ZfcOlDAHvA039pHJcn3T9U0FO9rBOU0niK4p8sWsz7v4yybiCHelgmdqIfYKq15+emWGe9vHtx4xVcqwUjpF7pYqo6nP6I1ojysW5PoMQmcPZ8lcVXLI0u9uqmcflmYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jrSwlHyifHGk1cSkEZFr2fNXxqnYm9BKw6imNQlDrnk=;
 b=SCrQ4oQYU7/cfI90lSSpvG5DnvDT5IMokFPEdqtdz6GOWB9pTCavk2WoEWI5i2rAUA6D0zjoauaCvIXWyRQkgcJRoY0xyr1zFX0kkt1WMPe2uaYropcB6tKrNCjlLy4Jv42OhDLoPCfA7Ghq50l11opOirFwhVYYt3czFysrM0sspFkzI+NX+fQJrU0o/TDhbe4GJtNAVUfH+KoGhw2VpXOe1eI0eoG+z2VJ83d8L42wWV2BDqIyVkb/j1gbweTmFw4V3ziKceWFYGSrrhbXjd5uDkiHDaMJl8OfEVbbkZTJzOozpHZGfaLHjkOIhFLOoXFP566aVJ2+TT81cJW+Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jrSwlHyifHGk1cSkEZFr2fNXxqnYm9BKw6imNQlDrnk=;
 b=03Vws1noewzBSZUGJBn+URsBhbjtVmQn9Vy0HthGzjKwlsteDFblmxJV+Tw0+3/H9AhKTATAJY9+Lm+sJnqMYmV/rRd6g22nF4LUZFtm0p/4r4Ujqf/IrpCQOu3+L6sb6xR7r0mC8VnIujfGAC5QuduZONSzLl3L+CiE8NDBHM8=
Received: from SJ0PR05CA0119.namprd05.prod.outlook.com (2603:10b6:a03:334::34)
 by SA1PR12MB9469.namprd12.prod.outlook.com (2603:10b6:806:45a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 14:18:38 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::c9) by SJ0PR05CA0119.outlook.office365.com
 (2603:10b6:a03:334::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.5 via Frontend Transport; Thu,
 22 Jan 2026 14:18:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 14:18:37 +0000
Received: from arun-nv33.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 22 Jan
 2026 08:18:34 -0600
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <matthew.auld@intel.com>, <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH 2/2] drm/buddy: Add KUnit test for offset-aligned allocations
Date: Thu, 22 Jan 2026 19:48:05 +0530
Message-ID: <20260122141805.6678-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260122141805.6678-1-Arunpravin.PaneerSelvam@amd.com>
References: <20260122141805.6678-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|SA1PR12MB9469:EE_
X-MS-Office365-Filtering-Correlation-Id: a640987c-f1aa-4680-41ad-08de59c122b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?18zcJFKKk1uhXpMCw0KWS8qvcGRHnXMJNmN5KG2Sl29mkygZNJhZTX798bQM?=
 =?us-ascii?Q?Ht5iOZG8gE11AOgMVXkbo84VmWNuxhM1AjI9DwAcpletGGRpxga32n54OLJY?=
 =?us-ascii?Q?QrxFPUrznR4QBNPihzwLJVdwnqLKNBlNF6kdiCKyVO2ETb5r4Q93k83DstjL?=
 =?us-ascii?Q?VjfquVfKHh9HmoWHD7huyba0FxjhWsXE/tVKqXf6fpemGwRb36T/4BNpRKB/?=
 =?us-ascii?Q?qM2O9NJvQ69fRKnwKw7Gsd9xWxtx6uPrbCaacHKStW78v1xqvDMyW81S8l5x?=
 =?us-ascii?Q?AcaQjcJDxcPOjAvSVgWYhhhjmTwpVHnkElIkaPtKAVkCmfGrEEpFW3X66nkg?=
 =?us-ascii?Q?y+q7jTx9T4qNXi70+gtIcze8Bq6dgFf60RkuWH93zNZZN7awocD9ABnRLUAZ?=
 =?us-ascii?Q?Z4x2gwZASGPvv3Km2nZqQcYUIu32uBctXueYmgyEvgXq1CSx1D1iIHsCFNFD?=
 =?us-ascii?Q?pDmKZe7y4ARzMbjHdtH1ErjQo+nbHWIM3+upbB2BoiwdNH935j1qNUVycY7N?=
 =?us-ascii?Q?3vdn1mIgZ4mcd2J79on6mLNcb1Ts03tuWDINNRBQxiO4Qpsn1/O8Uae/CstW?=
 =?us-ascii?Q?Ek8XPJfgYX/3ofk/nknbSWO0lfZmPfgCH1hE6elNlz6uFhkbC5uyB/l96cq7?=
 =?us-ascii?Q?wmYf9/c/DqgmdN30aqNCWCuJJhTUW7Nim8chZ0GargQEk/tQ4bSJFXTnVo5W?=
 =?us-ascii?Q?jHUVOnD9uN6kcL4gCiqT6P0qalgmI0Xnn9GEAI15sr0Sf6mnwy6be/LoWJNO?=
 =?us-ascii?Q?Nd3at1Nz4DoWECTyWbpRbaPrmsL/lp+vdJyBGlt/8Ihi5uUoLoQwDpk+nTBy?=
 =?us-ascii?Q?XkTaJzF7tvCMMfrjoa8Ot5u7QJohT6XlNdvbH2KXaOSb07X8kJ68n0bz3Ukj?=
 =?us-ascii?Q?N4yJCHf9SrXabXArUWNrz95UWzbiHVjBeoFatUBqTn8SpgUs8sS+qsgnSJLM?=
 =?us-ascii?Q?KCNsWBjT1QhA/veuw76OItZDPIfL3viPEk+2/LmidfuiPhpNl4t5evM6T401?=
 =?us-ascii?Q?g+12FeO5M3X9J/8X2/dZbmFFFldtddjvgSh6beE6TCu5HhohsJAECeBGrILM?=
 =?us-ascii?Q?zUJOWlZZcplLqfoXQf9PQLZNYCY9PL41X5oVflRzM5kmiJt2yADCaqOW35JN?=
 =?us-ascii?Q?qcodjjhB3+FWLfl5/161Gy40o75e4XpjkWvI+AXThQo5/NDIxUhfw8aAP4U9?=
 =?us-ascii?Q?8dCdfJF9JX7r8LIF4HuFHLJE5VQPPYDnPdvZEKJTBqezg3xGO0/60MCINWt6?=
 =?us-ascii?Q?+vFlZL6cC4SClwuS+xGHedb9tYwRNIssFgvyO+CRoUUCVB8hQxSWfUG/KN5r?=
 =?us-ascii?Q?LzvWRJHQoEAiydliPtrq1/XH1X83yaR3yaaYADB6hgpslJsjnQnDZaWo0NSu?=
 =?us-ascii?Q?QiKmV2vbRZQ4YHrndRqujh2uEKjk9lqbc5p/oELmRRrOwkDp4p9PwWSqaUrT?=
 =?us-ascii?Q?wjLxqR3me2qQZWL8Kh92AQXe9iXNGYwZOJNYqIoS6mmTWU4Si8j+DZTVqpW9?=
 =?us-ascii?Q?E6oHkflpVTEBdjEojdkiVon/IzzIk84s/LkU8wdO/UMzqv2rsNsllCD3uypL?=
 =?us-ascii?Q?2KLYyuu4XkSjAu3Dl7e1H5hagZiLpnZ7Vz8WU9TkvUg5ToOfBViWpIsduWCj?=
 =?us-ascii?Q?hAE8iFsjL/rQbT0GA69FovfVNfO/SqT6kb4tbFObZMpfzZihE8dOKcuVUEMJ?=
 =?us-ascii?Q?TLU1Ew=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 14:18:37.7373 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a640987c-f1aa-4680-41ad-08de59c122b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9469
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
X-Rspamd-Queue-Id: CA70567CFD
X-Rspamd-Action: no action

Add a KUnit test to validate offset-aligned allocations in the DRM buddy
allocator.

The test covers allocations with sizes smaller than the alignment constraint
and verifies correct size preservation, offset alignment, and behavior across
multiple allocation sizes. It also exercises fragmentation by freeing
alternating blocks and confirms that allocation fails once all aligned offsets
are consumed.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/tests/drm_buddy_test.c | 74 ++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index 5f40b5343bd8..9467496ff0e5 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -21,6 +21,79 @@ static inline u64 get_size(int order, u64 chunk_size)
 	return (1 << order) * chunk_size;
 }
 
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
+				"buddy_alloc hit an error size=%u\n", SZ_16K);
+
+	drm_buddy_free_list(&mm, &allocated, 0);
+	drm_buddy_fini(&mm);
+}
+
 static void drm_test_buddy_fragmentation_performance(struct kunit *test)
 {
 	struct drm_buddy_block *block, *tmp;
@@ -877,6 +950,7 @@ static struct kunit_case drm_buddy_tests[] = {
 	KUNIT_CASE(drm_test_buddy_alloc_clear),
 	KUNIT_CASE(drm_test_buddy_alloc_range_bias),
 	KUNIT_CASE(drm_test_buddy_fragmentation_performance),
+	KUNIT_CASE(drm_test_buddy_offset_aligned_allocation),
 	{}
 };
 
-- 
2.34.1

