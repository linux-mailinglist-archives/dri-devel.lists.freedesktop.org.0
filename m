Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 301475F0CD9
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 15:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0FC910ED0C;
	Fri, 30 Sep 2022 13:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000C910ED0C;
 Fri, 30 Sep 2022 13:58:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QlLIyFDnr6n60kjpUHN+cVLKYnLkx51yOkgEAOzszkF7z9oO6d+67bi87kUFJpy9Va/TlxXsHn5dyr9Az6Z4pvafoNOF2iT2X6mteHCZ/6BimpbnodPy6Xi6i7GEP/AKSSjwlujrpE5ZXT4/MQ+ydAKkbORoverlifBJ506xwRGCeCbU+SSkGBbmdZYibtdt83qZTRp7X5KNE1cV8QSmjLfQ3877wqqvGPEJrp41l7UPyCnoXGI8JtGJ3RuFdef0/8Cqa7Vv3zg33pg5Zy9E5tgUYu31QCTTtZcCEzWEjdEN0RGz39VfxG+cs6f5QCJ8JXV13jroyizjhg2u+3fxjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hViYkSEWNs4NWX/ODV9qqiG5XYeGaHsEvgAeN7T0AHI=;
 b=A4ntCDBTz0A8xko0ZIgmfK8J6ePCVCDDBQuqn0z08If7roB6oSaJi0wrr/7yfObWTui3VIlG5X8B5Vt4u2ap8VXiy71Pu94k+BDVM68xQXj6cqKMNe+wdAmFada8QBbeQvlyr6GWllCRUIiUP6nRkdtLt7xvZjPM+HlBWYgfMZV73maQg5pLE2K2PZ5NgKxb7J6LQBPCPCJYRQVo+rbE6aHcUw9x98Tlg3K5+yZKRxpfUnf5MDjwLA2VjTNik5Aun4yN8rANTevDbps6c39V6A9Oj1qVGtMZb//aQLLexvOu1P3/ZRYU9ywTYAGNSu4FEFCCADc65clBnGI4lPy5YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hViYkSEWNs4NWX/ODV9qqiG5XYeGaHsEvgAeN7T0AHI=;
 b=K3BmM9hATAK0ACGJNGcZhC2xax612Me1mOS3COCrgDPMRa17O2YE734O19NJrsfWp+erLuQ+E8Q1jYJSDwsXlE116HbvClEMEfaxeP+YvPXm5u0jNQeViJ4yIr+qo+vTc9o6ZvYBHWtRGoVTWtIu0iTVbLj6hiqiiEMQRHo83uA=
