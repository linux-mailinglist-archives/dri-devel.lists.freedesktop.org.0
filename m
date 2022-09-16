Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E162A5BB055
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 17:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1351610ED6B;
	Fri, 16 Sep 2022 15:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9333710ED6B;
 Fri, 16 Sep 2022 15:36:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ns12dGU1jVyvE+NwsKnEQMKGu8o9EH0skkfgh3xPYoHA4KOTjKp/URK4KdToJ8xUbWty44Z6HDoRAot4cGVpVc7iWuy+FWA3hUnGKpcEv0P/+LNOly/5PefmiFgkwAPPpSZfmZjQ4qz/PcmfFRX1mtXi9GWAArRDwWalqO397L4weRCVrHKfK8SURmvSxZOO7hSzfUHwh2w/XEYdlxEIRs2sx077H/Ez2gA9ZCJ0+ymrH73AVN7re+9ci+6mibvXchacPdEwAMu2gfS3g1owTAScZ5UsK/ILuq2z3rM/mUNa7LRoDkMnjGbMAoUJSsX+rCO4M0UGWIO8YkE3s4D17Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCNuqVU5f1Q5nwzMiEvkHKsvHWtMtaYNgnueXJx8vLk=;
 b=d3BJmmEMUrRyXBW57WdH+uo3cOsU/1BXFM1o11c6goJGxJAeCuX/sI3izvhYcKe2KbTsLpX6KNMdRnlqLUnoKEmTCWQnypnR4kL9NOTP4Q7veF+48E/8C71p3s/+EFENIQSo9EpKYLo6cMkJOMyMdUcyjvSkrrVjvFuApRV7revuhd32IRSeQ2C+snIa5VkMCuIh7huMF5UcVuI65t4jlcLggNqLaf4LZW88GaOGmhm82hBRgeRhAVsESuh8pxRJXSyEhtKdS89kP/t8Mp+waveNXo/HYiNzfBd0koVcBYfYDVPEh4nBIz0YW7E36a8jG/GquQ+ZTSOTR21IYIFhaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCNuqVU5f1Q5nwzMiEvkHKsvHWtMtaYNgnueXJx8vLk=;
 b=08nAlAN56Llfy/+C85BVUk+S1JBPztuUB2R2rHBg5TDTU0vGagNRp+Lhz+EKfvhzCKKUIxgGN2bolHFhpkq4kE7qa+wc0pYtvdeHhWPIgbXsM9SNDhVvx0c692uBRY2w93vC/ibXI7rodVo8V8uI9F0tgUyQ2lCX3GuPP4zWw2Y=
