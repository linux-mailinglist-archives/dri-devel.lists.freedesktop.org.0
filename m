Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D3681213E
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 23:11:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D2CA10E82E;
	Wed, 13 Dec 2023 22:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2049.outbound.protection.outlook.com [40.107.243.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446ED10E82E;
 Wed, 13 Dec 2023 22:11:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fbf5LGJiWAlKP6nbtCldVpkPm429f0I+rbXL5tqqqvQW2c6j8Qt8V4grmll6S07+ur2kHAOSi8wKXohmXGEiJUF4jBVt3YNCJmZsAuIriE7ytD7HT06uN7spRq1ookg8/1rt0O89k8vT1CRwxJsBmOoVxLzpTT1DezFtDWHQrDL8FPRjT4aCcYBhJF1lzdejA99xo7SUC/825Lj93UVOF7EHQSkrlzki/pYJZrO9jnwRvYbaHaY8sHwQr5gJ4TBc7IGltKPkGDS99QfCq22Ih/0bdVvpUgElTiBai4g9WJQnr0P4BWD0O0qFN1ezEcF+H+HiJNQEUs+8U/+1b5wsjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FaI0T4ljnGSy/oZgb90y0HmOu7HJEIR3mw37SSdJADo=;
 b=T0QWGW917Y638XfAKpbhdJYbqLrGcLX+qyBXzNkcJ8arZTEdz8a39W+WIImFJ2m2e03Ofm42P5dz0co9eGSXtIWRPrFe9hGa5UTb0yRZzPEN1zFCUfIpTJ/aDBYd4OpJeg4/MSGX0o/gWbVNHgZazQj+KtCKvN19oYryx7lXiLppV6XXoUtqQVcDLgmNCiSmC0pdTVai88hv1RmWIz5UHPAcC3Zn/1pHG0Jm5/YpQrZeDAvEWmwFc889kW9EepH4d5pdcnt4V7NjOpqWw/TzVlOAhhhegWezZ3Vs09/Gel1JA2nz2OK7SdQY1KSlZSButWbuIg0bixAf6FmDmsiwJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FaI0T4ljnGSy/oZgb90y0HmOu7HJEIR3mw37SSdJADo=;
 b=5H+VLLQM6n9hKfybur5fZUkvq/Us+u+xCz9ic0MpbpRbFqv6HU1deG/FEGg8vJJNbAuQCH1/3eVkX6EpgTibE0bnoMzoy4hmfMj1pqIjszR407AXbh/Im2B/IK11BzfDcmUjScBaIhV8PI5z4OSHhh0AJIiwKZjcej//mM2TOLg=
Received: from DM5PR07CA0064.namprd07.prod.outlook.com (2603:10b6:4:ad::29) by
 IA0PR12MB7529.namprd12.prod.outlook.com (2603:10b6:208:441::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 22:11:41 +0000
Received: from DS2PEPF0000343C.namprd02.prod.outlook.com
 (2603:10b6:4:ad:cafe::40) by DM5PR07CA0064.outlook.office365.com
 (2603:10b6:4:ad::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26 via Frontend
 Transport; Wed, 13 Dec 2023 22:11:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343C.mail.protection.outlook.com (10.167.18.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.26 via Frontend Transport; Wed, 13 Dec 2023 22:11:40 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 13 Dec
 2023 16:11:38 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.7
Date: Wed, 13 Dec 2023 17:11:22 -0500
Message-ID: <20231213221122.4937-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343C:EE_|IA0PR12MB7529:EE_
X-MS-Office365-Filtering-Correlation-Id: aa187924-be96-4120-70cb-08dbfc287bdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kJbT7/sr01+1Yk0QBnpWjq296JND3g6nbQl2SHHwNzf6BGUEgbF61SZzrSI8/3pZPv4Am7JW0v6vNoYbkyVshVYvy9hS/MHBQGbP5cCGN3GPa5CpB7NDmTcBfJV60HX9V+RuQ/iQdeyl5JdqIBQtBM5kNGr0JafQr0uxYP11I+78IYcHYa65eFQQNdGwCcLrG2FBSi2dYXJfn4gJAyto/o941KSfKXBSLP8FTUVM4i3btFn3GGZ7IaJ2gD10HFAzBnHYDeqyxUlYWQOFBQxzHYFvllOUgheQkfdAMyBkiDP3YGifHCdNp8iJl51qGqyJzP9rj0sEJqanj1CmMNUXk8S0zfC8e5S3LGHH802/u6s2+/i3idU13phGpM8dccvbjYxK1XXzT/b1C1HUKjiqD8VWL4vRLcY5nHOxAHYvbDzwBuTV/EPb7JM2kho3KZc3gbzqi+Q30GRTg42uzmYMhqKPP49V3bHgV4nAoRbfCYngPoj0YCTuL1cfMo9cG46g+itbQjiZJYvPGYlUSSK+QMt+BdZs4dt14Bu16HL36toD7ORskkNEGQ+s009jwF41zQg5lIa2dIYoCYSbb5Q7Tga+4XhSw6UNhfXHZOuNWIHam2JQNlGGBkQqEUaVvy66ihrLmq9YxPWUi1Ub6MDlqd0ATFKmgoA8zXwYoRNTWf6ll3nJX3weKLBRCQvaHty0ZMxVRbwy899M/eDNpoO145rIaYCSSYTaLp8DGpcslF0nxZuymh1s6PkpwO8E1114
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(39860400002)(136003)(346002)(376002)(230922051799003)(82310400011)(186009)(451199024)(1800799012)(64100799003)(40470700004)(46966006)(36840700001)(4001150100001)(81166007)(5660300002)(40460700003)(2906002)(41300700001)(86362001)(356005)(82740400003)(2616005)(966005)(1076003)(70206006)(478600001)(336012)(66574015)(426003)(316002)(110136005)(70586007)(26005)(16526019)(6666004)(7696005)(36756003)(4326008)(8676002)(8936002)(47076005)(40480700001)(83380400001)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 22:11:40.9408 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa187924-be96-4120-70cb-08dbfc287bdf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7529
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

The following changes since commit b7b5a56acec819bb8dcd03c687e97a091b29d28f:

  Merge tag 'exynos-drm-next-for-v6.7-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into drm-fixes (2023-12-08 13:55:32 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.7-2023-12-13

for you to fetch changes up to a4236c4b410857a70647c410e886c8a0455ec4fb:

  drm/amdgpu: warn when there are still mappings when a BO is destroyed v2 (2023-12-13 16:50:46 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.7-2023-12-13:

amdgpu:
- Fix suspend fix that got accidently mangled last week
- Fix OD regression
- PSR fixes
- OLED Backlight regression fix
- JPEG 4.0.5 fix
- Misc display fixes
- SDMA 5.2 fix
- SDMA 2.4 regression fix
- GPUVM race fix

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu: fix buffer funcs setting order on suspend harder
      drm/amdgpu/sdma5.2: add begin/end_use ring callbacks

Christian König (2):
      drm/amdgpu: fix tear down order in amdgpu_vm_pt_free
      drm/amdgpu: warn when there are still mappings when a BO is destroyed v2

Dmitrii Galantsev (1):
      drm/amd/pm: fix pp_*clk_od typo

Fangzhi Zuo (1):
      drm/amd/display: Populate dtbclk from bounding box

Hamza Mahfooz (1):
      drm/amd/display: fix hw rotated modes when PSR-SU is enabled

Mario Limonciello (3):
      drm/amd/display: Restore guard against default backlight value < 1 nit
      drm/amd/display: Disable PSR-SU on Parade 0803 TCON again
      drm/amd: Fix a probing order problem on SDMA 2.4

Saleemkhan Jamadar (1):
      drm/amdgpu/jpeg: configure doorbell for each playback

Taimur Hassan (1):
      drm/amd/display: Revert "Fix conversions between bytes and KB"

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  2 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |  3 ++-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           | 15 ++++++------
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c             |  4 ++--
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             | 28 ++++++++++++++++++++++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  3 +++
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |  1 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  | 12 ++++++++--
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   | 14 +++++++----
 .../drm/amd/display/dc/dml2/display_mode_core.c    | 16 ++++++-------
 .../amd/display/dc/dml2/dml2_translation_helper.c  |  5 ++--
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |  3 ++-
 .../dc/link/protocols/link_edp_panel_control.c     |  4 ++--
 .../drm/amd/display/modules/power/power_helpers.c  |  2 ++
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  4 ++--
 16 files changed, 84 insertions(+), 34 deletions(-)
