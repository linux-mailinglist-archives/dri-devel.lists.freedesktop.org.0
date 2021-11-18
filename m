Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B824553B5
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 05:17:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D22898C2;
	Thu, 18 Nov 2021 04:16:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2062.outbound.protection.outlook.com [40.107.101.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 337EC898C2;
 Thu, 18 Nov 2021 04:16:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMVjDHi5QwUW1NcB++Cf/mAnWRqUMxez05gn/1oaCcNgdpNXSFa4USSMQJapp+PN0OepBWyMN3LBR6yv+LDwZ6EcKm8a8kcqLqCzXS9QEeljpPh4ROm0sE0FoIorGLZtV9LqBY/4u6SDvYH4xM6LNST0wLpsX8Sd7aQgV5TcSmc7ma3bKCz+sm4JQmJhi3SHa7ciBbKV2ebzUwgBTBwWmPnz0RQ8bvixCkIqzn504CtPx9L4daOYN7eV7VEdlAkAgRoxzNUcVPRMqftpN200wTGmy8XzJzoGHEE0cEji6xhzAW+Fyrj2UBZgQMtAEu4bez69ErMq2U1nTusGnYOv7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4FTdSOHcC9npvT/NfDROTNHVQvOpy1m6UCCia+/X/Q=;
 b=RSU3eSukdY44Fik1j9hZiqvwU/Gs74KP//yV4G2h/i4WpvbsIAPC4zSBaVSBC8Vy2qS65sf8KL7ExY2tRpSRcP9MuvKOcooqv03C9rR2eQSk17XGvv3JCT4AVvm1um6ju+6n5B2DCEt+snjzEWtoJARr+rPXiMOZvBcAmAfAKduvsxBYnJOlO7VIsckKP38qPepeI0n2hNDez1pCvCLHk56lT1zJFOdtNUgJfjTfKXkRt/U+ue8PnQwfW1qqvOhNctsb5KLQ2ug332EGZbBNAS3Pc03bdZ1MwUeT8N2JAJPNjC2d/L6mQdXhQMbQBDhX3sUYUBaRGrqVjAgNXakTmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4FTdSOHcC9npvT/NfDROTNHVQvOpy1m6UCCia+/X/Q=;
 b=g6bRwvBxy/lUA/Y9n8ppoymNyYLSkYJFcRjQUrWPlL/x/Arp5pOhE2MoiUWKJthq4NPeZ0V8a+uWF1ykOW+Re9vakvXgRif4ZH6XoOIfK7J03NCWDhlEUjfJ4J0NYmjuzU3ipocmsawXGUePub3cI0Y24mGGWLLR1DodJUvX43s=
Received: from CO2PR04CA0106.namprd04.prod.outlook.com (2603:10b6:104:6::32)
 by DM6PR12MB3371.namprd12.prod.outlook.com (2603:10b6:5:116::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.20; Thu, 18 Nov
 2021 04:16:53 +0000
Received: from CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:6:cafe::68) by CO2PR04CA0106.outlook.office365.com
 (2603:10b6:104:6::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Thu, 18 Nov 2021 04:16:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT043.mail.protection.outlook.com (10.13.174.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.20 via Frontend Transport; Thu, 18 Nov 2021 04:16:53 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 17 Nov
 2021 22:16:51 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-fixes-5.16
Date: Wed, 17 Nov 2021 23:16:38 -0500
Message-ID: <20211118041638.20831-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 553c68a1-a56b-4b87-edea-08d9aa4a4072
X-MS-TrafficTypeDiagnostic: DM6PR12MB3371:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3371A66799A6B453C9B86183F79B9@DM6PR12MB3371.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:561;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bKOK1e3KQFRiZVOuz3kPHyobFn79Ig4dW9gQXZgLsAflIkFsZngdA7A8s3bm3fFzqjv9gK1gb951EHukt1amMNfKnu469ZcoBXEYeEVf54u0fGHuWXKs5/9dNsieSFLpau8GlZekb2k4JnUGGN1DxhmE6CgwQqxhHA+Cetz4/scozIcJG8797P7ejY6n0YiMgbuSj1i5SJEN1OpBosBYaReShCFTUIlxZ2RLGMfda23H9VxXOHO5vHoX6H4izaU0fumdaylIugStf9p/nPNS8To9CG2IDMHty1Ne3tmyl2VdGrwHI6EjwRYOehDjoszWBD3/CXC8M1nFPzLjEE5pvpvcqzramN+61FeWxWkSLtdaAV0QHqH7y6Nq6FtgK7d03lhij7ilQMg+oLOst+RZP9kCtkXgaW350yP0a2C69eBQELAotZxHBpg768D2HE+LDCgej9/fUnjbQiqfRdL1u6joGn/2JWu2TP5pzbyT9qwmtkPoOrvRXoyZxnWx9Eel5Phnqp/+T0Mn2oS60MHP+GCXPkn3T74ZGILL1Bf9sfhpUQAsjpTMtzelEK+ZIzMuUXlgHDTML8DTT3HXBamE/QxiewW5pwvEIQJg/WyETkj5AUbBzyYEeqAibFuZwk8Axd3fHhWXbqjS04WbHYDr8uinLY/zWCPcp3aMcp00LBVU2ZZtNgjAqsM1i2DtVUXYUghB01+DNaCG022eyqrlAGqOqG4bEVGaC8WWU9kswc0zz2Iq/lqYu1VDmdhXOK8c3HsNAbVRY8anwCdtbxr67Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(110136005)(2906002)(426003)(2616005)(356005)(5660300002)(966005)(508600001)(7696005)(6666004)(4326008)(47076005)(1076003)(8676002)(36756003)(81166007)(186003)(86362001)(316002)(82310400003)(83380400001)(8936002)(16526019)(336012)(36860700001)(70586007)(26005)(4001150100001)(70206006)(36900700001)(357404004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 04:16:53.3642 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 553c68a1-a56b-4b87-edea-08d9aa4a4072
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3371
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

Fixes for 5.16.

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.16-2021-11-17

for you to fetch changes up to 27dfaedc0d321b4ea4e10c53e4679d6911ab17aa:

  drm/amd/amdgpu: fix potential memleak (2021-11-17 23:04:57 -0500)

----------------------------------------------------------------
amd-drm-fixes-5.16-2021-11-17:

amdgpu:
- Better debugging info for SMU msgs
- Better error reporting when adding IP blocks
- Fix UVD powergating regression on CZ
- Clock reporting fix for navi1x
- OLED panel backlight fix
- Fix scaling on VGA/DVI for non-DC display code
- Fix GLFCLK handling for RGP on some APUs
- fix potential memory leak

amdkfd:
- GPU reset fix

----------------------------------------------------------------
Bernard Zhao (1):
      drm/amd/amdgpu: fix potential memleak

Evan Quan (1):
      drm/amd/pm: avoid duplicate powergate/ungate setting

Guchun Chen (1):
      drm/amdgpu: add error print when failing to add IP block(v2)

Lijo Lazar (1):
      drm/amd/pm: Remove artificial freq level on Navi1x

Luben Tuikov (1):
      drm/amd/pm: Enhanced reporting also for a stuck command

Perry Yuan (1):
      drm/amd/pm: add GFXCLK/SCLK clocks level print support for APUs

Roman Li (1):
      drm/amd/display: Fix OLED brightness control on eDP

hongao (1):
      drm/amdgpu: fix set scaling mode Full/Full aspect/Center not works on vga and dvi connectors

shaoyunl (1):
      drm/amd/amdkfd: Fix kernel panic when reset failed and been triggered again

 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  3 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      | 36 ++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |  1 +
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  5 +++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  3 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |  3 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                | 10 ++++++
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |  8 +++++
 .../drm/amd/pm/swsmu/smu11/cyan_skillfish_ppt.c    | 22 +++++++++++--
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    | 13 +++++---
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   | 26 ++++++++++++++++
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   | 27 ++++++++++++++++
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.h   |  1 +
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |  8 +++--
 15 files changed, 156 insertions(+), 11 deletions(-)
