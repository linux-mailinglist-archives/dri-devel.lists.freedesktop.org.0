Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 036FF860345
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 20:54:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1452710EA4F;
	Thu, 22 Feb 2024 19:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="T7JBkX6z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B9C710E16C;
 Thu, 22 Feb 2024 19:54:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a3KMqFVidobWqVJnSJBF9dfsV+S1xslB7NGD5f2decINLeghFop+paDAkM2VRMxWPZMupjeKAaGXVdPwLlHAeTJKo80EukarrJkj684ux1go03xOruVD+5Fol4EcfXaQSZptS101oNhoTRXM+LYI3C1NJJq0DlltrgHm3raDg3BA0VJTEuJfHqytnQqGBnqw1/yVjnTStoMtsmBoDyPrEGYNT/15JBijL3FvdBSxyMKKiLuW3TONAdvduKNDBQDQDA+z8n8iEM75floZ6x56oyNKcgEdb5HBq5JMWLkDzY9fI1lU1HGgUqepYOSUJpPEMFqMSMndZLPZ800sl5O6Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SVw8vYzNQRsdc8f1A8hPqvvRwFxa/ILShUF0hk2TgxI=;
 b=haMeabEowwQv1Hfm21grGM8YpfuM5RkjyQ3GHnZKGIdZCitNrA6zTFF6Ed7655C8ff1cvMe6vd0SGJ928JwiKYUMWCfPrZvRDgCO31o7nCkY3OAAPLEyIihD8n+Wfn8EJtKcLjQO1ZeFOlJWrh/LPbwLiZFMlBOxJYzrzcYIt357YWjn3pr0KgdBTQVp41LOM949IJSxIISfwZXES3XsLs69971RVOBMbY5X6MPrJFJc3AUWZMFwOdolGehbx9yojdh+rI7/t8cS7FnDNKaweDI2NP2IqNB9f/rFmdPaxzfc7X9INWlr1hbpvjmlsM4uGmr22pMevQWXyK+GCThOkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVw8vYzNQRsdc8f1A8hPqvvRwFxa/ILShUF0hk2TgxI=;
 b=T7JBkX6zfqHhb4dmw/koO8XLCp4xyXBeMBCs1tHfReOw/x30W1VggVxPH8RLk0LJfjWBXxh3tU6BciRPMtK+pzlSeRjhuxZXk7C8gMFBS4NTBW5kZX5kk7lTEwiMJRz2x1pt3opriH386swEC0ggDRKDEZu/bbxIDUcy7WK8wEk=
Received: from SJ0PR05CA0209.namprd05.prod.outlook.com (2603:10b6:a03:330::34)
 by IA0PR12MB8716.namprd12.prod.outlook.com (2603:10b6:208:485::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.22; Thu, 22 Feb
 2024 19:54:03 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::d4) by SJ0PR05CA0209.outlook.office365.com
 (2603:10b6:a03:330::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.11 via Frontend
 Transport; Thu, 22 Feb 2024 19:54:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 22 Feb 2024 19:54:02 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 22 Feb
 2024 13:54:01 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.8
Date: Thu, 22 Feb 2024 14:53:38 -0500
Message-ID: <20240222195338.5809-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|IA0PR12MB8716:EE_
X-MS-Office365-Filtering-Correlation-Id: 824bc07b-c659-4562-0abc-08dc33e00507
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5uHf/PCO3ET1SI0S51hlLwJ4Z+/FHASa87tbTl8ILPQ+fRKYbTcyiXc2y9oFCaa6yG6/KhTIduDOs44j7rw2RT846zxSSCyTQOeMWLl9uEiRIIMnJQnm+K0UVPVvqAtj6ICXOL1ifQvWu8HOwKJY8AABtpUKHPCemh2wnGYzZKlG6aYUrKAsVgcfjMOiCw5KLmtaqnRaP+L8yAukze86qMHy8Ln80yuRdqaSoFWSXdxQU0ODZaalXDrM242y4IaYqQtxbM1nZqH7ClWOxQo8FAn5PN6mLpdBZCxx1J6XVSOIy2aK9Sa818QzIAcuIIinNZ4WUJZpyoS94apHw7Fvlj8NawfEU2w63MurqBw7q51WkQiTUgRgnZyGgQmLRldHJjDjyjTEl487JWfeQVOmWVjh2rasL/bUGSgH1A1izrl+KUluXfY6kSPzzojgOJv4FTHVG7g0sdRqfszkhcvRfp/B5pA0gO2Zf+oKFEc8hy0VSYnNohvqcKVhIcDaCwM1q1EBU3xpJpACd/Kp0b+mkOWU75Jr+YF1Y8lvA/xokkeGzV94ql35ueng8RdCmxA8BRpakZ5YwuIuMKN8llz5jBx9TFdNKVtcz0OlLcA3XrLmgmtgk/BXu2B6bq0G4rCpYuDee19XG5sNptDQihqjSA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(46966006)(40470700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 19:54:02.8556 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 824bc07b-c659-4562-0abc-08dc33e00507
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8716
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

The following changes since commit b401b621758e46812da61fa58a67c3fd8d91de0d:

  Linux 6.8-rc5 (2024-02-18 12:56:25 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.8-2024-02-22

for you to fetch changes up to bbfaf2aea7164db59739728d62d9cc91d64ff856:

  drm/amdgpu: Fix the runtime resume failure issue (2024-02-22 12:28:27 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.8-2024-02-22:

amdgpu:
- Suspend/resume fixes
- Backlight error fix
- DCN 3.5 fixes
- Misc fixes

----------------------------------------------------------------
Armin Wolf (1):
      drm/amd/display: Fix memory leak in dm_sw_fini()

Lewis Huang (1):
      drm/amd/display: Only allow dig mapping to pwrseq in new asic

Ma Jun (1):
      drm/amdgpu: Fix the runtime resume failure issue

Melissa Wen (1):
      drm/amd/display: fix null-pointer dereference on edid reading

Srinivasan Shanmugam (1):
      drm/amd/display: Fix potential null pointer dereference in dc_dmub_srv

Swapnil Patel (1):
      drm/amd/display: fix input states translation error for dcn35 & dcn351

Wayne Lin (1):
      drm/amd/display: adjust few initialization order in dm

 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |  3 ++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 57 +++++++++++++---------
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |  7 ++-
 .../gpu/drm/amd/display/dc/dce/dce_panel_cntl.c    |  1 +
 .../drm/amd/display/dc/dcn301/dcn301_panel_cntl.c  |  1 +
 .../drm/amd/display/dc/dcn31/dcn31_panel_cntl.c    | 18 ++++++-
 .../amd/display/dc/dml2/dml2_translation_helper.c  |  9 +++-
 drivers/gpu/drm/amd/display/dc/inc/hw/panel_cntl.h |  2 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c | 26 +---------
 9 files changed, 71 insertions(+), 53 deletions(-)
