Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4636BEEB3
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 17:44:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D46B10E107;
	Fri, 17 Mar 2023 16:44:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD4110E107;
 Fri, 17 Mar 2023 16:44:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lc6B68ciuklZP5pLuu+WQzx4QEUtpRnJtDMbByd6SjhL6BnYsLK8ZkaJiuhjFhfmnIbmab49Govj+kH4C3EocKAgtoY70arRuhpwae+vI1ewqWcHLsmEnnx2gsyifVjOQB3wSiC8y7YTrLXHSXLcomP/xyX34nnwMd2Lc2IXx1hej+/3i+3LDq6RooXX+ewrWrV9yUIyocJv9Q7KhtT/Fu4HI+aNbsv5Igu4MnraA9ynOnqSblIm6zobNX7Y+8F3SEBXgiwoKxqg0bEwOXa9xubTxtOl215MSpOyv1IIBd4dgYGBzeaUA9fu2DYMmgfzpTlioAk+Kict2/XVIJXqhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sS6JLadLMgVD+UZRECIMXtvgCz58FQD0x/IgylGr3Gc=;
 b=VvQG87UxNbH1RiWQxdgwza1PUuwc8pzHyUWNlUH6Oy9xz/a4w45V2DHCjj1KBIQqN1PuvSPyjNsB0zDWVUjDjvrDZwrsyrUvhnxDD5InoZ6ERsW1iQbVMd2rPq1QYWG9JPJapKyyK3BuKuZTuzfVAmvOMVT/FltGWsAHmFntBAwu/fHRiOw9c0CFk+2lurPYILdEBaT/ff3vkSb8CSuqusBvbT4Wt4R1ui0ZYGNyCrDSLq6OGvtgogG6gatvhfBOYiWxBHoPX+JBSH5/S+68sGdHtLcaTjwK/Oflh4FWsBc4giyju5oT5sR+XJTWVPF0Ejzful7nJY+hrMH44io/+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sS6JLadLMgVD+UZRECIMXtvgCz58FQD0x/IgylGr3Gc=;
 b=C4DkiKZarIe0Waop/4dDVKmobSA/19tKoaBw5kW/A5RV8QlRMQBpp383F2QcbZA7BwL5yYutWJBdr9eQj+1rzTONoD4RySCic3tFvhT/EvzfYb7bp/xzWRCDOx1l6ovpqN5jKi8UoZkYuLCPPe0/JSbpkuedo8ODHcc4RJrl41U=
