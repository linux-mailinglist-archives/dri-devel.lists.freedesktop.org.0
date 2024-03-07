Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 603878751F0
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 15:33:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F8010E06C;
	Thu,  7 Mar 2024 14:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="H7TIXPe7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2071.outbound.protection.outlook.com [40.107.243.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC79710E06C;
 Thu,  7 Mar 2024 14:33:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HjMQjgMPmmpl+74/GnlFlxlj8Y+GPlogaKs4MIXtaQFExJcEu0V0b1wRO/uQBJopTXg/jCTAl39gwjUznDdxP9sOidtXByewFA9PbMIL9/pjzc28E5wWMmZMBQthv1rqqyVVezniSqWyFhuaXp6p2+EROmkkxrFL//n0Dc2bzKF8TAaQTBcvW4nZt/yjO+kWWZ94fGOw61UtI0r6Yo7wc3r2egwvUNiq7bM6tIm//+s6l//BBpMWW3KIRmJT58S/I19T2aRqoq7DcIKCmcpCc50hvXSWT15YXNm2ISLr8X/kGW1IE/wjFkV3UPnorzXdxxLO77Wtk+2bRHu5oehUmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4RgnPQJ1rJ3X17zFWF9LhGpkoY0ir8v7k50GOxjlkOE=;
 b=In1eiuiZkNFpwyb4P5gYUz/Wfvdfeyp+A2lWa2xJU54uhQ5MiXi9C9Kw6MmfNTSarwzwNSRgP0DWuLWlobvzcgnPCMZq1qohVKBDRUYOUeFz58yGAZKIfkt+lrDJfsbyCN/btsP1n/istcu2vbwC7KgsNboVjX4hE+DH8GHNoVYrGPVTQoJVUC9e2hZ+gkfKBQDqyHCy9I3o6viuwEMKFUNq7meaYJzkE7g3322Zbmi+9VwlBevvctv9/ExG5RtxiB9AbAdikdD8GYn5MlMM0/8QJG40jbEFnmHmqtAIFxbtUb5j52Mg6w/YWqjWljIOo8IkXoiDAELAL8HnCNZrwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RgnPQJ1rJ3X17zFWF9LhGpkoY0ir8v7k50GOxjlkOE=;
 b=H7TIXPe7qLVR18mu8tP77xZw0wFVO3gB9422YfPqlO09hcirnjEPEu9YSXg5EGiARsDPueAnDge85ts/5XiSDMs4RxjCDPSU5S5fC2FaT4eK6Y/redgLLkwZKfVPpoUZGnW5w6KAUT3ghc5+suYrxmn81omntUIsb2BzPG8w+LQ=
Received: from BN9PR03CA0135.namprd03.prod.outlook.com (2603:10b6:408:fe::20)
 by SA1PR12MB6894.namprd12.prod.outlook.com (2603:10b6:806:24d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Thu, 7 Mar
 2024 14:33:35 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:408:fe:cafe::30) by BN9PR03CA0135.outlook.office365.com
 (2603:10b6:408:fe::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27 via Frontend
 Transport; Thu, 7 Mar 2024 14:33:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Thu, 7 Mar 2024 14:33:34 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 08:33:34 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.8
Date: Thu, 7 Mar 2024 09:33:18 -0500
Message-ID: <20240307143318.2869884-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|SA1PR12MB6894:EE_
X-MS-Office365-Filtering-Correlation-Id: 95266516-0995-4450-4e49-08dc3eb39207
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0Adl3o3i2+EMdFi72XoCp8sdGNe1zcmYcMN0WhPsLIoWzviuSk7PdGP8/r9JmJ/ezNARIvR6/KW4AOXcKUNs2RyF1PIdAGiMpxAvQkg1TShn8BBSGFaPSU4F8CYgV6KW1SRd2Ry0wPXCHkZjtf646lCwO3eK93anUlcwdTPu4TpjEYdyNya4jryIYtiOnRdIvM9PxOQyT28ZK/VCzotyzsM7GIQNdjq2EQESexFwo6+2ersuu89vvBqZ8boAOin8Iw+6ZM7+17lev9tv6Id05YpBFXybtynXnCnkPClkmry4QhHBClBZYeg2jsKtOcJRnctEbqyTKd9sxVswMNmSpTJ0SMoXFq8MHA8KSqWgE9+YdjFshcxmsVQblMYlFA9+jVnJbgBw04PP+2xMXQrfHCwnELQ6VxAGBXp6ZayN8Fm3HUA3kd37I9tItPKb+WiYGf6UyBy4NjL6hzP4Ea1Xs+z9lNyhYT5TsMWbu5z6AdA7ES82KJOX1KHJvrZcS6O9ZOfOsgdENw98yfhhzcBOpMjAhz0kR1c0N+BvYSHCTckbtRzKOr60pnnC1innpdXuev6l79nlGIL61BJX2bTq9N+fHS7RY5w5HyWITlqicL7DcA9p9/r+9MSRZVq+ELCjffy8iZlYVeNYI6K+2IJA31ZaaeZ9N+WvNU9alLREGX5JoaACqkmcXERuFJEPA+njr0Y/6toW2yQiTvFDWSDhZg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400014)(376005); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 14:33:34.9319 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95266516-0995-4450-4e49-08dc3eb39207
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6894
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Sima,

Fixes for 6.8.

The following changes since commit d6a209dd76e5ceb5d536e0a1a707ffcf64f95cef:

  Merge tag 'drm-intel-fixes-2024-03-01' of https://anongit.freedesktop.org/git/drm/drm-intel into drm-fixes (2024-03-05 09:54:12 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.8-2024-03-07

for you to fetch changes up to 0dafaf659cc463f2db0af92003313a8bc46781cd:

  drm/amdgpu/pm: Fix the error of pwm1_enable setting (2024-03-06 15:44:31 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.8-2024-03-07:

amdgpu:
- SMU14 fix
- Fix possible NULL pointer
- VRR fix
- pwm fix

----------------------------------------------------------------
Alex Deucher (1):
      drm/amd/display: handle range offsets in VRR ranges

Li Ma (1):
      drm/amd/swsmu: modify the gfx activity scaling

Ma Jun (1):
      drm/amdgpu/pm: Fix the error of pwm1_enable setting

Melissa Wen (1):
      drm/amd/display: check dc_link before dereferencing

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c   | 21 +++++++++++++++------
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                  | 12 +++++++++++-
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c      |  2 --
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c    |  5 ++++-
 4 files changed, 30 insertions(+), 10 deletions(-)
