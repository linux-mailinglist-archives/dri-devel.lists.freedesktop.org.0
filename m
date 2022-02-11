Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8214B3012
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 23:07:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9850210EB55;
	Fri, 11 Feb 2022 22:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2088.outbound.protection.outlook.com [40.107.96.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1983B10EB57;
 Fri, 11 Feb 2022 22:07:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+eD7jxaDKbumpfGTdBcHtTM9Q4sqOI23sL15lMF9EFdMHjqNAxSYe5zb/y+bdLraJlOyMWLc7Lqz/Y44VBpoYSeV2a09cBUpSAdUnI/KU1kYr4Co3N4HJmjTh4P4quRJiwGJ9WQZ9HMj1Zu9ZZCnjdG76YGB4kdnNiluwpyuc4fI00zQ7LCONts/uvZS8wpAgC05vJA4Ljwg/faqEQVSk7FsqH/g6sA7p9zL9uemaBOiEacppqnVUGwckgOQRtsJEuwD7ruW1pO90EEenNSbmXXwMUlRaw7vI6HXdrJqW2to+GB9cgrrNNw+/bdHtPz9bqoOHsPE7ttjGbxptxtIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZUyVYBIHkwQmkmJpmjS13/vq/qxHRTzfxpKouj2Wxy4=;
 b=ehYWho93B5MwNJO8F4JOCHs5X8pZZFHggHMkvHzoFn2ZqgupuAe2Cm2iNvQIpRE+zJuEXWuATQHRM3I0ZJyGrL9fI+Ou+WNOIf3D6JEWd/rVx/kpgIY75JJ5mD2oya8gx5KpAgnbMyjeNCc6aKk99EQROH7LnfGonJ7jFaYEqpb7ffEbzM8d6XGge3ytUnugukg6toED2kWtH0atuvmr7/OFqk+/0Vz1eqWa1nrr5HBMShQf8zuoVIjrEs2bxeRKy2YVz5pqCnqVuCFTQCxvBYk/fIgMUzWH8+QrRL1Sz17fiybzpg/co63GGEtTnFuO1tmbx6xBI68FqwKEdyMG2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZUyVYBIHkwQmkmJpmjS13/vq/qxHRTzfxpKouj2Wxy4=;
 b=w9ou5e/7IWtHkI1BQr30IeY8F449WkljRPjRyTPaIgsuZRowu1+bj3++GuD4H+oTNR0Zs3YI+CJKw7cRWKfdzHuqawlScz9T+0VFPBNEXCRZrxSUXJGef+y3fqYTl+byEOGv+btu0rePhr+NwHRYMKk8khK/5ThBmHHvNlMzrWI=
Received: from BN6PR18CA0021.namprd18.prod.outlook.com (2603:10b6:404:121::31)
 by BL0PR12MB2433.namprd12.prod.outlook.com (2603:10b6:207:4a::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Fri, 11 Feb
 2022 22:07:32 +0000
Received: from BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:121:cafe::3b) by BN6PR18CA0021.outlook.office365.com
 (2603:10b6:404:121::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Fri, 11 Feb 2022 22:07:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT029.mail.protection.outlook.com (10.13.177.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Fri, 11 Feb 2022 22:07:31 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 11 Feb
 2022 16:07:30 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-5.18
Date: Fri, 11 Feb 2022 17:07:06 -0500
Message-ID: <20220211220706.5803-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54e60a7a-9977-465c-5c34-08d9edaae6a6
X-MS-TrafficTypeDiagnostic: BL0PR12MB2433:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB2433C524F7AC930BC200DDE0F7309@BL0PR12MB2433.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HadYcvqwj0wuWgzCEFmYT9TbmAYFjNNdrI2YMfhqGcR2PCEnWSzM96W/2RlMEEXyd1VBTP23UZ+FrjlcDDCIJh6s8uDmohKVrnYqzaLhO+y8An7VoaR6cw8oYaJyS/iZx0c3rkkLo9wBr5+rR9aykmcKS1KjmKACszFDvNnIse8o4aTvvSiO+wvK5xOSwh62+pRhAkdFM4z7DH8Gb/RfPibZM5mXrvwlYxBr4rIdNNoTcbPRYcw8cp+mCNx+OdLr4b9y80DeHlbLi/SdY99jmy7zdvYvWUSpHZZmrPsIZChdf7Kkb5p39qWX4hO3w0zbAICIXd2xjaRc8CtzMp1f6Md8egG+qhI2ttDvcibFcO3uTW2z9lR/U0+Tih+k1ZM02SfDt1icM9w5nXQVVQ2VIlgi0m8AUpmitHtXf4NTA8RwUpcPjiEXARpF8bNZiX4fLWyqJit/Yu8njlyd5L8Elpfknh+03KuJDWxtBOGWx78YuJRcsMeYQWaa7bG6WSCkajUG+vTsdC8X/Vdk0GUJK7av3ZHf6diYM9qa9VsRKdzoF/pO5ncoVGjSLzCEBWfdZ5NsVdK0hj4sC9y1QaRfLbszyH3jJtglYd2GxILzcDTGYtIIme5oANubK4TGYLdTfErVPLG1Bq1nsfn2ds9p74pcTpQUIYmVnjfLMJxALRMFUotD0wBAMIjczTC4f+INRUjEiqHtigxqxzhTolE1gv1PdNKFRtolD6xtZm6H5JIBqPUzNhqCELUEXRyFOxvYEDSQyFXAY6LcLXzQfA2UhsXRyUiJmZikzCK4hgioQHo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(508600001)(356005)(110136005)(2906002)(316002)(186003)(26005)(426003)(336012)(36860700001)(81166007)(36756003)(40460700003)(66574015)(47076005)(83380400001)(70586007)(70206006)(5660300002)(6666004)(82310400004)(4326008)(8936002)(2616005)(16526019)(86362001)(8676002)(1076003)(30864003)(966005)(7696005)(36900700001)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 22:07:31.8740 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54e60a7a-9977-465c-5c34-08d9edaae6a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2433
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

New stuff for 5.18.

The following changes since commit 4efdddbce7c1329f00c458e85dcaf105aebdc0ed:

  Merge tag 'amd-drm-next-5.17-2022-01-12' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2022-01-14 15:42:28 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.18-2022-02-11-1

for you to fetch changes up to 7f161df1a513e2961f4e3c96a8355c8ce93ad175:

  drm/amdkfd: replace err by dbg print at svm vram migration (2022-02-11 16:20:24 -0500)

----------------------------------------------------------------
amd-drm-next-5.18-2022-02-11-1:

amdgpu:
- Clean up of power management code
- Enable freesync video mode by default
- Clean up of RAS code
- Improve VRAM access for debug using SDMA
- Coding style cleanups
- SR-IOV fixes
- More display FP reorg
- TLB flush fixes for Arcuturus, Vega20
- Misc display fixes
- Rework special register access methods for SR-IOV
- DP2 fixes
- DP tunneling fixes
- DSC fixes
- More IP discovery cleanups
- Misc RAS fixes
- Enable both SMU i2c buses where applicable
- s2idle improvements
- DPCS header cleanup
- Add new CAP firmware support for SR-IOV

amdkfd:
- Misc cleanups
- SVM fixes
- CRIU support
- Clean up MQD manager

UAPI:
- Add interface to amdgpu CTX ioctl to request a stable power state for profiling
  https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/207
- Add amdkfd support for CRIU
  https://github.com/checkpoint-restore/criu/pull/1709
- Remove old unused amdkfd debugger interface
  Was only implemented for Kaveri and was only ever used by an old HSA tool that was never open sourced

radeon:
- Fix error handling in radeon_driver_open_kms
- UVD suspend fix
- Misc fixes

----------------------------------------------------------------
Aaron Liu (4):
      drm/amdgpu: convert code name to ip version for athub
      drm/amdgpu: add 1.3.1/2.4.0 athub CG support
      drm/amdgpu: add utcl2_harvest to gc 10.3.1
      drm/amdgpu: check the GART table before invalidating TLB

Agustin Gutierrez (1):
      drm/amd/display: Update watermark values for DCN301

Alex Deucher (22):
      drm/amdgpu/swsmu: make sienna cichlid function static
      drm/amdgpu/pm: move additional logic into amdgpu_dpm_force_performance_level
      drm/amdgpu: invert the logic in amdgpu_device_should_recover_gpu()
      drm/amdgpu: don't do resets on APUs which don't support it
      drm/amdgpu: drop flags check for CHIP_IP_DISCOVERY
      drm/amdgpu: filter out radeon secondary ids as well
      drm/amdgpu/display: adjust msleep limit in dp_wait_for_training_aux_rd_interval
      drm/amdgpu/display: use msleep rather than udelay for long delays
      drm/amdgpu/pm/smu7: drop message about VI performance levels
      drm/amdgpu: set APU flag based on IP discovery table
      drm/amdgpu: move PX checking into amdgpu_device_ip_early_init
      drm/amdgpu: move runtime pm init after drm and fbdev init
      drm/amdgpu: handle BACO synchronization with secondary funcs
      drm/amdgpu: convert amdgpu_display_supported_domains() to IP versions
      drm/amdgpu/swsmu/i2c: return an error if the SMU is not running
      drm/amdgpu/UAPI: add new CTX OP to get/set stable pstates
      drm/amdgpu: bump driver version for new CTX OP to set/get stable pstates
      drm/amdgpu: drop experimental flag on aldebaran
      drm/amdgpu/display: change pipe policy for DCN 2.0
      drm/amdgpu: add missing license to dpcs_3_0_0 headers
      drm/amdgpu: move dpcs_3_0_0 headers from dcn to dpcs
      drm/amdgpu: move dpcs_3_0_3 headers from dcn to dpcs

Alex Sierra (1):
      drm/amdkfd: replace err by dbg print at svm vram migration

Alvin Lee (1):
      drm/amd/display: Driver support for MCLK query tool

Anthony Koo (4):
      drm/amd/display: [FW Promotion] Release 0.0.100.0
      drm/amd/display: [FW Promotion] Release 0.0.101.0
      drm/amd/display: [FW Promotion] Release 0.0.102.0
      drm/amd/display: [FW Promotion] Release 0.0.103.0

Aric Cyr (6):
      drm/amd/display: 3.2.168
      drm/amd/display: 3.2.169
      drm/amd/display: 3.2.170
      drm/amd/display: Remove unnecessary function definition
      drm/amd/display: 3.2.171
      drm/amd/display: 3.2.172

Aun-Ali Zaidi (1):
      drm/amd/display: Force link_rate as LINK_RATE_RBR2 for 2018 15" Apple Retina panels

Bas Nieuwenhuizen (3):
      drm/amd/display: Fix FP start/end for dcn30_internal_validate_bw.
      drm/amd/display: Wrap dcn301_calculate_wm_and_dlg for FPU.
      drm/amdgpu/display: Remove t_srx_delay_us.

Bing Guo (1):
      drm/amdgpu/display/dc: do blocked MST topology discovery at resume from S3/S4

Bokun Zhang (1):
      drm/amdgpu: Add interface to load SRIOV cap FW

CHANDAN VURDIGERE NATARAJ (1):
      drm/amdgpu: Enable recovery on yellow carp

Changcheng Deng (3):
      drm/amd/pm: Replace one-element array with flexible-array member
      drm/amdgpu: remove duplicate include in 'amdgpu_device.c'
      drm/amd/pm: remove duplicate include in 'arcturus_ppt.c'

Charlene Liu (1):
      drm/amd/display: update dml to rev.99 and smu clk_table w/a

Chris Park (1):
      drm/amd/display: DCEFCLK DS on CLK init

Christian König (10):
      drm/radeon: fix error handling in radeon_driver_open_kms
      drm/amdgpu: remove gart.ready flag
      drm/amdgpu: fix logic inversion in check
      drm/amdgpu: lower BUG_ON into WARN_ON for AMDGPU_PL_PREEMPT
      drm/amdgpu: rework GART copy window handling
      drm/amdgpu: restructure amdgpu_fill_buffer v2
      drm/amdgpu: add some lockdep checks to the VM code
      drm/amdgpu: rename amdgpu_vm_bo_rmv to _del
      drm/amdgpu: move lockdep assert to the right place.
      drm/amdgpu: reserve the pd while cleaning up PRTs

Colin Ian King (2):
      drm/radeon: remove redundant assignment to reg
      drm/amd/display: fix spelling mistake: synatpics -> synaptics

Dale Zhao (1):
      drm/amd/display: Add signal type check when verify stream backends same

Dan Carpenter (2):
      drm/amdkfd: CRIU fix a NULL vs IS_ERR() check
      drm/amdkfd: CRIU return -EFAULT for copy_to_user() failure

Darren Powell (3):
      amdgpu/pm: Implement new API function "emit" that accepts buffer base and write offset
      amdgpu/pm: Implement emit_clk_levels for navi10
      amdgpu/pm: Add emit_clock_levels calls

David Galiffi (2):
      drm/amd/display: Fix disabling dccg clocks
      drm/amd/display: Disable physym clock

David Yat Sin (9):
      drm/amdkfd: CRIU Implement KFD unpause operation
      drm/amdkfd: CRIU add queues support
      drm/amdkfd: CRIU restore queue ids
      drm/amdkfd: CRIU restore sdma id for queues
      drm/amdkfd: CRIU restore queue doorbell id
      drm/amdkfd: CRIU checkpoint and restore queue mqds
      drm/amdkfd: CRIU checkpoint and restore queue control stack
      drm/amdkfd: CRIU checkpoint and restore events
      drm/amdkfd: CRIU implement gpu_id remapping

Dmytro Laktyushkin (2):
      drm/amd/display: limit unbounded requesting to 5k
      drm/amd/display: fix yellow carp wm clamping

Eric Bernstein (2):
      drm/amd/display: Fix for variable may be used uninitialized error
      drm/amd/display: remove static from optc31_set_drr

Eric Huang (2):
      drm/amdkfd: enable heavy-weight TLB flush on Arcturus
      drm/amdkfd: enable heavy-weight TLB flush on Vega20

Eric Yang (4):
      drm/amd/display: adjust bit comparison to be more type safe
      drm/amd/display: support new PMFW interface to disable Z9 only
      drm/amd/display: fix zstate allow interface to PMFW
      drm/amd/display: add debug option for z9 disable interface

Evan Quan (39):
      drm/amd/pm: do not expose implementation details to other blocks out of power
      drm/amd/pm: do not expose power implementation details to amdgpu_pm.c
      drm/amd/pm: do not expose power implementation details to display
      drm/amd/pm: do not expose those APIs used internally only in amdgpu_dpm.c
      drm/amd/pm: do not expose those APIs used internally only in si_dpm.c
      drm/amd/pm: do not expose the API used internally only in kv_dpm.c
      drm/amd/pm: create a new holder for those APIs used only by legacy ASICs(si/kv)
      drm/amd/pm: move pp_force_state_enabled member to amdgpu_pm structure
      drm/amd/pm: optimize the amdgpu_pm_compute_clocks() implementations
      drm/amd/pm: move those code piece used by Stoney only to smu8_hwmgr.c
      drm/amd/pm: drop redundant or unused APIs and data structures
      drm/amd/pm: do not expose the smu_context structure used internally in power
      drm/amd/pm: relocate the power related headers
      drm/amd/pm: drop unnecessary gfxoff controls
      drm/amd/pm: revise the performance level setting APIs
      drm/amd/pm: unified lock protections in amdgpu_dpm.c
      drm/amdgpu: wrap those atombios APIs used by SI under CONFIG_DRM_AMDGPU_SI
      drm/amd/pm: drop those unrealistic thermal_type checks
      drm/amd/pm: correct the checks for fan attributes support
      drm/amdgpu: suppress the warning about enum value 'AMD_IP_BLOCK_TYPE_NUM'
      drm/amd/pm: drop unneeded lock protection smu->mutex
      drm/amd/pm: drop unneeded vcn/jpeg_gate_lock
      drm/amd/pm: drop unneeded smu->metrics_lock
      drm/amd/pm: drop unneeded smu->sensor_lock
      drm/amd/pm: drop unneeded smu_baco->mutex
      drm/amd/pm: drop unneeded feature->mutex
      drm/amd/pm: drop unneeded hwmgr->smu_lock
      drm/amd/pm: correct the MGpuFanBoost support for Beige Goby
      drm/amd/pm: fix the deadlock observed on performance_level setting
      drm/amd/pm: correct the way for retrieving enabled ppfeatures on Renoir
      drm/amd/pm: unify the interface for retrieving enabled ppfeatures
      drm/amd/pm: update the data type for retrieving enabled ppfeatures
      drm/amd/pm: correct the usage for 'supported' member of smu_feature structure
      drm/amd/pm: drop the cache for enabled ppfeatures
      drm/amd/pm: avoid consecutive retrieving for enabled ppfeatures
      drm/amd/pm: revise the implementation of smu_cmn_disable_all_features_with_exception
      drm/amd/pm: fix enabled features retrieving on Renoir and Cyan Skillfish
      drm/amd/pm: correct UMD pstate clocks for Dimgrey Cavefish and Beige Goby
      drm/amd/pm: fulfill the support for DriverSmuConfig table

Fangzhi Zuo (5):
      drm/amd/display: Add Synaptics Fifo Reset Workaround
      drm/amd/display: Retrieve MST Downstream Port Status
      drm/amd/display: Add DSC Enable for Synaptics Hub
      drm/amd/display: Add Missing HPO Stream Encoder Function Hook
      drm/amd/display: Trigger DP2 Sequence With Uncertified Cable

Felipe Clark (1):
      drm/amd/display: Fix black screen issue on memory clock switch en

Felix Kuehling (1):
      drm/amdgpu: Wipe all VRAM on free when RAS is enabled

Flora Cui (1):
      drm/amd/pm: fix null ptr access

Graham Sider (1):
      drm/amdkfd: Fix indentation on switch statement

Guchun Chen (5):
      drm/amdgpu: drop redundant check of ip discovery_bin
      drm/amdgpu: apply vcn harvest quirk
      drm/amdgpu: drop WARN_ON in amdgpu_gart_bind/unbind
      drm/amd/pm: use dev_*** to print output in multiple GPUs
      drm/amdgpu: drop flood print in rlcg reg access function

Hawking Zhang (10):
      drm/amdgpu: add helper to query rlcg reg access flag
      drm/amdgpu: switch to get_rlcg_reg_access_flag for gfx9
      drm/amdgpu: switch to get_rlcg_reg_access_flag for gfx10
      drm/amdgpu: add structures for rlcg indirect reg access
      drm/amdgpu: init rlcg_reg_access_ctrl for gfx9
      drm/amdgpu: init rlcg_reg_access_ctrl for gfx10
      drm/amdgpu: add helper for rlcg indirect reg access
      drm/amdgpu: switch to amdgpu_sriov_rreg/wreg
      drm/amdgpu: retire rlc callbacks sriov_rreg/wreg
      drm/amdgpu: switch to common helper to read bios from rom

Ian Chen (2):
      drm/amd/display: modify SMU_TIMEOUT macro.
      drm/amd/display: Change return type of dm_helpers_dp_mst_stop_top_mgr

Ilya (1):
      drm/amd/display: Fix DP LT sequence on EQ fail

Isabella Basso (1):
      drm/amd/display: move calcs folder into DML

Jarif Aftab (1):
      drm/amd/display: Disabled seamless boots on DP and renamed power_down_display_on_boot

Jasdeep Dhillon (1):
      drm/amd/display: move FPU associated DCN302 code to DML folder (#2266)

Jiapeng Chong (2):
      drm/amd/display: Remove redundant initialization of dpg_width
      drm/amd/pm: remove useless if

Jimmy Kizito (1):
      drm/amd/display: Add work around to enforce TBT3 compatibility.

Jingwen Chen (1):
      drm/amd/amdgpu: fixing read wrong pf2vf data in SRIOV

Jonathan Gray (1):
      drm/radeon: use kernel is_power_of_2 rather than local version

Jonathan Kim (3):
      drm/amdgpu: improve debug VRAM access performance using sdma
      drm/amdgpu: cleanup ttm debug sdma vram access function
      drm/amdgpu: fix broken debug sdma vram access function

Josip Pavic (1):
      drm/amd/display: do not compare integers of different widths

Ken Xue (1):
      drm/amdgpu: remove ctx->lock

Lang Yu (5):
      drm/amdgpu: enable amdgpu_dc module parameter
      drm/amd/pm: add get_dpm_ultimate_freq function for cyan skillfish
      drm/amd/pm: use existing fini_smc_tables function for cyan skillfish
      drm/amdgpu: fix a potential GPU hang on cyan skillfish
      drm/amdgpu: add support for GC 10.1.4

Leo (Hanghong) Ma (1):
      drm/amd/display: add infoframe update sequence debug trace

Lijo Lazar (1):
      drm/amdgpu: Fix uninitialized variable use warning

Luben Tuikov (7):
      drm/amd: Expose the FRU SMU I2C bus
      drm/amd: Enable FRU EEPROM for Sienna Cichlid
      drm/amdgpu: Print once if RAS unsupported
      drm/amdgpu: Nerf "buff" to "buf"
      drm/amdgpu: Don't offset by 2 in FRU EEPROM
      drm/amdgpu: Prevent random memory access in FRU code
      drm/amdgpu: Set FRU bus for Aldebaran and Vega 20

Lukas Fink (1):
      drm/amdgpu: Fix rejecting Tahiti GPUs

Magali Lemes (1):
      drm/amd/display: Use NULL pointer instead of plain integer

Marina Nikolic (1):
      drm/amd/pm: Enable sysfs required by rocm-smi tool for One VF mode

Mario Limonciello (7):
      drm/amd/display: Revert W/A for hard hangs on DCN20/DCN21
      drm/amd: Fix MSB of SMU version printing
      display/amd: decrease message verbosity about watermarks table failure
      drm/amd: Warn users about potential s0ix problems
      drm/amd: add support to check whether the system is set to s3
      drm/amd: Only run s3 or s0ix if system is configured properly
      drm/amd: avoid suspend on dGPUs w/ s2idle support when runtime PM enabled

Martin Tsai (2):
      drm/amd/display: add protection in link encoder matching logic
      drm/amd/display: handle null link encoder

Maíra Canal (1):
      drm/amd/pm: add missing prototypes to amdgpu_dpm_internal

Minghao Chi (1):
      amdgpu/amdgpu_psp: remove unneeded ret variable

Mukul Joshi (3):
      drm/amdkfd: Fix TLB flushing in KFD SVM with no HWS
      drm/amdkfd: Remove unused old debugger implementation
      drm/amdkfd: Consolidate MQD manager functions

Nicholas Kazlauskas (4):
      drm/amd/display: Only set PSR version when valid
      drm/amd/display: Use PSR version selected during set_psr_caps
      drm/amd/display: Call dc_stream_release for remove link enc assignment
      drm/amd/display: Fix stream->link_enc unassigned during stream removal

Oliver Logush (1):
      drm/amd/display: extend dcn201 support

Paul Hsieh (2):
      drm/amd/display: watermark latencies is not enough on DCN31
      drm/amd/display: change fastboot timing validation

Philip Yang (4):
      drm/amdkfd: Don't take process mutex for svm ioctls
      drm/amdkfd: Ensure mm remain valid in svm deferred_list work
      drm/amdkfd: svm range restore work deadlock when process exit
      drm/amdkfd: Fix variable set but not used warning

Qiang Ma (1):
      drm/radeon: fix UVD suspend error

Rajib Mahapatra (2):
      drm/amd/display: Not to call dpcd_set_source_specific_data during resume.
      drm/amdgpu: skipping SDMA hw_init and hw_fini for S0ix.

Rajneesh Bhardwaj (17):
      drm/amdkfd: CRIU Introduce Checkpoint-Restore APIs
      drm/amdkfd: CRIU Implement KFD process_info ioctl
      drm/amdkfd: CRIU Implement KFD checkpoint ioctl
      drm/amdkfd: CRIU Implement KFD restore ioctl
      drm/amdkfd: CRIU Implement KFD resume ioctl
      drm/amdkfd: CRIU export BOs as prime dmabuf objects
      drm/amdkfd: CRIU checkpoint and restore xnack mode
      drm/amdkfd: CRIU allow external mm for svm ranges
      drm/amdkfd: use user_gpu_id for svm ranges
      drm/amdkfd: CRIU Discover svm ranges
      drm/amdkfd: CRIU Save Shared Virtual Memory ranges
      drm/amdkfd: CRIU prepare for svm resume
      drm/amdkfd: CRIU resume shared virtual memory ranges
      drm/amdkfd: Bump up KFD API version for CRIU
      drm/amdgpu: Fix recursive locking warning
      drm/amdkfd: CRIU fix extra whitespace and block comment warnings
      drm/amdkfd: Fix prototype warning for get_process_num_bos

Randy Dunlap (1):
      drm/amd/display: don't use /** for non-kernel-doc comments

Reza Amini (1):
      drm/amd/display: Update VSC HDR infoPacket on TF change

Roman Li (1):
      drm/amd/display: Cap pflip irqs per max otg number

Roy Chan (1):
      drm/amd/display: Support synchronized indirect reg access

Shen, George (2):
      drm/amd/display: Add Cable ID support for native DP
      drm/amd/display: Add link enc null ptr check for cable ID (#2597)

Solomon Chiu (1):
      drm/amd/display: Enable Freesync Video Mode by default

Somalapuram Amaranath (1):
      drm/amdgpu: limit the number of dst address in trace

Stanley.Yang (6):
      drm/amdgpu: handle denied inject error into critical regions v2
      drm/amdgpu: remove unused variable warning
      drm/amdgpu: fix convert bad page retiremt
      drm/amdgpu: fix channel index mapping for SIENNA_CICHLID
      drm/amdgpu: Reset OOB table error count info
      drm/amdgpu: adjust register address calculation

Sung Joon Kim (1):
      drm/amd/display: remove PHY repeater count check for LTTPR mode

Tao Zhou (8):
      drm/amdgpu: add umc_fill_error_record to make code more simple
      drm/amdgpu: increase bad page number for umc ras query
      drm/amdgpu: update algorithm of umc address conversion
      drm/amdgpu: get hash bit for CH4 in umc channel index
      drm/amdgpu: fix list add issue in vram reserve
      drm/amdkfd: rename kfd_process_vm_fault to kfd_dqm_evict_pasid
      drm/amdkfd: use unmap all queues for poison consumption
      drm/amdgpu: loose check for umc poison mode

Tianci.Yin (1):
      drm/amdgpu: Fix an error message in rmmod

Tim Huang (4):
      drm/amdgpu: convert to NBIO IP version checking
      drm/amdgpu: convert to UVD IP version checking
      drm/amd/display: convert to DCE IP version checking
      drm/amd/display: Fix unused variable warning

Tom Rix (4):
      drm/amd/pm: return -ENOTSUPP if there is no get_dpm_ultimate_freq function
      drm/amd/pm: fix error handling
      drm/amdkfd: fix freeing an unset pointer
      drm/amdkfd: fix loop error handling

Varone (1):
      drm/amd/display: Change error to warning when hpd remains low for eDP

Victor Zhao (1):
      drm/amdgpu: add determine passthrough under arm64

Wayne Lin (2):
      drm/amd/display: Don't update drm connector when read local EDID
      drm/amd/display: Reset preferred training settings immediately

Wenjing Liu (15):
      drm/amd/display: factor out dp detection link training and mst top detection
      drm/amd/display: Drop DCN for DP2.x logic
      drm/amd/display: abstract encoder related hwseq across different types
      drm/amd/display: add more link_hwss types and method to decide which one
      drm/amd/display: rename dc_link_hwss struct to link_hwss
      drm/amd/display: fix a coding error causing set throttled vcp size skipped for dpia
      drm/amd/display: allow set dp drive setting when stream is not present
      drm/amd/display: add setup/reset stream encoder to link_hwss
      drm/amd/display: refactor destructive verify link cap sequence
      drm/amd/display: add enable/disable dp link output to link_hwss
      drm/amd/display: add set dp link test pattern to link_hwss
      drm/amd/display: add set dp lane settings to link_hwss
      drm/amd/display: temporarly move non link_hwss code to dc_link_dp
      drm/amd/display: move get_link_hwss to dc_resource
      drm/amd/display: move link_hwss to link folder and break down to files

Wyatt Wood (1):
      drm/amd/display: Improve dce_aux_transfer_with_retries logging

Xiaojian Du (3):
      drm/amdgpu: add vram check function for GMC
      drm/amdgpu: modify a pair of functions for the pcie port wreg/rreg
      drm/amdgpu: fix the page fault caused by uninitialized variables

Xin Xiong (1):
      drm/amd/amdgpu/amdgpu_cs: fix refcount leak of a dma_fence obj

Yang Li (4):
      drm/amdgpu: remove unneeded semicolon
      drm/amdgpu: clean up some inconsistent indenting
      drm/amd/display: clean up some inconsistent indenting
      drm/amd/display: clean up some inconsistent indenting

Yang Wang (4):
      drm/amd/pm: drm/amd/pm: disable GetPptLimit message in sriov mode
      drm/amd/pm: fix hwmon node of power1_label create issue
      drm/amd/pm: correct hwmon power label name
      drm/amdgpu: fix gmc init fail in sriov mode

Yongzhi Liu (2):
      drm/amdgpu: Add missing pm_runtime_put_autosuspend
      drm/amd/display: Fix memory leak

Zhan Liu (4):
      drm/amd/display: Correct MPC split policy for DCN301
      drm/amd/display: change FIFO reset condition to embedded display only
      drm/amd/display: revert "Reset fifo after enable otg"
      drm/amd/display: keep eDP Vdd on when eDP stream is already enabled

Zhou Qingyang (2):
      drm/amd/display/dc/calcs/dce_calcs: Fix a memleak in calculate_bandwidth()
      drm/amd/display: Fix a NULL pointer dereference in amdgpu_dm_connector_add_common_modes()

huangqu (1):
      drm/amdgpu: Wrong order for config and counter_id parameters

mziya (4):
      drm/amd/pm: Update smu driver interface for sienna cichlid
      drm/amdgpu: add new query interface for umc_v8_7 block
      drm/amd/pm: add message smu to get ecc_table
      drm/amdgpu: remove unused variable

shaoyunl (1):
      drm/amdgpu: Disable FRU EEPROM access for SRIOV

tangmeng (1):
      drm/amd/amdgpu: fix spelling mistake "disbale" -> "disable"

yipechai (27):
      drm/amdgpu: Unify ras block interface for each ras block
      drm/amdgpu: Modify the compilation failed problem when other ras blocks' .h include amdgpu_ras.h
      drm/amdgpu: Modify gfx block to fit for the unified ras block data and ops
      drm/amdgpu: Modify xgmi block to fit for the unified ras block data and ops
      drm/amdgpu: Modify hdp block to fit for the unified ras block data and ops
      drm/amdgpu: Modify mmhub block to fit for the unified ras block data and ops
      drm/amdgpu: Modify nbio block to fit for the unified ras block data and ops
      drm/amdgpu: Modify umc block to fit for the unified ras block data and ops
      drm/amdgpu: Modify sdma block to fit for the unified ras block data and ops
      drm/amdgpu: Modify mca block to fit for the unified ras block data and ops
      drm/amdgpu: Adjust error inject function code style in amdgpu_ras.c
      drm/amdgpu: Removed redundant ras code
      drm/amdgpu: Add ras supported check for register_ras_block
      drm/amdgpu: No longer insert ras blocks into ras_list if it already exists in ras_list
      drm/amdgpu: Use ARRAY_SIZE to get array length
      drm/amdgpu: fix compile warning for ras_block_match_default
      drm/amdgpu: Fix the code style warnings in amdgpu_ras
      drm/amdgpu: Fix the code style warnings in gfx
      drm/amdgpu: Fix the code style warnings in gmc
      drm/amdgpu: Fix the code style warnings in sdma
      drm/amdgpu: Fix the code style warnings in hdp xgmi mca and umc
      drm/amdgpu: Remove repeated calls
      drm/amdgpu: Move xgmi ras initialization from .late_init to .early_init
      Revert "drm/amdgpu: No longer insert ras blocks into ras_list if it already exists in ras_list"
      drm/amdgpu: Add judgement to avoid infinite loop
      drm/amdgpu: Fixed the defect of soft lock caused by infinite loop
      Revert "drm/amdgpu: Add judgement to avoid infinite loop"

zhanglianjie (2):
      drm/radeon/uvd: Fix forgotten unmap buffer objects
      drm/amd/amdgpu/amdgpu_uvd: Fix forgotten unmap buffer object

 drivers/gpu/drm/amd/amdgpu/aldebaran.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   37 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   37 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |    7 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c   |    3 -
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c    |    3 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c |   24 -
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c   |   25 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c  |   96 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c  |   24 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |   24 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h  |   10 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   74 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c       |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.h       |   22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c           |   38 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |  131 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   29 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  121 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   66 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   29 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  206 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c     |   53 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |   36 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h           |   15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |   24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |  114 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |   13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |    9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.h            |   13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |   12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  112 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c            |   11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h            |   14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.c          |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.h          |   14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.c           |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h           |   11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  126 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |    9 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  421 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   61 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h            |   16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |   12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h          |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  409 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |   10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |   60 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |   19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |  165 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |   24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |   52 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h           |    4 +-
 drivers/gpu/drm/amd/amdgpu/athub_v1_0.c            |   13 +-
 drivers/gpu/drm/amd/amdgpu/athub_v2_0.c            |    1 +
 drivers/gpu/drm/amd/amdgpu/athub_v2_1.c            |    1 +
 drivers/gpu/drm/amd/amdgpu/cik.c                   |    4 +
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |    2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |    2 +-
 drivers/gpu/drm/amd/amdgpu/df_v3_6.c               |    6 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  200 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  226 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4.c              |   24 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4.h              |    2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c            |   25 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.h            |    2 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c           |    7 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   43 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |   12 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |   13 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |   13 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   86 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |   14 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.h              |    2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |    9 +-
 drivers/gpu/drm/amd/amdgpu/mca_v3_0.c              |   86 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c            |   10 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.h            |    2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c            |   10 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.h            |    2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c            |   10 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.h            |    2 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c              |    2 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c             |   44 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |   17 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.h             |    2 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |   69 +-
 drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h            |    1 +
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/psp_v3_1.c              |    1 +
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |   66 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4.c             |   25 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4.h             |    2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |    3 +-
 drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c         |   81 +-
 drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.h         |    6 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   55 +-
 drivers/gpu/drm/amd/amdgpu/soc15_common.h          |    8 +-
 drivers/gpu/drm/amd/amdgpu/ta_ras_if.h             |    3 +-
 drivers/gpu/drm/amd/amdgpu/umc_v6_1.c              |   30 +-
 drivers/gpu/drm/amd/amdgpu/umc_v6_1.h              |    2 +-
 drivers/gpu/drm/amd/amdgpu/umc_v6_7.c              |  153 +-
 drivers/gpu/drm/amd/amdgpu/umc_v6_7.h              |   25 +-
 drivers/gpu/drm/amd/amdgpu/umc_v8_7.c              |  173 +-
 drivers/gpu/drm/amd/amdgpu/umc_v8_7.h              |    2 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |    4 +
 drivers/gpu/drm/amd/amdkfd/Makefile                |    2 -
 drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c   |    2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           | 1606 +++++++++----
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |    1 +
 drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c            |  845 -------
 drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.h            |  230 --
 drivers/gpu/drm/amd/amdkfd/kfd_dbgmgr.c            |  158 --
 drivers/gpu/drm/amd/amdkfd/kfd_dbgmgr.h            |  293 ---
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   59 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  246 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.h  |   51 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |  313 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |    5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_iommu.c             |   12 -
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |   22 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c       |   63 +
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h       |   41 +
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c   |  123 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c   |  150 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |  172 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c    |  147 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |  167 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   92 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |  372 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c        |    2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  437 +++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |   39 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   42 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |    1 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |  108 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  219 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   25 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.h    |   10 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c   |  248 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |    6 +-
 drivers/gpu/drm/amd/display/dc/Makefile            |    6 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |    2 -
 .../gpu/drm/amd/display/dc/bios/command_table2.c   |    4 -
 drivers/gpu/drm/amd/display/dc/calcs/Makefile      |   68 -
 .../amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c   |   11 +-
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |   11 +-
 .../amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c   |    5 +-
 .../drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c |   16 +-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |   26 +-
 .../drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c   |   27 +-
 .../drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.h   |    2 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   11 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |  847 +++----
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   | 1379 ++++++-----
 .../gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c  |   24 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c |  917 -------
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   84 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   38 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |   59 +-
 drivers/gpu/drm/amd/display/dc/dc_helper.c         |   60 +
 drivers/gpu/drm/amd/display/dc/dc_link.h           |   21 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |    6 -
 drivers/gpu/drm/amd/display/dc/dc_types.h          |    6 -
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |    2 +-
 .../gpu/drm/amd/display/dc/dce/dce_link_encoder.c  |   17 +-
 .../gpu/drm/amd/display/dc/dce/dce_link_encoder.h  |    3 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |    4 +
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |  132 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |    5 +-
 .../drm/amd/display/dc/dcn10/dcn10_link_encoder.c  |   18 +-
 .../drm/amd/display/dc/dcn10/dcn10_link_encoder.h  |    3 +-
 .../amd/display/dc/dcn10/dcn10_stream_encoder.c    |   15 -
 .../amd/display/dc/dcn10/dcn10_stream_encoder.h    |    3 -
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h  |   15 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |   41 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |   21 +-
 .../amd/display/dc/dcn20/dcn20_stream_encoder.c    |    2 -
 .../display/dc/dcn30/dcn30_dio_stream_encoder.c    |    2 -
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |    7 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |    8 +-
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |   17 +-
 drivers/gpu/drm/amd/display/dc/dcn302/Makefile     |   12 -
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |  320 +--
 .../drm/amd/display/dc/dcn302/dcn302_resource.h    |    3 +
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |    4 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c  |  106 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.h  |    6 +
 .../display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c |   11 +
 .../display/dc/dcn31/dcn31_hpo_dp_stream_encoder.h |    9 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.c    |   61 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |    5 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.c  |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.h  |    2 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |    4 +-
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |    6 +-
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |   12 +-
 .../drm/amd/display/dc/{ => dml}/calcs/bw_fixed.c  |    0
 .../amd/display/dc/{ => dml}/calcs/calcs_logger.h  |    0
 .../amd/display/dc/{ => dml}/calcs/custom_float.c  |    0
 .../drm/amd/display/dc/{ => dml}/calcs/dce_calcs.c |   52 +-
 .../amd/display/dc/{ => dml}/calcs/dcn_calc_auto.c |    0
 .../amd/display/dc/{ => dml}/calcs/dcn_calc_auto.h |    0
 .../amd/display/dc/{ => dml}/calcs/dcn_calc_math.c |    0
 .../drm/amd/display/dc/{ => dml}/calcs/dcn_calcs.c |    1 -
 .../display/dc/dml/dcn20/display_rq_dlg_calc_20.c  |    2 -
 .../dc/dml/dcn20/display_rq_dlg_calc_20v2.c        |    2 -
 .../display/dc/dml/dcn21/display_rq_dlg_calc_21.c  |    2 -
 .../display/dc/dml/dcn30/display_rq_dlg_calc_30.c  |    2 -
 .../gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c |    2 +-
 .../gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.h |    2 +-
 .../gpu/drm/amd/display/dc/dml/dcn302/dcn302_fpu.c |  357 +++
 .../gpu/drm/amd/display/dc/dml/dcn302/dcn302_fpu.h |   32 +
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |   29 +-
 .../drm/amd/display/dc/dml/display_mode_structs.h  |    1 -
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.c  |   24 +
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.h  |    3 +
 .../amd/display/dc/dml/display_rq_dlg_helpers.c    |    3 -
 .../amd/display/dc/dml/dml1_display_rq_dlg_calc.c  |    4 -
 .../gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c   |    2 +-
 .../amd/display/dc/gpio/dcn30/hw_factory_dcn30.c   |    4 +-
 .../amd/display/dc/gpio/dcn30/hw_translate_dcn30.c |    4 +-
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   13 +-
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |   56 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |    4 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h  |    2 -
 .../gpu/drm/amd/display/dc/inc/hw/link_encoder.h   |    5 +-
 .../gpu/drm/amd/display/dc/inc/hw/stream_encoder.h |   10 +-
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |    2 -
 .../drm/amd/display/dc/inc/hw_sequencer_private.h  |    2 -
 drivers/gpu/drm/amd/display/dc/inc/link_dpcd.h     |    2 +-
 drivers/gpu/drm/amd/display/dc/inc/link_enc_cfg.h  |    3 +
 drivers/gpu/drm/amd/display/dc/inc/link_hwss.h     |   86 +-
 drivers/gpu/drm/amd/display/dc/inc/reg_helper.h    |   34 +
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |   16 +-
 .../amd/display/dc/irq/dcn20/irq_service_dcn20.c   |   25 -
 .../amd/display/dc/irq/dcn20/irq_service_dcn20.h   |    2 -
 .../amd/display/dc/irq/dcn21/irq_service_dcn21.c   |   25 -
 .../amd/display/dc/irq/dcn21/irq_service_dcn21.h   |    2 -
 .../amd/display/dc/irq/dcn30/irq_service_dcn30.c   |    4 +-
 drivers/gpu/drm/amd/display/dc/irq/irq_service.c   |    2 +-
 drivers/gpu/drm/amd/display/dc/irq/irq_service.h   |    4 -
 drivers/gpu/drm/amd/display/dc/link/Makefile       |   30 +
 .../gpu/drm/amd/display/dc/link/link_hwss_dio.c    |  137 ++
 .../gpu/drm/amd/display/dc/link/link_hwss_dio.h    |   53 +
 .../gpu/drm/amd/display/dc/link/link_hwss_dpia.c   |   51 +
 .../gpu/drm/amd/display/dc/link/link_hwss_dpia.h   |   34 +
 .../gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c |  254 ++
 .../gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.h |   35 +
 .../drm/amd/display/dc/link/link_hwss_hpo_frl.c    |   43 +
 .../drm/amd/display/dc/link/link_hwss_hpo_frl.h    |   34 +
 drivers/gpu/drm/amd/display/dc/virtual/Makefile    |    2 +-
 .../amd/display/dc/virtual/virtual_link_encoder.c  |    3 +-
 .../drm/amd/display/dc/virtual/virtual_link_hwss.c |   43 +
 .../drm/amd/display/dc/virtual/virtual_link_hwss.h |   34 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   13 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |    2 +-
 .../drm/amd/display/include/bios_parser_types.h    |    2 -
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |    1 +
 .../drm/amd/display/include/ddc_service_types.h    |    5 +
 drivers/gpu/drm/amd/display/include/dpcd_defs.h    |    4 -
 .../gpu/drm/amd/display/include/grph_object_defs.h |    2 -
 .../gpu/drm/amd/display/include/grph_object_id.h   |    2 -
 .../drm/amd/display/include/link_service_types.h   |   12 -
 .../drm/amd/display/modules/inc/mod_info_packet.h  |    3 +-
 .../amd/display/modules/info_packet/info_packet.c  |   25 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |    3 +-
 .../asic_reg/{dcn => dpcs}/dpcs_3_0_0_offset.h     |    7 +
 .../asic_reg/{dcn => dpcs}/dpcs_3_0_0_sh_mask.h    |    7 +
 .../asic_reg/{dcn => dpcs}/dpcs_3_0_3_offset.h     |    0
 .../asic_reg/{dcn => dpcs}/dpcs_3_0_3_sh_mask.h    |    0
 drivers/gpu/drm/amd/include/kgd_kfd_interface.h    |    9 -
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |   13 +-
 drivers/gpu/drm/amd/pm/Makefile                    |   13 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                | 2520 ++++++++++----------
 drivers/gpu/drm/amd/pm/amdgpu_dpm_internal.c       |   95 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  614 ++---
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |  361 ++-
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm_internal.h   |   32 +
 drivers/gpu/drm/amd/pm/legacy-dpm/Makefile         |   32 +
 .../drm/amd/pm/{powerplay => legacy-dpm}/cik_dpm.h |    0
 .../drm/amd/pm/{powerplay => legacy-dpm}/kv_dpm.c  |   37 +-
 .../drm/amd/pm/{powerplay => legacy-dpm}/kv_dpm.h  |    0
 .../drm/amd/pm/{powerplay => legacy-dpm}/kv_smc.c  |    0
 drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c     | 1081 +++++++++
 drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.h     |   38 +
 .../drm/amd/pm/{powerplay => legacy-dpm}/ppsmc.h   |    0
 .../amd/pm/{powerplay => legacy-dpm}/r600_dpm.h    |    0
 .../drm/amd/pm/{powerplay => legacy-dpm}/si_dpm.c  |  188 +-
 .../drm/amd/pm/{powerplay => legacy-dpm}/si_dpm.h  |   15 +-
 .../drm/amd/pm/{powerplay => legacy-dpm}/si_smc.c  |    0
 .../pm/{powerplay => legacy-dpm}/sislands_smc.h    |    0
 drivers/gpu/drm/amd/pm/powerplay/Makefile          |    4 -
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |  400 +---
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |    4 -
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c    |   10 +-
 .../drm/amd/pm/{ => powerplay}/inc/amd_powerplay.h |    0
 .../gpu/drm/amd/pm/{ => powerplay}/inc/cz_ppsmc.h  |    0
 .../drm/amd/pm/{ => powerplay}/inc/fiji_ppsmc.h    |    0
 .../amd/pm/{ => powerplay}/inc/hardwaremanager.h   |    0
 drivers/gpu/drm/amd/pm/{ => powerplay}/inc/hwmgr.h |    4 -
 .../pm/{ => powerplay}/inc/polaris10_pwrvirus.h    |    0
 .../drm/amd/pm/{ => powerplay}/inc/power_state.h   |    0
 .../gpu/drm/amd/pm/{ => powerplay}/inc/pp_debug.h  |    0
 .../gpu/drm/amd/pm/{ => powerplay}/inc/pp_endian.h |    0
 .../drm/amd/pm/{ => powerplay}/inc/pp_thermal.h    |    0
 .../drm/amd/pm/{ => powerplay}/inc/ppinterrupt.h   |    0
 .../gpu/drm/amd/pm/{ => powerplay}/inc/rv_ppsmc.h  |    0
 drivers/gpu/drm/amd/pm/{ => powerplay}/inc/smu10.h |    0
 .../amd/pm/{ => powerplay}/inc/smu10_driver_if.h   |    0
 .../amd/pm/{ => powerplay}/inc/smu11_driver_if.h   |    0
 drivers/gpu/drm/amd/pm/{ => powerplay}/inc/smu7.h  |    0
 drivers/gpu/drm/amd/pm/{ => powerplay}/inc/smu71.h |    0
 .../amd/pm/{ => powerplay}/inc/smu71_discrete.h    |    0
 drivers/gpu/drm/amd/pm/{ => powerplay}/inc/smu72.h |    0
 .../amd/pm/{ => powerplay}/inc/smu72_discrete.h    |    0
 drivers/gpu/drm/amd/pm/{ => powerplay}/inc/smu73.h |    0
 .../amd/pm/{ => powerplay}/inc/smu73_discrete.h    |    0
 drivers/gpu/drm/amd/pm/{ => powerplay}/inc/smu74.h |    0
 .../amd/pm/{ => powerplay}/inc/smu74_discrete.h    |    0
 drivers/gpu/drm/amd/pm/{ => powerplay}/inc/smu75.h |    0
 .../amd/pm/{ => powerplay}/inc/smu75_discrete.h    |    0
 .../drm/amd/pm/{ => powerplay}/inc/smu7_common.h   |    0
 .../drm/amd/pm/{ => powerplay}/inc/smu7_discrete.h |    0
 .../drm/amd/pm/{ => powerplay}/inc/smu7_fusion.h   |    0
 .../drm/amd/pm/{ => powerplay}/inc/smu7_ppsmc.h    |    0
 drivers/gpu/drm/amd/pm/{ => powerplay}/inc/smu8.h  |    0
 .../drm/amd/pm/{ => powerplay}/inc/smu8_fusion.h   |    0
 drivers/gpu/drm/amd/pm/{ => powerplay}/inc/smu9.h  |    0
 .../amd/pm/{ => powerplay}/inc/smu9_driver_if.h    |    0
 .../amd/pm/{ => powerplay}/inc/smu_ucode_xfer_cz.h |    2 +-
 .../amd/pm/{ => powerplay}/inc/smu_ucode_xfer_vi.h |    0
 .../gpu/drm/amd/pm/{ => powerplay}/inc/smumgr.h    |    0
 .../drm/amd/pm/{ => powerplay}/inc/tonga_ppsmc.h   |    0
 .../drm/amd/pm/{ => powerplay}/inc/vega10_ppsmc.h  |    0
 .../pm/{ => powerplay}/inc/vega12/smu9_driver_if.h |    0
 .../drm/amd/pm/{ => powerplay}/inc/vega12_ppsmc.h  |    0
 .../drm/amd/pm/{ => powerplay}/inc/vega20_ppsmc.h  |    0
 .../gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c    |    4 +-
 .../gpu/drm/amd/pm/powerplay/smumgr/smu10_smumgr.c |    4 +-
 .../gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.c  |   11 +-
 .../gpu/drm/amd/pm/powerplay/smumgr/smu9_smumgr.c  |    2 +-
 .../drm/amd/pm/powerplay/smumgr/vega20_smumgr.c    |    8 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  658 ++---
 .../gpu/drm/amd/pm/{ => swsmu}/inc/amdgpu_smu.h    |   49 +-
 .../{inc => swsmu/inc/pmfw_if}/aldebaran_ppsmc.h   |    0
 .../pm/{inc => swsmu/inc/pmfw_if}/arcturus_ppsmc.h |    0
 .../inc/pmfw_if}/smu11_driver_if_arcturus.h        |    0
 .../inc/pmfw_if}/smu11_driver_if_cyan_skillfish.h  |    0
 .../inc/pmfw_if}/smu11_driver_if_navi10.h          |    0
 .../inc/pmfw_if}/smu11_driver_if_sienna_cichlid.h  |   24 +-
 .../inc/pmfw_if}/smu11_driver_if_vangogh.h         |    0
 .../{inc => swsmu/inc/pmfw_if}/smu12_driver_if.h   |    0
 .../inc/pmfw_if}/smu13_driver_if_aldebaran.h       |    0
 .../inc/pmfw_if}/smu13_driver_if_yellow_carp.h     |    0
 .../{inc => swsmu/inc/pmfw_if}/smu_v11_0_7_ppsmc.h |    0
 .../{inc => swsmu/inc/pmfw_if}/smu_v11_0_ppsmc.h   |    0
 .../pm/{inc => swsmu/inc/pmfw_if}/smu_v11_5_pmfw.h |    0
 .../{inc => swsmu/inc/pmfw_if}/smu_v11_5_ppsmc.h   |    0
 .../pm/{inc => swsmu/inc/pmfw_if}/smu_v11_8_pmfw.h |    0
 .../{inc => swsmu/inc/pmfw_if}/smu_v11_8_ppsmc.h   |    0
 .../{inc => swsmu/inc/pmfw_if}/smu_v12_0_ppsmc.h   |    0
 .../{inc => swsmu/inc/pmfw_if}/smu_v13_0_1_pmfw.h  |    0
 .../{inc => swsmu/inc/pmfw_if}/smu_v13_0_1_ppsmc.h |    0
 .../amd/pm/{ => swsmu}/inc/smu_11_0_cdr_table.h    |    0
 drivers/gpu/drm/amd/pm/{ => swsmu}/inc/smu_types.h |    0
 drivers/gpu/drm/amd/pm/{ => swsmu}/inc/smu_v11_0.h |    0
 .../amd/pm/{ => swsmu}/inc/smu_v11_0_7_pptable.h   |    0
 .../drm/amd/pm/{ => swsmu}/inc/smu_v11_0_pptable.h |    0
 drivers/gpu/drm/amd/pm/{ => swsmu}/inc/smu_v12_0.h |    0
 drivers/gpu/drm/amd/pm/{ => swsmu}/inc/smu_v13_0.h |    0
 .../drm/amd/pm/{ => swsmu}/inc/smu_v13_0_pptable.h |    0
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |  102 +-
 .../drm/amd/pm/swsmu/smu11/cyan_skillfish_ppt.c    |   70 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |  426 +++-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |  270 ++-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.h    |    8 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |   70 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |   59 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |   16 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c     |   10 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |   90 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   75 +-
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |   38 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |  221 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |   16 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_internal.h        |    8 +-
 drivers/gpu/drm/radeon/cik.c                       |    2 +-
 drivers/gpu/drm/radeon/evergreen.c                 |    2 +-
 drivers/gpu/drm/radeon/ni.c                        |    2 +-
 drivers/gpu/drm/radeon/r600.c                      |    2 +-
 drivers/gpu/drm/radeon/radeon_device.c             |   19 +-
 drivers/gpu/drm/radeon/radeon_kms.c                |   22 +-
 drivers/gpu/drm/radeon/radeon_object.c             |    1 -
 drivers/gpu/drm/radeon/radeon_uvd.c                |    5 +-
 drivers/gpu/drm/radeon/rv770.c                     |    2 +-
 drivers/gpu/drm/radeon/si.c                        |    2 +-
 include/uapi/drm/amdgpu_drm.h                      |   19 +-
 include/uapi/linux/kfd_ioctl.h                     |   92 +-
 414 files changed, 13850 insertions(+), 11078 deletions(-)
 delete mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c
 delete mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.h
 delete mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_dbgmgr.c
 delete mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_dbgmgr.h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/calcs/Makefile
 delete mode 100644 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
 rename drivers/gpu/drm/amd/display/dc/{ => dml}/calcs/bw_fixed.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dml}/calcs/calcs_logger.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dml}/calcs/custom_float.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dml}/calcs/dce_calcs.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => dml}/calcs/dcn_calc_auto.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dml}/calcs/dcn_calc_auto.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dml}/calcs/dcn_calc_math.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dml}/calcs/dcn_calcs.c (99%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn302/dcn302_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn302/dcn302_fpu.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_hwss_dio.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_hwss_dio.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_hwss_dpia.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_hwss_dpia.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_hwss_hpo_frl.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_hwss_hpo_frl.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/virtual/virtual_link_hwss.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/virtual/virtual_link_hwss.h
 rename drivers/gpu/drm/amd/include/asic_reg/{dcn => dpcs}/dpcs_3_0_0_offset.h (99%)
 rename drivers/gpu/drm/amd/include/asic_reg/{dcn => dpcs}/dpcs_3_0_0_sh_mask.h (99%)
 rename drivers/gpu/drm/amd/include/asic_reg/{dcn => dpcs}/dpcs_3_0_3_offset.h (100%)
 rename drivers/gpu/drm/amd/include/asic_reg/{dcn => dpcs}/dpcs_3_0_3_sh_mask.h (100%)
 create mode 100644 drivers/gpu/drm/amd/pm/amdgpu_dpm_internal.c
 create mode 100644 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm_internal.h
 create mode 100644 drivers/gpu/drm/amd/pm/legacy-dpm/Makefile
 rename drivers/gpu/drm/amd/pm/{powerplay => legacy-dpm}/cik_dpm.h (100%)
 rename drivers/gpu/drm/amd/pm/{powerplay => legacy-dpm}/kv_dpm.c (99%)
 rename drivers/gpu/drm/amd/pm/{powerplay => legacy-dpm}/kv_dpm.h (100%)
 rename drivers/gpu/drm/amd/pm/{powerplay => legacy-dpm}/kv_smc.c (100%)
 create mode 100644 drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c
 create mode 100644 drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.h
 rename drivers/gpu/drm/amd/pm/{powerplay => legacy-dpm}/ppsmc.h (100%)
 rename drivers/gpu/drm/amd/pm/{powerplay => legacy-dpm}/r600_dpm.h (100%)
 rename drivers/gpu/drm/amd/pm/{powerplay => legacy-dpm}/si_dpm.c (98%)
 rename drivers/gpu/drm/amd/pm/{powerplay => legacy-dpm}/si_dpm.h (99%)
 rename drivers/gpu/drm/amd/pm/{powerplay => legacy-dpm}/si_smc.c (100%)
 rename drivers/gpu/drm/amd/pm/{powerplay => legacy-dpm}/sislands_smc.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/amd_powerplay.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/cz_ppsmc.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/fiji_ppsmc.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/hardwaremanager.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/hwmgr.h (99%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/polaris10_pwrvirus.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/power_state.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/pp_debug.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/pp_endian.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/pp_thermal.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/ppinterrupt.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/rv_ppsmc.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/smu10.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/smu10_driver_if.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/smu11_driver_if.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/smu7.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/smu71.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/smu71_discrete.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/smu72.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/smu72_discrete.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/smu73.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/smu73_discrete.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/smu74.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/smu74_discrete.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/smu75.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/smu75_discrete.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/smu7_common.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/smu7_discrete.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/smu7_fusion.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/smu7_ppsmc.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/smu8.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/smu8_fusion.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/smu9.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/smu9_driver_if.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/smu_ucode_xfer_cz.h (99%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/smu_ucode_xfer_vi.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/smumgr.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/tonga_ppsmc.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/vega10_ppsmc.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/vega12/smu9_driver_if.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/vega12_ppsmc.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => powerplay}/inc/vega20_ppsmc.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => swsmu}/inc/amdgpu_smu.h (97%)
 rename drivers/gpu/drm/amd/pm/{inc => swsmu/inc/pmfw_if}/aldebaran_ppsmc.h (100%)
 rename drivers/gpu/drm/amd/pm/{inc => swsmu/inc/pmfw_if}/arcturus_ppsmc.h (100%)
 rename drivers/gpu/drm/amd/pm/{inc => swsmu/inc/pmfw_if}/smu11_driver_if_arcturus.h (100%)
 rename drivers/gpu/drm/amd/pm/{inc => swsmu/inc/pmfw_if}/smu11_driver_if_cyan_skillfish.h (100%)
 rename drivers/gpu/drm/amd/pm/{inc => swsmu/inc/pmfw_if}/smu11_driver_if_navi10.h (100%)
 rename drivers/gpu/drm/amd/pm/{inc => swsmu/inc/pmfw_if}/smu11_driver_if_sienna_cichlid.h (99%)
 rename drivers/gpu/drm/amd/pm/{inc => swsmu/inc/pmfw_if}/smu11_driver_if_vangogh.h (100%)
 rename drivers/gpu/drm/amd/pm/{inc => swsmu/inc/pmfw_if}/smu12_driver_if.h (100%)
 rename drivers/gpu/drm/amd/pm/{inc => swsmu/inc/pmfw_if}/smu13_driver_if_aldebaran.h (100%)
 rename drivers/gpu/drm/amd/pm/{inc => swsmu/inc/pmfw_if}/smu13_driver_if_yellow_carp.h (100%)
 rename drivers/gpu/drm/amd/pm/{inc => swsmu/inc/pmfw_if}/smu_v11_0_7_ppsmc.h (100%)
 rename drivers/gpu/drm/amd/pm/{inc => swsmu/inc/pmfw_if}/smu_v11_0_ppsmc.h (100%)
 rename drivers/gpu/drm/amd/pm/{inc => swsmu/inc/pmfw_if}/smu_v11_5_pmfw.h (100%)
 rename drivers/gpu/drm/amd/pm/{inc => swsmu/inc/pmfw_if}/smu_v11_5_ppsmc.h (100%)
 rename drivers/gpu/drm/amd/pm/{inc => swsmu/inc/pmfw_if}/smu_v11_8_pmfw.h (100%)
 rename drivers/gpu/drm/amd/pm/{inc => swsmu/inc/pmfw_if}/smu_v11_8_ppsmc.h (100%)
 rename drivers/gpu/drm/amd/pm/{inc => swsmu/inc/pmfw_if}/smu_v12_0_ppsmc.h (100%)
 rename drivers/gpu/drm/amd/pm/{inc => swsmu/inc/pmfw_if}/smu_v13_0_1_pmfw.h (100%)
 rename drivers/gpu/drm/amd/pm/{inc => swsmu/inc/pmfw_if}/smu_v13_0_1_ppsmc.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => swsmu}/inc/smu_11_0_cdr_table.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => swsmu}/inc/smu_types.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => swsmu}/inc/smu_v11_0.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => swsmu}/inc/smu_v11_0_7_pptable.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => swsmu}/inc/smu_v11_0_pptable.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => swsmu}/inc/smu_v12_0.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => swsmu}/inc/smu_v13_0.h (100%)
 rename drivers/gpu/drm/amd/pm/{ => swsmu}/inc/smu_v13_0_pptable.h (100%)
