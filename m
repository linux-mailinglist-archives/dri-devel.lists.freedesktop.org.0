Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FE7617446
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 03:34:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 747D210E20A;
	Thu,  3 Nov 2022 02:34:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 632C510E20A;
 Thu,  3 Nov 2022 02:34:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bolGdq+PW7jtUn37MFZSQPAGb+3RuyBXtjnvwP7qJ/0l7FNRZDPW/VkDHcpeqdYDUtb43HRDmVO65q0TUDJa/sTLUKhvrjqSztqHwBorq5nNvcp/jfAZ1SFD9t8vI2dUTuZoW/SwVztoEiC/8BY2/ezPpdQXQZuSnM5aX8UsnCOr3h1mW61yqs8B99Bg09IzJBDaKjZ7ccIvWG608fAFFd2dhrjl9wJU1vmzQ+i9CnR6iszec0sc1fKSkqeo4GkML02wXU3p+CkXIodiV+3q1jhGzH1kdZVOVb7gOGaoZCHzfQP7NOXCQllUQdfAKMb7cFvbcHHevIYmtNN9HORMhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yuat87vTV3i7lez/edSeV8ATtSFtxQQUY/Xaf9RCaJk=;
 b=RFmqMhC/nqyOLgEPmgbHjjddkqABW6U8PaGCekBfUrfHh1jNJlztYEwn/Q43nk4x+iQRFW71bZ66sCZdOeRQcgtynJPoqVq4USAUF0buBUIydyWGxKhIb9mD1p0uJE0+g7CFMi1nZ2jZmrE396wtFchkfX+4imNIyizkMqvfwCkqQUlGMfYz1+7TFGBtKxaXH+yLXga9uZjcvGBu9t5/zKfk1oOwGprRVAOzBqcxj7lUQY07MxBg/xGQxSjtyRjcK0XEcHUVZbXu2GL8CmXRx/sfqq9OdSK44WMTYjRWyIOkJVe33Ze4QLaQY6cTagUogHZf8GXVhUJ2ttHECz6GQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuat87vTV3i7lez/edSeV8ATtSFtxQQUY/Xaf9RCaJk=;
 b=KrBFDf4IwrAhAdYdUeEODQSYueqdjA4hn+O6wWNJvAhhKHWT/mv2WCepekxBgU8PwUFTF3R6Fy0JxlFrt6QSLaLq6hQJXb/1PKO7eKaBRPqoDHlo4gFUsRZbxs3UvZyQBV5aFPkJbPPk/bvyr6KORB9b1LHHfWP0IgESCV99yUg=
