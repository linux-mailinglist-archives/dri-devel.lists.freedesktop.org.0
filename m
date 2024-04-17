Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBD78A8C50
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 21:50:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD45113795;
	Wed, 17 Apr 2024 19:50:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0GqPdzku";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7E711379A;
 Wed, 17 Apr 2024 19:50:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GeecMf2zmL/P6eRcte2pqSuAuU1cGCNVyK1BraevSGcpOQxL0RHfVnfuIjnBf8kbJYt6v0LeA/P1hz6GqqmASqY0rIZG80z3tMvT29esA/5x2+w42xbiH5EOQQqKrqrsy8Vipch/XCuBetW9HtpUXe8PQGw1o7Hz0pvgZwuaZgWoZuwbMbwsmPkzNUBZeJS1HBsztdjVVrareN6IA5e9gVrOl4ZWh0BKBlu36Kyp5w/++lKeuQTuXYKjXHXLwDMa2ltKIx+5qSkdlM9NlxeVh+MwHkHHFf69puV0mB5ekaL/YqOlYveIfGIG+yNZAWVV/9sU5RTkylp6hKEbY8mobg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67q39aSWmU9j3RtewW+wIquZJbHYfzyNd/oz493OlxU=;
 b=WUFvw6Q/Z5pIqXnAdMcRPy2v6yFABm7bGX/K2b1ZvcypoFTC4Ckkky9z+x3WuELMiJ7CvDxqsyrB8nxELSSNNW87Tp1A01XXmTVgmrWvU2TVVFyniKnOidbcTA+MjKtr1LiBSw8mXoJFzaDiU/3M7p/TUFHvTE/W8liH5j9ANjuVKFvRTTpGm/gS1/MdGgP29bzbDr+fh6o+tC/zaQNkz+J5FGrl/f4Iu3ca/7hnIUtschGj5v1F9JVPhsWWy4aiKka6puAdypURAoSzaNcuDmCQGwWMhmlamOqX8MfKxO4DyJqeD/XSiUq2LniCmsR5JWJjG5XNfHhATa6bcj2ALQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67q39aSWmU9j3RtewW+wIquZJbHYfzyNd/oz493OlxU=;
 b=0GqPdzkuGRcEq18916uduWmcOqLayrg1qxsNH+NJAdZo71/hWXW0M18b4wbhzXwUzNs00O1aNINxGfEgsafv9JRfNdbIk9oZimKs8+NibwD7JEiASo9TbVtIyd3w3OqaLqxW0ZZo9x61uXNIx5Vs1YcYxJsLhyiXRpqkjXeheDk=
Received: from BL1PR13CA0064.namprd13.prod.outlook.com (2603:10b6:208:2b8::9)
 by SJ0PR12MB8613.namprd12.prod.outlook.com (2603:10b6:a03:44d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Wed, 17 Apr
 2024 19:50:20 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:208:2b8:cafe::3b) by BL1PR13CA0064.outlook.office365.com
 (2603:10b6:208:2b8::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Wed, 17 Apr 2024 19:50:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 17 Apr 2024 19:50:15 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 17 Apr
 2024 14:50:13 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd, radeon drm-fixes-6.9
Date: Wed, 17 Apr 2024 15:49:59 -0400
Message-ID: <20240417194959.3716998-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|SJ0PR12MB8613:EE_
X-MS-Office365-Filtering-Correlation-Id: 73ccd57d-c342-4a3a-51bf-08dc5f179a03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nxju0Wk7nrNPF3J3CDaQvxCJG4OmJ7xto79iVBw2NJT/l6H/L5ZcZsSgebutqmAK/ZUQdUsyquSml67xn3aF+YpgALw2xJNxi/tEnI6pnKTnjeBpBw6pOYFa3+mgiMWVaDRzfCAyurTw2gVsOW0MrDj+KDCgrgimqSgm8LrhzKc7r9MkNxGXG6XToj8pYSgs7ErmGFTJpk7czGPFWXGpXWVljzEMlIoleGTw3Vl6TrwI6sqwvZGxoui94splweBBto71JxLNCw7n9oonslwnTAfghBJAHIuYFYdHkLYdlrYo1nWNJUjc5Nv/lqqRvA6m8o/EprCu8UOOGt6a98qQ+3zItWlGTfT8yv4jtjUiPD4J39sk0bbn6T2zyler8t6ODpRgEsgYXH3tLN5ngmEI8qvhO2/OH6tX6vxWdw9bnpiXpw19gyRyX0OHkDs0uQ02S8MZj7OlCK3tpXCYJnIH2RZOKyp7wzdGMBp4kE8uH38uN6Knd3cuv7SN1EuES6tRSUYVIqC1Smm2sB2N+Ue2cMFw6epIGdb4MOIL+99CMq0qFpHwsgHvOR250Ufp/IlMQD4nYfmIb8nYtKOepI0FeYnKsyU+0ioLBoTz1EX00064C7sBcdBthFDCQyEz/1aUSTVJd2cGaFRPc9BGCgWYQjIF56U6kdROxwE3MD2SwQAp4L+hGiBrzRRlTMyzaQTCIfAMV1MoDbrBDMzCKD8QrQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400014)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 19:50:15.2250 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73ccd57d-c342-4a3a-51bf-08dc5f179a03
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8613
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

Fixes for 6.9.

The following changes since commit 0bbac3facb5d6cc0171c45c9873a2dc96bea9680:

  Linux 6.9-rc4 (2024-04-14 13:38:39 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.9-2024-04-17

for you to fetch changes up to 781d41fed19caf900c8405064676813dc9921d32:

  drm/radeon: silence UBSAN warning (v3) (2024-04-17 11:50:43 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.9-2024-04-17:

amdgpu:
- Fix invalid resource->start check
- USB-C DSC fix
- Fix a potential UAF in VA IOCTL
- Fix visible VRAM handling during faults

amdkfd:
- Fix memory leak in create_process failure

radeon:
- Silence UBSAN warnings from variable sized arrays

----------------------------------------------------------------
Alex Deucher (3):
      Revert "drm/amd/display: fix USB-C flag update after enc10 feature init"
      drm/radeon: make -fstrict-flex-arrays=3 happy
      drm/radeon: silence UBSAN warning (v3)

Christian König (2):
      drm/amdgpu: remove invalid resource->start check v2
      drm/amdgpu: fix visible VRAM handling during faults

Felix Kuehling (1):
      drm/amdkfd: Fix memory leak in create_process failure

xinhui pan (1):
      drm/amdgpu: validate the parameters of bo mapping operations more clearly

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         | 22 +++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         | 22 -------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            | 65 +++++++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |  3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             | 72 ++++++++++++++--------
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  4 +-
 .../amd/display/dc/dcn32/dcn32_dio_link_encoder.c  |  8 +--
 .../amd/display/dc/dcn35/dcn35_dio_link_encoder.c  |  4 +-
 drivers/gpu/drm/radeon/pptable.h                   | 10 +--
 drivers/gpu/drm/radeon/radeon_atombios.c           |  8 ++-
 11 files changed, 117 insertions(+), 103 deletions(-)
