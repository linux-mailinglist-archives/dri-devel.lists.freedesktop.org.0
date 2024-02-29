Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CDF86CCD4
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 16:24:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EFAB10E068;
	Thu, 29 Feb 2024 15:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WOZNBmvH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D445910E068;
 Thu, 29 Feb 2024 15:24:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MCGWyX0Joc1z9UgV2xXuwwHntu5N0giwwMxx4t7j5+C3fjks6mZ8/kNYCgiKGTLSkq6XBfvp5zHQYEZLUJwmbcO1FW2Sox/fz+k2H+GPvRzZNzxZreQPo/xy0k3X9wWsH9bH1DES3a3JuYuboKotdB8puFWlufkI5WhOesGvvL3x9IIQ3MTVTdc45YfHn4/BKNQkrQT8xYYvsiwwo9GIZGGon+LDsQbBEA3jvAwe1QUM9ghiIQp0zZmkZ9/OYOHHVQqWBvy1u+QK3FPB8oufq1xMTLw+01Rn1HPFei5vrTfuq9TUuVe+xKeBgAkWj24xYacuz9mPsaFNXIwxJH/DYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+DeikyNmN3E7Sm/VvZJZ3NvH+0QTAtJpZSs3KAVVAQ=;
 b=MJ0lryengicXPGHcJ+0hpeNkKbnZQK30v5RkyJZChZH0HyoA2cHTk06WfVee4FO0niUJhw9UqfQ4aH1pY0x1r7bSkh/5KCMKii0T46PQCe10EbOQw/gytmCRrKPgcT63GrfwwY2thDvxt3+Mf/PPx4bP5WWjPIaMrwInqdptzTiqwV74qTGwWcklX1jMFhX+Mr4kWBxj4ON8T1BGIGj0zLNfrnjw+VFyeSMOxxssXn2g2dgmwynIiUa3Iid2YA4se7HajxjRRpwIN7cvM4Wn/fWDbN0MYeTJNrSY/LVvtlAhthp3rbj9JzjGpOHrJwlgmH8RTSGX3GoFNKprLLeyjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+DeikyNmN3E7Sm/VvZJZ3NvH+0QTAtJpZSs3KAVVAQ=;
 b=WOZNBmvH0myBUFzcfaPv1x6UY1QR+kIMXyUODDoSEAoTVfycwI2QftxrgN3WzvKDnie7vdQzd9bIDdALUZ7gnddWGMUqUsVeKW++ySlOdkSc1q+AmpkrNOPd9AC3ZRga9zKqtxPAfQtfB03AxuPbqYeyzr9vsmQOCYL/d5L57R4=
Received: from MN2PR15CA0024.namprd15.prod.outlook.com (2603:10b6:208:1b4::37)
 by BL3PR12MB6473.namprd12.prod.outlook.com (2603:10b6:208:3b9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.32; Thu, 29 Feb
 2024 15:24:39 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:1b4:cafe::6f) by MN2PR15CA0024.outlook.office365.com
 (2603:10b6:208:1b4::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.27 via Frontend
 Transport; Thu, 29 Feb 2024 15:24:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 29 Feb 2024 15:24:39 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 29 Feb
 2024 09:24:38 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.8
Date: Thu, 29 Feb 2024 10:24:24 -0500
Message-ID: <20240229152424.6646-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|BL3PR12MB6473:EE_
X-MS-Office365-Filtering-Correlation-Id: bcf7b5a2-1bdb-4f5e-c459-08dc393a8bf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cR5dXuxrbkcfjQNUJIwPQpEAaohwhHMH5urlZNXF5LQkPwq4K8rpHxNifL2o583xh6U9uCs5pu1oWK040FllP4NGpMGOYaGS/UHYxd2vmNOZ7TRjl7eveN3HNBXqK2pFLaLgKG4xKYYVDQmKl/RL5kCPqYeFKJ+djRlL9VH5obIsNACKiTeujAaqCVmeQtefrdIzbS/5JsLfmWVIaq9AGuNSuet/sKUl6N3X7L6noATZU8mE77oZli8oooK5ajadoB6H4Ec5xoMLT/qk05sM/Z5z1kap9R/soTOyFQIiqiusCkLvqFZEqMlAYDmE7WwREicN5x06q6pnnZdbg6uz28t64FsFiJr1baeNMrXlAHJhSY7wDX8T8+TeoqZ+DBt6ejT8RPPjVa22hqZlsQv0MXz8+/9WeSnoUwxcp7TsnlP7ibxC+bKrVL0iG/zU9H3ki01iHiOZPRnkqETvisdHWB+i2J58bw6Se1hV/abERFr+GiCMY9JaXvSl67520LwwoRVwQe3c0yK5XFB9CYac47NSqQsZDE3987lVYv0UIGOHhDxg+DHxdDpwa/CI5qIjfdbzHKtrnKdaJR2fHnwbMB6cyQ5JOS0WpnxurOtCvMArwy227MxDijQNd4/wTifEI3lssm7zKHGwVumIAFyvXnK7uNygeQLlaaBNL67ByNmAXmPoEkRqTm5B+JE4n5ewkkxCLXK8uhut1NceBqCvWg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400014); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 15:24:39.8259 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf7b5a2-1bdb-4f5e-c459-08dc393a8bf4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6473
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

The following changes since commit d206a76d7d2726f3b096037f2079ce0bd3ba329b:

  Linux 6.8-rc6 (2024-02-25 15:46:06 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.8-2024-02-29

for you to fetch changes up to b7cdccc6a849568775f738b1e233f751a8fed013:

  drm/amd/display: Add monitor patch for specific eDP (2024-02-28 17:33:05 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.8-2024-02-29:

amdgpu:
- Fix potential buffer overflow
- Fix power min cap
- Suspend/resume fix
- SI PM fix
- eDP fix

----------------------------------------------------------------
Alex Deucher (1):
      Revert "drm/amd/pm: resolve reboot exception for si oland"

Ma Jun (1):
      drm/amdgpu/pm: Fix the power1_min_cap value

Prike Liang (1):
      drm/amdgpu: Enable gpu reset for S3 abort cases on Raven series

Ryan Lin (1):
      drm/amd/display: Add monitor patch for specific eDP

Srinivasan Shanmugam (1):
      drm/amd/display: Prevent potential buffer overflow in map_hw_resources

 drivers/gpu/drm/amd/amdgpu/soc15.c                 | 45 ++++++++++++----------
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  6 ++-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |  5 +++
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         | 29 ++++++++++++++
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |  9 ++---
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |  9 ++---
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |  9 ++---
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  9 ++---
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  9 ++---
 9 files changed, 83 insertions(+), 47 deletions(-)
