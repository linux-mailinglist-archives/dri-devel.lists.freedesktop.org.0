Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF908FF53C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 21:24:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F9A10EA79;
	Thu,  6 Jun 2024 19:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ldhNpYYt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73EC110EA77;
 Thu,  6 Jun 2024 19:24:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHUKssrAH5EOx7iYu5xlgORLO3O74w6O/P6gTSR0WVmhsIMtAMezZwrB+9X9KH/knfI0AIfJ7SYYnQNT4pb2fwG6i23vt7OLg4OwEEqbUKtuxqSqmsL7kDD1461a1c/PPl8xXs4DCAvUOJITRY3QW04iY78gXCXHsXkDZnYyOPbOEhX2oIJP1T5MgK1TS8eAQ8M9GQXHxAEmIuTKbqoW1f7RD2I0cnbecfwH0OTLB5vANLeff1NM0z2qvsYCnIx3KUCrGQXYIaOnv/pojicJIEuPmZ48eiXzfSpUBna7yztlp6AvO8wRp43juod0RrHjPJC2YV+JzYq808QfR2rbkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFEgHMQ822O0XEwICakiV/5gNjSxIE8wUZrow5U0fd8=;
 b=dW5JnfKzDNbJOSxfnDFgKmh4rNM47fxWS9R0Ok2oK/NUUOdsaPbJ9sYzI2WAECjo/cqONeRv7vXpzv38OTQhbQ5hh97iK3FqRs4zM/n60WD3XageD/k/eK+qfdMXg929rX5rdumVCcR4cukWXl+qnov94DGhwyjkhJmTQG/2benH2FHp+GK9F0zH8jB/IW6LOEW98U3D3i3zPnAsOy4zrVUa8DLBVzxd2hrGzVqHfUcss2LvInyazCkmJScjASyOBN1WvwPu2fKHLBex1Wdi53c2bR8PXThluQQKlb+SSSZlfmHEDwX2R6BesbRd1+Dkawdz2R1ufpwGmc7mxE58UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PFEgHMQ822O0XEwICakiV/5gNjSxIE8wUZrow5U0fd8=;
 b=ldhNpYYtsFferQL0TzSyUGgTklpsiMdgM9Cilmq+Z7rY+qrG1l2Ao7zmUnigZ5eQckB8DLjI0fS866dxwUEaOdDpLYQLF4m59jJT2Xs8g0W5egjyrQOowMvWDR+dqAReJacq8hnvlS09BYO4AslGlLFnT+Ew1amv5YXvyW5Bdb8=