Received: from MW2PR2101CA0011.namprd21.prod.outlook.com (2603:10b6:302:1::24)
 by IA1PR12MB6410.namprd12.prod.outlook.com (2603:10b6:208:38a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Fri, 30 Sep
 2022 13:58:26 +0000
Received: from CO1NAM11FT096.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::bc) by MW2PR2101CA0011.outlook.office365.com
 (2603:10b6:302:1::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.0 via Frontend
 Transport; Fri, 30 Sep 2022 13:58:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT096.mail.protection.outlook.com (10.13.175.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5676.17 via Frontend Transport; Fri, 30 Sep 2022 13:58:25 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 30 Sep
 2022 08:58:25 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.0
Date: Fri, 30 Sep 2022 09:58:10 -0400
Message-ID: <20220930135810.6156-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT096:EE_|IA1PR12MB6410:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b338276-2563-46d1-7307-08daa2ebd887
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h6kYZCjiVpCG0Qhtu6YeL1vnI/b6EAjNGDPbBl2FOUJ0taWmx/vUwSsMkjo4BYYv+5s3vmFoN5pWEWPyO7zexKMseljAxd6uHPptKRoQRhWvLDHat3Ii63X89JPXfuey5JqhSD5xqN/UoWzU4KI4HggiuB6yZSKA6w1OvuXSpx2UEv2wilAbvkRvZ4ZludIU9W7xWXqDORxbQBbEGHr0XSIfVl/P4EyJ7axG5n3B4k+y6TJyQSB9Xww05mTjYhz+Sth/t7F3nF0NmDjlkjUC2ZLd4yas81CBSSS6mSRzgPEqAWq/X/LPMdL1iVzbU9+mCuRbJZ4IbD0qYo9MZ7BeSxAC1rkMT7w6WLelwTqnBFchQ5/Y1VjA63GhplTQOcvszA0O5HfOGhU+Gen89KMvNr/hIW2n9bsqNybH640FhFV3p1hRTB5W2RhLrdT97VoM0OEtbY90fJBn5hhyKYRvGaRlh0vNvWnOKY18h0lFGVYGQvqKj3msxuM/tREE3jS+PfS/zVigKfN3iVRuxMlY1ZjhSp7r1CR/hXEdmsLReF24uJNUp0j2QI9nNqZ4rPAWkkPDmTX8LAGJkbYekCLCuGlSYLS6q8d/bIT6CHTgJ34L4J4EaQZCUvPfvQ+Yd+jCsJl5ORJiZcBZ2NCSego5H+txNitZ7qFDBUGkgBIZtu2yqfMQIEfBCVfKQdxZwDyj9nlN0BoSQP4dRWftnpHp+dRezneseWAyW0bZvDSSJw6cDCKuX/30ZxOJz2GLWlcM
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199015)(36840700001)(46966006)(40470700004)(82310400005)(47076005)(478600001)(6666004)(66899015)(2906002)(86362001)(70586007)(41300700001)(8936002)(5660300002)(36756003)(26005)(8676002)(110136005)(4326008)(70206006)(83380400001)(316002)(82740400003)(356005)(40480700001)(40460700003)(81166007)(7696005)(36860700001)(966005)(2616005)(16526019)(426003)(186003)(336012)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 13:58:25.8241 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b338276-2563-46d1-7307-08daa2ebd887
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT096.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6410
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

Sorry, some last minute changes to deal with updated firmwares/bioses and
board revisions containing new IPs added in this cycle.  It required
pulling in some cleanup patches for the RLC firmware handing, but they
are only applied to GC 11 in this case.  I figured that would be cleaner
then a bunch of local fixes that would cause merge conflicts for -next,
and time was getting short for 6.0. They are only applied to GC 11, so no
chance of regression on existing asics.

The following changes since commit 83ca5fb40e758e0a0257bf4e3a1148dd52c6d0f2:

  drm/amd/display: Prevent OTG shutdown during PSR SU (2022-09-29 10:07:42 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.0-2022-09-30

for you to fetch changes up to 5369e662f99087b4ad38b151aaefecb690117f10:

  drm/amdgpu/gfx11: switch to amdgpu_gfx_rlc_init_microcode (2022-09-29 15:22:31 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.0-2022-09-30:

amdgpu:
- VCN 4.x fixes
- RLC fixes for GC 11.x

----------------------------------------------------------------
Hawking Zhang (8):
      drm/amdgpu: save rlcv/rlcp ucode version in amdgpu_gfx
      drm/amdgpu: add helper to init rlc fw in header v2_0
      drm/amdgpu: add helper to init rlc fw in header v2_1
      drm/amdgpu: add helper to init rlc fw in header v2_2
      drm/amdgpu: add helper to init rlc fw in header v2_3
      drm/amdgpu: add helper to init rlc fw in header v2_4
      drm/amdgpu: add helper to init rlc firmware
      drm/amdgpu/gfx11: switch to amdgpu_gfx_rlc_init_microcode

Sonny Jiang (2):
      drm/amdgpu: Enable VCN DPG for GC11_0_1
      drm/amdgpu: Enable sram on vcn_4_0_2

 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h   |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.c   | 264 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h   |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c    | 151 +----------------
 drivers/gpu/drm/amd/amdgpu/soc21.c        |   1 +
 7 files changed, 281 insertions(+), 149 deletions(-)
