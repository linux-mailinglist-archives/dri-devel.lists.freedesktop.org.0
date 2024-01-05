Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96341825C52
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 23:05:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5043C10E6B6;
	Fri,  5 Jan 2024 22:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432D910E6B2;
 Fri,  5 Jan 2024 22:05:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0Jm5OUMuoCPOtrraI6hRqAocLjsQ3O5x80FmK35qM+d5hW/kP66z/Eyf57iqxmm1u1chdeTVSmx79RUpvaU2syYypQAjSbUxGuPp6xsecdeHC9raVHKAT4STYwJAIIKRLrFA9MArpVd1t36yJRRvddR9ppl1KdIsxSsUUcW3qnwl2RyA59LFVszU9DsJbgsZDhGp34SpiZI/NbCZQSHOKtTbxUhElaahrEgSTzQeeCYB8PwLjg8WCyeNJzAIt25POcqqxEqDEshMXx31CBYQtTxZMLsv6GE8TCVA5N02SsyGyGwUYHFaXMGXB+zolmw47ZfAQnSvknqY/kbOiaLJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKEQZ+D/erUuosN3+ftHY6iLw/Un5J1xeeguAigUPlk=;
 b=XKoLL92VLVpheNfP82oPj3/oesR0KwC44HywKZ22+OkO0ooyWtol3/1HMbAm8h6rkHghwUQnEvQEmfpR7OHLPorJ+oZkXjJpc/hTk38hcEQR3fiInt9aWrOrgn+OeypDx79R2Dibly9dIlp5IZ3T9sqLYXP5unslQejoiiLaWZMIhQM6AG3on7fCqsDELet1JpR8XR0NGNJ68wKW44YOKQFEcAUtJ8B1+KUKSKrdOHG/7/C4qMIaCGtk1neEqsF+nrl34nJg6tUpjqfEi/BJUAhHiTucRKWNeugFqSXKhD7CSocVE+8oUGzmUHG7uQF7NzX6WcntwctoII2tDg097Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKEQZ+D/erUuosN3+ftHY6iLw/Un5J1xeeguAigUPlk=;
 b=cyJ2W4EO29siOxI1EI2AiN1t82LhZB4SpnmTZlfLqo4eubbl8QUYUCMVn/GhYvOXzZlJ+ksCqmXss1JxBZU3pzxdGlgpWc2gSgpebiSSdQJP44rjCOm/s6lYVNlBa8FGRamjCZTOtquMXyjZEpduCDTvUt4dpw6lYdnhvNwq9Vo=
