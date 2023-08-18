Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3071D7813F1
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 21:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 477EF10E559;
	Fri, 18 Aug 2023 19:53:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA3010E0FB;
 Fri, 18 Aug 2023 19:53:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z1sxN7HZ4NeEZFf4/8dW7S0qFYD7S0UfNe+KwFy9s8kiEJ47cIemKCWBMmKcPWyoUgZ3wQTWLhlaCtxwCmB+K3+4MdTzXv0CEm6eOcEj/bsdb2Og7wcn651Whb3sLmOow1Af7vWGs6m9HkLBiUJBG/iELEvYMwgXrk0gA3k4SCwNGimNnUIuXWkLUYYySsrwsPttWI6xanfIxN5hPNiW8YFnOQ51WSj2wGrXCusNPjFZK1DPZcOTR9BoR6F2KWQ9pHwBEtLjKYA6KbJI3Y/sLzd5upqnj1gDJkj7eSVo8w9+WCQWGESOR+/8PyCM5AZ91NRwU+YUV73AiK+olkDKIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XDDQNCm9vFIqkSHjuyF7kImVvKD7oyMjx5j2oj6XKTw=;
 b=HfA9xICjexVxQ6poCEfnrm1htEYc+/PdaxaPElGAbgYOeC12OfyPC7bRskIzHrvBQs8k05lGnLDdEcULE/bO90oqNV7SGoVpqdc+DZxm23GEEcBUTWVdDQxHT89eycLvMVdXBgGxRI7uFVrzO0p5KWikB4EPLqkpog2xGElCiYkdJd72tnHYR5vFZ/mF8vkOvKAxPrYv5BEl/Mi36Vjc8XQz0aGFLo3jPfc7N3ooMkPf2Xsd55NaU3aFyVl9RCqCoZLwQ05UUS9bGztWcDrdWxXJN4f2Jg74/0amx7TAkavOvSXrpHIcPnW7YHYj4UXW5to7hIS4YchyfWQbvpKo6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDDQNCm9vFIqkSHjuyF7kImVvKD7oyMjx5j2oj6XKTw=;
 b=Dj6hctL0vzmDkyE+dxI1k37xEOwg+qQxBJ1ZZvjVGFtS6ilXNmt36F56kTuCKjbMSrE0scMbar3iruxRekAcRzG4WthM8b9up2JoGE0sVBniVTQO43Ae57doOmMoXHE+GFRTsG5xgVkB73L7+VcCXz/abTpYySAa3wCMFDhqxNE=
