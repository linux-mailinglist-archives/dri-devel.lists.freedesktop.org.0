Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE63A57360
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 22:11:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB9A10EC3D;
	Fri,  7 Mar 2025 21:11:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4cDWDngE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9853110EC3D;
 Fri,  7 Mar 2025 21:11:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xOQAZIymYW7hORklo0SVn5orWvpT+DRrqYc1rdBecjDGNPEj0XqtmBWoRUNRNjF6JYLl9iEZjhZHbfc9BnuUeUcVhOvOchiO22uOLK1zJx59j0c5ZygtMUrVcgBxE9GAPIVP4/L/FK2ai44UVlJP18zYhAsQFGJFNxrIHIgaGuMPiB/KV/qqJ6HllU0TJMZM0sWl+ZdejL/nVGi3aWRlefsbYWNybkQZ5SQsQ1b7q3EmPHJbyDg38leYYGGifVM1y76s/gzp2EE0YiqRrCSP0mpjLt9Yl13XAzE3FeFFKX75yCZ3W8Dd1Yn8h9cXF71Qt7e0TJ3a90kZwcep//0o8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMOldcJ+IT+jaIeDaOxQoY9rsb2PnKphqvIohjiDRog=;
 b=dVdKsO3RHzu75D0TXNcyrlzvivHObyBo2n4LexjKepDVV1CjLauZwKtqaLpoNkLXTmE3c48sxoLuq8KfGXehYhzJcbam/d4Ut4IHVUc/y2YLAMyMhfPg/AUkJyKJDLmIOBwVwf98R9F3FULBEbFExnnRxtRoPObG3bCEQ7EpIgfbcjPD8VTs8AsfrPLQrmnVNwvzoMrzOwsChNz2nX1ybnTsI9B3X+YhXih5miIN4QwfWz7XqfFPaK8A2CgnRmus4xqiKHmZvshDYjPar/ta8RkQrqKyFXKK0ntVx9XJlGHlX50iPQB8lxq0rD6F8+mCXyFVIdj7hogu4zJPDJ0OKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XMOldcJ+IT+jaIeDaOxQoY9rsb2PnKphqvIohjiDRog=;
 b=4cDWDngEG48tB9OJ/beC9KDzi+8eF+7BV+6lpEp54KD+q4T/UEgoA+mC/GB+TeXZukyvshKwVYuM2iOPi1ma+3qtfuo30deC5vljTN1a0rkItzQ6AGzKDe/rjNxbWWfqqSybVHMUtGcNnM7EN27In0kiXwAzip1iQkvnlHQCGB0=
