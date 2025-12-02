Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB95C9AEF8
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 10:49:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B22110E5D0;
	Tue,  2 Dec 2025 09:49:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rL3Bjg5D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012060.outbound.protection.outlook.com [40.107.209.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D508010E5C9;
 Tue,  2 Dec 2025 09:49:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Riqm10c42eA1sNNlj3lUPTFONIofZj+mTE+BXip0wHYwIOac3Vgfz/2SS74wWtln81HbG4Epp5s5PvI33yZhwWh/S3Oo6Y9PU5gW38E7K3lEaDBCxCEKYAWp0kEJ2Ndh8oR9PCaoSB6npHSYkNsp/fLpwyJ8FMqB6vK48wFXoWKYT40KyGS7/mtRI2xuc5Xg3yUIe4cQP8lHdqm2QiCbURAKDPXfUuFY+aDxrDOX2oI5p1BLvIH95GwDzWZVyOcIb/KQmVlGswi1lih8x0f9MjT6Ow+lgxDgo308eEgUxtfyPXuGYaO5klZuhkvmkQ+Q7+DkwZu4YdupRnIg/Md5cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jF3dRtfvMEVsQX7S4SoN7R/ZvkiVjaxyDa8dCNpr920=;
 b=CEQysSBX9WrkYmoKyd0EtlFUZ79qn9Calf/UF2ad0A25uqYfcT5+k+ATQZp6w3/vKvN8OB/TuwHPHiFT+jQvst7+G+VWRWcmgOVIqJQyqHZ45AOIEClzKHrBhNEqZRUQhdpvNyIGwO8k5ThTp4wYXQlz+6zYPGYhOeptd02kAaqNQstTQX+e9/OwR8RIuZRISF3EHLnwohvE/bv0s1MrOxiDg5mPleajMwbUsTXbAHXMQsHQ3B6mlCvlRIdDOtzoHJCuZYAhKeRxfVetQradZx0mK3CrA4PBBQcqHVrLcY/IrgUgYnWpJjUfym+sRZMZcO2IU9Ac6/stF0YDTGT/uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jF3dRtfvMEVsQX7S4SoN7R/ZvkiVjaxyDa8dCNpr920=;
 b=rL3Bjg5DEJQljPLJ7iI4xheOcNVTUXi8DWSuUcqStpI5QbSH+5TY1S27FuB6DboCwddMDs6Drj8TpmX2wbHqaFKqn6cIOaXw+C562zwnH3Gz1IdIjyWU/+W8tahuDF2vdvvY2FqBOtaXeKAyeolBSjq8YFcjdLONiOkU5qqa9sM=
Received: from BY3PR05CA0018.namprd05.prod.outlook.com (2603:10b6:a03:254::23)
 by CY5PR12MB6550.namprd12.prod.outlook.com (2603:10b6:930:42::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 09:48:59 +0000
Received: from MWH0EPF000A6731.namprd04.prod.outlook.com
 (2603:10b6:a03:254:cafe::36) by BY3PR05CA0018.outlook.office365.com
 (2603:10b6:a03:254::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Tue, 2
 Dec 2025 09:48:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6731.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 09:48:58 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Dec 2025 03:48:50 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: 
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>, Felix Kuehling
 <Felix.Kuehling@amd.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v4 00/13] drm/amdgpu: preparation patchs for the use all SDMA
 instances series
Date: Tue, 2 Dec 2025 10:47:10 +0100
Message-ID: <20251202094738.15614-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6731:EE_|CY5PR12MB6550:EE_
X-MS-Office365-Filtering-Correlation-Id: b28aeca4-07b5-41cc-cbae-08de318803f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NG04aG44cGdZdzhQdDVPbkxwd29hQ0E4alBMRnBzTmY1NUowcGEvUTdlR29t?=
 =?utf-8?B?TnVENzg4VDJHeUVXNDUwMk9NQng1M3pwVFVaOC9GazBCK0lJNnZmVWFsVVlW?=
 =?utf-8?B?QmpKOHhsaG8ycHowNGdSMTAyclRhb2M1V2dkRWg4UmdtbGFjMC81K2lYOXdS?=
 =?utf-8?B?c2FEd1FSY3VMS255RXI0aWdIR0REc0FhK1JCT3dMMFprZU1meG9INjdPdDJr?=
 =?utf-8?B?NU9WZXpvU3RDc2JJUDRhTFRibk5PYlI5UU5WblZHLzRkZjhFN3FDVnBGNSty?=
 =?utf-8?B?SWVPV0hYVHhvV1VFVjkwUDY5UFUwQkVYNEppM1JlQXFtUWtpUkhQaEtoV3BN?=
 =?utf-8?B?bkVvbVlJK1VweGJObjhKNTN6RjNpK3Nmc1p0ekF1T2UzaTZua2Q1ajE0M0FN?=
 =?utf-8?B?bVlmMktmMkZNbThReVpqWmNRRllTSVVKUFI3R1QyTktGWWppeUxYbDBkSit1?=
 =?utf-8?B?aW16ZUgvcllGcCthVFN6azhIeVZzTnlrYm5DVjV5ZVF0S3dJU1RDZXZnb2Ny?=
 =?utf-8?B?Y2t1cURlNFNTZnVyQ1pFTWlOZkNiZkRWall2OUxOalNqdGdtNWMvV3dtNlds?=
 =?utf-8?B?YVlHVWZrelBQa0Q5UFg4dkFqSWVnV3hhVmZiZGY5TjVKWmNKbzM5YVNRQ1J6?=
 =?utf-8?B?U1hrSHZIVUtJWCtXNEdKcEp5eWh3dmZjaU9Od0Jrd1BZSlJBZXhWUzM0ZGNL?=
 =?utf-8?B?TkEvTlExRmlkc0M4SFJoaUlqbHgvZzZMVmFuSUw0S2p6SDZ0cHhtUWtRL3Fp?=
 =?utf-8?B?a1NZMWM4QXIvY0JxT2tCZE1FdU9ra0lLMTBLOFErTXRyS3N6c25ZNTJKeUJl?=
 =?utf-8?B?cUZjdXdMc1h0cWNHSksxUkZxTVV0WnBzSGg3NFlrTEd0UG5OOFVFdXovSXZ4?=
 =?utf-8?B?WEowVnU5UWhlSE1xcTFmWVJoQU44TFhpbUJKNmg2U2R6a25rQ3ZWUVczSXJh?=
 =?utf-8?B?OEdSdHBRb0N4VldzVG9LTGxSemJtMnN2UEVpMitpeVdGd3Bwc2lKUEZrRVpN?=
 =?utf-8?B?TVpCeFNiSi9EcWlCdVFVc1lTamFuQjZwdnRLcHlZeitzZjdJeDZ0aXRYTHN3?=
 =?utf-8?B?RlNZa082YmtnZVQ4L050SkUrb2g1L0hYRnZmYTMyZmdlUytldjU5VGlRRTlT?=
 =?utf-8?B?MFFROXV6aC8xOEJjdlFwb1lFOTRibEo2RE9qcTFWSGpkOEFVSlZHRkZnaFgw?=
 =?utf-8?B?RVQrS0ZRVzlkS3NYd09JVGg0UlJhQ3EyazVmWGNxeUowNzFPaUp6T2FNaXY2?=
 =?utf-8?B?V0JOcENLNU9RNlBkMzFoSjZrVEpXWXRlYlYrQjNwc3ZLbmNKbDdFTUMzMUJF?=
 =?utf-8?B?YmtPZ2l3Mnk5TWRYcDBwY1R1NitXMkZkWU02bUc3b1dxYkR6K0J1WFlCOXBT?=
 =?utf-8?B?SkRYamhWSGFKWVl5ak9VV3BIUlJQZEZ2c0pOTDZTdHBiN0FTQ1YyWXRqUy9y?=
 =?utf-8?B?WXVQd1VnM2F6SVh0aG5ETHFJNmVraSsyRzU5US9PNEtleHJlaTllRlBMa0F5?=
 =?utf-8?B?V0tKdGw1K3MrcUt0WXowUkxieDJXVHdtY2xNdXlJL0ZFWGdFOWNLdEtQcngy?=
 =?utf-8?B?Z256a09FSFZuR2dhNkgyb0doREpKUXVVdDNIODBhMHh1SVNmSkNkTHFNbFA2?=
 =?utf-8?B?N3lNOW8rMGZRdzBwNGdqenlPMm9zOCs0cElZL1ZacndVb2podVYxQkw1TzIy?=
 =?utf-8?B?TFhidm5lcEs2Y1JjUTZDb2NmeTd5NHZyWkkzdG1mSEZWSzNIeDZHRXp2QXk0?=
 =?utf-8?B?elorTFA2eFFvVGV3SmZiR3FEK0RNOW13Ylc3L214Mkw4M2pLUlNqRXZ4QjJi?=
 =?utf-8?B?Y0tTNnk5c2sxWFRPWGdlWVlsYmJiam1hVVRsNHdlb3R0SlNLY2pnZ2JubWJL?=
 =?utf-8?B?dEFNVTJBMWNFZGFnVnZZQ3pBWmdyT2NHUlM4OUUxMmJPU0hCaEFYUWtINDAw?=
 =?utf-8?B?ZmhpRVpLYUlJTUZacWlINGZobWwvNjZZaXlJZzljNFo0TG9sSi9wN2VrbDdv?=
 =?utf-8?B?eXRPK1h6dTRKWHJvUWU4N0gxb0xMUTJvWCtPNkJoQlg4N003WDdpcldwN21q?=
 =?utf-8?B?WHdTQWcya1R1VzlqNWJjVytyYkRuRmFjVmxNcjN0R1FVVmpPRWRuZ3Q4TUs4?=
 =?utf-8?Q?Zp5c=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 09:48:58.3429 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b28aeca4-07b5-41cc-cbae-08de318803f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6731.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6550
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

This series is a subset of the "use all SDMA instances" series.
It starts at the first modified patch and ends at the last patch
before the drm/ttm patch that got merged through drm-misc-next.

v3 of the full series:
  https://lists.freedesktop.org/archives/dri-devel/2025-November/537830.html

Pierre-Eric Pelloux-Prayer (13):
  drm/amdgpu: introduce amdgpu_ttm_buffer_entity
  drm/amdgpu: add amdgpu_ttm_job_submit helper
  drm/amdgpu: fix error handling in amdgpu_copy_buffer
  drm/amdgpu: pass the entity to use to amdgpu_ttm_map_buffer
  drm/amdgpu: pass the entity to use to ttm public functions
  drm/amdgpu: statically assign gart windows to ttm entities
  drm/amdgpu: remove AMDGPU_GTT_NUM_TRANSFER_WINDOWS
  drm/amdgpu: add missing lock in amdgpu_benchmark_do_move
  drm/amdgpu: check entity lock is held in amdgpu_ttm_job_submit
  drm/amdgpu: double AMDGPU_GTT_MAX_TRANSFER_SIZE
  drm/amdgpu: use larger gart window when possible
  drm/amdgpu: introduce amdgpu_sdma_set_vm_pte_scheds
  drm/amdgpu: move sched status check inside
    amdgpu_ttm_set_buffer_funcs_status

 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c       |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c   |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 295 ++++++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  54 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c       |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h       |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  17 +
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c         |  31 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c        |  31 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c        |  31 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c        |  35 +--
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c      |  35 +--
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c        |  31 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c        |  31 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c        |  29 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c        |  29 +-
 drivers/gpu/drm/amd/amdgpu/si_dma.c           |  31 +-
 drivers/gpu/drm/amd/amdgpu/vce_v1_0.c         |  12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |  25 +-
 23 files changed, 381 insertions(+), 385 deletions(-)

-- 
2.43.0