Received: from MW4PR04CA0334.namprd04.prod.outlook.com (2603:10b6:303:8a::9)
 by CYYPR12MB8989.namprd12.prod.outlook.com (2603:10b6:930:c2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Fri, 18 Aug
 2023 19:53:06 +0000
Received: from CO1PEPF000044EF.namprd05.prod.outlook.com
 (2603:10b6:303:8a:cafe::b) by MW4PR04CA0334.outlook.office365.com
 (2603:10b6:303:8a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.17 via Frontend
 Transport; Fri, 18 Aug 2023 19:53:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044EF.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Fri, 18 Aug 2023 19:53:05 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 18 Aug
 2023 14:53:04 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-6.6
Date: Fri, 18 Aug 2023 15:52:47 -0400
Message-ID: <20230818195247.10981-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EF:EE_|CYYPR12MB8989:EE_
X-MS-Office365-Filtering-Correlation-Id: f3cfb545-8a9a-4d29-db3c-08dba024bd37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SZyLH+HcG6Iy3aYZZG9iH54XzDszZn2mBIXgAOK2Avq3IzNc9FCyssJO4SxS3tAN+LhhrdONKd0jOQAHvGrMpDOtwGzCHIsbGLa8DjHwyYpqqPh2ZhJNkU+ysGnbc5VgtvqXOKL+e3ExcW+hkWFduwZaWLQnBC4oGkicg5gGc+PibQWrI+v5YqNUaZJ9H2PxAU4PQQtqgEWW3VX8Z6WMoOnBEPnTMm8Z4FOa6qf8DETk5bWrtLsDs7Uv+RKbxBMmwzlQF9YJdQbwfen/P+cSTbJ3BYTPAPlO0czyDki/vdprAOTySpQ91c1r4h5tIKbE75M4ZzHCGHwP2FNOnddzw7t/g2FpBxuBaa3GR7QFksI2K8ghRl+/B/g3PyYgN6HOQfAJNAd3bPUlXLbE366ExD7N+yKfKuajDh1ohpMv/qJmeC4hEqvf/aVjS9cN7OHiU/6ltpDs6Pb+F3rwJxAL0s2ZJwCKkdGqE6tclzEoU9Rq9UPt8sL1lsJlnolg0EyJ+vcLctd8AGkWstfM+aFvDL2HlZvuApks0TGI094krzDQVoNArWpv+sLmAF+1jcOHFchsMaL+Qy5hXgOQKADsWRcPinYpGZUS8NF85Wd4ZJAiitn2NiBk1CtRqOUkasreP+OBXvSNku0SrPvV1VrMEVncK7rpKSlI277SRyTImE7FATBMAKiWfGNDrcw5Qch31OSA3bFf7/6wVwezbOl1Oz5JvAOBCAERnwDjSYHKWI/gKfOT0SguShqWAOzGfNqoFGmJSv3EQWPfo6jh2fnPkNxdmLionvYUscOzXJwLoKg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(136003)(346002)(39860400002)(376002)(186009)(451199024)(82310400011)(1800799009)(36840700001)(40470700004)(46966006)(2906002)(40460700003)(83380400001)(30864003)(26005)(86362001)(336012)(478600001)(40480700001)(426003)(7696005)(6666004)(1076003)(2616005)(36756003)(16526019)(966005)(41300700001)(5660300002)(36860700001)(70586007)(82740400003)(356005)(70206006)(81166007)(110136005)(316002)(4326008)(8936002)(8676002)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 19:53:05.5472 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3cfb545-8a9a-4d29-db3c-08dba024bd37
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8989
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

Last few updates for 6.6.  Mostly bug fixes.

The following changes since commit a8b273a8fd9c88cee038ffdae05b7eca063b9622:

  Merge tag 'amd-drm-next-6.6-2023-08-11' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2023-08-15 13:37:49 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.6-2023-08-18

for you to fetch changes up to ef35c7ba60410926d0501e45aad299656a83826c:

  Revert "Revert "drm/amdgpu/display: change pipe policy for DCN 2.0"" (2023-08-16 11:38:18 -0400)

----------------------------------------------------------------
amd-drm-next-6.6-2023-08-18:

amdgpu:
- Panel replay fixes
- Misc checkpatch fixes
- SMU 13.x fixes
- mcbp parameter handling fix for gfx9
- RAS fixes
- Misc code cleanups
- SR-IOV fixes
- Expose both current and average power via hwmon if supported
- DP retimer fix
- Clockgating fix
- Subvp fixes
- DMCUB fixes
- Gamut remap fix
- Misc display fixes
- Allow users to force runtime pm when displays are attached
- Gracefully handle more partitions than drm nodes
- S0ix fixes
- GC 9.4.3 fixes

amdkfd:
- TBA fix for aldebaran
- Fix build without CONFIG_DYNAMIC_DEBUG
- memdup cleanup
- Fix address watch clearing

radeon:
- Misc code cleanups

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu: expand runpm parameter
      Revert "Revert "drm/amdgpu/display: change pipe policy for DCN 2.0""

Alvin Lee (2):
      drm/amd/display: Enable subvp high refresh up to 175hz
      drm/amd/display: PMFW to wait for DMCUB ack for FPO cases

Anthony Koo (1):
      drm/amd/display: [FW Promotion] Release 0.0.179.0

Aric Cyr (1):
      drm/amd/display: Promote DAL to 3.2.247

Arnd Bergmann (1):
      drm/amdkfd: fix build failure without CONFIG_DYNAMIC_DEBUG

Asad Kamal (3):
      drm/amd/pm: Add vclk and dclk sysnode for GC 9.4.3
      drm/amd/pm: Update pci link width for smu v13.0.6
      drm/amd/pm: Update pci link speed for smu v13.0.6

Atul Raut (1):
      drm/amdkfd: Use memdup_user() rather than duplicating its implementation

Aurabindo Pillai (3):
      drm/amd/display: Add some missing register definitions
      drm/amd: Remove freesync video mode amdgpu parameter
      drm/amd/display: enable low power mode for VGA memory

Bhawanpreet Lakha (4):
      drm/amd/display: Add Replay supported/enabled checks
      drm/amd/display: Update replay for clk_mgr optimizations
      drm/amd/display: Update adaptive sync infopackets for replay
      drm/amd/display: Handle Replay related hpd irq

Candice Li (1):
      drm/amdgpu: Add I2C EEPROM support on smu v13_0_6

Charlene Liu (1):
      drm/amd/display: avoid crash and add z8_marks related in dml

Eric Huang (1):
      drm/amdkfd: workaround address watch clearing bug for gfx v9.4.2

Evan Quan (2):
      drm/amd/pm: correct the way for checking custom OD settings
      drm/amd/pm: correct the logics for retreiving SMU13 OD setting limits

GUO Zihua (1):
      drm/amdgpu: Remove duplicated includes

Hawking Zhang (1):
      drm/amdgpu: Remove unnecessary ras cap check

James Zhu (1):
      drm/amdgpu: skip xcp drm device allocation when out of drm resource

Jay Cornwall (1):
      drm/amdkfd: Add missing tba_hi programming on aldebaran

Jiadong Zhu (1):
      drm/amdgpu: disable mcbp if parameter zero is set

Jonathan Kim (1):
      drm/amdkfd: fix double assign skip process context clear

Kenneth Feng (2):
      drm/amd/pm: disallow the fan setting if there is no fan on smu 13.0.0
      drm/amd/pm: allow the user to force BACO on smu v13.0.0/7

Krunoslav Kovac (1):
      drm/amd/display: Gamut remap only changes missed

Lijo Lazar (3):
      drm/amd/pm: Fix temperature unit of SMU v13.0.6
      drm/amdgpu: Remove gfxoff check in GFX v9.4.3
      drm/amdgpu: Add memory vendor information

Mario Limonciello (10):
      drm/amd: Add amdgpu_hwmon_get_sensor_generic()
      drm/amd: Add a new hwmon attribute for instantaneous power
      drm/amd: Introduce `AMDGPU_PP_SENSOR_GPU_INPUT_POWER`
      drm/amd: Fix SMU 13.0.4/13.0.11 GPU metrics average power
      drm/amd: Drop unnecessary helper for aldebaran
      drm/amd: Fix the return for average power on aldebaran
      drm/amd: Show both power attributes for vega20
      drm/amd: Rename AMDGPU_PP_SENSOR_GPU_POWER
      drm/amd: Hide unsupported power attributes
      drm/amd: flush any delayed gfxoff on suspend entry

Michael Strauss (1):
      drm/amd/display: Support Compliance Test Pattern Generation with DP2 Retimer

Muhammad Ahmed (1):
      drm/amd/display: disable clock gating logic reversed bug fix

Nicholas Susanto (1):
      drm/amd/display: Enable 8k60hz mode on single display

Ran Sun (2):
      drm/amd/pm: Clean up errors in smu_v11_0_pptable.h
      drm/amd/pm: Clean up errors in amdgpu_smu.h

Randy Dunlap (1):
      drm/amd/display: dmub_replay: don't use kernel-doc markers

Ruan Jinjie (3):
      drm/amdkfd: Remove unnecessary NULL values
      drm/amd/display: Remove unnecessary NULL values
      drm/radeon: Remove unnecessary NULL values

Samir Dhume (7):
      drm/amdgpu/vcn: Add MMSCH v4_0_3 support for sriov
      drm/amdgpu/vcn: mmsch_v4_0_3 requires doorbell on 32 byte boundary
      drm/amdgpu/jpeg: mmsch_v4_0_3 requires doorbell on 32 byte boundary
      drm/amdgpu/vcn: change end doorbell index for vcn_v4_0_3
      drm/amdgpu/vcn: sriov support for vcn_v4_0_3
      drm/amdgpu/jpeg: sriov support for jpeg_v4_0_3
      drm/amdgpu/vcn: Skip vcn power-gating change for sriov

Srinivasan Shanmugam (6):
      drm/amdgpu: Fix missing comment for mb() in 'amdgpu_device_aper_access'
      drm/radeon: Fix multiple line dereference in 'atom_iio_execute'
      drm/amdgpu: Fix identifier names to function definition arguments in atom.h
      drm/amdgpu: Replace ternary operator with min() in 'amdgpu_iomem_read'
      drm/amd/display: Replace ternary operator with min() in 'dm_helpers_parse_edid_caps'
      drm/amdgpu: Replace ternary operator with min() in 'amdgpu_iomem_write'

Tim Huang (2):
      drm/amd/pm: bump SMU v13.0.5 driver_if header version
      drm/amdgpu: skip fence GFX interrupts disable/enable for S0ix

Umio Yasuno (1):
      drm/amdgpu/pm: fix throttle_status for other than MP1 11.0.7

Wenjing Liu (2):
      drm/amd/display: fix incorrect stream_res allocation for older ASIC
      drm/amd/display: implement pipe type definition and adding accessors

Xiongfeng Wang (1):
      drm/amd: Use pci_dev_id() to simplify the code

Yang Wang (1):
      drm/amd/pm: avoid driver getting empty metrics table for the first time

YiPeng Chai (1):
      drm/amdgpu: mode1 reset needs to recover mp1 for mp0 v13_0_10

Zheng Zengkai (1):
      drm/radeon: Use pci_dev_id() to simplify the code

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   8 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c   |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell.h       |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  64 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |  41 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c       |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c            |  13 +-
 drivers/gpu/drm/amd/amdgpu/atom.h                  |  23 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |   2 -
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  26 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           | 188 +++++++++--
 drivers/gpu/drm/amd/amdgpu/mmsch_v4_0_3.h          |  37 +++
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |  24 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            | 282 ++++++++++++++--
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  11 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c       |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   6 +
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   9 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   4 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  |   4 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |   4 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |   3 +
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |   5 +
 .../dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.c       |   7 +
 .../dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.h       |   1 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  47 ++-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  | 194 ++++++-----
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   2 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   3 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |  25 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h     |  69 ++--
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c   |  18 +-
 .../drm/amd/display/dc/dce100/dce100_resource.c    |   2 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |   5 +
 .../drm/amd/display/dc/dce110/dce110_resource.c    |   2 +-
 .../drm/amd/display/dc/dce112/dce112_resource.c    |   4 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |   6 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |   1 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |  43 ++-
 .../drm/amd/display/dc/dcn201/dcn201_resource.c    |   4 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |   5 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |   3 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.c    |   4 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |   4 +-
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |   8 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c    |   4 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |  12 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |   4 +-
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |  12 +-
 .../gpu/drm/amd/display/dc/dml/calcs/dce_calcs.c   |   2 +-
 .../gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c   |   2 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |   2 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |  16 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |   2 +
 drivers/gpu/drm/amd/display/dc/inc/link.h          |   4 +
 drivers/gpu/drm/amd/display/dc/inc/resource.h      | 220 ++++++++++++-
 drivers/gpu/drm/amd/display/dc/link/Makefile       |   3 +-
 .../amd/display/dc/link/accessories/link_dp_cts.c  |   6 +-
 .../drm/amd/display/dc/link/hwss/link_hwss_dio.c   |   2 +-
 .../drm/amd/display/dc/link/hwss/link_hwss_dio.h   |   3 +
 .../link/hwss/link_hwss_dio_fixed_vs_pe_retimer.c  | 200 ++++++++++++
 .../link/hwss/link_hwss_dio_fixed_vs_pe_retimer.h  |  37 +++
 .../amd/display/dc/link/hwss/link_hwss_hpo_dp.c    |  22 +-
 .../amd/display/dc/link/hwss/link_hwss_hpo_dp.h    |  28 +-
 .../hwss/link_hwss_hpo_fixed_vs_pe_retimer_dp.c    | 229 +++++++++++++
 .../hwss/link_hwss_hpo_fixed_vs_pe_retimer_dp.h    |  33 ++
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |   7 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |   1 +
 .../drm/amd/display/dc/link/protocols/link_ddc.c   |  82 +++++
 .../drm/amd/display/dc/link/protocols/link_ddc.h   |  14 +
 .../dc/link/protocols/link_dp_irq_handler.c        |  66 ++++
 .../link_dp_training_fixed_vs_pe_retimer.c         | 305 +++++-------------
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   4 +
 .../amd/display/modules/info_packet/info_packet.c  |   5 +
 .../amd/include/asic_reg/dcn/dcn_3_0_0_offset.h    |   5 +
 .../amd/include/asic_reg/dcn/dcn_3_0_0_sh_mask.h   |   5 +
 .../amd/include/asic_reg/dcn/dcn_3_0_2_offset.h    |   4 +
 .../amd/include/asic_reg/dcn/dcn_3_0_2_sh_mask.h   |   5 +-
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |   3 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 | 355 +++++++--------------
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |   2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |   2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c  |   2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c  |  20 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |  37 +--
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_5.h |   3 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h       |   1 -
 .../gpu/drm/amd/pm/swsmu/inc/smu_v11_0_pptable.h   |  15 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |   3 +-
 .../drm/amd/pm/swsmu/smu11/cyan_skillfish_ppt.c    |  14 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |   3 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |  17 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |  12 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |   7 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |  24 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   3 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 103 +++---
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   |  13 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c   |   7 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  73 +++--
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  99 +++---
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |   7 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   2 +
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |   8 +
 drivers/gpu/drm/radeon/atom.c                      |  10 +-
 drivers/gpu/drm/radeon/radeon_acpi.c               |   2 +-
 drivers/gpu/drm/radeon/radeon_agp.c                |   2 +-
 drivers/gpu/drm/radeon/radeon_combios.c            |   6 +-
 drivers/gpu/drm/radeon/radeon_legacy_encoders.c    |   4 +-
 120 files changed, 2364 insertions(+), 1122 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mmsch_v4_0_3.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio_fixed_vs_pe_retimer.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio_fixed_vs_pe_retimer.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_hpo_fixed_vs_pe_retimer_dp.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_hpo_fixed_vs_pe_retimer_dp.h
