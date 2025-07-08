Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9762AAFC358
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 08:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 172B310E59C;
	Tue,  8 Jul 2025 06:54:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mIArdKdn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF45710E59C;
 Tue,  8 Jul 2025 06:54:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U5O/Uk867XYqhZQqi4yd/9Ih3wixcha4FFBsm/0LQg8n91LUoiKUsWz3KbDkN66/3hEwOemOjgCNoiI4J0516v4mZKmhNCzAdo2yCQqe1okmyv/qlrO4j6X2e36ZokQuaoiUv4NuAFJQS3nKWTyVnZVW+V9A4zB8xAHaF7tZtn1PsYYzSTD8flKxvmowryr6ENkx8AeCANQm+jg43qrqDpHkBDs9NIp4neyXBW5za/+RfB9i9073KUfJn9ym9t/r8+h8CfOir2qfGmIX6aBjkwvbyeg/qRaJS0zulD3EQxgkAh3aIBwGeo5YSaPvTMRo9RTTeUrTyuQccfXYKYVDEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HoCEIraoo/fdTQfpaDkboK0aQ+AQxPJXWJdKJBGqfQ=;
 b=JRWBWx+pm9kJ2dqnLmf5aJchQBZAkffBFyZCo0XeAf0QpjZG04n22uDPq+cNd8hgRooAWMnavbXyrtRr2byAhRqA5T7jWLA8a7Sbw5grY3LFSn+rJMrihp6Q/xII1cTmpIpW0GZIrpXXOFoY1oBWJ5AlED08k2HliXbpy0lcNdmrm7/6tU+bxGtTCfs77X/d5qkph4KCSq3ecM495vhbkck497p7qjt+/iC3zQxfBuiKaR7xQUxz1S4LKzHSu4gZ7sSQ1kzx6XOHTy9mLcCuPj8EN4nQ+WE8jxhvYe3e9UaaLuwK45vQ5NWMvOVP1LzARJgQyM4yHkn3o42DPSWN9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HoCEIraoo/fdTQfpaDkboK0aQ+AQxPJXWJdKJBGqfQ=;
 b=mIArdKdnM5BCS3XZqrUlnYgm+h1Lcr22oydS0NGgHckxdR7cImEZSOajpxg2Lkfwy1ypkNmwWBuYaRW/9wbxkXCHx+22+H5s8t26+qI8DXP7GaVIKneYGSK/WBVoOIrR5AanSxzqA90Ge8sxyVDkDqvKFjRgNIxW+HixqyeNnj4=
Received: from CH2PR05CA0045.namprd05.prod.outlook.com (2603:10b6:610:38::22)
 by SJ5PPF0C60B25BF.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::98a) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Tue, 8 Jul
 2025 06:54:30 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:610:38:cafe::18) by CH2PR05CA0045.outlook.office365.com
 (2603:10b6:610:38::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.20 via Frontend Transport; Tue,
 8 Jul 2025 06:54:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 06:54:29 +0000
Received: from rtg-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Jul 2025 01:54:27 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <matthew.auld@intel.com>,
 <matthew.brost@intel.com>
CC: <alexander.deucher@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v3 3/3] drm/buddy: Add a new unit test case for buffer
 clearance issue
