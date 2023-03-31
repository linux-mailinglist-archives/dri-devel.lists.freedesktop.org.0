Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 431286D2B38
	for <lists+dri-devel@lfdr.de>; Sat,  1 Apr 2023 00:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F41310E57F;
	Fri, 31 Mar 2023 22:20:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83FD410F31E;
 Fri, 31 Mar 2023 22:20:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KPCG57VAfNQX4rhyZEEURAkpeS055uepzfmWq7KFkp38fh8qzZ1pwye0gk7KNNKslCBGHzIF1HOuK+ZWz0VmHlerNokVpKbsAAkOa9qw527HTSqi2j3dgSo/0KQw/ZHMwvGLaqnGhpIIos7LN7HMDtqM48p2CoL3pPEHf6StrLkMD+tV55KE50YHviBomGz2axA/Qn1rWBOLGpJFYqI3aKRCBE0smBFGMT/r9V2Ppayt3C1tKUNLaiAe0uuyyzIPluXorPMII4BpcBJz+Hsmz9NxTNFUkY3MPASVae1EPnknNb6htGYjuzS2fPV9CKWAYi8T0iqpf4yDHwIyqneV5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYdJTl8VOFuk+BaLkSPfsjEmM3Cc9fXq6+8+mb+55dk=;
 b=dPwWbJZmQy4EEsEK/gcqvXsjKbnb5x4oWkMOhpudgvvB3UwIUrUSYnDP2sh3waAdMO3ePgYpRPyaTFq6EkcWfChBMN6X1RFpZasHHZpu5kR2078HqS5OpuZuTGufiIaKOBrY2XQMDlDv2i0t4BqaAwyrgMzvQN597FW+zWfZjJQ+A1Jyk2iHupaIE1sDf4ze1xo+DbU7EkAOyzbikkXGCq6+vrYLNtFH0luCVpwvr6hnCK7zyM/3iehSAHhyiV2JkhxD5l1q5AmyGhHVX2EP5XXcu2QApIwMwsBETh6TAJMhrlzbsgV6eJOR2kRNCC5tKPxFedW7Rl2HQ2CbgPgTPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xYdJTl8VOFuk+BaLkSPfsjEmM3Cc9fXq6+8+mb+55dk=;
 b=wZ2N7bOmXg2iPEGvoFRPzyKBh1C6Ddu5DcTvX3XDAa76kyu4p1lGxkXszv/xKpR9TRQHT9iU0mJoiAj6cAiSnCcdb2b2pUBLfAf6IEE/Thi5L8uKO3W+uZzlGqUng/aCubUHk0vY/PoAzex1/PvzPNl+nxUniYNMtMaC4xs0Bu8=
