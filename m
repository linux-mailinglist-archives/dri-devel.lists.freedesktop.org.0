Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEB3AF0368
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 21:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D02BE10E627;
	Tue,  1 Jul 2025 19:09:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="24oQGpx5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2083.outbound.protection.outlook.com [40.107.220.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA6E910E60B;
 Tue,  1 Jul 2025 19:09:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yX+id2xCorhutY9Ovn+triMa6g/72RYWBlRlT9Tbq7KuoZ1Qn2YSLwcoc5hkEzG9ikRIo5sKq1Mlqless84yNbYs5PFhMtUtcTDZl+sdj6hW0y1doSWpmuw/EbamadWymmldHZsO3XCPALqjCUsQjPz8RIOVDeEcSrgQf4ZkdaSti0LQU01dOKGvy+yIV2KJV9Dd+Y9wsZCHJNFGwVH2Zh0PHvuSZLz/C0XmEXG6GmXPyp565Dnudj15xqBoaQ3gtC39JDmuHD8AVYQffHglhGr0MRQKRdLxfIO7CdO0PPgmDRkCccRw0yTqhQYWLW6x/xB12KuvrIaWNMWs3dspgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTbKVYPSBtpwXva4eCd5m8kwnm9PpPRJ5MJ3nMW2keU=;
 b=DwxqPdAPHRLSPhnv9+Lopy3MDG7SAUkUVz1x9TJqBXvK/fZqzvkjRE+yC1E4fBFt2eZr1ea6yaYL/gdrjlasrryp99FwnPnirc0OKPCJ5F3cIDdnIgz7V+RqHfBYwtKUNqa0hIuXqnDoimhJWN7hWo6NqXGItKWz8I1AnI6ZrXgIGUGCP7CTTH7VUy4HmcMeoESzS577PqiqgFynx/NiMzzAYw1TJ1ves6dU+ypajom9Qkv6zSgH1Q0yHLrS2OVAn86Nxo2r+PJjvPwPrwTmJRd9lSahFjsPoOv6ju1YC8PNeSwvBaWrD7/h4QxlxePGjTLfkLIhtgwLhKx3lNWntw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTbKVYPSBtpwXva4eCd5m8kwnm9PpPRJ5MJ3nMW2keU=;
 b=24oQGpx5DEIvbzc5VFLf3BHuGiw535n2swBBp/Qamh8g+CyBdIFrPHAqNT0wfVQOuMpuuKikpnmO5dq382AAWVEZJG1EspUrbCZs+fwKPIEEl6RTO1GqUpuQQXkXGMg2zu7RhzTWuRehzeIrM42Wi8yuRa2BFIhPi3cpdAghOEc=
Received: from BLAP220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::10)
 by DS0PR12MB8442.namprd12.prod.outlook.com (2603:10b6:8:125::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Tue, 1 Jul
 2025 19:09:55 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:208:32c:cafe::2c) by BLAP220CA0005.outlook.office365.com
 (2603:10b6:208:32c::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.26 via Frontend Transport; Tue,
 1 Jul 2025 19:09:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Tue, 1 Jul 2025 19:09:54 +0000
Received: from rtg-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 1 Jul 2025 14:09:52 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <matthew.auld@intel.com>,
 <matthew.brost@intel.com>
CC: <alexander.deucher@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v2 3/3] drm/buddy: Add a new unit test case for buffer
 clearance issue
