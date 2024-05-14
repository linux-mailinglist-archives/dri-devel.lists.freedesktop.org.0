Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5FF8C585A
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 16:57:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C638710EA61;
	Tue, 14 May 2024 14:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Vnp5jUub";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00BAC10E1FE;
 Tue, 14 May 2024 14:57:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qf7JMQpOXm5+ZTbO+cqjHswnuAQIGFTpoU3SUwJBnB4KrTyuVqX0Af4bhstl/PVEatKbIpbrzwJD5A87rSSVDpNpWUnLyOZiY9U1iGeLBWcGgh9oVD/zK3U5zwPCu/ec5sRB9p1v7xBIwghouaE7PrqXijSGqzOj+YeNelt7981LvEs0fmeFpvs25xMcvX3+Eu8C5nRaB+8/QZYiyddzorzhpig817pUcX+xaRdLIRSrKvncgNSYQLaqsAdBNv1fgyE1Y31I/DD9lWKDYZhB+RQ+F1AwhiqOcesPudxACuOX7S6Hb73G4ul5wlLQ1yxhh6ePMZL19119Y+6v0hbnaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56KunicnTsSdRTkBwd/LlBacAqcNmkrzsjJkRmqKLn8=;
 b=VMV+rm5oJCULp4B+2gtsejXtp29Zxr6cdHD+KLtCTDDFY7MDnvExzBrUYVJRrguWOc3xQSE+/dCDkZMtZxcUsEl/lVMFhyyoZWTxruncYYwStpFNoT8LXHaIuRINdo1/W7l7eybzgx9UJ/p3/Hr/UjNhVl3uPHr0VPMVNyDKYx8qE8WOWl0F4LAiPhVAmvfRnSTddzrY1pmIgFJmJAdxi24WunEnQ9X5QUlCX9Lwv1yM0O8ff6xsmPpqvb5ielIXgDqdcGeRBmCViUWqxcspp3cbP6EQSf/uU2AF10JbqOi50NzxNIgJ6c+sRbXpaFZHHZCk+qo5QsRO2Icli3uQ7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56KunicnTsSdRTkBwd/LlBacAqcNmkrzsjJkRmqKLn8=;
 b=Vnp5jUub+MvGurEB7tphoNG1ctKDheW83kV69+dR+d9aZGpt/NhI/iYIQsWwgBMxOp3sWmfcSfoRSuJc1WdxvyiTdPieHX2pM6dcg/Lx/0obXRNdbotH3brSsrU77rfH9P0vekP2ApzEcO0DTqPnE+yb1RScvLC+88ivf43INlI=
Received: from BN9PR03CA0766.namprd03.prod.outlook.com (2603:10b6:408:13a::21)
 by MW5PR12MB5652.namprd12.prod.outlook.com (2603:10b6:303:1a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 14:57:01 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:13a:cafe::95) by BN9PR03CA0766.outlook.office365.com
 (2603:10b6:408:13a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55 via Frontend
 Transport; Tue, 14 May 2024 14:57:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Tue, 14 May 2024 14:57:01 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 09:56:58 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <matthew.auld@intel.com>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <daniel@ffwll.ch>, Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v3 2/2] drm/tests: Add a unit test for range bias allocation
