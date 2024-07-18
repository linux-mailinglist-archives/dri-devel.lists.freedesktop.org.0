Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0829937046
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 23:53:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7095B10E1FC;
	Thu, 18 Jul 2024 21:53:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="26Ln7dgY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2EB310E1FC;
 Thu, 18 Jul 2024 21:53:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UZJ+EsMl8KE25kadFogfMMiAs/IbUci52QyjhIWhhY/jucXrZiF1bzZPKa5yWABVNUQQ44ZShwFu/Tswe+ATBtGMdHfBVOsifX46K5qGZYRMSCoWVAw13PF8bMRbgtq97y5apE7oSmKMDRKO4aXb9Bx9lkVk0KJ/tAtg1p5isltJDNeQ8GQMZAlBzdDw/2Wl/JtCXyvrLumfjuGmDkhOtmv/1bN0axgZXjZxmlM/tkuMmY2sqg5qTx5n+fNIDz/9ilpy1uzQEXxgmlVr2iv/0NpZGYnzhVlNh4j7PaqGnFKLzc93wWlXvMtlMICAaXQKQyotf9dLtIXOjJNSEtiZzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RcjhcYmZ+tB31HYXYKn/0RhkunppnV6qmCTjjI9UR+I=;
 b=Vqa7j4ankKQbqrfGRy2202sJQ8X2FRdVyGxLufQl6R2FroptwGAhEdiZliN9mTct7n/Ul4s8OtMywpVBWwBNwXvzUJZ135e+QSTgZR8Vkp5ikEdgGLHIRjNxbQXyhx5xcwbRVHvF+iNGgPo89VWKQ/xcJOgQyL5XUnWImBtmdrWw5pYCU9ZD9i1t4UMk8eAWGeJ8UZ+dN/MTE55HgCNE4iJY4hEVj5Eit5v0Z6XQX/60ehnCtHbCbnPv6KdHsPQnXvJyeWm+DZE9Yi8qdPNHd/Z2VOck/zb3lReS4wSUUZdV+sTbxBI3q9MBNvT7o5x4wv4c3zjVsbKavhIUfvks/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RcjhcYmZ+tB31HYXYKn/0RhkunppnV6qmCTjjI9UR+I=;
 b=26Ln7dgYLXTOtyJxJ8jRh44EuAqF3F0AnEt3ri3InKFUAvKtx9wO2MCxVBAA6zs5FIrsFh08u7LzlO0SuSb+zcxpRzLgESlTMx3MpeS+ETzSbJzLGEa/P4kxgeK3EY1kJk27xvtRkISpeobrzCQP2PNJMgH2du9HfHcd0mxl4fw=
