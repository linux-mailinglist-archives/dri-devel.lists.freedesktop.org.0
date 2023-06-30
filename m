Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B8D7441AA
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 19:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F5A10E4DE;
	Fri, 30 Jun 2023 17:58:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F0D10E4DC;
 Fri, 30 Jun 2023 17:58:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyMzaXaMEyT4dhXhVHouTkgIW2Fo44zjjZwyy9fS+h6z3hymspWYkFLYjxt/rHeTGdABCnYzLb69oGVjGyPCFCVLpKJVjV25Yeqc2fLF5oSjrnPo6j23OVms/jZ4SuorKDqt3CM0aDb+5ZuL8Y6jOUr3YrpfbIaxylsSDKWn1HpphsxI3+9dc4O6+3p0WTW86bZuJnzdfmmuI+FM8Ggbje3sgt4VBAS5rSOjCv/nnEmEo3w0kQvqkkodK3HdQ6x8OvLY1zUsRQ8DERBDdXhpGqfP6mvVN0YDOS7LMbkPVdyh4NuvRFHMK204u2blrHHeWMqRyXcKCmHEG0yJlemMYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXoRnS//TTo2oIeK9FgeVIzeG32VzS7k+iBVpRcJ9hM=;
 b=iQy869QjS+GFLJsJfZHml9DojY0MZOhR11wPrnb1CVWOHBZs+8x7o9mRBcW9DfBQ3HYniV9Lw6/IISqQGrcLxNn92dpHtPoVm2/CFeRXTuuPWdWwPjea90Buci8x/Se/UMBqyvCYaa+UlYkn+tVrHnMdeR9+x9DywqZaUQSR7OSwbMt5jkOxyqRaokuQp0KccW1k3VjbYgPAQeQecNHujlsxBXb0nDOxn3a3o3Tt4ZHr4LhNEpr53sk2mvhcMuUx2sv0ZKJPZ21kWMnEz2UAod4UEXk0nlMFaANtWyE5StLRiDGSGJYAP8IxJtTzjNfHK4C/0ELRB1I31mqfphnZlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXoRnS//TTo2oIeK9FgeVIzeG32VzS7k+iBVpRcJ9hM=;
 b=fb9u0H8TQQveCoXy343iXT5wrq/i2rEzL+QW54X3uYkLqyqwPmqSvmwF66MJN9Rkada8+1IQA/y6moqtqEqXVfcW+QCLY3nv60fowZq81pidE/0YsKCnuGFOJoJSOimUla7bopD0AHsctJWHhs0xGb6EWBx0g6iyJrJnO+w8gfg=
