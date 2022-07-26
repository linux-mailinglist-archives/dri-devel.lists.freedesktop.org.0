Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 033E0581988
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 20:16:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2810010E184;
	Tue, 26 Jul 2022 18:15:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B940214ABA5;
 Tue, 26 Jul 2022 18:15:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AdJ+ZqzlxL0asUVHsQbnKLkTflwoSJvtyfmM4lk+e6e0w4puOlUdK0HzGZVd4hxJQOPeCga16Z3LirT0ugCQqwgmjsrISEZz/Sp2HVt5HnvRVkV8aylOMpxUhH7Ipfs3vcGt7kdxpvj+ZDx7E3NDisYpR2MmADLZ5SNoKpHkkTejOnTlSZwI7Bbb9dvjXGJiKASFJsfYRtidxwD8diivT5818cVgOaSWRlnR+m/9fkjMmD7pl6fN1u6pkM+u2zSjVXqTFljoSKdvS0Ax55MmRGFk/CiBEC6pWDXdlj/LtG1E30m4UWVQDnVX0miC8pjyBlI6JFgbpkVRqDTGvSQy5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDoxPyvQprg6Sqm9ZE1JNMQlnVJOf3+uBRtgaVngPII=;
 b=Dxy2jCjLePxVae8Dio+/RQ7VNkLoW5Xzr1gR2KZfV++uhC6X1f6V26XFr4IKjGHPNyoR1iMFNV2wcr/fk3bboEDf/hSH/KJPtNDsv4Fe3okXhqApaSIlUj0iWCvioaSGEnFqRgxj8KXkCt3IlY3vFG5bGAUsH4Byw9A+C2IR4tKqv75yo4vowqTKsod7VS+0xz4/kXmymqr6UlptWfiV1rZcoRa07XYRcJeVVXGrTFZ9380fRTEuwFrCTvk7FTZyzeAMBliMtkLMInCqns3Vwtbcmn62oQGSwf/0sSb6IQrEAg2IUR+nUZ56MlWG7W0nusEW34T0pOMJBxTvPa89eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDoxPyvQprg6Sqm9ZE1JNMQlnVJOf3+uBRtgaVngPII=;
 b=sDoAhOW1bmNWEAjf0MP57zKz+YAPVeVAx1IsvhsDDo85dOsGYIApO0TQrVl5VMi0CMwdoeRdljV4lg9LyaYnrzBiTP68eFrI0D6qTjtb6lW2yxVy5aGU5WA2H3UmCHGxqVP89vBKlH4LWW78ZoYnher2UqeN8YA1PNI2+puT4aQ=