Received: from DM6PR18CA0012.namprd18.prod.outlook.com (2603:10b6:5:15b::25)
 by CY8PR12MB7706.namprd12.prod.outlook.com (2603:10b6:930:85::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Fri, 17 Mar
 2023 16:44:33 +0000
Received: from DM6NAM11FT097.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:15b:cafe::6c) by DM6PR18CA0012.outlook.office365.com
 (2603:10b6:5:15b::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35 via Frontend
 Transport; Fri, 17 Mar 2023 16:44:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT097.mail.protection.outlook.com (10.13.172.72) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6199.20 via Frontend Transport; Fri, 17 Mar 2023 16:44:32 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 17 Mar
 2023 11:44:30 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd, radeon, UAPI drm-next-6.4
Date: Fri, 17 Mar 2023 12:44:16 -0400
Message-ID: <20230317164416.138340-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT097:EE_|CY8PR12MB7706:EE_
X-MS-Office365-Filtering-Correlation-Id: a625521d-5631-4e08-6449-08db2706e29c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j0UiC34Jfk/RdrOsMJTrYlYZ0SQh0S+uTKrG3pE6frB6BjLEeJfsVRouKGXMS0lKn+FrL78o9lnkkzi9AicWD2b3usRl0vfKUje/Lh2c/0vR6KtyaPDlvLSswBpPliVPF1G8UxL7UglHPqfnBgD9YQ9yISmo5+WC96If+eny+hJWGHaQtV3AybtBk2/v+ZaP05qhKbIA4gwpjhvGiaMkVtzG2CatGvG/TjhSV5/y8IbBmoGWR33L8OnUNMbbMZ0Oz3Ub68iunD3v9SESUwKAJcHac8SNDheQJqsPQnQ63IgTLzsBu2jJSGe8ovzy8MQvFfjyeGRLP/DuEXPisxRsUJJkYWjryXmo5JBZxbuYRWUXQohMzFq4INbLfAivrZFsV5GPUPIbWf0uJmAkQjLfi98KmN3KqPwVvqZgjUsFsnLDW6ilP1jq02lq3k34NNngfVC+kKaEQNQ5Prw8e1zxuuMQ/Ip1g9dSZ2vul81SbG5n8tbpu87qd2r8DI5tnURByY1HR9O46LoGl6xQbWLxXTD/FaXBVbBL22kgHi0nTjON+VY3o8oT3QscHoO6XnIPRnn468XUvq6nPBpYXe2jGPiHmWg+Sr6S0ER96IQgVdVq0XOZe32TGtNW85eHLlu4utMzva6XyS0VCWMSYNZ+nj6fY72WnvvV6yMIlAP6AbKWHRa8HeT2furUMfpfsukHPkaX6WlE3aEV1Le5jKQZ2howr5ET7nEje8eobDHD/w0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(396003)(39860400002)(136003)(376002)(451199018)(36840700001)(46966006)(40470700004)(70586007)(2906002)(5660300002)(30864003)(41300700001)(8936002)(86362001)(36756003)(36860700001)(82740400003)(81166007)(26005)(7696005)(478600001)(6666004)(966005)(70206006)(8676002)(426003)(2616005)(40480700001)(4326008)(110136005)(40460700003)(336012)(82310400005)(316002)(66574015)(47076005)(83380400001)(356005)(16526019)(1076003)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 16:44:32.7463 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a625521d-5631-4e08-6449-08db2706e29c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT097.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7706
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

New stuff for 6.4.

The following changes since commit 424b3d7582a2a4a7c45d405225ac70cff97f2e4a:

  drm/amd/pm: downgrade log level upon SMU IF version mismatch (2023-02-23 17:35:59 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.4-2023-03-17

for you to fetch changes up to 7ee938ac006096fe9c3f1075f56b9263587c150f:

  drm/amdgpu: Don't resume IOMMU after incomplete init (2023-03-15 18:45:27 -0400)

----------------------------------------------------------------
amd-drm-next-6.4-2023-03-17:

amdgpu:
- Misc code cleanups
- Documentation fixes
- Make kobj structures const
- Add thermal throttling adjustments for supported APUs
- UMC RAS fixes
- Display reset fixes
- DCN 3.2 fixes
- Freesync fixes
- DC code reorg
- Generalize dmabuf import to work with KFD
- DC DML fixes
- SRIOV fixes
- UVD code cleanups
- IH 4.4.2 updates
- HDP 4.4.2 updates
- SDMA 4.4.2 updates
- PSP 13.0.6 updates
- Add capped/uncapped workload handling for supported APUs
- DCN 3.1.4 updates
- Re-org DC Kconfig
- USB4 fixes
- Reorg DC plane and stream handling
- Register vga_switcheroo for apple-gmux
- SMU 13.0.6 updates
- Fix error checking in read_mm_registers functions for affected families
- VCN 4.0.4 fix
- Drop redundant pci_enable_pcie_error_reporting() call
- RDNA2 SMU OD suspend/resume fix
- Expose additional memory stats via fdinfo
- RAS fixes
- Misc display fixes
- DP MST fixes
- IOMMU regression fix for KFD

amdkfd:
- Make kobj structures const
- Support for exporting buffers via dmabuf
- Multi-VMA page migration fixes
- NBIO fixes
- Misc code cleanups
- Fix possible double free
- Fix possible UAF

radeon:
- iMac fix

UAPI:
- KFD dmabuf export support.  Required for importing KFD buffers into GEM contexts and for RDMA P2P support.
  Proposed user mode changes: https://github.com/fxkamd/ROCT-Thunk-Interface/commits/fxkamd/dmabuf

----------------------------------------------------------------
Agustin Gutierrez (1):
      drm/amd/display: Keep PHY active for dp config

Alex Deucher (6):
      drm/amdgpu: fix error checking in amdgpu_read_mm_registers for soc15
      drm/amdgpu: fix error checking in amdgpu_read_mm_registers for soc21
      drm/amdgpu: fix error checking in amdgpu_read_mm_registers for nv
      Revert "drm/amdgpu/display: change pipe policy for DCN 2.1"
      Revert "drm/amd/display: Pass proper parent for DM backlight device registration"
      drm/amdgpu/nv: fix codec array for SR_IOV

Alex Hung (1):
      drm/amd/display: fix shift-out-of-bounds in CalculateVMAndRowBytes

Alvin Lee (5):
      drm/amd/display: DAL to program DISPCLK WDIVIDER if PMFW doesn't
      drm/amd/display: When blanking during init loop to find OPP index
      drm/amd/display: Update to correct min FCLK when construction BB
      drm/amd/display: Pass tg and hubp inst instead of pipe index for SubVP
      drm/amd/display: Use DPP inst instead of pipe idx for DPP DTO programming

Anthony Koo (1):
      drm/amd/display: [FW Promotion] Release 0.0.158.0

Aric Cyr (9):
      drm/amd/display: Reduce CPU busy-waiting for long delays
      Revert "drm/amd/display: Do not set DRR on pipe commit"
      Revert "drm/amd/display: Fix FreeSync active bit issue"
      drm/amd/display: Only wait for blank completion if OTG active
      drm/amd/display: Do not update DRR while BW optimizations pending
      drm/amd/display: Promote DAL to 3.2.224
      drm/amd/display: 3.2.225
      drm/amd/display: 3.2.226
      drm/amd/display: 3.2.227

Arthur Grillo (2):
      drm/amd/display: Remove unused local variables
      drm/amd/display: Remove unused local variables and function

Aurabindo Pillai (1):
      drm/amd/display: fix clock sequence logic for DCN32

Ayush Gupta (2):
      drm/amd/display: populate subvp cmd info only for the top pipe
      drm/amd/display: disconnect MPCC only on OTG change

Benjamin Cheng (1):
      drm/amd/display: Write to correct dirty_rect

Bhawanpreet Lakha (1):
      drm/amd/display: Fix HDCP failing to enable after suspend

Bjorn Helgaas (1):
      drm/amdgpu: Drop redundant pci_enable_pcie_error_reporting()

Błażej Szczygieł (1):
      drm/amd/pm: Fix sienna cichlid incorrect OD volage after resume

Candice Li (3):
      drm/amdgpu: Make umc_v8_10_convert_error_address static and remove unused variable
      drm/amdgpu: Support umc node harvest config on umc v8_10
      drm/amd/pm: Enable ecc_info table support for smu v13_0_10

Chia-I Wu (2):
      drm/amdkfd: fix a potential double free in pqm_create_queue
      drm/amdkfd: fix potential kgd_mem UAFs

Chris Park (1):
      drm/amd/display: Simplify register offsets

Christian König (2):
      drm/amdgpu: stop waiting in amdgpu_uvd_send_msg
      drm/amdgpu: simplify amdgpu_uvd_send_msg

Cruise Hung (1):
      drm/amd/display: Fix DP MST sinks removal issue

Daniel Phillips (1):
      amdkfd: Memory availability can never be negative

David Belanger (1):
      drm/amdkfd: Fixed kfd_process cleanup on module exit.

David Tadokoro (3):
      drm/amd/display: add prefix to amdgpu_dm_plane.h functions
      drm/amd/display: remove legacy fields of dc_plane_cap struct
      drm/amd/display: add prefix to amdgpu_dm_crtc.h functions

Deepak R Varma (1):
      drm/amd/display: Simplify same effect if/else blocks

Fangzhi Zuo (2):
      drm/amd/display: Add DSC Support for Synaptics Cascaded MST Hub
      drm/amd/display: Take FEC Overhead into Timeslot Calculation

Felix Kuehling (4):
      drm/amdgpu: Generalize KFD dmabuf import
      drm/amdkfd: Implement DMA buf fd export from KFD
      drm/amdgpu: Optimize end of non-contig VA ranges
      drm/amdgpu: Don't resume IOMMU after incomplete init

Gabe Teeger (1):
      drm/amd/display: Enable HostVM based on rIOMMU active

Guchun Chen (3):
      drm/amdgpu: drop pm_sysfs_en flag from amdgpu_device structure
      drm/amdgpu: use drm_device pointer directly rather than convert again
      drm/amdgpu: move poll enabled/disable into non DC path

Guilherme G. Piccoli (1):
      drm/amdgpu/vcn: Disable indirect SRAM on Vangogh broken BIOSes

Hamza Mahfooz (1):
      drm/amd/display: use a more accurate check in dm_helpers_dp_read_dpcd()

Hans de Goede (1):
      drm/amd/display: Pass proper parent for DM backlight device registration

Harry Wentland (12):
      drm/amd/display: Don't restrict bpc to 8 bpc
      drm/amd/display: Format input and output CSC matrix
      drm/display: Don't block HDR_OUTPUT_METADATA on unknown EOTF
      drm/connector: print max_requested_bpc in state debugfs
      drm/amd/display: Drop CONFIG_DRM_AMD_DC_HDR
      drm/amd/display: Fix no-DCN build
      drm/amd/display: Drop CONFIG_DRM_AMD_DC_HDCP
      drm/amd/display: call remove_stream_from_ctx from res_pool funcs
      drm/amd/display: Build DSC without DCN config
      drm/amd/display: Drop unnecessary DCN guards
      drm/amd/display: Drop unnecessary DCN guards
      drm/amd/display: Rename DCN config to FP

Hawking Zhang (22):
      drm/amdgpu: add IH ip block for IH 4.4.2
      drm/amdgpu: add hdp v4_4_2 ip headers
      drm/amdgpu: add HDP ip block for HDP 4.4.2
      drm/amdgpu: add sdma v4_4_2 ip headers
      drm/amdgpu: add psp early init for PSP 13.0.6
      drm/amdgpu: init sos microcode for psp v13_0_6
      drm/amdgpu: initialize ta ucode for psp v13_0_6
      drm/amdgpu: add PSP ip block for PSP 13.0.6
      drm/amdgpu: add mp v13_0_6 ip headers
      drm/amdgpu: Move jpeg ras block init to ras sw_init
      drm/amdgpu: Move vcn ras block init to ras sw_init
      drm/amdgpu: Move umc ras block init to gmc ras sw_init
      drm/amdgpu: Correct gfx ras_late_init callback
      drm/amdgpu: Move mmhub ras block init to ras sw_init
      drm/amdgpu: Move hdp ras block init to ras sw_init
      drm/amdgpu: Rework mca ras sw_init
      drm/amdgpu: Rework xgmi_wafl_pcs ras sw_init
      drm/amdgpu: Rework pcie_bif ras sw_init
      drm/amdgpu: drop ras check at asic level for new blocks
      drm/amdgpu: Move to common indirect reg access helper
      drm/amdgpu: Move to common helper to query soc rev_id
      drm/amdgpu: Retire pcie_gen3_enable function

Hersen Wu (1):
      drm/amd/display: dcn32/321 dsc_pg_control not executed properly

Horatio Zhang (1):
      drm/amdgpu: fix ttm_bo calltrace warning in psp_hw_fini

Husain Alshehhi (1):
      drivers/gpu: fix typo in comment

Jane Jian (1):
      drm/amdgpu/vcn: custom video info caps for sriov

Jasdeep Dhillon (1):
      drm/amd/display: Updating Video Format Fall Back Policy.

Jiapeng Chong (2):
      drm/amd/display: Modify mismatched function name
      drm/amd/display: Use swap() instead of open coding it

Kun Liu (3):
      drm/amdgpu: added a sysfs interface for thermal throttling
      drm/amdgpu: added a sysfs interface for thermal throttling
      drm/amdgpu: fix no previous prototype warning

Le Ma (5):
      drm/amdgpu: set ih chicken bit for IH 4.4.2
      drm/amdgpu: skip ih2 rb allocation for IH 4.4.2
      drm/amdgpu: skip hdp invalidation for HDP 4.4.2
      drm/amdgpu: add sdma v4_4_2 support (v4)
      drm/amdgpu: set sdma v4_4_2 ip block

Lijo Lazar (3):
      drm/amd/pm: Add PMFW headers for SMU 13.0.6
      drm/amd/pm: Add SMU 13.0.6 support
      drm/amd/pm: Remove unavailable temperature params

Marek Olšák (1):
      drm/amdgpu: expose more memory stats in fdinfo

Mario Limonciello (2):
      drm/amd: Fix initialization for nbio 7.5.1
      drm/amd: Fix initialization mistake for NBIO 7.3.0

Mark Hawrylak (1):
      drm/radeon: Fix eDP for single-display iMac11,2

Mike Hsieh (2):
      drm/amd/display: Add height granularity limitation for dsc slice height calculation
      drm/amd/display: fix typo in dc_dsc_config_options structure

Muhammad Usama Anjum (1):
      drm/amdgpu: remove dead code

Mustapha Ghaddar (4):
      drm/amd/display: Allocation at stream Enable
      drm/amd/display: Update BW ALLOCATION Function declaration
      drm/amd/display: Unify DC logging for BW Alloc
      drm/amd/display: Add Validate BW for USB4 Links

Nicholas Kazlauskas (2):
      drm/amd/display: Add minimum Z8 residency debug option
      drm/amd/display: Update minimum stutter residency for DCN314 Z8

Orlando Chamberlain (1):
      drm/amdgpu: register a vga_switcheroo client for MacBooks with apple-gmux

Paul Hsieh (1):
      drm/amd/display: Correct DML calculation to align HW formula

Perry Yuan (3):
      drm/amdgpu/pm: add capped/uncapped power profile modes
      drm/amdgpu: map new capped and uncapped mode power profiles for Vangogh
      drm/amdgpu: skip the invalid workload type

Peter Foley (1):
      amdgpu: Avoid building on UML

Robin Chen (1):
      drm/amd/display: hpd rx irq not working with eDP interface

Rodrigo Siqueira (6):
      drm/amd/display: Ensure vmin and vmax adjust for DCE
      drm/amd/display: Drop dc_commit_state in favor of dc_commit_streams
      drm/amd/display: Use dc_update_planes_and_stream
      drm/amd/display: Use DC_LOG_DC in the trasform pixel function
      drm/amd/display: Add wrapper to call planes and stream update
      drm/amd/display: Ensure that planes are in the same order

Ryan Lin (1):
      drm/amd/display: Ext displays with dock can't recognized after resume

Saaem Rizvi (1):
      drm/amd/display: Remove OTG DIV register write for Virtual signals.

Samson Tam (3):
      drm/amd/display: enable DPG when disabling plane for phantom pipe
      drm/amd/display: reallocate DET for dual displays with high pixel rate ratio
      drm/amd/display: fix assert condition

Shashank Sharma (1):
      drm/amdgpu: fix return value check in kfd

Shirish S (1):
      drm/amd/display: add sysfs entry to read PSR residency from firmware

Stylon Wang (1):
      drm/amd/display: Clearly states if long or short HPD event in dmesg logs

Sung Joon Kim (1):
      drm/amd/display: Extend Freesync over PCon support for more devices

Swapnil Patel (2):
      drm/amd/display: Update clock table to include highest clock setting
      drm/amd/display: default values for luminance range if they are 0

Thomas Weißschuh (2):
      drm/amdgpu: make kobj_type structures constant
      drm/amdkfd: Make kobj_type structures constant

Tim Huang (1):
      drm/amd/pm: bump SMU 13.0.4 driver_if header version

Tom Rix (6):
      drm/amdgpu: remove unused variable ring
      drm/amd/display: change several dcn201 variables storage-class-specifier to static
      drm/amd/display: change several dcn20 variables storage-class-specifier to static
      drm/amd/display: change several dcn30 variables storage-class-specifier to static
      drm/amd/display: remove unused variable res_pool
      drm/amd/display: remove unused variable available

Tom St Denis (1):
      drm/amd/amdgpu: Add missing INT_STAT_DEBUG registers to GC 10.1 and 10.3 headers

Veerabadhran Gopalakrishnan (1):
      drm/amdgpu/soc21: Add video cap query support for VCN_4_0_4

Wayne Lin (1):
      drm/amd/display: Pass the right info to drm_dp_remove_payload

Wenjing Liu (8):
      drm/amd/display: merge dc_link.h into dc.h and dc_types.h
      drm/amd/display: remove empty dc_link.c
      drm/amd/display: move dc_link functions in accessories folder to dc_link_exports
      drm/amd/display: move dc_link functions in link root folder to dc_link_exports
      drm/amd/display: link link_dp_dpia_bw.o in makefile
      drm/amd/display: move dc_link functions in protocols folder to dc_link_exports
      drm/amd/display: replace all dc_link function call in link with link functions
      drm/amd/display: convert link.h functions to function pointer style

Wesley Chalmers (2):
      drm/amd/display: Do not set DRR on pipe Commit
      drm/amd/display: Make DCN32 functions available to future DCNs

Xiaogang Chen (2):
      drm/amdkfd: Fix BO offset for multi-VMA page migration
      drm/amdkfd: Get prange->offset after svm_range_vram_node_new

Yifan Zha (1):
      drm/amdgpu: Init MMVM_CONTEXTS_DISABLE in gmc11 golden setting under SRIOV

Yihan Zhu (1):
      drm/amd/display: update pixel format in DP hw sequence

Zhikai Zhai (1):
      drm/amd/display: reset the scaler boundary mode

bobzhou (3):
      drm/amdgpu/vcn: fix compilation issue with legacy gcc
      drm/amdgpu: remove unused variable
      drm/amd: fix compilation issue with legacy gcc

leiyaoyao (1):
      drm/amdgpu: Stop clearing kiq position during fini

lyndonli (2):
      drm/amdgpu: Fix call trace warning and hang when removing amdgpu device
      drm/amdgpu: Fix the warning info when removing amdgpu device

tiancyin (1):
      drm/amd/display: fix dm irq error message in gpu recover

 .../gpu/amdgpu/display/display-manager.rst         |    2 +-
 drivers/gpu/drm/amd/amdgpu/Kconfig                 |    1 +
 drivers/gpu/drm/amd/amdgpu/Makefile                |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   88 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   84 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   27 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c         |   24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   41 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.c            |   48 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.h            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           |   29 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.h           |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c            |   72 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h            |    9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.c          |   46 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.h          |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.c           |   23 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h           |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   29 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |   25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |   30 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |   32 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |   48 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |   30 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h           |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |    3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   15 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   26 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   28 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   59 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |    8 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |    6 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |    6 +-
 drivers/gpu/drm/amd/amdgpu/mca_v3_0.c              |   44 +-
 drivers/gpu/drm/amd/amdgpu/mca_v3_0.h              |    4 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.c            |    3 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c             |    9 +
 drivers/gpu/drm/amd/amdgpu/nv.c                    |   84 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |    2 +
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           | 1967 ++++++++++++
 .../dc/core/dc_link.c => amdgpu/sdma_v4_4_2.h}     |   13 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   81 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |  183 +-
 drivers/gpu/drm/amd/amdgpu/umc_v8_10.c             |   15 +-
 drivers/gpu/drm/amd/amdgpu/umc_v8_10.h             |    4 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |    6 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   11 +-
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |   15 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |   20 -
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   71 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   11 +-
 drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c          |    2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |   33 +-
 drivers/gpu/drm/amd/amdkfd/kfd_module.c            |    1 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |    1 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   75 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |    4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   10 +-
 drivers/gpu/drm/amd/display/Kconfig                |   14 +-
 drivers/gpu/drm/amd/display/Makefile               |    4 -
 drivers/gpu/drm/amd/display/amdgpu_dm/Makefile     |    4 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  242 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |    4 -
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |   26 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.h |   14 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |   33 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |    3 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   71 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   88 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.h    |   15 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |  149 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h    |   12 +-
 drivers/gpu/drm/amd/display/dc/Makefile            |    7 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |    2 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile    |    2 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |   16 +-
 .../amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c |    2 +-
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |    2 +-
 .../drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c |   19 +-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |    5 +
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |   79 +-
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.h   |    3 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  377 +--
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |   38 +-
 .../gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c  |    2 +-
 .../gpu/drm/amd/display/dc/core/dc_link_exports.c  |  411 ++-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   21 +-
 drivers/gpu/drm/amd/display/dc/core/dc_vm_helper.c |    2 -
 drivers/gpu/drm/amd/display/dc/dc.h                |  588 +++-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   13 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |  173 +-
 drivers/gpu/drm/amd/display/dc/dc_dsc.h            |   11 +-
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |   16 +-
 drivers/gpu/drm/amd/display/dc/dc_link.h           |  577 ----
 drivers/gpu/drm/amd/display/dc/dc_types.h          |  117 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |    9 +-
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |   27 +-
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.h  |    6 -
 drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.c      |    2 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_transform.c |    5 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c      |    2 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |    2 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.h      |    5 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |   62 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.h    |    2 -
 .../drm/amd/display/dc/dce110/dce110_resource.c    |    3 -
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.h   |    4 +
 .../gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c  |    4 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dwb.c   |    5 -
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dwb.h   |    4 -
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |    8 +-
 .../drm/amd/display/dc/dcn10/dcn10_link_encoder.c  |    3 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |    2 -
 .../amd/display/dc/dcn10/dcn10_stream_encoder.c    |   10 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c   |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dwb.c   |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |   23 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_mmhubbub.c  |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c   |    2 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |   11 +-
 .../amd/display/dc/dcn20/dcn20_stream_encoder.c    |    3 +-
 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dpp.c |    7 -
 .../gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c   |    2 -
 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_mpc.c |    2 +-
 .../drm/amd/display/dc/dcn201/dcn201_resource.c    |    6 +-
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.c |    4 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |    4 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c  |    2 -
 .../display/dc/dcn30/dcn30_dio_stream_encoder.c    |    1 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.h   |    2 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb.c   |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c  |    4 -
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |   12 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_mmhubbub.c  |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c   |    2 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |   11 +-
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |    2 -
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |   11 +-
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |   13 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c   |   41 -
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  |    5 +-
 .../display/dc/dcn31/dcn31_hpo_dp_link_encoder.c   |    1 -
 .../display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |   14 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |    2 -
 .../display/dc/dcn314/dcn314_dio_stream_encoder.c  |    8 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c   |    2 +-
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |    3 +-
 .../drm/amd/display/dc/dcn315/dcn315_resource.c    |    2 -
 .../drm/amd/display/dc/dcn316/dcn316_resource.c    |    2 -
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.h  |   36 -
 .../display/dc/dcn32/dcn32_dio_stream_encoder.c    |    4 +-
 .../display/dc/dcn32/dcn32_dio_stream_encoder.h    |   64 -
 .../display/dc/dcn32/dcn32_hpo_dp_link_encoder.c   |    1 -
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.h    |   62 -
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.h  |    6 -
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |  119 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h |    4 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c  |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c   |    8 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.h   |   13 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.h  |   71 -
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |   23 +-
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |   47 +-
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |   12 +-
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |    2 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |    7 +-
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |    8 +-
 .../display/dc/dml/dcn30/display_rq_dlg_calc_30.c  |    3 -
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |  299 +-
 .../display/dc/dml/dcn31/display_rq_dlg_calc_31.c  |    2 -
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c |    4 +
 .../display/dc/dml/dcn314/display_mode_vba_314.c   |  299 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |    7 +-
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |    7 +-
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |    6 +-
 .../dc/dml/dcn32/display_mode_vba_util_32.h        |    3 +-
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c |    5 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |   86 +-
 drivers/gpu/drm/amd/display/dc/dsc/rc_calc.c       |    2 +
 drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c     |    2 +-
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |    2 -
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h        |   54 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dwb.h        |    8 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |    2 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h  |   14 -
 .../gpu/drm/amd/display/dc/inc/hw/link_encoder.h   |   52 -
 .../gpu/drm/amd/display/dc/inc/hw/stream_encoder.h |    1 -
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |    2 +-
 .../drm/amd/display/dc/inc/hw_sequencer_private.h  |    2 +-
 drivers/gpu/drm/amd/display/dc/inc/link.h          |  351 ++-
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |    2 +-
 drivers/gpu/drm/amd/display/dc/link/Makefile       |    2 +-
 .../amd/display/dc/link/accessories/link_dp_cts.c  |   65 +-
 .../amd/display/dc/link/accessories/link_dp_cts.h  |   19 +-
 .../display/dc/link/accessories/link_dp_trace.c    |   21 +-
 .../display/dc/link/accessories/link_dp_trace.h    |   17 +-
 .../drm/amd/display/dc/link/hwss/link_hwss_dio.c   |   22 +-
 .../amd/display/dc/link/hwss/link_hwss_hpo_dp.c    |    8 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |  123 +-
 .../gpu/drm/amd/display/dc/link/link_detection.h   |   15 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |   78 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.h    |   23 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |  274 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.h |    2 +
 .../gpu/drm/amd/display/dc/link/link_resource.h    |    3 +-
 .../gpu/drm/amd/display/dc/link/link_validation.c  |   14 +-
 .../gpu/drm/amd/display/dc/link/link_validation.h  |    7 +
 .../drm/amd/display/dc/link/protocols/link_ddc.c   |   24 +-
 .../drm/amd/display/dc/link/protocols/link_ddc.h   |   32 +
 .../display/dc/link/protocols/link_dp_capability.c |   70 +-
 .../display/dc/link/protocols/link_dp_capability.h |   28 +
 .../amd/display/dc/link/protocols/link_dp_dpia.c   |    3 +-
 .../amd/display/dc/link/protocols/link_dp_dpia.h   |    4 +-
 .../display/dc/link/protocols/link_dp_dpia_bw.c    |  176 +-
 .../display/dc/link/protocols/link_dp_dpia_bw.h    |   52 +-
 .../dc/link/protocols/link_dp_irq_handler.c        |   30 +-
 .../dc/link/protocols/link_dp_irq_handler.h        |   12 +-
 .../amd/display/dc/link/protocols/link_dp_phy.c    |   10 +-
 .../amd/display/dc/link/protocols/link_dp_phy.h    |    3 +
 .../display/dc/link/protocols/link_dp_training.c   |   26 +-
 .../display/dc/link/protocols/link_dp_training.h   |    3 +
 .../dc/link/protocols/link_dp_training_auxless.c   |    2 +-
 .../dc/link/protocols/link_dp_training_auxless.h   |    2 +-
 .../dc/link/protocols/link_dp_training_dpia.c      |    7 +-
 .../dc/link/protocols/link_dp_training_dpia.h      |    2 +-
 .../dc/link/protocols/link_edp_panel_control.c     |   51 +-
 .../dc/link/protocols/link_edp_panel_control.h     |   30 +
 .../drm/amd/display/dc/link/protocols/link_hpd.c   |   14 +-
 .../drm/amd/display/dc/link/protocols/link_hpd.h   |    7 +
 drivers/gpu/drm/amd/display/dc/os_types.h          |    4 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   22 +-
 .../include/{hdcp_types.h => hdcp_msg_types.h}     |    0
 .../drm/amd/display/include/link_service_types.h   |   26 -
 .../drm/amd/display/modules/freesync/freesync.c    |   12 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_log.h    |    2 -
 drivers/gpu/drm/amd/display/modules/inc/mod_hdcp.h |    1 +
 .../drm/amd/display/modules/power/power_helpers.c  |    7 -
 .../drm/amd/include/asic_reg/gc/gc_10_1_0_offset.h |    4 +
 .../amd/include/asic_reg/gc/gc_10_1_0_sh_mask.h    |   54 +
 .../drm/amd/include/asic_reg/gc/gc_10_3_0_offset.h |    4 +
 .../amd/include/asic_reg/gc/gc_10_3_0_sh_mask.h    |   54 +
 .../amd/include/asic_reg/hdp/hdp_4_4_2_offset.h    |  219 ++
 .../amd/include/asic_reg/hdp/hdp_4_4_2_sh_mask.h   |  663 ++++
 .../drm/amd/include/asic_reg/mp/mp_13_0_6_offset.h |  456 +++
 .../amd/include/asic_reg/mp/mp_13_0_6_sh_mask.h    |  674 ++++
 .../amd/include/asic_reg/sdma/sdma_4_4_2_offset.h  | 1109 +++++++
 .../amd/include/asic_reg/sdma/sdma_4_4_2_sh_mask.h | 3276 ++++++++++++++++++++
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |    4 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |   28 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   79 +
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |    3 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   30 +
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   12 +
 .../pm/swsmu/inc/pmfw_if/smu11_driver_if_vangogh.h |    4 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_4.h |    4 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_6.h |  141 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_pmfw.h    |  212 ++
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_ppsmc.h   |   95 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |    4 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |    7 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   43 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |   23 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile        |    2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   11 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   79 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   | 2069 ++++++++++++
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.h   |   32 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |    4 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |    4 +-
 drivers/gpu/drm/display/drm_hdmi_helper.c          |    6 +-
 drivers/gpu/drm/drm_atomic.c                       |    1 +
 drivers/gpu/drm/radeon/atombios_encoders.c         |    5 +-
 include/uapi/linux/kfd_ioctl.h                     |   14 +-
 286 files changed, 16293 insertions(+), 3367 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
 rename drivers/gpu/drm/amd/{display/dc/core/dc_link.c => amdgpu/sdma_v4_4_2.h} (82%)
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dc_link.h
 rename drivers/gpu/drm/amd/display/include/{hdcp_types.h => hdcp_msg_types.h} (100%)
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/hdp/hdp_4_4_2_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/hdp/hdp_4_4_2_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_6_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_6_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/sdma/sdma_4_4_2_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/sdma/sdma_4_4_2_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_6.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_pmfw.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_ppsmc.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.h
