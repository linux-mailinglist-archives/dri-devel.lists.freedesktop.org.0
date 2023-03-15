Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE976BBFF6
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 23:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F51A10EA0F;
	Wed, 15 Mar 2023 22:44:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A37010EA0F;
 Wed, 15 Mar 2023 22:44:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVJlutqUgil0AR38vJk+Uz19oHcur1EsYzsVhzEL+wRi6mkubHxHCukrGvmpzy2QI2LAIYGbCN8mnhgnprigURsPeKK1mlIdNoKO/XT8HVah/83twKxVTagqjluxfI5RbXAvLVk/pkU8rvoal8ZPjAjV1rNvsGR1Gxb6scN6UWZoI4GQd0eT9R7xs/IEmLAYWEJTf7PfRvOrMPSAPc9Bxhlgqpl9V8OrMmlCP73cAQygV/fZ3p7VrD0Wn+/YaebWW6Gi4domz41zL6+TO3nb59+ukNYnoCyIyoECZ2EN3cegJpIHDtx/jptFtlmH5Uc9m0NnT4YAXqJou37SVKQSEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8SWt8zx31XJ6yj+e/uB9kVO7WQlkjx2Jx9ePUQwUFoQ=;
 b=dgJC5CcBeAIeTsp5P8k1Javk5XFwyIH74BzdpJe/xM2zZJlY+7iyGqlrnY12MMugGiGCMkGWoaPbXcCbnqrglWBijdB7pYbj769ZwGI1p/vnRtD1jbuCpQ7AGHbGNIm2QhfHjlVHuQc88QDX8HruE/P9qL0IS+676Rinx25BJz6adpzcmpJ8eOG03E6Pf1SFEf4PiOR+EuEwGcJ0n9y5pPIIx7xj/A78rn1Q818MzVwfxa4cioysXpD3n9rWGXd+obUPlMIZbSgUBesaqNzkpqYpyIhsTFudlvR8Jy5fUqRf8GrxgnuuVUjs4prTCAbL9vDnzt766VYvjwBD2iE/zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8SWt8zx31XJ6yj+e/uB9kVO7WQlkjx2Jx9ePUQwUFoQ=;
 b=lSUH4pBUWBpdUXtDksakqQfuGJLpTbVmShzwpuc57NMzwBGPlwcXbkuBO+4lrp503zTT8t+xhYpR1OUrVj9+67xtgt2ZktwIJkiz8ozR3ZRtMVL5ZU11JJ9uX52lArgYI0ZXAlcJBZOJpvu8sjBHrTc7cU+1MYWAC6s6ozNfo9I=
