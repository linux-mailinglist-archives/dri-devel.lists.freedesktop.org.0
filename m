Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB6D8D035C
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 16:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9273F10EED6;
	Mon, 27 May 2024 14:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2qNMAeQj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA9810ED0D;
 Mon, 27 May 2024 14:23:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7uorN/ISrpSUwgDQwvvnuVAEWU2p+tP8ay3HDkCxqET/NNA6bQrcb+2qqTnVWwHd3CY+RrXgA+6RRXLyIkd0FvTaFtYaLPlueSO1PJa+Kh+Hna9gBazyVkVb902QbL0IWq7Ug3Ojw1BH29nECww2UUEWglHFMC7HcG8LHuDVG49XKn19jeXqQd3FRksAs885I1NarpWwQgd5uCIN64PdW7XPA3w8rRQcmls4c185lDQJdRZsrAezokzPQeUN34kz37sDX6D1BPAGki9jEYqgzffRXcMgENNTGbW7sbaVhHQyjiLfDIX/GjJgGUCKSJhZCiWE5Iu82NRXm0pWYl5YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=phMXJe+DHK3g7n6LlPjha+ZNbJvzU2d8pm1P7DmcJaU=;
 b=GrgaLY2sneYDSeyzjrN+g4aEQaqPYefwftmeK76NFw58tWIgoe3dckXJ+6SFT2cNcEZPvWsv+Xp9jBEotjEM4SFgYaPncsVnMVWfR1UaqRE8SaxxrBElm5wJfnbK9OpJpqhmaUl0cDgs7Z+yLgtVo8tRyJxs990v3mK94WhMEKVRqRItEIftAzgnE84g5DYDfLrJVx0UqWilIpN6DxfxVkp0oa0tkWTdUQf5+/gwohTe4BWES7LVPGHkTxaJiDoUeJ+h560tzOBwUArcBUenaRVuVz5KMm+RaQaNSvkC1jcQQy9lvr9lmvIPto8ijFujPDKgxO7utoUUSEEzpu180g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17)
 smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=temperror action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=phMXJe+DHK3g7n6LlPjha+ZNbJvzU2d8pm1P7DmcJaU=;
 b=2qNMAeQjpuiHBT6YRYKUKoQsGCUZUwENAwHNeHpsF8gTLHopSvFYFI1IpwuE+w/pVoCTS0zaoiPovmUaeRPD36Dlj2ALgk9bQSbfWRBZ5oeoWhMP5o7w87MxZo1xZsRcbdrNKvmm6jlmUA8TMaMx4RxuBOoUp9ETU+hwzaE2FjM=
