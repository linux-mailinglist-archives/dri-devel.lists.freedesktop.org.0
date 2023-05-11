Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D21A6FF3DC
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 16:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC9710E259;
	Thu, 11 May 2023 14:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E2710E259;
 Thu, 11 May 2023 14:18:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zk5+lvq+HaSZ8n8lJIa+jW2fCjmFXfoiE38Gr0BK/hX04REE4XxNesiGkcXTCyyaiPnuMV7TL5STWU6GdyrgUD4Cd5UKJbjPSbyjM2RsM0OAXg2Hl1WIYVIB0P4Z7A5SeHBcuAt7BGRKuQaSu2pY6wXTbDEQFx6FVI5djCjBm0J+U4DllAq48w+gEZC2iMWUazfflNfFnGqFp/1gTPZ3UUnVDyxD3Dl8QngCe3z0KKQHKjuxArv80g5LOAo1Fl3+W+Dir8Y7oGwrllpEOXSvmggZ8/8CIpal/MiwjPYp2W8u9lPuRiDUqnIK/LQf4ekZFn4SV3ohxNAZG4iCFVn69Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhLvi8DWP8MGfc9ZcprvecLF37eKfASrNuMmur/Gzjw=;
 b=XKvwPzDCxm09yXXTcGU68ifWQFOl5p5xfqaYq+WVilU8k4qGad79nIBFVTWcNv04SkN31k9EEmzGdVndebQU0bltmd6uyakFowyhHqvojYvTbJhwbNxXCo/9RdrvAUQ8A/RmE62xTB925jNaTHNuNAX5UzSOJ6s2OW4jhWhqoBqyojHA01etVzjIfoNqA+HBGWq+kBMYP8oOisRaweM+MR5HzzLquI12Sn/7KARoofNg9lh0voCwtVvEmlUCj6Ca1ugY7xzYUY2Q322TQGdGhGJFbidrO5fiZyWm0arsgqxzUBhgF9kaSQ2OIp3NYi/PeGNVVu5qW5gFLhygf/IfkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhLvi8DWP8MGfc9ZcprvecLF37eKfASrNuMmur/Gzjw=;
 b=W60n16rSHKcM15eNefU7PX/2v4vdxGK/4bYHMOhRuOtV0v4mWCiEBT9D7pLsbRwGlMjG6kjCEQ31j3OJCgR9+q75UyDuuaR9b+begV669gjUrTKJ/04PjYgoWv0AaAASN1R63uSrQ9ft4o9IcXxif1zSRVOuhUtsk7V65s92uX4=
