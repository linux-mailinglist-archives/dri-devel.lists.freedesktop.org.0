Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF519AF03BC
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 21:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF1C910E63F;
	Tue,  1 Jul 2025 19:27:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nEshbynl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2087.outbound.protection.outlook.com [40.107.243.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50FF410E2E3;
 Tue,  1 Jul 2025 19:27:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m87fLFhI6iLjWIGRq0JNZv0ELMXtALWGTx1/ksffkNqu9HAUIU5SAPGsaxSNHiZpbhpInxDD1rC9E98I3mW5y78Ixyy5gTI1VYvM115NXFlpHZZ2gYmVS4vaLzV1GPdQsO/pLOyiGwSknRWGk5D1dMmbCxKHjodXsdWuwEB76OYIg8tCWyRwXeL34/ZvXrOV5rVr03uZ8/TYNwJNi+wFoSJpZbyZ/Ge4rjPtav11t5FRtW76zNrQrzkO76npQnlGRAbMryhtBMr4fO5m2ZLwHL5HLmZHEAtLuNeGxk2epewlNfMz3HndIvQ1vKUkorFzzBCGDYnjDipkg1r/y1UHNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WlCWWuRFEo2uwKaUdxq5bE/h2J7tvPeGJqcocrloWyA=;
 b=T8olUZS3lausLXJgg1+GFmAVw7DuKGybg7O2NMRMTERiirCmBiGXHly66K30upoYJ4pw2BYY9fmoGAz7BzxKnXk1WnbrQHou2FKoY/Y03X2hEyy+ZZDIicmm52VrwRCJy2USSMOhAy4IBwnPhuUsh0+RBCSWMBHRSR5pHWX9KX1cYqsj6dz9M3ShnGlrbUA6dFG91i7v5t3ZUaSFW8RW097AdPjYQQiXuGFZL+QRt4OgXTE7FUdsv3B2jw09sqvz6zN8nTNZz29ci8DdOmLQHi0s3yBuWwYrtbJUlhYt7vwiaCbxxBhTnn+G47118WLTcZHw4YpuOLqPrIoXl0y8bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlCWWuRFEo2uwKaUdxq5bE/h2J7tvPeGJqcocrloWyA=;
 b=nEshbynlDGES+l9wQjsLc1wQniYFaF5oDJHdjVVvDmvOBCrAHgsx3vXqbjstYDL02S3+jQ77eqRu4nFPHhXeqP9bIMpyymxT2xD6ABmw9wGHJ0mFNJuodSU5IY05Loowkn0R+EUhHhWgZkxx5Imwtl2vU1aAcAsLyvEUS+RsBes=
Received: from CH5P220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::17)
 by MW4PR12MB6778.namprd12.prod.outlook.com (2603:10b6:303:1e8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Tue, 1 Jul
 2025 19:26:58 +0000
Received: from DS3PEPF000099D7.namprd04.prod.outlook.com
 (2603:10b6:610:1ef:cafe::2b) by CH5P220CA0019.outlook.office365.com
 (2603:10b6:610:1ef::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Tue,
 1 Jul 2025 19:26:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D7.mail.protection.outlook.com (10.167.17.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 1 Jul 2025 19:26:57 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Jul
 2025 14:26:55 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amndkfd drm-fixes-6.16
Date: Tue, 1 Jul 2025 15:26:42 -0400
Message-ID: <20250701192642.32490-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D7:EE_|MW4PR12MB6778:EE_
X-MS-Office365-Filtering-Correlation-Id: c9d406e0-31df-4413-911d-08ddb8d53e6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZBJzAy+g7H91HhV+joJyj7OikME4eaI/7RF9Om1idhgiBBvmteiorgO10BuD?=
 =?us-ascii?Q?8p1oyxQW1MoApuC/ICUODy+25V6w2ZZS4qBq+zTHf76kgnhD5imteEEL4lXz?=
 =?us-ascii?Q?2pR+Z4Q1EIZWw9WQEy+BR+KL9iSyFvz9r3L+qdsqU5eKb7sJHIC2pPR/2KmI?=
 =?us-ascii?Q?urhWWToGjV+iossPuJ5vVNU9mH3tCHOKAnEN0Ln1SO3gtTpPykh0gnWN9Nl7?=
 =?us-ascii?Q?cQEI62oC4kvQie90zJEXNOs8oV+2flupjrQYOHpoYwrGtr80fZrUk20UgKkc?=
 =?us-ascii?Q?b64+t1dFTds2mS5ckWBUg+e+RcE1P7E6xfIzFG66o6n+S27I4ewHCUW5Rhc2?=
 =?us-ascii?Q?VgyTS2/zz/gQb67vK95d9SHlDRnsHwnjrmH2bzVezmcfERtxmF6SKqworzAl?=
 =?us-ascii?Q?n+18uolV76ohKJOL46qn10tmi0iTUrAFUSQNuUmHUETikuRVr8oUcC0Fwxxl?=
 =?us-ascii?Q?X4GWUB6bMoYDlxDNzxap+o03SZSbk+SxaYJtUhFtVVc1yjWtBMpXmxG520l9?=
 =?us-ascii?Q?DZ5phLkT8ifpR5DaCiYfs0YesaYsEN6PCUtLZ5ACDoWcyzYCu1ig+WzVBV2X?=
 =?us-ascii?Q?1WtIzbIIiHO9zu1oZqVtMpREatMafxh4ZSfTvUii4rkglU71ADM7VAMcEFrA?=
 =?us-ascii?Q?/AHj4Djwr/0Hi0YPDKs4OeBXMpaZt867FvYv2kNFZTtA6Xst49Sjso5Dlrri?=
 =?us-ascii?Q?hA/ZvaRwxCSI7+LKu6oPPQl4/68Z+o07g+STyr7R+uRC8OOq9Fbm5WfiSRhI?=
 =?us-ascii?Q?yl2YNQGot8/zYBY/uKx4eHjHCUjD/oXB0Qg6/FQZrvYfJl2evwKqzpOEyE64?=
 =?us-ascii?Q?f7q9+hmP1MSy8xKGcar5gvF4RV3xjgqlWWaQDPqh7YFWBbpdFGzuRefYCpJL?=
 =?us-ascii?Q?1DME/pvoDM4NUrspyiOfX4pUSbWm4AVs8dRMHqZpQBt+tzQijHjz1fdg0R/i?=
 =?us-ascii?Q?lUGCWxfMrA6xA9TIukacVNiuKY1YnMcw8cXtrp9dhDQI/8JevIIRFeWsFgio?=
 =?us-ascii?Q?EoycbiUZxnOg6TGIUA1zuHkPFoHQoHG8Jgqpzv51gWytHkBFv9X7I3QyfBfH?=
 =?us-ascii?Q?/qGi13beqn8FtcWacQ6Els23kpn2MOnB8LTaAJ6duWwMBnKgAgwRxnyJTVl3?=
 =?us-ascii?Q?SQFM+ORZZYJDT5iVcq9GdNLocWX43bxZWeFvFJTESDikIWePApdihlwjogFH?=
 =?us-ascii?Q?8lFbYgQoTpGUwQtgrfXQS05Ei5m2dkk8E8jfzi1R3zz3PW8OU0qauNRwkvQ6?=
 =?us-ascii?Q?onAGXW4dyLy0VTSq/puhoEXWY7nBrlnS0a8u5vAGRGf+GHTOMMi9/js886R3?=
 =?us-ascii?Q?qA8r/Cmt4/0iHvb51kS1bqE1FEs3dMaihH1IoRCUhZhAp3Ak1yQSQMeLHYlo?=
 =?us-ascii?Q?g/WIMxBcou3n1oD/Ls+f4M9lkoNYPcz3UcHHxgcaVHNllt6J0fZuzfyDJ4nH?=
 =?us-ascii?Q?hu3YkuQk9FHFi6cp17zDn7MFxJYCPXDghZT2a8FI6qXp1bz7QUoCgw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 19:26:57.0772 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9d406e0-31df-4413-911d-08ddb8d53e6f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6778
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

Hi Dave, Simona,

Fixes for 6.16.

The following changes since commit 9fbceb37c95939182e1409211447a1d3f3db9274:

  Merge tag 'drm-misc-fixes-2025-06-26' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes (2025-06-28 06:53:00 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.16-2025-07-01

for you to fetch changes up to 39d81457ad3417a98ac826161f9ca0e642677661:

  drm/amd/display: Don't allow OLED to go down to fully off (2025-06-30 14:01:05 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.16-2025-07-01:

amdgpu:
- SDMA 5.x reset fix
- Add missing firmware declaration
- Fix leak in amdgpu_ctx_mgr_entity_fini()
- Freesync fix
- OLED backlight fix

amdkfd:
- mtype fix for ext coherent system memory
- MMU notifier fix
- gfx7/8 fix

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu/sdma5.x: suspend KFD queues in ring reset
      drm/amdkfd: add hqd_sdma_get_doorbell callbacks for gfx7/8

David Yat Sin (1):
      amdkfd: MTYPE_UC for ext-coherent system memory

Harold Sun (1):
      drm/amd/display: Added case for when RR equals panel's max RR using freesync

Kent Russell (1):
      drm/amdgpu: Include sdma_4_4_4.bin

Lin.Cao (1):
      drm/amdgpu: Fix memory leak in amdgpu_ctx_mgr_entity_fini

Mario Limonciello (1):
      drm/amd/display: Don't allow OLED to go down to fully off

Philip Yang (1):
      drm/amdkfd: Don't call mmput from MMU notifier callback

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c  |  8 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c  |  8 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |  1 +
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |  1 +
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |  7 +++-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |  7 +++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               | 45 ++++++++++------------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 12 +++---
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |  1 +
 .../drm/amd/display/modules/freesync/freesync.c    |  8 ++++
 10 files changed, 67 insertions(+), 31 deletions(-)
