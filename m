Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB3997C181
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 23:39:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A67FD10E652;
	Wed, 18 Sep 2024 21:39:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jT/EmOMW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEEAB10E647;
 Wed, 18 Sep 2024 21:39:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q/ozvebD0xfopoz8sqlMRg7KHmqeuxINHYeL6f3OfvQ7uM+RKFpX5ZCKdljuNFOSLTUyv0q+/mQ0v8llVcKe0ehehIGPnumyLt9h1wOaPYn7dwJEzSCB0UJpnkPl3UZQUD4w2i8EFli3jHOF9GFI8d0Uq7fKlFUOBfgwiRjl/Cs30QcclgHkSkeGTv2bHx/wnPriEe66lAq+BhstRqnsA7s2Hg+mZTdI1Z1FM2CV08V13qvds+LWkncCYzSnfMLELodmjStVQbQhzfhWAOHAibkSgeAqHsq56k0dxqliBJjatdhPsbSgRLH1hXz6DR9BlZpYovHmip+lDJJe7BAhQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwa8rGZU0N11GYPZx6ZCJVXkHR/gXOi7ORON2pthwZg=;
 b=j8pzBbBT8ISK2E37Pgya29s3hgWxR/qedhjLc2MOCD8d3LjBGdyJNnXK8n3WJok2iTkfM5nuDhGg/CLPko8HxVsPIeoBjECvJBVWr79SodZ1xaEUqurvg0oREoBY5BJLwtnKVdnL4EQduekCbyw8BGXOyKutwyVwBor3spEgUBiZC0/x2yuz1hsGP6esw1+MGAAJ36qc3h7MmQ/+aIawEoZwu4w/I3OuuWbNStmMZNMvbXyVWAU6xas7IJNHXGDLSPm1kdS41ZLXWjLtUgRCU6iCKH6VeL1H50xyfvk3xTrvK1VMfTuPgHvyndf/KyodMOof7PR66jfSE+tyc4leeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=igalia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwa8rGZU0N11GYPZx6ZCJVXkHR/gXOi7ORON2pthwZg=;
 b=jT/EmOMWqcU82R6r89JgrYiFQz5tPwZKs6nBiMbTzOU2ND2NQ4cFQ51wnldgeUxanWiIkC32+l6WX8SNRxldB0D5BPQ579vEbuRnXvWU5XX0UXVphlvU9q/aetFM5QCUSajXibFUmD08L5Nbs2o1HrOgOejkddvUEjUITbOBvwU=
