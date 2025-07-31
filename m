Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA35AB17684
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 21:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B80710E2AA;
	Thu, 31 Jul 2025 19:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="utJuqel6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5515210E2AA;
 Thu, 31 Jul 2025 19:19:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mMavcCZeVlprMsjWc0ZVgGOR6Ay+Ag9gPo5hQDd7EuccYciUkS2VKtnOzn9S2Dp9aEwhtZ+q3fRM4CB8XG/I0mHMMKUjgh4sMLPzLBc7X7bnw3aqsqCj6OKeynJsPpPZiWztGv+Kcf8GnHGqe3tQCpiP0FX0xfnLxXAWurAf5HJMebwxP5S9JVyCmdFuAVhuqybwXV8uLeqFra60zu467oQY9L8KWQFEGfwxOwkOmk3W/V3VAtigGL9nB2MxXNgxtmiyx+X5lJtEf0EBc/FCgzQT/5+f2npH5IJDQG3aUH9FPbfUKY2kFZAlDaJ8FbhcqPnTJ8lHV7onvw+ZIHHdEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/bD1KtGv845DC0R4v8mhcKkYu6RCetP9klGY7X1s4U=;
 b=jz+i7nBH4WmRV/fB2wZKk+1PDVQ3WWErRzRHTjKyOuaSEf3WatxvFv0fpXZU9VG+nRVUrhWIGlIC5oCMgG2S0tynXdelUrs8Z9VHjFSUk6DJQRHMKcTgiFQyy5eaZBV1g8VlN+hGapLbRnXdQiRngR0gqD40wAbqqPA0TH9njKVnBG6G8h+xMC511Nbbg4skQ3CgRHGOYLeUCh5ioSv+JwgLFZDpUdhSqrkmqVQ+HO7WBMaRFvBp7C+mJVhk5BJM8iJ4Gcq9h3LSd0o58ohzcdGNvveGvkbmwKCp7oL9eFe6eLso1TR14FLJ5sIrnu03ktM/s2alakuaDAMw7aUmqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/bD1KtGv845DC0R4v8mhcKkYu6RCetP9klGY7X1s4U=;
 b=utJuqel6OhVSRazKivv4U5WxbIGxBe2w8XX83JvggoOd2aLrvfvYhvTHqnPr5ZjXfiyAIK8mfIAloIYHYkxhyrGsM5s+q1OAIQjpl5WbGBMpRaMp9uWQbcYO85zMZY6a48j8rl3l7JGS4zoPADFG8ho8pMPEaUsO9e6vTkFTib0=