Received: from BY5PR13CA0024.namprd13.prod.outlook.com (2603:10b6:a03:180::37)
 by BY5PR12MB4228.namprd12.prod.outlook.com (2603:10b6:a03:20b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Mon, 27 May
 2024 14:23:30 +0000
Received: from SJ1PEPF00002316.namprd03.prod.outlook.com
 (2603:10b6:a03:180:cafe::5b) by BY5PR13CA0024.outlook.office365.com
 (2603:10b6:a03:180::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.16 via Frontend
 Transport; Mon, 27 May 2024 14:23:30 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002316.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Mon, 27 May 2024 14:23:29 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 27 May
 2024 09:23:27 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <linux-kernel@vger.kernel.org>, Mario Limonciello
 <mario.limonciello@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "Chris
 Bainbridge" <chris.bainbridge@gmail.com>
Subject: [PATCH] drm/client: Detect when ACPI lid is closed during
 initialization
Date: Mon, 27 May 2024 09:23:11 -0500
Message-ID: <20240527142311.3053-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002316:EE_|BY5PR12MB4228:EE_
X-MS-Office365-Filtering-Correlation-Id: 61704e10-a7bd-4a3d-5dce-08dc7e5894e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|36860700004|376005|82310400017|1800799015; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tztx4y1ickvl4tjpOt27ld5+/szlep+iKC13uDGobgcjqLm4Ojy19/9ROWuY?=
 =?us-ascii?Q?0U0ZiXFKoEuWyExehVvbtt9kNq1MHArsvg8evkinflqwVfRBqr9f8ahRObEK?=
 =?us-ascii?Q?nJ/cmEZGA2Z58O6kUr7ddNIl9jFElvVCs+L6xLVoiHR9aX8CNc2GQVJCPRnO?=
 =?us-ascii?Q?8a5nVnk/6752WcTrfsc+0svksEVOQviFy2ggjN+WCprqKubJHBzzTPVBZ35R?=
 =?us-ascii?Q?uSzGf6QZLQmCekGtB+FXCcsrz2PKuUqkOE9Se777FeJaKMUWnxyVZABICisR?=
 =?us-ascii?Q?TXCiRe59VoG86YRhPhAihspULXdYtVXA+WvWxP8AtCT1YBiZmb+iS5WEWytw?=
 =?us-ascii?Q?iuKCJUMXtlhQ6m0xj0k0hZJkPIftJrmolPm+J7f6zQmNK/Hm+nLwtWChj49I?=
 =?us-ascii?Q?nmDPpIEmwRla4Pyq0ifVd3999J7QMkO1IY8FmOCOM6sCjNnAM2oKEC/UtxIp?=
 =?us-ascii?Q?XjtLuDqTLjeOVcjQeBTwZwHosLdMGvjmWg3rPdfxovps10x9isiqdqnIqfCQ?=
 =?us-ascii?Q?O1xtKeuEfy2Z90brcX/31GR/V+grJQdE1x1XjIgDdzl03V+uxsaqKjbTvWYx?=
 =?us-ascii?Q?MJPtR4DM1l7wwsEVNHbUuNW2ObAgDjh5zBp6QXlvOOwgTBBcklMcxoouC/GY?=
 =?us-ascii?Q?F8nu8FKalI7aYJms/HSxVLl+d8MRU+Q8qACMHEggl7DvtBJs6fX+m6DULnfr?=
 =?us-ascii?Q?ogu9gtci6BDD4KPSUEiNAtdbPB1bOudUmPPODTfUTaEjCIrhgSMnRkxtVaJI?=
 =?us-ascii?Q?Q9ClpVd/GdbtaheBLbPPQmOR1swanp0esmZlVhxR+USNKdJqg//shqmKzM60?=
 =?us-ascii?Q?wwvKA7FmfJz0lq8nSYUEIl9DrmupRhb1nyq62G1L1iPIUipvvErKLL9Jj1rp?=
 =?us-ascii?Q?guTN3dG43mgvAzW/OgNrcLmOxwExRtVHd0gDXiTOF7SLI0rPe46QBRHCAeeo?=
 =?us-ascii?Q?NuP4P9aEkezbsjz7MfcWeCTcwkFT6qdzoJy+cAGnmRvKXU1opITlWaBbrbYd?=
 =?us-ascii?Q?H5JblxC9dfk8Vvin4SZUEonzNo7/v0p9h+bFka3C5ubbUPPfgVIN1tIdt0Wb?=
 =?us-ascii?Q?m6RizSkvH5UmURKzVONRBpDdGQjOaVroMQ/N5eokGTRpjfdDJVn089+wVtVR?=
 =?us-ascii?Q?KSPSMOj9bk9RP3CxHd7Z31j4zyhZBOi4edcqNH7RIiXVayjM7zKLdySdA6Nj?=
 =?us-ascii?Q?rep9K0FsNvN70CT3fWqNeM++TAkgkqdcS+YzTHlht+3Zd0Ti8dInq2UL0010?=
 =?us-ascii?Q?poVv0Aatk/r8fyr7M6i9iBtvbgr0lTtggvjTorWqKTNrSbsqpsPmzB2XoRX6?=
 =?us-ascii?Q?9l6m+mVGHpjYwtcj1yI1EKsD?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(82310400017)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2024 14:23:29.8668 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61704e10-a7bd-4a3d-5dce-08dc7e5894e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002316.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4228
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

If the lid on a laptop is closed when eDP connectors are populated
then it remains enabled when the initial framebuffer configuration
is built.

When creating the initial framebuffer configuration detect the ACPI
lid status and if it's closed disable any eDP connectors.

Suggested-by: Alex Deucher <alexander.deucher@amd.com>
Reported-by: Chris Bainbridge <chris.bainbridge@gmail.com>
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3349
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/drm_client_modeset.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 31af5cf37a09..b76438c31761 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -8,6 +8,7 @@
  */
 
 #include "drm/drm_modeset_lock.h"
+#include <acpi/button.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
@@ -257,6 +258,27 @@ static void drm_client_connectors_enabled(struct drm_connector **connectors,
 		enabled[i] = drm_connector_enabled(connectors[i], false);
 }
 
+static void drm_client_match_edp_lid(struct drm_device *dev,
+				     struct drm_connector **connectors,
+				     unsigned int connector_count,
+				     bool *enabled)
+{
+	int i;
+
+	for (i = 0; i < connector_count; i++) {
+		struct drm_connector *connector = connectors[i];
+
+		if (connector->connector_type != DRM_MODE_CONNECTOR_eDP || !enabled[i])
+			continue;
+
+		if (!acpi_lid_open()) {
+			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] lid is closed, disabling\n",
+				    connector->base.id, connector->name);
+			enabled[i] = false;
+		}
+	}
+}
+
 static bool drm_client_target_cloned(struct drm_device *dev,
 				     struct drm_connector **connectors,
 				     unsigned int connector_count,
@@ -844,6 +866,7 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 		memset(crtcs, 0, connector_count * sizeof(*crtcs));
 		memset(offsets, 0, connector_count * sizeof(*offsets));
 
+		drm_client_match_edp_lid(dev, connectors, connector_count, enabled);
 		if (!drm_client_target_cloned(dev, connectors, connector_count, modes,
 					      offsets, enabled, width, height) &&
 		    !drm_client_target_preferred(dev, connectors, connector_count, modes,
-- 
2.43.0