Date: Tue, 8 Jul 2025 12:24:04 +0530
Message-ID: <20250708065404.4185-3-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708065404.4185-1-Arunpravin.PaneerSelvam@amd.com>
References: <20250708065404.4185-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|SJ5PPF0C60B25BF:EE_
X-MS-Office365-Filtering-Correlation-Id: 29443ec4-8e1e-48d6-5501-08ddbdec4953
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DHzQYPwmxq1bxx96mVt+ZW+ks3mHmhQxUB17O6zKZp2LNGmVyurvoSbLIiuq?=
 =?us-ascii?Q?KJzpPkSoVT+e434il+W6sb3IxYk6+A9gNk3FL5XdUtBDK5cwzT0XzPSmTkOA?=
 =?us-ascii?Q?z3eFBXS1P0dfF5rY96eUpmTGD7ee9o7RfZIx2XPpUcbzkgSTSWGKkW3cCKmw?=
 =?us-ascii?Q?4iS6KsF+0WJmk+KQlznvOLI27kA0olZuzm3DybGM3QWaSzO3XGQh0mMPKDdY?=
 =?us-ascii?Q?3TzF3U5zx5POulX31muaWhz55/3KlH0/xk8KGiShEdWWB6dC7wr9eXEAJtdZ?=
 =?us-ascii?Q?6Jpwh+VOLfpOeLlyzBUdBio9J8IP0Psk3+oHJG7i88nYY2DDEwgoI/gx+TLl?=
 =?us-ascii?Q?wN5MytkXdvDSdjAXL7I1R1rlpl5zYI7cSIy/XIsIBQQYbVbqWlb+BME2B0Wa?=
 =?us-ascii?Q?8hA4i8q/jxVoV2nnwN60qI81ypsF6eWsPK0z+TlDKzQXoIa2qCAMlwKTyKFe?=
 =?us-ascii?Q?FaCSzmCJh8zD04YTj6E8bEO1FqiPcPBLglazWnCDDrLnWqi2LNoCqyTbbv9k?=
 =?us-ascii?Q?d0wDCrFej4r0IvXd4bG8j266JknmYc7b5AsrcsYMfBwRldG7lOLtja5CgYRe?=
 =?us-ascii?Q?QK2aTKCI4FdQSk+lo+AODmgbzxTBM2iB+EeKbJkxPleveKLFrEZ2SbB5mdOG?=
 =?us-ascii?Q?ykh0h5xOtodPm/tBvdWvcdxV6RyY0ii/OeSd3V56bSgF9IaVFf/Otqlnl+Yi?=
 =?us-ascii?Q?TQom1LYo9sy0jxyk6JlL+QA8gPjU325I1BU/wcifzIv6DmBvB6UN5xuKJ2ut?=
 =?us-ascii?Q?bzQzKWFsShu35dmkiHSDgRdFLZG7orLrNdk4Do9jN5LC2ZCeFppkCauDaL13?=
 =?us-ascii?Q?72dIuGlri5PdI2dz5Af9M4e1w7CpWvOFgIrAXk8pCY35LmVwYV4ErUADUPN+?=
 =?us-ascii?Q?DlgqXAx7zP55NMUrnV92OMkeQIfwlIOKmoJteylZscx0mDn1nUnzjYyWkJCa?=
 =?us-ascii?Q?QcQiXnbpQEix4J86y2CnMu9UhceC2sGWGj/A+QPqL+JqhBnmfrEe2TrIMY52?=
 =?us-ascii?Q?6XkYHd/qLeIniKB8hRJVqOKxsNmKMA21e6XpzYSVOYpCtYG7V9mAhWjt+UPx?=
 =?us-ascii?Q?52wqn4n0NYRoEYd3udLdpUOADwgn5Fqyve4ZsmGFixk+W3QZdzo865x734lm?=
 =?us-ascii?Q?796CyGr6uHoYQrEk7X8qniJ39E71h+2Rzd7HX7yUaaAopBnDlSL9gI8bXPxT?=
 =?us-ascii?Q?ANDDnOXOLX2uRJahdqhz9cg0j9b1FVpS490IwBZrJpG41g/YnjL1JMT+/Gzu?=
 =?us-ascii?Q?/lGopiGLvcX5fkPM+xdMmXNWg1/8BC0E9TNExkMDps3rUaxRpxeoS2HJsA31?=
 =?us-ascii?Q?iSPxx2bi4tZyZxE4GVsM+c5PteczDleFrT1QfS7qRdr+/Vzk7CENbnxUvF/P?=
 =?us-ascii?Q?t1BGKFia41RVbqozvhMjKvXHsZzN8q/5Makcag/Mz7Hd8g5pLy36qiEuyVuV?=
 =?us-ascii?Q?cU/UQSfhjyI9aagGqjr+DDbwceOrdso7qQPb0i1/ptq5KRwed7qLZTcUPrem?=
 =?us-ascii?Q?pSSNWu2je7zNA4ebDjn7tmTtoMCk2zG70G2R?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 06:54:29.5779 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29443ec4-8e1e-48d6-5501-08ddbdec4953
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0C60B25BF
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

Add a new unit test case for buffer clearance issue during
resume.

Using a non-power-of-two mm size, allocate alternating blocks of
4KiB in an even sequence and free them as cleared. All alternate
blocks should be marked as dirty and the split blocks should be
merged back to their original size when the blocks clear reset
function is called.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/tests/drm_buddy_test.c | 41 ++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index 7a0e523651f0..26f8be8ceecd 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -408,6 +408,47 @@ static void drm_test_buddy_alloc_clear(struct kunit *test)
 				"buddy_alloc hit an error size=%lu\n", ps);
 	drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
 	drm_buddy_fini(&mm);
+
+	/*
+	 * Using a non-power-of-two mm size, allocate alternating blocks of 4KiB in an
+	 * even sequence and free them as cleared. All blocks should be marked as
+	 * dirty and the split blocks should be merged back to their original
+	 * size when the blocks clear reset function is called.
+	 */
+	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, mm_size, ps));
+	KUNIT_EXPECT_EQ(test, mm.max_order, max_order);
+
+	i = 0;
+	n_pages = mm_size / ps;
+	do {
+		if (i % 2 == 0)
+			KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
+									    ps, ps, &allocated, 0),
+						"buddy_alloc hit an error size=%lu\n", ps);
+	} while (++i < n_pages);
+
+	drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
+	drm_buddy_reset_clear(&mm, false);
+	KUNIT_EXPECT_EQ(test, mm.clear_avail, 0);
+
+	/*
+	 * Using a non-power-of-two mm size, allocate alternating blocks of 4KiB in an
+	 * odd sequence and free them as cleared. All blocks should be marked as
+	 * cleared and the split blocks should be merged back to their original
+	 * size when the blocks clear reset function is called.
+	 */
+	i = 0;
+	do {
+		if (i % 2 != 0)
+			KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
+									    ps, ps, &allocated, 0),
+						"buddy_alloc hit an error size=%lu\n", ps);
+	} while (++i < n_pages);
+
+	drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
+	drm_buddy_reset_clear(&mm, true);
+	KUNIT_EXPECT_EQ(test, mm.clear_avail, mm_size);
+	drm_buddy_fini(&mm);
 }
 
 static void drm_test_buddy_alloc_contiguous(struct kunit *test)
-- 
2.43.0