Date: Tue, 14 May 2024 20:26:36 +0530
Message-ID: <20240514145636.16253-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240514145636.16253-1-Arunpravin.PaneerSelvam@amd.com>
References: <20240514145636.16253-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|MW5PR12MB5652:EE_
X-MS-Office365-Filtering-Correlation-Id: d2ed6a45-9602-4d43-e830-08dc74261c3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|376005|36860700004|82310400017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RhCL38XjYccKy43+ob9xfp3Xl9nEOJy9d/wcxe7b6QSytdiNJHT0dTlDw6Tm?=
 =?us-ascii?Q?WISeg3ak32ZMh2zMffFKvA6xY9IB17eUgLxpleSGOOKQyGDIRJITR5DYHZaY?=
 =?us-ascii?Q?bwsO6taOUMSXlMt81keyuZRKy6nI5oIj21VDY9uHzj8AuXIKQdY3g4UVhjTM?=
 =?us-ascii?Q?aeE77GH+qsU5+D52kBdLZTeNVIQyLxqWr6Q1Pw91zvOoaOGRkVm1P0dKR5Rh?=
 =?us-ascii?Q?1N6Zt4bpTCFDlQoloMYc51NfxUD5EMnxlykg+WWOT+Y3FTT9gppeNN2kzMPg?=
 =?us-ascii?Q?Swf4L/3xMmWXxR7lCEIQniLbUzzL6GpIXvArET/jyaR8dpgyAio4CXNzC88I?=
 =?us-ascii?Q?OqsmIZtSfiQcbW0erAjb1wdcpmsUUe86na/mD//+X9H/HVqtKDoXT2GkO/xu?=
 =?us-ascii?Q?wm667Mfd2UacpaqLkGF69+thdtHevoP80kNrP+6ulCYnrj41ru3pjAiODT5S?=
 =?us-ascii?Q?p4mO37dr1GmtqKjS3czGzY82bAIj0nKMjhl7j9MLZeNzfS1cYt8G/kkvKL5M?=
 =?us-ascii?Q?UZ/We3nIzpebx/f1mXRQqQhqEOEuppcwVGsenkqlmFX2yEgz2tWo1EDYqc2K?=
 =?us-ascii?Q?RPTE4U70KTTTsbKWyFJBaL8iAZZaGZbu85qcvXRO8z02i9beD6sPMseXSN0Q?=
 =?us-ascii?Q?1INQhg86JGb1R5GdgqtsGxSS3mToavFDZ9UcsjuTCmkt2vRlmhe/CDoQyy3C?=
 =?us-ascii?Q?qBdCfSdOPUcx8n5DklkNth7U+C605QObUMXIUkGrlvYFusACrvtKo9PJyXQb?=
 =?us-ascii?Q?wpP6PMRSc67Ac4umtrbyN6cU8ELgQB3uVsUUc4T/tVutDzZa0P6SfQNckSKB?=
 =?us-ascii?Q?ujfQQBWJsvgMRT+M6WPiBU35BZ3J/DtZE9l7knHS13o7fm6WOoYTAF4GkegO?=
 =?us-ascii?Q?+kULHhnMY51vgg/hwdPV9CqDXEy5XjKnILYc5B8hHE5D7Aw0G8gaqtcDSjI7?=
 =?us-ascii?Q?2UVuXnDOJquy3NVezDPIWVZAxSiBqknibFUi5HBixKPzx9XvZ0eyGxBEKeAG?=
 =?us-ascii?Q?8VwnV63FRDALF+WlCV7OP8bTzW86OFBg3nPjf0wo6DsEDbdFm3+0mI9L0Rwf?=
 =?us-ascii?Q?xhzOpuy5eX9fCTRkZbed1OiSNKiqoDpyPpvx7S4VvL963G+xMG22I4B5hdMp?=
 =?us-ascii?Q?PAmdRGKI6zPPyRlAoPPWPDUPZBuQUCuUuc6YWQgx+C0UYNsPNFDRqJVEb5M6?=
 =?us-ascii?Q?kJBCXBv4F5UePxAgQANnDnkqvciPvTM+Bra6w8HRyys7paVQUTtMqpazJRf/?=
 =?us-ascii?Q?8ESU/ipv8HHoZdI+osEkBp7TCSGIr68VIQecm6XeR5MAihaW288Ppw6AMybS?=
 =?us-ascii?Q?+s5Kga3WlR4nQA8xy34TEGgFmv+GolzRKAAtgZI6upRKtYfm5GX0t3RTFoBK?=
 =?us-ascii?Q?cInyUPUgOUAkvy+zDg3+n48hVwhw?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(36860700004)(82310400017); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 14:57:01.0828 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ed6a45-9602-4d43-e830-08dc74261c3f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5652
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

Allocate cleared blocks in the bias range when the DRM
buddy's clear avail is zero. This will validate the bias
range allocation in scenarios like system boot when no
cleared blocks are available and exercise the fallback
path too. The resulting blocks should always be dirty.

v1:(Matthew)
  - move the size to the variable declaration section.
  - move the mm.clear_avail init to allocator init.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/tests/drm_buddy_test.c | 36 +++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index e3b50e240d36..b3be68b03610 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -23,9 +23,11 @@ static inline u64 get_size(int order, u64 chunk_size)
 
 static void drm_test_buddy_alloc_range_bias(struct kunit *test)
 {
-	u32 mm_size, ps, bias_size, bias_start, bias_end, bias_rem;
+	u32 mm_size, size, ps, bias_size, bias_start, bias_end, bias_rem;
 	DRM_RND_STATE(prng, random_seed);
 	unsigned int i, count, *order;
+	struct drm_buddy_block *block;
+	unsigned long flags;
 	struct drm_buddy mm;
 	LIST_HEAD(allocated);
 
@@ -222,6 +224,38 @@ static void drm_test_buddy_alloc_range_bias(struct kunit *test)
 
 	drm_buddy_free_list(&mm, &allocated, 0);
 	drm_buddy_fini(&mm);
+
+	/*
+	 * Allocate cleared blocks in the bias range when the DRM buddy's clear avail is
+	 * zero. This will validate the bias range allocation in scenarios like system boot
+	 * when no cleared blocks are available and exercise the fallback path too. The resulting
+	 * blocks should always be dirty.
+	 */
+
+	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_init(&mm, mm_size, ps),
+			       "buddy_init failed\n");
+
+	bias_start = round_up(prandom_u32_state(&prng) % (mm_size - ps), ps);
+	bias_end = round_up(bias_start + prandom_u32_state(&prng) % (mm_size - bias_start), ps);
+	bias_end = max(bias_end, bias_start + ps);
+	bias_rem = bias_end - bias_start;
+
+	flags = DRM_BUDDY_CLEAR_ALLOCATION | DRM_BUDDY_RANGE_ALLOCATION;
+	size = max(round_up(prandom_u32_state(&prng) % bias_rem, ps), ps);
+
+	KUNIT_ASSERT_FALSE_MSG(test,
+			       drm_buddy_alloc_blocks(&mm, bias_start,
+						      bias_end, size, ps,
+						      &allocated,
+						      flags),
+			       "buddy_alloc failed with bias(%x-%x), size=%u, ps=%u\n",
+			       bias_start, bias_end, size, ps);
+
+	list_for_each_entry(block, &allocated, link)
+		KUNIT_EXPECT_EQ(test, drm_buddy_block_is_clear(block), false);
+
+	drm_buddy_free_list(&mm, &allocated, 0);
+	drm_buddy_fini(&mm);
 }
 
 static void drm_test_buddy_alloc_clear(struct kunit *test)
-- 
2.25.1

