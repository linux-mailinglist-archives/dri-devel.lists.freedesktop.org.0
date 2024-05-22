Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C44398CC695
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 20:54:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061F410E373;
	Wed, 22 May 2024 18:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Oqc4earH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F2910E337;
 Wed, 22 May 2024 18:54:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UwQOP/2TrtucV2rOp8Mc2Q5gsdYvxWV1oLe1cuvWg/PV+FW3acNU19QNQNUVOnVx8rrT3vtoiXalb+oe5xrhKN08WGA0iI7uIGXvpFOlDb7m19dOLygxCIGZxYZe1sLELaZ60KdpdCzemyOipa4dft7AMa/8GvWjWjsH6MJQePjfZ2u9WEfBKnYTfjWuNQfqYZGMzJsZaqFSKSZaWYiOF8gSiIuQFXvnFv4uPzYr7oMW/Ytimc/ns/2gbGCOEOR1TwyJVzj2o811wpwmuu/pUkVA6RSovzFUAx15Ie04KYIw8PuTS2u+Q7PkNs7JVK7/cXhwSblugkpPT5ZNkgQzhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YuYIIik2DRJ5csWmE2U2rl1i3MPd1615ohj/WJpn+Mg=;
 b=KWM+KhKJ3iFkLFsrRnz5cBID7bM+LqEiym+ttfN3Bov5mhyI2ROgAzql2pXMH5v0UZI0dSaVsjo9iqsBtduEgx/yF4+POaTv/xVTF45flNxH4YEtbb1hu+1iA6n9ZtclaUadVy9J2nZgm6eZSE1yRC/us9s2/vNPH3gSSIXO81y7+aPS9dZnrzwcfK7eAqGall1kyKoauTJpaohi3Oj2Av1QLdE5avPUAkePKkVGm3vcPoeDVYQqhzZhh9jDPinkfKRhSaOghkemfFg8eItnBNUBwLPtpPffow3bkYNnYn1D+FAF4n88ae8QIHFJFBuGqYkQ+Mnp2CsukRQGcxJ74g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YuYIIik2DRJ5csWmE2U2rl1i3MPd1615ohj/WJpn+Mg=;
 b=Oqc4earHfqPw3Lu5v3D5TK4f3E+d74TJGvKjMAhu0in1hPDZ28GzHADJ2fE9Dzs90bRvYJZk95KMjghkRgpsDjujKilT4LvekoXDEn+QgJQSxKoeBh74kZdxZ66+/A6rwkiJM2PSEnlG0pvicKZ+OGlkup8cntzhOIuEsMO/8YY=
