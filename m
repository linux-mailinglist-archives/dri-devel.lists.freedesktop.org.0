Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F9B597BAD
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 04:52:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AECB0A707A;
	Thu, 18 Aug 2022 02:52:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD0AA6B8D;
 Thu, 18 Aug 2022 02:52:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/UuppOtZ9AltI1f2/9w2GIaUJZgkWaqHA77O+eV1/FYqq56qTS6dOON5dYRuUigo06Kg1QOllknvolj3MFeNBVL7EDYaCp4TYUxoSBQgXlrYV7nvJE5ujVKKV8i0jyXqONa+gLRPulrOpWsgWbn8somk82Kr1YSOp9Tx+kznilGiXOjymqXVsA6MbyPwNvH3LCx2ohNPQTSJvyIgvdN3NLPLQ5KWuvElBJ06CBgbPyJ76Bdpnt+JWWTmvkiqTjs0Y22niRLNrbsjsDuIGd1FLcSrbO36Rk8IIhTKWF/j8wZBhIRceMtCGOUv4R6rUsITqv/sm7JS5J+MnnDisgyLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEVSRU4ErVL3iq9KY0avw4hNJ7q2BjDq8nL6VXEL08g=;
 b=hv7dIlQciuDm87hVgdOa/6aJ3Dm14zXSk02LJKZlDIjfk8tjoxjb7zNE51zi3AWrdXItv6UbVwibcekGcxCRHGrbAVInGKR/S1T1XD7NxuRSVzcsL4bunYM8ovnFmPBNL57B/yLEbuPQ/QCMg6PaK0r5HXZBdoWQvc6xpY1lhriGzp8GCXPSVlM7PUjnFN1SoLes1IWyZSq+xRF32SKnN0dDXa7BCTSsQxQpGR5RnGPOJkVo+u62Y4AheRFSlifsaE0+4plHLfljuxQi59ldK0933P0eeYqVZbefwdaPEGXzK43ZaJE2zBlMgJ0qrD9WuXElw1/baYRMJY62ITIBfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEVSRU4ErVL3iq9KY0avw4hNJ7q2BjDq8nL6VXEL08g=;
 b=Sq9A10VjjJXkEfL3Hdz/sVISx5Oxpcj+dElSsJISHuUFSPam5tA9CT/9z/gNCNEIT9HrBs35jc5v1BtQ03TttelyilbXF5wJe91lUzPs2P61xFmImH6fiOqZHN/8mcudKafbT22REJo8cW8GXKXCUcTtucshDbbckETrZqiljfE=
