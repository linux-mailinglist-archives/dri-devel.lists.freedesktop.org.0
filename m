Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 509A297C179
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 23:39:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A93E10E653;
	Wed, 18 Sep 2024 21:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="K+IrPvus";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9537110E64D;
 Wed, 18 Sep 2024 21:39:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KMKgwu9BbiVvFnKa0ORGg9qzfo6emmuC91xX2vcuUaQ7yCEwV5fehYFaxpF/pDijyKBUUtVXiVWDWjq6iF2thyOBnsjKaCUulR9iQEcuP61BHWYxp8ZmgPIxG4JHP2hDEgGNY80BJtivK3Jc9pkttVatBwUUBjUZT74T7JZNFohRFfhIMwbSFPhwY8uQ93ZxnlEFoCIoU4fq9R6Lau3obBI7mQ11CDiEWYijDKqHhu+GkLeTrCJbxEV8/cQJZNOXNgVLP7LglPhLcYQ4h/PKoM9H3vpRBOoHUWoNVGoxlyCt43HRsHQpHlw4uqxVMEJnejrbAitjdWw58RZ6YZ7+jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8umAsWMpM5LrcWrflZA1nu71y1YZf95wZ5ifv87Be4w=;
 b=M4DIKDaxQ1EKdr7Vly9U8MIEpnYAMafk+7HsTHKfeUsV8BYg6CVISwBdn8IWz6floHTMaFeZu4BmyufSNEBySxIoAujskM6hnrw4xTYNnC6x+mR6jSXqu+pA9CytQObNl1t5pQFbrZNyMDKYhVVl4n4Hcyc2kuSf13+9XaAv/+tO7XiDEugImk7yi788sIuBes4RX0DiVh1UWbQez83FriL6qHvAo2jEujAn02b0ZpiOqXpZtsp+M9Va/hvwU+KeH5dF4CFBXEtg4BL/bEVF7swyta41LloBHGFD8hBjGtAF+sKc/xe7NlARh5mnAPX8E91V2EvYoI6IvtAOntcxBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=igalia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8umAsWMpM5LrcWrflZA1nu71y1YZf95wZ5ifv87Be4w=;
 b=K+IrPvusrva5JAJsuliCDkgkNaEl+rFAewLUY8c+FiRSosVd4bSKjWkfpvgOoFtvgpdGsd3m2xCjeaG9QokA4a/7chVyTR0hLMI4FOeEbl5FhQjtW11eL2bo1+3kl9E+/66R158YJttW6HzlPzuaoRuvukjJVd0klD7HFfojDrs=