Received: from BLAPR05CA0048.namprd05.prod.outlook.com (2603:10b6:208:335::29)
 by DM4PR12MB5342.namprd12.prod.outlook.com (2603:10b6:5:39f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Wed, 15 Mar
 2023 22:44:15 +0000
Received: from BL02EPF0000EE3C.namprd05.prod.outlook.com
 (2603:10b6:208:335:cafe::eb) by BLAPR05CA0048.outlook.office365.com
 (2603:10b6:208:335::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29 via Frontend
 Transport; Wed, 15 Mar 2023 22:44:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000EE3C.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.12 via Frontend Transport; Wed, 15 Mar 2023 22:44:15 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 15 Mar
 2023 17:44:13 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.3
Date: Wed, 15 Mar 2023 18:44:00 -0400
Message-ID: <20230315224400.7558-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3C:EE_|DM4PR12MB5342:EE_
X-MS-Office365-Filtering-Correlation-Id: 3251d033-79d7-4fc6-cb0b-08db25a6cdd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oOZpJNSlzlzMEKZq1TttMGBgr2HHNLt+Q67buxcJu9JxFmenfm0PBMK4lahi8XTwljT4w4XTLMgk++QG5O7jUCDjCtunprWOTZDTuFUAfRrh/ZdcXoPNJL+PjipFuePEEJ03wh/gRGjGsZ/6C8s5jKO/6Y8X0o+6OoIha27MRVjcZtKQdJHjF6F7d9Fl+2YVEFuBh5aTP9KojnrXwJogr05+0374IPFh5DEvzCAeYNF9W69QjU9mFg+HpVyiCyuC5iQkgtiu25WzWGiGxOp0Q6BJJbYYMzWsUAtjJNTzGb3+TU2uR41w21Xa/XaJ+N4JwPzUGzK9W4UQY1+iAsrhsEjvSgrgmlIlKaTBE2D+14rveGIdCuQW0D2298HHyqUXmprTevkhbu2Rh88+vuWlgytauvOO3uylR/LMLuQvbeouQ0e/ON8Du9wGKqU4W6TD5RQpkdumdGPYlyHFFFxKwnL2DN+5JmGgTxSKSO5JZY2Jp+sGUOeda9MPGAMfPNYtEC+JV55eILYMYQiN4VBdgwYRsVoghyHkLjEGJg3MsraS2VqdOK/pzCrzV5tRvfGZDuWR3iMIPt7n+7ux99zsfIEZDbEoDQwLF9VtCw2kS3ySMywfgVinQvVpBsyV8HjDrRTnjeE0GdDmzclcnFfslF8PFTc33uarTxUsl80m1v9PyOsINaj9ZtLVd+o2O1u+
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199018)(36840700001)(40470700004)(46966006)(5660300002)(2906002)(36756003)(40460700003)(16526019)(186003)(2616005)(336012)(47076005)(66574015)(426003)(478600001)(7696005)(26005)(6666004)(1076003)(83380400001)(966005)(40480700001)(70206006)(70586007)(356005)(86362001)(8936002)(41300700001)(4326008)(8676002)(36860700001)(316002)(110136005)(82310400005)(81166007)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 22:44:15.1146 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3251d033-79d7-4fc6-cb0b-08db25a6cdd9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000EE3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5342
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

Fixes for 6.3.

The following changes since commit eeac8ede17557680855031c6f305ece2378af326:

  Linux 6.3-rc2 (2023-03-12 16:36:44 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.3-2023-03-15

for you to fetch changes up to f3921a9a641483784448fb982b2eb738b383d9b9:

  drm/amdgpu: Don't resume IOMMU after incomplete init (2023-03-15 18:21:51 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.3-2023-03-15:

amdgpu:
- SMU 13 update
- RDNA2 suspend/resume fix when overclocking is enabled
- SRIOV VCN fixes
- HDCP suspend/resume fix
- Fix drm polling splat regression
- Fix dirty rectangle tracking for PSR
- Fix vangogh regression on certain BIOSes
- Misc display fixes
- Suspend/resume IOMMU regression fix

amdkfd:
- Fix BO offset for multi-VMA page migration
- Fix a possible double free
- Fix potential use after free
- Fix process cleanup on module exit

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/nv: fix codec array for SR_IOV

Ayush Gupta (1):
      drm/amd/display: disconnect MPCC only on OTG change

Benjamin Cheng (1):
      drm/amd/display: Write to correct dirty_rect

Bhawanpreet Lakha (1):
      drm/amd/display: Fix HDCP failing to enable after suspend

Błażej Szczygieł (1):
      drm/amd/pm: Fix sienna cichlid incorrect OD volage after resume

Chia-I Wu (2):
      drm/amdkfd: fix a potential double free in pqm_create_queue
      drm/amdkfd: fix potential kgd_mem UAFs

Cruise Hung (1):
      drm/amd/display: Fix DP MST sinks removal issue

David Belanger (1):
      drm/amdkfd: Fixed kfd_process cleanup on module exit.

Felix Kuehling (1):
      drm/amdgpu: Don't resume IOMMU after incomplete init

Guchun Chen (1):
      drm/amdgpu: move poll enabled/disable into non DC path

Guilherme G. Piccoli (1):
      drm/amdgpu/vcn: Disable indirect SRAM on Vangogh broken BIOSes

Jane Jian (1):
      drm/amdgpu/vcn: custom video info caps for sriov

Saaem Rizvi (1):
      drm/amd/display: Remove OTG DIV register write for Virtual signals.

Tim Huang (1):
      drm/amd/pm: bump SMU 13.0.4 driver_if header version

Wesley Chalmers (1):
      drm/amd/display: Do not set DRR on pipe Commit

Xiaogang Chen (2):
      drm/amdkfd: Fix BO offset for multi-VMA page migration
      drm/amdkfd: Get prange->offset after svm_range_vram_node_new

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   4 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |  19 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |   3 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |   4 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 | 103 +++++++++++++++++++--
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |  16 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |  11 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |  33 ++++---
 drivers/gpu/drm/amd/amdkfd/kfd_module.c            |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  67 ++++++++++++--
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |   4 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   6 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |   3 -
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |   2 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |   6 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |   8 ++
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_4.h |   4 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |   2 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |  43 +++++++--
 23 files changed, 281 insertions(+), 69 deletions(-)