Received: from CH0PR03CA0416.namprd03.prod.outlook.com (2603:10b6:610:11b::7)
 by DS0PR12MB7631.namprd12.prod.outlook.com (2603:10b6:8:11e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Thu, 31 Jul
 2025 19:19:34 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::f6) by CH0PR03CA0416.outlook.office365.com
 (2603:10b6:610:11b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.13 via Frontend Transport; Thu,
 31 Jul 2025 19:19:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Thu, 31 Jul 2025 19:19:34 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 31 Jul
 2025 14:19:33 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.17
Date: Thu, 31 Jul 2025 15:19:16 -0400
Message-ID: <20250731191916.255648-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|DS0PR12MB7631:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e8642e9-f86a-4f09-b345-08ddd0672f1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s0eXJSbfAVbyCDyOQXBQ+nlvjGeBgOly9dJwrmNlMafQbalbObaUCgbZejTC?=
 =?us-ascii?Q?/JAq9TCmtAJkYg9eJgSMSg1ZJo5WkkmnkZpqy1ygsudqqRUus26HPIAses8m?=
 =?us-ascii?Q?8IaR42lLCmYPTZYhckc6HLO78n3jj2tbaR18yafsr/5eF3npmLiEzHEHsR3+?=
 =?us-ascii?Q?3/jI0Q/3p3O7suHHi/8WvhXf5/Y/QH7Xb5C57iRni7GRIWee4qmbdAOcFGrr?=
 =?us-ascii?Q?ZI7hjw0QNtF1G6cNOuoJsxPeHOK+0uuvY1MmiDhe9DI7Yipp7+Eq+VTytBll?=
 =?us-ascii?Q?vr1hdEPPkhmjhyJwFfo29iNTHilscF+XkQM62SNetsJ59mGdcq21S1E2UCbK?=
 =?us-ascii?Q?5eA6wWnZGHDbtRRrPvnEa2iNyDbKLpcOu9GNBsOq+gOombaP4zPXDJuIYAs2?=
 =?us-ascii?Q?Q0+n9LkmPfvjs2HztDh2ILu+rRDz35tZSGAWyw/D/s5IM2LhWdIVlJEdVg+q?=
 =?us-ascii?Q?zQ6jlTCrRQ/crBQGkF6OSpvpA9h5APODAS3CgQIr1jsi1NtFuB7rUJHwI7S7?=
 =?us-ascii?Q?NKprZAC3BNMysp3s8asBsnjFPI5sRl4tYXuIO7TZyjkKk+jteS62za7TugQe?=
 =?us-ascii?Q?LTF0d3ekUKDhdWDjH70BkVY1Z6zq4wmsVfs/YQwtGAMGxL9rvVQ7RZUgOuCd?=
 =?us-ascii?Q?isVVUCkkBGYwmu4KGsM79kjVHulQOpXQIzsyupMYhfiWAIQVd6pGXbUxwmDO?=
 =?us-ascii?Q?4IGWrRJBhJY8c1U1AaYpljxle+LPnG2RnWCF1g0h+2BvgXAl39tPHQcsWZla?=
 =?us-ascii?Q?l7o/jB4JmzLdKZRXXO+sfdNzdS2Ht6Y7C0etSJ8VtHqjWkF9pj/LBaF++jH3?=
 =?us-ascii?Q?Gy9ZyD2LIL08pKWMzQVkJz3pa16ONSGpHs2oxio8C5cOiEHOROhh/BqlGLPE?=
 =?us-ascii?Q?pp5WWOc6kZhvAZtqcKSI8H5d/Ozx3wg/CfcN085H+707/4lEFxexk8xSKM6v?=
 =?us-ascii?Q?TXZ0cD5sx5Kx6zxR/+z4Dl9wTnuglKROolAxmAIF73SaId8rSyIyu/w2aCqq?=
 =?us-ascii?Q?vv5nTWDb9g07B3SXnyu5hNZEnQBx295ZwNs2IrcgTwougG3vsKwmV1JWp+LA?=
 =?us-ascii?Q?EiPcNFdmCCKpJv0rxBNzgdg6RNv80/oSr6XNKW72NOEnTT9MrMhhkaQmPOv/?=
 =?us-ascii?Q?KhOq22fOVle7jqoiVB4WTEz3g3kzIUyVX8DfupWkrp/SiLJXg4Ss+znC5j9w?=
 =?us-ascii?Q?pk4tCCQXgY3uqk3yPC0yxAReooapZAdVwqfyHAJg4/Cewhyzcxgvgb4vXq3Q?=
 =?us-ascii?Q?AffxX+9p1UUJAtgrAawZnIliGraaraOGtR1xRh817+jEZYm5zhXvxZQTKcxD?=
 =?us-ascii?Q?Vr/fdHHlnwoRVZnpRZzlaildRfyhbQoWh0v+xbXaZJFCDvjq94W7HJxLiV8F?=
 =?us-ascii?Q?63HSKTEx8CPkHE8Aaaf6YPYey50+Qf3XWHYkHq0QrCqF+bvuIth+Wy3V6Ysm?=
 =?us-ascii?Q?QkincA+zJQOgjfk/O2wkgYP5ygARycQTB8MjJT0HF4SqDdufhgJlIw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 19:19:34.6618 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e8642e9-f86a-4f09-b345-08ddd0672f1d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7631
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

Fixes for 6.17.  This includes the DSC fix for Linus.

The following changes since commit ba0f4c4c0f9d0f90300578fc8d081f43be281a71:

  Merge tag 'nova-next-v6.17-2025-07-18' of https://gitlab.freedesktop.org/drm/nova into drm-next (2025-07-21 12:56:39 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.17-2025-07-31

for you to fetch changes up to a0b34e4c8663b13e45c78267b4de3004b1a72490:

  drm/amdgpu: update mmhub 4.1.0 client id mappings (2025-07-28 16:39:49 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.17-2025-07-31:

amdgpu:
- DSC divide by 0 fix
- clang fix
- DC debugfs fix
- Userq fixes
- Avoid extra evict-restore with KFD
- Backlight fix
- Documentation fix
- RAS fix
- Add new kicker handling
- DSC fix for DCN 3.1.4
- PSR fix
- Atomic fix
- DC reset fixes
- DCN 3.0.1 fix
- MMHUB client mapping fix

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu: track whether a queue is a kernel queue in amdgpu_mqd_prop
      drm/amdgpu: update mmhub 4.1.0 client id mappings

Dillon Varone (1):
      drm/amd/display: Fix divide by zero when calculating min ODM factor

Frank Min (1):
      drm/amdgpu: add kicker fws loading for gfx12/smu14/psp14

Gang Ba (1):
      drm/amdgpu: Avoid extra evict-restore process.

Ivan Lipski (1):
      drm/amd/display: Allow DCN301 to clear update flags

Lauri Tirkkonen (1):
      drm/amd/display: fix initial backlight brightness calculation

Mario Limonciello (3):
      drm/amd/display: Avoid configuring PSR granularity if PSR-SU not supported
      drm/amd/display: Only finalize atomic_obj if it was initialized
      drm/amd/display: Pass up errors for reset GPU that fails to init HW

Nathan Chancellor (1):
      drm/amdgpu: Initialize data to NULL in imu_v12_0_program_rlc_ram()

Peter Shkenev (1):
      drm/amdgpu: check if hubbub is NULL in debugfs/amdgpu_dm_capabilities

Roman Li (1):
      drm/amd/display: Disable dsc_power_gate for dcn314 by default

Srinivasan Shanmugam (1):
      drm/amd/display: Fix misuse of /** to /* in 'dce_i2c_hw.c'

Yang Wang (1):
      drm/amd/amdgpu: fix missing lock for cper.ring->rptr/wptr access

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c           |  6 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  6 ++--
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             | 14 ++++++---
 drivers/gpu/drm/amd/amdgpu/imu_v12_0.c             | 13 ++++++---
 drivers/gpu/drm/amd/amdgpu/mmhub_v4_1_0.c          | 34 +++++++++-------------
 drivers/gpu/drm/amd/amdgpu/psp_v14_0.c             |  2 ++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 11 ++++---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |  6 ++--
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  3 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c    |  8 ++++-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        | 29 +++++++++---------
 .../display/dc/resource/dcn314/dcn314_resource.c   |  1 +
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     | 11 +++++--
 17 files changed, 88 insertions(+), 61 deletions(-)
