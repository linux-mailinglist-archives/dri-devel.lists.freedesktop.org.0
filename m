Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC0041A153
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 23:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D066E860;
	Mon, 27 Sep 2021 21:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587576E860;
 Mon, 27 Sep 2021 21:27:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NgC0Trvjcz8HluFpf0HIpI1G6z2/KUqNf4Qxrmgsqe49p35Hjf7UY7akKXSaGCn32W8KfXSvf+QQJJ84lxxIwrwY3gUVprSP1LhRdjHKcFUnJ7gNtYUfv64/Wgbc9YDYmawb3mTDkO50DVB21iIAHVHwRJI3JPBRNqKkgnAQPh8vrQC+fRO/LIRbyNR3JuC+K6X8OBX82WrUjR/t1Whp/zTNOzAtIiuyaX6G/TogrCcRz9XH26w7JBTU3EzboRL1sHXq5KmrHgb0HM9xlijd+gEmu4m3YQ7AFTc0PQgHdjEJCrOe2cFVFHDb1QeegWufnj+VJcra0hv8vi+2pVTNmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=722k4BdGfNryLCE1yCaWYYFVtk2Ml8mi/s6fPcTNWzo=;
 b=nMbXeCeH9463Jus8/fn1ljLeaLvQUR1r/fqnS/Z60j+0D9PxTsFkemF4Gk8opaxqXd3THWXs7hO26RxqTfR3L6niQ+fjCdrSJzuyeww9Z7+qTGoCILim34Ez6mBnFYpm5gwAKrWJxkmOvmsjjmQpOyc0j94z1Hk8JbQmIll8mL31ewdcbb8MzDtNh2gG8ZRUwNYmXHT/eKzt0STQegnmiDnSSleH23q/0BF+unTiuzfW4RjWwBuldhrSqgj4Zt+W5RRk2ps5Kh9N9vKE2j6fHluxJOUrGNXokH2YZFKcZh3jYq16SzD64cUazYL/p3mOY9vQPLbkY6ZLGdTemf0nMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=722k4BdGfNryLCE1yCaWYYFVtk2Ml8mi/s6fPcTNWzo=;
 b=kCpv9d2gS/UuCqUtC17Rk8sgdOtpY0ndG3K+i7iUrH6h9/BjZl8Y8V3cMCLGpaaMJ8VOJ8+/Hzho3Auyo23edYtKbC4EdDRDJDJmqy4DU622rAjHnoNuGGLs2y5vl8E5Tc9+6aDJ7BHqyDnyXqRewMB9IBc8Jr0K3qLStbVmtLQ=
