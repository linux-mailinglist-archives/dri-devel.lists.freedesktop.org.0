Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 783B09951A0
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 16:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D509310E0BA;
	Tue,  8 Oct 2024 14:28:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="r2hbfSqa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB0E410E0BA;
 Tue,  8 Oct 2024 14:28:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gXWM26XRfOqmcPahJwXLpxTRxLFiynHdIpFwpp2PE2dzrGoEqR2uuWY96FSVW9wVgDPo6HVnp0etrW0/aKbQay9i69H5gF8cvg0ubc7K6FZqjzXfX3oJxzvv2srn3mQJZjJfKnGr4rWsg+khK8zeD510Ml5lG3ebVnwAAVVanXRttakJ0APuJ33r3NUuRdGaBh+VMxSZpJFdxbLMnKO0UScbyr99qpTc/TBeDw+54zfOjUCF7QWTv8dF2FYc1R3XflHqB+GfGZNLS8xOT3S6P7ljhZu6d4YFq6cmGqASe4oLM82R5Kp1GA9oXMVYoIv0z/PZ390/V4pORySu9TUE4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJVhL3wNClS6L2lSq/oeffOo0E5qrhLc9EV0QvB1kOg=;
 b=DPgLuVgE55eVK5ManIBVl4Lqr6Es5K7dzhXZajmKHjtSllUAp2lV89bxXXqWA13G2338Scwf1dMp8i8O7IgA+/aTGFL0r3ScxyA2CKh/zlGLzBmIPW5yo1/r0paTwvUoXZn+xbG0SxUzU2rQneUmgWRDbdqDgzcggxuyRjyyJ1qCbqAODryJAwXG0qHCsAb2aoGFO7YimwK/VfmF6aXhgkDOrP+04r42nweAlm1dHdsJdo5+eXHogoPhmbi0ioepgeat/ycf+5YRj8Q2XmrIAYYFoPLKhDLKavqS6VK1+ir1iWk/uFaS7UksybFsLs2OOaXjH18n59S2WN0zDOoHiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJVhL3wNClS6L2lSq/oeffOo0E5qrhLc9EV0QvB1kOg=;
 b=r2hbfSqaqV2zyJvds28rqEBU/PgDU5Zb8Dds9hvAG8q0VvRCqMzbXduT9NGaaqIe6q7dluuwbU8RaOuBIuLdgc1EydF3YZaW1IztzWcDzFhTx21RBnD37GH7Yq3DtU2QINavM49yNAANQkyIMy7t4c91J8LT/C+NOlYxahecIyM=