Received: from SA1PR02CA0004.namprd02.prod.outlook.com (2603:10b6:806:2cf::8)
 by CYYPR12MB8992.namprd12.prod.outlook.com (2603:10b6:930:bc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 21:39:20 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2603:10b6:806:2cf:cafe::a1) by SA1PR02CA0004.outlook.office365.com
 (2603:10b6:806:2cf::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Wed, 18 Sep 2024 21:39:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024 21:39:18 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Sep
 2024 16:39:17 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Hung <alex.hung@amd.com>, Alexander Deucher
 <alexander.deucher@amd.com>, Melissa Wen <mwen@igalia.com>
CC: <kernel-dev@igalia.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <sunpeng.li@amd.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, "Mario
 Limonciello" <mario.limonciello@amd.com>
Subject: [PATCH v7 08/10] drm/amd/display: get SADB from drm_eld when parsing
 EDID caps
Date: Wed, 18 Sep 2024 16:38:43 -0500
Message-ID: <20240918213845.158293-9-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|CYYPR12MB8992:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e485825-ddb4-4461-6dda-08dcd82a59bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gPNODRS5Gr8E1XN/NGPLnCt+1goEwChbRu0ObGn++J+nYfAFUBL/USjTda61?=
 =?us-ascii?Q?I7U2fbmXDVzC16k6CO/2bjJRxJpNVcppn8rqQpVI+JeZcyCmVovQlBJcGXLM?=
 =?us-ascii?Q?ndGitZ//SW9ZGU+N1ri/iAehf80kI4QLCuryNwJ3gzFomgea8cyfPE0evAY3?=
 =?us-ascii?Q?2i/NuThe8tVYlI6vJLjOteTtqvb7vHY9QYlBsW59oHnu+hSva8CTx62u4Bp2?=
 =?us-ascii?Q?RtdYU+dNN33xJba7XfUZ9M0Z/pE5QYMgS5Fg0dDDdvDPH3yz4QMKv5ZkSUFw?=
 =?us-ascii?Q?C8jZeV9uWvPyl6eNmr3bqhdgy9xJP7lsnuGr6bo2Cekq12QV5+3RzWbgR5Cw?=
 =?us-ascii?Q?EAKF1SAd18uEmwZTDNsdJRFXzjRFsQwP4B5Ms32s65dYBLPCgfuFcuPQG3m2?=
 =?us-ascii?Q?gYBjJUxLM0Ea7tGSSIyRAG9GERM7hdp2WfZHBDuiLxs0Xu3ooTUwufNRaTzl?=
 =?us-ascii?Q?UswIPtTZ6cyefFFyyc++ihQujr0dcPtQ7xr8w4tzrbhR2QWGbpEsPob3j0E4?=
 =?us-ascii?Q?ZcJ1ut4zqZFO5tFts7tDSMBrZu1j2jEViqoNNZ8K2ZdFVkmpumCXzya2k1vo?=
 =?us-ascii?Q?ZjMYmPCOg0sHKt0se2wZTFs4hJN9DIynLsRIFgE1hSqs6p0ltX2zZbdayC+L?=
 =?us-ascii?Q?tgmVY2TGOWxhMYd/DQKm+h7EYcrbVJ9ug0Imfz6Qh4aW9VoAk/UiYdd6qiB+?=
 =?us-ascii?Q?q5eX6/3+8CzA6Vy2p1e1Zu+6q04AQiHLViZYkMtwoGQU/YJ53m5MVmHDyVjs?=
 =?us-ascii?Q?S4b9UqhP/+U9TtoXDCHjEZWf2oPbO5a348B3sDQASfeYRd/BhNR+nOpkSKR5?=
 =?us-ascii?Q?QZoTMjW1cd3/OaST93rxk7wcFkSphNuic3BNzDX9Ca8AS4qitzDg0tEd1iHc?=
 =?us-ascii?Q?mH1RVRdtSMo71Ggb18Lce+gIGUJNiu7jsOoIdNabyGSfkZLFk71npD9H+epW?=
 =?us-ascii?Q?Q7qNnWsBUl1z++oicseK+U4D5B5K1rAbHaj4W48VokzmhXJwsUTPey03rAX+?=
 =?us-ascii?Q?0+zTU7cEsuRWNkE7nyMfOUIzlUqRS29fkD+D2dgcPSvN8I66ESGv30MJe+JN?=
 =?us-ascii?Q?jl1llCkkbU/iMF11xgiwDrkYht7SgpDrf7IbAuEZr49ImCLhjYj1/nP4TVWs?=
 =?us-ascii?Q?Xm8ItXPc7bUd7Yl5ckN9pgy1cxM+nKDFTtJwJMbVRSo6ulZ0TczGrjF3moyB?=
 =?us-ascii?Q?x5/JikPI/bsM3a6y3/cxapoURvK/r98xv7BdD2lSNnFmEMEQRzLTxwawh0Fg?=
 =?us-ascii?Q?I9fXOWcOjlaBYtMtmjGOKkKFMslgebJ6/x6max4NhFcA7hZ4WfGUq+n6q1Zh?=
 =?us-ascii?Q?xfBun3FUXOXLyRgDTMH4KfWcP2b+C0b+KSQ2G48C9FNEtnrEkjBn3ONEsnxK?=
 =?us-ascii?Q?C84+s7XmL06Y83V7iC+CygoQpvNxA6Y9+ya1FRQpOa8X6p7j2YztK9I8QQfP?=
 =?us-ascii?Q?CtAMHDb6qSWTJihpyVcXskMi43JtEqYG?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 21:39:18.4642 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e485825-ddb4-4461-6dda-08dcd82a59bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8992
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

drm_edid_connector_update() updates display info, filling ELD with
speaker allocation data in the last step of update_dislay_info(). Our
goal is stopping using raw edid, so we can extract SADB from drm_eld
instead of access raw edid to get audio caps.

Signed-off-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index e0326127fd9a..d43ed3ea000b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -98,9 +98,8 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 	const struct drm_edid *drm_edid = aconnector->drm_edid;
 	struct drm_edid_product_id product_id;
 	struct edid *edid_buf = edid ? (struct edid *) edid->raw_edid : NULL;
-	int sad_count, sadb_count;
+	int sad_count;
 	int i = 0;
-	uint8_t *sadb = NULL;
 
 	enum dc_edid_status result = EDID_OK;
 
@@ -144,20 +143,12 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 		edid_caps->audio_modes[i].sample_size = sad.byte2;
 	}
 
-	sadb_count = drm_edid_to_speaker_allocation((struct edid *) edid->raw_edid, &sadb);
 
-	if (sadb_count < 0) {
-		DRM_ERROR("Couldn't read Speaker Allocation Data Block: %d\n", sadb_count);
-		sadb_count = 0;
-	}
-
-	if (sadb_count)
-		edid_caps->speaker_flags = sadb[0];
+	if (connector->eld[DRM_ELD_SPEAKER])
+		edid_caps->speaker_flags = connector->eld[DRM_ELD_SPEAKER];
 	else
 		edid_caps->speaker_flags = DEFAULT_SPEAKER_LOCATION;
 
-	kfree(sadb);
-
 	return result;
 }
 
-- 
2.34.1