Received: from BN0PR04CA0091.namprd04.prod.outlook.com (2603:10b6:408:ec::6)
 by BN6PR12MB1731.namprd12.prod.outlook.com (2603:10b6:404:106::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Mon, 27 Sep
 2021 21:27:07 +0000
Received: from BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ec:cafe::93) by BN0PR04CA0091.outlook.office365.com
 (2603:10b6:408:ec::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Mon, 27 Sep 2021 21:27:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT029.mail.protection.outlook.com (10.13.177.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 21:27:07 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 27 Sep
 2021 16:27:05 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-5.16
Date: Mon, 27 Sep 2021 17:26:53 -0400
Message-ID: <20210927212653.4575-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78297890-2fc0-4e2f-3ef3-08d981fd8ef4
X-MS-TrafficTypeDiagnostic: BN6PR12MB1731:
X-Microsoft-Antispam-PRVS: <BN6PR12MB173180E28099A49C3819AEB1F7A79@BN6PR12MB1731.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:13;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KS3CmLyLtoWFqbtfyL8d7s0o/p5OLAf1xTIu+CxaemC0xkV//u8Bf8PZYjXUDtPWUR5GMx8drLwvTLpTaw6BXpq70Ndv7tMInQwWVr75pj2HXs+qYkAoZXN/nTT1n5NmRfFtlTp1o9wyAm11shcvLuexQsI72SLItvelS5476X8Qaq/1z0ikmEbiEvqoF+0Z1X0yhg5Mi3L0veo7TFg9RJl1+EwAS2aDa+ZSqgVazNf7t6qtWdVUYEHl8Qhadfy8vZnPQrL4Bso6t6xi2XpNhbHhZLDVzjjjYTUoV3aseJyBQcSzVJITxK72vCzjY+nEA0tMx/BfjFjiG4mnSSSeoRsHOq5Mo5+bL8CyjgvgAGQsydmuIYmzRpl8Lucm6h5i3htk1PfQNFlgwT4mz0LnnazM5fW/qw1tjJXQze2DOjoyDi84rPM+70GvjMRLLBrkQDVwjzvFjbfs2RegqLTjpP8ss8iN2xmysHjZ7Kpe5TkNin35eCsXiQRL2fFWgHKP1ceeKEOnaN65bMxo4kjjrwx3r8k7pSoytzlD6nTO2Ple12/krvgPK+wXo4YbnX+MKcwn9g0zXZU5GnKGq2yDcUebqs1vmNYVE30cyYNoYuuNj0BLfiIDcjs3mcuLszSUL9iWTYXtANzfnudCDRDvPsE8HQfy708DigwEpECVU0IRdQaxcHC6Pjm+eJ9gcrS6PlA3q3jIelM7jyl56QIWdlXBmNKcFmC1pyKljfTc1MY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(426003)(81166007)(26005)(47076005)(8936002)(36756003)(110136005)(7696005)(356005)(30864003)(83380400001)(8676002)(1076003)(2616005)(82310400003)(19627235002)(966005)(16526019)(4326008)(86362001)(508600001)(6666004)(5660300002)(2906002)(336012)(36860700001)(66574015)(70206006)(70586007)(186003)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 21:27:07.4286 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78297890-2fc0-4e2f-3ef3-08d981fd8ef4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1731
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

Hi Dave, Daniel,

New stuff for 5.16.

The following changes since commit 8f0284f190e6a0aa09015090568c03f18288231a:

  Merge tag 'amd-drm-next-5.15-2021-08-27' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2021-08-30 09:06:03 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.16-2021-09-27

for you to fetch changes up to 2485e2753ec896b169526e3ef7988589d1c458f5:

  drm/amdgpu: make soc15_common_ip_funcs static (2021-09-23 16:35:27 -0400)

----------------------------------------------------------------
amd-drm-next-5.16-2021-09-27:

amdgpu:
- RAS improvements
- BACO fixes
- Yellow Carp updates
- Misc code cleanups
- Initial DP 2.0 support
- VCN priority handling
- Cyan Skillfish updates
- Rework IB handling for multimedia engine tests
- Backlight fixes
- DCN 3.1 power saving improvements
- Runtime PM fixes
- Modifier support for DCC image stores for gfx 10.3
- Hotplug fixes
- Clean up stack related warnings in display code
- DP alt mode fixes
- Display rework for better handling FP code
- Debugfs fixes

amdkfd:
- SVM fixes
- DMA map fixes

radeon:
- AGP fix

----------------------------------------------------------------
Aaron Liu (1):
      drm/amd/display: setup system context for APUs

Alex Deucher (4):
      drm/amdgpu: add some additional RDNA2 PCI IDs
      drm/amdgpu/display: add a proper license to dc_link_dp.c
      MAINTAINERS: fix up entry for AMD Powerplay
      drm/amdgpu: make soc15_common_ip_funcs static

Alex Sierra (1):
      drm/amdkfd: drop process ref count when xnack disable

Alvin Lee (1):
      drm/amd/display: Update swizzle mode enums

Andrey Grodzovsky (4):
      drm/amd/display: Fix crash on device remove/driver unload
      drm/amdgpu: Fix crash on device remove/driver unload
      drm/amdgpu: Fix MMIO access page fault
      drm/amdgpu: Fix resume failures when device is gone

Angus Wang (1):
      drm/amd/display: cleanup idents after a revert

Anson Jacob (5):
      drm/amd/display: Fix memory leak reported by coverity
      drm/amd/display: dc_assert_fp_enabled assert only if FPU is not enabled
      drm/amd/display: Fix false BAD_FREE warning from Coverity
      drm/amd/display: Fix multiple memory leaks reported by coverity
      drm/amd/display: Revert "Directly retrain link from debugfs"

Anthony Koo (5):
      drm/amd/display: [FW Promotion] Release 0.0.80
      drm/amd/display: [FW Promotion] Release 0.0.81
      drm/amd/display: [FW Promotion] Release 0.0.82
      drm/amd/display: [FW Promotion] Release 0.0.83
      drm/amd/display: [FW Promotion] Release 0.0.84

Aric Cyr (5):
      drm/amd/display: 3.2.150
      drm/amd/display: 3.2.151
      drm/amd/display: 3.2.152
      drm/amd/display: 3.2.153
      drm/amd/display: 3.2.154

Arnd Bergmann (1):
      drm/amd/display: fix empty debug macros

Aurabindo Pillai (2):
      drm/amd/display: Add emulated sink support for updating FS
      drm/amd/display: Add flag to detect dpms force off during HPD

Candice Li (7):
      drm/amd/amdgpu: consolidate PSP TA unload function
      drm/amd/amdgpu: add mpio to ras block
      drm/amdgpu: Create common PSP TA load function
      drm/amdgpu: Unify PSP TA context
      drm/amdgpu: Conform ASD header/loading to generic TA systems
      drm/amdgpu: Update PSP TA unload function
      drm/amdgpu: Remove all code paths under the EAGAIN path in RAS late init

Christian König (2):
      drm/amdgpu: fix use after free during BO move
      drm/amdgpu: remove unused amdgpu_bo_validate

Colin Ian King (7):
      drm/amdgpu/swsmu: fix spelling mistake "minimun" -> "minimum"
      drm/amd/display: fix spelling mistake "alidation" -> "validation"
      drm/amd/display: Fix unused initialization of pointer sink
      drm/amdgpu: clean up inconsistent indenting
      drm/amdgpu: sdma: clean up identation
      drm/radeon/ci_dpm: Remove redundant initialization of variables hi_sidd, lo_sidd
      drm/radeon: make array encoded_lanes static

Dale Zhao (1):
      drm/amd/display: Refine condition of cursor visibility for pipe-split

Eric Yang (1):
      drm/amd/display: Add periodic detection when zstate is enabled

Ernst Sjöstrand (1):
      drm/amd/amdgpu: Increase HWIP_MAX_INSTANCE to 10

Evan Quan (2):
      drm/amdgpu: reenable BACO support for 699F:C7 polaris12 SKU
      drm/amd/pm: fix runpm hang when amdgpu loaded prior to sound driver

Fangzhi Zuo (6):
      drm/amd/display: Add DP 2.0 Audio Package Generator
      drm/amd/display: Add DP 2.0 HPO Stream Encoder
      drm/amd/display: Add DP 2.0 HPO Link Encoder
      drm/amd/display: Add DP 2.0 DCCG
      drm/amd/display: Add DP 2.0 BIOS and DMUB Support
      drm/amd/display: Add DP 2.0 SST DC Support

Felix Kuehling (1):
      drm/amdkfd: make needs_pcie_atomics FW-version dependent

Guchun Chen (2):
      drm/amdgpu: stop scheduler when calling hw_fini (v2)
      drm/amdgpu: move amdgpu_virt_release_full_gpu to fini_early stage

Guo, Bing (1):
      drm/amd/display: Fix issue with dynamic bpp change for DCN3x

Harry Wentland (6):
      drm/amd/display: Get backlight from PWM if DMCU is not initialized
      drm/amd/display: Pass display_pipe_params_st as const in DML
      drm/amd/display: Pass all structs in display_rq_dlg_helpers by pointer
      drm/amd/display: Fix rest of pass-by-value structs in DML
      drm/amd/display: Allocate structs needed by dcn_bw_calc_rq_dlg_ttu in pipe_ctx
      drm/amd/display: Reduce stack size for dml21_ModeSupportAndSystemConfigurationFull

Hayden Goodfellow (1):
      drm/amd/display: Fix wrong format specifier in amdgpu_dm.c

Hersen Wu (1):
      drm/amd/display: dsc mst 2 4K displays go dark with 2 lane HBR3

Ian Chen (1):
      drm/amd/display: remove force_enable_edp_fec param.

Jaehyun Chung (3):
      drm/amd/display: Add regamma/degamma coefficients and set sRGB when TF is BT709
      drm/amd/display: Correct degamma coefficients
      drm/amd/display: Revert adding degamma coefficients

James Zhu (3):
      drm/amdkfd: separate kfd_iommu_resume from kfd_resume
      drm/amdgpu: add amdgpu_amdkfd_resume_iommu
      drm/amdgpu: move iommu_resume before ip init/resume

Jiawei Gu (1):
      drm/amdgpu: enable more pm sysfs under SRIOV 1-VF mode

Jimmy Kizito (5):
      drm/amd/display: Fix dynamic link encoder access.
      drm/amd/display: Fix link training fallback logic
      drm/amd/display: Fix concurrent dynamic encoder assignment
      drm/amd/display: Fix dynamic encoder reassignment
      drm/amd/display: Fix null pointer dereference for encoders

Jing Yangyang (1):
      drm:dcn31: fix boolreturn.cocci warnings

John Clements (6):
      drm/amdgpu: Clear RAS interrupt status on aldebaran
      drm/amdgpu: Update RAS status print
      drm/amdgpu: Update RAS trigger error block support
      drm/amdgpu: Resolve nBIF RAS error harvesting bug
      drm/amdgpu: Updated RAS infrastructure
      drm/amdgpu: Consolidate RAS cmd warning messages

Joshua Ashton (3):
      drm/amd/display: Use dcc_ind_blk value to set register directly
      drm/amd/display: Handle GFX10_RBPLUS modifiers for dcc_ind_blk
      drm/amd/display: Add modifiers capable of DCC image stores for gfx10_3

Josip Pavic (2):
      drm/amd/display: add missing ABM register offsets
      drm/amd/display: unblock abm when odm is enabled only on configs that support it

Jude Shih (1):
      drm/amd/display: Support for DMUB HPD interrupt handling

Kees Cook (1):
      drm/amd/pm: And destination bounds checking to struct copy

Kenneth Feng (1):
      drm/amd/pm: fix the issue of uploading powerplay table

Koba Ko (1):
      drm/amdgpu: Disable PCIE_DPM on Intel RKL Platform

Lai, Derek (1):
      drm/amd/display: Added power down on boot for DCN3

Lang Yu (6):
      drm/amdgpu: show both cmd id and name when psp cmd failed
      drm/amdgpu: fix sysfs_emit/sysfs_emit_at warnings(v2)
      drm/amdgpu: update SMU PPSMC for cyan skilfish
      drm/amdgpu: update SMU driver interface for cyan skilfish(v3)
      drm/amdgpu: add some pptable funcs for cyan skilfish(v3)
      drm/amdgpu: add manual sclk/vddc setting support for cyan skilfish(v3)

Len Baker (1):
      drm/radeon: Prefer kcalloc over open coded arithmetic

Leo (Hanghong) Ma (2):
      drm/amd/display: Add DPCD writes at key points
      drm/amd/display: Fix system hang at boot

Lijo Lazar (1):
      drm/amd/pm: Update intermediate power state for SI

Likun Gao (1):
      drm/amdgpu: refactor function to init no-psp fw

Liu, Zhan (3):
      drm/amd/display: Fix DCN3 B0 DP Alt Mapping
      drm/amd/display: Fix B0 USB-C DP Alt mode
      drm/amd/display: DIG mapping change is causing a blocker

Luben Tuikov (2):
      drm/amdgpu: Fixes to returning VBIOS RAS EEPROM address
      drm/amdgpu: Process any VBIOS RAS EEPROM address

Meenakshikumar Somasundaram (3):
      drm/amd/display: Fix for null pointer access for ddc pin and aux engine.
      drm/amd/display: Link training retry fix for abort case
      drm/amd/display: Creating a fw boot options bit for an upcoming feature

Michael Strauss (5):
      drm/amd/display: Initialize lt_settings on instantiation
      drm/amd/display: Set min dcfclk if pipe count is 0
      drm/amd/display: Add VPG and AFMT low power support for DCN3.1
      drm/amd/display: Enable mem low power control for DCN3.1 sub-IP blocks
      drm/amd/display: Disable mem low power for CM HW block on DCN3.1

Michel Dänzer (1):
      drm/amdgpu: Drop inline from amdgpu_ras_eeprom_max_record_count

Nicholas Kazlauskas (4):
      drm/amdgpu: Enable S/G for Yellow Carp
      drm/amd/display: Add NULL checks for vblank workqueue
      drm/amd/display: Optimize bandwidth on following fast update
      drm/amd/display: Fix white screen page fault for gpuvm

Nikola Cornij (1):
      drm/amd/display: Use adjusted DCN301 watermarks

Nirmoy Das (5):
      drm/amdgpu: rework context priority handling
      drm/amdgpu: detach ring priority from gfx priority
      drm/amdgpu: use IS_ERR for debugfs APIs
      drm/amdgpu: cleanup debugfs for amdgpu rings
      drm/radeon: pass drm dev radeon_agp_head_init directly

Paul Menzel (1):
      drm/amdgpu: Demote TMZ unsupported log message from warning to info

Philip Yang (5):
      drm/amdgpu: fix fdinfo race with process exit
      drm/amdkfd: SVM map to gpus check vma boundary
      drm/amdkfd: fix dma mapping leaking warning
      drm/amdkfd: handle svm migrate init error
      drm/amdkfd: fix svm_migrate_fini warning

Qingqing Zhuo (4):
      drm/amd/display: Revert "dc: w/a for hard hang on HPD on native DP"
      drm/amd/display: Apply w/a for hard hang on HPD
      drm/amd/display: Fix unstable HPCP compliance on Chrome Barcelo
      drm/amd/display: Extend w/a for hard hang on HPD to dcn20

Roman Li (2):
      drm/amd/display: Use max target bpp override option
      drm/amd/display: Limit max DSC target bpp for specific monitors

Roy Sun (1):
      drm/amd/amdgpu: Enable some sysnodes for guest smi

Satyajit Sahu (3):
      drm/amdgpu/vce: set the priority for each ring
      drm/amdgpu/vcn: set the priority for each encode ring
      drm/amdgpu:schedule vce/vcn encode based on priority

Simon Ser (2):
      amd/display: downgrade validation failure log level
      amd/display: enable panel orientation quirks

Tom St Denis (1):
      drm/amd/amdgpu: New debugfs interface for MMIO registers (v5)

Wayne Lin (2):
      drm/amd/display: Add option to defer works of hpd_rx_irq
      drm/amd/display: Fork thread to offload work of hpd_rx_irq

Wenjing Liu (3):
      drm/amd/display: expose dsc overhead bw in dc dsc header
      drm/amd/display: move bpp range decision in decide dsc bw range function
      drm/amd/display: update conditions to do dfp cap ext validation

Wyatt Wood (1):
      drm/amd/display: Initialize GSP1 SDP header

Yifan Zha (1):
      drm/amd/pm: Update navi12 smu message mapping table in sriov

Yifan Zhang (1):
      drm/amdgpu: correct comments in memory type managers

YuBiao Wang (1):
      drm/amd/amdgpu: Add ready_to_reset resp for vega10

chongjiapeng (2):
      drm/amd/display: Fix warning comparing pointer to 0
      drm/amd/display: make configure_lttpr_mode_transparent and configure_lttpr_mode_non_transparent static

shaoyunl (1):
      drm/amdgpu:  Get atomicOps info from Host for sriov setup

xinhui pan (8):
      drm/amdgpu: Fix a deadlock if previous GEM object allocation fails
      drm/amdgpu: Increase direct IB pool size
      drm/amdgpu: UVD avoid memory allocation during IB test
      drm/amdgpu: VCE avoid memory allocation during IB test
      drm/amdgpu: VCN avoid memory allocation during IB test
      drm/amdgpu: Fix a race of IB test
      drm/amdgpu: Put drm_dev_enter/exit outside hot codepath
      drm/amdgpu: Fix uvd ib test timeout when use pre-allocated BO

 MAINTAINERS                                        |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |    7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |   50 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |  143 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h            |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |  170 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h        |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   45 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   21 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c         |   11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |    8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |   11 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   30 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |    7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |    9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c            |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   34 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  623 +++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |   46 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  175 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   27 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h     |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |   18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |   19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c          |   44 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |  166 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umr.h            |   51 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |  113 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.h            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |   41 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |  111 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |    9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   28 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |    4 +-
 drivers/gpu/drm/amd/amdgpu/mca_v3_0.c              |    9 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |    2 +
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.h              |    1 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |   64 +-
 drivers/gpu/drm/amd/amdgpu/psp_v10_0.c             |   22 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |   40 +-
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c             |   14 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |    8 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |    4 +-
 drivers/gpu/drm/amd/amdgpu/soc15.h                 |    2 -
 drivers/gpu/drm/amd/amdgpu/ta_ras_if.h             |   46 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c              |   24 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c              |   24 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c              |   24 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c              |   11 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |   43 +-
 drivers/gpu/drm/amd/amdgpu/vce_v2_0.c              |   23 +-
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c              |   32 +-
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c              |   48 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |    4 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |   12 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |   21 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |    5 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |    9 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   57 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |   16 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h           |    5 -
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |    1 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   27 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  570 ++++++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   91 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |    3 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |   16 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   49 +
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   22 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.h    |   11 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c     |    2 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |   10 +
 .../gpu/drm/amd/display/dc/bios/command_table2.c   |   10 +
 drivers/gpu/drm/amd/display/dc/calcs/dcn_calcs.c   |   55 +-
 .../amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c   |   12 +-
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |   16 +-
 .../drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c |    4 +-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |    6 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   49 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |  565 +++++++-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   | 1363 +++++++++++++++++++-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dpcd.c |   11 +-
 .../gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c  |  476 +++++--
 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c |  358 ++++-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  138 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   36 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |  222 ++++
 drivers/gpu/drm/amd/display/dc/dc_dsc.h            |   11 +-
 drivers/gpu/drm/amd/display/dc/dc_link.h           |   16 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   21 +
 drivers/gpu/drm/amd/display/dc/dce/dce_abm.h       |   16 +
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |   16 +-
 .../gpu/drm/amd/display/dc/dce/dce_panel_cntl.c    |   10 -
 .../drm/amd/display/dc/dce/dce_stream_encoder.c    |    2 +
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |  164 ++-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |  114 +-
 .../drm/amd/display/dc/dcn10/dcn10_link_encoder.c  |    9 +
 .../drm/amd/display/dc/dcn10/dcn10_link_encoder.h  |    1 +
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |    2 +-
 .../amd/display/dc/dcn10/dcn10_stream_encoder.c    |   30 +
 .../amd/display/dc/dcn10/dcn10_stream_encoder.h    |    2 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |   45 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |   29 +-
 .../amd/display/dc/dcn20/dcn20_stream_encoder.c    |    8 +-
 .../amd/display/dc/dcn20/dcn20_stream_encoder.h    |    1 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c  |   24 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.h  |   24 +
 .../amd/display/dc/dcn30/dcn30_dio_link_encoder.c  |    4 +
 .../display/dc/dcn30/dcn30_dio_stream_encoder.c    |   20 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c  |    6 -
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c  |    1 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |   17 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |    8 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.h  |    7 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_vpg.c   |  200 ++-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_vpg.h   |   15 +-
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |  102 +-
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |    8 +-
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |    8 +-
 drivers/gpu/drm/amd/display/dc/dcn31/Makefile      |    4 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_afmt.c  |   92 ++
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_afmt.h  |  126 ++
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c   |  173 +++
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.h   |  115 ++
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c  |  162 +++
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.h  |   18 +
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  |   43 +-
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.h  |   11 +-
 .../display/dc/dcn31/dcn31_hpo_dp_link_encoder.c   |  616 +++++++++
 .../display/dc/dcn31/dcn31_hpo_dp_link_encoder.h   |  222 ++++
 .../display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c |  752 +++++++++++
 .../display/dc/dcn31/dcn31_hpo_dp_stream_encoder.h |  241 ++++
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |   30 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.h |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c  |    3 +-
 .../drm/amd/display/dc/dcn31/dcn31_panel_cntl.c    |    4 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |  318 ++++-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_vpg.c   |   87 ++
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_vpg.h   |  162 +++
 drivers/gpu/drm/amd/display/dc/dm_cp_psp.h         |    1 +
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |    6 +
 .../display/dc/dml/dcn20/display_mode_vba_20v2.c   |    2 +-
 .../display/dc/dml/dcn20/display_rq_dlg_calc_20.c  |  158 +--
 .../display/dc/dml/dcn20/display_rq_dlg_calc_20.h  |    4 +-
 .../dc/dml/dcn20/display_rq_dlg_calc_20v2.c        |  156 +--
 .../dc/dml/dcn20/display_rq_dlg_calc_20v2.h        |    4 +-
 .../amd/display/dc/dml/dcn21/display_mode_vba_21.c |  236 ++--
 .../display/dc/dml/dcn21/display_rq_dlg_calc_21.c  |  156 +--
 .../display/dc/dml/dcn21/display_rq_dlg_calc_21.h  |    4 +-
 .../display/dc/dml/dcn30/display_rq_dlg_calc_30.c  |  132 +-
 .../display/dc/dml/dcn30/display_rq_dlg_calc_30.h  |    4 +-
 .../display/dc/dml/dcn31/display_rq_dlg_calc_31.c  |  166 +--
 .../display/dc/dml/dcn31/display_rq_dlg_calc_31.h  |    4 +-
 .../drm/amd/display/dc/dml/display_mode_enums.h    |    4 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.h  |    4 +-
 .../amd/display/dc/dml/display_rq_dlg_helpers.c    |  256 ++--
 .../amd/display/dc/dml/display_rq_dlg_helpers.h    |   20 +-
 .../amd/display/dc/dml/dml1_display_rq_dlg_calc.c  |  246 ++--
 .../amd/display/dc/dml/dml1_display_rq_dlg_calc.h  |   10 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |  195 ++-
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   33 +-
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |   24 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |   23 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h  |    4 +
 .../gpu/drm/amd/display/dc/inc/hw/link_encoder.h   |   97 ++
 .../gpu/drm/amd/display/dc/inc/hw/stream_encoder.h |   87 +-
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |    3 +
 drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |    2 +-
 .../drm/amd/display/dc/inc/hw_sequencer_private.h  |    3 +
 drivers/gpu/drm/amd/display/dc/inc/link_enc_cfg.h  |   26 +-
 drivers/gpu/drm/amd/display/dc/inc/link_hwss.h     |    1 +
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |   18 +
 .../amd/display/dc/irq/dcn20/irq_service_dcn20.c   |   25 +
 .../amd/display/dc/irq/dcn20/irq_service_dcn20.h   |    2 +
 .../amd/display/dc/irq/dcn21/irq_service_dcn21.c   |   25 +
 .../amd/display/dc/irq/dcn21/irq_service_dcn21.h   |    2 +
 drivers/gpu/drm/amd/display/dc/irq/irq_service.c   |    2 +-
 drivers/gpu/drm/amd/display/dc/irq/irq_service.h   |    4 +
 .../display/dc/virtual/virtual_stream_encoder.c    |    5 +-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |    4 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   34 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |    8 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.h  |    2 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |   10 +-
 .../drm/amd/display/include/bios_parser_types.h    |    8 +
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |    2 +-
 drivers/gpu/drm/amd/display/include/dpcd_defs.h    |   17 +
 .../gpu/drm/amd/display/include/grph_object_defs.h |   12 +
 .../gpu/drm/amd/display/include/grph_object_id.h   |    8 +
 .../drm/amd/display/include/link_service_types.h   |   57 +-
 drivers/gpu/drm/amd/display/include/logger_types.h |    6 +
 .../drm/amd/display/modules/color/color_gamma.c    |   32 +-
 .../amd/include/asic_reg/dpcs/dpcs_4_2_0_offset.h  |   27 +
 drivers/gpu/drm/amd/include/atomfirmware.h         |    4 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   12 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h            |   24 +
 .../amd/pm/inc/smu11_driver_if_cyan_skillfish.h    |   86 +-
 drivers/gpu/drm/amd/pm/inc/smu_types.h             |    5 +-
 drivers/gpu/drm/amd/pm/inc/smu_v11_8_ppsmc.h       |    9 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |   17 +-
 drivers/gpu/drm/amd/pm/powerplay/si_dpm.c          |    2 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |    2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |   14 +-
 .../drm/amd/pm/swsmu/smu11/cyan_skillfish_ppt.c    |  481 +++++++
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |   50 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |    8 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |   18 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |    4 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |   17 +-
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |    8 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   21 +
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |   15 +
 drivers/gpu/drm/radeon/ci_dpm.c                    |    3 +-
 drivers/gpu/drm/radeon/r600_dpm.c                  |   10 +-
 drivers/gpu/drm/radeon/radeon_kms.c                |    2 +-
 229 files changed, 11300 insertions(+), 2857 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_umr.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_afmt.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_afmt.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_link_encoder.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_link_encoder.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_vpg.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_vpg.h
