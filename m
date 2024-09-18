Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E3897C180
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 23:39:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9DD10E64F;
	Wed, 18 Sep 2024 21:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ow3W2qae";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1FE010E658;
 Wed, 18 Sep 2024 21:39:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qCXiVGCr1TjDIhfkfSEpYFRNFZygU/QU38CoYei8l314UTRl2hQhXoidBOQKkzGnI9I6SOdY2nE6KV0+SQXQ+OZ5ZCA7giCCEEPs7xJ6ZtECbinNq7tE3bM5/45HWdLGE1LaJiyU0L1li8sX0rSl4p57m0Y4OpkXow/d1PQMqxgpAswu9eFlJx/9UgEHwi0v6yZRnxHFSuL16BQsLTEU456YQlkw1ZMoSlbThktOw53I8+fcvfeeL4HcboBejlwTuvjNFVjEN/6u0+L8WxGz/8pusTyrbKde36yeNN3DPSa6WNhJN/5va+lE15hfuP8sjrtZjUglCnybMA5yXWB81Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGuigidjUKUtfUnICzbgzWDIQUHrCltFX2aACcwr4wg=;
 b=yXHntc0tMwmj2LU1j0cKXkp1/qMRNHuhn8+/TzHXSvKA2ok8EdhUHCAs95ZD6I9mVsq2l2gk4obtRGdGVnLvkUiRQFOllg9RehyiZ7P+Md0Z3XE55jr32ZlAy0kHnWlPOxe9SOAdPs/cEtIgQqT8WSb21/BGnv0wfDzTtaPl7J1ajAnlOxXnVyFlaq+m2LdSNyRdkDby9iY8/gpEabkmshUtsyPDciSUv7h9qk+IGLsFjhpWuNnnsXVlbPeBOvQnwh5Yv6RQ5TP74eRgz8noTGmqJn9mzau2+AujdjSKOTZ3JZlbIUAEIIUi0rz4A93SK1/gJ3POK8SkOuskLy07Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=igalia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGuigidjUKUtfUnICzbgzWDIQUHrCltFX2aACcwr4wg=;
 b=ow3W2qaepqZF+lV/eayRoI9vvz9QCkg/TSapHja+3yPNJskmAfZbo7/3WpIDbMJnnJyGGVsNmEqVdWXyKTwVifNqZeXVD9bFI6Ogi0dLH+uQzj1imQJWyVC334YtwURRbJoiR61pLLIYIN3V8ajPl4WlEiU0RmdeTsPOhN2aeYQ=
