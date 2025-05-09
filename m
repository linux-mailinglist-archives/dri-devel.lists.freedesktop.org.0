Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E58AB2029
	for <lists+dri-devel@lfdr.de>; Sat, 10 May 2025 01:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22EE510E093;
	Fri,  9 May 2025 23:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tSHx1i3o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E11210E08F;
 Fri,  9 May 2025 23:10:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZpbOwXedfZhGAqOaZMDwm/zYY2ewnPM74ETaWm8WYjR7yDhfxFWuhjZiU0oT0rlHNG4obkkETfxdsPKx7kx10gZUn/oBiNN/v4VOEZ/fAN+2kuJLnti3LyPUsW/Djeia+IjkQlJ4m4231uwaHGloD454+cDvYmfr38H6yg1kkwrL8GaeWsvvh/o1cmw2ruhXzjCkv+hKbb5JGBC3jsr+XnDHnywgX/woFuVb0ZBQhHVzRpWsaHTiHmBIpgURERQtzhy/wB+CXcySBBJw2QnFlV9dTCGUF4h6jrL01wm8h/LgZTZGjrW1gdqoKAfg3TdDcdHf8fSrQnWxpFkeYmcqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hxrgt+OzU8siPQY6wfEN2IkAiPwN1JpIrn1Lcmk4V3M=;
 b=rJARs4yyScKKDpNqpy34TmFBIRNCl5t1qMo1dgr+hprJxlXJ5+BEwqvn3k9gDGag1J36kD4mdLbw/NIweixVa5mp72mxCINwvJCwLxwV1phzAgQqAtMhKhjRJ3D5bowjDZ5NcgCiUvZTrCIFZS4rLyugqHw5GMRTbCSWivqAObV5ORonIgvgNkTYEH5t7jWnjNuYBVaNl2o6VLq6SZvMhiRMCAy5Z6f5Memnhs3fPUvun/ZE2sPiQ7jva0IxUVefCUh7tDk58zn7/IRU+uRNqj1WX+jdlll1f5of4oHnvA4lL75xQKmAorGQeU2jIORGzP9FnNPwdUkI5pNFDxjlAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hxrgt+OzU8siPQY6wfEN2IkAiPwN1JpIrn1Lcmk4V3M=;
 b=tSHx1i3o87Ia8LCXJV9AUYqI/fqifsrHjSIPL9uPA/wL/5UEm47uEI9mB8DRjtgU9+BlxTx6rFQ2AaYNMo4bvJIiyUM3BQT2u7CH+fJPSyspgYePM7XuMPV7/eU5btN3+Et+tMKT/ubAis7b3A/wQ/zUSL78TcSTSlxnbMwgodc=
