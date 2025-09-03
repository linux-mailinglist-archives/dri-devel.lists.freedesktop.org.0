Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 886BAB42CAE
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 00:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE4610E955;
	Wed,  3 Sep 2025 22:17:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fvOeIoFV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3F010E2AE;
 Wed,  3 Sep 2025 22:17:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=liEei1CNxVX548Uxxq7Qi29wZhFfUY4hX+/qhMhRKaTtk9efUIEZLdR2jfFZyZjQpI+TE+sKXP/pcjw09d1MA4i/U87rpOiNpw24k8x13e7cfKxS5l9p1ofQNEeUDwyVs/MNfHrs4Ln1KYmC1H7yl3hAz/FSqIWsXoMYNCCt5uBbf9jUhdrUz1OLdM0MhOrnkxibNDQeXb17Z8iDu+DuJqcscd/8OS40mb0G9kqTNrGKSF2x9DnW6J/C4txQ6hF1WxMPUqJaUgEQJDjvRQd/VyEdxB2vcFfdnbda8raFHVgO4ZEBzzTpfGNw+sMey1s9/86ot18T0d+E73unwYOpng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ce6mTfbmgkbSvhzF4oqWO1NdGCrrMrdzINkF+0v3/EQ=;
 b=MIQVGaDRWa9NxUKgRvovZNHzhWqlntsuVa5KN/RC8+EfbLKGGUHi4IQ/LGdVoqD9sd+YDCWIVv/sY6w1wCTr7ovObdW987yjq8e+RQjCDobw+9z/44btyk/SePBldu5ZskpUMUmsiYU2u7QPr4zB4fnNvNP0Jv/GU8StRepUaFeMkgDRmUrsMdNvjRg2InUNstFXZl6MKyWovkHiIJ0oR4sLlFD5KOFhvVAKRei9CvisQri4f0ZbyhWFC/3RwJM8ozii9LmcMuCkWMzcydHF9dgd7CcFFc1+Q7+Znya8SuOxy2pw720EiSu24OrQm3mB30ysH5CGZN10LIaS5upDKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ce6mTfbmgkbSvhzF4oqWO1NdGCrrMrdzINkF+0v3/EQ=;
 b=fvOeIoFV5MxGN4oQlps7e2mXRdUQp70WfFrPg6F8c9qyESAmbLSkPA6kil2z5bsiSvTCsd50PCUcI39UtXX4AoKTZ63uAY60rbus2RWfh1aM+ydi+dcacxKWZQ7staQXC5z/eRowzuR/rECUCRkijAxzW/PPxc/yQthI2sWoohQ=