Date: Wed, 2 Jul 2025 00:38:22 +0530
Message-ID: <20250701190822.5272-3-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701190822.5272-1-Arunpravin.PaneerSelvam@amd.com>
References: <20250701190822.5272-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|DS0PR12MB8442:EE_
X-MS-Office365-Filtering-Correlation-Id: a21eae1d-0df6-4bd7-3954-08ddb8d2dcfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HSnSC7PlxV52doUaLUuLmsWhDeCLpZQqMirBDfOMrKPIjWb7yu7G5mLMbthL?=
 =?us-ascii?Q?6yG7KVJ9npWQ07ZBcwqgUIDI4T4FyXqQn4802L1drqZQqAlCGAr32JC2kyAA?=
 =?us-ascii?Q?p9IfV/rQOmBivTl/LuOim52uQUPBIjlt8NQvfRfj1/Z2HNApRun0BNa15bPf?=
 =?us-ascii?Q?PQ5bxVBFGG9qcgKN4cdy86h8Jj7DDUoEI6HT9NlE3j6jXtv2M/Hd4NpriUAB?=
 =?us-ascii?Q?lDPy3OlbU2X11YNLSPTAeS4zTy3XrWmVc1FlfIcoxeGsqJyFujI5+8fkimYM?=
 =?us-ascii?Q?w+/YeEDXF1maHnYCm1h0Z/fCTCVyJrv8FRr+1I7dPwPeb7NYFBRrUyFq/KqB?=
 =?us-ascii?Q?uELbdtucdPlSL/EiyLzGAxtFTjZ2VXyMpQwlyuJvRii9JdgQhimvuaqxg7sM?=
 =?us-ascii?Q?wqXM/ZzMbAZhmrW7iqGBAwc3xvF0j6knpFOPFmTNRSyKWGnrLnFyylo2t5Re?=
 =?us-ascii?Q?vbHCvL89UVQ21xPM9BHK4UsjK6Zqp738TErU0Lk6f/LhsJrBC5vMDT0QVeSp?=
 =?us-ascii?Q?X9j5HDU2ygWAZgZqE6jcF7jMZ3TQWaa/3gx1yUwUruheT8n21+6FSLMIWj+c?=
 =?us-ascii?Q?sQ4AzXXpQ2M9iKWs+n1bsF/+x4uYr3UPJZKV9rCrYwWMfcpkoOtv5aVkmS6F?=
 =?us-ascii?Q?3sJ7TAMVbHJkXBjezq8Z8dOuQf+6SfP4A1k1wI6jbgco2s7Erd0exB+sVM0w?=
 =?us-ascii?Q?3AFfET91KAJ+flZry6lZeRomKIy4SMx8ILsz0I29Rb2RisA2Dq704gC/Inb7?=
 =?us-ascii?Q?96bQF79fQ/WgDX9OFaGGD9jOw3J+rIwOWINrUXnlFHyCqZgr/M4s8k29X+p1?=
 =?us-ascii?Q?B2QySruM0EmScV1bD+I8dgZNWcL+3FW3n2g7KCq3GKhNtBg3EC5+/qRa2SBG?=
 =?us-ascii?Q?rUIN+W1OkOCz+ub6cW0ouG66aTKP90OhOj6Wa6PidfMzBkOAIKNOPDI1YE3U?=
 =?us-ascii?Q?vtuIomQRltYQv+yBdf21oTxYJ6jZo4T+wKwLqRslljjE3qsd3cKIOoNSWidg?=
 =?us-ascii?Q?hJKHyO3PivxZvHyR1x+LPWBpfYAdTVzoLyeDn9CxA/Vm9F76TGlcof1dsPJh?=
 =?us-ascii?Q?+EagsuZn/QNH9hvZ+7XKx0+ZG5Bys8ejUkBfWJwLQtbt6CkCHzK+ECi7oHBL?=
 =?us-ascii?Q?3xKg993dDWk3f1G5eZLICbN6W9hVdpHTy2u7eoHh7o0FZuEtI9S8DLkDrOiM?=
 =?us-ascii?Q?wuJWuAUgmxyeSVWFJdv6YbUQACL4Bg8yrbegU7Qa84bBMfglneLq6eJVCQK2?=
 =?us-ascii?Q?jY9aC+JOsOOU5hwaTIcER828L+ty+inaw6y4LyS+cFQAyWpVUdHOTmeUbNRu?=
 =?us-ascii?Q?+QhiCbnmJhxGUrlAku55wWGEBHvOydTq4lavTjuBZ/TaV72Emr0aIj169NGJ?=
 =?us-ascii?Q?nvXMQUGI9tYxkee0zeHNBRuUdu9+m51xd7XT+f0pxihj5O7qRoQCLRxFKdOo?=
 =?us-ascii?Q?/m0vB3dULlN0blmdgsIUMsGCO8Qe9Dijp20hSOeYTFhXLR8Fxgrs7S9z+r+9?=
 =?us-ascii?Q?nov9BLBMNDz9bD5vA5qhe3H4xH//1PgjEFDy?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 19:09:54.6155 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a21eae1d-0df6-4bd7-3954-08ddb8d2dcfb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8442
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
index 7a0e523651f0..e23922a21c77 100644
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
+	drm_buddy_reset_clear_state(&mm, false);
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
+	drm_buddy_reset_clear_state(&mm, true);
+	KUNIT_EXPECT_EQ(test, mm.clear_avail, mm_size);
+	drm_buddy_fini(&mm);
 }
 
 static void drm_test_buddy_alloc_contiguous(struct kunit *test)
-- 
2.43.0

