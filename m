Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F28A28C077B
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 01:01:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64486112A41;
	Wed,  8 May 2024 23:01:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hOrNY88a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22CE113266;
 Wed,  8 May 2024 23:01:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5X5mFIOfsA3nyuIzXilt/PvZsSh//8UNYJitfwP7uGmhIUBvclI0CSqavbzEpGjwyRd6oOvCuY955Z19l1Q++CtRF4OXtKVcyZ4rlbxEOkDvI64YhXCdllkvfcSbF5LI+1QmgsecS2GdciDeyh7KO475TL9Dur+mnG2sCYichN7iHSJC2wzBRJS0SRZGGuygyme6HQkqiQK4GTxYFDTSfjzfanrakR0n7LLnHXHXdjW5IfT8qh5yxP+cS+w/awqRi2NqXFmEzVxIc7vPxRFW387ljDQ+4dlG8fhjHAmLyKx5gk3AIF8wcsdsADrq4iwHpeXMhJmZHIteb+9TW6AKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WS+JDUp7sUrxWd5OlXUk/YEOo5OWFYE9oWBQKv9VjNQ=;
 b=XnF1rMRZnpP6Rext0wJH2GxqvAOIpBcB+Fc2QlZKXmat/rZNAsFB7A6OHDm5X9KG0nzhXZ5s2ifX39szRoPULSiWEvnJbPzcqLBmdjK6jEQOZeWQsxKplZdwwgSgyNKirD6MZC4oLHNIX7Ch94SxtpY3b3kowzZas0oB1TrhNBIKaqVw894a9p0GslXItRKIeqLtyQWOzqyjLJgdwEATEWvxODClZME633Vpf5CflP1cqnnGwTqj7ITlcryPslRxYUEoX9rhKVX2WKUtyDRZo9ZNvgYbxp3eDMKdR8Zn9Zh7TZielc3tMLGAC/hJmhOYpxzC5i9n0m7/LEmB3GIqhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WS+JDUp7sUrxWd5OlXUk/YEOo5OWFYE9oWBQKv9VjNQ=;
 b=hOrNY88akHVqnnoaEdICgYXRRXeVWKLhnH0fHBib1Hr8itaHHGxvc0Bs0xmxoPPEGsQzoF+La5zBaVUULiS3gJF3ZZ/s02yP3pDrxYfMjyKiScnggfmeWeDFoeJQ68tKxLOjWI8/ZA0/2xhuVnBsg+Xt1ucga3OyIKWrfMlXDAU=