Received: from DS7PR06CA0042.namprd06.prod.outlook.com (2603:10b6:8:54::23) by
 PH7PR12MB8124.namprd12.prod.outlook.com (2603:10b6:510:2ba::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18; Thu, 11 May
 2023 14:18:10 +0000
Received: from DM6NAM11FT112.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::66) by DS7PR06CA0042.outlook.office365.com
 (2603:10b6:8:54::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.22 via Frontend
 Transport; Thu, 11 May 2023 14:18:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT112.mail.protection.outlook.com (10.13.173.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6387.22 via Frontend Transport; Thu, 11 May 2023 14:18:10 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 11 May
 2023 09:18:09 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.4
Date: Thu, 11 May 2023 10:17:55 -0400
Message-ID: <20230511141755.7896-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT112:EE_|PH7PR12MB8124:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fa3bf96-3a01-48d0-7aba-08db522a8c7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ByfD4P35phWvfeTxm9wQrPAmzNzosTjHQq1AY17PvB41yV+lU17wyOhs+YglzvOTMvndkfmFIESV3mmyF0GUkrBBq1tiPxP9Cy2uKyNvj8soWPYJiaaNrkYXjLVCT5mFKdWP9QSiPoFp/tIhQWiO0I0uagH5iOM89t6nG+94MlK9EHaS19JpNxA/8401j2qh/oHcLO8E0OdNwalrBTtimQmrj7TgFJ5J/0E7X8hsPGOU3cf3M7iaS5CXlwGXRZByMk4Ykm8k6Cd+gQ8eACdv1vtag1y9fAyT2zIS53rkRkkFRxwRWc2sjauvSqPt52egct0lasYDJye/wsOaWZ0q3INbz+olwxHMDGdaiWvCehhKsL7GbtGIaLfcY+494aM8w7a4hLhjlGDFBN94kHURdpHKOyVBP26SaZLu0nrQYxgUZbYcn8fIha3txgnJ3vkdOzKeXImZ6VjmPmOf4p/+YxPi43LHaUSn/Gx2VwIeBC4qk82TE4LhRaS8KlugSJcEmwypEyKW8jLEmN4UWiIwGSdwnC1B279WbNPOZ7PHnbCuas0N00eRPocSBdWIVwJiuGbLOyo3+c6D38tGgDYdeJg7RSxnSYckIut6oWJBDuQrpQGBldSNOFIS1K0k3jHFalJxZhxIuQBVdyiVgFY3XyXdLw5lUpaqjMS+HDs+UQzrYfRSnoiGoPEoVjBq8RxrtNvBPmpMHTD62no0om1edZ8RnxOShEkmfO7TbUehqoc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199021)(46966006)(40470700004)(36840700001)(7696005)(356005)(16526019)(82740400003)(1076003)(26005)(336012)(86362001)(426003)(40480700001)(41300700001)(2616005)(6666004)(47076005)(36756003)(82310400005)(186003)(966005)(83380400001)(81166007)(36860700001)(70206006)(70586007)(110136005)(478600001)(40460700003)(4326008)(8936002)(316002)(8676002)(5660300002)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 14:18:10.1217 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa3bf96-3a01-48d0-7aba-08db522a8c7a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT112.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8124
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

Fixes for 6.4.

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.4-2023-05-11

for you to fetch changes up to 996e93a3fe74dcf9d467ae3020aea42cc3ff65e3:

  drm/amdgpu: change gfx 11.0.4 external_id range (2023-05-11 09:11:14 -0400)

----------------------------------------------------------------
amdgpu:
- VCN3 fixes
- APUs always support PCI atomics
- Legacy power management fixes
- DCN 3.1.4 fix
- DCFCLK fix
- Fix several RAS irq refcount mismatches
- GPU Reset fix
- GFX 11.0.4 fix

----------------------------------------------------------------
Alvin Lee (1):
      drm/amd/display: Enforce 60us prefetch for 200Mhz DCFCLK modes

Guchun Chen (4):
      drm/amd/pm: parse pp_handle under appropriate conditions
      drm/amdgpu: disable sdma ecc irq only when sdma RAS is enabled in suspend
      drm/amd/pm: avoid potential UBSAN issue on legacy asics
      drm/amdgpu/gfx: disable gfx9 cp_ecc_error_irq only when enabling legacy gfx ras

Horatio Zhang (1):
      drm/amdgpu: drop gfx_v11_0_cp_ecc_error_irq_funcs

Leo Chen (1):
      drm/amd/display: Add symclk workaround during disable link output

Lin.Cao (1):
      drm/amdgpu: Fix vram recover doesn't work after whole GPU reset (v2)

Saleemkhan Jamadar (1):
      drm/amdgpu/jpeg: Remove harvest checking for JPEG3

Thong Thai (1):
      drm/amdgpu/nv: update VCN 3 max HEVC encoding resolution

Yifan Zhang (2):
      drm/amdgpu: set gfx9 onwards APU atomics support to be true
      drm/amdgpu: change gfx 11.0.4 external_id range

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 12 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |  8 ++-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             | 46 ---------------
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  3 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |  1 +
 drivers/gpu/drm/amd/amdgpu/nv.c                    | 22 ++++++--
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |  8 ++-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |  2 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c   | 65 ++++++++++++++++++++++
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.h   |  2 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_init.c    |  2 +-
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |  5 +-
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.h |  1 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                | 25 ++++++---
 14 files changed, 131 insertions(+), 71 deletions(-)