Received: from BN9PR03CA0511.namprd03.prod.outlook.com (2603:10b6:408:131::6)
 by BL0PR12MB2498.namprd12.prod.outlook.com (2603:10b6:207:40::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Thu, 18 Aug
 2022 02:52:22 +0000
Received: from BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:131:cafe::1e) by BN9PR03CA0511.outlook.office365.com
 (2603:10b6:408:131::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.18 via Frontend
 Transport; Thu, 18 Aug 2022 02:52:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT045.mail.protection.outlook.com (10.13.177.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.15 via Frontend Transport; Thu, 18 Aug 2022 02:52:22 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 17 Aug
 2022 21:52:21 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.0
Date: Wed, 17 Aug 2022 22:52:06 -0400
Message-ID: <20220818025206.6463-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e1ca8f8-ac99-4275-448a-08da80c4ac7d
X-MS-TrafficTypeDiagnostic: BL0PR12MB2498:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D9qKN/1Q8O+z8wYv8BoMbAiO/eHAcDpmGXqnRh25+t+DdZilmWOug/Xe3upAMuwXUVKxVtX+Asl3WLExV7RMEg5Y5zx/KjI10BbG7KwhpOx5v3cwrXcIS9ceVyXubSdQkgLBO59tTEzTTlj7jiShlzc5yTjNt6ffxCBPTqvGKVFYsrswBLn3FKn0OZIXo2alw8MvvKo/rcW5A/gA2muidUEussCXHsWMXc3htb08Dg/AjJVzfA+32OO8mdjt0jjKIVxOV5W096upNYUED7cqDmUKmRZbWGZ7JM1GUX7k1itXUKleiGzAEBYgXUqff7Z/rVEuCM0jXqcCXqSkmtPFyOBkSVORz2Zk8J/SxcENjH3+AiN2NmCvA7zDPNXZ4kXUdKSpOlRsFr4NyECQ3SLLChLp/Ar7WwYpHpxXb+I6p9UD/M3pV8iDhUAQCL22Jcgoh0UYPvSLdrLrHxTgLvRZ04tXxgxzSK74zgg5Shney7DRguL5e1PTveATKrrpguleWzse4nRdTMNbSr7dajt7UIOmGCEj1wkRvrXnNP4Kh33MAu3ZI0zM6rqtst8fwm5WpNgZ3ECpKIyrx6d8CU7W+2Tb2K82pZKI9ADr1JCV3AcRZgDNjt+BEeRHi1nIH7QXPnbtTNui1P7TdxYQrq/a0Yioi5zwM0krqEhnq4oGKzCWEHJLyKL/Qflf/mYir/qu9LWK5TlNxGqXDNEsZAUsSBumqEdgBM6c2ecvu5dDS5jBXr/YhQ7/snEGF7VXgEZN
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(376002)(39860400002)(396003)(40470700004)(36840700001)(46966006)(40480700001)(8936002)(2906002)(86362001)(356005)(82310400005)(30864003)(5660300002)(47076005)(66574015)(83380400001)(16526019)(26005)(81166007)(36756003)(6666004)(7696005)(2616005)(1076003)(426003)(336012)(186003)(316002)(36860700001)(110136005)(41300700001)(4326008)(478600001)(966005)(70206006)(40460700003)(70586007)(82740400003)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 02:52:22.1401 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e1ca8f8-ac99-4275-448a-08da80c4ac7d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2498
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

A bit bigger than normal, but this is several weeks of fixes since I was out
of the office and then digging out once I got back.  Mainly fixes for new
IPs that were added in 6.0.

The following changes since commit 5493ee1919eae4f49d62276cf5986b7f7c7aa8f6:

  Merge tag 'amd-drm-next-5.20-2022-07-29' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2022-08-03 14:00:19 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.0-2022-08-17

for you to fetch changes up to 085292c3d78015412b752ee1ca4c7725fd2bf2fc:

  Revert "drm/amd/amdgpu: add pipe1 hardware support" (2022-08-16 18:14:31 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.0-2022-08-17:

amdgpu:
- Revert some DML stack changes
- Rounding fixes in KFD allocations
- atombios vram info table parsing fix
- DCN 3.1.4 fixes
- Clockgating fixes for various new IPs
- SMU 13.0.4 fixes
- DCN 3.1.4 FP fixes
- TMDS fixes for YCbCr420 4k modes
- DCN 3.2.x fixes
- USB 4 fixes
- SMU 13.0 fixes
- SMU driver unload memory leak fixes
- Display orientation fix
- Regression fix for generic fbdev conversion
- SDMA 6.x fixes
- SR-IOV fixes
- IH 6.x fixes
- Use after free fix in bo list handling
- Revert pipe1 support
- XGMI hive reset fix

amdkfd:
- Fix potential crach in kfd_create_indirect_link_prop()

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: Only disable prefer_shadow on hawaii

Alvin Lee (8):
      drm/amd/display: Add a variable to update FCLK latency
      drm/amd/display: Revert "attempt to fix the logic in commit_planes_for_stream()"
      drm/amd/display: For stereo keep "FLIP_ANY_FRAME"
      drm/amd/display: Don't try to enter MALL SS if stereo3d
      drm/amd/display: Add 16 lines margin for SubVP
      drm/amd/display: Don't set DSC for phantom pipes
      drm/amd/display: Use pitch when calculating size to cache in MALL
      drm/amd/display: Include scaling factor for SubVP command

Andrey Strachuk (1):
      drm/amdgpu: remove useless condition in amdgpu_job_stop_all_jobs_on_sched()

Aric Cyr (2):
      drm/amd/display: 3.2.197
      drm/amd/display: 3.2.198

Aurabindo Pillai (4):
      drm/amd/display: Add a missing register field for HPO DP stream encoder
      drm/amd/display: fix CAB allocation for multiple displays
      drm/amd/display: Check correct bounds for stream encoder instances for DCN303
      drm/amd/display: Enable SubVP by default on DCN32 & DCN321

Chaitanya Dhere (1):
      drm/amd/display: Modify header inclusion pattern

Charlene Liu (1):
      drm/amd/display: avoid doing vm_init multiple time

Chiawen Huang (1):
      drm/amd/display: Device flash garbage before get in OS

Dan Carpenter (1):
      drm/amdkfd: potential crash in kfd_create_indirect_link_prop()

Daniel Miess (3):
      drm/amd/display: Use pixels per container logic for DCN314 DCCG dividers
      drm/amd/display: Fix TMDS 4K@60Hz YCbCr420 corruption issue
      drm/amd/display: Add debug parameter to retain default clock table

Daniel Phillips (2):
      drm/amdgpu: Remove rounding from vram allocation path
      drm/amdgpu: Pessimistic availability based on rounded up allocations

David Galiffi (2):
      drm/amd/display: Allow alternate prefetch modes in DML for DCN32
      drm/amd/display: Fix Compile-time Warning

Duncan Ma (2):
      drm/amd/display: Fix VPG instancing for dcn314 HPO
      drm/amd/display: Correct DTBCLK for dcn314

Dusica Milinkovic (1):
      drm/amdgpu: Increase tlb flush timeout for sriov

Ethan Wellenreiter (1):
      drm/amd/display: reverted limiting vscsdp_for_colorimetry and ARGB16161616 pixel format addition

Evan Quan (4):
      drm/amd/pm: add 3715 softpptable support for SMU13.0.0
      drm/amdgpu: disable 3DCGCG/CGLS temporarily due to stability issue
      drm/amd/pm: add missing ->fini_microcode interface for Sienna Cichlid
      drm/amd/pm: add missing ->fini_xxxx interfaces for some SMU13 asics

Felix Kuehling (2):
      drm/amdkfd: Handle restart of kfd_ioctl_wait_events
      drm/amdkfd: Fix mm reference in SVM eviction worker

Fudong Wang (1):
      drm/amd/display: clear optc underflow before turn off odm clock

Harish Kasiviswanathan (1):
      drm/amdgpu: Add decode_iv_ts helper for ih_v6 block

Ian Chen (1):
      drm/amd/display: Add reserved dc_log_type.

Ilya Bakoulin (1):
      drm/amd/display: Fix pixel clock programming

Joseph Greathouse (1):
      drm/amdgpu: Enable translate_further to extend UTCL2 reach

Josip Pavic (2):
      drm/amd/display: Avoid MPC infinite loop
      drm/amd/display: do not compare integers of different widths

Kenneth Feng (3):
      drm/amd/pm: skip pptable override for smu_v13_0_7
      drm/amd/amdgpu: add ih cg and hdp sd on smu_v13_0_7
      drm/amd/pm: add mode1 support on smu_v13_0_7

Khalid Masum (1):
      drm/amdgpu/vcn: Return void from the stop_dbg_mode

Leo Ma (1):
      drm/amd/display: Fix HDMI VSIF V3 incorrect issue

Lijo Lazar (1):
      drm/amdgpu: Avoid another list of reset devices

Likun Gao (1):
      drm/amdgpu: change vram width algorithm for vram_info v3_0

Ma Jun (1):
      drm/amdgpu: Remove redundant reference of header file

Magali Lemes (4):
      drm/amd/display: remove DML Makefile duplicate lines
      drm/amd/display: make variables static
      drm/amd/display: remove header from source file
      drm/amd/display: include missing headers

Maíra Canal (1):
      drm/amdgpu: Fix use-after-free on amdgpu_bo_list mutex

Meenakshikumar Somasundaram (1):
      drm/amd/display: Fix TDR eDP and USB4 display light up issue

Melissa Wen (1):
      drm/amd/display: set panel orientation before drm_dev_register

Michel Dänzer (1):
      Revert "drm/amd/amdgpu: add pipe1 hardware support"

Mukul Joshi (1):
      drm/amdgpu: Fix interrupt handling on ih_soft ring

Nicholas Kazlauskas (1):
      drm/amd/display: Update clock table policy for DCN314

Rajneesh Bhardwaj (1):
      drm/amdgpu: Avoid direct cast to amdgpu_ttm_tt

Rodrigo Siqueira (7):
      Revert "drm/amd/display: reduce stack for dml32_CalculatePrefetchSchedule"
      Revert "drm/amd/display: reduce stack for dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport"
      Revert "drm/amd/display: reduce stack for dml32_CalculateVMRowAndSwath"
      Revert "drm/amd/display: reduce stack for dml32_CalculateSwathAndDETConfiguration"
      drm/amd/display: Create FPU files for DCN314
      drm/amd/display: Move populate dml pipes from DCN314 to dml
      drm/amd/display: Drop FPU flags from Makefile

Samson Tam (1):
      drm/amd/display: add chip revision to DCN32

Sebin Sebastian (1):
      drm/amdgpu: double free error and freeing uninitialized null pointer

Shane Xiao (1):
      drm/amdgpu: Add secure display TA load for Renoir

Tim Huang (15):
      drm/amdgpu: add GFX Clock Gating support for GC IP v11.0.1
      drm/amdgpu: enable GFX Clock Gating control for GC IP v11.0.1
      drm/amdgpu/pm: update smu driver interface header for SMU IP v13.0.4
      drm/amdgpu/pm: remove EnableGfxOff message for SMU IP v13.0.4
      drm/amdgpu: enable GFX Power Gating for GC IP v11.0.1
      drm/amdgpu: add GFX Power Gating support for GC IP v11.0.1
      drm/amd/pm: update the smu driver interface version for SMU IP v13.0.4
      drm/amdgpu: add MMHUB IP v3.0.1 Clock Gating support
      drm/amdgpu: add HDP IP v5.2.1 Clock Gating support
      drm/amdgpu: add ATHUB IP v3.0.1 Clock Gating support
      drm/amdgpu: enable MMHUB IP v3.0.1 Clock Gating
      drm/amdgpu: enable HDP IP v5.2.1 Clock Gating
      drm/amdgpu: enable ATHUB IP v3.0.1 Clock Gating
      drm/amdgpu: enable IH Clock Gating for OSS IP v6.0.1
      drm/amd/pm: Enable GFXOFF feature for SMU IP v13.0.4

Tom Chung (1):
      drm/amd/display: Fix plug/unplug external monitor will hang while playback MPO video

Yifan Zhang (2):
      drm/amd/display: change family id name for DCN314
      drm/amdkfd: reserve 2 queues for sdma 6.0.1 in bitmap

Zhen Ni (2):
      drm/amd/pm: Fix a potential gpu_metrics_table memory leak
      drm/amd/pm: Fix a potential gpu_metrics_table memory leak

 drivers/gpu/drm/amd/amdgpu/aldebaran.c             |  45 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   4 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  34 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |   3 +-
 drivers/gpu/drm/amd/amdgpu/athub_v3_0.c            |  42 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |   3 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |   7 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  39 +
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   6 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v5_2.c              | 150 ++++
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c               |   1 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.c          |  42 +-
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c             |   7 +-
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c             |  10 +
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |   1 -
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |  25 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   5 +-
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c             |   7 +-
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |   7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |  24 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  17 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |   1 -
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |  11 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  15 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |   4 +-
 drivers/gpu/drm/amd/display/dc/basics/conversion.c |  21 +
 drivers/gpu/drm/amd/display/dc/basics/conversion.h |   3 +
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |   4 +-
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |   3 +-
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.h  |   1 +
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c | 200 +++--
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.h |   2 +-
 .../drm/amd/display/dc/clk_mgr/dcn314/dcn314_smu.h |  33 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  41 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |   2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   6 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |  15 +-
 drivers/gpu/drm/amd/display/dc/dc_link.h           |   1 +
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |   2 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c   |   2 -
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c  |   3 -
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   1 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mpc.c   |   6 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c  |   5 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c   |   2 -
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |   3 -
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c   |   6 +
 .../gpu/drm/amd/display/dc/dcn21/dcn21_hubbub.c    |   8 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c   |   2 -
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c  |   2 +-
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |   2 +-
 .../display/dc/dcn31/dcn31_hpo_dp_stream_encoder.h |   3 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |   2 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.h  |   1 -
 drivers/gpu/drm/amd/display/dc/dcn314/Makefile     |  25 -
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c   |  42 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.h   |   4 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_init.c    |   2 +
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    | 341 +--------
 .../drm/amd/display/dc/dcn314/dcn314_resource.h    |   3 +
 .../drm/amd/display/dc/dcn315/dcn315_resource.h    |   1 -
 .../drm/amd/display/dc/dcn316/dcn316_resource.h    |   1 -
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |  40 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c  |   2 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |   3 +-
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |   2 +-
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |   5 +-
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |   4 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |   1 +
 .../gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c |   1 +
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c   |   9 +-
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |   2 +-
 .../display/dc/dml/dcn31/display_rq_dlg_calc_31.c  |   2 +-
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c | 376 ++++++++++
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.h |  40 +
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |  47 +-
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |  12 +-
 .../dc/dml/dcn32/display_mode_vba_util_32.c        | 812 +++++++++++----------
 .../dc/dml/dcn32/display_mode_vba_util_32.h        |   5 -
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c |   7 +
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.h  | 106 ---
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |   6 +-
 drivers/gpu/drm/amd/display/include/logger_types.h |   4 +-
 .../drm/amd/display/modules/freesync/freesync.c    |  15 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_4.h |   4 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |   2 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   1 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  21 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   2 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   |  17 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c   |   3 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  14 +
 108 files changed, 1758 insertions(+), 1184 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.h