Received: from DM6PR08CA0056.namprd08.prod.outlook.com (2603:10b6:5:1e0::30)
 by CY8PR12MB7489.namprd12.prod.outlook.com (2603:10b6:930:90::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Fri, 7 Mar
 2025 21:11:07 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:5:1e0:cafe::27) by DM6PR08CA0056.outlook.office365.com
 (2603:10b6:5:1e0::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.22 via Frontend Transport; Fri,
 7 Mar 2025 21:11:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Fri, 7 Mar 2025 21:11:07 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 7 Mar
 2025 15:11:05 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd, radeon, UAPI drm-next-6.15
Date: Fri, 7 Mar 2025 16:10:51 -0500
Message-ID: <20250307211051.1880472-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|CY8PR12MB7489:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c956779-3689-4cf4-d20a-08dd5dbc9408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EBUYCa761V6dYriU2irG5qLPA73hqUpxRSBgfmzitSmHM/k2W67jYGsYmUM1?=
 =?us-ascii?Q?zfA3988ASA/oTXVfNkCb1n06+3ftLzGBukhl0WLuOoWuIWyi5c0Rg+Vq2UzF?=
 =?us-ascii?Q?cfLqiy8A0v3y0gaz1gil3ur8n//SyCt1T1EgcxVSFJDUSgmo92TIgK22cVER?=
 =?us-ascii?Q?znt8MhEzKBWMELBv72p9CPgh/NaA6cGuiLqN5fGJ++7H8746xjYmn+Bbft66?=
 =?us-ascii?Q?fxC0wFqGhIVnGAtyBie88wsq1b/wA8VPtBZfR5yBAZFTWxHXyDeNIgvwiNDE?=
 =?us-ascii?Q?tYkoz/d9dsHeBTwGPXKQ0MWiQEaWKpmp1anzoqubstQ9DdcK/eKObUILs2pV?=
 =?us-ascii?Q?+lqhZpAkqfmDUeF6ITtDdp2kz7Dapc3mmbEb2iCOfyyRcuzZtGJsVCquwfT0?=
 =?us-ascii?Q?ZtGwJGHvu2MwfD0RHs6SkhOJMSCxK1JEKTJ8k2gj7KvMJjrh3e0XVIl+0fUA?=
 =?us-ascii?Q?pahZOX1qcYn2+wGykmKSbIkXJhGg++kMT3MDHq7QdvfT9WvMIelw7J0WEZAk?=
 =?us-ascii?Q?CpLklMwXyBHvZQlU3Am+CVJJ9ugQ333IK2CvTQKW9+7kLNv8PXkcYy8ouV91?=
 =?us-ascii?Q?IkJcf+jhA0RCc5uWCLTGARB+r//M2E1I2diKf3adFYEDpwe+tucMLQ4e9sex?=
 =?us-ascii?Q?5PNVZ/CWMLeZ/ke5wIUZW+FPMHZ9LizE/JEYiE7CSzhu0PwticUOVRY1/WFp?=
 =?us-ascii?Q?81G7NF/5/0quoQtKKd9QQzH7jmNkP97qw6jGIiutInDpQ3Divq2sVMTN8zKg?=
 =?us-ascii?Q?MjDp2tHMmRY62pdk0YeB2F8SmI2Au65iXH0XjnoX0tSR1CKyCsqajA1TWsBB?=
 =?us-ascii?Q?KTboSVMTEaYMVjOzNqvfONhqEl9cX0X4bASkfK0S8pyvxxX9l2CM5w5GBy4t?=
 =?us-ascii?Q?XA5oX3tBeDODwLMgumR2wT8LULs4aGMpH4JU11PgOK1f4KmQDPasu2tMXfcu?=
 =?us-ascii?Q?uUJ+ytFbBmRKIax7JuyBCGttqliTylshXnvKXDNj9yog2056t2ag/2IsCTFR?=
 =?us-ascii?Q?cA7A2Mq43L1seJCo4Xm9V82Fvxddd39Kidx6a0+5Wrj58gAaA2SWvy3HGm79?=
 =?us-ascii?Q?j//pnyLf2XEfx4WPDdAguUJ3kXPsP6IjvZbcX2+JcmO2vUKwmBD3cXL72ZxE?=
 =?us-ascii?Q?dClV2a7Er68I4rmkgt1iiDfGpgrMsh0xxEfNudcjlfTDa/QPVUE/5VaiCx2r?=
 =?us-ascii?Q?kxBnqKp9PdqhIERYBo9cbtIk00Ri01CSf/OtpCKGUly+33aylycqgP/SldbZ?=
 =?us-ascii?Q?MHSBGWYvgeKo9ZPknWkksTeMgPrwhauRXd/7n2hK6gRvAK/doGA1LetPXOa0?=
 =?us-ascii?Q?avxwqzNQSft0I2FTmz0q1Zrde+UzwoDvWH1gCAkIFVSqFDeuY0WmyyFiS3wV?=
 =?us-ascii?Q?AlxhrugUsMZkG/lSAqvq0faQyoxMt1VZZN1g/XDBNltRUFcAMfPLy98+emaB?=
 =?us-ascii?Q?YB4EiAH4P8c=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 21:11:07.4381 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c956779-3689-4cf4-d20a-08dd5dbc9408
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7489
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

More updates for 6.15.

The following changes since commit 7d83c129a8d7df23334d4a35bca9090a26b0a118:

  drm/amdgpu: Fix parameter annotation in vcn_v5_0_0_is_idle (2025-02-27 16:50:05 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.15-2025-03-07

for you to fetch changes up to cf6d949a409e09539477d32dbe7c954e4852e744:

  drm/amdkfd: Add support for more per-process flag (2025-03-07 15:33:49 -0500)

----------------------------------------------------------------
amdgpu:
- Fix spelling typos
- RAS updates
- VCN 5.0.1 updates
- SubVP fixes
- DCN 4.0.1 fixes
- MSO DPCD fixes
- DIO encoder refactor
- PCON fixes
- Misc cleanups
- DMCUB fixes
- USB4 DP fixes
- DM cleanups
- Backlight cleanups and fixes
- Support platform backlight curves
- Misc code cleanups
- SMU 14 fixes
- JPEG 4.0.3 reset updates
- SR-IOV fixes
- SVM fixes
- GC 12 DCC fixes
- DC DCE 6.x fix
- Hiberation fix

amdkfd:
- Fix possible NULL pointer in queue validation
- Remove unnecessary CP domain validation
- SDMA queue reset support
- Add per process flags

radeon:
- Fix spelling typos
- RS400 hyperZ fix

UAPI:
- Add KFD per process flags for setting precision
  Proposed user space: https://github.com/ROCm/ROCR-Runtime/commit/2a64fa5e06e80e0af36df4ce0c76ae52eeec0a9d

----------------------------------------------------------------
Alex Hung (1):
      drm/amd/display: Check NULL connector before it is used

Alex Sierra (1):
      drm/amdkfd: clear F8_MODE for gfx950

Alexandre Demers (7):
      drm/amdgpu: fix spelling typos
      drm/radeon: fix spelling typos
      drm/amdgpu: fix spelling typos in SI
      drm/amdgpu: add some comments in DCE6
      drm/amdgpu: fix style in DCE6
      drm/amdgpu: add dce_v6_0_soft_reset() to DCE6
      drm/amdgpu: add defines for pin_offsets in DCE8

Aliaksei Urbanski (1):
      drm/amd/display: fix missing .is_two_pixels_per_container

Andrew Martin (1):
      drm/amdkfd: Fix NULL Pointer Dereference in KFD queue

Aric Cyr (1):
      drm/amd/display: Request HW cursor on DCN3.2 with SubVP

Asad Kamal (2):
      drm/amdgpu: Set PG state to gating for vcn_v_5_0_1
      drm/amd/pm: Fix indentation issue

Aurabindo Pillai (2):
      drm/amd/display: Add workaround for a panel
      drm/amd/display: use drm_* instead of DRM_ in apply_edid_quirks()

Charles Han (1):
      drm/amdgpu: fix inconsistent indenting warning

Cruise Hung (1):
      drm/amd/display: Add tunneling IRQ handler

David Rosca (1):
      drm/amdgpu/display: Allow DCC for video formats on GFX12

Dillon Varone (2):
      drm/amd/display: Fix p-state type when p-state is unsupported
      drm/amd/display: Fix DMUB reset sequence for DCN401

Dr. David Alan Gilbert (6):
      drm/amdgpu: Remove ppatomfwctrl deadcode
      drm/amdgpu: Remove phm_powerdown_uvd
      drm/amdgpu: Remove powerdown_uvd member
      drm/amdgpu: Remove unused pre_surface_trace
      drm/amdgpu: Remove unused print__rq_dlg_params_st
      drm/amdgpu: Remove unused pqm_get_kernel_queue

Emily Deng (1):
      drm/amdgpu: Fix missing drain retry fault the last entry

George Shen (2):
      drm/amd/display: Skip checking FRL_MODE bit for PCON BW determination
      drm/amd/display: Remove unused struct definition

Hansen Dsouza (1):
      drm/amd/display: read mso dpcd caps

Harish Kasiviswanathan (3):
      drm/amdkfd: Set per-process flags only once cik/vi
      drm/amdkfd: Set per-process flags only once for gfx9/10/11/12
      drm/amdkfd: Add support for more per-process flag

James Zhu (1):
      drm/amdkfd: remove unnecessary cpu domain validation

Jesse.zhang@amd.com (1):
      drm/amdgpu: Update SDMA scheduler mask handling to include page queue

Jonathan Kim (3):
      drm/amdkfd: implement per queue sdma reset for gfx 9.4+
      drm/amdkfd: flag per-sdma queue reset supported to user space
      drm/amdkfd: remove unused debug gws support status variable

Kenneth Feng (1):
      drm/amd/pm: always allow ih interrupt from fw

Leo Zeng (1):
      drm/amd/display: Added visual confirm for DCC

Lijo Lazar (6):
      drm/amdgpu: Initialize RRMT status on VCN v5.0.1
      drm/amdgpu: Add offset normalization in VCN v5.0.1
      drm/amdgpu: Initialize RRMT status on JPEG v5.0.1
      drm/amdgpu: Avoid HDP flush on JPEG v5.0.1
      drm/amdgpu: Use the right struct for VCN v5.0.1
      drm/amdgpu: Reinit FW shared flags on VCN v5.0.1

Mario Limonciello (19):
      drm/amd/display: Change amdgpu_dm_irq_suspend() to void
      drm/amd/display: Drop `ret` variable from dm_suspend()
      drm/amd/display: Catch failures for amdgpu_dm_commit_zero_streams()
      drm/amd/display: Use _free() macro for amdgpu_dm_commit_zero_streams()
      drm/amd/display: Use drm_err() instead of DRM_ERROR in dm_resume()
      drm/amd/display: Use scoped guard for dm_resume()
      drm/amd/display: Change amdgpu_dm_irq_resume_*() to use drm_dbg()
      drm/amd/display: Change amdgpu_dm_irq_resume_*() to void
      drm/amd/display: Use _free(kfree) for dm_gpureset_commit_state()
      drm/amd/display: Use scoped guard for amdgpu_dm_update_connector_after_detect()
      drm/amd/display: Use _free() macro for amdgpu_dm_update_connector_after_detect()
      drm/amd/display: Use scoped guards for handle_hpd_irq_helper()
      drm/amd/display: Use drm_err() for handle_hpd_irq_helper()
      drm/amd: Copy entire structure in amdgpu_acpi_get_backlight_caps()
      drm/amd: Pass luminance data to amdgpu_dm_backlight_caps
      drm/amd/display: Avoid operating on copies of backlight caps
      drm/amd/display: Add support for custom brightness curve
      drm/amd/display: Add a new dcdebugmask to allow turning off brightness curve
      drm/amd: Keep display off while going into S4

Nicholas Kazlauskas (2):
      drm/amd/display: Revert "Increase halt timeout for DMCUB to 1s"
      drm/amd/display: Ensure DMCUB idle before reset on DCN31/DCN35

Peichen Huang (1):
      drm/amd/display: misc for dio encoder refactor

Richard Thier (1):
      drm/radeon: Fix rs400_gpu_init for ATI mobility radeon Xpress 200M

Sathishkumar S (2):
      drm/amdgpu: Fix core reset sequence for JPEG4_0_3
      drm/amdgpu: Fix core reset sequence for JPEG5_0_1

Shiwu Zhang (2):
      drm/amdgpu: retire ip init code specific for A0 rev
      drm/amdgpu: fix the gb_addr_config_fields init value mismatch

Srinivasan Shanmugam (1):
      drm/amdgpu: Fix annotation for dce_v6_0_line_buffer_adjust function

Taimur Hassan (1):
      drm/amd/display: Promote DAL to 3.2.323

Tao Zhou (1):
      drm/amdgpu: increase RAS bad page threshold

Tom St Denis (1):
      drm/amd/amdgpu: Add missing GC 11.5.0 register

Tony Yi (2):
      drm/amdgpu: Update headers for CPER support on SRIOV
      drm/amdgpu: Add support for CPERs on virtualization

Victor Lu (3):
      drm/amdgpu: Do not program AGP BAR regs under SRIOV in gfxhub_v1_0.c
      drm/amdgpu: Do not write to GRBM_CNTL if Aldebaran SRIOV
      drm/amdgpu: Do not set power brake sequence for Aldebaran SRIOV

Vitaliy Shevtsov (1):
      drm/amd/display: fix type mismatch in CalculateDynamicMetadataParameters()

Wentao Liang (1):
      drm/amdgpu: handle amdgpu_cgs_create_device() errors in amd_powerplay_create()

Xiang Liu (2):
      drm/amdgpu: Free CPER entry after committing to ring
      drm/amdgpu: Use unique CPER record id across devices

 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |  10 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c   |   1 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c    |   3 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c    |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h |   2 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c   |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12.c |   7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |  16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h  |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   6 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c           |  21 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.h             |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |  31 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |  58 +++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           | 138 +++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |  18 +-
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |  40 ++--
 drivers/gpu/drm/amd/amdgpu/cikd.h                  |   9 +
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |  87 +++++++--
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |  14 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   8 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  19 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c           |  10 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |  16 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.h           |   1 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c           |  18 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.h           |   5 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |  14 ++
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.h              |   2 +
 drivers/gpu/drm/amd/amdgpu/si.c                    |   6 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c              |   6 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c              |   3 +-
 drivers/gpu/drm/amd/amdgpu/vce_v2_0.c              |   2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |  14 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.h            |   9 +
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c            |  74 +++++---
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.h            |   3 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   3 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  | 173 ++++++++++++------
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.h  |   6 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager_cik.c  |  75 +++++---
 .../drm/amd/amdkfd/kfd_device_queue_manager_v10.c  |  43 +++--
 .../drm/amd/amdkfd/kfd_device_queue_manager_v11.c  |  43 +++--
 .../drm/amd/amdkfd/kfd_device_queue_manager_v12.c  |  43 +++--
 .../drm/amd/amdkfd/kfd_device_queue_manager_v9.c   |  46 ++++-
 .../drm/amd/amdkfd/kfd_device_queue_manager_vi.c   |  77 +++++---
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   3 -
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |  13 --
 drivers/gpu/drm/amd/amdkfd/kfd_queue.c             |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   5 +
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h          |   1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 201 ++++++++++++---------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |  20 ++
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  16 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  |  14 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.h  |   6 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   3 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |   7 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |  20 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  14 +-
 drivers/gpu/drm/amd/display/dc/core/dc_debug.c     | 120 ------------
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |  49 +++++
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   5 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   3 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   3 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |  50 +++--
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   1 +
 .../amd/display/dc/dce60/dce60_timing_generator.c  |   1 +
 .../display/dc/dio/dcn35/dcn35_dio_link_encoder.c  |  50 ++++-
 .../display/dc/dio/dcn35/dcn35_dio_link_encoder.h  |  23 +++
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |  12 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |   1 +
 .../amd/display/dc/dml/display_rq_dlg_helpers.c    |  11 --
 .../amd/display/dc/dml/display_rq_dlg_helpers.h    |   1 -
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    |   3 +-
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |   5 +
 .../drm/amd/display/dc/link/hwss/link_hwss_dio.c   |   5 +-
 .../drm/amd/display/dc/link/hwss/link_hwss_dpia.c  |  40 ++--
 .../gpu/drm/amd/display/dc/link/link_detection.c   |   5 +-
 .../display/dc/link/protocols/link_dp_capability.c |  41 +++--
 .../display/dc/link/protocols/link_dp_dpia_bw.c    |  26 +++
 .../display/dc/link/protocols/link_dp_dpia_bw.h    |  10 +
 .../dc/link/protocols/link_dp_irq_handler.c        |  43 ++++-
 .../display/dc/link/protocols/link_dp_training.c   |   3 +-
 .../dc/link/protocols/link_dp_training_dpia.c      |  13 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |   4 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c  |   4 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.c |  47 +++--
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.h |   3 +-
 .../gpu/drm/amd/display/include/logger_interface.h |   5 -
 drivers/gpu/drm/amd/include/amd_acpi.h             |   4 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |   4 +
 .../drm/amd/include/asic_reg/gc/gc_11_5_0_offset.h |   2 +
 .../drm/amd/include/asic_reg/gc/gc_9_4_3_sh_mask.h |   2 +
 drivers/gpu/drm/amd/include/kgd_kfd_interface.h    |   2 +
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |   5 +
 .../drm/amd/pm/powerplay/hwmgr/hardwaremanager.c   |  10 -
 .../gpu/drm/amd/pm/powerplay/hwmgr/ppatomfwctrl.c  |  78 --------
 .../gpu/drm/amd/pm/powerplay/hwmgr/ppatomfwctrl.h  |   3 -
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c   |   1 -
 .../amd/pm/powerplay/hwmgr/smu7_clockpowergating.c |   2 +-
 .../amd/pm/powerplay/hwmgr/smu7_clockpowergating.h |   1 -
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |   1 -
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c    |   1 -
 .../gpu/drm/amd/pm/powerplay/inc/hardwaremanager.h |   1 -
 drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h       |   1 -
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c  |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |  12 +-
 drivers/gpu/drm/radeon/r300.c                      |   3 +-
 drivers/gpu/drm/radeon/radeon_asic.h               |   1 +
 drivers/gpu/drm/radeon/radeon_device.c             |   6 +-
 drivers/gpu/drm/radeon/radeon_fence.c              |   2 +-
 drivers/gpu/drm/radeon/rs400.c                     |  18 +-
 drivers/gpu/drm/radeon/si.c                        |   2 +-
 include/uapi/linux/kfd_ioctl.h                     |   8 +-
 include/uapi/linux/kfd_sysfs.h                     |   3 +
 123 files changed, 1524 insertions(+), 813 deletions(-)