Received: from SN6PR01CA0018.prod.exchangelabs.com (2603:10b6:805:b6::31) by
 SN7PR12MB6909.namprd12.prod.outlook.com (2603:10b6:806:263::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Wed, 18 Sep
 2024 21:39:17 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:805:b6:cafe::d9) by SN6PR01CA0018.outlook.office365.com
 (2603:10b6:805:b6::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Wed, 18 Sep 2024 21:39:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024 21:39:17 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Sep
 2024 16:39:16 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Hung <alex.hung@amd.com>, Alexander Deucher
 <alexander.deucher@amd.com>, Melissa Wen <mwen@igalia.com>
CC: <kernel-dev@igalia.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <sunpeng.li@amd.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, "Mario
 Limonciello" <mario.limonciello@amd.com>
Subject: [PATCH v7 07/10] drm/amd/display: get SAD from drm_eld when parsing
 EDID caps
Date: Wed, 18 Sep 2024 16:38:42 -0500
Message-ID: <20240918213845.158293-8-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|SN7PR12MB6909:EE_
X-MS-Office365-Filtering-Correlation-Id: a13645e9-4027-4568-1785-08dcd82a592c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nYZB6Ai0n8t2EJbR3lBRvxtPRy5xsNVEjqNlxtM4vO+eRGhBT6KN/yelDhQe?=
 =?us-ascii?Q?ni0tf4du0HVN2D+Dye9StmdPawOAcKMeH10159HbKEFqIFNa107tZ5PQ82zm?=
 =?us-ascii?Q?EkZFZjScwuog5hA1rKA1fa1yj9ZQ1O+erEuJx1WyW3OgbmF2arRPhVIYfJn1?=
 =?us-ascii?Q?/lbuZ/RA6wUKwyscWXtbG6IuqbE7DJS0vaTW5mq46c/7oKivmbdRm0UFSOUS?=
 =?us-ascii?Q?oeK0QyhO1VWT81RYGpqbxv3dlVGYgpI89YUxtKtzYivkBDPiyRNfbAgpGTaS?=
 =?us-ascii?Q?ZvZqcqxGdfCm2NKwCKAwk+/1jtm165CUIVgVZ8cpTeVrvxqHgmPkrH5cNm4F?=
 =?us-ascii?Q?y1tgWFBa8Jg/lRLQwBKDfUkBZQ5gL9EsADWqPFr0JxsbdN4j3EX0Hl2GPqyV?=
 =?us-ascii?Q?5FsUZsDZLuBmhuy4jmMyZWZse7yj5XDMbF8M3N+NDnDJK140ZvGAiIRCCfhO?=
 =?us-ascii?Q?7YXORZk8FnFGLNipRCu8L5vRffTSWaKpNl2AXM1M/wtnBddRmlemSX+rqUjH?=
 =?us-ascii?Q?np/oc4Z10QllEAeocIhilVxw/ao1gU6h2WW70lqmaKDofEXPF5e/8eeC+iMu?=
 =?us-ascii?Q?CakIREDOZahsrFIO8z7rv6ev0pmTdf6YGQ0KXchwP1BMA66pV07/cAfNUFyk?=
 =?us-ascii?Q?zwM06ennQ1F2UkZvM1t5zRabe9ih2hMFLrVdcNKFSA/KdtvH6U4o6RcpGhaJ?=
 =?us-ascii?Q?ngxey6DGkV0AtuNvW516L/UTPnG5/AFQdwcMdHNZH1EEq/AABHizGt9X5mxP?=
 =?us-ascii?Q?VCEPYT6bXnb3hD2f1FNbeWKak2+FqQLBqOFHEQP7PifMcamiST+KdhIkZTqp?=
 =?us-ascii?Q?CXfZWEaJs15hD7kHFi6U82cPEghOmJ8pFxZxxeFEUfPqLZRusiLkKzOX8Ro/?=
 =?us-ascii?Q?DhWLJRiKnpgfyZuvLFompjQZA0nUSmUaBbm7fNVzOLjLpR46mj0bTCta0HBL?=
 =?us-ascii?Q?Cc6q+RuOBU+z/GStEuSYvhl9Cha5RnS4d7HfLfds2nENNShaC88dScDLp2Cy?=
 =?us-ascii?Q?RUJk3+IYbdhXm8LQPHpedGVpVv0rZGpquiC3C8tYV7WWfKLT7QlZ9TvK/x3m?=
 =?us-ascii?Q?Ik7dHx5e51QEnDabRv5q2HR+nSW6A4UTjZeqai857h21uj7y8QZXcMbNWl2t?=
 =?us-ascii?Q?rQ3c8vfh5pYwATDxhy7+1eDDl99cEevmGGanm81ELp4sSdsCp5kJpqCrulp2?=
 =?us-ascii?Q?XyehwIPnG5WEPYXUQ6oGril23Hl766Pp9/TkHEhjaOGE+AKRFOqvL+ATisbq?=
 =?us-ascii?Q?EiKomk78Ov1MhGRDA3DrOlgf035AnDbXhEekONeW9djKXION4yzqaOzPzRfB?=
 =?us-ascii?Q?GsiS9t+2Hq0dOfMKTptuTT/dJO1esgG2u1A5fhkrDVk+2+iijfjRbjJxW1N0?=
 =?us-ascii?Q?uwTJi/vSTXAwdrTN+P7TMhx85byJHZuJghwMNYet6zFJw+4mueyiWKeOHy9C?=
 =?us-ascii?Q?aaLFIfgUzpgOofFhe3rUdQNv3YHdfzcK?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 21:39:17.5274 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a13645e9-4027-4568-1785-08dcd82a592c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6909
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

drm_edid_connector_update() updates display info, filling ELD with audio
info from Short-Audio Descriptors in the last step of
update_dislay_info(). Our goal is stopping using raw edid, so we can
extract SAD from drm_eld instead of access raw edid to get audio caps.

Signed-off-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 854e51c0b3fb..e0326127fd9a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -98,9 +98,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 	const struct drm_edid *drm_edid = aconnector->drm_edid;
 	struct drm_edid_product_id product_id;
 	struct edid *edid_buf = edid ? (struct edid *) edid->raw_edid : NULL;
-	struct cea_sad *sads;
-	int sad_count = -1;
-	int sadb_count = -1;
+	int sad_count, sadb_count;
 	int i = 0;
 	uint8_t *sadb = NULL;
 
@@ -129,18 +127,21 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 
 	apply_edid_quirks(&product_id, edid_caps);
 
-	sad_count = drm_edid_to_sad((struct edid *) edid->raw_edid, &sads);
+	sad_count = drm_eld_sad_count(connector->eld);
 	if (sad_count <= 0)
 		return result;
 
 	edid_caps->audio_mode_count = min(sad_count, DC_MAX_AUDIO_DESC_COUNT);
 	for (i = 0; i < edid_caps->audio_mode_count; ++i) {
-		struct cea_sad *sad = &sads[i];
+		struct cea_sad sad;
 
-		edid_caps->audio_modes[i].format_code = sad->format;
-		edid_caps->audio_modes[i].channel_count = sad->channels + 1;
-		edid_caps->audio_modes[i].sample_rate = sad->freq;
-		edid_caps->audio_modes[i].sample_size = sad->byte2;
+		if (drm_eld_sad_get(connector->eld, i, &sad) < 0)
+			continue;
+
+		edid_caps->audio_modes[i].format_code = sad.format;
+		edid_caps->audio_modes[i].channel_count = sad.channels + 1;
+		edid_caps->audio_modes[i].sample_rate = sad.freq;
+		edid_caps->audio_modes[i].sample_size = sad.byte2;
 	}
 
 	sadb_count = drm_edid_to_speaker_allocation((struct edid *) edid->raw_edid, &sadb);
@@ -155,7 +156,6 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 	else
 		edid_caps->speaker_flags = DEFAULT_SPEAKER_LOCATION;
 
-	kfree(sads);
 	kfree(sadb);
 
 	return result;
-- 
2.34.1