Received: from MW4PR04CA0111.namprd04.prod.outlook.com (2603:10b6:303:83::26)
 by SA3PR12MB9198.namprd12.prod.outlook.com (2603:10b6:806:39f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 22:17:11 +0000
Received: from CO1PEPF000044F2.namprd05.prod.outlook.com
 (2603:10b6:303:83:cafe::f8) by MW4PR04CA0111.outlook.office365.com
 (2603:10b6:303:83::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Wed,
 3 Sep 2025 22:17:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F2.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Wed, 3 Sep 2025 22:17:10 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 3 Sep
 2025 17:17:10 -0500
Received: from tr4.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Wed, 3 Sep
 2025 15:17:09 -0700
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.17
Date: Wed, 3 Sep 2025 18:16:56 -0400
Message-ID: <20250903221656.251254-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F2:EE_|SA3PR12MB9198:EE_
X-MS-Office365-Filtering-Correlation-Id: 09dfb894-d338-4fa1-2ed1-08ddeb37a0cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Eshp+EsOBICFRgZ1s6+bLaN1GwrNS41MkkRrIoTDS6lYG/PWmqgA3j7tWEws?=
 =?us-ascii?Q?9rz+MNJs3RyHAyb2d5f4O8Z50euYb5G2eJEbBZQOfbx0mFrHB0oAkAA4eakV?=
 =?us-ascii?Q?oXFVGY11OrlmmRX1osjOduDILPwNC2k6SY2Rhx4oVTRB+5GyFsNcyjNgTzN4?=
 =?us-ascii?Q?mWGKp2rplHWU4SzaGWnzefbIyMvQQV/KgMWIDkF5yHnY418dVqBLuT+OI3a3?=
 =?us-ascii?Q?rlI+ZEmiWgdR9QoZmDJIufkt+WPD3jjNNvrcI6dgH7VqxuvP5Ji3KEtcnKzk?=
 =?us-ascii?Q?MNXBJCwkDPEjXgjRoYH8Ygs3Gb54Jx5wyknYkTCty2b/lBNMJsWGA42ug5QL?=
 =?us-ascii?Q?kLTuF7cbAR5AszPo7mqoStHOl8nk2JrTh4dZISFp/YJmrUsIzNtgUGp8088k?=
 =?us-ascii?Q?a06T1SkbYS2v3pDjxu/Z6PbInLPo/zYIfDMyA118E5ur4bwfQ9cKG410j08v?=
 =?us-ascii?Q?ZvjFC6C7152/V1xflLL+PFyNNcyHDlH34/QnbhQ0iD4UPdVSHrejYNwIeIj0?=
 =?us-ascii?Q?BNXxHT6lMe4VYeR9oNQ2ZNP0lL+QMGUJ8Kn0r0GTfG1IM5Lvv6IOS+UTnTRt?=
 =?us-ascii?Q?JdzgLwTcIpDejk8/frFPnr5qU4P8U/bgYnRbkiGjHoZC89OzRlqv8B7v20bg?=
 =?us-ascii?Q?R4b0J5ieTOpPTRs3iJWklOEM+MxpNdacPy7H1RV7azkoSUMAGRfL3WUEs3+0?=
 =?us-ascii?Q?HJ7Q6VXigIN159zayOe6ZBnnZqKZu+xoKI+01iivuiaho7Hy/8kk0RPDdEON?=
 =?us-ascii?Q?uUpqqajObHhxKsXesdVfu/KukRInCQ/dKoNgIvPK2Vira3wkp7EQJrpioiJD?=
 =?us-ascii?Q?rx9PRgHV34MnSnsaDrArEF+mYra3uq5Mj99gyMPWUkzG28cojka6CGxhyEiv?=
 =?us-ascii?Q?oPbezN5FMpyXHg1pGG1/NNZ2d56pr2DK0g3cxsXEk6gzbAZoDrBhKha1CPQB?=
 =?us-ascii?Q?KCTp8rvzxPIct8dvzQnLDZFb2r9AuwQ9eNvac6JRqvh4BR7g+Y3A2uXp2t/S?=
 =?us-ascii?Q?EzmkbHsplnB+oLM2EoygCq8VMcEPOIS+tBT0+Nom2rT3A8vpz8pK8zZh3mw7?=
 =?us-ascii?Q?Moi3JSlO1yaiB450PV3MHwcwaSSfNPSjq9TWDE9bfQ6lqJYq8PLcgTrDywTr?=
 =?us-ascii?Q?biy6nlVZCup3KxuzC9oYsMw+eyNVOBg/+c3jXG5qqZeMWW6UK5ebSSvevpUZ?=
 =?us-ascii?Q?btzdG+CSc+1irZSiSqLaA3BfgMcbsnKRr73xSkXnOnQqe/eaJF7khwi03mR8?=
 =?us-ascii?Q?IAQkhv3sye4mELO3yts4k+OStS4/rs75KZ2Y7Sd1OfbPCrPA16A7kAF/o5O6?=
 =?us-ascii?Q?XyPLH3AOPljlLUJ+Zfic1lJGGmS59dHf/kzXdmLpPUhyvBQGgz+qaYbsD2R6?=
 =?us-ascii?Q?H6Yq4zLaGYD2SQm72cOXKGkXZIjB7YuenNk+UBa3sN9TFVgvCvwo0UChzDOy?=
 =?us-ascii?Q?BSqB0wDGVcF0n2BAxl0ryoWfiji2P+DxaU5vWK53Wzu07YLA6X6MVA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 22:17:10.8537 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09dfb894-d338-4fa1-2ed1-08ddeb37a0cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9198
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

The following changes since commit 42d2abbfa8c40299e047a9b3e5578fdd309dd2ff:

  Merge tag 'mediatek-drm-fixes-20250829' of https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux into drm-fixes (2025-08-29 10:05:10 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.17-2025-09-03

for you to fetch changes up to 467e00b30dfe75c4cfc2197ceef1fddca06adc25:

  drm/amd/amdgpu: Fix missing error return on kzalloc failure (2025-09-03 16:27:56 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.17-2025-09-03:

amdgpu:
- UserQ fixes
- MES 11 fix
- eDP/LVDS fix
- Fix non-DC audio clean up
- Fix duplicate cursor issue
- Fix error path in PSP init

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu/mes11: make MES_MISC_OP_CHANGE_CONFIG failure non-fatal
      drm/amdgpu: drop hw access in non-DC audio fini

Colin Ian King (1):
      drm/amd/amdgpu: Fix missing error return on kzalloc failure

Ivan Lipski (1):
      drm/amd/display: Clear the CUR_ENABLE register on DCN314 w/out DPP PG

Jesse.Zhang (1):
      drm/amdgpu/sdma: bump firmware version checks for user queue support

Mario Limonciello (1):
      drm/amd: Re-enable common modes for eDP and LVDS

 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |  5 --
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |  5 --
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |  5 --
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |  5 --
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  5 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |  6 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  3 +-
 .../gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp.c   |  9 +++
 .../gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp.h   |  2 +
 .../gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c   |  1 +
 .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c  | 72 ++++++++++++++++++++++
 .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.h  |  2 +
 .../drm/amd/display/dc/hwss/dcn314/dcn314_init.c   |  1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h        |  3 +
 15 files changed, 98 insertions(+), 28 deletions(-)
