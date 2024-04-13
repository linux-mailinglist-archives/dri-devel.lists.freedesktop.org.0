Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D088A3EC9
	for <lists+dri-devel@lfdr.de>; Sat, 13 Apr 2024 23:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B01C10EBC9;
	Sat, 13 Apr 2024 21:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LX9yvuG8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342CB10EBC0;
 Sat, 13 Apr 2024 21:37:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IcwyUDsZTnn4qr126YXNn1cKdI8DnRE/5SRn+uNn/tjp+0fIcnLIfB9QSK2P4yN3ItpvqPLw8rHHLxSDqrGZNhFJjqQ2vZjZrEjxiML7GkcrBP4+hTHnJDO7K5lWKO7aidiU8wSpwy+rKwgqaCGPjd4RgZ/dMqc6leZr0lp9Z2ki+SIWcBH1pdxbzJIkoI4VFSsoXc2cPRTcWOWg6gJT6YhV4C2iBkR2osRRh+wpeq34luZx8DYpiT3rEBeeubEneYjXAcCws2tGi9/Ij9Q28b4GIEMkA5rQ1dTv0zFoiXVDNBiSXNi/XJl1EE4p8BO/aDuzGXnkiOT87lS6fegv8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYy5W+MbmJAFF4vzDT+p6PdYMrp48+Uu34HW6y0ZSBk=;
 b=jzAvYQQ+/34b8mIg/kK9UOox9sTuWkkkdOvtP6UFaeJInHbHUlMfNL0Uxv2K1YZE85NXmm7W2ZffK6JYqa7yVUZxC1Y4KWjnZXw+zY2X4HCG84YSDkgPkLUswdpeGCBmv8MOtJFrK7E7dRwkNrFXRsUhijMxYzW5l9oK1H2A9hapbRYkNFwMmZvCO2pesP/aqZ+HtZ4vgiwhTiNbr24toDiDmHN27iNZOfkNcWWMb0CMelYhsE96MOWrfStwQWxOKt4c5ZG0KKkcQf7CJ6KfWh7Ozely9SaDK1+hvBnd2caD01EDLvIYamNJ2Ib1Na/CYwHkoygf3hQYHlBmRLv4vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYy5W+MbmJAFF4vzDT+p6PdYMrp48+Uu34HW6y0ZSBk=;
 b=LX9yvuG83d5M6G+Vil7E1QPUEuZX5gGIDP6kg4Kftlapjoo2ZJNI/obkqq+WJhlxLxeIEOVwtxHOKTQB6FMUYHdN2sNQLkfga2VA9S9DKGhpVIUnS+O6r+dRA14GBOe/hjkFy9kT0lABpqGZkbJVQCdshlEr0sWwqWRkqLb5q2c=
