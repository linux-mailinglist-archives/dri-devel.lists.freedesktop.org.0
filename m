Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D094493E371
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2024 04:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE42C10E0BF;
	Sun, 28 Jul 2024 02:54:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="P4Wtv1z/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2081.outbound.protection.outlook.com [40.107.102.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F5210E063;
 Sun, 28 Jul 2024 02:54:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SPvFssvGk0pK9g/QErFBSuv2inO3UDui407HSGv2v1n5xdV1sbbyDehsqRnMTb3RKTh/64MzV/2PVyhu8pZhEJnmNxKdiIES8cFO8R0hfSKLD1Q1F3L1w81voB5+q588rE8pEv2HP/UxB8CC1eKd/6LPjiZIfh/CwSCOPpREhHiMasu9JQHNqQZPB4cUxsk9H2n1mRu5eOsCKvKNWAyGIZFYJj56fdPabaR4h8zfHKvJ5FECFB9Y9A4jGDaCANRfcHQIGgUpm+aZg9XQxmuZ9S3Iazzn93ONbM9DGJB9Nyq6E678zhnx5yB/4ju3oqNOIZjrZqaYqHRF0KIpm6KucQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqKnLDgwk8lj2Nq7KyqUBMDvxCiJGSLHg2SRqYJLH7Q=;
 b=nXbrjsBVEXtDQIf1Gky17u0pchH8mv3iIeT3tYEKQDJJ0oqY4+Kz1yygR+nJpUY1KdwqIMblkVWsbQ5Z9WjUPV+BiawEITzKaM5YAT4ir7VgpjtzwM0IVuq1zeEZbxQ6bH+t1fr5+1wJzRhtMscGUMKxEtbVW+Dt6XuQ0mu9qIGCesCNoF81Tftu3lQyKJcXSKsqC+p9Qe8mi3Y9kVbxoC6F2L6cCywiUd5/QQILnjtRwRJjUnOjUOQ03m8drHSYGyTQ8y6irRBgrLHG6kdTsfcm40l1pe64kDsrT4WXqs6/iLbz6493G6n1nLtYIKhlFHb4SbeUg5XeRX6cjPTT7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TqKnLDgwk8lj2Nq7KyqUBMDvxCiJGSLHg2SRqYJLH7Q=;
 b=P4Wtv1z/eu45ki+41B1L3ZrOIGewjGPK1k7I9KAgLOWBO4ES9DQFUOV9ssh6Yv7H8Qzhp5P/bDp3JeVgXZ5lfPLYJw5atMNUWSRBmKJJgUp0L9Wu59Ud3rM2gzIAXL62/o1LCI769b6++c9qLRrcq/1fZYF0avnDV/b3RZTD5tU=