Received: from BN0PR04CA0023.namprd04.prod.outlook.com (2603:10b6:408:ee::28)
 by SA1PR12MB7127.namprd12.prod.outlook.com (2603:10b6:806:29e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Thu, 3 Nov
 2022 02:33:56 +0000
Received: from BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ee:cafe::b0) by BN0PR04CA0023.outlook.office365.com
 (2603:10b6:408:ee::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Thu, 3 Nov 2022 02:33:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT066.mail.protection.outlook.com (10.13.177.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 02:33:56 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 2 Nov
 2022 21:33:11 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.1
Date: Wed, 2 Nov 2022 22:32:57 -0400
Message-ID: <20221103023257.10446-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT066:EE_|SA1PR12MB7127:EE_
X-MS-Office365-Filtering-Correlation-Id: 735eb6d8-8757-4e64-b024-08dabd43db27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EDVQua9FL/uZ/+wNFGQpooByynk1mmnqbM2lkgpainBWjO7bQlWSG2kdQus/KI/F+kwORfH0UuRd+bLCVMNmxXQIDSd4N62t5HKhi+DSZrwWSB/8WkP0YtgIDtZPhy9+avBAZwQR4Ub6XdpTY5NbRnA8PNNG6yVMd6jXhbf8rhrBhn6sB7+XLOdzuZo3ezVtqwTQ4kzja8Ae7tEbBfDDmS3udQ5L7AQMTcToXQSwaDh5kpGvSXY5j85x5/JO8lKmkBjQ5OdhrNDiCIgpcHUnfGNcd23VdkpquHu5TUUWEC5YDigStLxuv3Y+gUs7VhXzvgmbxygmQpecBbrSa6ABsuY0q3Rl7xTzxtbsl3lja9TEjbwsgo+l5OaB8K94bhoqQl0S00HTqU21w3J8kN4DYjuyTnncRy1cDySkEES5dqb1e4grAvllQ/iuDQkCWSK39Owg6ljrimnX6YJSFWSU2WUuu2wbhs6EcRFD5QSlEBtyNjqf2ErQ8UdAjJ1y5yAmR7PGmH0JHdXSg6chG7g0iYFOkIL7ihvlqOl0jIzQsPROSQydaLaPBAK2r3jdmI4t+KCrhkdL3hoW4pgNWIyqPcnIAkmc0rj+tvL6kGtw8JRIgVmdUZUNSDfMhOXpYOOD8JNksBquI6qHZTKajnOse1tbylTvvAKMqCcQWGSLXGpoIyj9GMy/vaxrSQlXsy4A+LRGlSg437irSzsBwUHJOUO7i+5ywYSNd2Kd2PBI89Ep2fvMYvo/foPeZ55wlBpT
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39860400002)(396003)(136003)(451199015)(36840700001)(40470700004)(46966006)(7696005)(426003)(81166007)(82310400005)(356005)(6666004)(36756003)(86362001)(40460700003)(26005)(41300700001)(8676002)(4326008)(966005)(1076003)(5660300002)(2616005)(16526019)(8936002)(186003)(478600001)(70206006)(70586007)(110136005)(47076005)(316002)(82740400003)(36860700001)(40480700001)(83380400001)(336012)(2906002)(4001150100001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 02:33:56.2522 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 735eb6d8-8757-4e64-b024-08dabd43db27
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7127
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

Fixes for 6.1.  The big change here is the hang fix for the GC11 trap handler.

The following changes since commit 30a0b95b1335e12efef89dd78518ed3e4a71a763:

  Linux 6.1-rc3 (2022-10-30 15:19:28 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.1-2022-11-02

for you to fetch changes up to 6640f8e5adb69a0550fe1d224d3ac64c10f00eef:

  drm/amdkfd: update GFX11 CWSR trap handler (2022-11-02 17:16:25 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.1-2022-11-02:

amdgpu:
- DCN 3.1.4 fixes
- DCN 3.2.x fixes
- GC 11.x fixes
- Virtual display fix
- Fail suspend if resources can't be evicted
- SR-IOV fix
- Display PSR fix

amdkfd:
- Fix possible NULL pointer deref
- GC 11.x trap handler fix

----------------------------------------------------------------
Alvin Lee (1):
      drm/amd/display: Enable timing sync on DCN32

Dillon Varone (2):
      drm/amd/display: Update latencies on DCN321
      drm/amd/display: Set memclk levels to be at least 1 for dcn32

Fangzhi Zuo (1):
      drm/amd/display: Ignore Cable ID Feature

Gavin Wan (1):
      drm/amdgpu: Disable GPU reset on SRIOV before remove pci.

George Shen (4):
      drm/amd/display: Fix DCN32 DSC delay calculation
      drm/amd/display: Use forced DSC bpp in DML
      drm/amd/display: Round up DST_after_scaler to nearest int
      drm/amd/display: Add DSC delay factor workaround

Graham Sider (2):
      drm/amdgpu: correct MES debugfs versions
      drm/amdgpu: disable GFXOFF during compute for GFX11

Jay Cornwall (1):
      drm/amdkfd: update GFX11 CWSR trap handler

Jun Lei (1):
      drm/amd/display: Limit dcn32 to 1950Mhz display clock

Leo Chen (1):
      drm/amd/display: Update DSC capabilitie for DCN314

Mario Limonciello (1):
      drm/amd: Fail the suspend if resources can't be evicted

Max Tseng (1):
      drm/amd/display: cursor update command incomplete

Nevenko Stupar (1):
      drm/amd/display: Investigate tool reported FCLK P-state deviations

Yang Li (1):
      drm/amdkfd: Fix NULL pointer dereference in svm_migrate_to_ram()

Yifan Zhang (1):
      drm/amdgpu: set fb_modifiers_not_supported in vkms

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |   2 +
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     | 764 +++++++++++----------
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm |   6 +
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |   4 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   3 +
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |  11 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   1 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |   4 +
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |   2 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |   1 +
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |   4 +-
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |  10 +-
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |   7 +-
 .../dc/dml/dcn32/display_mode_vba_util_32.h        |   3 +-
 .../display/dc/dml/dcn32/display_rq_dlg_calc_32.c  |   4 +-
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c |  15 +-
 .../drm/amd/display/dc/dml/display_mode_structs.h  |   3 +
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.c  |   2 +-
 22 files changed, 464 insertions(+), 417 deletions(-)