Received: from BN9PR03CA0200.namprd03.prod.outlook.com (2603:10b6:408:f9::25)
 by PH7PR12MB7284.namprd12.prod.outlook.com (2603:10b6:510:20b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Sat, 13 Apr
 2024 21:37:24 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:408:f9:cafe::a5) by BN9PR03CA0200.outlook.office365.com
 (2603:10b6:408:f9::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.28 via Frontend
 Transport; Sat, 13 Apr 2024 21:37:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Sat, 13 Apr 2024 21:37:23 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sat, 13 Apr
 2024 16:37:22 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-6.10
Date: Sat, 13 Apr 2024 17:37:07 -0400
Message-ID: <20240413213708.3427038-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004687:EE_|PH7PR12MB7284:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e163335-7782-4b52-c568-08dc5c01e80e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ib2oXTs2YP+OziMd7JaaG7a9jJMeqdql0g7XyQkEw/0nlUrqcPARtB9jA+uYEUUAfrJw11OkTJCgM/UqAuAy7w4pNUqb1UrJXB8/WtEgiXkRSlNWKvJc6PmI43BEWyfaxS371Q2OklGoIdfIYl2hi4DljqDSfDWcegf3ff5x8X87GZNvguyil3v7F+p3jUAIkBNpRBZhftxwnOq/dPz6RxBDFs2Q2NIAYgjf922n0mqpuPKkGj/fMEqH/YSlGVQ9GLgy3F72Igqzgmj4G2/4xopR5KPR8sCxk48r6Tt4v1xih5ikBoLHu3LirXQ6TU6A8cOQJkI4zExGYchKdMWFu3G+h/4KRyJSxbzH+M5vvu/rHdb8SIRETmyDT6xWAOieehXeOsgwTAzjNx5yqLLMqieaJEaQuZilai2jjbdQZHgx7jcN+e+RPkDMyte1GnYtxXdk1Ab8WXuaqul/6m5gANpV2bMuYwZGnQ2ynXUT4hUWXyKTLTSPR+V2PSD7wRjOzY7/gkLIwaDTnrBTikIJVRVpDGuHmRnUX+eqfTRz3smwo1FC/0HaG49kv2qjUnChE1sk3TqkYaUig5DgzcGY+KZ47zGX7OT2/E+qqmHTCtiefGamG8O9x5XOL81//v+cCvPkUbAEfVUw7sdx15u5ku3oBITelyM5szDBseV7Qx9Cn1CC1iow1rUXww6Kmuu3
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(82310400014)(36860700004)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2024 21:37:23.7303 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e163335-7782-4b52-c568-08dc5c01e80e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7284
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

New stuff for 6.10.

The following changes since commit bc55c344b06f7e6f99eb92d393ff0a84c1532514:

  drm/amdgpu/pm: Don't use OD table on Arcturus (2024-03-20 13:36:29 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.10-2024-04-13

for you to fetch changes up to ab956ed95b8bc4a65c913d7057075866d5fc3724:

  drm/amd/display: Add a function for checking tmds mode (2024-04-12 00:36:47 -0400)

----------------------------------------------------------------
amd-drm-next-6.10-2024-04-13:

amdgpu:
- HDCP fixes
- ODM fixes
- RAS fixes
- Devcoredump improvements
- Misc code cleanups
- Expose VCN activity via sysfs
- SMY 13.0.x updates
- Enable fast updates on DCN 3.1.4
- Add dclk and vclk reporting on additional devices
- Add ACA RAS infrastructure
- Implement TLB flush fence
- EEPROM handling fixes
- SMUIO 14.0.2 support
- SMU 14.0.1 Updates
- Sync page table freeing with TLB flushes
- DML2 refactor
- DC debug improvements
- SR-IOV fixes
- Suspend and Resume fixes
- DCN 3.5.x Updates
- Z8 fixes
- UMSCH fixes
- GPU reset fixes
- HDP fix for second GFX pipe on GC 10.x
- Enable secondary GFX pipe on GC 10.3
- Refactor and clean up BACO/BOCO/BAMACO handling
- VCN partitioning fix
- DC DWB fixes
- VSC SDP fixes
- DCN 3.1.6 fix
- GC 11.5 fixes
- Remove invalid TTM resource start check
- DCN 1.0 fixes

amdkfd:
- MQD handling cleanup
- Preemption handling fixes for XCDs
- TLB flush fix for GC 9.4.2
- Properly clean up workqueue during module unload
- Fix memory leak process create failure
- Range check CP bad op exception targets to avoid reporting invalid exceptions to userspace

radeon:
- Misc code cleanups

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu: always force full reset for SOC21
      Documentation: add a page on amdgpu debugging

Alex Hung (4):
      drm/amd/display: Delete duplicated function prototypes
      drm/amd/display: Correct indentations and spaces
      drm/amd/display: Skip on writeback when it's not applicable
      drm/amd/display: Return max resolution supported by DWB

Allen Pan (1):
      drm/amd/display: expand the non standard link rate for testing

Alvin Lee (5):
      drm/amd/display: Backup and restore only on full updates
      drm/amd/display: Allow idle opts for no flip case on PSR panel
      drm/amd/display: Remove plane and stream pointers from dc scratch
      drm/amd/display: Add extra logging for HUBP and OTG
      drm/amd/display: Add extra DMUB logging to track message timeout

Anthony Koo (5):
      drm/amd/display: Add entry and exit counters
      drm/amd/display: Update DMUB flags and definitions
      drm/amd/display: [FW Promotion] Release 0.0.208.0
      drm/amd/display: [FW Promotion] Release 0.0.210.0
      drm/amd/display: [FW Promotion] Release 0.0.212.0

Aric Cyr (8):
      drm/amd/display: 3.2.274
      drm/amd/display: 3.2.275
      drm/amd/display: 3.2.276
      drm/amd/display: 3.2.277
      drm/amd/display: 3.2.278
      drm/amd/display: Fix compiler warnings on high compiler warning levels
      drm/amd/display: 3.2.279
      drm/amd/display: 3.2.280

Arunpravin Paneer Selvam (1):
      drm/amd/amdgpu: add pipe1 hardware support

Asad Kamal (4):
      drm/amd/pm: Update SMUv13.0.6 PMFW headers
      drm/amd/pm: Use metric table for pcie speed/width
      drm/amd/pm: Report uclk/sclk current limits
      drm/amd/pm: Update uclk/sclk limit report format

Aurabindo Pillai (2):
      drm/amd/display: Add some forward declarations
      drm/amd/display: Add DML2 folder to include path

Bhawanpreet Lakha (2):
      drm/amd/display: Allow Z8 when stutter threshold is not met
      drm/amd/display: Allow Z8 when stutter threshold is not met for dcn35

Candice Li (1):
      drm/amdgpu: Update setting EEPROM table version

Chaitanya Dhere (1):
      drm/amd/display: Add TB_BORROWED_MAX definition

Charlene Liu (3):
      drm/amd/display: fix debug key not working on dml2
      drm/amd/display: change aux_init to apu version
      drm/amd/display: add dwb support to dml2

Chris Park (2):
      drm/amd/display: Prevent crash when disable stream
      drm/amd/display: Add a function for checking tmds mode

Christian Koenig (1):
      drm/amdgpu: implement TLB flush fence

Christian König (1):
      drm/amdgpu: remove invalid resource->start check v2

Daniel Miess (2):
      drm/amd/display: Toggle additional RCO options in DCN35
      drm/amd/display: Enable RCO for HDMISTREAMCLK in DCN35

Danijel Slivka (1):
      drm/amdgpu: use vm_update_mode=0 as default in sriov for gfx10.3 onwards

Dillon Varone (9):
      drm/amd/display: add stream clock source to DP DTO params
      drm/amd/display: Program pixclk according to dcn revision
      drm/amd/display: Power on VPG memory unconditionally if off
      drm/amd/display: Expand DML2 callbacks
      drm/amd/display: Refactor DML2 interfaces
      drm/amd/display: Modify DHCUB waterwark structures and functions
      drm/amd/display: Add dmub additional interface support for FAMS
      drm/amd/display: Add driver support for future FAMS versions
      drm/amd/display: Do not recursively call manual trigger programming

Duncan Ma (1):
      drm/amd/display: Allow HPO PG for DCN35

Eric Bernstein (1):
      drm/amd/display: Fix MPCC DTN logging

Eric Huang (1):
      drm/amdkfd: fix TLB flush after unmap for GFX9.4.2

Erick Archer (1):
      drm/radeon/radeon_display: Decrease the size of allocated memory

Felix Kuehling (1):
      drm/amdkfd: Fix memory leak in create_process failure

Fudongwang (1):
      drm/amd/display: fix disable otg wa logic in DCN316

Gabe Teeger (1):
      drm/amd/display: Revert Add left edge pixel + ODM pipe split

George Shen (4):
      drm/amd/display: Add left edge pixel for YCbCr422/420 + ODM pipe split
      drm/amd/display: Remove MPC rate control logic from DCN30 and above
      drm/amd/display: Add dummy interface for tracing DCN32 SMU messages
      drm/amd/display: Rebuild test pattern params for DP_TEST_PATTERN_VIDEO_MODE

Hamza Mahfooz (1):
      drm/amd/display: fix IPX enablement

Harish Kasiviswanathan (1):
      drm/amdkfd: Reset GPU on queue preemption failure

Harry Wentland (3):
      Revert "drm/amd/display: Fix sending VSC (+ colorimetry) packets for DP/eDP displays without PSR"
      drm/amd/display: Program VSC SDP colorimetry for all DP sinks >= 1.4
      drm/amd/display: Set VSC SDP Colorimetry same way for MST and SST

Hawking Zhang (6):
      drm/amdgpu: Apply retry to IP discovery v2 and v4
      drm/amdgpu: Add smuio v14_0_2 ip headers (v4)
      drm/amdgpu: Add smuio v14_0_2 ip block support
      drm/amdgpu: Add smuio callback to get gpu clk counter
      drm/amdgpu: Enable smuio v14_0_2 callbacks
      drm/amdgpu: Bypass asd if display hw is not available

Hersen Wu (2):
      drm/amd/display: Add timing pixel encoding for mst mode validation
      drm/amd/display: FEC overhead should be checked once for mst slot nums

Jack Xiao (1):
      drm/amdgpu/sdma6: set sdma hang watchdog

Johannes Weiner (1):
      drm/amdgpu: fix deadlock while reading mqd from debugfs

Jonathan Kim (1):
      drm/amdkfd: range check cp bad op exception interrupts

Joshua Aberback (3):
      drm/amd/display: handle invalid connector indices
      drm/amd/display: remove context->dml2 dependency from DML21 wrapper
      drm/amd/display: Add handling for DC power mode

Kenneth Feng (1):
      drm/amd/pm: fix the high voltage issue after unload

Lang Yu (3):
      drm/amdgpu/umsch: update UMSCH 4.0 FW interface
      drm/amdgpu: enable UMSCH 4.0.6
      drm/amdgpu/umsch: reinitialize write pointer in hw init

Leo (Hanghong) Ma (1):
      drm/amd/display: Add OTG check for set AV mute

Leon Huang (1):
      drm/amd/display: Expand supported Replay residency mode

Lewis Huang (1):
      drm/amd/display: Add option to configure mapping policy for edp0 on dp1

Li Ma (1):
      drm/amd/display: add DCN 351 version for microcode load

Lijo Lazar (9):
      drm/amdgpu: Do a basic health check before reset
      drm/amdgpu: Refine IB schedule error logging
      drm/amdgpu: Reset dGPU if suspend got aborted
      drm/amdgpu: Fix VCN allocation in CPX partition
      drm/amdgpu: Set fatal errror detected flag earlier
      drm/amd/pm: Add PMFW message and capability flags
      drm/amd/pm: Add special handling for RAS messages
      drm/amd/pm: Categorize RAS messages on SMUv13.0.6
      drm/amd/pm: Allow setting soft max frequency in VF

Likun Gao (1):
      drm/amdgpu: add support for atom fw version v3_5

Lin.Cao (1):
      drm/amd/pm set pp_dpm_*clk as read only for SRIOV one VF mode

Luqmaan Irshad (1):
      drm/amd/amdgpu: Update PF2VF Header

Ma Jun (5):
      drm/amdgpu: Add a new runtime mode definition
      drm/amdgpu/pm: Change the member function name in pp_hwmgr_func and pptable_funcs
      drm/amdgpu/pm: Add support for MACO flag checking
      drm/amdgpu: Add support for BAMACO mode checking
      drm/amdgpu/pm: Check AMDGPU_RUNPM_BAMACO when setting baco state

Mario Limonciello (1):
      drm/amd: Flush GFXOFF requests in prepare stage

Martin Leung (1):
      drm/amd/display: revert Exit idle optimizations before HDCP execution

Mounika Adhuri (1):
      drm/amd/display: Fix compiler redefinition warnings for certain configs

Muhammad Ahmed (3):
      drm/amd/display: Add debug key to allow disabling dtbclk
      drm/amd/display: Set the power_down_on_boot function pointer to null
      drm/amd/display: Skip pipe if the pipe idx not set properly

Mukul Joshi (4):
      drm/amdkfd: Rename read_doorbell_id in MQD functions
      drm/amdkfd: Check preemption status on all XCDs
      drm/amdkfd: Check cgroup when returning DMABuf info
      drm/amdkfd: Cleanup workqueue during module unload

Natanel Roizenman (3):
      drm/amd/display: Added debug prints for zstate_support and StutterPeriod
      drm/amd/display: Increase Z8 watermark times.
      drm/amd/display: Consolidate HPO enable/disable and restrict only to state transitions.

Nicholas Kazlauskas (12):
      drm/amd/display: Exit idle optimizations before HDCP execution
      drm/amd/display: Add debug prints for IPS testing
      drm/amd/display: Add guards for idle on reg read/write
      drm/amd/display: Guard cursor idle reallow by DC debug option
      drm/amd/display: Add debug counters to IPS exit prints
      drm/amd/display: Add debug option for idle reg checks
      drm/amd/display: Workaround register access in idle race with cursor
      drm/amd/display: Detect and disallow idle reallow during reentrancy
      drm/amd/display: Add optional optimization for IPS handshake
      drm/amd/display: Enable reallow for idle on DCN35
      drm/amd/display: Add new IPS config mode
      drm/amd/display: Disable Z8 minimum stutter period check for DCN35

Nicholas Susanto (1):
      drm/amd/display: Enabling urgent latency adjustment for DCN35

Ovidiu Bunea (1):
      drm/amd/display: Revert "Set the power_down_on_boot function pointer to null"

Parandhaman K (1):
      drm/amd/display: refactor vpg.h

Peyton Lee (1):
      drm/amdgpu/vpe: power on vpe when hw_init

Qili Lu (1):
      Revert "drm/amd/display: Enabling urgent latency adjustment for DCN35"

Revalla Hari Krishna (1):
      drm/amd/display: Refactor DPP into a component directory

Robin Chen (1):
      drm/amd/display: Support long vblank feature

Rodrigo Siqueira (36):
      drm/amd/display: Add comments to v_total calculation and drop legacy TODO
      drm/amd/display: Remove code duplication
      drm/amd/display: Remove wrong signal from vrr calculation
      drm/amd/display: Enable 2to1 ODM policy for DCN35
      drm/amd/display: Add the MALL size in the fallback function
      drm/amd/display: Move define to the proper header
      drm/amd/display: Enable fast update for DCN314
      drm/amd/display: Remove legacy code
      drm/amd/display: Comments adjustments
      drm/amd/display: Add missing registers and offset
      drm/amd/display: Initialize DP ref clk with the correct clock
      drm/amd/display: Set alpha enable to 0 for some specific formats
      drm/amd/display: Enable cur_rom_en even if cursor degamma is not enabled
      drm/amd/display: Add some missing debug registers
      drm/amd/display: Update DSC compute parameter calculation
      drm/amd/display: Drop legacy code
      drm/amd/display: Add missing registers
      drm/amd/display: Remove redundant RESERVE0 and RESERVE1
      drm/amd/display: Add missing SFB and OPP_SF
      drm/amd/display: Initialize debug variable data
      drm/amd/display: Add WBSCL ram coefficient for writeback
      drm/amd/display: Add code comments clock and encode code
      drm/amd/display: Includes adjustments
      drm/amd/display: Add color logs for dcn20
      drm/amd/display: Enable FGCG for DCN351
      drm/amd/display: Add V_TOTAL_REGS to dcn10
      drm/amd/display: Add comments to improve the code readability
      drm/amd/display: Adjust some includes used by display
      drm/amd/display: Drop legacy code
      drm/amd/display: Update resource capabilities and debug struct for DCN201
      drm/amd/display: Disable P010 Support of DCN 1.0
      drm/amd/display: Update DCN10 resource
      drm/amd/display: Add fallback configuration when set DRR
      drm/amd/display: Add fallback configuration for set DRR in DCN10
      drm/amd/display: Change DPCD address range
      drm/amd/display: Reorganize dwb header

Roman Li (3):
      drm/amd/display: Fix function banner for amdgpu_dm_psr_disable_all()
      drm/amd/display: Fix bounds check for dcn35 DcfClocks
      drm/amd/display: Allow RCG for Static Screen + LVP for DCN35

Samson Tam (2):
      drm/amd/display: clear mpc_tree in init_pipes
      drm/amd/display: fix underflow in some two display subvp/non-subvp configs

Shashank Sharma (3):
      drm/amdgpu: cleanup unused variable
      drm/amdgpu: sync page table freeing with tlb flush
      drm/amdgpu: Add a NULL check for freeing root PT

Sherry Wang (1):
      drm/amd/display: correct hostvm flag

Simon Horman (1):
      Documentation/gpu: correct path of reference

Sohaib Nadeem (1):
      drm/amd/display: Added missing null checks

Sridevi Arvindekar (1):
      drm/amd/display: Increase number of hpo dp link encoders

Srinivasan Shanmugam (11):
      drm/amd/display: Fix potential index out of bounds in color transformation function
      drm/amdgpu: Fix truncation issues in smu_v13_0_init_microcode
      drm/amd/display: Address kdoc for commit_minimal_transition_state_in_dc_update()
      drm/amd/display: Remove redundant condition in dcn35_calc_blocks_to_gate()
      drm/amdgpu: Fix format character cut-off issues in amdgpu_vcn_early_init()
      drm/amdgpu: Fix 'fw_name' buffer size to prevent truncations in amdgpu_mes_init_microcode
      drm/amdgpu: Fix truncation in gfx_v10_0_init_microcode
      drm/amdgpu: Fix truncation issues in gfx_v9_0.c
      drm/amdgpu: Fix truncation in smu_v11_0_init_microcode
      drm/amdgpu: Fix truncations in gfx_v11_0_init_microcode()
      drm/amd/display: Add missing parameter desc in dc_commit_streams

Sung Joon Kim (6):
      drm/amd/display: Enable new interface design for alternate scrambling
      drm/amd/display: Update dcn351 to latest dcn35 config
      drm/amd/display: Remove read/write to external register
      drm/amd/display: Increase clock table size
      drm/amd/display: Enable DTBCLK DTO earlier in the sequence
      drm/amd/display: Modify power sequence

Sunil Khatri (7):
      drm/amdgpu: add recent pagefault info in vm_manager
      drm/amdgpu: add vm fault information to devcoredump
      drm/amdgpu: add ring buffer information in devcoredump
      drm/amdgpu: add the hw_ip version of all IP's
      drm/amdgpu: remove the adev check for NULL
      drm/amdgpu: refactor code to split devcoredump code
      drm/amdgpu: add IP's FW information to devcoredump

Taimur Hassan (1):
      drm/amd/display: Send DTBCLK disable message on first commit

Tao Zhou (13):
      drm/amdgpu: add new bit definitions for GC 9.0 PROTECTION_FAULT_STATUS
      drm/amdgpu: add utcl2 poison query for gfxhub
      drm/amdgpu: retire gfx ras query_utcl2_poison_status
      drm/amdgpu: skip GFX FED error in page fault handling
      drm/amdgpu: add utcl2 RAS poison query for mmhub
      drm/amdgpu: support utcl2 RAS poison query for mmhub
      drm/amdgpu: make reset method configurable for RAS poison
      drm/amdgpu: add socket id parameter for psp query address cmd
      drm/amdgpu: simplify convert_error_address interface for UMC v12
      drm/amdgpu: implement IRQ_STATE_ENABLE for SDMA v4.4.2
      drm/amd/pm: update XGMI RAS UE criteria for sum v13.0.6
      drm/amdgpu: update check condition for XGMI ACA UE
      drm/amdgpu: retire UMC v12 mca_addr_to_pa

Tim Huang (2):
      drm/amd/pm: fixes a random hang in S4 for SMU v13.0.4/11
      drm/amdgpu: fix incorrect number of active RBs for gfx11

Victor Skvortsov (1):
      drm/amdgpu: Skip virt_exchange_init on SDMA poison consumption

Wenjing Liu (11):
      drm/amd/display: Implement update_planes_and_stream_v3 sequence
      drm/amd/display: skip forcing odm in minimal transition
      drm/amd/display: fix a bug to dereference already freed old current state memory
      drm/amd/display: fix a dereference of a NULL pointer
      drm/amd/display: fix nonseamless transition from ODM + MPO to ODM + subvp
      drm/amd/display: build scaling params when a new plane is appended
      drm/amd/display: optimize dml2 pipe resource allocation order
      drm/amd/display: update pipe topology log to support subvp
      drm/amd/display: move build test pattern params as part of pipe resource update for odm
      drm/amd/display: always reset ODM mode in context when adding first plane
      drm/amd/display: fix an incorrect ODM policy assigned for subvp

Xi (Alex) Liu (1):
      drm/amd/display: add root clock control function pointer to fix display corruption

Xi Liu (3):
      drm/amd/display: increase bb clock for DCN351
      drm/amd/display: Remove unnecessary hard coded DPM states
      drm/amd/display: Set DCN351 BB and IP the same as DCN35

Xiang Yang (1):
      drm/amd/display: delete the redundant initialization in dcn3_51_soc

Xiaojian Du (7):
      drm/amdgpu: add the sensor value of VCN activity
      drm/amdgpu: add VCN sensor value for SMU 13.0.4
      drm/admgpu: add vclk and dclk sysfs node for some ASICs
      drm/amdgpu: add VCN sensor value for Vangogh
      drm/amdgpu: add VCN sensor value for yellow carp
      drm/amdgpu: add VCN sensor value for SMU 13.0.5
      drm/amdgpu: add VCN sensor value for SMU 14.0.0

Yang Wang (17):
      drm/amdgpu: add ras event id support
      drm/amdgpu: add new aca_smu_type support
      drm/amdgpu: add new api to save error count into aca cache
      drm/amdgpu: refine aca error cache for gfx v9.4.3
      drm/amdgpu: refine aca error cache for mmhub v1.8
      drm/amdgpu: refine aca error cache for xgmi v6.4.0
      drm/amdgpu: refine aca error cache for sdma v4.4.2
      drm/amdgpu: refine aca error cache for umc v12.0
      drm/amdgpu: retire unused aca_bank_report data structure
      drm/amdgpu: add aca deferred error type support
      drm/amdgpu: add umc v12.0.0 deferred error support
      drm/amdgpu: retrieve umc odecc error count for aca umc v12.0
      drm/amdgpu: avoid update aca bank multi times during ras isr
      drm/amdgpu: add ras event id support for ACA
      drm/amdgpu: make amdgpu device attr_update() function more efficient
      drm/amdgpu: refine function signature of amdgpu_aca_get_error_data()
      drm/amd/pm: centralize all pp_dpm_xxx attribute nodes update cb

Yifan Zhang (2):
      drm/amdgpu: add smu 14.0.1 discovery support
      drm/amdgpu: differentiate external rev id for gfx 11.5.0

ZhenGuo Yin (2):
      drm/amdgpu: select HDP ref/mask according to gfx ring pipe
      drm/amdgpu: clear set_q_mode_offs when VM changed

Zhigang Luo (3):
      drm/amdgpu: trigger flr_work if reading pf2vf data failed
      amd/amdkfd: sync all devices to wait all processes being evicted
      amd/amdgpu: improve VF recover time

Zhongwei (1):
      drm/amd/display: Adjust dprefclk by down spread percentage.

chongli2 (1):
      drm/amd/amdgpu: support MES command SET_HW_RESOURCE1 in sriov

lima1002 (2):
      drm/amd/swsmu: add smu 14.0.1 vcn and jpeg msg
      drm/amd/swsmu: Update smu v14.0.0 headers to be 14.0.1 compatible

shaoyunl (2):
      drm/amdgpu : Add mes_log_enable to control mes log feature
      drm/amdgpu : Increase the mes log buffer size as per new MES FW version

 Documentation/gpu/amdgpu/debugging.rst             |   80 ++
 .../gpu/amdgpu/display/display-contributing.rst    |    2 +-
 Documentation/gpu/amdgpu/index.rst                 |    1 +
 drivers/gpu/drm/amd/amdgpu/Makefile                |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c            |  146 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.h            |   32 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |    5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c   |  345 ++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h   |   47 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   84 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfxhub.h         |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |    7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c            |   32 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h            |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |   22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |    7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.h          |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  269 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   30 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |  105 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |   16 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |   46 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_smuio.h          |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |    4 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |   16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c       |   12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.h       |   20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   41 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |    7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   73 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c         |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |   70 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c        |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c   |  112 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c            |    6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |   32 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h           |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |   13 +-
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |   15 +-
 drivers/gpu/drm/amd/amdgpu/cik.c                   |    4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |    6 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |    5 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |    6 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c            |   12 -
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |   48 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c           |   17 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c           |   15 +
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   10 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   50 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |   57 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |    2 +
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |    5 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |   56 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |    7 +
 drivers/gpu/drm/amd/amdgpu/si.c                    |    4 +-
 drivers/gpu/drm/amd/amdgpu/smuio_v14_0_2.c         |   62 ++
 drivers/gpu/drm/amd/amdgpu/smuio_v14_0_2.h         |   30 +
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   10 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |   32 +-
 drivers/gpu/drm/amd/amdgpu/ta_ras_if.h             |    1 +
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             |  209 ++--
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.h             |   62 +-
 drivers/gpu/drm/amd/amdgpu/umc_v8_10.c             |    6 -
 drivers/gpu/drm/amd/amdgpu/umsch_mm_v4_0.c         |    9 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |    8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |    4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   17 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |    4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v10.c   |   35 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c   |   12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |   42 +-
 drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c         |    2 +
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c       |   18 +
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h       |    4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c   |    6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c   |    6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |    6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |   25 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c    |    6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |    2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |    4 +-
 drivers/gpu/drm/amd/display/Makefile               |    1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   76 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    |   42 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   66 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.h    |    3 -
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |   10 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.h  |    2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_services.c |    8 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c   |    6 +-
 drivers/gpu/drm/amd/display/dc/Makefile            |    2 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  |    3 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |    2 -
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |   15 +-
 .../amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c    |    4 +-
 .../drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr.c |    1 -
 .../dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c       |    1 -
 .../amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c   |    2 +-
 .../amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c |   11 +
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |    5 +-
 .../amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c   |    2 +-
 .../dc/clk_mgr/dcn30/dcn30_clk_mgr_smu_msg.c       |    6 +-
 .../drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c |    3 +-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |    3 +-
 .../drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c   |    1 -
 .../drm/amd/display/dc/clk_mgr/dcn314/dcn314_smu.h |   42 +-
 .../drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c |    2 +-
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |   22 +-
 .../dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.c       |    9 +
 .../dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.h       |    3 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |   98 +-
 .../drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c   |   21 -
 .../drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.h   |    2 -
 drivers/gpu/drm/amd/display/dc/core/dc.c           | 1014 +++++++++++-------
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |   13 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  197 +++-
 drivers/gpu/drm/amd/display/dc/core/dc_stat.c      |    2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_state.c     |   71 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   20 +-
 drivers/gpu/drm/amd/display/dc/core/dc_surface.c   |   65 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |  211 ++--
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |  179 +++-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |    3 +
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |   18 +-
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |    1 +
 drivers/gpu/drm/amd/display/dc/dc_plane.h          |    2 +-
 drivers/gpu/drm/amd/display/dc/dc_plane_priv.h     |    1 +
 drivers/gpu/drm/amd/display/dc/dc_state.h          |    8 +-
 drivers/gpu/drm/amd/display/dc/dc_state_priv.h     |   12 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |   10 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   18 +-
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |    8 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.h |    1 +
 drivers/gpu/drm/amd/display/dc/dce/dce_opp.h       |    1 +
 drivers/gpu/drm/amd/display/dc/dce/dce_transform.c |    2 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c  |    4 -
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c   |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn10/Makefile      |    4 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c |    7 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.c    |   10 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.h    |   10 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h  |    1 +
 .../display/dc/dcn10/dcn10_hw_sequencer_debug.c    |    2 +-
 .../drm/amd/display/dc/dcn10/dcn10_link_encoder.c  |    1 -
 drivers/gpu/drm/amd/display/dc/dcn20/Makefile      |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dwb.c   |   11 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.c    |    2 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.h    |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |    6 +
 drivers/gpu/drm/amd/display/dc/dcn201/Makefile     |    2 +-
 .../gpu/drm/amd/display/dc/dcn201/dcn201_hubbub.c  |    4 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_hubbub.c    |    8 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_hubbub.h    |    8 +-
 drivers/gpu/drm/amd/display/dc/dcn30/Makefile      |    2 -
 .../gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c |    2 +-
 .../amd/display/dc/dcn30/dcn30_dio_link_encoder.c  |    2 -
 .../display/dc/dcn30/dcn30_dio_stream_encoder.c    |    2 -
 .../gpu/drm/amd/display/dc/dcn30/dcn30_hubbub.c    |    2 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_hubbub.h    |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c  |    3 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c   |   54 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.h   |   14 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_vpg.h   |   23 +-
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  |    2 +-
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.h  |    2 +
 .../display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c |    4 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.c    |    8 +-
 .../drm/amd/display/dc/dcn31/dcn31_panel_cntl.c    |    9 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_vpg.c   |    7 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_vpg.h   |    1 +
 drivers/gpu/drm/amd/display/dc/dcn32/Makefile      |    2 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c    |   10 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.h    |    8 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c   |    5 +-
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |   25 +-
 drivers/gpu/drm/amd/display/dc/dcn35/Makefile      |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dccg.c  |  207 +++-
 .../amd/display/dc/dcn35/dcn35_dio_link_encoder.c  |    3 +-
 .../display/dc/dcn35/dcn35_dio_stream_encoder.h    |    1 -
 .../gpu/drm/amd/display/dc/dcn35/dcn35_hubbub.c    |    4 +-
 drivers/gpu/drm/amd/display/dc/dm_services.h       |   10 +
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |    7 +-
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |    1 -
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c   |   10 +-
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h   |    1 +
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |    1 -
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c |    2 +-
 .../display/dc/dml/dcn314/display_mode_vba_314.c   |    1 -
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |  267 ++---
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |   14 +-
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |   12 +-
 .../gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c |  104 +-
 drivers/gpu/drm/amd/display/dc/dml2/Makefile       |    1 +
 .../drm/amd/display/dc/dml2/display_mode_core.c    |   15 +-
 .../drm/amd/display/dc/dml2/display_mode_core.h    |    1 +
 .../amd/display/dc/dml2/display_mode_lib_defines.h |    2 +
 .../amd/display/dc/dml2/dml2_dc_resource_mgmt.c    |  155 ++-
 .../amd/display/dc/dml2/dml2_dc_resource_mgmt.h    |    2 +
 .../drm/amd/display/dc/dml2/dml2_internal_types.h  |   11 +
 .../amd/display/dc/dml2/dml2_translation_helper.c  |   68 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c   |   78 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.h   |    5 +
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |   16 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h |   34 +-
 drivers/gpu/drm/amd/display/dc/dpp/Makefile        |   77 ++
 .../drm/amd/display/dc/dpp/dcn10/CMakeLists.txt    |    6 +
 .../drm/amd/display/dc/{ => dpp}/dcn10/dcn10_dpp.c |    2 +-
 .../drm/amd/display/dc/{ => dpp}/dcn10/dcn10_dpp.h |    3 +-
 .../amd/display/dc/{ => dpp}/dcn10/dcn10_dpp_cm.c  |    4 +-
 .../display/dc/{ => dpp}/dcn10/dcn10_dpp_dscl.c    |    2 +-
 .../drm/amd/display/dc/dpp/dcn20/CMakeLists.txt    |    5 +
 .../drm/amd/display/dc/{ => dpp}/dcn20/dcn20_dpp.c |    2 +-
 .../drm/amd/display/dc/{ => dpp}/dcn20/dcn20_dpp.h |    2 +-
 .../amd/display/dc/{ => dpp}/dcn20/dcn20_dpp_cm.c  |   12 +-
 .../drm/amd/display/dc/dpp/dcn201/CMakeLists.txt   |    4 +
 .../amd/display/dc/{ => dpp}/dcn201/dcn201_dpp.c   |    2 +-
 .../amd/display/dc/{ => dpp}/dcn201/dcn201_dpp.h   |    0
 .../drm/amd/display/dc/dpp/dcn30/CMakeLists.txt    |    5 +
 .../drm/amd/display/dc/{ => dpp}/dcn30/dcn30_dpp.c |   22 +-
 .../drm/amd/display/dc/{ => dpp}/dcn30/dcn30_dpp.h |    4 +
 .../amd/display/dc/{ => dpp}/dcn30/dcn30_dpp_cm.c  |    4 +-
 .../drm/amd/display/dc/dpp/dcn32/CMakeLists.txt    |    4 +
 .../drm/amd/display/dc/{ => dpp}/dcn32/dcn32_dpp.c |    2 +-
 .../drm/amd/display/dc/{ => dpp}/dcn32/dcn32_dpp.h |    0
 .../drm/amd/display/dc/dpp/dcn35/CMakeLists.txt    |    4 +
 .../gpu/drm/amd/display/dc/dpp/dcn35/dcn35_dpp.c   |  112 ++
 .../drm/amd/display/dc/{ => dpp}/dcn35/dcn35_dpp.h |    9 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |    8 +-
 drivers/gpu/drm/amd/display/dc/dsc/rc_calc_dpi.c   |    7 +-
 .../amd/display/dc/gpio/dcn21/hw_translate_dcn21.c |   13 -
 drivers/gpu/drm/amd/display/dc/hwss/Makefile       |    2 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |   53 +-
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |   40 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |  116 +-
 .../gpu/drm/amd/display/dc/hwss/dcn20/dcn20_init.c |    1 +
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |   72 +-
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.h    |    5 +-
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    |    2 +-
 .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c  |   41 -
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |  126 +--
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |  148 +--
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.h    |    8 +-
 .../gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c |    4 +-
 .../gpu/drm/amd/display/dc/hwss/dcn351/Makefile    |   25 +-
 .../drm/amd/display/dc/hwss/dcn351/dcn351_hwseq.c  |  182 ++++
 .../dcn35_dpp.c => hwss/dcn351/dcn351_hwseq.h}     |   38 +-
 .../drm/amd/display/dc/hwss/dcn351/dcn351_init.c   |   14 +-
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |   13 +-
 .../drm/amd/display/dc/hwss/hw_sequencer_private.h |    4 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   30 +-
 drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h     |    2 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |    2 -
 .../drm/amd/display/dc/inc/hw/clk_mgr_internal.h   |    2 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |    5 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |    2 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h        |    2 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dwb.h        |   30 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h  |    3 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/mem_input.h  |   12 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/optc.h       |    2 +
 .../gpu/drm/amd/display/dc/inc/hw/stream_encoder.h |    4 -
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |    7 +
 drivers/gpu/drm/amd/display/dc/inc/hw/vpg.h        |   53 +
 drivers/gpu/drm/amd/display/dc/inc/link.h          |    2 +-
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |   24 +-
 .../amd/display/dc/link/accessories/link_dp_cts.c  |    2 +-
 .../display/dc/link/accessories/link_dp_trace.c    |    1 -
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |    8 +-
 .../display/dc/link/protocols/link_dp_dpia_bw.c    |    4 +-
 .../display/dc/link/protocols/link_dp_training.c   |   16 +-
 .../dc/link/protocols/link_dp_training_dpia.c      |    4 +-
 .../drm/amd/display/dc/link/protocols/link_dpcd.c  |    2 +-
 .../dc/link/protocols/link_edp_panel_control.c     |   71 +-
 .../dc/link/protocols/link_edp_panel_control.h     |    4 +-
 .../gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c |   18 +-
 .../gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.h |    9 +-
 .../gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c |   10 -
 .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c |   14 +-
 .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c |  165 ++-
 .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.h |    6 +-
 drivers/gpu/drm/amd/display/dc/resource/Makefile   |    6 -
 .../display/dc/resource/dce112/dce112_resource.c   |    2 -
 .../display/dc/resource/dce120/dce120_resource.c   |    2 +-
 .../amd/display/dc/resource/dce80/dce80_resource.c |    1 -
 .../amd/display/dc/resource/dcn10/dcn10_resource.c |    4 +-
 .../amd/display/dc/resource/dcn20/dcn20_resource.c |    7 +-
 .../display/dc/resource/dcn201/dcn201_resource.c   |    6 +-
 .../amd/display/dc/resource/dcn21/dcn21_resource.c |   33 +-
 .../amd/display/dc/resource/dcn30/dcn30_resource.c |    2 +-
 .../amd/display/dc/resource/dcn31/dcn31_resource.c |    7 +-
 .../display/dc/resource/dcn314/dcn314_resource.c   |   21 +-
 .../display/dc/resource/dcn316/dcn316_resource.c   |    3 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |  116 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.h |    6 +-
 .../display/dc/resource/dcn321/dcn321_resource.c   |   41 +-
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |   22 +-
 .../amd/display/dc/resource/dcn35/dcn35_resource.h |    2 +
 .../display/dc/resource/dcn351/dcn351_resource.c   |   30 +-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |   17 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  168 ++-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.c  |    1 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |    1 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.c  |    2 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c  |    1 +
 .../gpu/drm/amd/display/include/grph_object_id.h   |    4 +-
 .../drm/amd/display/include/link_service_types.h   |    1 -
 drivers/gpu/drm/amd/display/include/logger_types.h |    1 +
 drivers/gpu/drm/amd/display/include/signal_types.h |   13 +
 .../drm/amd/display/modules/color/color_gamma.c    |    2 +-
 .../drm/amd/display/modules/freesync/freesync.c    |    8 +-
 .../drm/amd/display/modules/hdcp/hdcp2_execution.c |    2 +-
 .../amd/display/modules/info_packet/info_packet.c  |   15 +-
 .../amd/include/asic_reg/dcn/dcn_3_0_0_offset.h    |   24 +
 .../amd/include/asic_reg/dcn/dcn_3_0_0_sh_mask.h   |    9 +
 .../amd/include/asic_reg/dcn/dcn_3_0_2_offset.h    |   20 +
 .../amd/include/asic_reg/dcn/dcn_3_0_2_sh_mask.h   |    8 +
 .../amd/include/asic_reg/dcn/dcn_3_0_3_offset.h    |   28 +
 .../amd/include/asic_reg/dcn/dcn_3_0_3_sh_mask.h   |   18 +
 .../amd/include/asic_reg/dcn/dcn_3_1_2_offset.h    |    4 +
 .../amd/include/asic_reg/dcn/dcn_3_1_2_sh_mask.h   |   19 +
 .../amd/include/asic_reg/dcn/dcn_3_2_0_offset.h    |   60 ++
 .../amd/include/asic_reg/dcn/dcn_3_2_0_sh_mask.h   |   27 +
 .../amd/include/asic_reg/dcn/dcn_3_2_1_offset.h    |   37 +-
 .../amd/include/asic_reg/dcn/dcn_3_2_1_sh_mask.h   |   16 +
 .../amd/include/asic_reg/dpcs/dpcs_3_0_3_sh_mask.h |    4 +-
 .../amd/include/asic_reg/dpcs/dpcs_4_2_0_offset.h  |   10 +
 .../drm/amd/include/asic_reg/gc/gc_9_0_sh_mask.h   |    4 +
 .../include/asic_reg/smuio/smuio_14_0_2_offset.h   |  511 +++++++++
 .../include/asic_reg/smuio/smuio_14_0_2_sh_mask.h  | 1106 ++++++++++++++++++++
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |    3 +-
 drivers/gpu/drm/amd/include/mes_v11_api_def.h      |   21 +
 drivers/gpu/drm/amd/include/umsch_mm_4_0_api_def.h |   13 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |    8 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  224 ++--
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |    6 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_pm.h             |   41 +
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |    6 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_baco.c |    6 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_baco.h |    2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |    2 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu9_baco.c |    8 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu9_baco.h |    2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |    2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c  |    2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.c   |    8 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.h   |    2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c  |    2 +-
 drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h       |    2 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   34 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   14 +-
 .../pm/swsmu/inc/pmfw_if/smu14_driver_if_v14_0_0.h |   33 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_pmfw.h    |    6 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v14_0_0_pmfw.h    |   55 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v14_0_0_ppsmc.h   |   46 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |   17 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h       |    2 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |    2 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v14_0.h       |    3 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |    2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |    2 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |    2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |   18 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |    8 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |   22 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   21 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   10 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   |   20 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c   |    8 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   78 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |    2 +-
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |    8 +-
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |   68 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   |  374 ++++++-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   67 +-
 drivers/gpu/drm/radeon/radeon.h                    |    1 -
 drivers/gpu/drm/radeon/radeon_display.c            |    8 +-
 include/uapi/linux/kfd_ioctl.h                     |   17 +-
 389 files changed, 8890 insertions(+), 3028 deletions(-)
 create mode 100644 Documentation/gpu/amdgpu/debugging.rst
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/smuio_v14_0_2.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/smuio_v14_0_2.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dpp/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/dpp/dcn10/CMakeLists.txt
 rename drivers/gpu/drm/amd/display/dc/{ => dpp}/dcn10/dcn10_dpp.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => dpp}/dcn10/dcn10_dpp.h (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => dpp}/dcn10/dcn10_dpp_cm.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => dpp}/dcn10/dcn10_dpp_dscl.c (99%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dpp/dcn20/CMakeLists.txt
 rename drivers/gpu/drm/amd/display/dc/{ => dpp}/dcn20/dcn20_dpp.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => dpp}/dcn20/dcn20_dpp.h (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => dpp}/dcn20/dcn20_dpp_cm.c (99%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dpp/dcn201/CMakeLists.txt
 rename drivers/gpu/drm/amd/display/dc/{ => dpp}/dcn201/dcn201_dpp.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => dpp}/dcn201/dcn201_dpp.h (100%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dpp/dcn30/CMakeLists.txt
 rename drivers/gpu/drm/amd/display/dc/{ => dpp}/dcn30/dcn30_dpp.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => dpp}/dcn30/dcn30_dpp.h (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => dpp}/dcn30/dcn30_dpp_cm.c (99%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dpp/dcn32/CMakeLists.txt
 rename drivers/gpu/drm/amd/display/dc/{ => dpp}/dcn32/dcn32_dpp.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => dpp}/dcn32/dcn32_dpp.h (100%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dpp/dcn35/CMakeLists.txt
 create mode 100644 drivers/gpu/drm/amd/display/dc/dpp/dcn35/dcn35_dpp.c
 rename drivers/gpu/drm/amd/display/dc/{ => dpp}/dcn35/dcn35_dpp.h (87%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/hwss/dcn351/dcn351_hwseq.c
 rename drivers/gpu/drm/amd/display/dc/{dcn35/dcn35_dpp.c => hwss/dcn351/dcn351_hwseq.h} (56%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/inc/hw/vpg.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/smuio/smuio_14_0_2_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/smuio/smuio_14_0_2_sh_mask.h