Received: from DM6PR07CA0107.namprd07.prod.outlook.com (2603:10b6:5:330::21)
 by BL0PR12MB2484.namprd12.prod.outlook.com (2603:10b6:207:4e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Tue, 26 Jul
 2022 18:15:51 +0000
Received: from DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:330:cafe::90) by DM6PR07CA0107.outlook.office365.com
 (2603:10b6:5:330::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.7 via Frontend
 Transport; Tue, 26 Jul 2022 18:15:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT057.mail.protection.outlook.com (10.13.172.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5458.17 via Frontend Transport; Tue, 26 Jul 2022 18:15:50 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 26 Jul
 2022 13:15:49 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-next-5.20
Date: Tue, 26 Jul 2022 14:15:36 -0400
Message-ID: <20220726181536.5759-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17bdb43e-d209-45cb-8555-08da6f32df33
X-MS-TrafficTypeDiagnostic: BL0PR12MB2484:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ve/x4GFlRaPuZAsJMpsLHBfDPsPyMjsjaJIKIsAVRlfngmilQTOxoEAv2rllkSWE0FhcPdAfMAwu/5fTvPSAAQtUAa4sbAPYJrDr+4wBgD7Sgnfh+Zz2nV0+WnuIIOR7Ihw5tS9ddUHhhyHchbeOPZ9qJku28lmDuVlz3EYsVNdnwywKiGfV1zQh8q4GqUg7EazWLYTxiOhNT391nGzjeIAxHeEftbi151geyceI0NEMr8zdH7MI3JSgkzO8NVhTPSGFz6l3mwuaRUnOID6b0kSeWTc2v9gamFgQKmd9TP3fRohnbGlfSWo7SsQQ/11m6yS5R6TNN9RpSM8G0FL2LtIVRGrXRscFGYiU+/KxurkbE2V/S95oTWHpwDR8viO/fqle55EySjpT158nlgTfAeL3GpfJwScZGIetcmlCXF+zxCZ0/0EYhfSdqQAkmJOp08HVEElKnZKJvDGIgZvRncoWHvVd00qMCrSKptw1nI35Sqa+Z7ysQVnawv/FjXlxnobZEr4XUUSFzzObcXc5JFYTj7gwVCNeZd+KUlXMD3sCCZFfJIs4Bu4p2lc933qujNoWf9Hqo79D/6QsfgF2rX1ulHkZQeE8mvP5C0DoflEqcEoA/iigwGx//zyU6S3aWmlkRT766dBxjptnAKhlBPkDATbfJ9fBIFBd2PAi8G8bcxft6ML+AYCCs0ekWYwM3ZNqWnVz1mVcQXih18dtcm8Lq/ZJA75pmpvxWlElsqy2Ggp11Ad9oLLze+Efhn5MFy+n25n4VJsBF6Jw1pmSyyZ4JkyYOLP6MrdDX889ans=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(396003)(346002)(376002)(46966006)(40470700004)(36840700001)(40480700001)(316002)(2906002)(82310400005)(7696005)(19627235002)(36860700001)(70206006)(8936002)(70586007)(8676002)(40460700003)(86362001)(4326008)(478600001)(6666004)(356005)(966005)(82740400003)(41300700001)(5660300002)(81166007)(110136005)(47076005)(66574015)(16526019)(83380400001)(186003)(26005)(426003)(30864003)(2616005)(1076003)(36756003)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 18:15:50.8996 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17bdb43e-d209-45cb-8555-08da6f32df33
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2484
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

Bug fixes for 5.20 and a few new things.  I know it's a bit late for new
stuff, but this is mainly fixes for new IPs that were just added in 5.20
and more DC cleanup which is just code shuffling to group FP code into
separate code objects and spliting up the DC DM code into more files.

The following changes since commit 891ce1c9623f36194587d02774ac3d8c30c3ca72:

  Merge tag 'drm-misc-next-fixes-2022-07-14' of git://anongit.freedesktop.org/drm/drm-misc into drm-next (2022-07-15 15:35:33 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.20-2022-07-26

for you to fetch changes up to 1b54a0121dba12af268fb75c413feabdb9f573d4:

  drm/amd/display: Reduce stack size in the mode support function (2022-07-25 17:23:30 -0400)

----------------------------------------------------------------
amdgpu:
- VCN4 fixes
- RAS support for UMC 8.10
- ACP support for jadeite platforms
- NBIO HDP flush fixes
- Misc spelling and grammar fixes
- Runtime PM fixes
- Non-DC HPD fix
- Clean up amdgpu DM code
- DSC fixes
- Expose some additional GFXOFF data via debugfs
- More FP clean up for new DCN blocks
- PPC DC FP fixes
- DCN 3.1.4 fixes
- DC DML stack usage fixes
- GMC fixes
- SPM fixes for RDNA2

amdkfd:
- MMU notifier fix
- Mutex fix

UAPI:
- Add a comment about VCN4 unified queues
- IP version information for UMDs
  Proposed mesa change: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/17411/diffs?commit_id=c8a63590dfd0d64e6e6a634dcfed993f135dd075

----------------------------------------------------------------
Aaron Liu (2):
      drm/amdgpu: enable swiotlb for gmc 10.0 (V2)
      drm/amdgpu: enable swiotlb for gmc 11.0

Alex Deucher (10):
      drm/amdgpu: use the same HDP flush registers for all nbio 7.4.x
      drm/amdgpu: use the same HDP flush registers for all nbio 2.3.x
      drm/amdgpu: restore original stable pstate on ctx fini
      drm/amdgpu: add the IP discovery IP versions for HW INFO data
      drm/amdgpu: bump driver version for IP discovery info in HW INFO
      drm/amd/display: reduce stack size in dcn32 dml (v2)
      drm/amd/display: reduce stack for dml32_CalculateSwathAndDETConfiguration
      drm/amd/display: reduce stack for dml32_CalculateVMRowAndSwath
      drm/amd/display: reduce stack for dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport
      drm/amd/display: reduce stack for dml32_CalculatePrefetchSchedule

Alex Sierra (1):
      drm/amdgpu: remove acc_size from reserve/unreserve mem

Alvin Lee (8):
      drm/amd/display: Update in dml
      drm/amd/display: Don't set dram clock change requirement for SubVP
      drm/amd/display: Updates SubVP and SubVP DRR cases
      drm/amd/display: Calculate MALL cache lines based on Mblks required
      drm/amd/display: Fallback to SW cursor if SubVP + cursor too big
      drm/amd/display: Update DCN32 and DCN321 SR latencies
      drm/amd/display: Disable MPC split for DCN32/321
      drm/amd/display: Add debug option for idle optimizations on cursor updates

Andrey Grodzovsky (1):
      drm/amdgpu: Get rid of amdgpu_job->external_hw_fence

André Almeida (3):
      drm/amdgpu: Clarify asics naming in Kconfig options
      drm/amd/debugfs: Expose GFXOFF state to userspace
      Documentation/gpu: Add GFXOFF section

Anthony Koo (2):
      drm/amd/display: Add support for manual DMUB FAMS trigger
      drm/amd/display: 3.2.196

Aric Cyr (2):
      drm/amd/display: 3.2.195
      drm/amd/display: Avoid MPC infinite loop

Aurabindo Pillai (2):
      drm/amd/display: Revert "drm/amd/display: disable idle optimizations"
      drm/amd/display: Add dc_ctx to link_enc_create() parameters

Chengming Gui (1):
      drm/amd/amdgpu: add TAP_DELAYS upload support for gfx10

Chris Park (2):
      drm/amd/display: Update Cursor Attribute MALL cache
      drm/amd/display: Cache cursor when cursor exceeds 64x64

Colin Ian King (1):
      drm/amd/display: Fix spelling mistake "supporing" -> "supporting"

Dan Carpenter (1):
      drm/amd/display: Remove unnecessary NULL check in commit_planes_for_stream()

Evan Quan (4):
      drm/amd/pm: enable GPO feature support for SMU13.0.0
      drm/amd/pm: update SMU13.0.0 driver_if header
      drm/amd/pm: correct smu 13.0.0/7 mp1 state setup
      drm/amd/pm: revise the driver reloading fix for SMU 13.0.0 and 13.0.7

Gavin Wan (1):
      drm/amdgpu: fix scratch register access method in SRIOV

Guchun Chen (4):
      drm/amdgpu: introduce runtime pm mode
      drm/amdgpu: skip SMU FW reloading in runpm BACO case
      drm/amdgpu: drop runtime pm disablement quirk on several sienna cichlid cards
      drm/amdgpu: drop runpm from amdgpu_device structure

Guenter Roeck (1):
      drm/amd/display: Enable building new display engine with KCOV enabled

Hawking Zhang (1):
      drm/amdgpu: correct the PSP_BL_CMD enum

Jason Wang (2):
      drm/radeon: Fix comment typo
      drm/amdgpu: Fix comment typo

Jun Lei (2):
      drm/amd/display: Remove unused variable
      drm/amd/display: Update DML logic for unbounded req handling

Kenneth Feng (3):
      drm/amd/pm: enable mode1 reset for smu_v13_0_7
      drm/amd/pm: enable gfx ulv and gpo on smu_v13_0_7
      drm/amd/pm: update driver if header for smu_13_0_7

Leo Li (3):
      drm/amd/display: Add visualconfirm module parameter
      drm/amd/display: Add dcdebugmask option for disabling MPO
      drm/amd/display: Copy crc_skip_count when duplicating CRTC state

Luben Tuikov (1):
      drm/amdgpu: Protect the amdgpu_bo_list list with a mutex v2

Maíra Canal (8):
      drm/amdgpu: Write masked value to control register
      drm/amd/display: Change get_pipe_idx function scope
      drm/amd/display: Remove unused clk_src variable
      drm/amd/display: Remove unused dml32_CalculatedoublePipeDPPCLKAndSCLThroughput function
      drm/amd/display: Remove unused NumberOfStates variable
      drm/amd/display: Remove unused variables from dml_rq_dlg_get_dlg_params
      drm/amd/display: Remove unused variables from dcn10_stream_encoder
      drm/amd/display: Remove unused MaxUsedBW variable

Melissa Wen (6):
      drm/amd/display: move dcn31_update_soc_for_wm_a func to dml fpu folder
      drm/amd/display: fix soft-fp vs hard-fp on DCN 3.1 family for powerpc
      drm/amd/display: remove useless FPU protection wrapper from dcn31_resource file
      drm/amd/display: move FPU code on dcn21 clk_mgr
      drm/amd/display: move FPU code from dcn30 clk mgr to DML folder
      drm/amd/display: move FPU code from dcn301 clk mgr to DML folder

Michael Strauss (6):
      drm/amd/display: Add pixel rate div calcs and programming
      drm/amd/display: Use correct DTO_SRC_SEL for 128b/132b encoding
      drm/amd/display: Use correct clock source constructor for DCN314
      drm/amd/display: Add OTG/ODM functions
      drm/amd/display: Add missing AUDIO_DTO_SEL reg field
      drm/amd/display: Fix dpstreamclk programming

Nicholas Kazlauskas (3):
      drm/amd/display: Add enable/disable FIFO callbacks to stream setup
      drm/amd/display: Fix OPTC function pointers for DCN314
      drm/amd/display: Guard against zero memory channels

Philip Yang (2):
      drm/amdkfd: Correct mmu_notifier_get failure handling
      drm/amdkfd: Process notifier release callback don't take mutex

Rajneesh Bhardwaj (1):
      drm/amdgpu: Refactor code to handle non coherent and uncached

Rodrigo Siqueira (23):
      drm/amd/display: Create a file dedicated to planes
      drm/amd/display: Create a file dedicated for CRTC
      drm/amd/display: Fix hard hang if DSC is disabled
      drm/amd/display: Drop FPU flags from dcn32_clk_mgr
      drm/amd/display: Move populate phaton function to dml
      drm/amd/display: Move predict pipe to dml fpu folder
      drm/amd/display: Move insert entry table to the FPU code
      drm/amd/display: Move phanton stream to FPU code
      drm/amd/display: Move SubVP functions to dcn32_fpu
      drm/amd/display: Move wm and dlg calculation to FPU code
      drm/amd/display: Move dlg params calculation
      drm/amd/display: Move ntuple to insert entry
      drm/amd/display: Move bounding box to FPU folder
      drm/amd/display: Drop FPU flags from dcn32 Makefile
      drm/amd/display: Create dcn321_fpu file
      drm/amd/display: Drop FPU code from dcn321 resource
      drm/amd/display: Drop unnecessary FPU flags on dcn302 files
      drm/amd/display: Remove FPU operations from dcn201 resources
      drm/amd/display: Move mclk calculation function to DML
      drm/amd/display: Create patch bounding box function for isolate FPU
      drm/amd/display: Remove FPU flags from DCN30 Makefile
      drm/amd/display: Add reinstate dram in the FPO logic
      drm/amd/display: Reduce stack size in the mode support function

Roman Li (4):
      drm/amd/display: Disable dmcu fw loading for dcn314
      drm/amdgpu: add dm ip block for dcn 3.1.4
      drm/amd/display: Fix dc_version detect for dcn314
      drm/amd/display: Specify supported modifiers for dcn314

Ruijing Dong (1):
      drm/amdgpu: add comment to HW_IP_VCN_ENC type

Samson Tam (2):
      drm/amd/display: Fix two MPO videos in single display ODM combine mode
      drm/amd/display: Add missing ODM 2:1 policy logic

Slark Xiao (1):
      drm/amd: Fix typo 'the the' in comment

Sonny Jiang (1):
      drm/amdgpu: limiting AV1 to first instance on VCN4 decode

Taimur Hassan (3):
      drm/amd/display: Update de-tile override to anticipate pipe splitting
      drm/amd/display: Loop through all pipes for DET allocation
      drm/amd/display: Reset pipe count when iterating for DET override

Vijendar Mukunda (3):
      drm/amdgpu: fix for coding style issues
      drm/amdgpu: add dmi check for jadeite platform
      drm/amdgpu: create I2S platform devices for Jadeite platform

Vladimir Stempen (1):
      drm/amd/display: Disable GPUVM in IP resource configuration

Wayne Lin (5):
      drm/amd/display: Support vertical interrupt 0 for all dcn ASIC
      drm/amd/display: Expose function reset_cur_dp_mst_topology
      drm/amd/display: fix trigger_hotplug to support mst case
      drm/amd/display: Add is_mst_connector debugfs entry
      drm/amd/display: Add tags for indicating mst progress status

Wenjing Liu (1):
      drm/amd/display: remove number of DSC slices override in DML

YiPeng Chai (3):
      drm/amdgpu: add umc v8_10_0 ip headers
      drm/amdgpu: add umc ras functions for umc v8_10_0
      drm/pm/swsmu: add ras eeprom i2c function for smu13 v13_0_0

hersen wu (1):
      drm/amd/display: Reboot while unplug hdcp enabled dp from mst hub

lin cao (1):
      drm/amdgpu: Call trace info was found in dmesg when loading amdgpu

 Documentation/gpu/amdgpu/thermal.rst               |   41 +
 drivers/gpu/drm/amd/amdgpu/Kconfig                 |    5 +-
 drivers/gpu/drm/amd/amdgpu/Makefile                |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c            |  354 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  111 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c        |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h        |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |   60 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   49 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   27 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h            |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   60 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   22 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h            |   10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |   30 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |   20 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |   10 +
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |    2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |    2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   53 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |    8 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |    5 +
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   32 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             |   21 -
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.h             |    1 -
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |   21 -
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.h             |    1 -
 drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h            |    2 +
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |    1 +
 drivers/gpu/drm/amd/amdgpu/umc_v8_10.c             |  357 +++
 drivers/gpu/drm/amd/amdgpu/umc_v8_10.h             |   70 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |  131 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   27 +-
 drivers/gpu/drm/amd/display/Kconfig                |    2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/Makefile     |    8 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 2671 +++-----------------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   20 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |  464 ++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.h |   51 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |  114 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |   34 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   18 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   13 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    | 1646 ++++++++++++
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h    |   73 +
 drivers/gpu/drm/amd/display/dc/Makefile            |    3 +
 drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile    |   43 -
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |  234 +-
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.h  |    7 +
 .../amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c   |   63 +-
 .../drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c |   85 +-
 .../drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.h |    3 +
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |   81 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |    2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |    4 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |    1 +
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  140 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |    5 +
 drivers/gpu/drm/amd/display/dc/dc.h                |    3 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   17 +
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |    1 +
 drivers/gpu/drm/amd/display/dc/dc_link.h           |    3 +
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |   22 +-
 .../drm/amd/display/dc/dce100/dce100_resource.c    |    1 +
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |    1 +
 .../drm/amd/display/dc/dce110/dce110_resource.c    |    1 +
 .../drm/amd/display/dc/dce112/dce112_resource.c    |    1 +
 .../drm/amd/display/dc/dce120/dce120_resource.c    |    1 +
 .../gpu/drm/amd/display/dc/dce60/dce60_resource.c  |    1 +
 .../gpu/drm/amd/display/dc/dce80/dce80_resource.c  |    1 +
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |    1 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mpc.c   |    5 +
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |    1 +
 .../amd/display/dc/dcn10/dcn10_stream_encoder.c    |   10 -
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |    1 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |    2 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.h  |    1 +
 drivers/gpu/drm/amd/display/dc/dcn201/Makefile     |   24 -
 .../drm/amd/display/dc/dcn201/dcn201_resource.c    |   11 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |    1 +
 drivers/gpu/drm/amd/display/dc/dcn30/Makefile      |   30 -
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |   58 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.h  |    3 +
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |    1 +
 drivers/gpu/drm/amd/display/dc/dcn302/Makefile     |   25 -
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |    4 +-
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |    4 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c  |    8 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.h  |    8 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.c  |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.h  |    2 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |   21 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.h  |    1 -
 .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c    |   30 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.h    |    3 +-
 .../display/dc/dcn314/dcn314_dio_stream_encoder.c  |   38 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c   |   36 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.h   |    2 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_init.c    |    1 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_optc.c    |   37 +-
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |    9 +-
 .../drm/amd/display/dc/dcn315/dcn315_resource.c    |    6 +-
 .../drm/amd/display/dc/dcn316/dcn316_resource.c    |    6 +-
 drivers/gpu/drm/amd/display/dc/dcn32/Makefile      |   28 -
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c  |    3 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.c  |   44 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.h  |    5 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |   23 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c  |   63 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  | 2341 ++---------------
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |   22 +-
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |  146 +-
 drivers/gpu/drm/amd/display/dc/dcn321/Makefile     |   25 -
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |  653 +----
 .../drm/amd/display/dc/dcn321/dcn321_resource.h    |    3 +
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |    4 +
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |  322 +++
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h   |    6 +
 .../gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c   |  126 +-
 .../gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.h   |    9 +
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |   28 -
 .../gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c |   74 +
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c   |   20 +
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h   |    5 +
 .../display/dc/dml/dcn31/display_rq_dlg_calc_31.c  |   19 -
 .../display/dc/dml/dcn314/display_mode_vba_314.c   |    2 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   | 2291 +++++++++++++++++
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.h   |   74 +
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |  613 +++--
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |  930 ++++---
 .../dc/dml/dcn32/display_mode_vba_util_32.h        |   15 +-
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c |  684 +++++
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.h |   38 +
 .../drm/amd/display/dc/dml/display_mode_structs.h  |    1 +
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.c  |    4 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.h  |  143 +-
 drivers/gpu/drm/amd/display/dc/inc/clock_source.h  |    7 +-
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |    1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |    3 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |    2 +-
 .../gpu/drm/amd/display/dc/inc/hw/stream_encoder.h |    2 +
 .../amd/display/dc/irq/dcn30/irq_service_dcn30.c   |   14 +-
 .../amd/display/dc/irq/dcn303/irq_service_dcn303.c |   19 +
 .../gpu/drm/amd/display/dc/link/link_hwss_dio.c    |    7 +
 .../gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c |    4 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |    9 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |    1 +
 .../amd/include/asic_reg/umc/umc_8_10_0_offset.h   |   33 +
 .../amd/include/asic_reg/umc/umc_8_10_0_sh_mask.h  |   94 +
 drivers/gpu/drm/amd/include/atombios.h             |    4 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |    9 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |    7 -
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h |    4 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h |   24 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |    4 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |    4 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  178 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |   24 +-
 drivers/gpu/drm/radeon/radeon_gem.c                |    2 +-
 include/uapi/drm/amdgpu_drm.h                      |    7 +-
 167 files changed, 9847 insertions(+), 7212 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/umc_v8_10.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/umc_v8_10.h
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.h
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/umc/umc_8_10_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/umc/umc_8_10_0_sh_mask.h
