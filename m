Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B18C3D542
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 21:14:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0013510E14F;
	Thu,  6 Nov 2025 20:13:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KEs9GoV5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010029.outbound.protection.outlook.com [52.101.201.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5869310E14F;
 Thu,  6 Nov 2025 20:13:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iOYNqNg1eBmtFDle3Rzd3NkrYGoaXq8a39geQVukEGI7QFeMUMKSrll+56vw4eg3fVJ0syyrpkMD7yZpwZwa9IwXkZj/cdr7vVA9hZNlmHT/xy0pEOoO2Y01QJIthv2WA97AmnBwijXrR9xnMdzQ0vNmDel6fx1hSOh06/RpgqS2OSeLLji2AaoNfHoivdzIlPb/DN8tT2kmNVhrVXco4QQVd7qzZc8gPL/Zfxa1+rdMfXuaFoZnwmVLvwdDMtrgU45jTqqSCin35F2JPrdWVbEr8x7HqKGb3PpvqVs1RBxYjFM1KnLpBCVoB6NyOKlmHpxL8mn0fGPG50cJ0/+LiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFIjZxFzBHhgNqXrcPk79HRGllDGoLo79OSU8VZJODA=;
 b=VcMic+9uhs+yr3n/6R/3bk3tWweZKBrP5/OwMuWkYcTh4KnCcVjk0rQTEO9e5xpbDKEA/kCnla2IM8VrhkcHeIHARbpVmZuhZysoGgdIvOtwqlarx9vjQcDHrx792Wfa2fze+hBYWuvBOSPuqnkj1gy49/EcGGhV0PjxJl+f6FXszOL03gKb8rn2LGMvm0E4KUITxlib6L/Me9w6jOha5ASM2zsZaUucF1wcUuBj96VFYrT4qMVniSlU9JAnKi0kBJpDg1x0LxS2mGkrBOHEB31K6w3mzIAR7+TJRGFEji509rJW9lAvfy7+nIhQ4ZzWFe/SUnwThIw5NAhbNRJuXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFIjZxFzBHhgNqXrcPk79HRGllDGoLo79OSU8VZJODA=;
 b=KEs9GoV54GljxjnGBr3QdH3BbrG9iWrci8Wd2a2T8Bng1ohXqyj5EbdJMucmmtjBV08jFEBRTXUzStY5XnEmmXDDuPgGuxow1sFzyvX922upUikrmZL+3H7ve/NSiqGQVeBndeUQ1kViMhf/JFeeBs8ZLe0AEQAv3CBb7WmbHlI=
Received: from PH8PR21CA0021.namprd21.prod.outlook.com (2603:10b6:510:2ce::15)
 by SN7PR12MB8004.namprd12.prod.outlook.com (2603:10b6:806:341::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.9; Thu, 6 Nov
 2025 20:13:51 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:510:2ce:cafe::24) by PH8PR21CA0021.outlook.office365.com
 (2603:10b6:510:2ce::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.4 via Frontend Transport; Thu, 6
 Nov 2025 20:13:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Thu, 6 Nov 2025 20:13:51 +0000
Received: from tr4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 6 Nov
 2025 12:13:50 -0800
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.18
Date: Thu, 6 Nov 2025 15:13:26 -0500
Message-ID: <20251106201326.807230-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|SN7PR12MB8004:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c1b307e-8286-4bbc-0dcd-08de1d7100a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?si4e0c108Z89XeQO03yyb5Z/v6edel5ygO387ewEaYoc4l7apfD6/A8/sIKl?=
 =?us-ascii?Q?Ie/B0mPVSWTnjRebrAimPIUHV8QW9naQ1BuFAlA04s1k1XmcdQlJSAniCvNW?=
 =?us-ascii?Q?W0AHTvqyhIujW7RnGLXWknsUl9u10e58o45udew+12S8k5hg92fe3dZRZFHX?=
 =?us-ascii?Q?rLD/0+a3ZRBM42osx+wYjkcqmrnoCiUnxnp8rzW+c6JhKJhrzLOSbbjck1lF?=
 =?us-ascii?Q?AGZ14jjeigcs8RSwP3IQL4NU4YiBuhImzsL1WN3QhyGg4iR4apyB7/89ilRc?=
 =?us-ascii?Q?4K91Ot/5shNbVsaQMiV1w/CqpELMdtXJlxQ8c0MM79JcajkAp60FBkgKQGj2?=
 =?us-ascii?Q?8AiY2lwXe56D2wQgI2UY81zZaOSc+xl4GEtqfMslt8JayicK8v3B2JsR2UMK?=
 =?us-ascii?Q?VX7NBNkcjq9fwSzyeUXa5VYjk/IAmZ7AwdSmiqKXnBlCIdn8wQzZlluaTEZZ?=
 =?us-ascii?Q?lCn1zi6vQJuB1evggppP5Jpc6gUxgASbArG7mf6qVnpxczjTpHpcOaw4OeTV?=
 =?us-ascii?Q?hhcaHubYvPXnUT/Y+FhV0YoiGlFSSGLCrCaiSyi9nHB1pjLWmywG/KJ244ih?=
 =?us-ascii?Q?fQA6JQcOyCg9qHRBzcGIqy3dJNBq+XYE9ua+1qy6mO4BonDihhjEnj9w7j66?=
 =?us-ascii?Q?IRkHVWGdv1F5R1/rWwkXqAK6SUUL72/XM+RAzr8JgpoY+p86yc/K/sDDuYD8?=
 =?us-ascii?Q?JyvbRqK8I0Gr991DpDSR1jhzCzJ0JX51QVDVkSmWmoMgr7n+HOP10WXMX82r?=
 =?us-ascii?Q?MeZxCcSxQTafyQfenIKiJlqVPWWtNC4GRBojzHGmNSHuReddF1eheL8M5QMS?=
 =?us-ascii?Q?uXnET05vstHn6lYKqluDWxAqRDa84J66qVky07z3d0EWvY5auaxIyFEMV6rS?=
 =?us-ascii?Q?dEpocpRjOwM6kFC1LDRh78hqB9turqseDFnA0L+WBeDUqS/VzvSff4ajak7u?=
 =?us-ascii?Q?2yUMtEY73MFvkK9KuBnhQFBAFPrD7uG052rPAwdSeOV6vQuZ0A1xQNaqh9r9?=
 =?us-ascii?Q?9/iom33FD02mFOxSgouYzIuFD3nf2T5woGszoTkNHUC7O2U+K7eTVZunkJ5e?=
 =?us-ascii?Q?VTaE1rJofN3uC1MBADz4eIgtYphyGJ3NefNu/uZTa9EznQszn1WAePLr/qub?=
 =?us-ascii?Q?QmFeUR8jRKq7Iy2kTLPbe4jYShHyHTEZZn3SO30NJ2KO5LDG1vaQiHtV7UaC?=
 =?us-ascii?Q?GgV6XIfJEbs8gonK6dCQdjO599NW2CLutET6iq3L+3PF882XflJWO4lgp1pE?=
 =?us-ascii?Q?PnY8MXXqaARxYV63B0K2u7Uft4sBPZOan7sd5CBZz8+3SyKCQTDFxmGWPJq5?=
 =?us-ascii?Q?Ts7XVo9AgotezURJ99/VB7nqw/mnmXzfuuBZ0rtgpaVLV9bMLAguJQv4HnAC?=
 =?us-ascii?Q?V4TnepSB15Oq56By3hT6IsH9rRBAM/Vkk6xVmrEOa+UAG/EbFhK9RpOdikCC?=
 =?us-ascii?Q?z3BVuMHGc75U3AVJpIvv9aMw7vU7bNB5QU718UDojBZQ4lwbXL1FnA/1PZcg?=
 =?us-ascii?Q?vOpRUhAAay/ndvo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 20:13:51.1504 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c1b307e-8286-4bbc-0dcd-08de1d7100a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8004
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

Fixes for 6.18.

The following changes since commit 6146a0f1dfae5d37442a9ddcba012add260bceb0:

  Linux 6.18-rc4 (2025-11-02 11:28:02 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.18-2025-11-06

for you to fetch changes up to 3c6a743c6961cc2cab453b343bb157d6bbbf8120:

  drm/amd/display: Enable mst when it's detected but yet to be initialized (2025-11-06 11:58:55 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.18-2025-11-06:

amdgpu:
- Reset fixes
- Misc fixes
- Panel scaling fixes
- HDMI fix
- S0ix fixes
- Hibernation fix
- Secure display fix
- Suspend fix
- MST fix

amdkfd:
- Process cleanup fix

----------------------------------------------------------------
Alex Deucher (3):
      drm/amdgpu: set default gfx reset masks for gfx6-8
      drm/amdgpu: Drop PMFW RLC notifier from amdgpu_device_suspend()
      drm/amdgpu/smu: Handle S0ix for vangogh

Alex Hung (1):
      drm/amd/display: Fix black screen with HDMI outputs

Lijo Lazar (1):
      drm/amdgpu: Fix wait after reset sequence in S3

Mario Limonciello (1):
      drm/amd: Fix suspend failure with secure display TA

Mario Limonciello (AMD) (1):
      drm/amd/display: Don't stretch non-native images by default in eDP

Philip Yang (1):
      drm/amdkfd: Don't clear PT after process killed

Rong Zhang (1):
      drm/amd/display: Fix NULL deref in debugfs odm_combine_segments

Samuel Zhang (1):
      drm/amdgpu: fix gpu page fault after hibernation on PF passthrough

Wayne Lin (1):
      drm/amd/display: Enable mst when it's detected but yet to be initialized

Yang Wang (1):
      drm/amd/pm: fix missing device_attr cleanup in amdgpu_pm_sysfs_init()

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  4 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  4 ----
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  9 ++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  5 ++++-
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |  3 ++-
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c              |  5 +++++
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |  5 +++++
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |  5 +++++
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  4 +++-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             | 26 +++++++++++++++++++++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 12 ++++++++--
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |  3 ++-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |  1 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                | 18 ---------------
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  4 ++--
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |  2 --
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  6 +++++
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |  3 +++
 18 files changed, 84 insertions(+), 35 deletions(-)
