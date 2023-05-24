Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D4F70FFBF
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 23:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7FF710E695;
	Wed, 24 May 2023 21:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BF810E694;
 Wed, 24 May 2023 21:12:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oRzBxPqne0ora9snYsdCRXUJE/GKpFIKjjBZe6jJL2QxJd5i3vlSnwrbFNoTZjcrmisFXqo6tSN3IjDcKBaVkhHO8TXBhCeKUGEwVkT/WVmF1OhTwwG//M+Cl5mFgkaDXQg76bhff/8HqmZBpHqpSqT8AVYsJmci1VVWckpEAiQ/PeHhyide3Wv4EqccLuSNR+CdH0VMSepzuD2I7E5jX5RoaBOaq9ftuL26D5oB+k9CFvN1DhNpOG/sEZA0jrPn3EmBI15Hc9t8otzsuxGFPWoxTnJ0zEC+EW2T+eO6+OJzEKaNToP6Rbf5lXwDL5VMVjouADMs408Gxl5LtRaxdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hvyE/tr8G6vgii0dhS5O20oOzVET7kru4nS2PAdyp5Q=;
 b=BMyA2FUFzY1Z579D1EiLSSM77CJeVICKfKK8TAMsV+t/d9+f8kNItmlhhIcSLyeSJEKajmrbdXsBXY4UMq/HizuLl8scXbJRhETN52HXQND53uJHnh9dPlrlfsqZtX4ut8X4iXExbozauGiwboMTSkyvHPSNHpHP9o79S7G/iF/bksN5zLoQ9PtxXVSyLPW3tk6GB8+JxN3pqye5D3BQB+62DB+SZNW2p90hpbk2dlctlPPm5QHnjw7GMP//ZYZeEXIiKoX/H3DwzGFh+g0O/rJmy3jfA3uc8bqTd27yzvSiiiSlExkNg7ewv8kcZI//2Ck9qduGhH9b2AWuKH8xFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvyE/tr8G6vgii0dhS5O20oOzVET7kru4nS2PAdyp5Q=;
 b=d6GQ39ZV/WLfjv/s2IMV1D6I6TctYfTLR002Kg5gdC5G2RsQHLBDPoFnD/+F1TQOSauFeOe7hvvbrRVC0omC04Ae5KhQoRzSey6EwZJjZYBAs9vvae9Ggt5tvvmQli0d8vgpvGYQVjQ6xUUALY3ibaAgQpnva2CQ4N78Y9jVUHo=
Received: from BN9PR03CA0790.namprd03.prod.outlook.com (2603:10b6:408:13f::15)
 by DS7PR12MB6335.namprd12.prod.outlook.com (2603:10b6:8:94::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 21:12:55 +0000
Received: from BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::e9) by BN9PR03CA0790.outlook.office365.com
 (2603:10b6:408:13f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Wed, 24 May 2023 21:12:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT032.mail.protection.outlook.com (10.13.177.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.30 via Frontend Transport; Wed, 24 May 2023 21:12:54 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 24 May
 2023 16:12:50 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, radeon drm-fixes-6.4
Date: Wed, 24 May 2023 17:12:38 -0400
Message-ID: <20230524211238.7749-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT032:EE_|DS7PR12MB6335:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eeed473-132a-4a5c-f93a-08db5c9ba447
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EALl2QHlAscXY+lLc11uCISgBMswVyVP8S9z9f3OKSaw2r1sOPmjumD/pUWQJKnDp01ssUcJvJPVUUJPuO8+1gFBbkYbrx6wD6uOlk8K0G3GD4IIRED4gaATml6csocOCEaZdMkpVKyBDAG6xIQwfWXKZ+D1juYq7lNboG5Q+mLnn2h28miA7k/QguLir5kkEeIXuZMzkJ0IGLroMbKAaINRANC1xFxngcTzIZZ2dJIuazm8AjX5WkDhU4DVIPjUAhozzFf3OuTf5EV3KUE+oicf3ldKbw1yNBSg8xgOTCiWeVz/DsOweMDqAMsKHGnEA5uPmHIZxGUmhyeaZsh2dfGW4XIK/0rjfTyWIQ74osAoabCTbxeUeTgj9mb5JrOT4x5Tij9SunnkuFoY/VTX/VivxNnZzXgtR9+FSsvIBCgG2X+hzngurjt6ssE7UUcs0VNHha5b74Uk5E3SsOzbAxs5bbuWtp2tvaFvu7g97f+espJJ+GmLk+MTBxFg+Rz8nflzhAexEPnmsTAql3Z/jpJI/yMnGIqPuIoCdiy/yCG77saCRWvRFXY3lFTtauUJWQacnq2jJW8yrFJP599jLE4iQV2lmjK4ARClGLWtX3xlCW5nJgl0Sfj0+B75r03jcuTwYdF1DgI8O8+ZNP/b1w0dxVA5JvFtWiIHoPqR109MDQR1+hkP3Cle5C1OkGCCeP24RvaP3/855zjIpy2S5ZzP/IAEdcZ0GMC8Ube0wNA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(396003)(376002)(136003)(451199021)(46966006)(36840700001)(40470700004)(2906002)(36860700001)(47076005)(83380400001)(86362001)(186003)(2616005)(40480700001)(336012)(426003)(16526019)(81166007)(82740400003)(7696005)(5660300002)(8676002)(316002)(36756003)(8936002)(356005)(41300700001)(40460700003)(966005)(1076003)(6666004)(26005)(478600001)(70586007)(70206006)(4326008)(110136005)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 21:12:54.8454 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eeed473-132a-4a5c-f93a-08db5c9ba447
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6335
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

The following changes since commit 79ef1c9d14c65a5c3f7eec47389d8c2a33be8e8d:

  Merge tag 'amd-drm-fixes-6.4-2023-05-18' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2023-05-19 11:26:21 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.4-2023-05-24

for you to fetch changes up to 482e6ad9adde69d9da08864b4ccf4dfd53edb2f0:

  drm/amd/display: Have Payload Properly Created After Resume (2023-05-24 16:37:00 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.4-2023-05-24:

amdgpu:
- Fix missing BO unlocking in KIQ error path
- Avoid spurious secure display error messages
- SMU13 fix
- Fix an OD regression
- GPU reset display IRQ warning fix
- MST fix

radeon:
- Fix a DP regression

----------------------------------------------------------------
Alan Liu (1):
      drm/amd/display: Fix warning in disabling vblank irq

Alex Deucher (1):
      drm/radeon: reintroduce radeon_dp_work_func content

Evan Quan (1):
      drm/amd/pm: add missing NotifyPowerSource message mapping for SMU13.0.7

Fangzhi Zuo (1):
      drm/amd/display: Have Payload Properly Created After Resume

Jesse Zhang (1):
      drm/amdgpu: don't enable secure display on incompatible platforms

Jonatas Esteves (1):
      drm/amd/pm: Fix output of pp_od_clk_voltage

Sukrut Bellary (1):
      drm:amd:amdgpu: Fix missing buffer object unlock in failure path

 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  4 +++-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  4 +++-
 drivers/gpu/drm/amd/amdgpu/psp_v10_0.c             |  8 ++++++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 25 +++++++++++++---------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c | 16 +++-----------
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 | 12 +++++------
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  1 +
 drivers/gpu/drm/radeon/radeon_irq_kms.c            | 10 +++++++++
 8 files changed, 47 insertions(+), 33 deletions(-)
