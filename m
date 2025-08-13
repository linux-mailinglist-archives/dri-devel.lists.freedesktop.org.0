Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D511B24D1F
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 17:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F20610E741;
	Wed, 13 Aug 2025 15:19:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yusVzQ6n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2089.outbound.protection.outlook.com [40.107.102.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 843CC10E0F3;
 Wed, 13 Aug 2025 15:19:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mj82K7I/bDH8snX0vH5HGr3o4DG2X2XRWsc3up4W9KbIk0V+RbguVM1AZjA7hut8ZPokzbLDvmekyTsWSWj1w/p9Mea47qe91JfHdUIHS48b7m488FwBWs4MQhqz0KN+qxKerJF7qtXttKf00jhDr15rueWu4ur5QXGPDvjUxNZhr95opgC00MX2VwctFIaVB7GRsOxePnsHjsn3ifd9a1StJdC1Wegig03lz7gUYmTm2mbh6BH0Q8enD5qc8C+JcrC6vQDg08hbgz5tn7iyqLsFsUkIH2ypUI1gmjuCItgS5FUaE6Ql/qFQrwOcva0CB/njQl4U9O8ZPLxOyA4TtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53GbkSCRf8lXVdUY062i+l4digAJExzwSOskFsuXBhk=;
 b=qo6+KAYzvxK/TL+1OJFPG8+wME0XKpIGkaxe/MaWhFbPuw5TIQBfwPQIw/RbZG1mSciGNYG2h++Mgh2BFT3uzWX/LAANY823haFNi0eB3Rgcf9m2IrLDm9Z/P4BivG1QneALUmoYpiEcFJEWrlk0cr2wVcizHFf134Ymqdy0uaVwXOhAUUq/k70nZu0X/4cXASxGX8GrgtgSyGQ0frk0zJOxk4JJeg1N186V/uRLajMp1+W+RCHxCuSDu4xp5E2qFnyCpTMNHTM5mLXeDO/BZp8lC2dgk78aNt6u/Z5JBrDmvMqvwYVyuWH4yKv7K9XweO4BJuRgtmvN5MUf4cvpZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53GbkSCRf8lXVdUY062i+l4digAJExzwSOskFsuXBhk=;
 b=yusVzQ6nyNMk/Yi3rOs9zUPaWr4TLkKdsU1PgAF1OdTy+WCpJ5+HciAxV8dqb7f1jFCy38+N9HJDnDBfbrEtzKDJxd56Briu66d3Mq4zL9on3GsU1qllvHL9HHG6BNtGzcuUl5/6+UtB+tGnf7gJA2iataU3Rh/2/S27hhHKq1w=
Received: from SN4PR0501CA0011.namprd05.prod.outlook.com
 (2603:10b6:803:40::24) by DS0PR12MB6461.namprd12.prod.outlook.com
 (2603:10b6:8:c7::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.14; Wed, 13 Aug
 2025 15:19:21 +0000
Received: from SA2PEPF00003F62.namprd04.prod.outlook.com
 (2603:10b6:803:40:cafe::da) by SN4PR0501CA0011.outlook.office365.com
 (2603:10b6:803:40::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.4 via Frontend Transport; Wed,
 13 Aug 2025 15:19:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F62.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Wed, 13 Aug 2025 15:19:20 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Aug
 2025 10:19:20 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.17
Date: Wed, 13 Aug 2025 11:19:05 -0400
Message-ID: <20250813151905.2040816-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F62:EE_|DS0PR12MB6461:EE_
X-MS-Office365-Filtering-Correlation-Id: f77d67fa-230a-4c64-c3cc-08ddda7cc747
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UTM1enVYRS9PV25BWmVKT3doc25ldlFSeXd3Qk5DMGRjOXFIMHp3Vm1Cd1dS?=
 =?utf-8?B?NEYwSGF3VDl6Y055S1FTVDg3ang4MlVtRDFuTWtWSnl5U3RnREhoWXhNZWtE?=
 =?utf-8?B?MFZyZU1kamQxeTN5WE5QUklNMWl2cmFwZmhJL3FCQ0h4R2dUVHg2SHdvT0Yw?=
 =?utf-8?B?bnA4STVvMFF6eTcyc2pJRXBxMWdtVlR5OTI4bnVMdVB2emFnZ25UanBUcXNy?=
 =?utf-8?B?ZVVmQ25kREZhQ0lQS1VpYjVnY01IUGFHTWJ1ZjZTQVJybEpyS29GWEs0N2Yr?=
 =?utf-8?B?V0dEVmIxK3kzbEh0Z2Nzc3V4VjlxMlYrVkkzSFUvYkFXM010RzZrRmJsczBR?=
 =?utf-8?B?c3V0d2g1RnNEQXpNTXdqcDd5amQwKzRiTWxaZkcxVndDSDBKbktiaDlzQkph?=
 =?utf-8?B?SEhQZWF4Z2R3bE5ockY2dS9UVHE2Sk5GaEZsUDRPMm9FNFJCUnNLMlVPWHJD?=
 =?utf-8?B?RWNEandxNmxaRkI3czlBeTF6MVhUUkhsdmNvc2VpZG0raWg0ZnQvQm00enV4?=
 =?utf-8?B?OXNRMTNZclVvZURZVUVvVGVhVlhEcVQxempZRFJnbUpNWGIrYURORjV2R0ps?=
 =?utf-8?B?YWZjUWN4aUVhTStFN3ptd25GbUI3N04wM2lIbUdvelhBNFdsZkp0SC9rSjk2?=
 =?utf-8?B?QXNBb0FRR2Y2bDFSMmdFSTZqcEwvdXFqVWdWUk50VWlsZy9lM2c5OFR6N0tw?=
 =?utf-8?B?QyttWlUzR3RXUGFpcjE0NXlIZmc2RWN3VUxWak56aDJOVjFmSktGbUlQVURL?=
 =?utf-8?B?c3k2d2Nnc2s1T0g3L0RIVlpqUk9lTnp0Y3FvdVZ2RDIxMVhvVFlQTEV3SHZR?=
 =?utf-8?B?UVFPUnpSemE5TGEvY01XMHVTUWQrdFlDcnFnUzBIbXg3ckdDNERBdlhrMUMw?=
 =?utf-8?B?TWk1VEtabm96V28xclNZRmorVjlyWWxEWFhNRVJlT0dnL0R4YU9WYjlQUFkz?=
 =?utf-8?B?Uk1kQy9udnhMb21ydysySU00Z0tSbVJpQ0d1eWU5TXZaYnlSVlJSQ3BhQ254?=
 =?utf-8?B?T1dZMFRpWXVZRkNPSlYwd0hhU0ZnUU5RYUZMeTEvd1dIQm8xaUhnZ3ZkSDJZ?=
 =?utf-8?B?Vmt0MXZMVlkvL3VLWWxpNEhxemtRNnpxRUl0SWZnUnNjRC9iMXk0UjRMVmxp?=
 =?utf-8?B?OTdiWng0emVoeEJwVG12QnVnUHBjLzJDWHlQQk5KQkwvOW5NbWtwLzlrdnNF?=
 =?utf-8?B?NlhrRHIzcU9YeE1PWWw3MlpTeE9Ba0JNdTNxSEFoeFpCTlhhSlRVMWZDZmph?=
 =?utf-8?B?S0p0U0Z2aVA0VE9FMTVUUXphYTJXUXhJWVFNd1JSOXYzVHk5SlZPVHdOVzNa?=
 =?utf-8?B?cE5lOUhrd1FrcXV5UlF0OTNhaHVWZ1lBTFkxcmhaUHY3REtiV2Mxc3dESkhx?=
 =?utf-8?B?dnhtaVhRZDFnY3FHWGpCRnFhbnFBckQwSElvM1Y5TkxHOFlNMUNZNUNPVFJs?=
 =?utf-8?B?eEwrM0dFWWJCNWhDVnJKWVhodmtwNzFBeXpnYVdyTDNLRDNVUjZobFluL3pj?=
 =?utf-8?B?YmUrcGU1a2RENXdJaU1OaCtUM2o5ZXA3Q3Q1OG92ajBzZURFR0M1Rk9Id09r?=
 =?utf-8?B?eGpvdzl6QVhMc0w1RFQwdmpIc0F3Vzh4Sm1qNGdjenl5ZkYzK3JiWUpxUmFQ?=
 =?utf-8?B?RUVhWlhXbHlGenpRbG1NSU5xdnpMRjhieXJ1WGdKUUZSRm5RZEJzaHUxYWZj?=
 =?utf-8?B?SThTK1BVS0FjZEp0blYweGp0UmdGZll5Ny9rejhqNHM3dG9xMEF3VGRaL2JM?=
 =?utf-8?B?TEtVby9MdHlQMm9QS0tFTW0zakZlK1U3OUR3c3ZVbkdZNk5DVDRIemwzL2dj?=
 =?utf-8?B?WjlsQTdTdzYxcUkxdGtzbUdwYSsyc2t0dDY4eUpIZzJ4Zms0MTVWSFNYOEhG?=
 =?utf-8?B?VWs1MGVacmloMEw5U09VdlEwS1N1V014WTV1ckpKdFlWUjVNRS9SMm1odDky?=
 =?utf-8?B?WHZSQUZwRUthTFRoVEFiSnR0RldmMlpaTnNEVk5zWG5wRU5UV3F1YmlncXNG?=
 =?utf-8?B?ckNVWlV6ME9BPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 15:19:20.9995 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f77d67fa-230a-4c64-c3cc-08ddda7cc747
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6461
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

Fixes for 6.17.

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.17-2025-08-13

for you to fetch changes up to aa5fc4362fac9351557eb27c745579159a2e4520:

  drm/amdgpu: fix task hang from failed job submission during process kill (2025-08-12 16:16:36 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.17-2025-08-13:

amdgpu:
- PSP fix
- VRAM reservation fix
- CSA fix
- Process kill fix

----------------------------------------------------------------
Frank Min (1):
      drm/amdgpu: Add PSP fw version check for fw reserve GFX command

Jack Xiao (1):
      drm/amdgpu: fix incorrect vm flags to map bo

Liu01 Tong (1):
      drm/amdgpu: fix task hang from failed job submission during process kill

YiPeng Chai (1):
      drm/amdgpu: fix vram reservation issue

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c       |  3 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c      |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c      | 19 ++++++++++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c       | 15 +++++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c |  3 +--
 5 files changed, 33 insertions(+), 11 deletions(-)
