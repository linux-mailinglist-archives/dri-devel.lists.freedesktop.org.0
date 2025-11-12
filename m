Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E49C545C7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 21:10:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D64410E7A1;
	Wed, 12 Nov 2025 20:09:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fQM7W7sJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011051.outbound.protection.outlook.com [52.101.62.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A917410E076;
 Wed, 12 Nov 2025 20:09:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LfVDcw+HK/Ozqk12JOlWeuCCsTdClTi13h1Cyq7LXPOrwJQXNkOgQakO9WUPfohxUQHXTFUuzdrhuHB9wr/M9ge4HivXe8zK8c7/oR0o7p3gKO5v8hCX7O8juJkIM2YiEOqFnWEaoLlF3zt9I2gDmsKcEyW5CBlkoXqpEJG50Hmr4W/aLG31AKC5WkVjyGhR7vGLjpGZeKSaPQiis1CXSzZwmmRpaz05UgoSBEUr9P7DZeuZ8jyB474HRLIBXHaic8j+waG3l6xHq1+TKAHTMqLW060g5Lf3yjGp2Dblrrb6kyrb+1O6CB/uoIhENYK/gQgZPCRz+DUto46OCCPbsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tirakyzklzGqccomIECOVXUrpztEEip2CrI42TfrNJ0=;
 b=jPgyJZvz9b2AdIirMwT6UIW4+vyeK4sXYKEuET2+yiWzBqS2Lr9F7o2pIlnibSyfeFNHlikBsRHLxTa0tYV/mFm4zPrZkIU3UtwKetFBUa48iaPAQvonOeavDAtpA8Ga/T71tz50FxcoMyzIGeedsfheiMega+5Z7eELRfNVvifFa4cXianubeVyPUL0ij4L6fM8B1IyYVUzlFYpjfGKctQUuNx83roaP1be9o5nxPChTqMphI2l2IaBrAFwyIJ56Nt8usFowoNo8P6br6DXWAkImtK2Mudp1EVNZsn7bX0sxrrXxP8sGDV1Jdj7tL4DcY4M2vf+tfANqfRzStA8Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tirakyzklzGqccomIECOVXUrpztEEip2CrI42TfrNJ0=;
 b=fQM7W7sJf7ZNdJYvcuci9iZwNA1gbuhPcS3cVNC3frhoPZ1RYZmymgvEpYqOby1HtqnGPWQ5YOVyhhj94jxqW7yOhj060pYPbGkeysH+bwqb6QXXzIx5QHhKVtVnKK5kARdULUL9k1jt2KVCCAAdcsc5jC5h3r5wdXYoNe9Hlo8=
Received: from CH5P223CA0005.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::17)
 by SA0PR12MB4398.namprd12.prod.outlook.com (2603:10b6:806:9f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 20:09:51 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::c3) by CH5P223CA0005.outlook.office365.com
 (2603:10b6:610:1f3::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Wed,
 12 Nov 2025 20:09:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 20:09:50 +0000
Received: from tr4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 12 Nov
 2025 12:09:46 -0800
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.18
Date: Wed, 12 Nov 2025 15:09:30 -0500
Message-ID: <20251112200930.8788-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|SA0PR12MB4398:EE_
X-MS-Office365-Filtering-Correlation-Id: 327e364d-4e38-42a1-7052-08de22276fd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AMzr9RR4z5OaHz2yhdyr7a103M7bd8Wejzqk5rvO2sipIzHjgMQ8BftEe1yZ?=
 =?us-ascii?Q?4dz5tqN0tlO5Luj/nhVxpL+D/UKcmPq1h5fmYUTKaRxX0yRArm2nNSoNPEMs?=
 =?us-ascii?Q?Csh5fjfBBnBbqTfMle3UHPzKpGFAOHmyCCJbyESkC5Bua5SjVvt0+Ckjl/0i?=
 =?us-ascii?Q?5x+I70MC6Iw2sgrx/WEbkCHJ7AZpPCfYBFoX5noAQBl7VHXvAROxDnC08y6p?=
 =?us-ascii?Q?rBqVkUqL0HrHnBc6sr43wxuNkuSZuXlqdeFo/X3uOQwQLw0W9vllnldqKDoO?=
 =?us-ascii?Q?DPYBLui/XLVdrbpXCq9Wr1zfrl9QYr9IuxDPKfGFP5PkfOpbTR/fZ7YtJbRk?=
 =?us-ascii?Q?MSiF6ItPmzAxWHkgOxLShg/gPM5BC7VLyoq5GC/yGCnzrUa6TlCyV7VljCYo?=
 =?us-ascii?Q?1HImklsH+CRrvXLX0O1GARDIH8ljZvz1zS4uJRkMdmwCjFaWAcY85rd4LrWt?=
 =?us-ascii?Q?rr/RGQtnKWJ56tlrYZ1NPEPVwRKKhOliNDzQyZ6HYCZpM8XAenWSqwEW0Xzx?=
 =?us-ascii?Q?Vsd0jt1nsFV5LjXSPiK9E+vb2FPHzvR0/7sN7r0v8IPSz8lICZJZH3a3lrQC?=
 =?us-ascii?Q?7cNpI1L2VBmIyT0ygQrEs1ZcwrRZ0E5YcV3+RGEGtb5kZZaTHjlgRZm4qUvG?=
 =?us-ascii?Q?LkZP5forFsGU8L8T8P+0Pc8P0mB6FUqm9u2g3vS2HFtEUD4f2W0VhMV2PAr6?=
 =?us-ascii?Q?ftdvdd5kHBPtfquLxDy28NE+4VvAKkSltuctK880rRZkASwVhasO0TK2FY4H?=
 =?us-ascii?Q?zHegUSSKHrlwuhAvUVRoxzyprGEPQhkzXDAVwSmrD8PAzeFvvsrF/3NGKokg?=
 =?us-ascii?Q?O21bfgDWobf/1DrVuY8fNwFsEh9MWyaUxHnzikLxQ5SRTmJssRot5adIQfLg?=
 =?us-ascii?Q?0geD2kidtjqumAhC7FgQ3vF8JFHnZ4SWKw789kWPXW+gaNuts3/a/IKdS6//?=
 =?us-ascii?Q?HPLUNTUcA77efvGrF+uiY3rPp8XVtCwEb3qWqk9R8HcLLPL4S13J73XulCOC?=
 =?us-ascii?Q?GB+L7b3jvVNcCqX/cXZZzhS33Ii2KUv2R7mde1PUjvueTD436oFHzmTsBwC9?=
 =?us-ascii?Q?Iz2BmOQkTXKBfP88W+4jEYagMI0b0MzIGieV5JojOOTATruE2f2AsKNh+meU?=
 =?us-ascii?Q?zhJegtR7xyLf1qusAOewzBt67XQL1MhCIiXYPtPhW6mEkj6VcS2PlDGQWpI+?=
 =?us-ascii?Q?rZzPSV2vgMaf7jts6x+PWSzvGg5mvR0M1ujaXDqmhQh4l99EgO/AQxncJWGL?=
 =?us-ascii?Q?JpsK47oDNjmZPy8iMeBA8VgcSa68H7O/ZrF8Qp9w37aH+fBe3XNKT0OLnE9s?=
 =?us-ascii?Q?hq8BoGNzouANEgQ1R3/Ce7bi6TDxcbjEhS8tKfzPCG/+RX2UsuCG5BMPnYcx?=
 =?us-ascii?Q?J2T7YWWGmLVkwyx0h/1sEUDUGAQuclSr9zxxDGCHQIHXNpGigC0w4x7nQ+b9?=
 =?us-ascii?Q?XhPw5ZSNyw7KqrCzyZmw3RuySeojVr9rGid/EW57t3kxBPFUq4rAnz+HpcBq?=
 =?us-ascii?Q?XH2psYEn7oxMqGVFiJriW6/ptc6VWaCw3GAd?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 20:09:50.7759 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 327e364d-4e38-42a1-7052-08de22276fd2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4398
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

Fixes for 6.18.

The following changes since commit e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c:

  Linux 6.18-rc5 (2025-11-09 15:10:19 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.18-2025-11-12

for you to fetch changes up to eac32ff42393efa6657efc821231b8d802c1d485:

  drm/amdkfd: Fix GPU mappings for APU after prefetch (2025-11-11 22:52:51 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.18-2025-11-12:

amdgpu:
- Disallow P2P DMA for GC 12 DCC surfaces
- ctx error handling fix
- UserQ fixes
- VRR fix
- ISP fix
- JPEG 5.0.1 fix

amdkfd:
- Save area check fix
- Fix GPU mappings for APU after prefetch

----------------------------------------------------------------
Harish Kasiviswanathan (1):
      drm/amdkfd: Fix GPU mappings for APU after prefetch

Ivan Lipski (1):
      drm/amd/display: Allow VRR params change if unsynced with the stream

Jesse.Zhang (1):
      drm/amdgpu: fix lock warning in amdgpu_userq_fence_driver_process

Jonathan Kim (1):
      drm/amdkfd: relax checks for over allocation of save area

Pierre-Eric Pelloux-Prayer (1):
      drm/amdgpu: jump to the correct label on failure

Sathishkumar S (1):
      drm/amdgpu/jpeg: Add parse_cs for JPEG5_0_1

Sultan Alsawaf (1):
      drm/amd/amdgpu: Ensure isp_kernel_buffer_alloc() creates a new BO

Vitaly Prosyak (1):
      drm/amdgpu: disable peer-to-peer access for DCC-enabled GC12 VRAM surfaces

 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c                 |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c             | 12 ++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c                 |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c         |  5 +++--
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c                |  1 +
 drivers/gpu/drm/amd/amdkfd/kfd_queue.c                  | 12 ++++++------
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c                    |  2 ++
 drivers/gpu/drm/amd/display/modules/freesync/freesync.c | 11 +++++++++++
 8 files changed, 38 insertions(+), 9 deletions(-)
