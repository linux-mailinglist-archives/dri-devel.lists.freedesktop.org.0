Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8DE687467
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 05:23:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 008C610E2E2;
	Thu,  2 Feb 2023 04:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0544410E2E2;
 Thu,  2 Feb 2023 04:23:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWPmPsB79+xMe+ez6JG1fzE2ZXRkAXeAJv3mxHZH+RrKEG0ea2PmOI+FjKCJafvcJ86Hfk50dFNurj5fpu8c+0VevvUDm4WxKFnRuyTg+w8FA9bmZVcUKhWKu3sgH6e5E1juBOMMVcGgJ8Zk61hOz5Y3jEISjZudSkAbh907pBSdksGWVTos2cWJvxenc0HsoYct3gZ2qmwzGnW49K9JW/ELblG8989oZ6Pa9Vwhujg9/23YBTj25c+D+Xhp0SZ549i78Btxis1Ehi3ex/J4gc6dFJPOm+SuXMoiZ3Covpz6fUSCehvsPDOacbtYKlMOWy4ZSccKGgXLTcf+tS0nXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQsOChVutCGo3ALseh/a6B+xfUCjiOAqm85l2EKhtmQ=;
 b=jlDATlc+27Q1IXYEst/n6NpoRw6u1/VxKUHissPjR+4Cwp2Nv34PFi7om++b2Tjp+upcARwKMaDcYA5lYncXMXOwY/+Pt6xwixarDQRbeZS1V18kurjQjBSWJJBqkAz5foGAH322Bf7B/ScRm/8mjIufecQ+DtvDY1QkCwyvdx1bpFjhT3aL9Mfw5lwxYvuDPUicdnWuLf78vs3WbaUqvPdNgc8KOJHPOs7WbybJn5ToQV4V5DmyxVcGjUZlh5D4tXL7JEwPGpAP1vXcwYkGgbyl+PUJvX7HZLbFGiEW0t7WoyYxGg21hs0PIgWO/QDZyG1j2MaZPY0UGnvuKnCSQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQsOChVutCGo3ALseh/a6B+xfUCjiOAqm85l2EKhtmQ=;
 b=gC2j7QzhPERTKDvHOW6lSiXLhZxRCt7Vjr+VFm9UVKKl+in3noGgqttgh33dtsaj+awjQnKyEnJgzh57Ru23tTR4A8LzITAJK+S00Ssr3pwSoxikL0Fppsaq58g579OibK25BfdiIX/WPEWHQ4sU/CSZq2AwXWQCtDWi3NZzRxw=