Received: from SN6PR01CA0016.prod.exchangelabs.com (2603:10b6:805:b6::29) by
 SA1PR12MB5659.namprd12.prod.outlook.com (2603:10b6:806:236::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.17; Wed, 18 Sep 2024 21:39:16 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:805:b6:cafe::e6) by SN6PR01CA0016.outlook.office365.com
 (2603:10b6:805:b6::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Wed, 18 Sep 2024 21:39:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024 21:39:15 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Sep
 2024 16:39:14 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Hung <alex.hung@amd.com>, Alexander Deucher
 <alexander.deucher@amd.com>, Melissa Wen <mwen@igalia.com>
CC: <kernel-dev@igalia.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <sunpeng.li@amd.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, "Mario
 Limonciello" <mario.limonciello@amd.com>
Subject: [PATCH v7 05/10] drm/amd/display: use drm_edid_product_id for parsing
 EDID product info
Date: Wed, 18 Sep 2024 16:38:40 -0500
Message-ID: <20240918213845.158293-6-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918213845.158293-1-mario.limonciello@amd.com>
References: <20240918213845.158293-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|SA1PR12MB5659:EE_
X-MS-Office365-Filtering-Correlation-Id: d9748963-bca2-4139-22c3-08dcd82a5834
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wp0FE3Yda+NTBAjdTmPxme2EYqLTkIcusFnrGAB/bu5DoWRHRGFKjEtjl/0Q?=
 =?us-ascii?Q?reHIlTvnoql8pD5kuMyFiTWZHm1y2unNx6jS2UCeFjvZqAZ984e32sYQJVVF?=
 =?us-ascii?Q?5Ky3z6QxWSlv4Pd0yRWtBU8yp7xVhzfuUo+kg92o8qB4ZN/gU/Q+7H6ULTUb?=
 =?us-ascii?Q?6Yx+p7U54ouVvRbNQlkPC/MEBLOxyP6y2u5/JAtwW8Lsj5L8b8/za1mEiCMT?=
 =?us-ascii?Q?0YuyTyAwU4HB8bGpWT7vFW/m/+WR4AY7j9TyZ7IEGUheRysjz1k0rJpv6EWf?=
 =?us-ascii?Q?Fo4cee49+saIOD4b01KFxZu8I3Jm4wpKkLiEChuFuyCDj/nUTJKn7L6d2f0y?=
 =?us-ascii?Q?4gLDmFA8X9B6W9yWSemBiDy9yoI+VoLJyPzdH6O/KCmtPR8paUQGHdpYv0sX?=
 =?us-ascii?Q?Yw70HQ/h4lik1FbRi0KIKe1sDOgADtgmh2Aa7S8Nhwk9gIG1aoMaDO+KtHxP?=
 =?us-ascii?Q?u7O2jOgjoc7WGizbAi2HJc/zdgdXRuTjbq04GyPtGzjmACuEKLWo71ndlakI?=
 =?us-ascii?Q?gPoaSycCdBsx9EDJsUU2sKZHf/5mv981EP1C4dKoIxh1dvVkCvM/pikjOFKx?=
 =?us-ascii?Q?gpoSjdx3OaO4Bdf5ncrB/+TFn1asl8SfCeRydqqMlHW7W0pwGcOxAPtj7hla?=
 =?us-ascii?Q?9m1g/l6sRJ+HvwRpxFmoA6G/XtNH9Si1xVznXrdQHBHr5PwxVYZE7QORu/0O?=
 =?us-ascii?Q?NOrajjIgvLNAzvLmK90gHjdR578hFXbahJKF06YyD/rNF8kHfXdDLXloxfJS?=
 =?us-ascii?Q?QCcnyQdIF4ojYpsqvCnZtduFvEPNEmHtgyiE4WEoYcQJTs1Ys2F273xE2ice?=
 =?us-ascii?Q?xafZcTm0gojnv7tDkOKhhRowC92CCr8BFs6Yt7vPYMi0vTjmZb+HRP1EqUD1?=
 =?us-ascii?Q?Igaw7RpWbRZANvC1y+eFrKN8m0Grwh0ItfM5BQJlA+SQ8lt7t/PBuNXZ0D8u?=
 =?us-ascii?Q?j8DtPlK2YveGLJ/yh8V43Tn2yQlahZRRYdMf20kTy4AJk14W3mQ9eFehIgnR?=
 =?us-ascii?Q?pux/71ZI4YriZ5eTcK+TQQb/uG2OLwOHNVvR++YdLgFU40Lzy8wpOm70BWjJ?=
 =?us-ascii?Q?Wago1LAOxo/SwAavhqvRSW4LU1pUAN9VLkv8tfyneTmcqKSWB7x3vITCIZa1?=
 =?us-ascii?Q?KDtAM5cwF4D5fRUusJ9WubKfS6DLWN/idVOXCqh8OtFrmM4XqYvjy7UZA4jB?=
 =?us-ascii?Q?O9V0VlUd3rksGF6z28Nu1Eka4v0n2TlvOHGwoqRWS6StlO7bViujHSCR7Qc5?=
 =?us-ascii?Q?tnYOu/qAw20QPaDTBkJRySmukv9Rd+jeM9NPbWpPVK7Cxrg3W/NW3nrzjWbd?=
 =?us-ascii?Q?KTbExUvvrcYTdZEAZEPwwPMIOZq2690thXpSLMq5SpaDYN6pV0Q2LAGOMI7+?=
 =?us-ascii?Q?TORBlh07aZsQPLz5T45B5LEGs2dS63BAmi3JCmcEbr5IVlH+pjyw33jVC2ES?=
 =?us-ascii?Q?2PNoBt3K6HNRzxQ2jwwwBD0v4K/26P9L?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 21:39:15.8868 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9748963-bca2-4139-22c3-08dcd82a5834
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5659
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

From: Melissa Wen <mwen@igalia.com>

Since [1], we can use drm_edid_product_id to get debug info from
drm_edid instead of directly parsing EDID.

Link: https://lore.kernel.org/dri-devel/cover.1712655867.git.jani.nikula@intel.com/ [1]
Signed-off-by: Melissa Wen <mwen@igalia.com>
Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 38 ++++++++++---------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index b8004ccdcc33..cf11ac4c1672 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -45,16 +45,16 @@
 #include "dm_helpers.h"
 #include "ddc_service_types.h"
 
-static u32 edid_extract_panel_id(struct edid *edid)
+static u32 edid_extract_panel_id(struct drm_edid_product_id *product_id)
 {
-	return (u32)edid->mfg_id[0] << 24   |
-	       (u32)edid->mfg_id[1] << 16   |
-	       (u32)EDID_PRODUCT_ID(edid);
+	return (u32)be16_to_cpu(product_id->manufacturer_name) << 16 |
+	       (u32)le16_to_cpu(product_id->product_code);
 }
 
-static void apply_edid_quirks(struct edid *edid, struct dc_edid_caps *edid_caps)
+static void apply_edid_quirks(struct drm_edid_product_id *product_id,
+			      struct dc_edid_caps *edid_caps)
 {
-	uint32_t panel_id = edid_extract_panel_id(edid);
+	uint32_t panel_id = edid_extract_panel_id(product_id);
 
 	switch (panel_id) {
 	/* Workaround for some monitors which does not work well with FAMS */
@@ -94,6 +94,8 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 {
 	struct amdgpu_dm_connector *aconnector = link->priv;
 	struct drm_connector *connector = &aconnector->base;
+	const struct drm_edid *drm_edid = aconnector->drm_edid;
+	struct drm_edid_product_id product_id;
 	struct edid *edid_buf = edid ? (struct edid *) edid->raw_edid : NULL;
 	struct cea_sad *sads;
 	int sad_count = -1;
@@ -109,13 +111,13 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 	if (!drm_edid_is_valid(edid_buf))
 		result = EDID_BAD_CHECKSUM;
 
-	edid_caps->manufacturer_id = (uint16_t) edid_buf->mfg_id[0] |
-					((uint16_t) edid_buf->mfg_id[1])<<8;
-	edid_caps->product_id = (uint16_t) edid_buf->prod_code[0] |
-					((uint16_t) edid_buf->prod_code[1])<<8;
-	edid_caps->serial_number = edid_buf->serial;
-	edid_caps->manufacture_week = edid_buf->mfg_week;
-	edid_caps->manufacture_year = edid_buf->mfg_year;
+	drm_edid_get_product_id(drm_edid, &product_id);
+
+	edid_caps->manufacturer_id = le16_to_cpu(product_id.manufacturer_name);
+	edid_caps->product_id = le16_to_cpu(product_id.product_code);
+	edid_caps->serial_number = le32_to_cpu(product_id.serial_number);
+	edid_caps->manufacture_week = product_id.week_of_manufacture;
+	edid_caps->manufacture_year = product_id.year_of_manufacture;
 
 	drm_edid_get_monitor_name(edid_buf,
 				  edid_caps->display_name,
@@ -123,7 +125,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 
 	edid_caps->edid_hdmi = connector->display_info.is_hdmi;
 
-	apply_edid_quirks(edid_buf, edid_caps);
+	apply_edid_quirks(&product_id, edid_caps);
 
 	sad_count = drm_edid_to_sad((struct edid *) edid->raw_edid, &sads);
 	if (sad_count <= 0)
@@ -909,9 +911,9 @@ enum dc_edid_status dm_helpers_read_local_edid(
 	 * do check sum and retry to make sure read correct edid.
 	 */
 	do {
-
 		drm_edid = drm_edid_read_ddc(connector, ddc);
 		drm_edid_connector_update(connector, drm_edid);
+		aconnector->drm_edid = drm_edid;
 
 		/* DP Compliance Test 4.2.2.6 */
 		if (link->aux_mode && connector->edid_corrupt)
@@ -929,14 +931,14 @@ enum dc_edid_status dm_helpers_read_local_edid(
 		sink->dc_edid.length = EDID_LENGTH * (edid->extensions + 1);
 		memmove(sink->dc_edid.raw_edid, (uint8_t *)edid, sink->dc_edid.length);
 
-		/* We don't need the original edid anymore */
-		drm_edid_free(drm_edid);
-
 		edid_status = dm_helpers_parse_edid_caps(
 						link,
 						&sink->dc_edid,
 						&sink->edid_caps);
 
+		/* We don't need the original edid anymore */
+		drm_edid_free(drm_edid);
+
 	} while (edid_status == EDID_BAD_CHECKSUM && --retry > 0);
 
 	if (edid_status != EDID_OK)
-- 
2.34.1

