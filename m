Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1964573BFE
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 19:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98072113195;
	Wed, 13 Jul 2022 17:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C7F113018;
 Wed, 13 Jul 2022 17:29:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZVbdA8XY/VSyrxC3JYfvC5wBzxUJTMREGeheyLu2WOpKYERjh/a4usI6efSxA6e8A+wz47kF2kegIVwKCb4sXJDEjv1JjvguSeozuOZRGXGMuto0C+mDvemEDHSSMhKfCCdaD53h0/mZmzCmEZYm74cBVMHr7gmcUbdcUG/M2uQ/m9yniHNwdz+zBdlJpWHWEoEG4J7jeOmrlzPoldlBCkVfXNlqnqYzs+qxjIZuNhD2P7a/vXmEgdaas/Q5LA/1hKjFk8/eZ2cfGo5e3X4j+GPEUGDuWIFJ58HVR0VZ7XKTbbZfVRhyZjjdQiAWt9A3sjfwTAcbS1gzDFqpNc5fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hzN3xyLQLHB1cqsa5rVQvqRPN+pEmsVnInssfUnadi4=;
 b=U2bmScmX4eqafn/SgM2Mlz070f9AyBKZLZy/lsRrXi6aFIvoWt/LptsYXNIucDVuis9JvGT/D5sM9gV3J4vf/L7Km5W6f/tO6HE1z7/1cTZO7WMTYw84vtcx/C0WWgJ6Txgx837yUOR+2cwWh8PEu8CffLm5xUN43BoXsnMmqHSnQj1qDO9p+AFvX4QAL0QOx7DRuA8jRj25q/mINlubH5QV6fV8A8vyQpXBe0h7kW20Q3B9RKdC3YWG8MYcUhwlQtNJGXnN/aCj1hc9D3K21TbcFs4BJLQkbSifPiKtGn2d5GycpT6LpgISjk3e4Raim3ESGYu2JHervyKm8hptoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hzN3xyLQLHB1cqsa5rVQvqRPN+pEmsVnInssfUnadi4=;
 b=CKJqcM/8q7ti9v4VzGU2AaKqNV5froVgPmkAWAu6Ub3D2QCQLXnWoiQtENKrSj8u9TEDOIS0hHb0zmW+QQiYaQa3gZoK1R2EYD5z+NA1XI+cTNX056QBJ3hWWhqWMbEZOvf2zfPkDIv483QaaXDbXkUlud29BcGscJTVuGC24yU=
Received: from DS7PR03CA0308.namprd03.prod.outlook.com (2603:10b6:8:2b::31) by
 CY4PR1201MB0038.namprd12.prod.outlook.com (2603:10b6:910:19::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Wed, 13 Jul
 2022 17:29:35 +0000
Received: from DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2b:cafe::44) by DS7PR03CA0308.outlook.office365.com
 (2603:10b6:8:2b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.17 via Frontend
 Transport; Wed, 13 Jul 2022 17:29:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT010.mail.protection.outlook.com (10.13.172.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5438.12 via Frontend Transport; Wed, 13 Jul 2022 17:29:35 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 13 Jul
 2022 12:29:33 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-5.19
Date: Wed, 13 Jul 2022 13:29:20 -0400
Message-ID: <20220713172920.6037-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26e71a63-6f5a-4da1-ec39-08da64f54147
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0038:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OubUd82rDsfmBbTZ3BMocX6K1U4ecJ7SMElnAiSnB0xsM5R06sg/LgDlEPmD51FWeszRzr2z5AqzAC5V9y9U+z3S49ig8AnYcMlwRiyCneDlZL1T6uR073Pkz3LvgOx1gfPkGUSWWAOsv7ho8wYeHP5a/NyVkGDta652mzhecrU8DZfQx+QGHWba0dRRmbR1ki6svRpPg81Jt2oWkn9rltdiTrZ72G+YVRnQb/q/1Imwj2GbIy3Qt2oOM36BDCHxgW9CQzL9pSKGz6I3ap/L4RXNrUKZfC4wsnEt1ukS0n5rB6CiM10vPYvDzFbXqTlTnT0zoyy5VBrrnwnW/QCuefaECcrUoiUq6pV+T7Rsn4HkOA2gDQqXhvqyINoNbyjRi4UgAeX4zcR4RxJ3sC+1Bqx0h08PdSD77nXOxb7uVbNuCx4SWWl8Q8fdc4Bh7VPpsL0P6L1OAzflXGnaUOiVitIoApAkRdUWLG65bji/aYTEUDMR2r8DTB79wvSu0Ogj9a1vq487inm57zfjxDYwBzVJfWm+fFT47WUbBlhYSD7ukAh2lVMz3PJ/nNe/3FyzKDvBKnwGHgESBK/M+Ju77o7ievP26AKD2KP4+x9D3tfFQ/mfu0TYHAm2TguAE3s+x8gYFl+rKVUtCTDWelwjQEYQHZBlPYoq64moNy2r8dhn6lMpWr9T9y+2yuWx/a2BWttJ+lsnqWtwFgHtdDxWcLFTkSxVCWqGFVbZlspLM3H/qNE3KJfL3Ri7BhiTt+XclD/7x07Uk97NeXtQMuPh8TRFjfkFT8zsXH7aPnWW8BU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(396003)(39860400002)(136003)(40470700004)(46966006)(36840700001)(4326008)(426003)(8936002)(40480700001)(40460700003)(36860700001)(110136005)(5660300002)(316002)(36756003)(478600001)(1076003)(966005)(336012)(47076005)(81166007)(86362001)(82740400003)(83380400001)(26005)(16526019)(186003)(356005)(7696005)(6666004)(41300700001)(82310400005)(70586007)(8676002)(2616005)(2906002)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 17:29:35.0250 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e71a63-6f5a-4da1-ec39-08da64f54147
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0038
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

The following changes since commit 3590b44b9434af1b9c81c3f40189087ed4fe3635:

  Merge tag 'drm-misc-fixes-2022-07-07-1' of ssh://git.freedesktop.org/git/drm/drm-misc into drm-fixes (2022-07-12 10:44:40 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.19-2022-07-13

for you to fetch changes up to 3283c83eb6fcfbda8ea03d7149d8e42e71c5d45e:

  drm/amd/display: Ensure valid event timestamp for cursor-only commits (2022-07-13 12:20:37 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.19-2022-07-13:

amdgpu:
- DP MST blank screen fix for specific platforms
- MEC firmware check fix for GC 10.3.7
- Deep color fix for DCE
- Fix possible divide by 0
- Coverage blend mode fix
- Fix cursor only commit timestamps

----------------------------------------------------------------
Fangzhi Zuo (1):
      drm/amd/display: Ignore First MST Sideband Message Return Error

Mario Kleiner (1):
      drm/amd/display: Only use depth 36 bpp linebuffers on DCN display engines.

Melissa Wen (1):
      drm/amd/display: correct check of coverage blend mode

Michel Dänzer (1):
      drm/amd/display: Ensure valid event timestamp for cursor-only commits

Prike Liang (1):
      drm/amdkfd: correct the MEC atomic support firmware checking for GC 10.3.7

Yefim Barashkin (1):
      drm/amd/pm: Prevent divide by zero

 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |  2 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 84 ++++++++++++++++++++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |  8 +++
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 17 +++++
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  | 11 +--
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |  2 +
 6 files changed, 115 insertions(+), 9 deletions(-)