Received: from BL0PR03CA0023.namprd03.prod.outlook.com (2603:10b6:208:2d::36)
 by SA1PR12MB7317.namprd12.prod.outlook.com (2603:10b6:806:2ba::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Sun, 28 Jul
 2024 02:54:24 +0000
Received: from BL02EPF00021F6A.namprd02.prod.outlook.com
 (2603:10b6:208:2d:cafe::63) by BL0PR03CA0023.outlook.office365.com
 (2603:10b6:208:2d::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28 via Frontend
 Transport; Sun, 28 Jul 2024 02:54:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F6A.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Sun, 28 Jul 2024 02:54:23 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 27 Jul
 2024 21:54:22 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.11
Date: Sat, 27 Jul 2024 22:54:06 -0400
Message-ID: <20240728025407.2115881-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6A:EE_|SA1PR12MB7317:EE_
X-MS-Office365-Filtering-Correlation-Id: e355309e-b43b-40bf-40d0-08dcaeb09623
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzQrUmxoY2V6bmZPcTR2Z2VzY1pncWsrOUVnais3U1ZPb1drREYyY3hvQmxx?=
 =?utf-8?B?VnJtV215dWZsOStOU0h1cmhPZHZ0UEl4NzhjVDBoeGQzWXVRQjRoM01hZ3BU?=
 =?utf-8?B?ck91ZUZjaXNTVGF1ZWlCK0dQREwxYk1Dejc2Z0VBU3VBdXN0SDlXb1dqZDU3?=
 =?utf-8?B?M2ZLZHhwU0N0TjgwWjN4SGlENHR2ZEsybGRBcS8zSFc0SzlrdkkvSGNsQXV1?=
 =?utf-8?B?MHoxQVpMMlRaT1BxVVdNanpRZnc0blNYeGp0Y2tRdnllQXQ4b2RVRGRMNUpE?=
 =?utf-8?B?QmdMaHNsVldYN0tLeVU1cUt4TEVHQi95TmpjKzd6TnNZdU9LeVpiMWN0WUNt?=
 =?utf-8?B?UHg3OHZCQ3l4N3k3dVF3L1VwdGFKVWo0cnN6Q0oycS9hK3Ztd0FnT0hQWDdy?=
 =?utf-8?B?bXBheU1ENjRjT3JXMTAvd2tQYnBDR05XaHdxc2lGWEVKUnF6NVNXbWJKVk8v?=
 =?utf-8?B?MVN3RTRWbUsxcWZPUUZnQVFtNXZ2dFpkOStWSUZ6eUFyT09KUFNScWxGbGlY?=
 =?utf-8?B?dTdoU0N5VXh5UXdxbGllRStWV0hDWHlGbzBnd2FpOTNGQzE3Z1RHbGJJNjlK?=
 =?utf-8?B?dnIxbk1idFJ2NXVIN1NML0dCYXF0Tkswa3B5L0ZrVHlkZkl1eC90QTdMWFVF?=
 =?utf-8?B?ZlIxZHk1dzZ3NmdMZHllV2Y5MVVwNysxUFlGUDhGaEJIMFZhYjY5andCUGJU?=
 =?utf-8?B?eFNWNllMWFJzTWthSlJGUXNnT2x0WWV6ZHpXdWdkOUdoTnh0VmkxMGN3cWtB?=
 =?utf-8?B?M1BheC9pTms2dDVJakxJYmtuSG5XaWtmVnNxVXYyemhoQVNadlpZUWVWQWdt?=
 =?utf-8?B?dnFpR2paZDExazZOZkM2VmEwZUx1bmdPWW44MTh1YmJ2czB3RVAzUVBVaVN1?=
 =?utf-8?B?R2dncDBqL0V4bVNCK1Nsd25hVm94VXpvZkZIS0EzR3E1ZmRydGkwVWlkOGF6?=
 =?utf-8?B?a2dVQ2ZtVDRaS2NTbERxeXNrQlVBc0VZV3RHengzcVNYd0F0YW8ydkFjS3lL?=
 =?utf-8?B?bDBTMEYrVlp2bURSWXlINGlHNVZwUjkreGl2Y3NSTmROeStRRDdUV0RBVVZK?=
 =?utf-8?B?bDI2SjZkNFpvcStPeVVaTUpmSVJrczI5ZHRnREtacDRmNk1FcDZvRm1zL0hH?=
 =?utf-8?B?N1RwTWdkSUcwSld0MXFLVE5TeVprWGt0N1pvMy9zTWtGaXA4YU9KQWJCdWpQ?=
 =?utf-8?B?QkVXM0dZS3p6bE95QmZkL05Fa3laNkhSdTNZTUJ6eUZBWi85Mm02Sm1UL252?=
 =?utf-8?B?QWxBN3VKVmNFOWpUTEh2WXQrZUI2eXBRSzkwYUdLWllKcVAxSEpWaUJzNVBs?=
 =?utf-8?B?UW5qYlV4aHd2MHBtWjRkZlRkN2hZUWJKQi9rYjM1dXZydlBXUFpyVk9hU2Rj?=
 =?utf-8?B?MkN0bnVtUnZSTXJuOS9LYWJtNHYzZHZNUko1ZVUzSHpqZ0JhMHc4bTM5Z1pP?=
 =?utf-8?B?c3R1WmczempscC9WdC8vSkNYWThkdVJ3bCtSdmZ4MU8vM2VleHl3RTE0S1RJ?=
 =?utf-8?B?NUVlR3FuU0Y5WGErS0dDZEdnckJ5c3drbTJGeWJCM2tGMFluYUN5NWJXVkgx?=
 =?utf-8?B?OWQwUDJMNjJXcWVVajhzM1UrUGozMXhqUjFmUjArcS9NMWVMalFPTldPSnpW?=
 =?utf-8?B?aXEyOWpwR1VRVDMrSkR1R2V1eE56bU1iUjJKTUxuMEtyQ252NjdVK1F2cGs1?=
 =?utf-8?B?TDl2ZkN2WnI2K0tnaTlkOHdINjhEUnZ1RGY0c1lqY3Zabzg2YUsrWCtQam9i?=
 =?utf-8?B?QXFpKzhMenB3WTlmMlkwdkxjalJMQ3o2ZVFNbmdSYnBOMjI5NmlYSWc2T08w?=
 =?utf-8?B?Z1g1aHlmaHE0NDYvd3BqTmordzhidGk4VzZ3WjlqYWs1Tm1YTksyTE15dEo1?=
 =?utf-8?B?U2E1bGRvaEJCeW4wbzBOcUk4K2d4bHRWRkROZkgwbFE0MHc9PQ==?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2024 02:54:23.5356 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e355309e-b43b-40bf-40d0-08dcaeb09623
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7317
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

Fixes for 6.11.  A bit early this week because I'll be away from my desk next
week.

The following changes since commit d4ef5d2b7ee0cbb5f2d864716140366a618400d6:

  Merge tag 'amd-drm-fixes-6.11-2024-07-25' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2024-07-26 09:52:15 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.11-2024-07-27

for you to fetch changes up to d2860084ecca456ce78b251011f7def8d9136dcc:

  drm/amdgpu: Fix APU handling in amdgpu_pm_load_smu_firmware() (2024-07-27 18:10:34 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.11-2024-07-27:

amdgpu:
- SMU 14.x update
- Fix contiguous VRAM handling for IB parsing
- GFX 12 fix
- Regression fix for old APUs

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: Fix APU handling in amdgpu_pm_load_smu_firmware()

Christian König (1):
      drm/amdgpu: fix contiguous handling for IB parsing v2

Kenneth Feng (1):
      drm/amdgpu/pm: support gpu_metrics sysfs interface for smu v14.0.2/3

Michael Chen (1):
      drm/amdgpu: increase mes log buffer size for gfx12

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             | 16 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |  6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |  6 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  2 +
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |  8 +-
 drivers/gpu/drm/amd/include/mes_v11_api_def.h      |  3 +
 drivers/gpu/drm/amd/include/mes_v12_api_def.h      |  3 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |  3 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   | 86 +++++++++++++++++++++-
 9 files changed, 114 insertions(+), 19 deletions(-)