Received: from CH3P220CA0029.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::11)
 by PH0PR12MB8099.namprd12.prod.outlook.com (2603:10b6:510:29d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.20; Wed, 22 May
 2024 18:54:04 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:1e8:cafe::c4) by CH3P220CA0029.outlook.office365.com
 (2603:10b6:610:1e8::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34 via Frontend
 Transport; Wed, 22 May 2024 18:54:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Wed, 22 May 2024 18:54:04 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 22 May
 2024 13:54:03 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.10
Date: Wed, 22 May 2024 14:53:46 -0400
Message-ID: <20240522185346.16716-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000142:EE_|PH0PR12MB8099:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bbfaed5-a061-46e0-00a0-08dc7a908d1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|36860700004|82310400017|1800799015; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iFSqPl+Nyg1RLVmoiJ54lS0Az7cLLwu9jAmL9z8JFiKK5aA2p9ZJxo6qHX0+?=
 =?us-ascii?Q?W5PYMwKccIkLzRrFoBLpFSHakjxOqWv1j9gd2x9k9Jez4fWJ0tkO793q6oPH?=
 =?us-ascii?Q?hmEsxaZjRce+ZMce28GWObS1ZwnK9qZzdtNyGApPI6MuhrOoFY+TqORAixtI?=
 =?us-ascii?Q?J7AcRCE3j+UUhcZHiCMj/fTwv2aKF7h+yQRwuW/8WEeaxBy+KvJxC//2fhr3?=
 =?us-ascii?Q?PjgRiBnBs5tBYsOKrRyn+Qd5uxxsuaJX65eqnooGhDbt/odyJTPzKJLpvRj9?=
 =?us-ascii?Q?ETXVM5Mbag5tVOXk5dh+KFmOrVMSjWpvsI+ElkdnLn2gbop1vk4xSS5zuk6G?=
 =?us-ascii?Q?KXm5GrLBh+Px3FTTSDO0bA77JzCd+DUrIBYI059LrzeEVft1sUj5dOWU1RQH?=
 =?us-ascii?Q?Caw4UefgwbY1WhGPulTlDKA9Fh6sJOQgoxGBi4MZ+QJ8QDx2jBtthOf6ckFk?=
 =?us-ascii?Q?HhdajwCxDoHHSjzir/tFCZc7DHRz0Ciq58tkX5SXZXXElroC853B05L+FuE2?=
 =?us-ascii?Q?NHZhRXUEO2do3m3aQSq64BOtsnFn+Wx7jlZHJ5aAul/C74NI/+PYfwcv9Kqh?=
 =?us-ascii?Q?3TDEBbw8aBGeeC6Y7ipaLOghof1P0yliJ3XWoTUALOikb9JfD8ZXju7IoIOC?=
 =?us-ascii?Q?1lAblJJKzOIFd+JyznkILo7G1dJJ/cBOFyQtvKOT8UpgrdfTXTs2HmMWPsZv?=
 =?us-ascii?Q?cSqwEI7T4iU/XY1kQ2vvq2vFM1siH0uxTBMmf/56YHqhFmVfwEOfxJOelhW/?=
 =?us-ascii?Q?dqrj16Iwbm5FW/69HYa8aAt71Nz9J1eNdlMwuf9wzZZNW9WTen89Oxtri3DQ?=
 =?us-ascii?Q?cHsuSSodsGlfs317I/68J/wKBFbZi+0IOZV/5mje9DKieYUv1EdGE1kBXJQQ?=
 =?us-ascii?Q?govzpfAAQ98krGu966a/Ygp7kvoDWjwSK6hPZq73LiDcinnZkf7fg+o0BJn+?=
 =?us-ascii?Q?OsQQnCDECzVLZ7l/MNLveadCL2u4gl1KuanykoUNvicS9yAcUwv6srmxHDTN?=
 =?us-ascii?Q?GHuJDoj+pYu8ZdjDp4eRlANPahAEQVZcqdAjWxXdnvL8ycQLoyEqo/a1vXZ/?=
 =?us-ascii?Q?+Cmc7iOplgq6+SiPCpUkmb56Is47uH/V1wDKoP6BSMRijzZVry84Dy2rkhSu?=
 =?us-ascii?Q?LkROG9tricDJkrZ5yC1J2uf5D1C/xrCvXmNIxIvLLZf3A0RLkVCfcj4/YXYz?=
 =?us-ascii?Q?joIBOrNuRUCf+n6YXbfEitcKXFPalBs20U+woibYh/L0Pdm950Xz7ql12q+V?=
 =?us-ascii?Q?d8mvVC0Veqo31EI4xxIGhvPGSvJ4KxYzNwgTrh7/WzrBogj4JhFkkad6itif?=
 =?us-ascii?Q?wLWng6goXk7IPKd20xio3ooL?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(36860700004)(82310400017)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 18:54:04.0313 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bbfaed5-a061-46e0-00a0-08dc7a908d1a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8099
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

Fixes for 6.10.

The following changes since commit 5a5a10d9db77939a22e1d65fc0a4ba6b5d8f4fce:

  drm/buddy: Fix the warn on's during force merge (2024-05-20 06:42:12 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.10-2024-05-22

for you to fetch changes up to e64e8f7c178e5228e0b2dbb504b9dc75953a319f:

  drm/amdgpu/atomfirmware: add intergrated info v2.3 table (2024-05-22 12:01:39 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.10-2024-05-22:

amdgpu:
- Handle vbios table integrated info v2.3

amdkfd:
- Handle duplicate BOs in reserve_bo_and_cond_vms
- Handle memory limitations on small APUs

----------------------------------------------------------------
Lang Yu (2):
      drm/amdkfd: handle duplicate BOs in reserve_bo_and_cond_vms
      drm/amdkfd: Let VRAM allocations go to GTT domain on small APUs

Li Ma (1):
      drm/amdgpu/atomfirmware: add intergrated info v2.3 table

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c       |  5 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 23 +++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c | 15 +++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c         |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c             |  6 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h             |  3 +-
 drivers/gpu/drm/amd/include/atomfirmware.h       | 43 ++++++++++++++++++++++++
 7 files changed, 83 insertions(+), 14 deletions(-)