Received: from CH5PR03CA0006.namprd03.prod.outlook.com (2603:10b6:610:1f1::7)
 by SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Wed, 8 May
 2024 23:00:55 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:1f1:cafe::69) by CH5PR03CA0006.outlook.office365.com
 (2603:10b6:610:1f1::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.46 via Frontend
 Transport; Wed, 8 May 2024 23:00:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Wed, 8 May 2024 23:00:55 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 8 May
 2024 18:00:54 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.9
Date: Wed, 8 May 2024 19:00:35 -0400
Message-ID: <20240508230035.222124-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|SA1PR12MB5615:EE_
X-MS-Office365-Filtering-Correlation-Id: 3034bece-2f1f-4882-09cc-08dc6fb2b7af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|36860700004|376005|1800799015|82310400017; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUR1TXhqa0FucU9SZU5hTWFpbkxHOElqWjg3a2F0UmptWk1Mc2J3UXU4TXdO?=
 =?utf-8?B?SVphZ2hkTzloVUZxZU9NMGJMOVE3a3Mvdmk4bUR2YmF4dlJsSkFhMGFDRk1Y?=
 =?utf-8?B?TG1ENEdsdmw1SXZua2xvN3B5cmVpK1Y1dlNzRm4xS05Pa0lSK2R4YmNEM1Z1?=
 =?utf-8?B?TU5wbnBPQ0FZQTZ3Vk5WNFA3RWllN3lYaFowTHlmbTA4U0VoMkJFSVBuN2RQ?=
 =?utf-8?B?dDN6d3BGMFpIOG9xM0M1cDZVbmUyQ1VGY1dRREJDWXdoNnk1Ymk4QjVQeTU3?=
 =?utf-8?B?NjhKMjdWanFxcGk4MWExQUg2OUNHSEhIdHZ6TDdVeWVkcXZKR2gxMU9DZWNJ?=
 =?utf-8?B?N0YyYkZuRDVrdW1tU2RseWNnR0ZFS1B2V0VVc2V4R2hzRWxuaFJERmJmanl6?=
 =?utf-8?B?a2JSQ0VYa1FaWWVvQitNY0grVVlORFA0aEN0a2REZU9tWmkzUWdMLzlpbFVZ?=
 =?utf-8?B?WjRuWEVCamltMWM1aldlMlc3TXVHOGRiYXdjMW9tT0RGYSszZmpwYzhKSW1o?=
 =?utf-8?B?cG5RWDJGSUpiVDZ3dDJrdVI5MXN4cW96aFhvVDBLQ05Pbjd2YWVNRGhYQ3hT?=
 =?utf-8?B?TjQ1MzBybWltWGN0a2FDd0VyOTk2enB2MXF2M21SdUQ1bDdqSFlNZmJPcWxt?=
 =?utf-8?B?c0liOEZFU21NaGFYTkJsbGdsMndZYStGcHk1QzFNeldVbzhzaTk3dGhrNlBN?=
 =?utf-8?B?ZnoyVGRMZ25KeENwY3dXajZ2WTgzdmhHeDJZVkRMZDdrSTZaZGRWd2hvbXY2?=
 =?utf-8?B?SThNQTJ0Mk9EVGh5NXRzOERBTG9LeWxLd3ZyNjZ0eHU5RTJ5MXdHOFdOQnlj?=
 =?utf-8?B?cEZES0daUmh1UEpUQVRKeGNmQjYvQ0hKYWpGUG5CM2RiWnJXcW1YWEZOcnMr?=
 =?utf-8?B?M3lRemE2WVB6R0Zvc3J2eFpEcWlyc1FLUURZS1ZzcmRENU52YlYzeExrbWxl?=
 =?utf-8?B?cDhFaVBHWkdReTExdTg0UzlZOE1nQnJ2blBPeHR4N3d4KzZCOVhoclJpN2hE?=
 =?utf-8?B?T3VOTk5YSHRtbkVSOWZpWTU2TDZzaUVVWEs5c1ZQTW5GU1ZZRjgyQnpaUFpG?=
 =?utf-8?B?dWs0VVJrU3dReTFqRy9WMDBRd25aa3JGUCt6SnJYT0o1VzdQU0k5bzlPeDZC?=
 =?utf-8?B?MWwzZGpJa0krbWhFZVp5R1UwZVlXaWhxZGh3VWdDUjlKYmtKT0NWbjlBcFh1?=
 =?utf-8?B?enV2dEllN3MzWE9WZXBtZEFKMkJJQUQxODA3ZVh0dFJ2R0t4a0pZNDF5TE9X?=
 =?utf-8?B?WnZ5TVp4Wjg3dk4xWEM2VHFjRTdNU3d1ZG14NnJkRHhHTWY5SCtVMEltaE9Z?=
 =?utf-8?B?anplSVhrUkdnYjd5NUpFZEZYS3o5SXJkUVo5RVNIelpHMmY3RTRMZW50UlBT?=
 =?utf-8?B?elgwWldGS1QrNEo3Wi8vU0U2V0cwbE5OTFh4Q1k3dVhVNC9hMXBNSVhRWEhZ?=
 =?utf-8?B?UEFHaFNsL3B1WndPWTl4L1RRaDU4c3dLZTR3UkE1c1hPM3p4bE05ZkVFTi9m?=
 =?utf-8?B?N0FncGY1UGVEOXQ4YVJrLzZKK2xuS3djNGJ1dG1MY2pzdnhaZUhBazd3QWxB?=
 =?utf-8?B?SjZaN1kyUnpIb3VXRnZtb3JyeVJrbnJUL04zU3ZTSkFMMkxIOVdsQzhSclQy?=
 =?utf-8?B?aTRTdFp6VXFTVG9tSWgweWRqNlEwQjZkNVIxN1VFcVhJMGxxeWZwNXRXK3Rm?=
 =?utf-8?B?bmZhYjNQM0c0YkpJdFBzNmFPYmdZMlh3Y1hDdFFoc2szcnRoeHhUa0t3bHRi?=
 =?utf-8?Q?IlpRXF8dRCaiy6ZhQ3OyCe1fAnazrJUa0TEuwx6?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(1800799015)(82310400017); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 23:00:55.5706 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3034bece-2f1f-4882-09cc-08dc6fb2b7af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5615
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

The following changes since commit dd5a440a31fae6e459c0d6271dddd62825505361:

  Linux 6.9-rc7 (2024-05-05 14:06:01 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.9-2024-05-08

for you to fetch changes up to 3d09248a06d285397e7b873415505d299202e1c6:

  drm/amdgpu: Fix comparison in amdgpu_res_cpu_visible (2024-05-08 18:47:52 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.9-2024-05-08:

amdgpu:
- DCN 3.5 fix
- MST DSC fixes
- S0i3 fix
- S4 fix
- Warning fix
- HDP MMIO mapping fix
- Fix a regression in visible vram handling

amdkfd:
- Spatial partition fix

----------------------------------------------------------------
Agustin Gutierrez (2):
      drm/amd/display: Fix DSC-re-computing
      drm/amd/display: MST DSC check for older devices

Alex Deucher (1):
      drm/amdkfd: don't allow mapping the MMIO HDP page with large pages

Lijo Lazar (2):
      Revert "drm/amdkfd: Add partition id field to location_id"
      drm/amd/amdxcp: Fix warnings

Mario Limonciello (1):
      dm/amd/pm: Fix problems with reboot/shutdown for some SMU 13.0.4/13.0.11 users

Michel Dänzer (1):
      drm/amdgpu: Fix comparison in amdgpu_res_cpu_visible

Nicholas Kazlauskas (1):
      drm/amd/display: Fix idle optimization checks for multi-display and dual eDP

Nicholas Susanto (1):
      drm/amd/display: Enable urgent latency adjustments for DCN35

 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |  7 +++--
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |  5 ++--
 drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c        |  2 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 16 +++++++++--
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |  4 +--
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    | 33 ++++++++++++++++++----
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   |  2 +-
 8 files changed, 52 insertions(+), 19 deletions(-)