Received: from MW4PR04CA0131.namprd04.prod.outlook.com (2603:10b6:303:84::16)
 by SJ1PR12MB6244.namprd12.prod.outlook.com (2603:10b6:a03:455::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Fri, 31 Mar
 2023 22:20:11 +0000
Received: from CO1NAM11FT074.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:84:cafe::4a) by MW4PR04CA0131.outlook.office365.com
 (2603:10b6:303:84::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22 via Frontend
 Transport; Fri, 31 Mar 2023 22:20:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT074.mail.protection.outlook.com (10.13.174.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6277.16 via Frontend Transport; Fri, 31 Mar 2023 22:20:11 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 31 Mar
 2023 17:20:09 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-6.4
Date: Fri, 31 Mar 2023 18:19:55 -0400
Message-ID: <20230331221955.7896-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT074:EE_|SJ1PR12MB6244:EE_
X-MS-Office365-Filtering-Correlation-Id: 6267cc7d-c12f-4eb3-8f8a-08db32361813
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7cD6+clT9c79DR/Qd3Q30Y/uXDvMAzIrBjCD2HXF9pEqzMMF8npWJZ5sAP5Dua2Ks1XjZ8hJL7bowwW/BAp9LnBUg1JPulHGJ7XMo2p+pkmQwP5deFXuSh7IlP7Fi6jAqo/RWwVNslHPjXblsbE8tMecAvIQ5l66nCMDoELV+NKyMqZaZ+tfng1oxkvRQYfRaBJI9L7+1Gchtf1ubgF+cz8zSpD+j63/sqbNekNUeMOwGtIMUDTMw458sINdU+Urp1iy3IirnIE6GmP0izhgswmj21ezwUXAbruWqmp/+e4+vCDQ8RiJRxtKLxPc8azLEJlItO0c9FCPi7sLFQdQTooAqfWSNAZuyOnoF+W94u3f55YAPCDU+LmzbJPySCKlkQywzdCyTCWtSuXNFmm2HIUkkJKj3+fCM2nidNH66GRQIziIn/F5Ep57xVnf8sKLeMTAGGKXifSdC2cmDjof31CZYZ6YH6mFPXcE2IO2Dk9acDFC7/NrjmWDK9rtx40qtHi7tMbA3LO+mbqm3kXSbayTPdvRfTP3P35PdAKMW/eBeeI36AbL1CTGII946xL4PrDYFMcvdOBA67IeifeKLnS1bF3yJfPmehaO8dEgfdo7VpWiY5XVtSMLbxB7ZxcB7doQ9EuzROs9EocFY/FDV9k/kX/uF2jBLW2ASa0/RX6KsHYi6FD8VrzqjBAc8QmW6oBMOa7nKCObm3Yh5YrGzh1uew4K6Ze+ydL5aNIsqLV9Wn6cJeDAp53Uf9IOsOz8
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199021)(36840700001)(40470700004)(46966006)(83380400001)(1076003)(81166007)(6666004)(26005)(356005)(110136005)(316002)(70206006)(70586007)(40480700001)(86362001)(7696005)(41300700001)(8676002)(36860700001)(82740400003)(4326008)(478600001)(82310400005)(36756003)(2616005)(2906002)(66574015)(47076005)(336012)(426003)(966005)(40460700003)(8936002)(5660300002)(30864003)(186003)(16526019)(36900700001)(357404004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 22:20:11.5052 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6267cc7d-c12f-4eb3-8f8a-08db32361813
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT074.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6244
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

More new stuff for 6.4.

The following changes since commit d36d68fd1925d33066d52468b7c7c6aca6521248:

  Merge tag 'drm-habanalabs-next-2023-03-20' of https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux into drm-next (2023-03-22 10:35:46 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.4-2023-03-31

for you to fetch changes up to feae1bd80ec69a3a0011ba1fb88994785f705e3e:

  drm/amd/pm: enable sysfs node vclk1 and dclk1 for NV3X (2023-03-31 11:18:55 -0400)

----------------------------------------------------------------
amd-drm-next-6.4-2023-03-31:

amdgpu:
- Misc code cleanups
- S4 fixes
- MES fixes
- SR-IOV fixes
- Link DC backlight to connector device rather than PCI device
- W=1 fixes
- ASPM quirk
- RAS fixes
- DC dynamic split fixes and enablement for remaining chips
- Navi1x SMU fix
- Initial NBIO 7.9 support
- Initial GC 9.4.3 support
- Initial GFXHUB 1.2 support
- Initial MMHUB 1.8 support
- DCN 3.1.5 fixes
- Initial DC FAMs infrastructure
- Add support for 6.75Gbps link rates
- Add sysfs nodes for secondary VCN clocks

amdkfd:
- Initial support for GC 9.4.3

radeon:
- Convert to client-based fbdev emulation

----------------------------------------------------------------
Alex Deucher (3):
      drm/amdgpu: drop the extra sign extension
      Revert "drm/amdgpu/display: change pipe policy for DCN 2.0"
      drm/amd/pm: enable TEMP_DEPENDENT_VMIN for navi1x

Alex Hung (1):
      drm/amd/display: remove outdated 8bpc comments

Alvin Lee (6):
      drm/amd/display: Enable FPO for configs that could reduce vlevel
      drm/amd/display: Update FCLK change latency
      drm/amd/display: Use per pipe P-State force for FPO
      drm/amd/display: Only keep cursor p-state force for FPO
      drm/amd/display: Enable FPO optimization
      drm/amd/display: Uncomment assignments after HW headers are promoted

Amber Lin (2):
      drm/amdkfd: Set noretry/xnack for GC 9.4.3
      drm/amdkfd: Set TG_CHUNK_SIZE for GC 9.4.3

Anthony Koo (1):
      drm/amd/display: [FW Promotion] Release 0.0.160.0

Aric Cyr (2):
      drm/amd/display: 3.2.228
      drm/amd/display: Promote DAL to 3.2.229

Artem Grishin (2):
      drm/amd/display: Add support for 6.75 GBps link rate
      drm/amd/display: Conditionally enable 6.75 GBps link rate

Ayush Gupta (1):
      drm/amd/display: fixed dcn30+ underflow issue

Bill Liu (1):
      drm/amdgpu: Adding CAP firmware initialization

Caio Novais (2):
      drm/amd/display: Remove unused variable 'scl_enable'
      drm/amd/display: Mark function 'optc3_wait_drr_doublebuffer_pending_clear' as static

Charlene Liu (4):
      drm/amd/display: update dio for two pixel per container case
      drm/amd/display: Add CRC and DMUB test support
      drm/amd/display: add missing code change init pix_per_cycle
      drm/amd/display: update dig enable sequence

Christophe JAILLET (1):
      drm/amd/display: Slightly optimize dm_dmub_outbox1_low_irq()

Dmytro Laktyushkin (1):
      drm/amd/display: w/a for dcn315 inconsistent smu clock table

Hans de Goede (6):
      drm/amd/display/amdgpu_dm: Fix backlight_device_register() error handling
      drm/amd/display/amdgpu_dm: Refactor register_backlight_device()
      drm/amd/display/amdgpu_dm: Add a bl_idx to amdgpu_dm_connector
      drm/amd/display/amdgpu_dm: Move most backlight setup into setup_backlight_device()
      drm/amd/display/amdgpu_dm: Make amdgpu_dm_register_backlight_device() take an amdgpu_dm_connector
      drm/amd/display/amdgpu_dm: Pass proper parent for backlight device registration v3

Hawking Zhang (14):
      drm/amdgpu: Initialize umc ras callback
      drm/amdgpu: Add fatal error handling in nbio v4_3
      drm/amdgpu: add nbio v7_9_0 ip headers
      drm/amdgpu: add nbio v7_9 support
      drm/amdgpu: init nbio v7_9 callbacks
      drm/amdgpu: Set family for GC 9.4.3
      drm/amdgpu: add athub v1_8_0 ip headers
      drm/amdgpu: add osssys v4_4_2 ip headers
      drm/amdgpu: add gc v9_4_3 ip headers
      drm/amdgpu: add gmc ip block support for GC 9.4.3
      drm/amdgpu: add mmhub v1_8_0 ip headers
      drm/amdgpu: add GMC ip block for GC 9.4.3
      drm/amdgpu: Correct xgmi_wafl block name
      drm/amdkfd: Add GC 9.4.3 KFD support

Hersen Wu (3):
      drm/amd/display: align commit_planes_for_stream to latest dc code
      drm/amd/display: fix wrong index used in dccg32_set_dpstreamclk
      drm/amd/display: Set dcn32 caps.seamless_odm

Jack Xiao (1):
      drm/amd/amdgpu: limit one queue per gang

Jane Jian (2):
      drm/amdgpu/gfx: set cg flags to enter/exit safe mode
      drm/amdgpu/jpeg: enable jpeg v4_0 for sriov

Jay Cornwall (1):
      drm/amdkfd: Trap handler changes for GC 9.4.3 v2

Jiapeng Chong (4):
      drm/amd/display: make is_synaptics_cascaded_panamera static
      drm/amd/display: Remove the unused function link_timing_bandwidth_kbps()
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Remove the unused variable dppclk_delay_subtotal

Kai-Heng Feng (1):
      drm/amdgpu/nv: Apply ASPM quirk on Intel ADL + AMD Navi

Le Ma (3):
      drm/amdgpu: add gfxhub v1_2 support
      drm/amdgpu: add mmhub v1_8 support
      drm/amdgpu: initialize gfxhub v1_2 and mmhub v1_8 funcs

Lee Jones (18):
      drm/amd/display/dc/dc_hdmi_types: Move string definition to the only file it's used in
      drm/amd/amdgpu/amdgpu_device: Provide missing kerneldoc entry for 'reset_context'
      drm/amd/amdgpu/amdgpu_ucode: Remove unused function ‘amdgpu_ucode_print_imu_hdr’
      drm/amd/amdgpu/amdgpu_vm_pt: Supply description for amdgpu_vm_pt_free_dfs()'s unlocked param
      drm/amd/amdgpu/gmc_v11_0: Provide a few missing param descriptions relating to hubs and flushes
      drm/amd/amdgpu/ih_v6_0: Repair misspelling and provide descriptions for 'ih'
      drm/amd/amdgpu/amdgpu_mes: Ensure amdgpu_bo_create_kernel()'s return value is checked
      drm/amd/amdgpu/amdgpu_vce: Provide description for amdgpu_vce_validate_bo()'s 'p' param
      drm/amd/pm/swsmu/smu11/vangogh_ppt: Provide a couple of missing parameter descriptions
      drm/amd/display/amdgpu_dm/amdgpu_dm_helpers: Move defines out to where they are actually used
      drm/amd/display/dc/dce/dmub_psr: Demote kerneldoc abuse
      drm/amd/display/dc/link/link_detection: Remove unused variable 'status'
      drm/amd/display/dc/link/protocols/link_dp_training: Remove set but unused variable 'result'
      drm/amd/display/dc/link/protocols/link_dp_capability: Remove unused variable and mark another as __maybe_unused
      drm/amd/display/dc/link/protocols/link_dp_capability: Demote non-compliant kerneldoc
      drm/amd/display/dc/dce60/Makefile: Fix previous attempt to silence known override-init warnings
      drm/amd/display/dc/link/link_detection: Demote a couple of kerneldoc abuses
      drm/amd/display/dc/core/dc_stat: Convert a couple of doc headers to kerneldoc format

Luben Tuikov (2):
      drm/amdgpu: Remove second moot switch to set EEPROM I2C address
      drm/amdgpu: Return from switch early for EEPROM I2C address

Martin Leung (2):
      drm/amd/display: initialize link_srv in virtual env
      drm/amd/display: fix double memory allocation

Mustapha Ghaddar (1):
      drm/amd/display: Add function pointer for validate bw usb4

Nicholas Kazlauskas (2):
      drm/amd/display: Add NULL plane_state check for cursor disable logic
      drm/amd/display: Fix 4to1 MPC black screen with DPP RCO

Paul Hsieh (1):
      drm/amd/display: power down eDP if eDP not present

Peichen Huang (1):
      drm/amd/display: skip CLEAR_PAYLOAD_ID_TABLE if device mst_en is 0

Qingqing Zhuo (1):
      drm/amd/display: Add infrastructure for enabling FAMS for DCN30

Rodrigo Siqueira (3):
      drm/amd/display: Add const to a function
      drm/amd/display: Set MPC_SPLIT_DYNAMIC for DCN10
      drm/amd/display: Set MPC_SPLIT_DYNAMIC for DCN301

Saaem Rizvi (1):
      drm/amd/display: Implement workaround for writing to OTG_PIXEL_RATE_DIV register

Srinivasan Shanmugam (2):
      drm/amd/amdgpu: Fix error do not initialise globals to 0
      drm/amd/amdgpu: Remove initialisation of globals to 0 or NULL

Stanley.Yang (1):
      drm/amdgpu: print ras drv fw debug info

Taimur Hassan (1):
      drm/amd/display: Add 90Mhz to video_optimized_pixel_rates

Thomas Zimmermann (10):
      drm/radeon: Move radeon_align_pitch() next to dumb-buffer helpers
      drm/radeon: Improve fbdev object-test helper
      drm/radeon: Remove struct radeon_fbdev
      drm/radeon: Remove test for !screen_base in fbdev probing
      drm/radeon: Move fbdev object helpers before struct fb_ops et al
      drm/radeon: Fix coding style in fbdev emulation
      drm/radeon: Move fbdev cleanup code into fb_destroy callback
      drm/radeon: Correctly clean up failed display probing
      drm/radeon: Implement client-based fbdev emulation
      drm/radeon: Only build fbdev if DRM_FBDEV_EMULATION is set

Tim Huang (3):
      drm/amdgpu: reposition the gpu reset checking for reuse
      drm/amdgpu: skip ASIC reset for APUs when go to S4
      drm/amd/pm: re-enable the gfx imu when smu resume

Tong Liu01 (5):
      drm/amdgpu: add mes resume when do gfx post soft reset
      drm/amdgpu: skip unload tmr when tmr is not loaded
      drm/amd/pm: add sysfs node vclk1 and dclk1
      drm/amd/pm: enable sysfs node vclk1 and dclk1 for NV2X
      drm/amd/pm: enable sysfs node vclk1 and dclk1 for NV3X

Uwe Kleine-König (1):
      drm/amd/display: Whitespace cleanup

Wesley Chalmers (1):
      drm/amd/display: Make DCN32 3dlut function available to future DCNs

YiPeng Chai (3):
      drm/amdgpu: enable ras for mp0 v13_0_10 on SRIOV
      drm/amdgpu: reinit mes ip block during reset on SRIOV
      drm/amdgpu: resume ras for gfx v11_0_3 during reset on SRIOV

Yifan Zha (1):
      drm/amdgpu: Add JPEG IP block to SRIOV reinit

YuBiao Wang (1):
      drm/amdgpu: Force signal hw_fences that are embedded in non-sched jobs

Zhikai Zhai (1):
      drm/amd/display: skip wait vblank

 drivers/gpu/drm/amd/amdgpu/Makefile                |     5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |     5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |    41 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |    25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |    12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |    11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |     9 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           |    23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |    14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |    11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |    12 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |    17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |    21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c        |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |     2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |    14 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c           |   471 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.h           |    29 +
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |     4 +
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |    24 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c               |     5 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |   162 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |   477 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.h            |    28 +
 drivers/gpu/drm/amd/amdgpu/mmsch_v4_0.h            |     5 +
 drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c             |    79 +
 drivers/gpu/drm/amd/amdgpu/nbio_v4_3.h             |     1 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |   369 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.h             |    32 +
 drivers/gpu/drm/amd/amdgpu/nv.c                    |     2 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |    15 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |    17 +-
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     |   487 +
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx9.asm  |    52 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |     1 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |     5 +
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |    15 +
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c    |     3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |     3 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   132 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |     1 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |     3 +
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |     2 +-
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |     5 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |    32 +-
 .../gpu/drm/amd/display/dc/core/dc_link_exports.c  |     8 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stat.c      |    28 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |    20 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |    44 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |    17 +-
 drivers/gpu/drm/amd/display/dc/dc_hdmi_types.h     |     1 -
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |     1 +
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |     1 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |     5 +-
 drivers/gpu/drm/amd/display/dc/dce60/Makefile      |     2 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |    16 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h  |    29 +
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |     4 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h  |     3 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |    22 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |     2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |     3 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |     2 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |     2 +
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |     2 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c  |    13 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |     2 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c    |    23 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c   |    10 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.h   |     2 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_init.c    |     1 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c  |    25 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.h  |     3 +-
 .../display/dc/dcn32/dcn32_dio_stream_encoder.c    |    16 +-
 .../display/dc/dcn32/dcn32_dio_stream_encoder.h    |     8 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.c  |    10 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.h  |     2 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |    53 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h |     5 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c  |     2 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |     2 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |     3 +-
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |     1 +
 .../gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c   |    57 +-
 .../dc/dml/dcn314/display_rq_dlg_calc_314.c        |    12 -
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |    33 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |    25 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |     1 +
 .../drm/amd/display/dc/inc/hw_sequencer_private.h  |     6 +-
 drivers/gpu/drm/amd/display/dc/inc/link.h          |     3 +
 .../gpu/drm/amd/display/dc/link/link_detection.c   |    17 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |    16 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |     1 +
 .../gpu/drm/amd/display/dc/link/link_validation.c  |    69 +-
 .../gpu/drm/amd/display/dc/link/link_validation.h  |     4 +
 .../display/dc/link/protocols/link_dp_capability.c |    32 +-
 .../display/dc/link/protocols/link_dp_dpia_bw.c    |     9 +-
 .../display/dc/link/protocols/link_dp_dpia_bw.h    |     7 +-
 .../display/dc/link/protocols/link_dp_training.c   |     6 +-
 .../dc/link/protocols/link_edp_panel_control.c     |     5 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |     2 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |    14 +-
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |     1 +
 .../drm/amd/display/include/ddc_service_types.h    |    13 -
 .../drm/amd/display/modules/power/power_helpers.c  |     4 +-
 .../include/asic_reg/athub/athub_1_8_0_offset.h    |   411 +
 .../include/asic_reg/athub/athub_1_8_0_sh_mask.h   |  1807 +
 .../drm/amd/include/asic_reg/gc/gc_9_4_3_offset.h  |  7258 ++++
 .../drm/amd/include/asic_reg/gc/gc_9_4_3_sh_mask.h | 30535 +++++++++++++++
 .../include/asic_reg/mmhub/mmhub_1_8_0_offset.h    |  3314 ++
 .../include/asic_reg/mmhub/mmhub_1_8_0_sh_mask.h   | 22315 +++++++++++
 .../amd/include/asic_reg/nbio/nbio_7_9_0_offset.h  | 10002 +++++
 .../amd/include/asic_reg/nbio/nbio_7_9_0_sh_mask.h | 38900 +++++++++++++++++++
 .../amd/include/asic_reg/oss/osssys_4_4_2_offset.h |   263 +
 .../include/asic_reg/oss/osssys_4_4_2_sh_mask.h    |   995 +
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |     2 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |    44 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |    48 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |     3 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |     2 +
 drivers/gpu/drm/radeon/Makefile                    |     3 +-
 drivers/gpu/drm/radeon/radeon.h                    |     2 +
 drivers/gpu/drm/radeon/radeon_display.c            |     4 -
 drivers/gpu/drm/radeon/radeon_drv.c                |     3 +-
 drivers/gpu/drm/radeon/radeon_drv.h                |     1 -
 drivers/gpu/drm/radeon/radeon_fb.c                 |   400 -
 drivers/gpu/drm/radeon/radeon_fbdev.c              |   422 +
 drivers/gpu/drm/radeon/radeon_gem.c                |    24 +
 drivers/gpu/drm/radeon/radeon_kms.c                |    18 -
 drivers/gpu/drm/radeon/radeon_mode.h               |    20 +-
 134 files changed, 119288 insertions(+), 930 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/athub/athub_1_8_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/athub/athub_1_8_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_4_3_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_4_3_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_1_8_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_1_8_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_9_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_9_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/oss/osssys_4_4_2_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/oss/osssys_4_4_2_sh_mask.h
 delete mode 100644 drivers/gpu/drm/radeon/radeon_fb.c
 create mode 100644 drivers/gpu/drm/radeon/radeon_fbdev.c
