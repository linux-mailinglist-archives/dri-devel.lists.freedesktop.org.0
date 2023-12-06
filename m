Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D65807B2B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 23:11:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B9A810E7C8;
	Wed,  6 Dec 2023 22:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E4810E7C1;
 Wed,  6 Dec 2023 22:11:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TU1QEkDVI9MBHPxoezw+L87JHQ2E/Ht4yrAUAt7lyvF3kvjUyXzzt8NrjomNSeqDigTBQCeeXyxuNMJnu3ha4y6++kz3NEtFu3od7szlCaCakjB0BgHA0D7Tm77s2fBVQnr7fHnQ72VeV66rmw2oECn3rFdxaIyZW2QZ8Fh7DZWSixz9sRuyHgOjQUWhYMVi1ChpQ8L2LWVWCb74ocaPpJH9LbbWty69BF0pSEseSXrBvn+MnbLfm1bCXWE+tzlamBaNW0l5SSu6ZU0ip95KGdvl9Maxe9E1Bouu4Ec17092/ykBya+4Gs8GLIzZ1nj+xEp0CSY/a9TQayQZt6xE8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hzArVwy11tTpswIoJc34fM+SQeLgl+GWY9vMJrMz2YQ=;
 b=k2yqs0RP/T62VC55sqrsEcy+5UVqbaJfWNcXPiVv47lPPPRyRSrskttqWoJ0/d0UDPiO5oqVboSGCGnG4EHmVXkQqQn4COyjsryxo1JdUcvDxfUdxZDspKQV4cXVwMggQKJ+U+KoXJjCRifo0bun69N+Vn9rN5Ak5dL3NGI2myC9h9FxFaE64qXKimfCm8PwLlQT4cKqQhdgqHE2jguGM5heeCUmJwcSIUrql2gPmjnA/RGGd5dRHIvtUGV331i6AMlgKBgeWuGpc8ZvCqG1a5fhjbid42+4domsfsGAC5bp9fWm24brhu+1yRMte0x/hKVpuxMXEhivRo34sIEaJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hzArVwy11tTpswIoJc34fM+SQeLgl+GWY9vMJrMz2YQ=;
 b=0qJbL5NMi5Gm1iPo1cKN4wMqK67xHZTYaH5Bg65DQIP5pYElTHFwdws9sLnBIiBKMKRwvmMsm+EZTiz5pGLdPMLaDyqstqzwjXneSiVrgHzUqZwu9IXYX61afr71X+/YB3I3+jkbQRJq55pUymqYItPgJm6t0r/mt+PpLGuUsQI=
