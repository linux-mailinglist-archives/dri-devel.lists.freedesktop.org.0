Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F90D6B1A74
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 05:39:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F219A10E792;
	Thu,  9 Mar 2023 04:38:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2067.outbound.protection.outlook.com [40.107.101.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D96C910E786;
 Thu,  9 Mar 2023 04:38:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RnWYzeB8hirdj8Cr6wYkK4YsD1v1Hdf1pyJnyOk6OXdQ0v2NUs8/0DDRvU3pDtVRYCCokE5FquFNWWW9+hgzZ6gjh1dpoz0m3c3hzwXp11gyM89U3jlMY2PDsQqTOIf6IW1OSaaFodx4yT9xTiuvicxUZwGVsafFwO+IlDVJLQfKF9ECJlCIBNtCBp2+o0UO6b8JCjixmKrDCk8BaOLqxeDhYtevN3de+ODlu0VweMI1wfF3vF7hKjGReRUxgqeM9i0LncL4kz4tjAWuaqGKDdut/zh2l0d7FE1oIYqx4qZkUxjXvtCsrHM3ggDC4A2u9AmRgtHwZl4O1Zk6CFtfUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUPc6Daf8PfvPoTnGaivzOTGsdvrpjissNCCN8yFPOk=;
 b=ZQwIKKI0QceKSCEr1G4HLmtlDJHpixvaNCm8FymG4gs+pCY7eIEDVpBZH/LvfEeTf31sIJbskfnlBq35E3WOEzpJuDgit0lQmy0xK6eCy08UZJ84L4I1LnjT89DjiryMfKN59PryU9IdUUCnLG8ep8u7Kw755b7JMka8urQeeWIIGvr7EEvCaj5fvF2yctHxQsAiSufgU7+w4ZeyF8DbNCwyLydpBnWPGRdRxrWhWr7pCnd3Sk06r3HHQ+9KLHYDzHQVpKgyk5Z/Wrc72Hly6qs8PyCfJTWY7PMDRM9htLbMU1o4LX/6vsUQT7EDvddJWlRdu4jRHihqtHPnfz5maw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUPc6Daf8PfvPoTnGaivzOTGsdvrpjissNCCN8yFPOk=;
 b=4tzxQguLgr3rwkw/HJHrSZS8/dbprVJnS37I7+0pqoFwoUtggjxWGf+MuO4oDZYnXtCTJAQdRc7xQkBQE5Dn9tBnbR4DZ9Gms5Y6uhIHh/yqeRtMspW163KE3HVgGR2QyheIsaczZVtIopRJJTswGVAdnyasnal6TeT9l4Kra3g=
Received: from CY8PR19CA0040.namprd19.prod.outlook.com (2603:10b6:930:6::20)
 by MN0PR12MB6295.namprd12.prod.outlook.com (2603:10b6:208:3c0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Thu, 9 Mar
 2023 04:38:47 +0000
Received: from CY4PEPF0000C970.namprd02.prod.outlook.com
 (2603:10b6:930:6:cafe::fb) by CY8PR19CA0040.outlook.office365.com
 (2603:10b6:930:6::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19 via Frontend
 Transport; Thu, 9 Mar 2023 04:38:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C970.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.13 via Frontend Transport; Thu, 9 Mar 2023 04:38:46 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 8 Mar
 2023 22:38:45 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.3
Date: Wed, 8 Mar 2023 23:38:16 -0500
Message-ID: <20230309043816.7840-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C970:EE_|MN0PR12MB6295:EE_
X-MS-Office365-Filtering-Correlation-Id: 6feebda5-3a46-4313-e7bf-08db20582bf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hdCxQ7hRAhqZfgcIJa5L6OKtNNXjHEVaZdshhpv3vUHlLWyEDPoT/INImwTFabh/IaF0Vl9GLuz47bAmadNymv45BwWzCityGhOiGNpqz61mQ1CmQHUkXQtgfJJ91slN0aLwDJdTz6K5EI6o3S6rO8bJHHOL3IX2tPdCAy+HmBWyg0T35B0U53BTtLN5weGF/6rmPGovBWlcyP6wh0tEzyhwiy4Bb4+CRCq1D0Vila9ovyDPb9s5o0d0tP4u2Kw1smslA3S/G2wa3OwiAmEM7OK9L2KCltMhYY67H/TpSkf6dclUCGJa+FhcLg2s7oq9eY7qoDKh1SkYCRu74tZy2yZWIcrPEhAbjNDMLpLp4zZsSgIRg74Uy7mKwC+DSePooJcv7VFn4ov0n/XcgwuKBw0WzOCi+tsGW+WTqEBtkPOaJ3ggHKXDxS0/I/tbl/m29fOUccfc5BiFWQuLedI0w3ISF/iw0DYYDO3C/D59+Cpb0xf/hr9Hk8ayyZL8oB3w0JTY+PGxhs58dvZVv8LUa3bMW8bgD/Kbb5tbodIY4A33E6XmleHJYeYvZcz1ihBplRF7iskUAfjy3cG48Ba49zdAezbbGFIf7GFumnMr2kxxw8cqmfJxgwaI/qYwtiOuRfcTkFiSDS5Yi5zx4mWSC7dHLlWvLKSyQb+1yEi4GAk1aH2IZnlfLpsKMEPxY7uq
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(39860400002)(396003)(136003)(451199018)(46966006)(36840700001)(40470700004)(426003)(81166007)(356005)(47076005)(7696005)(5660300002)(36860700001)(8936002)(478600001)(36756003)(16526019)(186003)(110136005)(966005)(83380400001)(40480700001)(336012)(82310400005)(41300700001)(2906002)(2616005)(26005)(1076003)(316002)(86362001)(40460700003)(6666004)(8676002)(4326008)(70206006)(82740400003)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 04:38:46.8906 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6feebda5-3a46-4313-e7bf-08db20582bf8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C970.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6295
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

The following changes since commit 66305069eb6d17d9190cbcd196f3f7487df47ae8:

  Merge tag 'drm-misc-fixes-2023-02-23' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2023-03-07 05:42:34 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.3-2023-03-08

for you to fetch changes up to 41f95a0e40903fcf70463fcc060b7faf761b23f6:

  drm/amdgpu/soc21: Add video cap query support for VCN_4_0_4 (2023-03-08 14:39:09 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.3-2023-03-08:

amdgpu:
- Misc display fixes
- UMC 8.10 fixes
- Driver unload fixes
- NBIO 7.3.0 fix
- Error checking fixes for soc15, nv, soc21 read register interface
- Fix video cap query for VCN 4.0.4

amdkfd:
- Fix BO offset for multi-VMA page migration
- Fix return check in doorbell handling

----------------------------------------------------------------
Alex Deucher (3):
      drm/amdgpu: fix error checking in amdgpu_read_mm_registers for soc15
      drm/amdgpu: fix error checking in amdgpu_read_mm_registers for soc21
      drm/amdgpu: fix error checking in amdgpu_read_mm_registers for nv

Candice Li (2):
      drm/amdgpu: Support umc node harvest config on umc v8_10
      drm/amd/pm: Enable ecc_info table support for smu v13_0_10

Harry Wentland (2):
      drm/display: Don't block HDR_OUTPUT_METADATA on unknown EOTF
      drm/connector: print max_requested_bpc in state debugfs

Mario Limonciello (1):
      drm/amd: Fix initialization mistake for NBIO 7.3.0

Shashank Sharma (1):
      drm/amdgpu: fix return value check in kfd

Swapnil Patel (1):
      drm/amd/display: Update clock table to include highest clock setting

Veerabadhran Gopalakrishnan (1):
      drm/amdgpu/soc21: Add video cap query support for VCN_4_0_4

Xiaogang Chen (1):
      drm/amdkfd: Fix BO offset for multi-VMA page migration

lyndonli (2):
      drm/amdgpu: Fix call trace warning and hang when removing amdgpu device
      drm/amdgpu: Fix the warning info when removing amdgpu device

 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      | 10 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            | 17 +----
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |  7 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |  1 -
 drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c             | 14 ++--
 drivers/gpu/drm/amd/amdgpu/nv.c                    |  7 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |  5 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |  8 ++-
 drivers/gpu/drm/amd/amdgpu/umc_v8_10.h             |  4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c          |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           | 17 +++--
 .../drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c | 19 +++++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 75 ++++++++++++++++++++++
 drivers/gpu/drm/display/drm_hdmi_helper.c          |  6 +-
 drivers/gpu/drm/drm_atomic.c                       |  1 +
 16 files changed, 146 insertions(+), 49 deletions(-)
