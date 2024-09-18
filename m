Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E790497C176
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 23:39:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB0410E649;
	Wed, 18 Sep 2024 21:39:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eDzZu72x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2050.outbound.protection.outlook.com [40.107.92.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB8910E649;
 Wed, 18 Sep 2024 21:39:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K0rwDRcRfg2EQ0esqNKRBdQJ3tT0Xhzcn1NiCgdSYTjOCD0pkGRI4RE1lk9emfNbi4UeeSqQ9bJ20MMypyZlCTFM39hWisxToUDMTfIvGB0MnK74X69b94y+/wRxF/A6wx+ifIAM7scdfsrYpHtJfI7LFTNBOof4y8IlhzaJAEewmeLPANjYh9SYT60iSav4QLcgymPlpIP9kSW3Bnx74SzteWLJv07C3S5663vXPVwC/HoGA9X0XCsvWHpYxYfWI9I3aggCsHkN+3tte89GG3j59Q2OEWAUwdVOD3BDqiMWfoTIe+ypAipSdfjGGY3/bdlzvUh+uRf0K8id9yi2HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sUpa+M31uEDMLyE1wKLei4Z8fa0Z/4zm+HHxB6Q8Buc=;
 b=D70WySC342kW6jw4q3t/AveIa1vc7zthvetCVAmkuZIMmVY08I3A88hmI38KiE9wU2hOTx9aiISxbPC8RWj2RYY1ErRFcr3XkydANIsrso2UPXh5p2U+pSbTprdOToEqljdPfm6nANpTZCiVupZfaaNM8sbr5TVV2SBpPQMazJdk0LXYmPDWAvdINorERCSMbOhjk/L9rVUGHOi6wTXFN70JdwajCCAFz4Cs+JoIpxGzGvJ62lL/LqZg+nCkpZW1b8SFXpOUdEbhv0r/Sz43xCg8k12ZUcXRY+l93i9wIxquUBrWssaevIq60OvJB3emYOcdzmvWHFVM9I4x9zvgtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=igalia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sUpa+M31uEDMLyE1wKLei4Z8fa0Z/4zm+HHxB6Q8Buc=;
 b=eDzZu72xwdhW9b33DAZ1Hy7wFY72gRphoGdLvMki9P0gv6YIQwocFcDuwuq/djzHNfnpmL3Y+264VjETncLzYIJ8V2dFVMfIleZUqgrklsF+wL5aXLkKFyzXc4VhDwDD7PeiWbVzZKCmuHPDgiXumhyO8L9Xdaozk0kG8daHtKk=
Received: from SN6PR01CA0030.prod.exchangelabs.com (2603:10b6:805:b6::43) by
 LV8PR12MB9418.namprd12.prod.outlook.com (2603:10b6:408:202::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 21:39:16 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:805:b6:cafe::eb) by SN6PR01CA0030.outlook.office365.com
 (2603:10b6:805:b6::43) with Microsoft SMTP Server (version=TLS1_2,
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
 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024 21:39:16 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Sep
 2024 16:39:15 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Hung <alex.hung@amd.com>, Alexander Deucher
 <alexander.deucher@amd.com>, Melissa Wen <mwen@igalia.com>
CC: <kernel-dev@igalia.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <sunpeng.li@amd.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, "Mario
 Limonciello" <mario.limonciello@amd.com>
Subject: [PATCH v7 06/10] drm/amd/display: parse display name from drm_eld
Date: Wed, 18 Sep 2024 16:38:41 -0500
Message-ID: <20240918213845.158293-7-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|LV8PR12MB9418:EE_
X-MS-Office365-Filtering-Correlation-Id: 29a507e0-0cda-421c-0b7b-08dcd82a587e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gBLGOmW9cyi9qub94r1LCktPzum2Ej/MCo6ISI1v8We8mwrryNNqQoa6V6vd?=
 =?us-ascii?Q?26N1o3cDM1HLLoeT1+Bkbvy47u+5dYZIMp5nsvZk9nk6DuDXZF5q37t+aBP9?=
 =?us-ascii?Q?BcuSj9/Vbd1eHfX3YSdfMtJ8EFZIb+P2/Hc5kunwBZmCUkb2LHUXIjLx94uZ?=
 =?us-ascii?Q?XQhL/RlMMGX8aDwdg4Nf5beceWiqLlkmhRg3UXK3wqUlPpbk5rldTOKKkIxn?=
 =?us-ascii?Q?jt3PGLmBhjNbrInA3R9V9pbGOzK+UV5kT8AGrqIIVQy5Q1b/od5k1IhI2SQN?=
 =?us-ascii?Q?oEG1OFQYP0wiSYm3TK3sIhROsiBmvgnR6TZVzONUw6KuR76SeNqyeN7zKgqH?=
 =?us-ascii?Q?B9pUd/N41IN1ZzidCOdbMps67m2hf72AVxn6zdScQUqL4862ayltnXy5BXQj?=
 =?us-ascii?Q?kM2AC5Fr32dQqhh8SvtgIzh+b0ex1zevmhya7o3Bxd7HvLxUl69NhJIjlW+d?=
 =?us-ascii?Q?aBku2abnRj4Hv7G7/J8cT7+PV1w6SmhwfhK2r8QbyOF9Gh/3OAGm7sFE8ITZ?=
 =?us-ascii?Q?xtn18VzSP0ijaM/zs1hNjvy+p/Slzg7wNceDgPODBYvJVb8k9zU13xLv4zDx?=
 =?us-ascii?Q?3D3dBthBi5wn9ASqN8CkRbE78hU/8mo8SlXJL8Jd9fY51ttTJB3CJlbjjNOm?=
 =?us-ascii?Q?b56paM5UyZhBd0IMGzcgcQUqu+qO9OaByfEw4SrRjiPKU1ikSOXBTe00tWY1?=
 =?us-ascii?Q?ShVPP7qqwHHlDEgJ4GHFIfxizegwBz15upCxKMyos7xMsDpjTT/S7YeYyjXx?=
 =?us-ascii?Q?HqcHCOUQgkGjj4wE/O5mjIcrx85BCQj3Sgnh1ORAWAh5QfcDWpO03w5rhDII?=
 =?us-ascii?Q?FsyAXk6D/Xf3hUKLnVwnxtNvMEUtcXqCqZkN6yWIgO0O8mzs20v2xd9ldDbL?=
 =?us-ascii?Q?Wiac3AXSo02QQ67cH3bnCMK4axp47sxxlF6vL5uO3aTZZEteInq3mzMsKw9+?=
 =?us-ascii?Q?PHvpWZz1Wn/6CblOiUHecja+y0Kjph52sehuBb3tnHoissx1BfCEHT2jeuMR?=
 =?us-ascii?Q?AtED5zQEDdDORLe9P3TF/BYZjpMe6j1ae1ewHXrBmKG8r2c1AFgSQkOM4ka/?=
 =?us-ascii?Q?OwGQw+wU8OleuobqDBAsaRpnGH7LyRv3+gdJmbgnwQ+vbbIwbHc02wFXhBKW?=
 =?us-ascii?Q?Ov8aKZN0B/nJod9NJ6+XNIJRLDDgmj5zEjodmlNQKoCQb9XjELqffw8WX3MI?=
 =?us-ascii?Q?SY/fF4AXjXlUUWfn4oNk3Fvc/HWPL7UnJgcPBk6fNB0//ten4QMMKaZUD9jV?=
 =?us-ascii?Q?aYobFgMOP2+HK0Am/ToxGnZjPAiS5det33sf11M2UOdb9PbNHyBkb/VCZPik?=
 =?us-ascii?Q?jpyaGKhFPSKFnGqMOws6OgWaKygUa3PGfcnwiJ0s/kpj5AfDAPEuFmpoQucD?=
 =?us-ascii?Q?8bdydEcAyrgLCFHm4KI+PyfaL1QFw6gNX+57e1LwgRgAL3fuVT3m+S4SVQtX?=
 =?us-ascii?Q?oWUrxr6N3Nb87ggF7nhe+Qwzmf3s4310?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 21:39:16.3711 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29a507e0-0cda-421c-0b7b-08dcd82a587e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9418
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

We don't need to parse dc_edid to get the display name since it's
already set in drm_eld which in turn had it values updated when updating
connector with the opaque drm_edid.

Signed-off-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index cf11ac4c1672..854e51c0b3fb 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -32,7 +32,7 @@
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_fixed.h>
-
+#include <drm/drm_eld.h>
 #include "dm_services.h"
 #include "amdgpu.h"
 #include "dc.h"
@@ -78,6 +78,7 @@ static void apply_edid_quirks(struct drm_edid_product_id *product_id,
 	}
 }
 
+#define AMDGPU_ELD_DISPLAY_NAME_SIZE_IN_CHARS 13
 /**
  * dm_helpers_parse_edid_caps() - Parse edid caps
  *
@@ -119,9 +120,10 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 	edid_caps->manufacture_week = product_id.week_of_manufacture;
 	edid_caps->manufacture_year = product_id.year_of_manufacture;
 
-	drm_edid_get_monitor_name(edid_buf,
-				  edid_caps->display_name,
-				  AUDIO_INFO_DISPLAY_NAME_SIZE_IN_CHARS);
+	memset(edid_caps->display_name, 0, AUDIO_INFO_DISPLAY_NAME_SIZE_IN_CHARS);
+	memcpy(edid_caps->display_name,
+	       &connector->eld[DRM_ELD_MONITOR_NAME_STRING],
+	       AMDGPU_ELD_DISPLAY_NAME_SIZE_IN_CHARS);
 
 	edid_caps->edid_hdmi = connector->display_info.is_hdmi;
 
-- 
2.34.1