Received: from PH8P220CA0034.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:348::17)
 by LV8PR12MB9334.namprd12.prod.outlook.com (2603:10b6:408:20b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Fri, 9 May
 2025 23:10:12 +0000
Received: from CY4PEPF0000EE33.namprd05.prod.outlook.com
 (2603:10b6:510:348:cafe::10) by PH8P220CA0034.outlook.office365.com
 (2603:10b6:510:348::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.25 via Frontend Transport; Fri,
 9 May 2025 23:10:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE33.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 23:10:11 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 18:10:08 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd, drm, dma-buf drm-next-6.16
Date: Fri, 9 May 2025 19:09:51 -0400
Message-ID: <20250509230951.3871914-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|LV8PR12MB9334:EE_
X-MS-Office365-Filtering-Correlation-Id: 17abcd24-3150-443c-3f5f-08dd8f4ea600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4CkFkctbPiZJ38vUBiwISCyLbIj4xojsiORJLGzMIGrvGHmFQ0CmTOOjtKZR?=
 =?us-ascii?Q?oe/3jDJYE5E/T2XGbwIx/SRIhRnoJU6ptDYmZKjxyqeP1LZ6indT0wAqjTb2?=
 =?us-ascii?Q?0cCSnuC46ZeBd7aCYo8W5SM6U3sJTyuJXtqkqJ93/Jj5Xd79VjiGBO5Gx8QR?=
 =?us-ascii?Q?StNWhAMD2QtSUpawUYZ7tEKjohmGv5dP+5MF9FuS9fP4Rn2/fQ82SyRYdirc?=
 =?us-ascii?Q?JpM26gYlkYeivyeCKcuLtm43eDWCamy6q5C2I0J5QqiOofzVG2dMUlbAq8Jn?=
 =?us-ascii?Q?SDV+8SwfPgQoGtxD/JdphEvBc5s8nqL6XInn11zpGwe6j/nmLxOk3gjlyj3V?=
 =?us-ascii?Q?O6fBbKUESAqFcO3q2IzKVpnIbWukaZfFdQ8D6ewIJAs1cD7f2INrL2SgSUmS?=
 =?us-ascii?Q?VdPsnk6LgkYqTBptFyu25o+wmFGoSxRMrAZrmaHG9oi+l+iwKmOqyccmq/u1?=
 =?us-ascii?Q?7gf6vcnML2j8R/nT6PMhsjLWBxYi1BtOvMXykGUkOk5KPBRUe4KoCyv6AqVd?=
 =?us-ascii?Q?vJOSQ3tw8g6yu2bM+yzWXzByYL4pGLFlIc/K8K8epJMUKx3Fa4z6xtr3YwUy?=
 =?us-ascii?Q?5+S82tABWlPupNa7OPIrUox5+Xp/OmZM1sXruw5wOrn6FBtD2wwSVqjcBlXM?=
 =?us-ascii?Q?7IE4yvjJEjyBe97ElclSXntlo5j+82yZLEPLLtt7dIe5BELKIjfmnFNX7Xoa?=
 =?us-ascii?Q?3uUYETtsdT3Qq4890r1974UAyD1n8IlGkRi/DyYU1SX/gUIsaBuK5CRfPcLC?=
 =?us-ascii?Q?qhF8cHq20vTwa2iiw/AkUrgEVEXHgucUz2nJf8GAYCe5hJRdv50/x0nSNBTZ?=
 =?us-ascii?Q?C6VYtyZsKNqvXHNjuRwCFVVXTDonNISqfB5yUdorAQNS+Q+GXV8bi9AJkVNC?=
 =?us-ascii?Q?MBSwV1m8oE5XCtxEKMlWTFcxXAVI6qS2EBomSqFMxo7OU0//41z9WwxPITDh?=
 =?us-ascii?Q?ibcx60MCRVD6Lq75QKZ5cClcBIu1gfpnf8H0L3Rtj+M3NBnb5pyT6mzF2FM8?=
 =?us-ascii?Q?NpVbzm6SxeXsCeBf26LPwKlEOAl49iro9QWuTxQG6eAByYGskNkmoexwalXs?=
 =?us-ascii?Q?fYF18+zLNaqS/dxxom9EYfPfFvh+JGyj42mFPTl0phqjw7KWbZpYtw7UeYMG?=
 =?us-ascii?Q?GF41EsjdmX169buDEh8Wh8/k3/dqIZfaqHj+aPHKxpsTb36Yf9ApgAtDT0S0?=
 =?us-ascii?Q?k39zhI3/0YFg3V1VUB3NGpRK0Vqjqe4ZjvIMrk2Svh3widPvdRIgo90OyhUw?=
 =?us-ascii?Q?sVarCpEJGbh9RAg93cMy0Rc51OtUjmCtXKGS0IQYZGKoL0TL0SPXuecmUYvW?=
 =?us-ascii?Q?FBwrD5VdMiMTsii0pE89Vf/husEP4DryNIfE1f8yjc2GB2K2GzwalyYJtnWE?=
 =?us-ascii?Q?i65lFBMc9COlyRthRs4AydaAmy7bYb3uvC+7PmDahEbKiIETf40uceWhP92e?=
 =?us-ascii?Q?Gr7lw0MY/7DIxjt/53qpQnkEB9oRRzscLc0NFryJRc5MdSjT0xXoLQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 23:10:11.0775 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17abcd24-3150-443c-3f5f-08dd8f4ea600
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9334
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

More changes for 6.16.

The following changes since commit da072da2c8ca3e886133c5826a3f802f3d816708:

  drm/amd/display: Rename program_timing function for better debugging (2025-04-30 18:18:59 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.16-2025-05-09

for you to fetch changes up to afc6053d4c4b0a6be500b9e643aa17221e93a57b:

  Reapply: drm/amdgpu: Use generic hdp flush function (2025-05-08 11:21:37 -0400)

----------------------------------------------------------------
amd-drm-next-6.16-2025-05-09:

amdgpu:
- IPS fixes
- DSC cleanup
- DC Scaling updates
- DC FP fixes
- Fused I2C-over-AUX updates
- SubVP fixes
- Freesync fix
- DMUB AUX fixes
- VCN fix
- Hibernation fixes
- HDP fixes
- DCN 2.1 fixes
- DPIA fixes
- DMUB updates
- Use drm_file_err in amdgpu
- Enforce isolation updates
- Use new dma_fence helpers
- USERQ fixes
- Documentation updates
- Misc code cleanups
- SR-IOV updates
- RAS updates
- PSP 12 cleanups

amdkfd:
- Update error messages for SDMA
- Userptr updates

drm:
- Add drm_file_err function

dma-buf:
- Add a helper to sort and deduplicate dma_fence arrays

----------------------------------------------------------------
Alex Deucher (9):
      Revert "drm/amd: Stop evicting resources on APUs in suspend"
      drm/amdgpu: fix pm notifier handling
      drm/amdgpu/psp: mark securedisplay TA as optional
      Revert "drm/amdgpu: Use generic hdp flush function"
      drm/amdgpu/hdp4: use memcfg register to post the write for HDP flush
      drm/amdgpu/hdp5: use memcfg register to post the write for HDP flush
      drm/amdgpu/hdp5.2: use memcfg register to post the write for HDP flush
      drm/amdgpu/hdp6: use memcfg register to post the write for HDP flush
      drm/amdgpu/hdp7: use memcfg register to post the write for HDP flush

Alex Hung (2):
      drm/amd/display: Remove redundant null check
      drm/amd/display: Remove unnecessary DC_FP_START/DC_FP_END

Arvind Yadav (2):
      dma-fence: Add helper to sort and deduplicate dma_fence arrays
      drm/amdgpu: only keep most recent fence for each context

Aurabindo Pillai (1):
      drm/amd/display: more liberal vmin/vmax update for freesync

Austin Zheng (1):
      drm/amd/display: Call FP Protect Before Mode Programming/Mode Support

Bhuvanachandra Pinninti (1):
      drm/amd/display: Refactoring DSC enum dsc_bits_per_comp.

Charlene Liu (2):
      drm/amd/display: allow dscclk disable
      drm/amd/display: disable DPP RCG before DPP CLK enable

Dillon Varone (2):
      drm/amd/display: Refactor SubVP cursor limiting logic
      drm/amd/display: Only wait for required free space in DMUB mailbox

Dominik Kaszewski (1):
      drm/amd/display: Prepare for Fused I2C-over-AUX

Dr. David Alan Gilbert (3):
      drm/amd/pm/smu7: Remove unused smu7_copy_bytes_from_smc
      drm/amd/pm/smu11: Remove unused smu_v11_0_get_dpm_level_range
      drm/amd/pm/smu13: Remove unused smu_v3 functions

Ellen Pan (4):
      drm/amdgpu: Add Runtime Bad Page message definitions for VFs
      drm/amdgpu: Implement Runtime Bad Page query for VFs
      drm/amdgpu: Add unrecoverable error message definitions for VFs
      drm/amdgpu: Implement unrecoverable error message handling for VFs

Eric Huang (1):
      drm/amdkfd: change error to warning message for SDMA queues creation

Harry Wentland (1):
      drm/amd/display: Don't check for NULL divisor in fixpt code

Huang Rui (3):
      drm/amdgpu: remove mdelay in psp v12
      drm/amdgpu: remove re-route ih in psp v12
      drm/amdgpu: cleanup sriov function for psp v12

Ivan Shamliev (1):
      drm/amd/display: Use true/false for boolean variables in DML2 core files

James Flowers (1):
      drm/amd/display: adds kernel-doc comment for dc_stream_remove_writeback()

Jesse Agate (1):
      drm/amd/display: Always Scale Flag

JinZe Xu (1):
      drm/amd/display: Send IPSExit unconditionally.

Kevin Gao (1):
      drm/amd/display: Add skip rIOMMU dc config option

Lijo Lazar (1):
      Reapply: drm/amdgpu: Use generic hdp flush function

Mario Limonciello (3):
      drm/amd: Add per-ring reset for vcn v4.0.5 use
      drm/amd: Add per-ring reset for vcn v4.0.0 use
      drm/amd: Add per-ring reset for vcn v5.0.0 use

Meenakshikumar Somasundaram (1):
      drm/amd/display: Assign preferred stream encoder instance to dpia

Nicholas Kazlauskas (1):
      Revert "drm/amd/display: turn off eDP lcdvdd and backlight if not required"

Ovidiu Bunea (1):
      drm/amd/display: Update IPS sequential_ono requirement checks

Prike Liang (3):
      drm/amdgpu: fix the eviction fence dereference
      drm/amdgpu: promote the implicit sync to the dependent read fences
      drm/amdgpu: unreserve the gem BO before returning from attach error

Rodrigo Siqueira (2):
      drm/amdgpu: Add documentation to some parts of the AMDGPU ring and wb
      Documentation/gpu: Add new entries to amdgpu glossary

Roman Li (1):
      drm/amd/display: Fix invalid context error in dml helper

Ruijing Dong (1):
      drm/amdgpu/vcn: using separate VCN1_AON_SOC offset

Ryan Seto (1):
      Revert "drm/amd/display: Refactor SubVP cursor limiting logic"

Shane Xiao (2):
      drm/amdgpu: Add debug bit for userptr usage
      amd/amdkfd: Trigger segfault for early userptr unmmapping

Srinivasan Shanmugam (1):
      drm/amdgpu: Add Support for enforcing isolation without Cleaner Shader

Sunil Khatri (6):
      drm: add drm_file_err function to add process info
      drm/amdgpu: add drm_file reference in userq_mgr
      drm/amdgpu: use drm_file_err in fence timeouts
      drm/amdgpu: change DRM_ERROR to drm_file_err in amdgpu_userq.c
      drm/amdgpu: change DRM_DBG_DRIVER to drm_dbg_driver
      drm/amdgpu: fix the indentation

Taimur Hassan (3):
      drm/amd/display: Promote DC to 3.2.330
      drm/amd/display: [FW Promotion] Release 0.1.8.0
      drm/amd/display: Promote DC to 3.2.331

Wayne Lin (5):
      drm/amd/display: Shift DMUB AUX reply command if necessary
      drm/amd/display: Fix the checking condition in dmub aux handling
      drm/amd/display: Remove incorrect checking in dmub aux handler
      drm/amd/display: Copy AUX read reply data whenever length > 0
      drm/amd/display: Fix wrong handling for AUX_DEFER case

 Documentation/gpu/amdgpu/amdgpu-glossary.rst       |  33 +++++++
 drivers/dma-buf/dma-fence-unwrap.c                 |  51 ++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  56 ++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |  18 ----
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  12 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  39 ++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  19 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |  18 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.c            |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |  74 +++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c           |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          |  83 +++++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h          |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c    |   6 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |  13 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |   4 +
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   9 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v5_2.c              |  12 ++-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |  63 +++++++++----
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.h              |   4 +
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |  62 ++++++++++++-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.h              |   4 +
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c             | 102 ++++-----------------
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |   1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |   1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |   1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |  21 ++++-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |  23 +++++
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c            |  20 +++-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  14 +--
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |  19 ++++
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   2 +
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |  11 ++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  41 ++++-----
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  28 +++++-
 drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c |   5 -
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   9 +-
 drivers/gpu/drm/amd/display/dc/core/dc_state.c     |  15 ++-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   8 ++
 drivers/gpu/drm/amd/display/dc/dc.h                |   3 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |  17 ++--
 drivers/gpu/drm/amd/display/dc/dc_fused_io.c       |  12 ++-
 .../gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c |  62 ++++++++-----
 .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.c  |   8 +-
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |  16 ++--
 .../dc/dml2/dml21/src/dml2_core/dml2_core_utils.c  |   8 +-
 .../amd/display/dc/dml2/dml2_translation_helper.c  |  14 +--
 .../gpu/drm/amd/display/dc/dpp/dcn35/dcn35_dpp.c   |   2 +-
 .../gpu/drm/amd/display/dc/dsc/dcn20/dcn20_dsc.c   |   7 --
 .../gpu/drm/amd/display/dc/dsc/dcn20/dcn20_dsc.h   |   6 ++
 .../gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.c |   6 --
 .../drm/amd/display/dc/hubbub/dcn21/dcn21_hubbub.c |   6 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |  21 +++--
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   1 -
 .../dc/link/protocols/link_edp_panel_control.c     |   2 -
 .../amd/display/dc/resource/dcn10/dcn10_resource.c |   4 +
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |   7 +-
 .../display/dc/resource/dcn321/dcn321_resource.c   |   1 +
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |   2 +-
 .../amd/display/dc/resource/dcn36/dcn36_resource.c |   2 +-
 .../display/dc/resource/dcn401/dcn401_resource.c   |   3 +-
 drivers/gpu/drm/amd/display/dc/sspl/dc_spl.c       |  25 ++---
 .../gpu/drm/amd/display/dc/sspl/spl_fixpt31_32.c   |   4 -
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |  19 ++++
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   6 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |  72 +++++++++++----
 .../gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.c  |  36 --------
 .../gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.h  |   2 -
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h       |   5 -
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |  12 ---
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |  39 --------
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     | 101 --------------------
 drivers/gpu/drm/drm_file.c                         |  34 +++++++
 include/drm/drm_file.h                             |   3 +
 include/linux/dma-fence-unwrap.h                   |   2 +
 83 files changed, 895 insertions(+), 616 deletions(-)