Received: from SJ0PR03CA0345.namprd03.prod.outlook.com (2603:10b6:a03:39c::20)
 by PH7PR12MB8825.namprd12.prod.outlook.com (2603:10b6:510:26a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 14:28:52 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::51) by SJ0PR03CA0345.outlook.office365.com
 (2603:10b6:a03:39c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.17 via Frontend
 Transport; Tue, 8 Oct 2024 14:28:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 14:28:51 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 09:28:49 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd, radeon drm-fixes-6.12
Date: Tue, 8 Oct 2024 10:28:31 -0400
Message-ID: <20241008142831.3739244-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|PH7PR12MB8825:EE_
X-MS-Office365-Filtering-Correlation-Id: 84489e68-cf36-4c46-5730-08dce7a58807
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dEJreWlJSUV3MkJ3dTRJb0xPRDJabnBKQWpRKzduTllMMjlOY2lpUXdmK0o0?=
 =?utf-8?B?Y05Wa3JoZ0V6a3pRRmVvK2l2UXp4cys1WmZjdGpUNUNPZkV6VkxyUGx2Sld2?=
 =?utf-8?B?a2lwcW04c3kyY2FNdGRxMm50bHNYc2phdHExVzEwajhaRk4rOEdVbXU2dkY4?=
 =?utf-8?B?Sko1VmtFcFJ2KzAzb3VkbER0Uk56bStsZXVVYWV2aFA5RUQ5K0ZJYUkzMTNL?=
 =?utf-8?B?WVFLOUdhTVczQktCK2hjN1BrTjBUQVRWc1lEMmVQMDBPaGJGa3d6VDRJdExI?=
 =?utf-8?B?WC9RZ0d0MmtWaWJWSjB6bHQ2eEpqcWZvUU1ncWxPM2pFVEs3aW5GdlRUTEds?=
 =?utf-8?B?UEdVaUh3dm9RMU9RYnQweHVLbzlTMWQvVmpMT3k2K1h0VTRSZ2RsckQwdCt4?=
 =?utf-8?B?ZjJFemx3Z0VjZnA2VExOVmRhakQvdTZFWVl1ZVd5aWdTM0QvY2RSUHNWNUVS?=
 =?utf-8?B?SHRBcEIxajlBUmo2eE16b2hMNTE0VWJraFp3d3Jxa3NCTGtlczBBaTlVSnU5?=
 =?utf-8?B?b1MyUVBFS2YvT3BKL25aWVQ3MjJkbU9NajREYVh6eFI0bi9vWGFMY2VlL21X?=
 =?utf-8?B?N0pMd3E0SXRUWFBJRHpLdSthSDlRcFFQc2cxTmdxOWFDVkllWWtJTEdJaEhp?=
 =?utf-8?B?VE5oVk9SVVN0bVNjMU1OMEVLRjRHdGNhcm1LR24yOFo0WVBzWFdYMkVlb3M1?=
 =?utf-8?B?dWc5V2JoL0dTbnE1dm1qeDM5RmhEdGNzUFVjSmlyNm5KM255VjI1ODdvQ2k1?=
 =?utf-8?B?cWpkRGJ0eDVQMytmUDRPbmtrV2dSdDJmb3V5UVNLd0JnUFl6eHQ2bFBmcjZ6?=
 =?utf-8?B?NjlkdmduU1NxckNmNTVGUEZVd2RsWS9rZFhDbTBlU0VyZzBYY3M3R21ZWkVv?=
 =?utf-8?B?ZkxvcWxPU3RWaWF4Wk5CMkJqekdzU0xFZk1DYTg0eDdta1pkb1l1Y1BjaUxJ?=
 =?utf-8?B?VHdVcEtSbWd5OGVYT2p4R05YU0xOUU9UMExCMUFMREhtRVZYQ1dJc0ZFN1JW?=
 =?utf-8?B?WElla0Viby9jTjNqNk1XVEJScVVxRGMwejJkM3NRak5ieDlJK1RJYjFJMUpR?=
 =?utf-8?B?Ni9ZRkRhVWZqMFRVdkxDSTFTbTNkTTVQWFlvSkVVMTZBaENCYjZNVEdCbWxV?=
 =?utf-8?B?bWNpVDRTWjgxWEF5ZEZJVVVkckd6ZDEyL2tWR01DeE00bGFTS21ad2lweWRB?=
 =?utf-8?B?RjZFUHVIZDhnSmU2clRURjg4Z1dKZHZBYmNmemN2MTVIc01jVjJCdWdTYUla?=
 =?utf-8?B?Ym55S1BTZ05reHpkeTBML0hLZFBKSFZZQmpJUHVibWVhNTVsYklOTVY4Rkty?=
 =?utf-8?B?a0N5TXNIc1ppZ0FDdWFYZ0VsYTVTWjJjSStLVGRDcDRsSWttYzI3anovcEtB?=
 =?utf-8?B?eWRnUjdlVFVERGxrVnNLTW1Palg1ZEJmaVhST0xFUmZSdDFSUGRBN0V1cVNV?=
 =?utf-8?B?N1VrL3FtTEZ2SkNpVFJxOGpXSEJsU2RlZzBlRFd4MnQ3dTh2SWdhUW0wMStD?=
 =?utf-8?B?dkJiWk94SkgrcjA0WUNtUDdqOVExVWgraUt2RjJyajZ0Q25tZVZKOWpiVllj?=
 =?utf-8?B?M1VKVXJsTVF0SndweEVoelpic3I3Zld1eTYrcExiQ3lKaEQwQVBLZlpieFpJ?=
 =?utf-8?B?TDQveHJmaDJXV01YM0ZNS3RJekg0cFlkVEVNbFFDMGVHT2d2ZlZ3Y1lPVjZi?=
 =?utf-8?B?T1dnMWNnb3VYb3p1b2RhSEhjUzF1UGY3aGNzM0EzbGZyZERtTW9qd0RQM21C?=
 =?utf-8?Q?u1iY0nX8PrFKCYb/WzLwXdJujFPJQbFVDiCK2+y?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 14:28:51.5694 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84489e68-cf36-4c46-5730-08dce7a58807
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8825
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

Fixes for 6.12.

The following changes since commit 5b272bf7dcf969eb4f19ef994b6e60458ee6300f:

  Merge tag 'drm-xe-fixes-2024-10-03' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes (2024-10-04 11:00:39 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.12-2024-10-08

for you to fetch changes up to 32fda5650625065b8ae6dbd9967fb572d3835c35:

  drm/radeon: always set GEM function pointer (2024-10-08 10:18:34 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.12-2024-10-08:

amdgpu:
- Fix invalid UBSAN warnings
- Fix artifacts in MPO transitions
- Hibernation fix

amdkfd:
- Fix an eviction fence leak

radeon:
- Add late register for connectors
- Always set GEM function pointers

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: partially revert powerplay `__counted_by` changes

Christian König (1):
      drm/radeon: always set GEM function pointer

Hamza Mahfooz (1):
      drm/amd/display: fix hibernate entry for DCN35+

Josip Pavic (1):
      drm/amd/display: Clear update flags after update has been applied

Lang Yu (1):
      drm/amdkfd: Fix an eviction fence leak

Wu Hoi Pok (1):
      drm/radeon: add late_register for connector

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c          |  7 +++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  7 ++--
 drivers/gpu/drm/amd/display/dc/core/dc.c          | 45 +++++++++++++++++------
 drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h      | 26 ++++++-------
 drivers/gpu/drm/radeon/atombios_dp.c              |  9 +----
 drivers/gpu/drm/radeon/radeon_connectors.c        | 17 +++++++++
 drivers/gpu/drm/radeon/radeon_gem.c               |  3 --
 drivers/gpu/drm/radeon/radeon_object.c            |  1 +
 9 files changed, 78 insertions(+), 41 deletions(-)