Received: from MW2PR16CA0022.namprd16.prod.outlook.com (2603:10b6:907::35) by
 DM4PR12MB6038.namprd12.prod.outlook.com (2603:10b6:8:ab::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.19; Fri, 30 Jun 2023 17:58:13 +0000
Received: from CO1NAM11FT109.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::fc) by MW2PR16CA0022.outlook.office365.com
 (2603:10b6:907::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.22 via Frontend
 Transport; Fri, 30 Jun 2023 17:58:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT109.mail.protection.outlook.com (10.13.174.176) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.47 via Frontend Transport; Fri, 30 Jun 2023 17:58:12 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 30 Jun
 2023 12:58:11 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.5
Date: Fri, 30 Jun 2023 13:57:57 -0400
Message-ID: <20230630175757.8128-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT109:EE_|DM4PR12MB6038:EE_
X-MS-Office365-Filtering-Correlation-Id: b9be9412-2c73-4d06-e35b-08db7993929a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NVbDRH2T9q+MNw2IhWlGpb80pG5pmMc5x81AbXsDHoRm/I4YyJT4jHZrL9JT1FsyU+ADki1TqG7iUqrRSF7u2xgsoOv+Xqqs+/XeETC2/UPWI6LZhRfJ1h3Zw6sqk2zblFkt4WP7LvLa0qodtlGfpbIBHn+a4MgJgco6xlbAYcTBg4mHNQG8uGZhS6VqAqp9i2xJ4LUYmbPCmwxz+E7fvNPNMAO3WqxrSUuWemFpmHHNGpGgTOqwyFRB8bedBQwSVUbWA/eXQ2zjAPB1IhUujnf2XCHd2enYRuvwizousAaiKjGWp0rQFmQxawvnBgk08ExWp5yKoUrZVIfcn1Xc/eVVo2O33t1ExmnNui4q7kpNJcFOn5odwTaoVWZLThCgX333YD58kJ8jUo+jKHe+sJLHcwVuXHMPqueac/L+FCgH9TxOr+LHXQvqZVxIhd+JuMoM5PTr+yGCXZJkjrADCvZZlENdSPt64vwd4a31jBfBJ4lEFCJVwCZuxTVZ26BBHuNiTyzew+dRUCroDKlFXC6uhcJDIR3nxzZH/64Y0/yNKs1k1ECETYgyvh1IidSaid3MMBNJCntTKSx9jzb8++UIqSQCs7INP9iMXGXXXi4fi9hqkwcuKaYIgWbhnR1W4zDQ/w4cMka2ws++w3hMytwMNV1TNfzQ7OZNYboUfwmPYU+PK3eS4/KTDeDql6THgpLsnFSzbF08JV52UqnHjxK+fs8U9g054OhEkTWWUwmTNPAfBckGteQmTm2kbiYT5ZiA1b2+dfoyGs8GtyG5OwoQglt2XjJJ49UIwS9nkZU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(136003)(39860400002)(346002)(451199021)(46966006)(36840700001)(40470700004)(86362001)(8936002)(8676002)(5660300002)(82310400005)(110136005)(26005)(1076003)(7696005)(478600001)(4326008)(70206006)(70586007)(966005)(41300700001)(316002)(6666004)(16526019)(186003)(2616005)(2906002)(47076005)(40460700003)(83380400001)(336012)(426003)(66574015)(30864003)(36860700001)(40480700001)(36756003)(82740400003)(356005)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 17:58:12.8272 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9be9412-2c73-4d06-e35b-08db7993929a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT109.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6038
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

Fixes for 6.5.  This is a bit bigger than usual since it's two weeks of fixes
and I missed a bunch of stuff for 6.4 final due to being out of the office
last week and having a late PR.

The following changes since commit 2222dcb0775d36de28992f56455ab3967b30d380:

  Merge tag 'drm-msm-next-2023-06-18' of https://gitlab.freedesktop.org/drm/msm into drm-next (2023-06-19 16:01:46 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.5-2023-06-30-1

for you to fetch changes up to 2e54154b9f27262efd0cb4f903cc7d5ad1fe9628:

  drm/amdgpu: Fix potential fence use-after-free v2 (2023-06-30 13:12:16 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.5-2023-06-30-1:

amdgpu:
- Misc cleanups
- GFX 9.4.3 fixes
- DEBUGFS build fix
- Fix LPDDR5 reporting
- ASPM fixes
- DCN 3.1.4 fixes
- DP MST fixes
- DCN 3.2.x fixes
- Display PSR TCON fixes
- SMU 13.x fixes
- RAS fixes
- Vega12/20 SMU fixes
- PSP flashing cleanup
- GFX9 MCBP fixes
- SR-IOV fixes
- GPUVM clear mappings fix for always valid BOs
- Add FAMS quirk for problematic monitor
- Fix possible UAF
- Better handle monentary temperature fluctuations
- SDMA 4.4.2 fixes
- Fencing fix

----------------------------------------------------------------
Alex Deucher (3):
      drm/amdgpu/atomfirmware: fix LPDDR5 width reporting
      drm/amdgpu: make mcbp a per device setting
      drm/amdgpu: enable mcbp by default on gfx9

Alex Sierra (1):
      drm/amdkfd: set coherent host access capability flag

Alvin Lee (7):
      drm/amd/display: Fix pipe check condition for manual trigger
      drm/amd/display: Clear update flags at end of flip
      drm/amd/display: enable the new fast update path for supported ASICs
      drm/amd/display: Enable dc mode clock switching for DCN32x
      drm/amd/display: Limit new fast update path to addr and gamma / color
      drm/amd/display: For new fast update path, loop through each surface
      drm/amd/display: Take full update path if number of planes changed

Aric Cyr (2):
      drm/amd/display: 3.2.240
      drm/amd/display: 3.2.241

Aurabindo Pillai (1):
      drm/amd/display: Add monitor specific edid quirk

Austin Zheng (3):
      drm/amd/display: Add Clock Table Entry With Max DC Values
      drm/amd/display: Disable DC Mode Capping On DCN321
      drm/amd/display: Remove Phantom Pipe Check When Calculating K1 and K2

Christian König (1):
      drm/amdgpu: fix number of fence calculations

Daniel Miess (4):
      drm/amd/display: disable power gating for DCN314
      drm/amd/display: disable RCO for DCN314
      Revert "drm/amd/display: Move DCN314 DOMAIN power control to DMCUB"
      Partially revert "drm/amd/display: Fix possible underflow for displays with large vblank"

Dmytro Laktyushkin (1):
      drm/amd/display: fix odm k2 div calculation

Emily Deng (1):
      drm/amdgpu/vcn: Need to unpause dpg before stop dpg

Evan Quan (5):
      drm/amd/pm: revise the ASPM settings for thunderbolt attached scenario
      drm/amd/pm: update the LC_L1_INACTIVITY setting to address possible noise issue
      drm/amd/pm: fulfill the missing enablement for vega12/vega20 L2H and H2L interrupts
      drm/amd/pm: expose swctf threshold setting for legacy powerplay
      drm/amd/pm: avoid unintentional shutdown due to temperature momentary fluctuation

Fangzhi Zuo (1):
      drm/amd/display: Add MST Preferred Link Setting Entry

Gianna Binder (1):
      drm/amd/display: Create debugging mechanism for Gaming FAMS

Hamza Mahfooz (1):
      drm/amd/display: perform a bounds check before filling dirty rectangles

Harry Wentland (1):
      drm/amd/display: Fix the delta clamping for shaper LUT

Hersen Wu (1):
      Revert "drm/amd/display: edp do not add non-edid timings"

Hong-lu Cheng (1):
      drm/amd/display: Remove asserts

Ilya Bakoulin (2):
      drm/amd/display: Fix 128b132b link loss handling
      drm/amd/display: Work around bad DPCD state on link loss

James Zhu (1):
      drm/amdgpu: share drm device for pci amdgpu device with 1st partition device

Jiadong Zhu (1):
      drm/amdgpu: Skip mark offset for high priority rings

Kenneth Feng (1):
      drm/amd/pm: add abnormal fan detection for smu 13.0.0

Le Ma (1):
      drm/amdgpu: remove duplicated doorbell range init for sdma v4.4.2

Leo Chen (1):
      drm/amd/display: disable seamless boot if force_odm_combine is enabled

Lijo Lazar (7):
      drm/amdgpu: Move calculation of xcp per memory node
      drm/amdgpu: Add vbios attribute only if supported
      drm/amdgpu: Modify for_each_inst macro
      drm/amd/pm: Provide energy data in 15.625mJ units
      drm/amd/pm: Enable pp_feature attribute
      drm/amd/pm: Add GFX v9.4.3 unique id to sysfs
      drm/amdgpu: Keep non-psp path for partition switch

Mangesh Gadre (1):
      drm/amdgpu:Remove sdma halt/unhalt during frontdoor load

Mario Limonciello (7):
      drm/amd: Disable PSR-SU on Parade 0803 TCON
      drm/amd: Don't try to enable secure display TA multiple times
      drm/amd/display: Correct `DMUB_FW_VERSION` macro
      drm/amd/display: Set minimum requirement for using PSR-SU on Rembrandt
      drm/amd/display: Set minimum requirement for using PSR-SU on Phoenix
      Revert "drm/amd: Disable PSR-SU on Parade 0803 TCON"
      drm/amd: Don't initialize PSP twice for Navi3x

Melissa Wen (1):
      drm/amd/display: program DPP shaper and 3D LUT if updated

Mingtong Bao (1):
      drm/amd/pm: remove unneeded variable

Mukul Joshi (2):
      drm/amdkfd: Enable GWS on GFX9.4.3
      drm/amdkfd: Update interrupt handling for GFX 9.4.3

Nathan Chancellor (2):
      drm/amdgpu: Remove CONFIG_DEBUG_FS guard around body of amdgpu_rap_debugfs_init()
      drm/amdgpu: Move clocks closer to its only usage in amdgpu_parse_cg_state()

Samuel Pitoiset (1):
      drm/amdgpu: fix clearing mappings for BOs that are always valid in VM

Sridevi Arvindekar (1):
      drm/amd/display: add missing ABM registers

Sung-huai Wang (1):
      drm/amd/display: add a NULL pointer check

Tao Zhou (1):
      drm/amdgpu: check RAS irq existence for VCN/JPEG

Wang Ming (1):
      amd/display/dc: remove repeating expression

Xiaogang Chen (1):
      drm/amdgpu: remove vm sanity check from amdgpu_vm_make_compute

YiPeng Chai (1):
      drm/amdgpu: gpu recovers from fatal error in poison mode

Zhigang Luo (2):
      drm/amdgpu: Skip TMR for MP0_HWIP 13.0.6
      drm/amdgpu: port SRIOV VF missed changes

shanzhulig (1):
      drm/amdgpu: Fix potential fence use-after-free v2

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c       |   9 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.h       |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |  18 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  17 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  29 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c            |   2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  11 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c       |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   3 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  24 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c            |  13 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  43 +++++-
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             |  13 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |  18 +--
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |  44 +++++-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |  29 ++++
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   9 ++
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |  35 +++--
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   4 +
 drivers/gpu/drm/amd/amdkfd/soc15_int.h             |   1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  21 +--
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  | 156 ++++++++++++++++++++-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  26 ++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |   3 +-
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |  43 +++++-
 drivers/gpu/drm/amd/display/dc/core/dc.c           | 141 ++++++++++++++++++-
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |  16 ++-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   7 +
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |   1 +
 drivers/gpu/drm/amd/display/dc/dce/dce_abm.h       |  29 +++-
 .../drm/amd/display/dc/dce112/dce112_resource.c    |  10 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c |  19 ++-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.h |   1 +
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  11 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dwb_cm.c    |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |   2 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |   6 +-
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |   3 +-
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |   1 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c    |   2 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c   |  30 +---
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.h   |   4 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_init.c    |   2 +-
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |  15 +-
 .../drm/amd/display/dc/dcn315/dcn315_resource.c    |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.c  |   1 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |  18 +--
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c  |   1 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |   2 +
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |   3 +-
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |   3 +
 .../amd/display/dc/dml/dcn20/display_mode_vba_20.c |  16 ++-
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c |   2 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |  90 +++++++++++-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.h   |   4 -
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c | 102 ++++++++++++--
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.h |   4 -
 .../drm/amd/display/dc/dml/display_mode_structs.h  |   1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |   1 +
 .../drm/amd/display/dc/inc/hw_sequencer_private.h  |   2 +-
 .../dc/link/protocols/link_dp_irq_handler.c        |  37 ++++-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |   4 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |   5 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.h  |   2 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn314.c |   5 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn314.h |   2 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |  11 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  81 +++++------
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |   2 +
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |  48 +++++++
 .../drm/amd/pm/powerplay/hwmgr/hardwaremanager.c   |   4 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |   2 +
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c    |  27 ++--
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |  10 ++
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c  |   4 +
 .../drm/amd/pm/powerplay/hwmgr/vega12_thermal.c    |   4 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c  |   4 +
 .../drm/amd/pm/powerplay/hwmgr/vega20_thermal.c    |   4 +-
 drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h       |   2 +
 drivers/gpu/drm/amd/pm/powerplay/inc/power_state.h |   1 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  34 +++++
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   2 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |  10 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |   9 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   9 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   1 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   4 +-
 103 files changed, 1201 insertions(+), 311 deletions(-)
