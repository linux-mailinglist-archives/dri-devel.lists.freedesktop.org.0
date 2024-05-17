Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9E78C8772
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 15:50:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F8A10EECE;
	Fri, 17 May 2024 13:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oamxXjU4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B957710EECE;
 Fri, 17 May 2024 13:50:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CH4ovjAhyO+11mf72L7K3lT8FxxWXLqC/np+/fo53rrevyKbCfvPLgZ239LuQA170AKnI8+WLkJVC3jF5wg6KTKLODeA6pGsyysBL0NAb5CqJV4+OhcMflmVwU1gjmwZbx57Ey06B4ALyoe0RS0bcJbTpqzRoKsAkrMo+cUcDMKXiGQCoVpMiU6Xo+Vt5zaGMufm2/kBIeDbvmgebUhm3WvqYHE4EXPUnuRdE5npH+jP7cS+o/OWgr1XjNHZtScA5I/W1qoS1n4xQ5DtFw6e1o+pIYqJm6hZgqat8/NCRRIo9+uSQNFTgOPKNrFmfG+XVfC9XKMZbOpZ8w4pLVazxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M74TZ6NIxOnrfga/nhg6LHYpD17xuAF829s31DBlvC8=;
 b=h89Ke9oRRO3yTwPeS3rhq7nMOFHb/Fcl0+fssP8KlxiIbkpqFiX9IbSylUPIxaliNjTLoCXNsKatRUl8nKn00yHmuX8qior4xxBRhRPeRy7Q1krbFOmydJUccpnax6NcvyufaJQOBx0+6ZcRAvrvvTqyrFUyjOOUUaT4iOQF1JiGMdVIfgRFa7byOf2N/PbZyd/zMkwgz9NJ3dgJDKSb7K5KBY7YKiYhVpX6rEyIbI2XC3L8T8zITcIv8LAX6UwiiDXVOu7OPodblwGdAeOB8kDbTZ/kTClFMm46zg7T5runlISLLUdFVu9QXzxAK3ykz8HLjSNrg6NZFEe3jhlIyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M74TZ6NIxOnrfga/nhg6LHYpD17xuAF829s31DBlvC8=;
 b=oamxXjU46jEq5tfH9sptVDKhlD7eDIrOC+HPDzxa4CWXQQ16QfxXfx9R4p5lcoLptZrImX+9/5HjE/tCtz/iiKhJK5ObKoJd67OsmHhVBGahJflA/rLfmqMYWJr5GXHhG1jKYHaFObR7m3Tm3Likk6brf/Zp9Dm11GOnDb5Bq18=
Received: from PH0PR07CA0093.namprd07.prod.outlook.com (2603:10b6:510:4::8) by
 CH3PR12MB9283.namprd12.prod.outlook.com (2603:10b6:610:1cd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Fri, 17 May
 2024 13:50:32 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:510:4:cafe::29) by PH0PR07CA0093.outlook.office365.com
 (2603:10b6:510:4::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27 via Frontend
 Transport; Fri, 17 May 2024 13:50:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.204) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Fri, 17 May 2024 13:50:31 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 17 May 2024 08:50:28 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <matthew.auld@intel.com>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <airlied@gmail.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v2] drm/buddy: Fix the warn on's during force merge
