Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3707C7C8CA9
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 19:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A350110E624;
	Fri, 13 Oct 2023 17:58:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::60a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2792010E004;
 Fri, 13 Oct 2023 17:58:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JdHRU9ooUAcQFK2YxsYchmHUrK+sZXbLdIfqvk31hFwEfNpsNVPDwCddFqWbdR5osdkcYfWKX98RtymXqvLQ1Lr0Zw9NiJiS+bD4oWR3wQ7rKbrEAQElCzdHDVVGNXk72T23lISku7+xa1gYqS51cLXTiApZ8Ee9Im/z4zyF4YRgLnXEBmuML1ISj3ZRvJCtx/TEX6OTbmuyYK/R07UzZDVPRZFnNug2Jex8+r9t0MFUEdqqqmkhwlWHaBNjGoHCOp+PkxDjZ5w+3bInUQh1nGTbgOJv/Y1eRBr32Al3RsVYeP6E9Zpu1dNF9cJq7gnP0HRWq2qyrBrwfMDXmOs3FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+87CCRAPrzEEAYCPh2ZoTK02m+sgN2Pj3RBQeI+4Dw=;
 b=N5Xi84Y/cRqBNOrRI59nLrUsgnzRZ7S51wiLsdXlSx8uxpskVhERBFerCK4P/WuntY0oLLD7on4RCe0Ku5fx6HGCrvmpagcS/IvG+Ly0GcLf9cdn8sg23HMGA/0EBK20wdoTl1wiGm8dHv8TGsiZK1Wo4QXzk4iqXo4Kkj2N3US0rszFj3waz4EADWa8EOy+CZIjCeqtCgnFcGhIusi9m+AoikBWj3AlfkLEuj/UXeKVmQztP/dZ4FITkuEmcOqlUGWunzhbop+kRclcql1DzNfRxIP1jLmr4CJs2W7O3Y6vWW1I/Dv8dVzEukOiqgBJOT7BRH22scCqz9mkANwxIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+87CCRAPrzEEAYCPh2ZoTK02m+sgN2Pj3RBQeI+4Dw=;
 b=V3ib4Ju0JA/pJ1lUgD3SK2hPX5VBqkfACaNI5+EndKnlgXdBCZ8qS7fDrPA2XgwB2Xl1DbxHr6nDcbud0clAwihsL4zGKCl5Gb9vxK9MBtKxMzSuhSh5IBcz/yiKYyhlcHOdX3Fl4hbHypPrfkHOnTrDxbFIMI+ISwv4y99VfKA=