Received: from BYAPR21CA0028.namprd21.prod.outlook.com (2603:10b6:a03:114::38)
 by PH0PR12MB7814.namprd12.prod.outlook.com (2603:10b6:510:288::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 22:11:23 +0000
Received: from DS2PEPF0000343F.namprd02.prod.outlook.com
 (2603:10b6:a03:114::4) by BYAPR21CA0028.outlook.office365.com
 (2603:10b6:a03:114::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.5 via Frontend
 Transport; Wed, 6 Dec 2023 22:11:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343F.mail.protection.outlook.com (10.167.18.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Wed, 6 Dec 2023 22:11:22 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 6 Dec
 2023 16:11:21 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.7
Date: Wed, 6 Dec 2023 17:11:02 -0500
Message-ID: <20231206221102.4995-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343F:EE_|PH0PR12MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: f395ad0d-3d45-4628-ca83-08dbf6a84809
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D2aXhyGyu0FDl6JUL0LgMPJwc9fUNsD/j7E3pVf7nx/fCadW4ju3XpEU2q5YlwjDLRKk8zLSqD8XHNI+FecZnKcoR0ZSKc5g4sNxoSFR1fCe29PF4jGDyP73DVaLMyUg9cixncLHhRf8ZmDPjpY0X5H1U51Xnc/5/+F2HkWuwy/qSUGBqHv0lq56VelAw1AkzsDhrGkVHzdme/OKZ7F6Jq2rqlthyXcC9YQLo7s66nebvDZFjIzxiKNoc7FokYZQJaklLkPjjVeUb5Jc2h8kBfsyF03z+YMnOyRN+mVH/S+7iteUqrfO5YZTmdZ4sRHRBOiq5I7IwFXUP7qiEvgQHHAoKBcoE7JfmfBBsVFWQiMXyom3l/ENMoWufTlCnyZtXYXmDpCBbuo8YzSdz1tpjSMIqEebImShBjtlW7HqGcjTOzrUTjKKv2yQZePkv/nBp49v6E3DAyladIO8Q+F5WWyCZrnPvjpZLQuiOTRMxXXfaag05AjPudG0+vpl5Amt+QplD85C+G24732bbo7NC2T4c1U7bMRXqmIeY1D4rpc0eF1KueqdG8WeYdYms0Mh/ZgeuBK89fCM9bOIw81GEoCwC07fwYUPhYvvxb7O8QHkSPZqVWTEzJSuj1DfTlzYHmVx6Mv8HlnEKeDMlWLMCrv/DDsqA4RyUy/mcX0EDAdcBVfFJROBt5GyID/ezdU2WBQypIQm7K4+g0I9TQD3zIEYcRlf8zDID+yVe5a5RZsC7eSapebKAOfLc9uYnJG/Gu1j4EOQwL5Ooh6alyWkksIY3trntAollWceKcxwwmM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(376002)(346002)(136003)(39860400002)(230173577357003)(230273577357003)(230922051799003)(82310400011)(451199024)(1800799012)(186009)(64100799003)(40470700004)(36840700001)(46966006)(5660300002)(40460700003)(16526019)(26005)(1076003)(336012)(83380400001)(41300700001)(356005)(4326008)(81166007)(82740400003)(7696005)(8936002)(2616005)(8676002)(47076005)(426003)(36860700001)(70206006)(70586007)(36756003)(40480700001)(966005)(2906002)(86362001)(110136005)(478600001)(316002)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 22:11:22.5815 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f395ad0d-3d45-4628-ca83-08dbf6a84809
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7814
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

Hi Dave, Sima,

Fixes for 6.7.

The following changes since commit 33924328498e903bea74727353e5012d29653aff:

  Merge tag 'drm-intel-fixes-2023-12-01-1' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2023-12-05 12:19:22 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.7-2023-12-06

for you to fetch changes up to dab96d8b61aab1a4f99d0b86964a6c40e7bb1756:

  drm/amdgpu: fix buffer funcs setting order on suspend (2023-12-06 16:05:32 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.7-2023-12-06:

amdgpu:
- Disable MCBP on gfx9
- DC vbios fix
- eDP fix
- dml2 UBSAN fix
- SMU 14 fix
- RAS fixes
- dml KASAN/KCSAN fix
- PSP 13 fix
- Clockgating fixes
- Suspend fix

----------------------------------------------------------------
Alex Deucher (2):
      drm/amd/display: Increase frame warning limit with KASAN or KCSAN in dml
      drm/amdgpu: fix buffer funcs setting order on suspend

Alvin Lee (1):
      drm/amd/display: Use channel_width = 2 for vram table 3.0

Hawking Zhang (1):
      drm/amdgpu: Update fw version for boot time error query

Ivan Lipski (1):
      drm/amd/display: Add monitor patch for specific eDP

Jiadong Zhu (1):
      drm/amdgpu: disable MCBP by default

Li Ma (1):
      drm/amd/swsmu: update smu v14_0_0 driver if version and metrics table

Lijo Lazar (4):
      drm/amdgpu: Restrict extended wait to PSP v13.0.6
      drm/amdgpu: Add NULL checks for function pointers
      drm/amdgpu: Update HDP 4.4.2 clock gating flags
      drm/amdgpu: Avoid querying DRM MGCG status

Roman Li (1):
      drm/amd/display: Fix array-index-out-of-bounds in dml2

Yang Wang (2):
      drm/amd/pm: support new mca smu error code decoding
      drm/amdgpu: optimize the printing order of error data

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h            |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            | 17 +++++
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |  5 ++
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             | 12 ++--
 drivers/gpu/drm/amd/amdgpu/soc15.c                 | 15 +++--
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  6 ++
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |  8 ++-
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |  4 ++
 .../drm/amd/display/dc/dml2/display_mode_core.c    |  6 +-
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     | 17 +++++
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      | 10 +++
 .../pm/swsmu/inc/pmfw_if/smu14_driver_if_v14_0_0.h | 77 +++++++++++++---------
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  9 ++-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   | 46 ++++++++++++-
 15 files changed, 187 insertions(+), 53 deletions(-)