Received: from MW4PR03CA0265.namprd03.prod.outlook.com (2603:10b6:303:b4::30)
 by DS0PR12MB7654.namprd12.prod.outlook.com (2603:10b6:8:11d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Fri, 16 Sep
 2022 15:36:53 +0000
Received: from CO1NAM11FT102.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b4:cafe::b0) by MW4PR03CA0265.outlook.office365.com
 (2603:10b6:303:b4::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16 via Frontend
 Transport; Fri, 16 Sep 2022 15:36:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT102.mail.protection.outlook.com (10.13.175.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5632.12 via Frontend Transport; Fri, 16 Sep 2022 15:36:53 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 16 Sep
 2022 10:36:52 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-6.1
Date: Fri, 16 Sep 2022 11:36:38 -0400
Message-ID: <20220916153638.6501-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT102:EE_|DS0PR12MB7654:EE_
X-MS-Office365-Filtering-Correlation-Id: 47587594-3543-4b92-a6e4-08da97f947fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W1u7BelxTC+nlc8TwJvCn0aijKP9K6BRYvCFmFBUUTg0MX3xdLR7tqhApt4gLpepp8HVZx8DF281WDuzCehriK/eoojh8rplK2sVoAVLr/v7Puyr42nfgbRVvTaA0TmA1YxVM8skiWmlDwUK7j2gdHqxEPtxqIE9VAhJpDeUT1+x8ANyt0MGhTpjHOab0n/C93rlj4zqMYneNuh5zh0AbGFQ4ekOUcqMkWV4ByectBTteJvUAgEb+xyzzkH39wtRX5pwdNP4Ni1oHksi2Ya4wfcxYeoZZWKL8qyQPeMBzxRWH5Tu3RGiESBDIlM76KVHnAxxFialvAhdKgteXND5w1Kc7ZggMBQnqydILr6FE/zhAb5WE/RphuwNCw9bffd/wA+26H72dzfrp+xz/sT8gvH+pgsznNoo4to5kQjs4JROKsAbSMMz/AA52l4sMwyfq0z7pWsFRJCZt5LgWGTunQVut/5j0kEByBt0OIvAdrD6lwBBUzxRwc1g63EVzNMgNQys/ZI0HUiwfTx7eBKu0G+Ax17B2CzbpWlQrXi8mqpLNz/Luvv7OrnaSsm/bTAE2YRYPyOwUhmkjgfor8BaYxZmsUy9nk869yJikS+mGzpI7vjn3q+Dh83xv5eDGQJThQ/aMZcHW+pj3InYeOBEJKoMIULCkqo/+O6gTkEcV9ZBaDyCEGMuddcGAN1595xI/13d6RZXAWa77XJuCARZmppaAYZMBicnPwJbDiuxzUp3iQz+YHZQNTBs86GBMGuH
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199015)(46966006)(36840700001)(40470700004)(82310400005)(2616005)(356005)(70206006)(316002)(70586007)(16526019)(336012)(6666004)(426003)(40480700001)(66574015)(47076005)(36756003)(86362001)(7696005)(478600001)(8676002)(41300700001)(4326008)(40460700003)(966005)(110136005)(30864003)(1076003)(8936002)(81166007)(82740400003)(2906002)(186003)(83380400001)(26005)(5660300002)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 15:36:53.4797 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47587594-3543-4b92-a6e4-08da97f947fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT102.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7654
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

Updates for 6.1.

The following changes since commit 213cb76ddc8b875e772f9f4d173feefa122716af:

  Merge tag 'drm-intel-gt-next-2022-09-09' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2022-09-12 21:12:23 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.1-2022-09-16

for you to fetch changes up to dacd2d2d9d800b7ab2ee2734578112532cba8105:

  drm/amd/display: fix boolconv.cocci warning (2022-09-14 12:38:53 -0400)

----------------------------------------------------------------
amd-drm-next-6.1-2022-09-16:

amdgpu:
- PCI AER fixes
- BACO fix
- RAS fixes
- XGMI fixes
- Display SubVP fixes
- DCN 3.2 updates
- DCN 3.1.4 updates
- LLVM fixes
- CS cleanup in preparation for gang submit
- Add some new GC CG registers
- Misc cleanups

amdkfd:
- Fix CRIU regression
- CPU fault on COW mapping fixes
- Prefault fixes
- Misc cleanups

radeon:
- Misc cleanups

----------------------------------------------------------------
Alex Deucher (5):
      drm/amdgpu: add HDP remap functionality to nbio 7.7
      drm/amdgpu: fix warning about missing imu prototype
      drm/amdgpu: move nbio ih_doorbell_range() into ih code for vega
      drm/amdgpu: move nbio sdma_doorbell_range() into sdma code for vega
      drm/amdgpu: make sure to init common IP before gmc

Alvin Lee (4):
      drm/amd/display: Update MBLK calculation for SubVP
      drm/amd/display: SW cursor fallback for SubVP
      drm/amd/display: Update viewport position for phantom pipes
      drm/amd/display: Refactor SubVP calculation to remove FPU

Aric Cyr (4):
      drm/amd/display: Optimizations for DML math
      drm/amd/display: Fix divide by zero in DML
      drm/amd/display: Don't adjust VRR unnecessarily
      drm/amd/display: 3.2.202

Aurabindo Pillai (3):
      drm/amd/display: Revert "Fallback to SW cursor if SubVP + cursor too big"
      drm/amd/display: add workaround for subvp cursor corruption for DCN32/321
      drm/amd/display: Fix register definitions for DCN32/321

Candice Li (4):
      drm/amdgpu: Rely on MCUMC_STATUS for umc v8_10 correctable error counter only
      drm/amdgpu: Enable full reset when RAS is supported on gc v11_0_0
      drm/amdgpu: Add EEPROM I2C address for smu v13_0_0
      drm/amdgpu: Skip reset error status for psp v13_0_0

Charlene Liu (1):
      drm/amd/display: update header files

Chris Park (1):
      drm/amd/display: Correct I2C register offset

Christian König (6):
      drm/amdgpu: remove SRIOV and MCBP dependencies from the CS
      drm/amdgpu: move setting the job resources
      drm/amdgpu: revert "partial revert "remove ctx->lock" v2"
      drm/amdgpu: use DMA_RESV_USAGE_BOOKKEEP v2
      drm/amdgpu: cleanup CS init/fini and pass1
      drm/amdgpu: reorder CS code

Duncan Ma (1):
      drm/amd/display: Correct dram channel width for dcn314

Guchun Chen (1):
      drm/amd/pm: disable BACO entry/exit completely on several sienna cichlid cards

Hamza Mahfooz (1):
      drm/amdgpu: use dirty framebuffer helper

JeromeHong (1):
      drm/amd/display: Avoid force minimal transaction in case of surface_count equal to 0

Jiapeng Chong (13):
      drm/amd/display: make enc32_stream_encoder_dvi_set_stream_attribute static
      drm/amd/display: make dscl32_calc_lb_num_partitions static
      drm/amd/display: make dcn32_link_encoder_is_in_alt_mode and dcn32_link_encoder_get_max_link_cap static
      drm/amd/display: make mpc32_program_shaper and mpc32_program_3dlut static
      drm/amd/display: Remove the unused function copy_stream_update_to_stream()
      drm/amd/display: make some functions static
      drm/amd/display: make enc314_stream_encoder_dvi_set_stream_attribute static
      drm/amd/display: make optc314_phantom_crtc_post_enable static
      drm/amd/display: make some functions static
      drm/amd/display: make mmhubbub32_config_mcif_buf static
      drm/amd/display: make some functions static
      drm/amd/display: make some functions static
      drm/amd/display: make optc32_phantom_crtc_post_enable, optc32_setup_manual_trigger and optc32_set_drr static

Jilin Yuan (1):
      drm/amd/display: fix repeated words in comments

JinZe.Xu (1):
      drm/amd/display: Assign link type before check dsc workaround.

Jingyu Wang (5):
      drm/amdgpu: cleanup coding style in amdgpu_acpi.c
      drm/amdgpu: cleanup coding style in amdgpu_sync.c file
      drm/amdgpu: cleanup coding style in amdgpu_amdkfd.c
      drm/amdgpu: cleanup coding style in amdgpu_amdkfd_gpuvm.c
      drm/amdgpu/display: remove unneeded "default n" options

John Clements (1):
      drm/amdgpu: added support for ras driver loading

Lee, Alvin (1):
      drm/amd/display: Added debug option for forcing subvp num ways

Leo Chen (2):
      drm/amd/display: Fixing DIG FIFO Error
      drm/amd/display: Adding log for spread_spectrum_info

Li Ma (1):
      drm/amd/pm:add new gpu_metrics_v2_3 to acquire average temperature info

Lijo Lazar (1):
      drm/amdgpu: Don't enable LTR if not supported

Nagulendran, Iswara (1):
      drm/amd/display: Reverted DSC programming sequence change

Nathan Chancellor (5):
      drm/amd/display: Reduce number of arguments of dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport()
      drm/amd/display: Reduce number of arguments of dml32_CalculatePrefetchSchedule()
      drm/amd/display: Reduce number of arguments of dml31's CalculateWatermarksAndDRAMSpeedChangeSupport()
      drm/amd/display: Reduce number of arguments of dml31's CalculateFlipSchedule()
      drm/amd/display: Mark dml30's UseMinimumDCFCLK() as noinline for stack usage

Nicholas Kazlauskas (2):
      drm/amd/display: Hook up DCN314 specific dml implementation
      drm/amd/display: Relax swizzle checks for video non-RGB formats on DCN314

Philip Yang (3):
      drm/amdkfd: handle CPU fault on COW mapping
      drm/amdkfd: Remove prefault before migrating to VRAM
      drm/amdkfd: Migrate in CPU page fault use current mm

Rafael Mendonca (1):
      drm/amdgpu: Fix memory leak in hpd_rx_irq_create_workqueue()

Rajneesh Bhardwaj (1):
      drm/amdkfd: Fix CRIU restore op due to doorbell offset

Rodrigo Siqueira (2):
      drm/amd/display: Fix compilation errors on DCN314
      drm/amd/display: Enable dlg and vba compilation for dcn314

Taimur Hassan (1):
      drm/amd/display: Round cursor width up for MALL allocation

Tom St Denis (1):
      drm/amd/amdgpu: update GC 10.3.0 pwrdec

Vignesh Chander (1):
      drm/amdgpu: Fix hive reference count leak

Xu Panda (1):
      drm/amd/display/amdgpu_dm: remove duplicate included header files

Yang Li (3):
      drm/amd/display: clean up some inconsistent indentings
      drm/amd/display: Simplify bool conversion
      drm/amd/display: remove possible condition with no effect (if == else)

Yang Wang (1):
      drm/amdgpu: change the alignment size of TMR BO to 1M

Yao Wang1 (1):
      drm/amd/display: Limit user regamma to a valid value

Yihao Han (1):
      drm/amd/display: fix boolconv.cocci warning

shaoyunl (1):
      drm/amdgpu: Use per device reset_domain for XGMI on sriov configuration

wangjianli (1):
      amd/amdkfd: fix repeated words in comments

ye xingchen (2):
      drm/radeon/ci_dpm: Remove the unneeded result variable
      drm/radeon: Remove the unneeded result variable

zhang songyi (1):
      drm/amdgpu: Remove the unneeded result variable

 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   30 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             | 1349 +++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |    2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h            |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   36 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   17 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h            |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |    7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c           |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c        |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |   37 +-
 drivers/gpu/drm/amd/amdgpu/imu_v11_0_3.c           |    1 +
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             |    9 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v6_1.c             |    9 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |    9 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c             |    9 +
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |    7 +
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |    5 +
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |    5 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   25 -
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |    1 +
 drivers/gpu/drm/amd/amdgpu/umc_v8_10.c             |   12 +-
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c             |    4 +
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |    4 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |    6 +
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |    2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c          |    3 +
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |   57 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |    7 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   22 -
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |    2 -
 drivers/gpu/drm/amd/display/Kconfig                |    2 -
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   22 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |    1 -
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |   20 +
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |    2 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   25 +-
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |    4 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |   16 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |    2 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |    4 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   89 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_audio.c     |    2 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |   13 -
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |    7 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_mmhubbub.c  |    3 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_mmhubbub.h  |    8 -
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |    4 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c    |    6 +-
 .../display/dc/dcn314/dcn314_dio_stream_encoder.c  |    5 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_optc.c    |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c  |    8 +-
 .../amd/display/dc/dcn32/dcn32_dio_link_encoder.c  |    4 +-
 .../display/dc/dcn32/dcn32_dio_stream_encoder.c    |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dpp.c   |    2 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c    |    8 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.c  |   24 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |   56 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h |    4 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c  |    1 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.c  |    2 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.h  |   10 -
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c   |    6 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c  |    6 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |   40 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |  236 ++--
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |   62 +-
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |   37 +-
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |    3 +
 .../drm/amd/display/dc/dml/calcs/dcn_calc_auto.c   |   22 +-
 .../drm/amd/display/dc/dml/calcs/dcn_calc_math.c   |   16 +-
 .../display/dc/dml/dcn20/display_mode_vba_20v2.c   |   10 +-
 .../amd/display/dc/dml/dcn21/display_mode_vba_21.c |    6 +-
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |   10 +-
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |  426 ++----
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c |    5 +-
 .../display/dc/dml/dcn314/display_mode_vba_314.c   |   19 +-
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |  260 ++--
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |  360 +++--
 .../dc/dml/dcn32/display_mode_vba_util_32.h        |   51 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.c  |   12 +
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.h  |    1 +
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.h  |   10 +-
 .../gpu/drm/amd/display/dc/dml/dml_inline_defs.h   |    9 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |    1 +
 drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |    5 +
 .../drm/amd/display/modules/color/color_gamma.c    |    4 +
 .../drm/amd/include/asic_reg/gc/gc_10_3_0_offset.h |  100 ++
 .../amd/include/asic_reg/gc/gc_10_3_0_sh_mask.h    | 1459 +++++++++++++++++++-
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |   58 +
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   11 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |  160 ++-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |    3 +
 drivers/gpu/drm/radeon/ci_dpm.c                    |    6 +-
 drivers/gpu/drm/radeon/radeon_drv.c                |    5 +-
 102 files changed, 3599 insertions(+), 1911 deletions(-)
