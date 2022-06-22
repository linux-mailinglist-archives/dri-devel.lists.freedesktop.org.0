Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47733556DE7
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 23:41:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD5C11207F;
	Wed, 22 Jun 2022 21:41:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5BD1112077;
 Wed, 22 Jun 2022 21:41:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MEN5er3dHas3A511fbHsD6yMmRr3lYZ+U0PyCrYp6DYa4/qbXBaimokCG/+Z/wdLM/Ahgoja9Iq7eKkXxbLF7AUngf09qEvGx/izvvU4gA5MxidQytX0Tvz4rbaXIOqxPQXfra7z2HIdWgA5ewhn/OqWERxqdUe9pfscYJy8WFxQK7WN8ek5uoPC9k5ykvZ1V6I3whp0bkiFODQvWE901pQg22P1kX5WKi/C82+kspUWzvMqlciCNZVOP6BUMsdq1ett9KurPXtwuxlTq2MX9Y9m+3v84JYQ2XXM34Hp3YlRN76dWm/LacRMaRhJAyd9vstddt6GNFjKSOV/ZRKaZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ksy1lBld5qeTlrGafCV0VgkHUQB4kqHrs111JXJbZQM=;
 b=aRVK1O2xkjihORcLORvxeS4OwXTac4+XrtCTf8fOnmLZYI8WrkFVJGPWSyA38N2LOiJ4Yqwe2BoTDfJWzj1Hz1Na+EFRWvMLBz5D7txOK7JtHY5MNDk2Eg71Fb8eEYXiVUhbEqnCdbVhAsafvv7bYFgMATJFY1iPUnyeU2nWVKc7TB5wj005s4eVclaGzyyc+ha0W1ZOEIJt6ChOHycgPI19h/sI4tOc9n3aMCjf4iRiQUDASvttk2619INbbL0lWU3ZJvip+2CBRoMZRQeWa4k0li05jT9TAzeiq0xOEEOpWYGU2kF4dfOcIPK8pGoUudw+L0lCJQ7dDoRFAp8D/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksy1lBld5qeTlrGafCV0VgkHUQB4kqHrs111JXJbZQM=;
 b=sGKDlYl4S0rS5kSttFlh4ccajAZ8c2wcdzyenMqVlIug5R7ZJKhK6mORCSUaS5PVZCiKDZL/CeCnP2U/uIEYy+pkuFKMWgErPDnQx5AlRZSLJCE0Wbutq5ORwUGv78NJQNtMT80onf8FO4pLzOrAbT/Brt8TNIN6YHZaobnnub4=
Received: from MW4PR02CA0004.namprd02.prod.outlook.com (2603:10b6:303:16d::19)
 by DM5PR12MB2501.namprd12.prod.outlook.com (2603:10b6:4:b4::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Wed, 22 Jun
 2022 21:41:22 +0000
Received: from CO1NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:16d:cafe::e5) by MW4PR02CA0004.outlook.office365.com
 (2603:10b6:303:16d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22 via Frontend
 Transport; Wed, 22 Jun 2022 21:41:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT008.mail.protection.outlook.com (10.13.175.191) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Wed, 22 Jun 2022 21:41:21 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 22 Jun
 2022 16:41:20 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-5.19
Date: Wed, 22 Jun 2022 17:41:06 -0400
Message-ID: <20220622214106.5984-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51f3e4f3-e564-4378-78b5-08da5497f2e9
X-MS-TrafficTypeDiagnostic: DM5PR12MB2501:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB2501659115C200287C0F4180F7B29@DM5PR12MB2501.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b6vNgrQxXvessaCf6PgbEUrfyM+IAhwwDl5IRmBe2Fqz4tVT0Fftlt4uTjbzSoAiBa16Hy2o4DOUf5sMvAgWimlK9ro55+cWDwXU/1nlMrTS4I5jUl3VSrcNekIKA3vxIRLqYGJqigCgyWxSleqaMCW6IMTvisfS7h4PUuI3SSqwrql8luC9iXKlBl6PjtbH+8J7i8DUbyPOu6LsdVMfbO3SOVu7k6smfscLhKH3dVT32ij+V/2alMeIL5ZQ2FCbyp81FVrVcRrXbQaxqMmrQMcWArbC1eSpf7nIOcYXnrtUAv+fpW8GLiuC8MXri/PAHz2XMFph0gZ8qn9TPnFRsZmDsFtpbiBCvLBqauP/Nb3wUze6+zQw/BkUReqZuxyBTqmOzVaqQrRkEsd3x4TmqzzSUEBpy3qBepY+oYF1T46w2hhWFqlLESe7oXcmCevrhXLWNf0yKph1hHFrw9djdJOUWE/t+yRcuBbKk+bu7iiBlbgY/k33y6dW7S/SLaFcEF4vqt7h6ApKIgsyczfC+uDSevclkhH/ypUkKSYH/jEmKuuwrtvx9LVOc4Sm18ryhE6yi86B0qFimRESpgMPrEQxVMLSYYodNxIfNPF8EEoqH3bTGZLsmz/RucFHZBNAGpVwO+Asc9FxW3SBz78b1qTTbOf172CkSub5l26woYsED2BfdFP/X+azRjHatE9zRtFK2SLy1dMLopF5keIHt+8oYhWAdGvci6guA1d3WTPDfMQJ51Bq9oB2onFsiWH2
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(346002)(136003)(376002)(396003)(46966006)(40470700004)(36840700001)(2616005)(6666004)(7696005)(36860700001)(26005)(5660300002)(82310400005)(8936002)(2906002)(36756003)(86362001)(40460700003)(40480700001)(81166007)(426003)(186003)(110136005)(70586007)(316002)(478600001)(82740400003)(41300700001)(4326008)(336012)(1076003)(83380400001)(16526019)(70206006)(966005)(8676002)(47076005)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 21:41:21.6653 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f3e4f3-e564-4378-78b5-08da5497f2e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2501
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

Fixes for 5.19.

The following changes since commit a111daf0c53ae91e71fd2bfe7497862d14132e3e:

  Linux 5.19-rc3 (2022-06-19 15:06:47 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.19-2022-06-22

for you to fetch changes up to e84131a88a8cdcd6fe9f234ed98e3f8ca049142b:

  amd/display/dc: Fix COLOR_ENCODING and COLOR_RANGE doing nothing for DCN20+ (2022-06-22 17:17:16 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.19-2022-06-22:

amdgpu:
- Adjust GTT size logic
- eDP fix for RMB
- DCN 3.15 fix
- DP training fix
- Color encoding fix for DCN2+

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: Adjust logic around GTT size (v3)

George Shen (1):
      drm/amd/display: Fix typo in override_lane_settings

Joshua Ashton (1):
      amd/display/dc: Fix COLOR_ENCODING and COLOR_RANGE doing nothing for DCN20+

Mario Limonciello (1):
      drm/amd: Revert "drm/amd/display: keep eDP Vdd on when eDP stream is already enabled"

Qingqing Zhuo (1):
      drm/amd/display: Fix DC warning at driver load

 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            | 20 ++++++++++++------
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |  2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  2 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    | 24 ++--------------------
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c   |  3 +++
 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dpp.c |  3 +++
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c   |  3 +++
 7 files changed, 27 insertions(+), 30 deletions(-)