Received: from BL0PR01CA0008.prod.exchangelabs.com (2603:10b6:208:71::21) by
 PH7PR12MB7308.namprd12.prod.outlook.com (2603:10b6:510:20c::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.27; Thu, 6 Jun 2024 19:24:09 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:208:71:cafe::98) by BL0PR01CA0008.outlook.office365.com
 (2603:10b6:208:71::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.18 via Frontend
 Transport; Thu, 6 Jun 2024 19:24:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Thu, 6 Jun 2024 19:24:08 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 6 Jun
 2024 14:24:07 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.10
Date: Thu, 6 Jun 2024 15:23:48 -0400
Message-ID: <20240606192348.3620805-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|PH7PR12MB7308:EE_
X-MS-Office365-Filtering-Correlation-Id: 830743c3-59ad-41ca-d147-08dc865e3d06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|36860700004|376005|1800799015|82310400017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hc/s8LMDJD8IEL6LjhZByuW6raJhYQS7+fnc7bk+3p+QJzRTmlkktXPSnl77?=
 =?us-ascii?Q?XP3IvZpbanseRL9wyjmumV0oMcwrEiuFV+bMovJaEChz2H5PyHuNIKaRpaXj?=
 =?us-ascii?Q?OYP4fEia9ciKF6eT1rssQ+zWXMLUyQuPf3pnUbEohKpudNpk99sQLBrDNEyj?=
 =?us-ascii?Q?/ZCH6LaZOTa+iRDZanzHHSdyHxb8NZzhACl90ay9i41ZgW0KIoXncrC6jWKR?=
 =?us-ascii?Q?pilPaVu/G01zk0qVOyD/A5LywIsKIxRKlEqWFeBHKLQYdn7Sqb+yXoYzZYrg?=
 =?us-ascii?Q?h1kCwtbuxjkMsxh/anQQm1B9MGEt9l5vM/PwBiQbw4CL1Bjur+/h2e2qxh8s?=
 =?us-ascii?Q?oEJa81/BavaQhfhGYkV+ujB90jEci1Ls0mLadEaqPrSH1/5EFh1W2+l9+hMa?=
 =?us-ascii?Q?IXUB+yvQ8xYql3Q0nF4kQ1UoDvwrHOmBZnIC0gh4S9gzxDPBLBnhhUy3r7aI?=
 =?us-ascii?Q?wQwiLzh53p1T3evgO2s7iDMnQBuMNf7EGVEDhsm3q7dbR/HbDR9PbUDIe2We?=
 =?us-ascii?Q?YAh2C8VsxA9XPIxurQBAH84lwFYC0nEvXgIxWuxxE7d3cd/OVoB8IGHoFIXa?=
 =?us-ascii?Q?7BVEP7Lbz6jzxr8k/3gsjN3+6x6oCn7bWojSx/+h2AHO4rvhL23sIOY+rVrz?=
 =?us-ascii?Q?WdCZFxLswO90pW/6K+zqod9AxrySEVnUMO2V3W8Gxumst7iIeh9zUXmhs8An?=
 =?us-ascii?Q?37m0G0jrRsP2BhmUwwAErFa+2vcTDbFhufq3fb+uOmVEZxX03GJSLPJk5gXI?=
 =?us-ascii?Q?QJDEsqxAyc2xbOjAW4LhpDuMETrz7TFnFjUNH06mnauOYmUjOp2FUuoRznG2?=
 =?us-ascii?Q?ThKG9zPgcF4GkIEN+FGp0CMNtkUZQW6ke/uitmsy6Ne+1m+VDi7+b0dVTE3P?=
 =?us-ascii?Q?itF0bWRVaqpzDnZsW92MojD1cOCqSofJOin79GF1xJmcIK5Y0PH32MNWZJea?=
 =?us-ascii?Q?zOfE8mLbzAOdxel3zjjNKrVTCSm2RhzBXfgy7hC9CGJVVBgVyvyPkrcKNCD5?=
 =?us-ascii?Q?YZ/DtNxpCB5LCWoAkM23xeH6rc2hvAMXBh0Em0CpPD3KuWzJFrMU61CbSqQn?=
 =?us-ascii?Q?4Qw1F4RKehbXIVgdQ5A24Xb1TgohQIc8PkVF3fNTwFStAprmFFLK6IoCDufs?=
 =?us-ascii?Q?+CBs6i4MiVKv0N53wLBcRcJYdZhEiN7y8N4ZqQOuqj/DgUybIcxjYvMHCNYy?=
 =?us-ascii?Q?nHmd0Wjbv22Zr8nekKbUnOEU/x2Na1ZTwdGXycUl7X3uMUyWvAgoDVHCIZA5?=
 =?us-ascii?Q?cKnFAWYihzIB02UBm14UsLmxu7H/6NEH3c4+9EAOvlTv+yyDVAL7KliGoheP?=
 =?us-ascii?Q?wecKC104dODex4kd3biIBmbjFkyKciu/JoQJcrrqMARKcDTbPI/zf58gtGiW?=
 =?us-ascii?Q?3iVQW+8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(1800799015)(82310400017); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 19:24:08.8047 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 830743c3-59ad-41ca-d147-08dc865e3d06
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7308
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

Hi Dave, Sima,

A couple of fixes for 6.10.

The following changes since commit c3f38fa61af77b49866b006939479069cd451173:

  Linux 6.10-rc2 (2024-06-02 15:44:56 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.10-2024-06-06

for you to fetch changes up to c6c4dd54012551cce5cde408b35468f2c62b0cce:

  drm/amdgpu/pptable: Fix UBSAN array-index-out-of-bounds (2024-06-05 13:43:34 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.10-2024-06-06:

amdgpu:
- Fix shutdown issues on some SMU 13.x platforms
- Silence some UBSAN flexible array warnings

----------------------------------------------------------------
Mario Limonciello (1):
      drm/amd: Fix shutdown (again) on some SMU v13.0.4/11 platforms

Tasos Sahanidis (1):
      drm/amdgpu/pptable: Fix UBSAN array-index-out-of-bounds

 drivers/gpu/drm/amd/include/pptable.h              | 91 ++++++++++++----------
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   | 20 ++---
 2 files changed, 60 insertions(+), 51 deletions(-)
