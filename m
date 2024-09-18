Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2B597C17F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 23:39:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A61110E65D;
	Wed, 18 Sep 2024 21:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rDaYavDm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2044.outbound.protection.outlook.com [40.107.101.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2710710E65A;
 Wed, 18 Sep 2024 21:39:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mc1DrVDY0Y0V3KNPw6+KITUfLCfKZ06ru+mZcQfUaut3GAZVYhNsfmvqDxLjxtRMF9mPh/8jtRLfJK1cOYXg5hpKwOvKj44dnDEHLqYLsAA4/dHkGyFFQjUqvJYx8hTLRboGQBfFgWaVCYEPxEi82fD8wx2VAyJbSapoaebI3tWgNf6QGc/AHRD5zvpnWH8FIDHqy3lDJkoLLKpg2SLCQ4412cYlxm0fzXAaEufchZq3YDv4Xv0aZo1rr72/SrY0BPF8QXeRTvtlEc/uOqETGYatnRDPxZi8Ff85C+ot3mgIFi24ZZ9XSidDqCSPFLery39YGcJAdlx87ITIDaYOBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dh9DX60BcQXwnX95FHcWSrEWRrOn+6KBib/XkNMOu2k=;
 b=iyX77Y8V88yTF+hSHgnpWA3kBrI0gWGRugkh2wxJlOrCKDWhI0eBNiUQ+WGBH17dBaIMqY1JfJLxkQcmQVtGGOTYgTa8QXz1eBB5WZ6o+OoI4VlFXZ6M4Kr6BptphhpRTLIPao7CnfJaTCSOgtu4qikQ07e9Nmwx8VT1PTVZZsjJ/lGfaffSioRyIgXz9ruDyV6YdTKmjjm3Z1e2JWAsyBSjV2uBrqy2gEuAX9SJTvNGomwjGbiwohUPPqRxw6mbjsnC1Wfqcz1c6Sc7Sbzh9vnXfhpX+2noLUeYkc4pzg6VjRQaTgVPlELIAzhbevm8ru2kOz6iZYTFcjtsKbxNkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=igalia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dh9DX60BcQXwnX95FHcWSrEWRrOn+6KBib/XkNMOu2k=;
 b=rDaYavDmngMp9gTL6mKGNxeoyOXImbn/13/8HlQI/Bxw4nnEuIboLChyNiHByP1X6j1PgvFNrETxi2pYUc7RGfukn44JvHsjWc+TKnDFWWjxEf5lJ0bcC1T1xyZRUvqNENvC/Ozbg/mbS8mc+GCR4QYDh0h4SNdSj8Zwk2SRDLg=
Received: from SA1PR02CA0012.namprd02.prod.outlook.com (2603:10b6:806:2cf::17)
 by DS0PR12MB7827.namprd12.prod.outlook.com (2603:10b6:8:146::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 21:39:21 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2603:10b6:806:2cf:cafe::eb) by SA1PR02CA0012.outlook.office365.com
 (2603:10b6:806:2cf::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Wed, 18 Sep 2024 21:39:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024 21:39:21 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Sep
 2024 16:39:18 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Hung <alex.hung@amd.com>, Alexander Deucher
 <alexander.deucher@amd.com>, Melissa Wen <mwen@igalia.com>
CC: <kernel-dev@igalia.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <sunpeng.li@amd.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, "Mario
 Limonciello" <mario.limonciello@amd.com>
Subject: [PATCH v7 09/10] drm/amd/display: remove dc_edid handler from
 dm_helpers_parse_edid_caps
Date: Wed, 18 Sep 2024 16:38:44 -0500
Message-ID: <20240918213845.158293-10-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|DS0PR12MB7827:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a6c717c-e751-4367-0e94-08dcd82a5b42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?c595RlyWrZcRpzg8kx4Sz7tzsVYUtqvu6amyVMz+OCj5Ij2YIdGuXEs7dSOu?=
 =?us-ascii?Q?Yrap/hrEecS9zImOkr9istdHofUawAGg6KplB4SNRCTirUS2PyXkYSOZySkB?=
 =?us-ascii?Q?uJpjd4HUBS9tBhWZfzA7wN9baKFOax4Q8eW4V+ZubGR1aO0WipKn1z9IwMU9?=
 =?us-ascii?Q?Pd49Xk7lac8FgoGM1EcnOa/NMZ2m0GjQqnG8DSzhJ8QQ+BcS5eEbRhsfHtsA?=
 =?us-ascii?Q?DA4imLveHGqx7D3MqlICDP26TFe3WlWBgsMVaAJrxfeA4xLTYURyJxBsRBzC?=
 =?us-ascii?Q?/C7cpMCwSZ/kDgIbPZwBNP62tUnYNV9PuQuPfD4nwgLYf/0dh3Ps1F0kISpD?=
 =?us-ascii?Q?c2FEWr+AU5hy/9SyMopRq1FoJxNTxUNBwBJcc1A3Qs0PgJ5A0coI2lUmt5XI?=
 =?us-ascii?Q?7rV29Jq+OJcfo9wwT21kSzubGzmS6GmDn8d/suYsh9O/7QeBQJXfpRsu+O1d?=
 =?us-ascii?Q?I1kE1RTIyeeX9xgCxecuYf3eJ31M5G+LD+jlzTLP5JUpSLH1k5cRcTbJ5KyN?=
 =?us-ascii?Q?yE//s+F5FbOJ+g5sjwOgDsLoIWg8mxQ/MtwhN2Y+NGM65dmJ0aolMk4j48/j?=
 =?us-ascii?Q?Y2m42QmD/2TLsW7YGbngdTk+S5vSt630/9+L9aYDycYgqPFVLIyMe5nhL5bm?=
 =?us-ascii?Q?FFLPNJjLO5Weo26Jgp/Yr0CpIXoz3I7iNMZ3aY5+UldbCyOUjcCUWwieksbA?=
 =?us-ascii?Q?6RQTN2ZIizszM08Jdn2x/r9WhxncGZp2PKPJILQuhRH+dCdzJvsYUQ6qDHHG?=
 =?us-ascii?Q?c7uGClPRl73KJVkOPy1hDn6cPWMEOBkVFU6Qya3gt3BnpK+6gYTLakKW5WWI?=
 =?us-ascii?Q?rzpMfXgPWYrNVKAGIvA+3PPYvaGrg/E/H9SpKtf15rz6/6VD3GgtCFOmD/nU?=
 =?us-ascii?Q?Eab2+l+4Chq4jsZAIPOJDHpVV2TRLxz2RCcjvUWclwOaEkBhzq7LeZ9f3hiO?=
 =?us-ascii?Q?FK9t8DtY4i9XBnoDMcUjnaq7ZkNXnBBsE8Ofp6lJp9pwOSe8JnCJYbmgjQtD?=
 =?us-ascii?Q?PQyhH+1fONKE+WqHD79FMTTnXGmOzDPnXvw1MHOQhPgisdfxjyW/aGdD7e3N?=
 =?us-ascii?Q?G8SNFgLYqaLKITYPQf18H3t79+Jv8kzGOrFwKJD1CkQBkrJ4pMCh8lGoI/hd?=
 =?us-ascii?Q?dctr3/1vu29O0sTlCcUtk4osHSUcppjlpPXeGlr4DY20iPblxbp5hngfiE0S?=
 =?us-ascii?Q?7CiaHXyEKiTr4DPLjbUHibjmluuPU3/+Sob6foCV6EQhPrN7SemiGMCaSsDS?=
 =?us-ascii?Q?znnx3FNbpFEo9asKOXmCt1pS675NCM4kcuRq/5KcxoxTlp5N4uR+NC5aIhwg?=
 =?us-ascii?Q?ztme9iAkDYfKIoiL0GriLvHGvhG6BGYJ1p62hxsIVbvxKyrygy/CiKALJA/3?=
 =?us-ascii?Q?TdeWZXQSCV9clDpYX5Wzxb0OCEwAmQ0qf8t/V33Xqhscth7weYkdOc/3inP9?=
 =?us-ascii?Q?9QIysChubtBJ7e+OcLK2Dn5fG1/LL3Ai?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 21:39:21.0268 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a6c717c-e751-4367-0e94-08dcd82a5b42
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7827
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

We can parse edid caps from drm_edid and drm_eld and any calls of
dm_helpers_parse_edid_caps is made in a state that we have drm_edid set
to amdgpu connector.

Signed-off-by: Melissa Wen <mwen@igalia.com>
Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  5 +---
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 30 ++++++++-----------
 drivers/gpu/drm/amd/display/dc/dm_helpers.h   |  1 -
 .../drm/amd/display/dc/link/link_detection.c  |  6 ++--
 4 files changed, 16 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index bd8fb9968c7c..bf847ac55475 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7123,10 +7123,7 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
 		memset(&dc_em_sink->edid_caps, 0, sizeof(struct dc_edid_caps));
 		memmove(dc_em_sink->dc_edid.raw_edid, edid,
 			(edid->extensions + 1) * EDID_LENGTH);
-		dm_helpers_parse_edid_caps(
-			dc_link,
-			&dc_em_sink->dc_edid,
-			&dc_em_sink->edid_caps);
+		dm_helpers_parse_edid_caps(dc_link, &dc_em_sink->edid_caps);
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index d43ed3ea000b..8f4be7a1ec45 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -83,32 +83,24 @@ static void apply_edid_quirks(struct drm_edid_product_id *product_id,
  * dm_helpers_parse_edid_caps() - Parse edid caps
  *
  * @link: current detected link
- * @edid:	[in] pointer to edid
  * @edid_caps:	[in] pointer to edid caps
  *
  * Return: void
  */
-enum dc_edid_status dm_helpers_parse_edid_caps(
-		struct dc_link *link,
-		const struct dc_edid *edid,
-		struct dc_edid_caps *edid_caps)
+enum dc_edid_status dm_helpers_parse_edid_caps(struct dc_link *link,
+					       struct dc_edid_caps *edid_caps)
 {
 	struct amdgpu_dm_connector *aconnector = link->priv;
 	struct drm_connector *connector = &aconnector->base;
 	const struct drm_edid *drm_edid = aconnector->drm_edid;
 	struct drm_edid_product_id product_id;
-	struct edid *edid_buf = edid ? (struct edid *) edid->raw_edid : NULL;
 	int sad_count;
 	int i = 0;
-
 	enum dc_edid_status result = EDID_OK;
 
-	if (!edid_caps || !edid)
+	if (!edid_caps || !drm_edid)
 		return EDID_BAD_INPUT;
 
-	if (!drm_edid_is_valid(edid_buf))
-		result = EDID_BAD_CHECKSUM;
-
 	drm_edid_get_product_id(drm_edid, &product_id);
 
 	edid_caps->manufacturer_id = le16_to_cpu(product_id.manufacturer_name);
@@ -920,19 +912,23 @@ enum dc_edid_status dm_helpers_read_local_edid(
 		if (!drm_edid)
 			return EDID_NO_RESPONSE;
 
-		edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
+		/* FIXME: Get rid of drm_edid_raw()
+		 * Raw edid is still needed for dm_helpers_dp_write_dpcd()
+		 */
+		edid = drm_edid_raw(drm_edid);
 		sink->dc_edid.length = EDID_LENGTH * (edid->extensions + 1);
 		memmove(sink->dc_edid.raw_edid, (uint8_t *)edid, sink->dc_edid.length);
 
 		edid_status = dm_helpers_parse_edid_caps(
 						link,
-						&sink->dc_edid,
 						&sink->edid_caps);
 
-		/* We don't need the original edid anymore */
-		drm_edid_free(drm_edid);
-
-	} while (edid_status == EDID_BAD_CHECKSUM && --retry > 0);
+		if (edid_status != EDID_OK) {
+			/* We can discard the drm_edid and retry */
+			drm_edid_free(drm_edid);
+			drm_edid_connector_update(connector, drm_edid);
+		}
+	} while (edid_status != EDID_OK && --retry > 0);
 
 	if (edid_status != EDID_OK)
 		DRM_ERROR("EDID err: %d, on connector: %s",
diff --git a/drivers/gpu/drm/amd/display/dc/dm_helpers.h b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
index 2e4a46f1b499..4e1776b5f0d4 100644
--- a/drivers/gpu/drm/amd/display/dc/dm_helpers.h
+++ b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
@@ -61,7 +61,6 @@ void dm_helpers_free_gpu_mem(
 
 enum dc_edid_status dm_helpers_parse_edid_caps(
 	struct dc_link *link,
-	const struct dc_edid *edid,
 	struct dc_edid_caps *edid_caps);
 
 
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
index d21ee9d12d26..94c911742dd3 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
@@ -1413,10 +1413,8 @@ struct dc_sink *link_add_remote_sink(
 			dc_sink))
 		goto fail_add_sink;
 
-	edid_status = dm_helpers_parse_edid_caps(
-			link,
-			&dc_sink->dc_edid,
-			&dc_sink->edid_caps);
+	edid_status = dm_helpers_parse_edid_caps(link,
+						 &dc_sink->edid_caps);
 
 	/*
 	 * Treat device as no EDID device if EDID
-- 
2.34.1

