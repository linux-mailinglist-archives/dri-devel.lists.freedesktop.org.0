Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D35B3A85F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 19:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4117A10EA62;
	Thu, 28 Aug 2025 17:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ajf8dr1T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2087.outbound.protection.outlook.com [40.107.236.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F5A10EA62;
 Thu, 28 Aug 2025 17:39:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vsT8RcZPJ/ZTQcQ9XXGuQz0r7X2NUNop474wNK8MdsqUpaVYold9cuOssBBDRdLIjDRtZ5wGcosG1B0SIIXLE2UZey6dPDUUf3bqt/gUnKS88Sek6zzuqO98v3LnYbkXsCasncA98v4/MW+8tCtFhLxQESkWdaW1sQCxUspD8pr9i/7J63s68i6e+AmVYP7cpjlFj4X9xQxizVhvk8PlkTHvjxCTcOzLFxgVkXBuyNo8XkBmDsiGf9Z7EnM3rCYczgDI++uBScyZqX+KHn7+7NLiLILbfunKwtB/wrn+zbUuVDdL1x4Mwm/yKQognTnKcVDpgzr3GGT0tp1s8MForA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OaUmTw6m9P4iw3GFfChY1n2+KzNocD281zBtM0phM3c=;
 b=luZE4n7f6E1KcaKyqykYR5ZYvLi53XNrGwGgTj2PINBXGWhIxKy+0T62g/D4HY1yRErfuFNzHIauMFbi/59XZjCdf7CJSlcVK7pU5n3nzNg8F26SkAXvbTpT/rUfa+tHrBmzUY36k5fAe5K52PZUA0reK98f+yIsKw20X23SbddM6kZr/4kh0JmKIkVqSH8i5s/4f1dQwM+C3mrOxvt8xOW8kO4TKWRqZr2e/qEUsk5XsOO9zLOQ+1eNlSB6OvaSBzRA67gi/JKvC5eVbG/ueuiEAT5LzVNh7iFbWodezAm7myGOv/Q3jIGQzkOTrr4FFLHRCOcGvzTOLJYntS8caQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OaUmTw6m9P4iw3GFfChY1n2+KzNocD281zBtM0phM3c=;
 b=ajf8dr1TLxdQ0JBcw1MHsmqYGFBDoGfz7kzAVw3z7IXwv25vZ99pddyI5/mfoYsD4Vgs2nH+NgfqVMCVtODDEghEbKR8Kb4zUVyZppWQOoNKyX5iW3qoVGBrNRdOLSEXx8GbcgOt/xFcD75+dXTSzdYJlOEcf8UBJLWwbtVY9n4=
Received: from DS7P220CA0071.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:224::18) by
 SJ0PR12MB6807.namprd12.prod.outlook.com (2603:10b6:a03:479::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Thu, 28 Aug
 2025 17:39:33 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:8:224:cafe::eb) by DS7P220CA0071.outlook.office365.com
 (2603:10b6:8:224::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.18 via Frontend Transport; Thu,
 28 Aug 2025 17:39:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Thu, 28 Aug 2025 17:39:32 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 12:39:31 -0500
Received: from tr4.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Thu, 28 Aug
 2025 10:39:31 -0700
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.17
Date: Thu, 28 Aug 2025 13:39:04 -0400
Message-ID: <20250828173904.75850-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|SJ0PR12MB6807:EE_
X-MS-Office365-Filtering-Correlation-Id: 057e5921-11eb-4ae0-b780-08dde659d8e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PVD2O+TyFioEagn0yD6s74LzIbi3CIR1c9vlWiVHcUd+jv5PzJUnYdb/WNlI?=
 =?us-ascii?Q?+15aFIIhlyfOxhwv6l+jQOGvIeq7TWzC09bNCNb9rmZ8rmzmBrsh1vqPrrm9?=
 =?us-ascii?Q?OJ1erKQmP1dkPR1PEpZdwstArfLVVSZ3Xu9QNpi0REl0EZLATbnzyFTpg8wM?=
 =?us-ascii?Q?yM0Cdy7UQ8EvoFJtlbdxnQm71sT8v826bv2CrV09e7YV/ppjdQh+eKYPjIhG?=
 =?us-ascii?Q?zFZhKN2fz5l50IrXaMCF1lRNAFGRwloV8vLSa410smqI8YRiYIZkhs/rbDdv?=
 =?us-ascii?Q?qUW6GXCGmwWTPOR1ImmVp7MWkWW6Hx90ic/XpDFkmy+cHXe32DBI1mWlkKmv?=
 =?us-ascii?Q?+lFB68p/fMrBF2YMjKdJk/byh+xe1q3VL35nHrCeZm9VU0U09UeE782CI/wC?=
 =?us-ascii?Q?DiV3n0hTMO32uMMYC1ZjDmfFbPgAnuW7s2wLGb0Q6P1S11+16wWS1Cb9vhvT?=
 =?us-ascii?Q?c4HoVoe/RZRWp5w3JKRoraKfysTDV4cvfdXXvizaTA6V2PQ7Cer+6W10bfME?=
 =?us-ascii?Q?hfaB6x+V7ZpI48gv3p8K5HjurOF3vmuucd+r67EBmaC913Q8H0zlLGz8OLsV?=
 =?us-ascii?Q?H1Y6ncHadjGapGTju0e1spYJTYKfLNbNZwKQaAYYFpx01QT3FgAEoKqYMxlt?=
 =?us-ascii?Q?vZKPX8y6GSnXn0jCSGrDdp3yPscBbH7GAVbtZ7RipJjDl1ftsn1ffe7c98nJ?=
 =?us-ascii?Q?5PARV+naOrazz6KPbj+tRI+6+iUUxtGcLfqbPWDHGiZRbw1eHvOSbKXQS+2V?=
 =?us-ascii?Q?TGBYJtBuIQvrdRn8YawUJt20xwIPkwH+OAW1q/EPYBliGC0AZ3f/v+uCRCOf?=
 =?us-ascii?Q?tPgZImd72JNccQa92hUZJ3/pTlwpDlp5SM5b2W5EwHAOcTEUCweefWrEkLs8?=
 =?us-ascii?Q?zuftwF2zOuONuLA7kYuUDHoJS5c1GOWP6PTw1of2SxRm+WkYC5/3Ou/MUagS?=
 =?us-ascii?Q?iL11kskVk4pbdT9URhn+aiCLLIKJTzBDUvsv2dcwWY5q2v5p/TkHGlLkznQG?=
 =?us-ascii?Q?9geSU2hl2vlBwCYSTiPpJay5rLroaaP/yu0o0+m0JGzO5I6NX5sXEo4qdJqR?=
 =?us-ascii?Q?JE/3pZliqawwosbL2+/makrYg7//dz8Kmw+0MBKi4yS5HIVc5SuoV3bsJh14?=
 =?us-ascii?Q?E+5EN9rKQsLzrlVpENbPsw6T5knOwPRWo4NuM/bxlpqqUQFFYYiyHtwcmwTr?=
 =?us-ascii?Q?kQ3ZEAOuH9Pafd7BKpbRFnwkbd/AVnk2v+4AVt0WK7Hun+DTLefIPWQvCyRb?=
 =?us-ascii?Q?bkYyTS3eUSc2FBjHK5tMy7GahQp7JPw7VVZpwrDIoe3DaYlr7Q+7jz1p9J4S?=
 =?us-ascii?Q?TTj2xts7EZo+T1hUlFVhXr5P8f4eG23gO7jDRGvlBafH9SKUJ/6ldmSRco7z?=
 =?us-ascii?Q?ILlRQfP6Th9wm7LTVpwCiNXfDjg3BEdxZgYafNOSleD+Az7Xh4E4Z19UidHu?=
 =?us-ascii?Q?ZtYFoh7Pi8yp5VP07lioScoPAK+/0yDErTE5fKmGWAtgiDvphBbABA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 17:39:32.1004 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 057e5921-11eb-4ae0-b780-08dde659d8e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6807
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

Hi Dave, Simona,

Fixes for 6.17.

The following changes since commit 1b237f190eb3d36f52dffe07a40b5eb210280e00:

  Linux 6.17-rc3 (2025-08-24 12:04:12 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.17-2025-08-28

for you to fetch changes up to c767d74a9cdd1042046d02319d16b85d9aa8a8aa:

  drm/amdgpu/userq: fix error handling of invalid doorbell (2025-08-27 14:01:52 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.17-2025-08-28:

amdgpu:
- UserQ fixes
- Revert CSA fix
- SR-IOV fix

----------------------------------------------------------------
Alex Deucher (4):
      drm/amdgpu/gfx11: set MQD as appriopriate for queue types
      drm/amdgpu/gfx12: set MQD as appriopriate for queue types
      Revert "drm/amdgpu: fix incorrect vm flags to map bo"
      drm/amdgpu/userq: fix error handling of invalid doorbell

Jesse.Zhang (1):
      drm/amdgpu: update firmware version checks for user queue support

Yang Wang (1):
      drm/amd/amdgpu: disable hwmon power1_cap* for gfx 11.0.3 on vf mode

 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c   |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c |  1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c    | 14 +++++++++-----
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c    |  8 ++++++--
 drivers/gpu/drm/amd/pm/amdgpu_pm.c        | 18 ++++++++++--------
 5 files changed, 28 insertions(+), 17 deletions(-)
