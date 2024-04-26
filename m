Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B358B4211
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2024 00:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB67110E7BF;
	Fri, 26 Apr 2024 22:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xP47H8rY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2057.outbound.protection.outlook.com [40.107.243.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD2710E7BF;
 Fri, 26 Apr 2024 22:13:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iaHYNT5ud/ujGf25jp7wROBmfSSkpq7/D8VsAjY4NU+BOYjU2WeU7UOOIxa5x8cBEwPGYkAWAqWq1awb3dO0fcDWk3Q0MDBm/oCrDGOJsCzZp+ivdVdSJs8ZpBFK1UM7WeMSCvgY4mUEOMzcuPuSXoreYbkmnAMOc5igr47cjKxbdckvAEVTJXZrrZptk7+u/w5sYFkrEibQ4TP6i1ajYNS2GI74jM7qTm9oOo88kk4vQBf/2NGyhJ1GzEuVmdzqjq3lHBUj9trMDnKB2zcR3xfmew2jCx3/NQyGKj2Jk942q+zAJnRmusp13Lyp06evy+SKOd7GE27dGIVQsXxabQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aEVeEN2PCzcTvlJ8LMiwodSCISplQDrsYMjo94S8vq4=;
 b=LuGxa2siP1MLAttRti35whDqtv4u462vr8+QhBb8PD7e2DGk5Rd1Z5MPF/bZq/pJ6aM5xfCbTwSxJQ0r/lX7gbcHkiN4Rl+/uP3UUh+0EmslfKxR/mplKv8v53QB06YMs8aLvufxlwYcHrNCaQLIHjEdQJkM83TsovUxKNzd6cJBCjGpsLiiOBbFxuCWQr66qxMm2L8mM0DN7AOOerrOB3laE+QhA92124XOtCmgcC5DcFV9qdufV/MnoM5Y8ceCDmCAHaTvJbqGC2KdbieQl49ir7VFS3dJaaDogOdxkk+T4j/3QKQZXlgFw/jvG5LSXfA9t4DXenm1oA5TekyYSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aEVeEN2PCzcTvlJ8LMiwodSCISplQDrsYMjo94S8vq4=;
 b=xP47H8rYxkwBCm6XjDQ0Y9+NCnd17P7TKKWOefqDLpYxli6WqjDMPPi/nI7eKS0l7Y/9zWCYSFB64LVQHyc3G39bbr3RlPnqnt3l2//H8OtGu8qNa6+70EucPKYqIXWs9SpbNjZEBPN9zsyv3hjpSc+p/4srbZvTx4huNGhQ4w4=
Received: from SJ0PR13CA0117.namprd13.prod.outlook.com (2603:10b6:a03:2c5::32)
 by SA1PR12MB6726.namprd12.prod.outlook.com (2603:10b6:806:255::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.31; Fri, 26 Apr
 2024 22:13:02 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::66) by SJ0PR13CA0117.outlook.office365.com
 (2603:10b6:a03:2c5::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.18 via Frontend
 Transport; Fri, 26 Apr 2024 22:13:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Fri, 26 Apr 2024 22:13:01 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 26 Apr
 2024 17:13:00 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-next-6.10
Date: Fri, 26 Apr 2024 18:12:45 -0400
Message-ID: <20240426221245.1613332-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|SA1PR12MB6726:EE_
X-MS-Office365-Filtering-Correlation-Id: 46676256-3323-4f2b-0f26-08dc663e0a00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|82310400014|36860700004|1800799015; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Go5vMRoE2b/Jj+a3uyZPbBt9RdWhgtNq1ZbFhDWTV827O6BoqArXlvcfKXIU?=
 =?us-ascii?Q?FWQJ47MZ2d99a/p52nsfb9nn8x573A4iatgz5ocyDam2LA2NY11p30gdkipQ?=
 =?us-ascii?Q?Zq4BNLqNx6g3okt86eJvx1v5C+Kon/VN89ayfccUCqxv5f5lDbRWeNQ4Ga40?=
 =?us-ascii?Q?allDJ/9BRPy4TX3QWK1T4I7N0+w3BcJ2kvUiiV8eoulD2A94SnVxNQDZ5BHJ?=
 =?us-ascii?Q?tcmrP/qHeCOM0W9x2W1onYnhwu/XHB6PPXufEke6uneik7izr4AbHsaWUKfC?=
 =?us-ascii?Q?JnxLaAMPieRIU72OQGDHNN40dbQXiDxSeL23UXKmC6B+rQiYhWCpdIt/XDQH?=
 =?us-ascii?Q?5nXeJ0fY29CQjurHet+thFLdrV3wBWIrpHWH6toMiGEW3t54lZ2gjg2ogCdF?=
 =?us-ascii?Q?mazpHMKX8OLOJOaX5Oar4PspvDzAzuCXKD6mbFf+eCESXswryxqX7NT2e+W1?=
 =?us-ascii?Q?0dbu5iG8NLwXghGozgGQnVbRmqNIa4fvtGNhQ+irjlJgO6AWrM1ajNf3+sE6?=
 =?us-ascii?Q?/vMD0U6kW/qgBxWA9Wv2MA4aorGFAjnSAnv/Q4EhUWEi0B+dp/FwN8dCZWaI?=
 =?us-ascii?Q?FpgKBACaQtg+BzqaAJmDYYUyL0cGVXgcdLYO0rdynftTKUnoIoHuoEmsck97?=
 =?us-ascii?Q?g41DDmljrV9air5bF5NSFXNwevC9O689qGTEGmME4KGvzHm9guFAp5yOZxsw?=
 =?us-ascii?Q?b/eMuTMvg2h+w7hc1SynxQGPTP+oNEl4cgcMjP6jEgCz8Fueeuhh/c/FQa/L?=
 =?us-ascii?Q?w2K+vGuzldqYZVAiS0TLoHdjOuhRsPQbiHHm06C5vPrb/R2WEV3uyYuezLsk?=
 =?us-ascii?Q?S4ksste/OiMN6zJQI4XmDmQcBNa0dkXrVEjkm7SD0y/3YpudTI11VMhNrKCD?=
 =?us-ascii?Q?Xw9zMWl8Cevs+rLcVJQrgHpP9GxQP50xse6XcWNz0jHQ3Nhm+GjNN5nJQyyU?=
 =?us-ascii?Q?zOyWaY2KqJ/+ruNDCMC5Fpj9cnJu5N7zzm8D8LGLSc8lzk+TIyziKBtMIrus?=
 =?us-ascii?Q?mexDarxdg92fdqqfpOhQ+dzrv9NAdRpa8yzayPbACHNyXzvv4dyl7DygJ73X?=
 =?us-ascii?Q?r00T8D+iFLP8eGcv6EW1Tv7+VIkDjvAQd9w/OthptWLsS8msFvpcl7hMnSXF?=
 =?us-ascii?Q?bNTbC7nUXGfVIR29uxih3AfikPH3clQVIICzUz5ymfEZ3BDPMOIc6Siuwzhu?=
 =?us-ascii?Q?tFT295dVTk1vKxA4UIqcwIPhyD4gxs6esjCQk1Hy3BR1hwojL78X862fcSS/?=
 =?us-ascii?Q?gKCHRYs690l+g8yELoMoiEMlu1K/qnipMeetdfXTKodXn6eYvKTdU078oTkK?=
 =?us-ascii?Q?nWmWhWdHg5tyUwGMrV6sFTpD?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 22:13:01.8424 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46676256-3323-4f2b-0f26-08dc663e0a00
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6726
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

More new stuff for 6.10.

The following changes since commit 0208ca55aa9c9b997da1f5bc45c4e98916323f08:

  Backmerge tag 'v6.9-rc5' into drm-next (2024-04-22 14:35:52 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.10-2024-04-26

for you to fetch changes up to b77bef36015c501f1e0f51db72c55e6dcd8bdd48:

  drm/amd/display: Add some HDCP registers DCN35 list (2024-04-26 17:22:45 -0400)

----------------------------------------------------------------
amd-drm-next-6.10-2024-04-26:

amdgpu:
- Misc code cleanups and refactors
- Support setting reset method at runtime
- Report OD status
- SMU 14.0.1 fixes
- SDMA 4.4.2 fixes
- VPE fixes
- MES fixes
- Update BO eviction priorities
- UMSCH fixes
- Reset fixes
- Freesync fixes
- GFXIP 9.4.3 fixes
- SDMA 5.2 fixes
- MES UAF fix
- RAS updates
- Devcoredump updates for dumping IP state
- DSC fixes
- JPEG fix
- Fix VRAM memory accounting
- VCN 5.0 fixes
- MES fixes
- UMC 12.0 updates
- Modify contiguous flags handling
- Initial support for mapping kernel queues via MES

amdkfd:
- Fix rescheduling of restore worker
- VRAM accounting for SVM migrations
- mGPU fix
- Enable SQ watchpoint for gfx10

----------------------------------------------------------------
Alex Deucher (5):
      drm/amdkfd: demote unsupported device messages to dev_info
      drm/amdgpu/mes11: print MES opcodes rather than numbers
      drm/amdgpu/sdma5.2: use legacy HDP flush for SDMA2/3
      drm/amdgpu: add a spinlock to wb allocation
      drm/amdgpu/mes11: Use a separate fence per transaction

Alex Hung (9):
      drm/amd/display: Check index msg_id before read or write
      drm/amd/display: Check pipe offset before setting vblank
      drm/amd/display: Skip finding free audio for unknown engine_id
      drm/amd/display: Do not return negative stream id for array
      drm/amd/display: ASSERT when failing to find index by plane/stream id
      drm/amd/display: Remove redundant include file
      drm/amd/display: Fix uninitialized variables in DM
      drm/amd/display: Fix uninitialized variables in DC
      drm/amd/display: Fix uninitialized variables in DC

Arunpravin Paneer Selvam (1):
      drm/amdgpu: Modify the contiguous flags behaviour

Bob Zhou (3):
      drm/amdgpu: add error handle to avoid out-of-bounds
      drm/amdgpu: add return result for amdgpu_i2c_{get/put}_byte
      drm/amdgpu: fix double free err_addr pointer warnings

David Tadokoro (1):
      drm/amd/display: Remove duplicated function signature from dcn3.01 DCCG

Dmytro Laktyushkin (1):
      drm/amd/display: Increase SAT_UPDATE_PENDING timeout

Felix Kuehling (2):
      drm/amdgpu: Update BO eviction priorities
      drm/amdkfd: Fix rescheduling of restore worker

Frank Min (1):
      drm/amdgpu: replace tmz flag into buffer flag

George Shen (1):
      drm/amd/display: Handle Y carry-over in VCP X.Y calculation

Harish Kasiviswanathan (1):
      drm/amdkfd: Enforce queue BO's adev

Hersen Wu (2):
      drm/amd/display: Add NULL pointer check for kzalloc
      drm/amd/display: Fix overlapping copy within dml_core_mode_programming

Jack Xiao (3):
      drm/amdgpu/mes: fix use-after-free issue
      drm/amdgpu/mes: add mes mapping legacy queue support
      drm/amdgpu/mes11: update ADD_QUEUE interface

Jesse Zhang (4):
      drm/amdgpu: Using uninitialized value *size when calling amdgpu_vce_cs_reloc
      drm/amdgpu: add check before free wb entry
      drm/amdgpu: initialize the last_jump_jiffies in atom_exec_context
      drm/amdgpu: fix the warning about the expression (int)size - len

Jiapeng Chong (1):
      drm/amd/display: Remove duplicate dcn32/dcn32_clk_mgr.h header

Jose Fernandez (1):
      drm/amd/display: Fix division by zero in setup_dsc_config

Lancelot SIX (1):
      drm/amdkfd: Enable SQ watchpoint for gfx10

Lang Yu (1):
      drm/amdgpu/umsch: don't execute umsch test when GPU is in reset/suspend

Le Ma (1):
      drm/amdgpu: init microcode chip name from ip versions

Li Ma (1):
      drm/amd/swsmu: add if condition for smu v14.0.1

Lijo Lazar (2):
      drm/amdgpu: Assign correct bits for SDMA HDP flush
      drm/amd/pm: Restore config space after reset

Ma Jun (4):
      drm/amdgpu/pm: Remove gpu_od if it's an empty directory
      drm/amdgpu/pm: Print od status info
      drm/amdgpu: Fix uninitialized variable warnings
      drm/amdgpu: Initialize timestamp for some legacy SOCs

Melissa Wen (1):
      drm/amd/display: use mpcc_count to log MPC state

Mukul Joshi (2):
      drm/amdkfd: Add VRAM accounting for SVM migration
      drm/amdgpu: Fix VRAM memory accounting

Peyton Lee (1):
      drm/amdgpu/vpe: fix vpe dpm setup failed

Pierre-Eric Pelloux-Prayer (1):
      drm/amdgpu/vcn: fix unitialized variable warnings

Prike Liang (1):
      drm/amdgpu: Fix the ring buffer size for queue VM flush

Rajneesh Bhardwaj (1):
      drm/amdgpu: Update CGCG settings for GFXIP 9.4.3

Rodrigo Siqueira (9):
      Revert "drm/amd/display: Add fallback configuration when set DRR"
      drm/amd/display: Add missing debug registers for DCN2/3/3.1
      drm/amd/display: Add missing dwb registers
      drm/amd/display: Add TMDS DC balancer control
      drm/amd/display: Add some missing HDMI registers for DCN3x
      drm/amd/display: Clean up code in DC
      drm/amd/display: Adjust registers sequence in the DIO list
      drm/amd/display: Code style adjustments
      drm/amd/display: Add some HDCP registers DCN35 list

Sathishkumar S (1):
      drm/amdgpu: update jpeg max decode resolution

Sonny Jiang (1):
      drm/amdgpu: update fw_share for VCN5

Srinivasan Shanmugam (3):
      drm/amdgpu: Fix snprintf buffer size in smu_v14_0_init_microcode
      drm/amd/display: Remove unnecessary NULL check in dcn20_set_input_transfer_func
      drm/amdgpu: Fix buffer size in gfx_v9_4_3_init_ cp_compute_microcode() and rlc_microcode()

Stanley.Yang (1):
      drm/amdgpu: Support setting reset_method at runtime

Sunil Khatri (7):
      drm/amdgpu: add prototype for ip dump
      drm/amdgpu: add support of gfx10 register dump
      drm/amdgpu: add protype for print ip state
      drm/amdgpu: add support for gfx v10 print
      drm/amdgpu: dump ip state before reset for each ip
      drm/amdgpu: add ip dump for each ip in devcoredump
      drm/amdgpu: skip ip dump if devcoredump flag is set

Tim Huang (1):
      drm/amdgpu: fix uninitialized scalar variable warning

YiPeng Chai (16):
      drm/amdgpu: Add interface to reserve bad page
      drm/amdgpu: add message fifo to handle RAS poison events
      drm/amdgpu: prepare for logging ecc errors
      drm/amdgpu: add poison creation handler
      drm/amdgpu: add interface to update umc v12_0 ecc status
      drm/amdgpu: umc v12_0 converts error address
      drm/amdgpu: umc v12_0 logs ecc errors
      drm/amdgpu: Add delay work to retire bad pages
      drm/amdgpu: add condition check for amdgpu_umc_fill_error_record
      drm/amdgpu: retire bad pages for umc v12_0
      drm/amdgpu: prepare to handle pasid poison consumption
      drm/amdgpu: add poison consumption handler
      drm/amdgpu: support ACA logging ecc errors
      drm/amdgpu: Fix address translation defect
      drm/amdgpu: Use new interface to reserve bad page
      drm/amdgpu: Fix ras mode2 reset failure in ras aca mode

 drivers/gpu/drm/amd/amdgpu/aldebaran.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   9 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c |  71 ++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c      |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c   |  14 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c            |  47 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |   8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |  35 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |  18 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            | 239 ++++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |  47 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            | 119 +++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |  19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c       |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |  10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |  23 +-
 drivers/gpu/drm/amd/amdgpu/atom.c                  |   1 +
 drivers/gpu/drm/amd/amdgpu/cik.c                   |   2 +
 drivers/gpu/drm/amd/amdgpu/cik_ih.c                |   2 +
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c              |   6 +-
 drivers/gpu/drm/amd/amdgpu/cz_ih.c                 |   2 +
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |   2 +
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |   2 +
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |   2 +
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |   2 +
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             | 148 ++++++++++++-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   5 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c              |   2 +
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |   2 +
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |   2 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  18 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |   2 +
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |   2 +
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |   2 +
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c            |   2 +
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c               |   2 +
 drivers/gpu/drm/amd/amdgpu/ih_v6_1.c               |   2 +
 drivers/gpu/drm/amd/amdgpu/ih_v7_0.c               |   2 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |   2 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |   4 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |   2 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |   2 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |   2 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           |   2 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c           |   2 +
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c             |   2 +
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             | 101 ++++++++-
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c             |   2 +
 drivers/gpu/drm/amd/amdgpu/nv.c                    |   8 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |   9 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |   9 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |   9 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |  35 +--
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |   9 +-
 drivers/gpu/drm/amd/amdgpu/si.c                    |   2 +
 drivers/gpu/drm/amd/amdgpu/si_dma.c                |   6 +-
 drivers/gpu/drm/amd/amdgpu/si_ih.c                 |   2 +
 drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c        |   2 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   6 +-
 drivers/gpu/drm/amd/amdgpu/soc15.h                 |   2 +
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |   6 +-
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c              |   2 +
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             | 219 ++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.h             |  15 ++
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c              |   2 +
 drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c              |   2 +
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c              |   2 +
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c              |   2 +
 drivers/gpu/drm/amd/amdgpu/vce_v2_0.c              |   2 +
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c              |   2 +
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |   2 +
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |   2 +
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |   4 +
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |   3 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   3 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |   2 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |   3 +
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c            |  17 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |   2 +
 drivers/gpu/drm/amd/amdgpu/vpe_v6_1.c              |  14 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   5 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |  20 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  10 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |   4 +-
 .../gpu/drm/amd/display/dc/bios/command_table.c    |   2 +-
 .../gpu/drm/amd/display/dc/bios/command_table2.c   |   2 +-
 .../amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c   |   8 +
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |   9 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   4 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  12 +-
 .../drm/amd/display/dc/dcn20/dcn20_link_encoder.h  |   5 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dccg.h  |   3 +
 .../amd/display/dc/dcn30/dcn30_dio_link_encoder.h  |   3 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb.h   |  14 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c   |   2 +-
 .../gpu/drm/amd/display/dc/dcn301/dcn301_dccg.h    |   6 -
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.h  |   6 +
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.h  |   2 +
 .../display/dc/dcn31/dcn31_hpo_dp_link_encoder.c   |   8 +-
 .../amd/display/dc/dcn32/dcn32_dio_link_encoder.c  |   6 +-
 .../amd/display/dc/dcn32/dcn32_dio_link_encoder.h  |  10 +-
 .../display/dc/dcn32/dcn32_dio_stream_encoder.h    |   5 +-
 .../display/dc/dcn321/dcn321_dio_link_encoder.c    |   8 +-
 .../amd/display/dc/dcn35/dcn35_dio_link_encoder.h  |  12 +-
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |   3 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |   4 +-
 .../gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c   |   2 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |   2 +-
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |   4 +-
 .../drm/amd/display/dc/dml2/display_mode_core.c    |   4 +-
 .../amd/display/dc/dml2/dml2_dc_resource_mgmt.c    |   8 +-
 .../amd/display/dc/dml2/dml2_translation_helper.c  |   4 +-
 .../drm/amd/display/dc/dpp/dcn10/dcn10_dpp_cm.c    |   2 +-
 .../drm/amd/display/dc/dpp/dcn20/dcn20_dpp_cm.c    |   2 +-
 .../drm/amd/display/dc/dpp/dcn30/dcn30_dpp_cm.c    |   2 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |   7 +-
 drivers/gpu/drm/amd/display/dc/gpio/gpio_service.c |   6 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |   4 +-
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |   8 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |  10 +-
 .../drm/amd/display/dc/hwss/dcn201/dcn201_hwseq.c  |   2 +-
 .../drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c    |   2 +-
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |   2 +-
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    |   2 +-
 .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c  |   2 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |   4 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |   2 +-
 .../gpu/drm/amd/display/dc/inc/hw/link_encoder.h   |   3 +-
 .../amd/display/dc/irq/dce110/irq_service_dce110.c |   8 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |   4 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |   8 +-
 .../display/dc/link/protocols/link_dp_capability.c |  16 +-
 .../dc/link/protocols/link_dp_irq_handler.c        |  10 +-
 .../display/dc/link/protocols/link_dp_training.c   |   2 +-
 .../dc/link/protocols/link_edp_panel_control.c     |   4 +-
 .../drm/amd/display/dc/link/protocols/link_hpd.c   |   2 +-
 .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c |  11 +-
 .../amd/display/dc/resource/dcn20/dcn20_resource.c |  11 +-
 .../amd/display/dc/resource/dcn30/dcn30_resource.c |   3 +
 .../display/dc/resource/dcn303/dcn303_resource.c   |   2 +-
 .../amd/display/dc/resource/dcn31/dcn31_resource.c |   5 +
 .../display/dc/resource/dcn314/dcn314_resource.c   |   5 +
 .../display/dc/resource/dcn315/dcn315_resource.c   |   2 +
 .../display/dc/resource/dcn316/dcn316_resource.c   |   2 +
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |   5 +
 .../display/dc/resource/dcn321/dcn321_resource.c   |   2 +
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |   2 +
 .../display/dc/resource/dcn351/dcn351_resource.c   |   2 +
 drivers/gpu/drm/amd/display/include/dal_types.h    |   1 -
 .../gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c    |   8 +
 drivers/gpu/drm/amd/include/amd_shared.h           |   3 +
 .../amd/include/asic_reg/dcn/dcn_3_0_0_offset.h    |   4 +
 .../amd/include/asic_reg/dcn/dcn_3_0_0_sh_mask.h   |   5 +
 .../amd/include/asic_reg/dcn/dcn_3_1_5_offset.h    |   4 +
 .../amd/include/asic_reg/dcn/dcn_3_1_5_sh_mask.h   |  10 +
 .../amd/include/asic_reg/dpcs/dpcs_3_0_0_offset.h  |  24 +++
 .../amd/include/asic_reg/dpcs/dpcs_3_0_0_sh_mask.h |   4 +-
 .../drm/amd/include/asic_reg/gc/gc_10_1_0_offset.h |  12 ++
 drivers/gpu/drm/amd/include/mes_v11_api_def.h      |  17 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   9 +
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c         |   2 +
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |   2 +
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |   2 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  30 +++
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |  14 +-
 189 files changed, 1735 insertions(+), 317 deletions(-)