Received: from DM6PR01CA0018.prod.exchangelabs.com (2603:10b6:5:296::23) by
 MN6PR12MB8543.namprd12.prod.outlook.com (2603:10b6:208:47b::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.16; Fri, 5 Jan 2024 22:05:48 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2603:10b6:5:296:cafe::fc) by DM6PR01CA0018.outlook.office365.com
 (2603:10b6:5:296::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16 via Frontend
 Transport; Fri, 5 Jan 2024 22:05:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Fri, 5 Jan 2024 22:05:48 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 5 Jan
 2024 16:05:45 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-next-6.8
Date: Fri, 5 Jan 2024 17:05:22 -0500
Message-ID: <20240105220522.4976-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|MN6PR12MB8543:EE_
X-MS-Office365-Filtering-Correlation-Id: ee65e04a-2c4e-40cf-dc0b-08dc0e3a793f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nbCP6ybjkVa0kBZaUMi+Zvxsh7Ja7laq0b+ZasgvRUllQCa5MlJxNpDYgQyr3B4D6P/bXuVlUIwb9cSHPxrkG5m0sHjqawhGPCRWqwVyk0LsIjKWfM/SyIBd3LxXtDB764qv6ZK8qE0AZt7G84xUDMOG8EZ9RGUCLLbXH6ZU7RuwQG9+uOgSARBJCZ17MOKqylY33l9VufOlc+orbsp7V9xWLM3afjfE6CO9g3zaALzcZ8i9uAdCW/ab+L6QIEIwYZ74tf7SvxnKWC5yiLLvcEzRbsv24jkXvZGgy09VtUN82ZQBAMW1iurqx71VsvZcgc0sK7QLBZQTEbWiuLjlBCoJbdiaFEowvKclMeJyP7MyU+Y+KtLDvV1JCBrxWfeWMBbe7EMN3Me4KISHDS2ZE17OrtYiYu24/agjhOB4vOp36MIklxnqz1CM8jJX1BWEQRxREwiHs7AZxLtIBwO7CfVGla6bpZtulu07XvlTBFtiNFYE8o9G0Sg8lPTUhMkUePdBvI2KVpPF9alquAtfgqtR7OwfYn25uBDWusGaTeEY6IAKbIo1k6pQtJq7MUDGGw8yMembcPAC1uRRz222fmLUCVjVaHWKUoiorAoK2YW5xeKivtqENjin6vzWSWVCQTzYguNIIQb4HZdW1AdkKW+aBuZOaoFLQlT5NvU6UMvhexWWkLw6R+u/xY3ARBB/FIMXOHbLEGmExHE5KeyAiEBEZ4wiuoNxwdPeGV1BxypRjvBlll5ZbzlUVSYw0v5B/Ia9AJX+VU6PmilYzHSktD2RzBQ/P0EAGaBH1Zd4bdM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(396003)(39860400002)(376002)(136003)(230273577357003)(230922051799003)(230173577357003)(1800799012)(82310400011)(186009)(451199024)(64100799003)(36840700001)(40470700004)(46966006)(16526019)(2616005)(426003)(26005)(6666004)(966005)(1076003)(336012)(19627235002)(7696005)(478600001)(36860700001)(83380400001)(2906002)(4001150100001)(30864003)(41300700001)(316002)(70206006)(110136005)(5660300002)(8936002)(8676002)(4326008)(70586007)(47076005)(82740400003)(81166007)(36756003)(86362001)(356005)(40460700003)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 22:05:48.3794 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee65e04a-2c4e-40cf-dc0b-08dc0e3a793f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8543
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

Hi Dave, Sima,

Few fixes for 6.8 from the last few weeks.

The following changes since commit 669080888691c312cc926322a7b24600121c90fb:

  drm/amd/display: Revert " drm/amd/display: Use channel_width = 2 for vram table 3.0" (2023-12-15 12:17:19 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.8-2024-01-05

for you to fetch changes up to 754d349ed41186e3aba50c3128937be335f9460a:

  drm/amd/display: Allow z8/z10 from driver (2024-01-05 16:10:44 -0500)

----------------------------------------------------------------
amd-drm-next-6.8-2024-01-05:

amdgpu:
- VRR fixes
- PSR-SU fixes
- SubVP fixes
- DCN 3.5 fixes
- Documentation updates
- DMCUB fixes
- DML2 fixes
- UMC 12.0 updates
- GPUVM fix
- Misc code cleanups and whitespace cleanups
- DP MST fix
- Let KFD sync with GPUVM fences
- GFX11 reset fix
- SMU 13.0.6 fixes
- VSC fix for DP/eDP
- Navi12 display fix
- RN/CZN system aperture fix
- DCN 2.1 bandwidth validation fix
- DCN INIT cleanup

amdkfd:
- SVM fixes
- Revert TBA/TMA location change

----------------------------------------------------------------
Alex Deucher (3):
      drm/amd/display: add nv12 bounding box
      drm/amdgpu: skip gpu_info fw loading on navi12
      drm/amdgpu: apply the RV2 system aperture fix to RN/CZN as well

Allen Pan (2):
      drm/amd/display: fix usb-c connector_type
      drm/amd/display: change static screen wait frame_count for ips

Alvin Lee (5):
      drm/amd/display: Only clear symclk otg flag for HDMI
      drm/amd/display: Fix subvp+drr logic errors
      drm/amd/display: Don't allow FPO if no planes
      drm/amd/display: Assign stream status for FPO + Vactive cases
      drm/amd/display: For FPO and SubVP/DRR configs program vmin/max sel

Anthony Koo (1):
      drm/amd/display: [FW Promotion] Release 0.0.197.0

Aric Cyr (2):
      drm/amd/display: Unify optimize_required flags and VRR adjustments
      drm/amd/display: 3.2.265

Arnd Bergmann (1):
      drm/amd/display: avoid stringop-overflow warnings for dp_decide_lane_settings()

Asad Kamal (5):
      drm/amd/pm: Use separate metric table for APU
      drm/amd/pm: Update metric table for jpeg/vcn data
      drm/amd/pm: Add gpu_metrics_v1_5
      drm/amd/pm: Use gpu_metrics_v1_5 for SMUv13.0.6
      drm/amd/pm: Add mem_busy_percent for GCv9.4.3 apu

Camille Cho (1):
      drm/amd/display: Correctly restore user_level

Charlene Liu (2):
      drm/amd/display: get dprefclk ss info from integration info table
      drm/amd/display: Allow z8/z10 from driver

Colin Ian King (1):
      drm/amd/display: remove redundant initialization of variable remainder

Dillon Varone (5):
      drm/amd/display: Refactor dc_state interface
      drm/amd/display: Refactor phantom resource allocation
      drm/amd/display: Fix null reference to state when getting subvp type
      drm/amd/display: Create dc_state after resource initialization
      drm/amd/display: Deep copy dml2_context when copying dc_state

Felix Kuehling (1):
      drm/amdgpu: Let KFD sync with VM fences

Gabe Teeger (1):
      drm/amd/display: Fix Mismatch between pipe and stream

George Shen (1):
      drm/amd/display: Set test_pattern_changed update flag on pipe enable

Hamza Mahfooz (1):
      drm/amd/display: disable FPO and SubVP for older DMUB versions on DCN32x

Harry Wentland (2):
      drm/amd/display: Fix recent checkpatch errors in amdgpu_dm
      drm/amd/display: Move fixpt_from_s3132 to amdgpu_dm

Hawking Zhang (1):
      Revert "drm/amdgpu: enable mca debug mode on APU by default"

Ilya Bakoulin (1):
      drm/amd/display: Fix hang/underflow when transitioning to ODM4:1

Ivan Lipski (1):
      Re-revert "drm/amd/display: Enable Replay for static screen use cases"

Jack Xiao (1):
      drm/amdgpu/gfx11: need acquire mutex before access CP_VMID_RESET v2

Johnson Chen (1):
      drm/amd/display: Add function for dumping clk registers

Joshua Ashton (1):
      drm/amd/display: Fix sending VSC (+ colorimetry) packets for DP/eDP displays without PSR

Josip Pavic (3):
      drm/amd/display: make flip_timestamp_in_us a 64-bit variable
      drm/amd/display: dereference variable before checking for zero
      drm/amd/display: Add null pointer guards where needed

Kaibo Ma (1):
      Revert "drm/amdkfd: Relocate TBA/TMA to opposite side of VM hole"

Le Ma (1):
      drm/amdgpu: add param to specify fw bo location for front-door loading

Leo (Hanghong) Ma (1):
      drm/amd/display: Add HDMI capacity computations using fixed31_32

Mangesh Gadre (1):
      drm/amdgpu: Add register read/write debugfs support for AID's

Marcelo Mendes Spessoto Junior (8):
      drm/amd/display: Removing duplicate copyright text
      drm/amd/display: Fix hdcp1_execution.c codestyle
      drm/amd/display: Fix hdcp_psp.c codestyle
      drm/amd/display: Fix freesync.c codestyle
      drm/amd/display: Fix hdcp_psp.h codestyle
      drm/amd/display: Fix hdcp2_execution.c codestyle
      drm/amd/display: Fix hdcp_log.h codestyle
      drm/amd/display: Fix power_helpers.c codestyle

Mario Limonciello (4):
      drm/amd/display: Add a new DC debug mask for PSR-SU
      Documentation/amdgpu: Add Hawk Point processors
      Documentation/amdgpu: Remove a spurious character
      drm/amd: Add missing definitions for `SMU_MAX_LEVELS_VDDGFX`

Meenakshikumar Somasundaram (2):
      drm/amd/display: Fix minor issues in BW Allocation Phase2
      drm/amd/display: Add dpia display mode validation logic

Melissa Wen (1):
      drm/amd/display: fix bandwidth validation failure on DCN 2.1

Michael Strauss (1):
      drm/amd/display: Fix lightup regression with DP2 single display configs

Muhammad Ahmed (1):
      drm/amd/display: add debug option for ExtendedVBlank DLG adjust

Nicholas Kazlauskas (7):
      drm/amd/display: Refactor DMCUB enter/exit idle interface
      drm/amd/display: Wake DMCUB before sending a command
      drm/amd/display: Wake DMCUB before executing GPINT commands
      drm/amd/display: Always exit DMCUB idle when called
      drm/amd/display: Wait forever for DMCUB to wake up
      drm/amd/display: Switch DMCUB notify idle command to NO_WAIT
      drm/amd/display: Verify disallow bits were cleared for idle

Relja Vojvodic (3):
      drm/amd/display: Add more mechanisms for tests
      drm/amd/display: Add log end specifier
      drm/amd/display: Fixing stream allocation regression

Revalla (1):
      drm/amd/display: Refactor INIT into component folder

Roman Li (2):
      drm/amd/display: Disable IPS by default
      drm/amd/display: enable dcn35 idle power optimization

Samson Tam (1):
      drm/amd/display: skip error logging when DMUB is inactive from S3

Srinivasan Shanmugam (14):
      drm/amdgpu: Cleanup indenting in amdgpu_connector_dvi_detect()
      drm/amdgpu: Use kzalloc instead of kmalloc+__GFP_ZERO in amdgpu_ras.c
      drm/amdgpu: Use kvcalloc instead of kvmalloc_array in amdgpu_cs_parser_bos()
      drm/amd/display: Address function parameter 'context' not described in 'dc_state_rem_all_planes_for_stream' & 'populate_subvp_cmd_drr_info'
      drm/amd/display: Adjust kdoc for 'dcn35_hw_block_power_down' & 'dcn35_hw_block_power_up'
      drm/amdgpu: Drop redundant unsigned >=0 comparision 'amdgpu_gfx_rlc_init_microcode()'
      drm/amdgpu: Fix possible NULL dereference in amdgpu_ras_query_error_status_helper()
      drm/amdkfd: Fix type of 'dbg_flags' in 'struct kfd_process'
      drm/amdgpu: Remove unreachable code in 'atom_skip_src_int()'
      drm/amdgpu: Fix variable 'mca_funcs' dereferenced before NULL check in 'amdgpu_mca_smu_get_mca_entry()'
      drm/amdgpu: Fix '*fw' from request_firmware() not released in 'amdgpu_ucode_request()'
      drm/amdkfd: Confirm list is non-empty before utilizing list_first_entry in kfd_topology.c
      drm/amdgpu: Drop 'fence' check in 'to_amdgpu_amdkfd_fence()'
      drm/amdkfd: Fix iterator used outside loop in 'kfd_add_peer_prop()'

Stanley.Yang (1):
      drm/amdgpu: Fix ecc irq enable/disable unpaired

Tom Chung (1):
      drm/amd/display: Add some functions for Panel Replay

Wayne Lin (2):
      drm/amd/display: Add case for dcn35 to support usb4 dmub hpd event
      drm/amd/display: pbn_div need be updated for hotplug event

Xiaogang Chen (1):
      drm/amdkfd: Use partial hmm page walk during buffer validation in SVM

YiPeng Chai (4):
      drm/amdgpu: MCA supports recording umc address information
      drm/amdgpu: Add poison mode check error condition for umc v12_0
      drm/amd/pm: smu v13_0_6 supports ecc info by default
      drm/amdgpu: Add umc page retirement for umc v12_0

ZhenGuo Yin (1):
      drm/amdgpu: re-create idle bo's PTE during VM state machine reset

Zhipeng Lu (1):
      drm/amd/pm/smu7: fix a memleak in smu7_hwmgr_backend_init

 Documentation/gpu/amdgpu/apu-asic-info-table.csv   |   5 +-
 drivers/gpu/drm/amd/amdgpu/aldebaran.c             |  26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c            |  21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  34 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |  13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.c            |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c           |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |   4 +-
 drivers/gpu/drm/amd/amdgpu/atom.c                  |   1 -
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  48 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c           |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c           |   4 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   4 +
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   5 +
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   4 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |   2 +-
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             |  80 +-
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.h             |   8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c       |  26 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |  35 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  79 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |  45 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 101 +--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   4 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    |  23 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |  11 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |  29 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |   3 +
 drivers/gpu/drm/amd/display/dc/Makefile            |   4 +-
 drivers/gpu/drm/amd/display/dc/basics/conversion.c |   3 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |  19 +-
 .../gpu/drm/amd/display/dc/bios/command_table2.c   |  12 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |   3 +-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |   2 +-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |   2 +-
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |   2 +-
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |   2 +-
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |  90 ++-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |   9 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           | 394 ++++------
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  | 187 +++--
 .../gpu/drm/amd/display/dc/core/dc_link_exports.c  |   9 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  | 435 ++---------
 drivers/gpu/drm/amd/display/dc/core/dc_state.c     | 865 +++++++++++++++++++++
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |  49 +-
 drivers/gpu/drm/amd/display/dc/core/dc_surface.c   |   6 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |  62 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       | 261 +++++--
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |  57 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |   6 +
 drivers/gpu/drm/amd/display/dc/dc_helper.c         |   6 +-
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |   2 +-
 drivers/gpu/drm/amd/display/dc/dc_plane.h          |  38 +
 drivers/gpu/drm/amd/display/dc/dc_plane_priv.h     |  34 +
 drivers/gpu/drm/amd/display/dc/dc_state.h          |  78 ++
 drivers/gpu/drm/amd/display/dc/dc_state_priv.h     | 102 +++
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |  76 +-
 drivers/gpu/drm/amd/display/dc/dc_stream_priv.h    |  37 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   7 +
 drivers/gpu/drm/amd/display/dc/dce/dce_abm.c       |   4 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c      |   4 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c  |  18 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.h  |   2 +-
 .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_outbox.c   |   2 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |  33 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c   |  96 ++-
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.h   |   2 +
 drivers/gpu/drm/amd/display/dc/dcn10/Makefile      |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/Makefile      |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn201/Makefile     |   3 +-
 drivers/gpu/drm/amd/display/dc/dcn21/Makefile      |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/Makefile      |   4 +-
 drivers/gpu/drm/amd/display/dc/dcn301/Makefile     |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn302/Makefile     |  12 -
 drivers/gpu/drm/amd/display/dc/dcn31/Makefile      |   2 +-
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  |   4 +-
 .../drm/amd/display/dc/dcn31/dcn31_panel_cntl.c    |   4 +-
 drivers/gpu/drm/amd/display/dc/dcn314/Makefile     |   3 +-
 drivers/gpu/drm/amd/display/dc/dcn32/Makefile      |   2 +-
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  | 126 +--
 drivers/gpu/drm/amd/display/dc/dcn35/Makefile      |   2 +-
 .../amd/display/dc/dcn35/dcn35_dio_link_encoder.c  |   5 +
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   | 115 ++-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   | 118 +--
 .../drm/amd/display/dc/dml2/display_mode_core.c    |   2 +-
 .../gpu/drm/amd/display/dc/dml2/dml2_dc_types.h    |   1 +
 .../drm/amd/display/dc/dml2/dml2_mall_phantom.c    |  89 +--
 .../amd/display/dc/dml2/dml2_translation_helper.c  |  26 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c   |  18 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |   4 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h |  35 +-
 drivers/gpu/drm/amd/display/dc/hwss/Makefile       |  28 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |  20 +-
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |  42 +-
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.h    |   7 +-
 .../amd/display/dc/{ => hwss}/dcn10/dcn10_init.c   |   0
 .../amd/display/dc/{ => hwss}/dcn10/dcn10_init.h   |   0
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    | 116 ++-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.h    |   2 +-
 .../amd/display/dc/{ => hwss}/dcn20/dcn20_init.c   |   0
 .../amd/display/dc/{ => hwss}/dcn20/dcn20_init.h   |   0
 .../drm/amd/display/dc/hwss/dcn201/dcn201_hwseq.c  |   8 +-
 .../drm/amd/display/dc/hwss/dcn201/dcn201_hwseq.h  |   2 +-
 .../amd/display/dc/{ => hwss}/dcn201/dcn201_init.c |   0
 .../amd/display/dc/{ => hwss}/dcn201/dcn201_init.h |   0
 .../drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c    |   4 +-
 .../amd/display/dc/{ => hwss}/dcn21/dcn21_init.c   |   0
 .../amd/display/dc/{ => hwss}/dcn21/dcn21_init.h   |   0
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |  19 +-
 .../amd/display/dc/{ => hwss}/dcn30/dcn30_init.c   |   0
 .../amd/display/dc/{ => hwss}/dcn30/dcn30_init.h   |   0
 .../amd/display/dc/{ => hwss}/dcn301/dcn301_init.c |   0
 .../amd/display/dc/{ => hwss}/dcn301/dcn301_init.h |   0
 .../amd/display/dc/{ => hwss}/dcn302/dcn302_init.c |   0
 .../amd/display/dc/{ => hwss}/dcn302/dcn302_init.h |   0
 .../amd/display/dc/{ => hwss}/dcn303/dcn303_init.c |   0
 .../amd/display/dc/{ => hwss}/dcn303/dcn303_init.h |   0
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    |  14 +-
 .../amd/display/dc/{ => hwss}/dcn31/dcn31_init.c   |   0
 .../amd/display/dc/{ => hwss}/dcn31/dcn31_init.h   |   0
 .../amd/display/dc/{ => hwss}/dcn314/dcn314_init.c |   0
 .../amd/display/dc/{ => hwss}/dcn314/dcn314_init.h |   0
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |  91 +--
 .../amd/display/dc/{ => hwss}/dcn32/dcn32_init.c   |   0
 .../amd/display/dc/{ => hwss}/dcn32/dcn32_init.h   |   0
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    | 133 +++-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.h    |   6 +-
 .../amd/display/dc/{ => hwss}/dcn35/dcn35_init.c   |   2 +-
 .../amd/display/dc/{ => hwss}/dcn35/dcn35_init.h   |   0
 .../drm/amd/display/dc/hwss/dcn351/CMakeLists.txt  |   4 +
 .../gpu/drm/amd/display/dc/hwss/dcn351/Makefile    |  17 +
 .../drm/amd/display/dc/hwss/dcn351/dcn351_init.c   | 171 ++++
 .../drm/amd/display/dc/hwss/dcn351/dcn351_init.h   |  33 +
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |  17 +-
 .../drm/amd/display/dc/hwss/hw_sequencer_private.h |   1 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |  31 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/abm.h        |   2 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |  19 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h  |   1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/panel_cntl.h |   1 +
 drivers/gpu/drm/amd/display/dc/inc/link.h          |   2 +
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |   7 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |   1 +
 .../gpu/drm/amd/display/dc/link/link_validation.h  |   1 +
 .../display/dc/link/protocols/link_dp_capability.c |   2 +-
 .../amd/display/dc/link/protocols/link_dp_dpia.c   |   3 +-
 .../display/dc/link/protocols/link_dp_dpia_bw.c    | 337 ++++----
 .../display/dc/link/protocols/link_dp_dpia_bw.h    |   4 +-
 .../display/dc/link/protocols/link_dp_training.c   |   2 +-
 .../display/dc/link/protocols/link_dp_training.h   |   2 +-
 .../dc/link/protocols/link_edp_panel_control.c     |  30 +
 .../dc/link/protocols/link_edp_panel_control.h     |   2 +
 .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c |   7 +
 .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c |   7 +
 .../amd/display/dc/resource/dcn32/dcn32_resource.c | 136 +---
 .../amd/display/dc/resource/dcn32/dcn32_resource.h |  19 +-
 .../display/dc/resource/dcn321/dcn321_resource.c   |  27 +-
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |  20 +-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |   1 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   2 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |   4 +-
 drivers/gpu/drm/amd/display/include/fixed31_32.h   |  12 -
 .../amd/display/include/grph_object_ctrl_defs.h    |   2 +
 .../drm/amd/display/modules/freesync/freesync.c    |   4 +-
 .../drm/amd/display/modules/hdcp/hdcp1_execution.c |   4 +-
 .../drm/amd/display/modules/hdcp/hdcp2_execution.c |   6 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_log.h    |  10 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.c    |   4 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.h    |  10 +-
 .../gpu/drm/amd/display/modules/inc/mod_freesync.h |  28 -
 .../amd/display/modules/info_packet/info_packet.c  |  13 +-
 .../drm/amd/display/modules/power/power_helpers.c  |  30 +-
 .../drm/amd/display/modules/power/power_helpers.h  |   5 +
 drivers/gpu/drm/amd/include/amd_shared.h           |   4 +-
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |  80 ++
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   4 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |   6 +-
 .../gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c    |   1 +
 .../drm/amd/pm/powerplay/smumgr/iceland_smumgr.c   |   1 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_pmfw.h    | 100 ++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   | 165 ++--
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   3 +
 198 files changed, 4093 insertions(+), 2111 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/core/dc_state.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dc_plane.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dc_plane_priv.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dc_state.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dc_state_priv.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dc_stream_priv.h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dcn302/Makefile
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn10/dcn10_init.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn10/dcn10_init.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn20/dcn20_init.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn20/dcn20_init.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn201/dcn201_init.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn201/dcn201_init.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn21/dcn21_init.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn21/dcn21_init.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn30/dcn30_init.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn30/dcn30_init.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn301/dcn301_init.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn301/dcn301_init.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn302/dcn302_init.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn302/dcn302_init.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn303/dcn303_init.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn303/dcn303_init.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn31/dcn31_init.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn31/dcn31_init.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn314/dcn314_init.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn314/dcn314_init.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn32/dcn32_init.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn32/dcn32_init.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn35/dcn35_init.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => hwss}/dcn35/dcn35_init.h (100%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/hwss/dcn351/CMakeLists.txt
 create mode 100644 drivers/gpu/drm/amd/display/dc/hwss/dcn351/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/hwss/dcn351/dcn351_init.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/hwss/dcn351/dcn351_init.h