Received: from BL0PR0102CA0005.prod.exchangelabs.com (2603:10b6:207:18::18) by
 BY5PR12MB4098.namprd12.prod.outlook.com (2603:10b6:a03:205::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.18; Thu, 18 Jul 2024 21:53:16 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:207:18:cafe::6b) by BL0PR0102CA0005.outlook.office365.com
 (2603:10b6:207:18::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28 via Frontend
 Transport; Thu, 18 Jul 2024 21:53:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Thu, 18 Jul 2024 21:53:15 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 18 Jul
 2024 16:53:14 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.11
Date: Thu, 18 Jul 2024 17:52:58 -0400
Message-ID: <20240718215258.79356-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|BY5PR12MB4098:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c6c03b0-16b8-445c-9e2e-08dca7740748
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7bZBhyNmjzNv0vn87Wz1UeFc9JBeMNXM7v8XYjbWTaQV9uwxCl2J0CJxpVW4?=
 =?us-ascii?Q?LuqV2WtqXzb3wM1Tc480dkhIs1yqSkdJAzeoSZbzD4hugh80cnTe4qQPkHpu?=
 =?us-ascii?Q?j4Nzu4ckre6yvPI7g99/+zRIQtVpnbUZSs8XAm3DmWyAWMbOjeGBaAs17AEd?=
 =?us-ascii?Q?B3xKQU0iPe8b4IRbOjYxK7ylHCArLWeWJ8caAsIElnVV7jJZJvPOy4pXVe7B?=
 =?us-ascii?Q?3QKMwxZsXpUqGEuIUDNOK1hyBLuFMk8E/MUp04u1tjY+LXmbh3OgjAi8vNOs?=
 =?us-ascii?Q?8MntKumUKhfsJnDGKNdq+BSFM+Vxe7wKVoewG8wGWyBWydUNyilkOy5/oGSD?=
 =?us-ascii?Q?oesAPirbPAbrbe/k8dI2640jlaUcRqJgAxitXollwI18uKzpzM7CsHk7jicn?=
 =?us-ascii?Q?2E8+qMQCBYumJLtcoRHZew9EBgPIBDyBp4QGrZwdJPb3Qod1EGDBHwophbjM?=
 =?us-ascii?Q?l1ElZ8bmaSU2IZBKWZF4hHMAGyawmGWZFblo7c0pugFoVmVj9bZlPYoWB0bz?=
 =?us-ascii?Q?TnstPKIUEq3jiQ3l1MJbZhDXJApjQMf95kbAvLaTdoMAhU4nGtoR6tM7wHwo?=
 =?us-ascii?Q?s7X3BtV0fP1nasuoKDDQV7uUkNR+nVgcIMdGtkhWQPQztqgjNSWd1h4rszA3?=
 =?us-ascii?Q?Rxv8YLDcMvxp3nScd4Ta8OhgDNs8dqbyl2rc3YCh+z09h5jOg/3FBXEHvoeq?=
 =?us-ascii?Q?T9Usp1PWoFe0ws1C6Z+5fhCLzOn+6RPvkfIExJVDnrgoxo7WjZQucyUEn7Gg?=
 =?us-ascii?Q?9f81ffuAsTXsElyuwNZ88E2b7/YovaavHqtsvewIeMI+7oyAL0GJ0y5Va0kL?=
 =?us-ascii?Q?cWK05J0RsQxtarAXA5q0H2wDbW1E1I/E0JPUOD88qieHjo3kB+zvoGlvgLRN?=
 =?us-ascii?Q?x65ikgcsBulD2Rqpklf1sIJB3gCHbTzA+bfdxERult5IT/5vzGUrNaVrjx+P?=
 =?us-ascii?Q?Nu1ADfeihq+3ibqRI/KIy5jHHbtXGuH+kIgfh9OH2Xc4btueTaCTGkqHRUm2?=
 =?us-ascii?Q?sioNdujrBIF6KAKM/1PotWGG3U3oiM1wmK4+jG/M7uTlVtpKqmF403cClMHs?=
 =?us-ascii?Q?DkREPpFFt1/brMF7LPIehE4PkXfgKH5KH0A9sEFYu3lvkP9aT5UEoGT9eSZw?=
 =?us-ascii?Q?TCnAWh8Jnc+JrY/6+sTV3B1CfR/peY+XRS5R+Qs111zC8wPmc3RBIfsCRf8t?=
 =?us-ascii?Q?ySXpWKBxbKv1vdwDp34OyxxgCssLkneH/Acyn9YpWR8ixIwNaZZcdufMtDqC?=
 =?us-ascii?Q?NEyi1bpAw36Gw92pjPjGPt3klRIMa6Rn9sk1r12eOCMeCnGzEcT9J35jMXej?=
 =?us-ascii?Q?TkAEmDCkMLPBgnRKyworGEH4pHAGRD32XcQENiet52jiIakIql9nnQ8a6E1n?=
 =?us-ascii?Q?FrES8yRURZbPlQDWUux0P1UWf7W8?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 21:53:15.8918 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c6c03b0-16b8-445c-9e2e-08dca7740748
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4098
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

Fixes for 6.11.

The following changes since commit 1cff1010bef6f325d895db0306b59dc7232ed9b7:

  drm/amdgpu/mes12: add missing opcode string (2024-07-12 11:46:46 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.11-2024-07-18

for you to fetch changes up to e3615bd198289f319172c428f20857accb46b830:

  drm/amd/display: fix corruption with high refresh rates on DCN 3.0 (2024-07-17 17:41:28 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.11-2024-07-18:

amdgpu:
- Bump driver version for GFX12 DCC
- DC documention warning fixes
- VCN unified queue power fix
- SMU fix
- RAS fix
- Display corruption fix

----------------------------------------------------------------
Alex Deucher (1):
      drm/amd/display: fix corruption with high refresh rates on DCN 3.0

Alex Hung (1):
      drm/amd/display: Add doc entry for program_3dlut_size

Aurabindo Pillai (2):
      drm/amd: Bump KMS_DRIVER_MINOR version
      drm/amd/display: fix doc entry for bb_from_dmub

Boyuan Zhang (2):
      drm/amdgpu/vcn: identify unified queue in sw init
      drm/amdgpu/vcn: not pause dpg for unified queue

Li Ma (1):
      drm/amd/swsmu: enable Pstates profile levels for SMU v14.0.4

Rodrigo Siqueira (6):
      drm/amd/display: Move DIO documentation to the right place
      Documentation/gpu: Remove ':export:' option from DCN documentation
      Documentation/gpu: Adjust DCN documentation paths
      drm/amd/display: Add simple struct doc to remove doc build warning
      Documentation/gpu: Remove undocumented files from dcn-blockshubbub.h
      Documentation/amdgpu: Fix duplicate declaration

Roman Li (1):
      drm/amd/display: Add function banner for idle_workqueue

Tim Huang (1):
      drm/amd/pm: early return if disabling DPMS for GFX IP v11.5.2

YiPeng Chai (1):
      drm/amdgpu: add mutex to protect ras shared memory

 Documentation/gpu/amdgpu/display/dcn-blocks.rst    |  35 +-----
 .../gpu/amdgpu/display/display-manager.rst         |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            | 123 ++++++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c         |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |  53 +++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |   1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |  17 ++-
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h        |  22 +++-
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h        |  14 +++
 drivers/gpu/drm/amd/display/dc/inc/hw/opp.h        |  15 +++
 .../drm/amd/display/dc/link/hwss/link_hwss_dio.c   |  29 +++++
 .../drm/amd/display/dc/link/hwss/link_hwss_dio.h   |   9 --
 .../gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c |  15 +--
 .../gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c |  10 ++
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  16 +--
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   |  18 ++-
 18 files changed, 246 insertions(+), 141 deletions(-)