Date: Fri, 17 May 2024 19:20:15 +0530
Message-ID: <20240517135015.17565-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|CH3PR12MB9283:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c742313-7ee0-4a7f-2d6e-08dc76785191
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|1800799015|36860700004|376005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JlLr4lZL/dw9rHED/PAc+TRl/k7IZvj8v6ZGWRYqT8t8oii04lGN/e/oc6JZ?=
 =?us-ascii?Q?hAjE+NhqVt+MdPKsDwBQ4Cx/03zCIf9J9JTdCAee1kjD80F+OMb0AarMyPy6?=
 =?us-ascii?Q?VZrsZeur4qyeuY9vlWymM64AORVvVpZmjjYH1rg5jlgmfASzUmgK6vtweWVl?=
 =?us-ascii?Q?50i5GqlwUplSKmQx0pgQVHgYsmxRKxeggwIeakRQ6GDUp5W4KIJm2GTijynS?=
 =?us-ascii?Q?hoi2zufJsiVFJyDb8ekhjadUhp/Y/KvoXORBA4goytJKb6BAlZv8x6XDOy5B?=
 =?us-ascii?Q?qgH6qnpjg3lzXiiz4P3wduZ/D7SAwnz40CWUrG5WzW2ZBJ/sCZYmNyfBHVfC?=
 =?us-ascii?Q?3lCn+hpYS8jgPcqm/UjIejfjVhDC4NXAClZdVktzfE8H9/+y14y+KJo1RqZp?=
 =?us-ascii?Q?JYBbjajgSlUmC3HxaVYJI087SxaBhKq++/zf5QWiSkU5LllGhit8S3AbwsgQ?=
 =?us-ascii?Q?UZ44tQr5O9103KPWyp5BqLHxDbVVnDh6wxtXTjqHQZXmGqdIClBTgHy1xL/+?=
 =?us-ascii?Q?1vL0DdN+RN0hzPILhloCMclERcKZ5Wz4I/JNGGt/jsdlH9XJwzHHpPPPb+ol?=
 =?us-ascii?Q?JX3haqZ7UfawpPqPeU4qXrQs1mTzpg5oS6+2yIZ8lHtba0ZeBQS6QbPn3PYf?=
 =?us-ascii?Q?wyebwyHzvj+nPVoiNBV6BNZ5UDBrLZZVNcW7N8gLpEEF4AAn6IM3WVsYcMV4?=
 =?us-ascii?Q?gTlo1T6Fbnt7XWyywXiFwJM2KYNPCtZuTSQnssdbqYkPJ3fqiJUtFUmq7QPw?=
 =?us-ascii?Q?06adqQzCLsCBEKQly4nZ52jObP4QLH/c/6yCvSWcmb6Yd+oSoKEmtVkcqxrp?=
 =?us-ascii?Q?kZTPF0QFPTYDOeAJpqfZ82drA8AItUjVVROWFEKhbKaIy2evdf5WkRc2Su/0?=
 =?us-ascii?Q?rSFKudBSi/IWe5VuikyBAHP0L6+E+6qRKH/oPoFg7yvvUkcasAbygH0gH9Kx?=
 =?us-ascii?Q?L3RGF6mvayZHYkBkckq13Hw1SAIfRTKNPBGW6WJG4zJttPhdN67otoUhlsDX?=
 =?us-ascii?Q?ycL858OLjdL/xpTjdCEEMgEVGx0/WBLmle4wtgQRpJbSX69o3K9URNUNdT5J?=
 =?us-ascii?Q?geWv5b/0OmI6HB1sjJjLjifNyWEg3tuWsSsXlTfEMMuyGama54lo+kEtEtk/?=
 =?us-ascii?Q?L0qr66kWmCtmVce0m//IqQbZrn+PR3nQyTSWCbrvU0tNsALeLIhs5a0U+Iu5?=
 =?us-ascii?Q?0tXvJRjzyDg/UcCm8CH90iatmquXQn+TIv6R6/fxWOk+8tFSuyZKZMpIB5Wo?=
 =?us-ascii?Q?iH5KiJS+o7ASYgv7H3sHdHOJ5qnCgo1/LnnHmYfzq91dgty5UhtXbZ4M514Q?=
 =?us-ascii?Q?T4Jj9tsQioCFY29cvnxxeQoPWtdbW0r9TrQXV2rUUhOZj2lZn6/hUXZRLa9j?=
 =?us-ascii?Q?rYlpxf0g/6YK+RMcOccDWobKIo89?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400017)(1800799015)(36860700004)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 13:50:31.2795 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c742313-7ee0-4a7f-2d6e-08dc76785191
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9283
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

Move the fallback and block incompatible checks
above, so that we dont unnecessarily split the blocks
and leaving the unmerged. This resolves the unnecessary
warn on's thrown during force_merge call.

v2:(Matthew)
  - Move the fallback and block incompatible checks above
    the contains check.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Fixes: 96950929eb23 ("drm/buddy: Implement tracking clear page feature")
---
 drivers/gpu/drm/drm_buddy.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 1daf778cf6fa..94f8c34fc293 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -524,11 +524,11 @@ __alloc_range_bias(struct drm_buddy *mm,
 				continue;
 		}
 
+		if (!fallback && block_incompatible(block, flags))
+			continue;
+
 		if (contains(start, end, block_start, block_end) &&
 		    order == drm_buddy_block_order(block)) {
-			if (!fallback && block_incompatible(block, flags))
-				continue;
-
 			/*
 			 * Find the free block within the range.
 			 */
-- 
2.25.1