Received: from PA7P264CA0165.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:36c::13)
 by IA1PR12MB6066.namprd12.prod.outlook.com (2603:10b6:208:3ee::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Fri, 13 Oct
 2023 17:58:13 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10a6:102:36c:cafe::2d) by PA7P264CA0165.outlook.office365.com
 (2603:10a6:102:36c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.43 via Frontend
 Transport; Fri, 13 Oct 2023 17:58:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Fri, 13 Oct 2023 17:58:11 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 13 Oct
 2023 12:58:10 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd, radeon, UAPI drm-next-6.7
Date: Fri, 13 Oct 2023 13:57:57 -0400
Message-ID: <20231013175758.1735031-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|IA1PR12MB6066:EE_
X-MS-Office365-Filtering-Correlation-Id: f0c3b7a6-f565-43b3-f615-08dbcc15f73d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iQ66fvAmXzGxoYGWYARkOm2Q+/8mchrbA+UqGtnGQ5McUdCiuGl9wtqbSiGo7iKWsA0Gvou8wYmQcH9Y6Ig2MyoG5ZTbVVj1bsYetbtfGfx8lcYhaJTM3JjDi+vzkUVMRKfZW4i3qB5/3vukv07SC4oKvPjvOl52REoMj5hT4SW1XKiAEQPnrG5eyFLqt2AzvZie2UMYqtUEnXD6HpfekAKlFzuRMadfEEYAVaiaBICKWbe4rPnQ04oc1nxbuLZTlEDimuZTRDqZmfWju9e/MyaaZk2zBpsO1RGi/fbwalP7hg1APv15ihU+YF2yCcTkHRk7W+J79hCcFCYuNUZiSOW4hBzF2ixBnNbtth3uUWlWfN1eP25WPrMWM+2J50PhKMrdaM+44qZZqctb+b4ZwdesHILpWoZSRUnhscycLvM0yRo6A3JvGWy/5jum2962B2GoFW9o1BJUqElmjqP759g4EAydiBuLAryzbqelqeKci55HlXZWB6ERzVgUXh5rc4OPrmIhCk5XX2fsOlJKw3zgZQ5e5yGKAmbur06We7XJhfWwIxKrjv+ME0JKM9AlKWwkHBQFKZgerUndWqdK2TRp4IQJLGBipHt5kqcUOimlcRqDe9HRJ2j7gAcmiVbh85wXoiCueJlfV/L80z9sSODd3GWh+Fsqzs05x40x6Ho03dhriP+Nc2WT6PPD+Gzt3yef8ciJ9I31pxKMruSvmBxQgOnv+5/BMCzlj81b64+KeyxUBTfEoCWWJsMCRZc0Gx5JTMgL689TtbTNN7HUjYWww0As6GDqjBT44rRth4Q=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(346002)(39860400002)(136003)(376002)(230922051799003)(451199024)(82310400011)(64100799003)(186009)(1800799009)(40470700004)(46966006)(36840700001)(66574015)(4326008)(336012)(426003)(1076003)(16526019)(26005)(8936002)(8676002)(40460700003)(47076005)(40480700001)(82740400003)(81166007)(356005)(2906002)(86362001)(36860700001)(4001150100001)(36756003)(41300700001)(5660300002)(83380400001)(30864003)(7696005)(966005)(478600001)(6666004)(316002)(70586007)(110136005)(70206006)(2616005)(36900700001)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 17:58:11.6844 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c3b7a6-f565-43b3-f615-08dbcc15f73d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6066
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

New stuff for 6.7.

The following changes since commit 3698a75f5a98d0a6599e2878ab25d30a82dd836a:

  Merge tag 'drm-intel-next-fixes-2023-08-24' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2023-08-25 12:55:55 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.7-2023-10-13

for you to fetch changes up to cd90511557fdfb394bb4ac4c3b539b007383914c:

  drm/amdgpu/vkms: fix a possible null pointer dereference (2023-10-13 11:36:25 -0400)

----------------------------------------------------------------
amd-drm-next-6.7-2023-10-13:

amdgpu:
- DC replay fixes
- Misc code cleanups and spelling fixes
- Documentation updates
- RAS EEPROM Updates
- FRU EEPROM Updates
- IP discovery updates
- SR-IOV fixes
- RAS updates
- DC PQ fixes
- SMU 13.0.6 updates
- GC 11.5 Support
- NBIO 7.11 Support
- GMC 11 Updates
- Reset fixes
- SMU 11.5 Updates
- SMU 13.0 OD support
- Use flexible arrays for bo list handling
- W=1 Fixes
- SubVP fixes
- DPIA fixes
- DCN 3.5 Support
- Devcoredump fixes
- VPE 6.1 support
- VCN 4.0 Updates
- S/G display fixes
- DML fixes
- DML2 Support
- MST fixes
- VRR fixes
- Enable seamless boot in more cases
- Enable content type property for HDMI
- OLED fixes
- Rework and clean up GPUVM TLB flushing
- DC ODM fixes
- DP 2.x fixes
- AGP aperture fixes
- SDMA firmware loading cleanups
- Cyan Skillfish GPU clock counter fix
- GC 11 GART fix
- Cache GPU fault info for userspace queries
- DC cursor check fixes
- eDP fixes
- DC FP handling fixes
- Variable sized array fixes
- SMU 13.0.x fixes
- IB start and size alignment fixes for VCN
- SMU 14 Support
- Suspend and resume sequence rework
- vkms fix

amdkfd:
- GC 11 fixes
- GC 10 fixes
- Doorbell fixes
- CWSR fixes
- SVM fixes
- Clean up GC info enumeration
- Rework memory limit handling
- Coherent memory handling fixes
- Use partial migrations in GPU faults
- TLB flush fixes
- DMA unmap fixes
- GC 9.4.3 fixes
- SQ interrupt fix
- GTT mapping fix
- GC 11.5 Support

radeon:
- Misc code cleanups
- W=1 Fixes
- Fix possible buffer overflow
- Fix possible NULL pointer dereference

UAPI:
- Add EXT_COHERENT memory allocation flags.  These allow for system scope atomics.
  Proposed userspace: https://github.com/RadeonOpenCompute/ROCT-Thunk-Interface/pull/88
- Add support for new VPE engine.  This is a memory to memory copy engine with advanced scaling, CSC, and color management features
  Proposed mesa MR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25713
- Add INFO IOCTL interface to query GPU faults
  Proposed Mesa MR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23238
  Proposed libdrm MR: https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/298

----------------------------------------------------------------
Aaron Liu (4):
      drm/amdgpu: add golden setting for gc_11_5_0
      drm/amdgpu: add imu firmware support for gc_11_5_0
      drm/amdgpu: add mes firmware support for gc_11_5_0
      drm/amdgpu/discovery: enable DCN 3.5.0 support

Agustin Gutierrez (1):
      drm/amd/display: Optimize OLED T7 delay

Alex Deucher (20):
      drm/amd/pm: fix debugfs pm_info output
      drm/amd/pm: fix error flow in sensor fetching
      drm/amdgpu/soc21: don't remap HDP registers for SR-IOV
      drm/amdgpu/nbio4.3: set proper rmmio_remap.reg_offset for SR-IOV
      drm/amdgpu: add vcn_doorbell_range callback for nbio 7.11
      drm/amdgpu: add remap_hdp_registers callback for nbio 7.11
      drm/amdgpu: add VPE IP discovery info to HW IP info query
      drm/amd/display: fix some style issues
      drm/amdgpu/gmc6-8: properly disable the AGP aperture
      drm/amdgpu/gmc: set a default disable value for AGP
      drm/amdgpu/gmc11: disable AGP on GC 11.5
      drm/amdkfd: reduce stack size in kfd_topology_add_device()
      drm/amdkfd: drop struct kfd_cu_info
      drm/amdgpu/gmc: add a way to force a particular placement for GART
      drm/amdgpu/gmc11: set gart placement GC11
      drm/amdgpu: add cached GPU fault structure to vm struct
      drm/amdgpu: cache gpuvm fault information for gmc7+
      drm/amdgpu: add new INFO ioctl query for the last GPU page fault
      drm/amdgpu: refine fault cache updates
      drm/amdgpu: Enable SMU 13.0.0 optimizations when ROCm is active (v2)

Alex Hung (31):
      drm/amd/display: skip audio config for virtual signal
      drm/amd/display: Remove unwanted drm edid references
      drm/amd/display: Initialize writeback connector
      drm/amd/display: Hande writeback request from userspace
      drm/amd/display: Add writeback enable/disable in dc
      drm/amd/display: Fix writeback_info never got updated
      drm/amd/display: Validate hw_points_num before using it
      drm/amd/display: Fix writeback_info is not removed
      drm/amd/display: Add writeback enable field (wb_enabled)
      drm/amd/display: Setup for mmhubbub3_warmup_mcif with big buffer
      drm/amd/display: Add new set_fc_enable to struct dwbc_funcs
      drm/amd/display: Disable DWB frame capture to emulate oneshot
      drm/amd/display: Revert "drm/amd/display: Use drm_connector in create_validate_stream_for_sink"
      Revert "drm/amd/display: Disable DWB frame capture to emulate oneshot"
      Revert "drm/amd/display: Add new set_fc_enable to struct dwbc_funcs"
      Revert "drm/amd/display: Setup for mmhubbub3_warmup_mcif with big buffer"
      Revert "drm/amd/display: Add writeback enable field (wb_enabled)"
      Revert "drm/amd/display: Fix writeback_info is not removed"
      Revert "drm/amd/display: Validate hw_points_num before using it"
      Revert "drm/amd/display: Fix writeback_info never got updated"
      Revert "drm/amd/display: Add writeback enable/disable in dc"
      Revert "drm/amd/display: Hande writeback request from userspace"
      Revert "drm/amd/display: Create fake sink and stream for writeback connector"
      Revert "drm/amd/display: Create amdgpu_dm_wb_connector"
      Revert "drm/amd/display: Use drm_connector in create_stream_for_sink"
      Revert "drm/amd/display: Return drm_connector from find_first_crtc_matching_connector"
      Revert "drm/amd/display: Skip writeback connector when we get amdgpu_dm_connector"
      Revert "drm/amd/display: Initialize writeback connector"
      Revert "drm/amd/display: Disable virtual links"
      Revert "drm/amd/display: Create one virtual connector in DC"
      Revert "drm/amd/display: Skip entire amdgpu_dm build if !CONFIG_DRM_AMD_DC"

Alex Sierra (2):
      drm/amdkfd: retry after EBUSY is returned from hmm_ranges_get_pages
      drm/amdkfd: use mask to get v9 interrupt sq data bits correctly

Alvin Lee (6):
      drm/amd/display: Write flip addr to scratch reg for subvp
      drm/amd/display: Save addr update in scratch before flip
      drm/amd/display: Blank phantom OTG before enabling
      drm/amd/display: Don't lock phantom pipe on disabling
      drm/amd/display: Break after finding supported vlevel for repopulate
      drm/amd/display: Update cursor limits based on SW cursor fallback limits

André Almeida (4):
      drm/amdgpu: Allocate coredump memory in a nonblocking way
      drm/amdgpu: Merge debug module parameters
      drm/amdgpu: Create an option to disable soft recovery
      drm/amdgpu: Rework coredump to use memory dynamically

Anthony Koo (3):
      drm/amd/display: [FW Promotion] Release 0.0.180.0
      drm/amd/display: [FW Promotion] Release 0.0.181.0
      drm/amd/display: [FW Promotion] Release 0.0.183.0

Aric Cyr (9):
      drm/amd/display: 3.2.248
      drm/amd/display: 3.2.250
      drm/amd/display: 3.2.251
      drm/amd/display: 3.2.252
      drm/amd/display: 3.2.253
      drm/amd/display: Clean up code warnings
      drm/amd/display: 3.2.254
      drm/amd/display: Revert "drm/amd/display: remove duplicated edp relink to fastboot"
      drm/amd/display: 3.2.255

Artem Grishin (1):
      drm/amd/display: STREAM_MAPPER_CONTROL register offset on DCN35

Arvind Yadav (1):
      drm/amdkfd: get doorbell's absolute offset based on the db_size

Asad Kamal (9):
      drm/amd/pm: Update SMUv13.0.6 PMFW headers
      drm/amd/pm: Add critical temp for GC v9.4.3
      drm/amd/pm: Fix critical temp unit of SMU v13.0.6
      drm/amdkfd: Replace pr_err with dev_err
      drm/amd/pm: Remove set df cstate for SMUv13.0.6
      drm/amd/pm: Update metric table for smu v13_0_6
      drm/amd/pm: Add gpu_metrics_v1_4
      drm/amd/pm: Use gpu_metrics_v1_4 for SMUv13.0.6
      drm/amdgpu: Expose ras version & schema info

Aurabindo Pillai (9):
      drm/amd/display: Expose mall capability
      drm/amd/display: Enable runtime register offset init for DCN32 DMUB
      drm/amd/display: Fix incorrect comment
      drm/amd/display: Add debugfs interface for ODM combine info
      drm/amd/display: set default return value for ODM Combine debugfs
      drm/amd/display: Add DCHUBBUB callback to report MALL status
      drm/amd/display: Update DMUB cmd header
      drm/amd/display: Adjust code style for dmub_cmd.h
      drm/amd/display: Adjust code style for hw_sequencer.h

Austin Zheng (1):
      drm/amd/display: Add check for vrr_active_fixed

Bhawanpreet Lakha (2):
      drm/amd/display: Enable Replay for static screen use cases
      drm/amd/display: Add dirty rect support for Replay

Bob Zhou (1):
      drm/amd/display: add missing NULL check for DML2

Bokun Zhang (1):
      drm/amdgpu/pm: Add notification for no DC support

Boyuan Zhang (1):
      drm/amdgpu: update ib start and size alignment

Candice Li (5):
      drm/amdgpu: Only support RAS EEPROM on dGPU platform
      drm/amdgpu: Add RREG64_PCIE_EXT/WREG64_PCIE_EXT functions
      drm/amdgpu: Update amdgpu_device_indirect_r/wreg_ext
      drm/amd: Add umc v12_0_0 ip headers
      drm/amdgpu: Add umc v12_0 ras functions

Charlene Liu (9):
      drm/amd/display: correct z8_watermark 16bit to 20bit mask
      drm/amd/display: fix some non-initialized register mask and setting
      drm/amd/display: Temporarily disable clock gating
      drm/amd/display: Add z8_marks related in dml for DCN35
      drm/amd/display: Correct z8 watermark mask
      drm/amd/display: fix some non-initialized register mask and setting
      drm/amd/display: Add z8_marks in dml
      drm/amd/display: correct dml2 input and dlg_refclk
      drm/amd/display: Update pmfw_driver_if new structure

Chen Jiahao (1):
      drm/amd/amdgpu: Use kmemdup to simplify kmalloc and memcpy logic

Chiawen Huang (1):
      drm/amd/display: remove duplicated edp relink to fastboot

Christian König (13):
      drm/amdgpu: fix amdgpu_cs_p1_user_fence
      drm/amdgpu: fix and cleanup gmc_v9_0_flush_gpu_tlb
      drm/amdgpu: rework gmc_v10_0_flush_gpu_tlb v2
      drm/amdgpu: cleanup gmc_v11_0_flush_gpu_tlb
      drm/amdgpu: fix and cleanup gmc_v7_0_flush_gpu_tlb_pasid
      drm/amdgpu: fix and cleanup gmc_v8_0_flush_gpu_tlb_pasid
      drm/amdgpu: fix and cleanup gmc_v9_0_flush_gpu_tlb_pasid
      drm/amdgpu: cleanup gmc_v10_0_flush_gpu_tlb_pasid
      drm/amdgpu: fix and cleanup gmc_v11_0_flush_gpu_tlb_pasid
      drm/amdgpu: drop error return from flush_gpu_tlb_pasid
      drm/amdgpu: rework lock handling for flush_tlb v2
      drm/amdgpu: further move TLB hw workarounds a layer up
      drm/amdgpu: add missing NULL check

Christophe JAILLET (4):
      drm/amdgpu: Explicitly add a flexible array at the end of 'struct amdgpu_bo_list'
      drm/amdgpu: Remove a redundant sanity check
      drm/amdgpu: Remove amdgpu_bo_list_array_entry()
      drm/amdgpu: Use kvzalloc() to simplify code

ChunTao Tso (1):
      drm/amd/display: set minimum of VBlank_nom

Colin Ian King (1):
      drm/amd: Fix spelling mistake "throtting" -> "throttling"

Cong Liu (2):
      drm/amdgpu: fix a memory leak in amdgpu_ras_feature_enable
      drm/amd/display: Fix null pointer dereference in error message

Dan Carpenter (2):
      drm/amdgpu: fix retry loop test
      drm/amd/pm: delete dead code

Daniel Miess (2):
      drm/amd/display: Port replay vblank logic to DML2
      drm/amd/display: Don't set dpms_off for seamless boot

Darren Powell (8):
      amdgpu/pm: Replace print_clock_levels with emit_clock_levels for arcturus
      amdgpu/pm: Optimize emit_clock_levels for arcturus - part 1
      amdgpu/pm: Optimize emit_clock_levels for arcturus - part 2
      amdgpu/pm: Optimize emit_clock_levels for arcturus - part 3
      amdgpu/pm: Replace print_clock_levels with emit_clock_levels for aldebaran
      amdgpu/pm: Optimize emit_clock_levels for aldebaran - part 1
      amdgpu/pm: Optimize emit_clock_levels for aldebaran - part 2
      amdgpu/pm: Optimize emit_clock_levels for aldebaran - part 3

David (Ming Qiang) Wu (1):
      drm/amdgpu: not to save bo in the case of RAS err_event_athub

David Francis (3):
      drm/amdkfd: Checkpoint and restore queues on GFX11
      drm/amdgpu: Handle null atom context in VBIOS info ioctl
      drm/amdgpu: Add EXT_COHERENT memory allocation flags

Dembskiy Igor (1):
      drm/amd/display: remove useless check in should_enable_fbc()

Dillon Varone (2):
      drm/amd/display: Skip dmub memory flush when not needed
      drm/amd/display: add dp dto programming function to dccg

Dmytro Laktyushkin (1):
      drm/amd/display: block MPO if it prevents pstate support

Duncan Ma (4):
      drm/amd/display: Fix dig register undefined
      drm/amd/display: Update driver and IPS interop
      drm/amd/display: Improve x86 and dmub ips handshake
      drm/amd/display: Update stream mask

Ethan Bitnun (2):
      drm/amd/display: Add support for 1080p SubVP to reduce idle power
      drm/amd/display: Add new logs for AutoDPMTest

Evan Quan (10):
      drm/amd/pm: correct SMU13 gfx voltage related OD settings
      drm/amd/pm: fulfill the support for SMU13 `pp_dpm_dcefclk` interface
      drm/amd/pm: introduce a new set of OD interfaces
      drm/amdgpu: revise the device initialization sequences
      drm/amd/pm: add fan temperature/pwm curve OD setting support for SMU13
      drm/amd/pm: add fan acoustic limit OD setting support for SMU13
      drm/amd/pm: add fan acoustic target OD setting support for SMU13
      drm/amd/pm: add fan target temperature OD setting support for SMU13
      drm/amd/pm: add fan minimum pwm OD setting support for SMU13
      Revert "drm/amd/pm: disable the SMU13 OD feature support temporarily"

Fudong Wang (1):
      drm/amd/display: Add smu write msg id fail retry process

Gabe Teeger (5):
      drm/amd/display: Remove wait while locked
      drm/amd/display: Add option to flip ODM optimization
      drm/amd/display: Rename DisableMinDispClkODM in dc_config
      drm/amd/display: Add Null check for DPP resource
      drm/amd/display: add check in validate_only in dml2

George Shen (2):
      drm/amd/display: Refactor DPG test pattern logic for ODM cases
      drm/amd/display: Disable SubVP if test pattern is enabled

Hamza Mahfooz (10):
      drm/amd/display: fix mode scaling (RMX_.*)
      drm/amdgpu: register a dirty framebuffer callback for fbcon
      drm/amd/display: register edp_backlight_control() for DCN301
      Revert "Revert "drm/amd/display: Implement zpos property""
      Revert "drm/amd/display: Remove v_startup workaround for dcn3+"
      drm/amd/display: limit the v_startup workaround to ASICs older than DCN3.1
      drm/amd/display: prevent potential division by zero errors
      Revert "drm/amd: Disable S/G for APUs when 64GB or more host memory"
      drm/amd/display: fix the ability to use lower resolution modes on eDP
      drm/amd/display: switch DC over to the new DRM logging macros

Harish Kasiviswanathan (2):
      drm/amdkfd: ratelimited SQ interrupt messages
      drm/amdkfd: Insert missing TLB flush on GFX10 and later

Harry Wentland (8):
      drm/amd/display: Skip entire amdgpu_dm build if !CONFIG_DRM_AMD_DC
      drm/amd/display: Create one virtual connector in DC
      drm/amd/display: Skip writeback connector when we get amdgpu_dm_connector
      drm/amd/display: Return drm_connector from find_first_crtc_matching_connector
      drm/amd/display: Use drm_connector in create_stream_for_sink
      drm/amd/display: Use drm_connector in create_validate_stream_for_sink
      drm/amd/display: Create amdgpu_dm_wb_connector
      drm/amd/display: Create fake sink and stream for writeback connector

Hawking Zhang (7):
      drm/amdgpu: Fix the return for gpu mode1_reset
      drm/amdgpu: Allow issue disable gfx ras cmd to firmware
      drm/amdgpu: Add umc_info v4_0 structure
      drm/amdgpu: Support query ecc cap for aqua_vanjaram
      drm/amdgpu: Free ras cmd input buffer properly
      drm/amdgpu: Correct se_num and reg_inst for gfx v9_4_3 ras counters
      drm/amdgpu: fallback to old RAS error message for aqua_vanjaram

Hong-lu Cheng (1):
      drm/amd/display: Update OPP counter from new interface

Horace Chen (1):
      drm/amdkfd: use correct method to get clock under SRIOV

Huang Rui (4):
      drm/amdgpu: add VPE HW IP definition
      drm/amdgpu: add VPE RING TYPE definition
      drm/amdgpu: add VPE IP BLOCK definition
      drm/amdgpu: add VPE HW IP BLOCK definition

Ian Chen (2):
      drm/amd/display: Refactor edp power control
      drm/amd/display: add skip_implict_edp_power_control flag for dcn32

Icenowy Zheng (1):
      drm/amdgpu: fix SI failure due to doorbells allocation

Ilya Bakoulin (1):
      drm/amd/display: Fix DP2.0 timing sync

Ivan Lipski (1):
      Revert "drm/amd/display: Enable Replay for static screen use cases"

Jay Cornwall (2):
      drm/amdkfd: Add missing gfx11 MQD manager callbacks
      drm/amdgpu: Improve MES responsiveness during oversubscription

Jesse Zhang (2):
      drm/amdgpu/pm: Remove the duplicate dpm status check
      drm/amdgpu: disable GFXOFF and PG during compute for GFX9

Jiapeng Chong (2):
      drm/amdgpu: clean up some inconsistent indenting
      drm/amd/display: clean up some inconsistent indenting

Jonathan Kim (1):
      drm/amdkfd: fix add queue process context clear without runtime enable

Joshua Ashton (2):
      drm/amd/display: Hook up 'content type' property for HDMI
      drm/amd/display: Remove unused display_content_support

Juntong Deng (1):
      drm/amdgpu: Add description for AMD_IP_BLOCK_TYPE_VPE

Kees Cook (1):
      drm/amdgpu: Annotate struct amdgpu_bo_list with __counted_by

Kenneth Feng (2):
      drm/amd/pm: add unique_id for gc 11.0.3
      drm/amd/swsmu: add smu14 ip support

Konstantin Meskhidze (1):
      drm/radeon: possible buffer overflow

Krunoslav Kovac (2):
      drm/amd/display: PQ tail accuracy
      drm/amd/display: PQ regamma end point

Kun Liu (1):
      drm/amd/pm: Vangogh: Get average_* from average field of gpu_metrics_table

Lang Yu (55):
      drm/amdgpu: use 6.1.0 register offset for HDP CLK_CNTL
      drm/amdgpu: add gc headers for gc 11.5.0
      drm/amdkfd: add KFD support for GC 11.5.0
      drm/amdgpu/discovery: enable mes block for gc 11.5.0
      drm/amdgpu: add mmhub 3.3.0 headers
      drm/amdgpu: add mmhub 3.3.0 support
      drm/amdgpu: add VPE 6.1.0 header files
      drm/amdgpu: add VPE firmware header definition
      drm/amdgpu: add VPE firmware interface
      drm/amdgpu: add HWID for VPE
      drm/amdgpu: add IH CLIENT ID for VPE
      drm/amdgpu: add irq src id definitions for VPE
      drm/amdgpu: add doorbell index for VPE
      drm/amdgpu: add support for VPE firmware name decoding
      drm/amdgpu: add UCODE ID for VPE
      drm/amdgpu: add PSP FW TYPE for VPE
      drm/amdgpu: add nbio callback for VPE
      drm/amdgpu: add nbio 7.11 callback for VPE
      drm/amdgpu: add VPE 6.1.0 support
      drm/amdgpu: add PSP loading support for VPE
      drm/amdgpu: add user space CS support for VPE
      drm/amdgpu: enable VPE for VPE 6.1.0
      drm/amdgpu: add VPE FW version query support
      drm/amdgpu: fix VPE front door loading issue
      drm/amdgpu: add UMSCH 4.0 register headers
      drm/amdgpu: add UMSCH IP BLOCK TYPE definition
      drm/amdgpu: add UMSCH RING TYPE definition
      drm/amdgpu: add UMSCH firmware header definition
      drm/amdgpu: add UMSCH 4.0 api definition
      drm/amdgpu: add initial support for UMSCH
      drm/amdgpu: enable UMSCH scheduling for VPE
      drm/amdgpu: add selftest framework for UMSCH
      drm/amdgpu: add VPE queue submission test
      drm/amdgpu: reserve mmhub engine 3 for UMSCH FW
      drm/amdgpu: add PSP loading support for UMSCH
      drm/amdgpu/discovery: enable UMSCH 4.0 in IP discovery
      drm/amdgpu: add amdgpu_umsch_mm module parameter
      drm/amdgpu: update SET_HW_RESOURCES definition for UMSCH
      drm/amdgpu: fix incompatible types in conditional expression
      drm/amdgpu: fix unsigned error codes
      drm/amdgpu/vpe: fix truncation warnings
      drm/amdgpu: correct gpu clock counter query on cyan skilfish
      drm/amdgpu/vpe: remove IB end boundary requirement
      drm/amdgpu/vpe: align with mcbp changes
      drm/amdgpu/vpe: fix insert_nop ops
      drm/amdgpu/umsch: fix psp frontdoor loading
      drm/amdgpu/umsch: power on/off UMSCH by DLDO
      drm/amdgpu: add support to powerup VPE by SMU
      drm/amdgpu: add power up/down UMSCH ppt callback
      drm/amdgpu: add support to power up/down UMSCH by SMU
      drm/amdgpu/umsch: enable doorbell for umsch
      drm/amdgpu: correct NBIO v7.11 programing
      drm/amdgpu: don't use legacy invalidation on MMHUB v3.3
      drm/amdgpu/umsch: correct IP version format
      drm/amdgpu/umsch: fix missing stuff during rebase

Le Ma (10):
      drm/amdgpu: update mall info v2 from discovery
      drm/amdgpu: update gc_info v2_1 from discovery
      drm/amd/pm: update pmfw headers for version 85.73.0
      drm/amd/pm: add plpd_mode in smu_context to indicate current mode
      drm/amd/pm: add xgmi plpd mode selecting interface for smu v13.0.6
      drm/amd/pm: add xgmi_plpd_policy sysfs node for user to change plpd policy
      drm/amd/pm: init plpd_mode properly for different asics
      drm/amd/pm: integrate plpd allow/disallow into select_xgmi_plpd_policy in ppt level
      drm/amd/pm: deprecate allow_xgmi_power_down interface
      drm/amd/pm: fix the print_clk_levels issue for SMU v13.0.6

Lee Jones (7):
      drm/radeon/radeon_ttm: Remove unused variable 'rbo' from radeon_bo_move()
      drm/amd/amdgpu/amdgpu_device: Provide suitable description for param 'xcc_id'
      drm/amd/amdgpu/amdgpu_ras: Increase buffer size to account for all possible values
      drm/amd/amdgpu/amdgpu_sdma: Increase buffer size to account for all possible values
      drm/amd/amdgpu/imu_v11_0: Increase buffer size to ensure all possible values can be stored
      drm/amd/amdgpu/amdgpu_doorbell_mgr: Correct misdocumented param 'doorbell_index'
      drm/amd/amdgpu/sdma_v6_0: Demote a bunch of half-completed function headers

Li Ma (7):
      drm/amdgpu: add header files for MP 14.0.0
      drm/amdgpu/swsmu: add smu v14_0_0 driver if file
      drm/amd/swsmu: add smu v14_0_0 ppsmc file
      drm/amd/swsmu: add smu v14_0_0 pmfw if file
      drm/amdgpu/discovery: add SMU 14 support
      drm/amdgpu: enable GFX IP v11.5.0 CG and PG support
      drm/amd/swsmu: update smu v14_0_0 header files and metrics table

Lijo Lazar (36):
      Documentation/gpu: Update amdgpu documentation
      drm/amdgpu: Keep reset handlers shared
      drm/amdgpu: Unset baco dummy mode on nbio v7.9
      drm/amdgpu: Add bootloader status check
      drm/amdgpu: Add bootloader wait for PSP v13
      drm/amdgpu: Add SMU v13.0.6 default reset methods
      drm/amdgpu: Add only valid firmware version nodes
      drm/amdgpu: Restrict bootloader wait to SMUv13.0.6
      drm/amdgpu: Fix refclk reporting for SMU v13.0.6
      drm/amdgpu: Use default reset method handler
      drm/amdgpu: Use function for IP version check
      drm/amd/pm: Fix clock reporting for SMUv13.0.6
      drm/amd/pm:Fix GFX deep sleep clock reporting
      Documentation/amdgpu: Modify pp_dpm_*clk details
      Revert "drm/amdgpu: Report vbios version instead of PN"
      drm/amdgpu: Fix vbios version string search
      drm/amd/pm: Round Q10 format values in SMU v13.0.6
      drm/amd/pm: Remove SMUv13.0.6 unsupported feature
      drm/amdgpu: Add more fields to IP version
      drm/amdgpu: Restore partition mode after reset
      drm/amd/pm: Add throttle limit for SMU v13.0.6
      drm/amd/pm: Add GC v9.4.3 thermal limits to hwmon
      drm/amdgpu: Move package type enum to amdgpu_smuio
      drm/amdgpu: Add more smuio v13.0.3 package types
      drm/amdgpu: Get package types for smuio v13.0
      drm/amdgpu: Add sysfs attribute to get board info
      Documentation/amdgpu: Add board info details
      drm/amdgpu: Refactor FRU product information
      drm/amdgpu: Add more FRU field information
      Documentation/amdgpu: Add FRU attribute details
      drm/amdgpu: Increase IP discovery region size
      drm/amdgpu: Read PSPv13 OS version from register
      drm/amdgpu: Avoid FRU EEPROM access on APU
      drm/amdgpu: Update PSP interface header
      drm/amdgpu: Add support to load P2S tables
      drm/amd/pm: Add P2S tables for SMU v13.0.6

Lin.Cao (2):
      drm/amdgpu: Return -EINVAL when MMSCH init status incorrect
      drm/amdgpu: save VCN instances init info before jpeg init

Luben Tuikov (1):
      drm/amdgpu: Fix a memory leak

Ma Jun (5):
      drm/amd: Simplify the bo size check funciton
      drm/amd: Fix the flag setting code for interrupt request
      drm/amd/pm: Add reset option for fan_curve on smu13_0_0
      drm/amd/pm: Add reset option for fan_ctrl interfaces
      drm/amd/pm: Add reset option for fan_ctrl on smu 13.0.7

Ma Ke (2):
      drm/radeon: fix a possible null pointer dereference
      drm/amdgpu/vkms: fix a possible null pointer dereference

Mangesh Gadre (3):
      drm/amdgpu: Remove SRAM clock gater override by driver
      drm/amdgpu: Updated TCP/UTCL1 programming
      drm/amdgpu:Expose physical id of device in XGMI hive

Mario Limonciello (28):
      drm/amd: Drop special case for yellow carp without discovery
      drm/amd: Move seamless boot check out of display
      drm/amd: Add a module parameter for seamless boot
      drm/amd: Enable seamless boot by default on newer ASICs
      drm/amd: Propagate failures in dc_set_power_state()
      drm/amd/display: Change dc_set_power_state() to bool instead of int
      drm/amd: Drop error message about failing to load DMUB firmware
      drm/amd: Limit seamless boot by default to APUs
      drm/amd: Drop error message about failing to load SDMA firmware
      drm/amd: Move microcode init from sw_init to early_init for SDMA v5.0
      drm/amd: Move microcode init from sw_init to early_init for SDMA v6.0
      drm/amd: Move microcode init from sw_init to early_init for SDMA v5.2
      drm/amd: Move microcode init from sw_init to early_init for SDMA v3.0
      drm/amd: Move microcode init from sw_init to early_init for SDMA v2.4
      drm/amd: Move microcode init from sw_init to early_init for CIK SDMA
      drm/amd: Fix logic error in sienna_cichlid_update_pcie_parameters()
      drm/amd: Fix detection of _PR3 on the PCIe root port
      drm/amd: Update `update_pcie_parameters` functions to use uint8_t arguments
      drm/amd: Drop all hand-built MIN and MAX macros in the amdgpu base driver
      drm/amd: Fix UBSAN array-index-out-of-bounds for SMU7
      drm/radeon: Fix UBSAN array-index-out-of-bounds for Radeon HD 5430
      drm/amd: Fix UBSAN array-index-out-of-bounds for Polaris and Tonga
      drm/amd: Evict resources during PM ops prepare() callback
      drm/amd: Add concept of running prepare_suspend() sequence for IP blocks
      drm/amd: Split up UVD suspend into prepare and suspend steps
      drm/amd/display: Catch errors from drm_atomic_helper_suspend()
      drm/amd/display: Destroy DC context while keeping DML and DML2
      drm/amd/display: make dc_set_power_state() return type `void` again

Martin Leung (1):
      drm/amd/display: 3.2.249

Max Tseng (2):
      drm/amd/display: augment display clock in dc_cap structure
      drm/amd/display: Modify Vmin default value

Melissa Wen (2):
      drm/amd/display: enable cursor degamma for DCN3+ DRM legacy gamma
      drm/amd/display: set stream gamut remap matrix to MPC for DCN3+

Michel Dänzer (3):
      drm/amd/display: Check all enabled planes in dm_check_crtc_cursor
      drm/amd/display: Refactor dm_get_plane_scale helper
      drm/amd/display: Bail from dm_check_crtc_cursor if no relevant change

Mounika Adhuri (1):
      drm/amd/display: Refactor HWSS into component folder

Muhammad Ahmed (9):
      drm/amd/display: Fix MST recognizes connected displays as one
      drm/amd/display: disable clock gating logic
      drm/amd/display: Enable DCLK_DS from driver by default
      drm/amd/display: disable IPS
      drm/amd/display: Fix MST recognizes connected displays as one
      drm/amd/display: Expand DML to better support replay
      drm/amd/display: Enable DCN low mem power by default
      drm/amd/display: enable dsc_clk even if dsc_pg disabled
      drm/amd/display: Update dml ssb from pmfw clock table

Muhammad Ansari (1):
      drm/amd/display: VSIF v3 set Max Refresh Rate

Mukul Joshi (6):
      drm/amdkfd: Fix reg offset for setting CWSR grace period
      drm/amdkfd: Fix unaligned 64-bit doorbell warning
      drm/amdgpu: Store CU info from all XCCs for GFX v9.4.3
      drm/amdkfd: Update cache info reporting for GFX v9.4.3
      drm/amdkfd: Update CU masking for GFX 9.4.3
      drm/amdgpu: Rename KGD_MAX_QUEUES to AMDGPU_MAX_QUEUES

Mustapha Ghaddar (3):
      drm/amd/display: Add DPIA Link Encoder Assignment Fix
      drm/amd/display: Fix 2nd DPIA encoder Assignment
      drm/amd/display: Add DPIA Link Encoder Assignment Fix for DCN35

Nicholas Kazlauskas (1):
      drm/amd/display: Don't use fsleep for PSR exit waits

Nicholas Susanto (1):
      drm/amd/display: Fix DML calculation errors

Ovidiu Bunea (3):
      drm/amd/display: Roll back unit correction
      drm/amd/display: Use optc32 instead of optc30 in DC
      drm/amd/display: Make driver backwards-compatible with non-IPS PMFW

Paul Hsieh (1):
      drm/amd/display: support main link off before specific vertical line

Philip Yang (8):
      drm/amdkfd: Share the original BO for GTT mapping
      drm/amdkfd: Remove svm range validated_once flag
      drm/amdgpu: Increase IH soft ring size for GFX v9.4.3 dGPU
      drm/amdkfd: Don't use sw fault filter if retry cam enabled
      drm/amdkfd: Move dma unmapping after TLB flush
      drm/amdkfd: Handle errors from svm validate and map
      drm/amdgpu: ratelimited override pte flags messages
      drm/amdkfd: Fix EXT_COHERENT memory allocation crash

Prike Liang (8):
      drm/amdgpu: add new AMDGPU_FAMILY definition
      drm/amdgpu/soc21: add initial GC 11.5.0 soc21 support
      drm/amdgpu/discovery: enable soc21 support
      drm/amdgpu/discovery: add nbio 7.11.0 support
      drm/amdgpu/gmc11: initialize GMC for GC 11.5.0 memory support
      drm/amdgpu/gfx11: initialize gfx11.5.0
      drm/amdgpu/discovery: enable gfx11 for GC 11.5.0
      drm/amdgpu: enable gmc11 for GC 11.5.0

Qingqing Zhuo (38):
      drm/amd/display: Add dcn35 register header files
      drm/amd/display: Add DCN35 family information
      drm/amd/display: Update DCE for DCN35 support
      drm/amd/display: Update DCN10 for DCN35 support
      drm/amd/display: Update DCN20 for DCN35 support
      drm/amd/display: Update DCN30 for DCN35 support
      drm/amd/display: Update DCN31 for DCN35 support
      drm/amd/display: Update DCN314 for DCN35 support
      drm/amd/display: Update DCN32 for DCN35 support
      drm/amd/display: Update dc.h for DCN35 support
      drm/amd/display: Add DCN35 BIOS command table support
      drm/amd/display: Add DCN35 GPIO
      drm/amd/display: Add DCN35 DCCG
      drm/amd/display: Add DCN35 DIO
      drm/amd/display: Add DCN35 PG_CNTL
      drm/amd/display: Add DCN35 OPTC
      drm/amd/display: Add DCN35 OPP
      drm/amd/display: Add DCN35 DPP
      drm/amd/display: Add DCN35 DWB
      drm/amd/display: Add DCN35 HUBP
      drm/amd/display: Add DCN35 HUBBUB
      drm/amd/display: Add DCN35 MMHUBBUB
      drm/amd/display: Add DCN35 DSC
      drm/amd/display: Add DCN35 HWSEQ
      drm/amd/display: Add DCN35 CLK_MGR
      drm/amd/display: Add DCN35 IRQ
      drm/amd/display: Add DCN35 DMUB
      drm/amd/display: Add DCN35 init
      drm/amd/display: Add DCN35 Resource
      drm/amd/display: Add DCN35 DML
      drm/amd/display: Add DCN35 blocks to Makefile
      drm/amd/display: Add DCN35 CORE
      drm/amd/display: Add DCN35 DM Support
      drm/amd/display: Drop unused registers
      drm/amd/display: Add DCN35 case for dc_clk_mgr_create
      drm/amd/display: remove unused mmhub_reg_offsets
      drm/amd/display: Introduce DML2
      drm/amd/display: Add DCN35 DML2 support

Rajneesh Bhardwaj (3):
      drm/amdgpu: Hide xcp partition sysfs under SRIOV
      drm/amdgpu: Rework KFD memory max limits
      drm/amdgpu: Use ttm_pages_limit to override vram reporting

Randy Dunlap (2):
      drm/amd/display: fix replay_mode kernel-doc warning
      drm/amdgpu: amdgpu_drm.h: fix comment typos

Reza Amini (1):
      drm/amd/display: Correct unit conversion for vstartup

Rodrigo Siqueira (6):
      drm/amd/display: Drop unused link FPGA code
      drm/amd/display: Improve code style on bios_parser2
      drm/amd/display: Move dce_calcs from DML folder
      drm/amd/display: Move custom_float from DML folder
      drm/amd/display: Move bw_fixed from DML folder
      drm/amd/display: Move dml code under CONFIG_DRM_AMD_DC_FP guard

Roman Li (1):
      drm/amd/display: Enable replay for dcn35

Saaem Rizvi (1):
      drm/amd/display: Modify Pipe Selection for Policy for ODM

Saleemkhan Jamadar (9):
      drm/amdgpu: add vcn 4_0_5 header files
      drm/amdgpu: add VCN4 ip block support
      drm/amdgpu/jpeg: add jpeg support for VCN4_0_5
      drm/amdgpu: add VCN_4_0_5 firmware support
      drm/amdgpu:enable CG and PG flags for VCN
      drm/amdgpu/soc21: Add video cap query support for VCN_4_0_5
      drm/amdgpu/discovery: add VCN 4.0.5 Support
      drm/amdgpu: enable PG flags for VCN
      drm/amdgpu/jpeg: initialize number of jpeg ring

Samir Dhume (1):
      drm/amdgpu/jpeg - skip change of power-gating state for sriov

Samson Tam (3):
      drm/amd/display: add check for PMFW hard min request complete
      drm/amd/display: ensure FS is enabled before sending request to DMUB for FS changes
      drm/amd/display: apply edge-case DISPCLK WDIVIDER changes to master OTG pipes only

Sathishkumar S (2):
      drm/amdgpu: update IP count INFO query
      drm/amdgpu: fix ip count query for xcp partitions

Sebastian Andrzej Siewior (5):
      drm/amd/display: Remove migrate_en/dis from dc_fpu_begin().
      drm/amd/display: Simplify the per-CPU usage.
      drm/amd/display: Add a warning if the FPU is used outside from task context.
      drm/amd/display: Move the memory allocation out of dcn21_validate_bandwidth_fp().
      drm/amd/display: Move the memory allocation out of dcn20_validate_bandwidth_fp().

Sherry Wang (1):
      drm/amd/display: refactor ILR to make it work

Sridevi Arvindekar (1):
      drm/amd/display: dc cleanup for tests

Srinivasan Shanmugam (16):
      drm/amd/display: Fix unnecessary conversion to bool in 'amdgpu_dm_setup_replay'
      drm/radeon: Cleanup radeon/radeon_fence.c
      drm/amd/display: Fix useless else if in display_mode_vba_util_32.c
      drm/amdgpu: Fix kcalloc over kzalloc in 'gmc_v9_0_init_mem_ranges'
      drm/amd/pm: Fixes incorrect type in 'amdgpu_hwmon_show_power_avg() & _input()'
      drm/amd/display: Fix up kdoc format for 'dc_set_edp_power'
      drm/radeon: Remove the references of radeon_gem_ pread & pwrite ioctls
      drm/amd/display: Adjust kdoc for 'optc35_set_odm_combine'
      drm/amdgpu: Use READ_ONCE() when reading the values in 'sdma_v4_4_2_ring_get_rptr'
      drm/amdgpu: Fix printk_ratelimit() with DRM_ERROR_RATELIMITED in 'amdgpu_cs_ioctl'
      drm/amdgpu: Declare array with strings as pointers constant
      drm/amdgpu: Use min_t to replace min
      drm/amd/display: Address 'srf_updates' not described in 'could_mpcc_tree_change_for_active_pipes'
      drm/amdgpu: Fix complex macros error
      drm/amdgpu: Drop unnecessary return statements
      drm/amdgpu: Address member 'gart_placement' not described in 'amdgpu_gmc_gart_location'

Stanley.Yang (2):
      drm/amdgpu: Fix false positive error log
      drm/amdgpu: Fix potential null pointer derefernce

Stylon Wang (2):
      drm/amd/display: Remove unused DPCD declarations
      drm/amd/display: Disable virtual links

Sung Joon Kim (8):
      drm/amd/display: Add pointer check before function call
      drm/amd/display: Add IPS control flag
      drm/amd/display: Add a check for idle power optimization
      drm/amd/display: Handle multiple streams sourcing same surface
      drm/amd/display: Use fixed DET Buffer Size
      drm/amd/display: Fix Chroma Surface height/width initialization
      drm/amd/display: Modify SMU message logs
      drm/amd/display: Revert "drm/amd/display: Add a check for idle power optimization"

Sung-huai Wang (1):
      drm/amd/display: fix static screen detection setting for DCN35

SungHuai Wang (1):
      drm/amd/display: fix static screen detection setting

Swapnil Patel (1):
      drm/amd/display: Don't check registers, if using AUX BL control

Swarup Laxman Kotiaklapudi (1):
      gpu: drm: amd: display: fix kernel-doc warnings

Taimur Hassan (3):
      drm/amd/display: Add reset for SYMCLKC_FE_SRC_SEL
      drm/amd/display: Split pipe for stereo timings
      drm/amd/display: Move stereo timing check to helper

Tao Zhou (9):
      drm/amdgpu: use read-modify-write mode for gfx v9_4_3 SQ setting
      drm/amdgpu: add address conversion for UMC v12
      drm/amdgpu: add channel index table for UMC v12
      drm/amdgpu: print more address info of UMC bad page
      drm/amdgpu: print channel index for UMC bad page
      drm/amdgpu: fix value of some UMC parameters for UMC v12
      drm/amdgpu: change if condition for bad channel bitmap update
      drm/amdgpu: exit directly if gpu reset fails
      drm/amdgpu: update retry times for psp vmbx wait

Tim Huang (1):
      drm/amd/pm: wait for completion of the EnableGfxImu command

Timmy Tsai (1):
      drm/amd: Add HDP flush during jpeg init

Victor Zhao (1):
      drm/amd/pm: Disallow managing power profiles on SRIOV for gc11.0.3

Vignesh Chander (1):
      drm/amdgpu/jpeg: skip set pg for sriov

Wayne Lin (2):
      drm/amd/display: Adjust the MST resume flow
      drm/amd/display: fix problems in power_helper

Wenjing Liu (30):
      Partially revert "drm/amd/display: update add plane to context logic with a new algorithm"
      drm/amd/display: update blank state on ODM changes
      drm/amd/display: add comments to add plane functions
      drm/amd/display: rename function to add otg master for stream
      drm/amd/display: add new resource interface for acquiring sec opp heads and release pipe
      drm/amd/display: add new resource interfaces to update odm mpc slice count
      drm/amd/display: add more pipe resource interfaces
      drm/amd/display: use new pipe allocation interface in dcn32 fpu
      drm/amd/display: switch to new ODM policy for windowed MPO ODM support
      drm/amd/display: add pipe topology update log
      drm/amd/display: fix pipe topology logging error
      drm/amd/display: always switch off ODM before committing more streams
      drm/amd/display: do not block ODM + OPM on one side of the screen
      drm/amd/display: remove a function that does complex calculation in every frame but not used
      drm/amd/display: do not attempt ODM power optimization if minimal transition doesn't exist
      drm/amd/display: only allow ODM power optimization if surface is within guaranteed viewport size
      drm/amd/display: add seamless pipe topology transition check
      drm/amd/display: move odm power optimization decision after subvp optimization
      drm/amd/display: do not skip ODM minimal transition based on new state
      drm/amd/display: minior logging improvements
      drm/amd/display: Update pipe resource interfaces for DCN35
      drm/amd/display: determine fast update only before commit minimal transition state
      drm/amd/display: reset stream slice count for new ODM policy
      drm/amd/display: add new windowed mpo odm minimal transition sequence
      drm/amd/display: remove guaranteed viewports limitation for odm
      drm/amd/display: add missing function pointer for DCN321 resource
      drm/amd/display: add get primary dpp pipe resource interface
      drm/amd/display: add primary pipe check when building slice table for dcn3x
      drm/amd/display: fix incorrect odm change detection logic
      drm/amd/display: use full update for clip size increase of large plane source

Xiaogang Chen (5):
      drm/amdkfd: Separate dma unmap and free of dma address array operations
      drm/amdkfd: fix some race conditions in vram buffer alloc/free of svm code
      drm/amdkfd: Fix a race condition of vram buffer unref in svm code
      drm/amdkfd: Use partial migrations in GPU page faults
      drm/amdgpu: Correctly use bo_va->ref_count in compute VMs

Yang Li (9):
      drm/amd/display: Remove duplicated include in dcn35_resource.c
      drm/amd/display: Remove duplicated include in dcn35_optc.c
      drm/amd/display: Remove duplicated include in dcn35_hwseq.c
      drm/amd/display: Remove duplicated include in dcn35_clk_mgr.c
      drm/amd/display: clean up one inconsistent indenting
      drm/amd/display: clean up one inconsistent indenting
      drm/amd/display: clean up some inconsistent indentings
      drm/amd/display: clean up some inconsistent indentings
      drm/amd/display: clean up one inconsistent indenting

Yang Wang (13):
      drm/amd/pm: update smu_v13_0_6 smu header
      drm/amd/pm: enable smu_v13_0_6 mca debug mode when UMC RAS feature is enabled
      drm/amdgpu: add amdgpu smu mca dump feature support
      drm/amdgpu: add amdgpu mca debug sysfs support
      drm/amd/pm: update smu_v13_0_6 ppsmc header
      drm/amd/pm: add smu_13_0_6 mca dump support
      drm/amdgpu: enable FRU device for SMU v13.0.6
      drm/amdgpu: make err_data structure built-in for ras_manager
      drm/amdgpu: add ras_err_info to identify RAS error source
      drm/amdgpu: add RAS error info support for sdma_v4_4_2.
      drm/amdgpu: add RAS error info support for gfx_v9_4_3
      drm/amdgpu: add RAS error info support for mmhub_v1_8
      drm/amdgpu: add RAS error info support for umc_v12_0

YiPeng Chai (1):
      drm/amdgpu: Enable ras for mp0 v13_0_6 sriov

Yifan Zhang (9):
      drm/amdgpu: remove unused parameter in amdgpu_vmid_grab_idle
      drm/amd/pm: only poweron/off vcn/jpeg when they are valid.
      drm/amdgpu: calling address translation functions to simplify codes
      drm/amd/display: fix the white screen issue when >= 64GB DRAM
      drm/amdgpu: add type conversion for gc info
      drm/amd/display: enable S/G display for for recent APUs by default
      drm/amdgpu: add hub->ctx_distance in setup_vmid_config
      drm/amd/pm: drop most smu_cmn_get_smc_version in smu
      drm/amdgpu: flush the correct vmid tlb for specific pasid

YuBiao Wang (1):
      drm/amdkfd: Use gpu_offset for user queue's wptr

ZhenGuo Yin (1):
      drm/amdgpu: access RLC_SPM_MC_CNTL through MMIO in SRIOV runtime

benl (3):
      drm/amdgpu: add nbio 7.11 registers
      drm/amdgpu: add nbio 7.11 support
      drm/amdgpu: add gfxhub 11.5.0 support

 Documentation/gpu/amdgpu/driver-misc.rst           |    26 +-
 Documentation/gpu/amdgpu/thermal.rst               |    30 +
 drivers/gpu/drm/amd/amdgpu/Makefile                |    22 +-
 drivers/gpu/drm/amd/amdgpu/aldebaran.c             |    39 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    79 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |    60 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |     3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c |     3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h |     3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |    12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h  |     3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |    57 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c       |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |    18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c        |    17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h        |    18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |    11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |    23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   437 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   191 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h      |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |    54 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell.h       |    12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c   |    19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |    97 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c         |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |     3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c     |   167 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.h     |    11 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |    15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   208 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |    32 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |     6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.h             |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |    45 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   226 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c            |   186 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h            |    61 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |    11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h           |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |    32 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   111 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |     3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   416 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |    35 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |    15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h     |     1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |    12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |    16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |     6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |     5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |     9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_smuio.h          |    12 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |     3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |    93 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |    37 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |    29 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |     5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c       |   862 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.h       |   228 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |    12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.h            |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |    22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |    58 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |    31 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |    10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c            |   656 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.h            |    91 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c            |    28 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.h            |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |    27 +-
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |     2 +-
 drivers/gpu/drm/amd/amdgpu/athub_v1_0.c            |     2 +-
 drivers/gpu/drm/amd/amdgpu/athub_v2_0.c            |     2 +-
 drivers/gpu/drm/amd/amdgpu/athub_v2_1.c            |     2 +-
 drivers/gpu/drm/amd/amdgpu/athub_v3_0.c            |     7 +-
 drivers/gpu/drm/amd/amdgpu/atom.c                  |    19 +-
 drivers/gpu/drm/amd/amdgpu/atombios_encoders.c     |     1 -
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c              |    11 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |     6 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |     6 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |     6 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |     6 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   134 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |    76 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c              |     2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |     2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |     2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |    93 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c            |     6 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |   160 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v11_5_0.c        |   516 +
 .../link_fpga.h => amdgpu/gfxhub_v11_5_0.h}        |    15 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c           |     2 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c           |    16 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c           |     5 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c           |     6 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0.c           |     5 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.c         |     5 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   270 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   210 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |     6 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |    32 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |    33 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   361 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |    18 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v6_0.c              |    20 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c               |     4 -
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |     5 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |     4 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |     2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |    14 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |     5 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           |   622 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.h           |    35 +
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c             |    10 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |     6 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c            |     2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c            |     2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |    17 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |    14 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c            |     4 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.c            |     7 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.c          |     7 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_2.c          |     5 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.c            |   589 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.h            |    29 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c            |     2 +-
 drivers/gpu/drm/amd/amdgpu/mmsch_v4_0.h            |    12 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.h              |     6 +-
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c             |     8 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             |     2 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c             |     9 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c            |   294 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_11.h            |    33 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c             |    10 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |    11 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |    28 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |    10 +-
 drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h            |     4 +
 drivers/gpu/drm/amd/amdgpu/psp_v10_0.c             |     7 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |     2 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |    60 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c           |     2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c             |    11 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c             |    11 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |    52 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |    28 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |    15 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |    20 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |    22 +-
 drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c        |    22 +-
 drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.c          |    19 +-
 drivers/gpu/drm/amd/amdgpu/smuio_v13_0.c           |    22 +
 drivers/gpu/drm/amd/amdgpu/smuio_v13_0_3.c         |     6 +
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |    32 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |    46 +-
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             |   375 +
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.h             |   127 +
 drivers/gpu/drm/amd/amdgpu/umsch_mm_v4_0.c         |   424 +
 drivers/gpu/drm/amd/amdgpu/umsch_mm_v4_0.h         |    30 +
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c              |     8 +
 drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c              |     8 +
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c              |     8 +
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c              |     8 +
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |     8 +
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |     9 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |    14 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |     9 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |  1779 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.h            |    35 +
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |    14 +-
 drivers/gpu/drm/amd/amdgpu/vpe_6_1_fw_if.h         |   217 +
 drivers/gpu/drm/amd/amdgpu/vpe_v6_1.c              |   289 +
 drivers/gpu/drm/amd/amdgpu/vpe_v6_1.h              |    29 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |    22 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |    30 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.h              |     4 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |    19 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   134 +-
 drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c          |    12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v10.c   |     6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c   |     6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |     8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |   156 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h           |     6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c       |    58 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h       |     2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c   |     2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c   |     2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |    46 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |    46 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c    |     2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c |     6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |     7 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |     3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   215 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |    12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |    97 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h          |     2 +-
 drivers/gpu/drm/amd/display/Makefile               |     1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   469 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |     4 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |    58 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |     1 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |    69 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |    22 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |    35 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c   |     4 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c     |    53 +-
 drivers/gpu/drm/amd/display/dc/Makefile            |     8 +-
 drivers/gpu/drm/amd/display/dc/basics/Makefile     |     9 +-
 .../display/dc/{dml/calcs => basics}/bw_fixed.c    |    13 +-
 .../dc/{dml/calcs => basics}/calcs_logger.h        |     0
 .../dc/{dml/calcs => basics}/custom_float.c        |    90 +-
 .../display/dc/{dml/calcs => basics}/dce_calcs.c   |     0
 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  |     3 +
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |    46 +-
 .../amd/display/dc/bios/command_table_helper2.c    |     1 +
 drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile    |     8 +
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |    18 +
 .../amd/display/dc/clk_mgr/dce120/dce120_clk_mgr.c |     2 +-
 .../amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c   |     4 +-
 .../amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c |     2 -
 .../drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c |    20 +-
 .../gpu/drm/amd/display/dc/clk_mgr/dcn32/dalsmc.h  |    11 +-
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |    68 +-
 .../dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.c       |   154 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |  1142 +
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.h   |    63 +
 .../drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c   |   471 +
 .../drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.h   |   203 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   549 +-
 drivers/gpu/drm/amd/display/dc/core/dc_debug.c     |     2 +
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |    23 +
 .../gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c  |    35 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  1817 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |    51 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |    89 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   138 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |     4 +
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |    59 +-
 drivers/gpu/drm/amd/display/dc/dc_helper.c         |     7 +
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |     7 -
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |     9 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |    16 +-
 drivers/gpu/drm/amd/display/dc/dce/Makefile        |     2 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_abm.h       |     9 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_audio.c     |     4 +
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |     7 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.c      |     3 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c    |     4 +
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.h    |     6 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |    13 +-
 drivers/gpu/drm/amd/display/dc/dce100/Makefile     |     2 +-
 .../drm/amd/display/dc/dce100/dce100_resource.c    |     4 +-
 drivers/gpu/drm/amd/display/dc/dce110/Makefile     |     2 +-
 .../drm/amd/display/dc/dce110/dce110_resource.c    |     2 +-
 drivers/gpu/drm/amd/display/dc/dce112/Makefile     |     2 +-
 .../drm/amd/display/dc/dce112/dce112_resource.c    |     2 +-
 drivers/gpu/drm/amd/display/dc/dce120/Makefile     |     1 -
 .../drm/amd/display/dc/dce120/dce120_resource.c    |     6 +-
 .../drm/amd/display/dc/dce60/dce60_hw_sequencer.c  |     4 +-
 drivers/gpu/drm/amd/display/dc/dce80/Makefile      |     2 +-
 .../gpu/drm/amd/display/dc/dce80/dce80_resource.c  |     2 +-
 drivers/gpu/drm/amd/display/dc/dcn10/Makefile      |     2 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.h    |    12 +-
 .../display/dc/dcn10/dcn10_hw_sequencer_debug.c    |     4 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init.c  |     4 +-
 .../drm/amd/display/dc/dcn10/dcn10_link_encoder.h  |    33 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h  |    30 +
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |     4 +-
 .../amd/display/dc/dcn10/dcn10_stream_encoder.h    |    24 +-
 drivers/gpu/drm/amd/display/dc/dcn20/Makefile      |     2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h  |    64 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |     2 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init.c  |     9 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |    36 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.h  |     4 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_vmid.c  |     3 +
 drivers/gpu/drm/amd/display/dc/dcn201/Makefile     |     2 +-
 .../gpu/drm/amd/display/dc/dcn201/dcn201_init.c    |     6 +-
 .../drm/amd/display/dc/dcn201/dcn201_resource.c    |     5 +-
 drivers/gpu/drm/amd/display/dc/dcn21/Makefile      |     2 +-
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c  |     2 +
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c  |     9 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |    13 +-
 drivers/gpu/drm/amd/display/dc/dcn30/Makefile      |     1 -
 .../gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c |   104 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.h   |     2 -
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb.h   |     2 -
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c  |    10 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c   |    17 -
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.h   |     1 -
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |     2 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |     5 +-
 drivers/gpu/drm/amd/display/dc/dcn301/Makefile     |     2 +-
 .../gpu/drm/amd/display/dc/dcn301/dcn301_init.c    |     9 +-
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |     5 +-
 drivers/gpu/drm/amd/display/dc/dcn302/Makefile     |     2 +-
 .../gpu/drm/amd/display/dc/dcn302/dcn302_init.c    |     2 +-
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |     3 +
 drivers/gpu/drm/amd/display/dc/dcn303/Makefile     |     2 +-
 .../gpu/drm/amd/display/dc/dcn303/dcn303_init.c    |     2 +-
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |     3 +
 drivers/gpu/drm/amd/display/dc/dcn31/Makefile      |     2 +-
 .../display/dc/dcn31/dcn31_hpo_dp_link_encoder.h   |    10 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.c    |    32 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubp.c  |     6 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubp.h  |     3 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c  |     8 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |     5 +-
 drivers/gpu/drm/amd/display/dc/dcn314/Makefile     |     2 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c    |     3 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.h    |     6 +
 .../display/dc/dcn314/dcn314_dio_stream_encoder.c  |    22 +-
 .../display/dc/dcn314/dcn314_dio_stream_encoder.h  |    40 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_init.c    |     8 +-
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |    30 +-
 .../drm/amd/display/dc/dcn315/dcn315_resource.c    |     7 +-
 .../drm/amd/display/dc/dcn316/dcn316_resource.c    |     3 +-
 drivers/gpu/drm/amd/display/dc/dcn32/Makefile      |     2 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c  |     1 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c    |    14 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.h    |     6 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c  |    12 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.h  |     4 -
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c   |     2 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.h   |     2 -
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c  |    27 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.h  |     3 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |   286 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |    15 +-
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |    50 +-
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |    45 +-
 drivers/gpu/drm/amd/display/dc/dcn35/Makefile      |    20 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dccg.c  |   796 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dccg.h  |   190 +
 .../amd/display/dc/dcn35/dcn35_dio_link_encoder.c  |   267 +
 .../amd/display/dc/dcn35/dcn35_dio_link_encoder.h  |   137 +
 .../display/dc/dcn35/dcn35_dio_stream_encoder.c    |   528 +
 .../display/dc/dcn35/dcn35_dio_stream_encoder.h    |   326 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dpp.c   |    51 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dpp.h   |    55 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dsc.c   |    58 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dsc.h   |    57 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dwb.c   |    58 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dwb.h   |    59 +
 .../gpu/drm/amd/display/dc/dcn35/dcn35_hubbub.c    |   609 +
 .../gpu/drm/amd/display/dc/dcn35/dcn35_hubbub.h    |   153 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_hubp.c  |   104 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_hubp.h  |    59 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_init.c  |   169 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_init.h  |    32 +
 .../gpu/drm/amd/display/dc/dcn35/dcn35_mmhubbub.c  |    57 +
 .../gpu/drm/amd/display/dc/dcn35/dcn35_mmhubbub.h  |    73 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_opp.c   |    51 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_opp.h   |    65 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c  |   288 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.h  |    72 +
 .../gpu/drm/amd/display/dc/dcn35/dcn35_pg_cntl.c   |   539 +
 .../gpu/drm/amd/display/dc/dcn35/dcn35_pg_cntl.h   |   193 +
 .../gpu/drm/amd/display/dc/dcn35/dcn35_resource.c  |  2119 +
 .../gpu/drm/amd/display/dc/dcn35/dcn35_resource.h  |   308 +
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |     5 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |    56 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h   |    10 +-
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c |    21 +-
 .../display/dc/dml/dcn314/display_mode_vba_314.c   |     2 +
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |   819 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.h   |     3 -
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |     4 -
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c |    81 +
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |   509 +
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.h   |    42 +
 drivers/gpu/drm/amd/display/dc/dml2/Makefile       |    91 +
 drivers/gpu/drm/amd/display/dc/dml2/cmntypes.h     |    92 +
 .../drm/amd/display/dc/dml2/display_mode_core.c    | 10296 ++++
 .../drm/amd/display/dc/dml2/display_mode_core.h    |   201 +
 .../display/dc/dml2/display_mode_core_structs.h    |  1970 +
 .../amd/display/dc/dml2/display_mode_lib_defines.h |    75 +
 .../drm/amd/display/dc/dml2/display_mode_util.c    |   796 +
 .../drm/amd/display/dc/dml2/display_mode_util.h    |    74 +
 .../amd/display/dc/dml2/dml2_dc_resource_mgmt.c    |   861 +
 .../amd/display/dc/dml2/dml2_dc_resource_mgmt.h    |    48 +
 .../gpu/drm/amd/display/dc/dml2/dml2_dc_types.h    |    40 +
 .../drm/amd/display/dc/dml2/dml2_internal_types.h  |   121 +
 .../drm/amd/display/dc/dml2/dml2_mall_phantom.c    |   913 +
 .../drm/amd/display/dc/dml2/dml2_mall_phantom.h    |    50 +
 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c  |   308 +
 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.h  |    47 +
 .../amd/display/dc/dml2/dml2_translation_helper.c  |  1201 +
 .../amd/display/dc/dml2/dml2_translation_helper.h  |    39 +
 drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c   |   480 +
 drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.h   |   144 +
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |   745 +
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h |   212 +
 drivers/gpu/drm/amd/display/dc/dml2/dml_assert.h   |    30 +
 .../gpu/drm/amd/display/dc/dml2/dml_depedencies.h  |    31 +
 .../amd/display/dc/dml2/dml_display_rq_dlg_calc.c  |   585 +
 .../amd/display/dc/dml2/dml_display_rq_dlg_calc.h  |    63 +
 drivers/gpu/drm/amd/display/dc/dml2/dml_logging.h  |    29 +
 drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c   |     1 +
 drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c |     1 +
 drivers/gpu/drm/amd/display/dc/hwss/Makefile       |   183 +
 .../drm/amd/display/dc/{ => hwss}/dce/dce_hwseq.c  |     0
 .../drm/amd/display/dc/{ => hwss}/dce/dce_hwseq.h  |    20 +
 .../dce100/dce100_hwseq.c}                         |     4 +-
 .../dce100/dce100_hwseq.h}                         |     0
 .../dce110/dce110_hwseq.c}                         |    57 +-
 .../dce110/dce110_hwseq.h}                         |     0
 .../dce112/dce112_hwseq.c}                         |     4 +-
 .../dce112/dce112_hwseq.h}                         |     0
 .../dce120/dce120_hwseq.c}                         |     4 +-
 .../dce120/dce120_hwseq.h}                         |     0
 .../dce80/dce80_hwseq.c}                           |     6 +-
 .../dce80/dce80_hwseq.h}                           |     0
 .../dcn10/dcn10_hwseq.c}                           |    37 +-
 .../dcn10/dcn10_hwseq.h}                           |     0
 .../amd/display/dc/{ => hwss}/dcn20/dcn20_hwseq.c  |   247 +-
 .../amd/display/dc/{ => hwss}/dcn20/dcn20_hwseq.h  |    11 +-
 .../display/dc/{ => hwss}/dcn201/dcn201_hwseq.c    |     2 +-
 .../display/dc/{ => hwss}/dcn201/dcn201_hwseq.h    |     0
 .../amd/display/dc/{ => hwss}/dcn21/dcn21_hwseq.c  |     2 +-
 .../amd/display/dc/{ => hwss}/dcn21/dcn21_hwseq.h  |     0
 .../amd/display/dc/{ => hwss}/dcn30/dcn30_hwseq.c  |    64 +-
 .../amd/display/dc/{ => hwss}/dcn30/dcn30_hwseq.h  |     5 +
 .../display/dc/{ => hwss}/dcn301/dcn301_hwseq.c    |     0
 .../display/dc/{ => hwss}/dcn301/dcn301_hwseq.h    |     0
 .../display/dc/{ => hwss}/dcn302/dcn302_hwseq.c    |     0
 .../display/dc/{ => hwss}/dcn302/dcn302_hwseq.h    |     0
 .../display/dc/{ => hwss}/dcn303/dcn303_hwseq.c    |     0
 .../display/dc/{ => hwss}/dcn303/dcn303_hwseq.h    |     0
 .../amd/display/dc/{ => hwss}/dcn31/dcn31_hwseq.c  |     2 +-
 .../amd/display/dc/{ => hwss}/dcn31/dcn31_hwseq.h  |     0
 .../display/dc/{ => hwss}/dcn314/dcn314_hwseq.c    |     7 +-
 .../display/dc/{ => hwss}/dcn314/dcn314_hwseq.h    |     0
 .../amd/display/dc/{ => hwss}/dcn32/dcn32_hwseq.c  |   111 +-
 .../amd/display/dc/{ => hwss}/dcn32/dcn32_hwseq.h  |     9 +
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |  1205 +
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.h    |    85 +
 .../amd/display/dc/{inc => hwss}/hw_sequencer.h    |    81 +-
 .../dc/{inc => hwss}/hw_sequencer_private.h        |     2 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |    40 +
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |    10 +-
 .../drm/amd/display/dc/inc/hw/clk_mgr_internal.h   |    18 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |    14 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |     1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h        |     6 +
 drivers/gpu/drm/amd/display/dc/inc/hw/pg_cntl.h    |    52 +
 .../gpu/drm/amd/display/dc/inc/hw/stream_encoder.h |     5 +
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |     1 +
 drivers/gpu/drm/amd/display/dc/inc/link.h          |     1 +
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |   285 +-
 drivers/gpu/drm/amd/display/dc/irq/Makefile        |     9 +
 .../amd/display/dc/irq/dce110/irq_service_dce110.c |    12 +-
 .../amd/display/dc/irq/dce120/irq_service_dce120.c |    12 +-
 .../amd/display/dc/irq/dce60/irq_service_dce60.c   |    12 +-
 .../amd/display/dc/irq/dce80/irq_service_dce80.c   |    12 +-
 .../amd/display/dc/irq/dcn10/irq_service_dcn10.c   |    14 +-
 .../amd/display/dc/irq/dcn20/irq_service_dcn20.c   |    14 +-
 .../amd/display/dc/irq/dcn201/irq_service_dcn201.c |    14 +-
 .../amd/display/dc/irq/dcn21/irq_service_dcn21.c   |    16 +-
 .../amd/display/dc/irq/dcn30/irq_service_dcn30.c   |    16 +-
 .../amd/display/dc/irq/dcn302/irq_service_dcn302.c |    16 +-
 .../amd/display/dc/irq/dcn303/irq_service_dcn303.c |    14 +-
 .../amd/display/dc/irq/dcn31/irq_service_dcn31.c   |    16 +-
 .../amd/display/dc/irq/dcn314/irq_service_dcn314.c |    16 +-
 .../amd/display/dc/irq/dcn315/irq_service_dcn315.c |    16 +-
 .../amd/display/dc/irq/dcn32/irq_service_dcn32.c   |    16 +-
 .../amd/display/dc/irq/dcn35/irq_service_dcn35.c   |   427 +
 .../amd/display/dc/irq/dcn35/irq_service_dcn35.h   |    34 +
 drivers/gpu/drm/amd/display/dc/irq/irq_service.h   |     2 +-
 drivers/gpu/drm/amd/display/dc/link/Makefile       |     4 +-
 .../amd/display/dc/link/accessories/link_dp_cts.c  |   117 +-
 .../amd/display/dc/link/accessories/link_fpga.c    |    95 -
 .../drm/amd/display/dc/link/hwss/link_hwss_dpia.c  |     2 +
 .../gpu/drm/amd/display/dc/link/link_detection.c   |     9 +
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |    61 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |     8 +-
 .../drm/amd/display/dc/link/protocols/link_ddc.c   |     2 +
 .../display/dc/link/protocols/link_dp_capability.c |    14 +-
 .../dc/link/protocols/link_dp_irq_handler.c        |     2 +
 .../amd/display/dc/link/protocols/link_dp_phy.c    |     3 +-
 .../dc/link/protocols/link_edp_panel_control.c     |    52 +-
 .../dc/link/protocols/link_edp_panel_control.h     |     3 +
 drivers/gpu/drm/amd/display/dc/os_types.h          |     1 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |    52 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   218 +-
 drivers/gpu/drm/amd/display/dmub/src/Makefile      |     1 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.c  |    64 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.h  |    17 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c  |   552 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.h  |   282 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |    92 +-
 drivers/gpu/drm/amd/display/include/dal_types.h    |     2 +
 .../drm/amd/display/include/ddc_service_types.h    |     1 +
 drivers/gpu/drm/amd/display/include/logger_types.h |   143 +-
 .../drm/amd/display/modules/color/color_gamma.c    |   115 +-
 .../drm/amd/display/modules/freesync/freesync.c    |    18 +-
 .../gpu/drm/amd/display/modules/inc/mod_stats.h    |     2 +-
 .../drm/amd/display/modules/power/power_helpers.c  |    20 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |     5 +
 .../amd/include/asic_reg/dcn/dcn_3_5_0_offset.h    | 15255 +++++
 .../amd/include/asic_reg/dcn/dcn_3_5_0_sh_mask.h   | 53412 +++++++++++++++++
 .../drm/amd/include/asic_reg/gc/gc_11_5_0_offset.h | 10000 ++++
 .../amd/include/asic_reg/gc/gc_11_5_0_sh_mask.h    | 36531 ++++++++++++
 .../include/asic_reg/mmhub/mmhub_3_3_0_offset.h    |  1395 +
 .../include/asic_reg/mmhub/mmhub_3_3_0_sh_mask.h   |  6722 +++
 .../amd/include/asic_reg/mp/mp_13_0_6_sh_mask.h    |    28 +
 .../drm/amd/include/asic_reg/mp/mp_14_0_0_offset.h |   359 +
 .../amd/include/asic_reg/mp/mp_14_0_0_sh_mask.h    |   534 +
 .../amd/include/asic_reg/nbio/nbio_7_11_0_offset.h |  9394 +++
 .../include/asic_reg/nbio/nbio_7_11_0_sh_mask.h    | 57846 +++++++++++++++++++
 .../amd/include/asic_reg/umc/umc_12_0_0_offset.h   |    33 +
 .../amd/include/asic_reg/umc/umc_12_0_0_sh_mask.h  |    95 +
 .../amd/include/asic_reg/vcn/vcn_4_0_0_offset.h    |   422 +
 .../amd/include/asic_reg/vcn/vcn_4_0_0_sh_mask.h   |   882 +
 .../amd/include/asic_reg/vcn/vcn_4_0_5_offset.h    |  1797 +
 .../amd/include/asic_reg/vcn/vcn_4_0_5_sh_mask.h   |  8614 +++
 .../amd/include/asic_reg/vpe/vpe_6_1_0_offset.h    |  1553 +
 .../amd/include/asic_reg/vpe/vpe_6_1_0_sh_mask.h   |  4393 ++
 drivers/gpu/drm/amd/include/atomfirmware.h         |    18 +
 drivers/gpu/drm/amd/include/discovery.h            |    38 +-
 .../drm/amd/include/ivsrcid/vpe/irqsrcs_vpe_6_1.h  |    40 +
 drivers/gpu/drm/amd/include/kgd_kfd_interface.h    |    23 +-
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |   165 +-
 drivers/gpu/drm/amd/include/pptable.h              |     4 +-
 drivers/gpu/drm/amd/include/soc15_hw_ip.h          |     1 +
 drivers/gpu/drm/amd/include/soc15_ih_clientid.h    |     2 +
 drivers/gpu/drm/amd/include/umsch_mm_4_0_api_def.h |   437 +
 drivers/gpu/drm/amd/pm/Makefile                    |     1 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |    36 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   935 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |    19 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |     2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/pptable_v1_0.h  |    16 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_thermal.c  |     4 +-
 .../drm/amd/pm/powerplay/hwmgr/vega10_thermal.c    |     4 +-
 .../drm/amd/pm/powerplay/hwmgr/vega20_thermal.c    |     4 +-
 drivers/gpu/drm/amd/pm/swsmu/Makefile              |     2 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   184 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |    32 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_6.h |    91 +
 .../pm/swsmu/inc/pmfw_if/smu14_driver_if_v14_0_0.h |   282 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_0_ppsmc.h   |     5 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_pmfw.h    |     8 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_ppsmc.h   |    24 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v14_0_0_pmfw.h    |   157 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v14_0_0_ppsmc.h   |   143 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |    25 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |     4 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v14_0.h       |   230 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |   272 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |    75 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   145 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |    36 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |    72 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |     8 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |   272 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |    44 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   487 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   |     2 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c   |     2 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  1073 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |   434 +-
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |    18 +-
 drivers/gpu/drm/amd/pm/swsmu/smu14/Makefile        |    30 +
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |  1727 +
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   |  1269 +
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.h   |    28 +
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |     3 +
 drivers/gpu/drm/radeon/evergreen.c                 |     7 +-
 drivers/gpu/drm/radeon/pptable.h                   |     2 +-
 drivers/gpu/drm/radeon/radeon.h                    |     4 -
 drivers/gpu/drm/radeon/radeon_connectors.c         |     2 +
 drivers/gpu/drm/radeon/radeon_drv.c                |     2 -
 drivers/gpu/drm/radeon/radeon_fence.c              |   111 +-
 drivers/gpu/drm/radeon/radeon_gem.c                |    16 -
 drivers/gpu/drm/radeon/radeon_ttm.c                |     2 -
 include/uapi/drm/amdgpu_drm.h                      |    36 +-
 include/uapi/linux/kfd_ioctl.h                     |     3 +
 591 files changed, 267128 insertions(+), 5756 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfxhub_v11_5_0.c
 rename drivers/gpu/drm/amd/{display/dc/link/accessories/link_fpga.h => amdgpu/gfxhub_v11_5_0.h} (84%)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/nbio_v7_11.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/umc_v12_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/umsch_mm_v4_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/umsch_mm_v4_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vpe_6_1_fw_if.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vpe_v6_1.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vpe_v6_1.h
 rename drivers/gpu/drm/amd/display/dc/{dml/calcs => basics}/bw_fixed.c (94%)
 rename drivers/gpu/drm/amd/display/dc/{dml/calcs => basics}/calcs_logger.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml/calcs => basics}/custom_float.c (66%)
 rename drivers/gpu/drm/amd/display/dc/{dml/calcs => basics}/dce_calcs.c (100%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dccg.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dccg.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dio_link_encoder.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dio_link_encoder.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dio_stream_encoder.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dio_stream_encoder.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dpp.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dpp.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dsc.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dsc.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dwb.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dwb.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_hubbub.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_hubbub.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_hubp.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_hubp.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_init.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_init.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_mmhubbub.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_mmhubbub.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_opp.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_opp.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_pg_cntl.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_pg_cntl.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/cmntypes.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/display_mode_core_structs.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/display_mode_lib_defines.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_types.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml2_internal_types.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml_assert.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml_depedencies.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml_display_rq_dlg_calc.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml_display_rq_dlg_calc.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml_logging.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/hwss/Makefile
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dce/dce_hwseq.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dce/dce_hwseq.h (98%)
 rename drivers/gpu/drm/amd/display/dc/{dce100/dce100_hw_sequencer.c => hwss/dce100/dce100_hwseq.c} (98%)
 rename drivers/gpu/drm/amd/display/dc/{dce100/dce100_hw_sequencer.h => hwss/dce100/dce100_hwseq.h} (100%)
 rename drivers/gpu/drm/amd/display/dc/{dce110/dce110_hw_sequencer.c => hwss/dce110/dce110_hwseq.c} (98%)
 rename drivers/gpu/drm/amd/display/dc/{dce110/dce110_hw_sequencer.h => hwss/dce110/dce110_hwseq.h} (100%)
 rename drivers/gpu/drm/amd/display/dc/{dce112/dce112_hw_sequencer.c => hwss/dce112/dce112_hwseq.c} (98%)
 rename drivers/gpu/drm/amd/display/dc/{dce112/dce112_hw_sequencer.h => hwss/dce112/dce112_hwseq.h} (100%)
 rename drivers/gpu/drm/amd/display/dc/{dce120/dce120_hw_sequencer.c => hwss/dce120/dce120_hwseq.c} (98%)
 rename drivers/gpu/drm/amd/display/dc/{dce120/dce120_hw_sequencer.h => hwss/dce120/dce120_hwseq.h} (100%)
 rename drivers/gpu/drm/amd/display/dc/{dce80/dce80_hw_sequencer.c => hwss/dce80/dce80_hwseq.c} (94%)
 rename drivers/gpu/drm/amd/display/dc/{dce80/dce80_hw_sequencer.h => hwss/dce80/dce80_hwseq.h} (100%)
 rename drivers/gpu/drm/amd/display/dc/{dcn10/dcn10_hw_sequencer.c => hwss/dcn10/dcn10_hwseq.c} (99%)
 rename drivers/gpu/drm/amd/display/dc/{dcn10/dcn10_hw_sequencer.h => hwss/dcn10/dcn10_hwseq.h} (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn20/dcn20_hwseq.c (96%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn20/dcn20_hwseq.h (97%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn201/dcn201_hwseq.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn201/dcn201_hwseq.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn21/dcn21_hwseq.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn21/dcn21_hwseq.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn30/dcn30_hwseq.c (94%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn30/dcn30_hwseq.h (94%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn301/dcn301_hwseq.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn301/dcn301_hwseq.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn302/dcn302_hwseq.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn302/dcn302_hwseq.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn303/dcn303_hwseq.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn303/dcn303_hwseq.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn31/dcn31_hwseq.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn31/dcn31_hwseq.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn314/dcn314_hwseq.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn314/dcn314_hwseq.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn32/dcn32_hwseq.c (94%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn32/dcn32_hwseq.h (94%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.h
 rename drivers/gpu/drm/amd/display/dc/{inc => hwss}/hw_sequencer.h (93%)
 rename drivers/gpu/drm/amd/display/dc/{inc => hwss}/hw_sequencer_private.h (98%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/inc/hw/pg_cntl.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/irq/dcn35/irq_service_dcn35.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/irq/dcn35/irq_service_dcn35.h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/link/accessories/link_fpga.c
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_5_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_5_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_11_5_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_11_5_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_3_3_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_3_3_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_14_0_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_14_0_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_11_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_11_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/umc/umc_12_0_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/umc/umc_12_0_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/vcn/vcn_4_0_5_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/vcn/vcn_4_0_5_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/vpe/vpe_6_1_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/vpe/vpe_6_1_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/ivsrcid/vpe/irqsrcs_vpe_6_1.h
 create mode 100644 drivers/gpu/drm/amd/include/umsch_mm_4_0_api_def.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu14_driver_if_v14_0_0.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v14_0_0_pmfw.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v14_0_0_ppsmc.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v14_0.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu14/Makefile
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.h