Received: from DM6PR21CA0018.namprd21.prod.outlook.com (2603:10b6:5:174::28)
 by DM4PR12MB6278.namprd12.prod.outlook.com (2603:10b6:8:a4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.24; Thu, 2 Feb
 2023 04:23:36 +0000
Received: from DS1PEPF0000E642.namprd02.prod.outlook.com
 (2603:10b6:5:174:cafe::eb) by DM6PR21CA0018.outlook.office365.com
 (2603:10b6:5:174::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.6 via Frontend
 Transport; Thu, 2 Feb 2023 04:23:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E642.mail.protection.outlook.com (10.167.17.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.17 via Frontend Transport; Thu, 2 Feb 2023 04:23:35 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 1 Feb
 2023 22:23:34 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.2
Date: Wed, 1 Feb 2023 23:23:09 -0500
Message-ID: <20230202042309.24144-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E642:EE_|DM4PR12MB6278:EE_
X-MS-Office365-Filtering-Correlation-Id: c9323e93-f539-4276-b0e7-08db04d54082
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /t7fFPKIGHICx11rwkBS0qKuop7GeXDOP9w/Y+f42C7iIMUoRGKdb9//2VH03ZUujFZu2wIXvXa/KaETstlkGSjTnzIBMpOfSsEstS29VReMZMU0QoBw3GEVBKbym3pJVc1RN7Z59HibUW594ccFUJHKzMOskeDrToxb0mlOrfzZlPtlbRp4+jMFEUrki8odF4eHllH/bgzOHpduv9KGG0ty6/AsBTCogjeQv0lJFPdEtlEIQJLKOBwK6ua9GzaiGP6AHoOz1e9Z8waSORpjbwUGoznIK3Ctws6ekc2PTBffRmjgFSJmQg3oc5Jaa/DfTBGLLWXLE6nijjld+a5LeCTKJDVh5xxLyRs5i3vqOLt3up5qOoHpSfqY6877pfYbK9XmxERifkQYZejBZEyM9Bqfy+SAS6cSXzOLMuBCWs6C+syZpW41Yn2iFGi4mZH4j4Fxx++RqxnyoiOIAX+3bw7O1cmNYH80Pam3Bes8Jb++NZ8FKW4RY2dPhqAB7/iZNybtNgXVV2JlkT4lAtaBMlnRAjFK1AAcD4ZoB8nMi9wjRjwBHhwqGX1ZHz6qHDuXABI0YxmyXKwzW2yhlWYs3EH3P45XKTVvpgEPiOBAjUgEuB+A0Fc5wJOsH+lpuGBbzaFVdy2rT6W3v+Fy5X8vabTiwxMI0+KyrlGVjgOSkig5xLFVB80DggRVl1ofnBAE
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(396003)(136003)(39860400002)(376002)(451199018)(46966006)(40470700004)(36840700001)(8936002)(5660300002)(41300700001)(40480700001)(82310400005)(86362001)(36756003)(81166007)(36860700001)(356005)(40460700003)(82740400003)(2906002)(966005)(2616005)(478600001)(336012)(7696005)(1076003)(186003)(26005)(16526019)(6666004)(70206006)(47076005)(8676002)(4326008)(70586007)(316002)(83380400001)(110136005)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 04:23:35.9127 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9323e93-f539-4276-b0e7-08db04d54082
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E642.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6278
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

Fixes for 6.2.

The following changes since commit 6d796c50f84ca79f1722bb131799e5a5710c4700:

  Linux 6.2-rc6 (2023-01-29 13:59:43 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.2-2023-02-01

for you to fetch changes up to 6fc547a5a2ef5ce05b16924106663ab92f8f87a7:

  drm/amd/display: Properly handle additional cases where DCN is not supported (2023-02-01 22:45:51 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.2-2023-02-01:

amdgpu:
- GC11 fixes
- DCN 3.1.4 fixes
- NBIO 4.3 fix
- DCN 3.2 fixes
- Properly handle additional cases where DCN is not supported
- SMU13 fixes

----------------------------------------------------------------
Alex Deucher (1):
      drm/amd/display: Properly handle additional cases where DCN is not supported

Daniel Miess (2):
      drm/amd/display: Add missing brackets in calculation
      drm/amd/display: Adjust downscaling limits for dcn314

Evan Quan (1):
      drm/amdgpu: enable HDP SD for gfx 11.0.3

George Shen (1):
      drm/amd/display: Unassign does_plane_fit_in_mall function from dcn3.2

Graham Sider (1):
      drm/amdgpu: update wave data type to 3 for gfx11

Mario Limonciello (1):
      drm/amd: Fix initialization for nbio 4.3.0

Nicholas Kazlauskas (1):
      drm/amd/display: Reset DMUB mailbox SW state after HW reset

Tim Huang (1):
      drm/amd/pm: drop unneeded dpm features disablement for SMU 13.0.4/11

Yiqing Yao (1):
      drm/amdgpu: Enable vclk dclk node for gc11.0.3

 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c                     |  4 ++--
 drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c                     |  8 +++++++-
 drivers/gpu/drm/amd/amdgpu/soc21.c                         |  3 ++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c          | 11 +++++++++++
 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c    |  5 +++--
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c          |  2 +-
 .../drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c   |  2 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c            | 12 ++++++++++++
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                         |  6 ++++--
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c                  | 14 ++++++++++++++
 10 files changed, 57 insertions(+), 10 deletions(-)
