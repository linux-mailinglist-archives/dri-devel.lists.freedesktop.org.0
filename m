Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5FF4B973A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 04:53:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34F110E756;
	Thu, 17 Feb 2022 03:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2000910E752;
 Thu, 17 Feb 2022 03:52:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JCNrh6+1F+rWMS7DOuUKVIWYRjvwl4ShGoBaSLqQbX+BU2AovzTWijWT5sR0fGySyHtDRRKbxPU0eMQSjhAaYRWrHPMklVWBiHej2EhPaHeEI/2gTvm6cuQSHMo1dISryweRk5bXkWy4oFdVb5R5kXD/aZmWxq6FxOZFL7b1XT7TiX5zTo3GutBpDSvLq0IsTuHFN+wbevd/N1GaOil/yJdAOlZIFRpsUd4kxlUYJWPgVDPefhlJv2nPNX5InRUhnyb3z5eMSQ6uQ7gy4nqgzRno4+2IErNISSiAlYX9frIbXqwvamyQYQh3jNp8OrwuCR4XnlYX7Jli0OhYh6dKMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8vqpTE8BKBy/k5LxUuKF33s3rYOUTXJeO6y0uSwC8QA=;
 b=E2xh8MFTHZUGWg9widxG6JwUem3FES3oYNI9Ku2zKvBsw2kdCMzben4xJVHUMrpXkDFsF7pvN8XUL59Hhl9XKCjGyqSBYRBO47X85gXw+kiRMeB5FsGOIEfScQbxkJ33SVBDnNOG53YTJiW9rwpTsJGG+EVO0dS8ElSCZod0S2aolgKSEz3ycOC2raGnFp/r1wOXoaWnhoE+LLKY6rwc7Pixxdgs0sWtyjfCgv5XoEDzE5SrKsIqq8yNIp82lrMwUvXQrSz/YB8Uuhl+QZyA3vguS9ROTEOYb2aTnZtLgj4CHultFgWc7HLdTJzMlmBWQ6my7gwKliS0n1MKxKTDDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vqpTE8BKBy/k5LxUuKF33s3rYOUTXJeO6y0uSwC8QA=;
 b=DOpOpXhBArMAxODTjihI/qAvqdsgZoJqhH7cFNUtezPbPtN8xFhLXYNJfSO9D3tNkxo0kC8n5nSmQCY+7vKesmuaE3TBWHq8pqh//m3MGAWlraNYEUKmE822qUQK/m8l39S/o+pAtRVz7Jytx6Sa8DQ/Noc7UA1e2UomeGwcVvM=
Received: from DM5PR13CA0041.namprd13.prod.outlook.com (2603:10b6:3:7b::27) by
 BL1PR12MB5923.namprd12.prod.outlook.com (2603:10b6:208:39a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15; Thu, 17 Feb
 2022 03:52:56 +0000
Received: from DM6NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:7b:cafe::3f) by DM5PR13CA0041.outlook.office365.com
 (2603:10b6:3:7b::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.8 via Frontend
 Transport; Thu, 17 Feb 2022 03:52:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT040.mail.protection.outlook.com (10.13.173.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.15 via Frontend Transport; Thu, 17 Feb 2022 03:52:55 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 16 Feb
 2022 21:52:54 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] radeon, amdgpu drm-fixes-5.17
Date: Wed, 16 Feb 2022 22:52:42 -0500
Message-ID: <20220217035242.8084-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5803a936-96a9-42a2-8e04-08d9f1c8fafb
X-MS-TrafficTypeDiagnostic: BL1PR12MB5923:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB59236547760652EFEC4113B4F7369@BL1PR12MB5923.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:644;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9pGXXHgA4I/5pYspeYMNvS1fYqjuohhADDnIv1brUwW5qxQ9ONB27WjR+x7l6fBK8sXXOQQrxKURYzaVjrGTXlEFWFZktXYM0gaK4O5jHWOAdQNpYbiGq2VTceporqHsu6t8U0iBAmMhKND6hKQbUJstprIs/g6ZkUxo7+oDjIUvcc80vdHci0vV/HhAeGfoNE4qNEisBVmjajcpbEnLVAJ65xtoUoxFrhciCNtmUEk+FYpA49nOMS/BroNmRCTmzFHYDEHflGyCWonUlFBByuvZ7oZZVw3DmEnBjeTukZSkLInbMAszGPuQBpds5dfsPS39cUDqQ/iwntYQqBRUT6B0wki+ijedeHosVi0BZ3W2d9GkmUttPvFdyNJf6WZAhj3TEIPjuJYbQJYtLkTw5D788InyEGRyY6xi9GvF9JcCGBDJrXSRiAzSyu32GGeJ/YUlMgGnef3uAi03sK9FWM4OWu7DV+Sk/VQKaDKkJOmiTiuW2UKTaNkRKqxhdCdzol0WSoR9pITshGtXDd8KuNVATcrse9Z5wQhrjEMdqMwKHes2czvvD4db8IyevNrDca8ySHpjXTU3/1vc6CCZrL7wm87CtWj8J4ExLNHrY3DCg/5cLhOXu5r4/cw+PNutXDHjW50RSLorGorVbR5LrA3JnZpkH20ZswbjJtQiUtQ7A654qLufRw2zQskVpynLbGdPWq64cY/W7n6JMy4Ccg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(86362001)(4326008)(36860700001)(47076005)(70206006)(70586007)(82310400004)(8676002)(356005)(81166007)(8936002)(83380400001)(5660300002)(40460700003)(2906002)(36756003)(316002)(110136005)(26005)(6666004)(7696005)(426003)(966005)(16526019)(186003)(2616005)(336012)(508600001)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 03:52:55.5085 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5803a936-96a9-42a2-8e04-08d9f1c8fafb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5923
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

Fixes for 5.17.

The following changes since commit 754e0b0e35608ed5206d6a67a791563c631cec07:

  Linux 5.17-rc4 (2022-02-13 12:13:30 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.17-2022-02-16

for you to fetch changes up to 364438fd629f7611a84c8e6d7de91659300f1502:

  drm/radeon: Fix backlight control on iMac 12,1 (2022-02-14 15:01:46 -0500)

----------------------------------------------------------------
amd-drm-fixes-5.17-2022-02-16:

amdgpu:
- Stable pstate clock fixes for Dimgrey Cavefish and Beige Goby
- S0ix SDMA fix
- Yellow Carp GPU reset fix

radeon:
- Backlight fix for iMac 12,1

----------------------------------------------------------------
Evan Quan (1):
      drm/amd/pm: correct UMD pstate clocks for Dimgrey Cavefish and Beige Goby

Nicholas Bishop (1):
      drm/radeon: Fix backlight control on iMac 12,1

Rajib Mahapatra (1):
      drm/amdgpu: skipping SDMA hw_init and hw_fini for S0ix.

Yifan Zhang (1):
      drm/amd/pm: correct the sequence of sending gpu reset msg

 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |  8 +++++++
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    | 26 +++++++++++++++++-----
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.h    |  8 +++++++
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |  9 ++------
 drivers/gpu/drm/radeon/atombios_encoders.c         |  3 ++-
 5 files changed, 41 insertions(+), 13 deletions(-)
