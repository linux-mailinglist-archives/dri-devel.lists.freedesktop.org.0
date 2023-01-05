Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B60DD65E39C
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:39:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9350510E634;
	Thu,  5 Jan 2023 03:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D9310E631;
 Thu,  5 Jan 2023 03:39:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=npHx+DYXytjq9ZtGu1O/ccPzGvQ8zU8YMVp2Q9zvxltfg+Qheq/iXNd6oHlMMKyvQVIVzK/jeXTFvPDsAqTP6lZbfK9PKLccxJmYaV1I9Ra5h0GjO1lZ99moJoVEq6Sro07X43o3ULYacX/Anq6/7XMsdKjXPMHCtBZtKz2MChOiLGuNYIiZO9b4VISVm89M7xsV5reHqJIsDbo7rHnWmVFDjb9kyLqiKFTqcV6NuO1B8YXGAdS9Pd2nB8ttHNgEFYKFDInUUsBksHgCgSAu5cngLKg0j5IijtBRrEoyWM/z5jGwJkFgh8I+Z3cfqWaRFuyqhMzE7OoDicvjpIJ6Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QjCxyPSNou/HL3Hg2PmbM/dmkt8fNd8uQEdH9UVslmk=;
 b=k4DX+PfANIcZ9OISBqKOPFp+qDqvKAirN1xwSadGlQvaZVLMNQuiivzzz1RWiomrUtIgej1rEDw+w4ddjVdFESJPrSO1Lt9KkzvqNjsZMEGsZasvWasIM8xgg9OFW6HG5veHGXeH14d15i5xfE8nhg32RNgXkcNzKJ2BmnYKDSSjDobPSTFf1Owe3UxBPgu63NCoI7CxDi8+1fQdovmfV/zqhaIbXNwIYC5Z7QxDihXftR90Bz+7BgorGRtgk6MXCcfpFgvWsUVFGpCAOPAC/lORDT2jeQDC/mmfEgKAfYY/jlXtkARPwICFovecypiBBjVlihsmiEd8bIulIzPtsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QjCxyPSNou/HL3Hg2PmbM/dmkt8fNd8uQEdH9UVslmk=;
 b=GyFtJgIJ9etl1WKW69HZl8j8TPRPYyQxQnqfOg7OQ+/dFmD70/an5FMrjLxNM1AfUgNjX0rDHfWzzMzxRcra35a9UP4fIkyQ9m7+w5hWD1VTgk4i52fzYNJEmWWZaQQgih/C8vEWiK5wEHNvJsCGoinaDMmls9tgWvt6k7dIrXo=
Received: from BN9PR03CA0474.namprd03.prod.outlook.com (2603:10b6:408:139::29)
 by BL1PR12MB5109.namprd12.prod.outlook.com (2603:10b6:208:309::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:38:58 +0000
Received: from BN8NAM11FT085.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:139:cafe::ff) by BN9PR03CA0474.outlook.office365.com
 (2603:10b6:408:139::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 03:38:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT085.mail.protection.outlook.com (10.13.176.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.17 via Frontend Transport; Thu, 5 Jan 2023 03:38:58 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 21:38:57 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.2
Date: Wed, 4 Jan 2023 22:38:39 -0500
Message-ID: <20230105033839.23711-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT085:EE_|BL1PR12MB5109:EE_
X-MS-Office365-Filtering-Correlation-Id: 0937b2e8-c185-4701-75cb-08daeece60f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lZOM0ta+4NO3kjAG+ZbJhDVB28SPke/9jVvs3INsC94Ld4G7cABAql6yKpPJuAkCHcuKm1Ba74m9xRsK2Mxml/KRrRsiTxmQhxDyBE4o/66Ai045W+ZRi5tHLX41tQX4S3twSU4MkuK/k/3XZcC4xG+IWToyLGa1AtZtzofs+CbMXEx5UprNDk1W/gA6Gk2ND1/lgW3j9v+s0twqsKdSZwQxb2B84TlDLOerEYv0/+XlG43VLMvBRpjCJkj+ZqtMeu7DmNRc3Xf8Kuu1lMUrlkEIA086863nUdfSwGp0LE2v27ZMHwYt9kGq+mLbHtj/XOkhQZLNyqK1XJTJGAR3c3ogSzEitnVjJE2dI1hBv0SklILLu0ioZai9SrA0ntmJ9DJxltQL8nrg1sKB73b+DS0Q3NJTeMn1MrU6zmdP/PbChNmywIdLGmGQ0fT0De4k8YgDba7zJSP3am+imgWaJnTr8Xq7R++KsgDJbnCyN9po1owuo855btDT5Dr4XEkJIoeWjxQpl/JAFv6blO1W4nuL7YKNqVKFN28wpVTC24iH2WCRfuhFZ1vIZJfJcXSKrNduhWuuyaReXiyWqihPzpn/8SbBUVhISec4mMHErhaHGGXxeNG7d50DuXHTkfuaq70yccbwTWuTTXFLf26mrN+4eE76OC8mPOb+h1WK3Di9mX2IdgcJCF6HiA2tBaIM
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(396003)(346002)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(16526019)(6666004)(26005)(186003)(8936002)(7696005)(83380400001)(40480700001)(478600001)(966005)(40460700003)(316002)(1076003)(2616005)(47076005)(70206006)(8676002)(70586007)(426003)(81166007)(4326008)(336012)(41300700001)(36756003)(66574015)(36860700001)(82740400003)(5660300002)(82310400005)(356005)(110136005)(2906002)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:38:58.3381 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0937b2e8-c185-4701-75cb-08daeece60f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT085.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5109
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

The following changes since commit c8de526215fdab9f2dd0d9675582cf9f1391a919:

  Merge tag 'drm-misc-next-fixes-2023-01-03' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2023-01-03 21:02:57 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.2-2023-01-04

for you to fetch changes up to 6fe6ece398f7431784847e922a2c8c385dc58a35:

  Revert "drm/amd/display: Enable Freesync Video Mode by default" (2023-01-04 22:29:32 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.2-2023-01-04:

amdgpu:
- DCN 3.2 fix
- Display fix

amdkfd:
- Fix kernel warning

----------------------------------------------------------------
Michel Dänzer (1):
      Revert "drm/amd/display: Enable Freesync Video Mode by default"

Mukul Joshi (1):
      drm/amdkfd: Fix kernel warning during topology setup

Samson Tam (1):
      drm/amd/display: Uninitialized variables causing 4k60 UCLK to stay at DPM1 and not DPM0

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            | 27 ++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 12 ++++++----
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |  6 ++---
 5 files changed, 39 insertions(+), 9 deletions(-)
