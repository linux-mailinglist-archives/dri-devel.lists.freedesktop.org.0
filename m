Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8399ED91B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 22:55:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A19910EC37;
	Wed, 11 Dec 2024 21:55:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WDYTSBLp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::616])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDAD810EC2C;
 Wed, 11 Dec 2024 21:55:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q8WGf3O1wK9lh8g8dkzHqZNM0AaFAQQR2meumRW+NawmL4eStNa65H996rsX0LloEcM49dL9V8KRY7wzQ0wrTDc4UNHVWGNtiF+mEADT3jtohFJbL1v0SgrkNY2BLXlpeAuCSCBogedw22XSM7RKIqf4p5tVaUcf8mZ/a45FDWgQH0mrl3R0tW4pCH6dBDopZ2Q422dtUdzFfM2fwy0Y0ml2I7+E7/gV+lMSa5lzZyWFWfaxHwmdGeR4sXLXh18v/7flOgfKVivNri8zNbmKXruiQ5PkeH2LuzUO53Kxgf6MmiqsjnBef9UUOcqF7+YY4QtPobGzFdkHSYLPfS3B/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cjWQ+RMTuvvrUXyyr7oKtMOMnWgnzZ5kUJOzzGAopaA=;
 b=I6HQyv3HEh4IMiMNhjl8i+t41evM+yrag4kspF3pRFDU10lSIZfZOIyl/mZcto01O79tvFoSAuJFlzt/C3qj4Sg0sxrsdxioh8mI3yn2S1vFLdoTtcbxqf/oyrGZ5GzRLlga/qPlt/Vsxen1xh7iHskXuor3IMACEHQfFbAi31dqXpVFhqMu5gYg8qIaUYAGUZzuUj3lnMZE++nqRu3Gjk/MrMqczD2aUckK97dJckGE0QFE656sASg0LdLtBypwwal6tHUq96tqbQhIZkK4WPpNdcuZtAek4odumHpzG4cLE+yYHBaywb1obkACeK/sG4RNb6TlN28jdZ1nDUt43g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cjWQ+RMTuvvrUXyyr7oKtMOMnWgnzZ5kUJOzzGAopaA=;
 b=WDYTSBLp1CoiHYigqQ45LX3cKlxdgwF1uxZIcEbzGvPNzz+p6+AFhhGT8sQuJ38M1q4ldNycILSPNoVTOuacBv+tIi/+Yu/gdZq4bSAjJKTaCABbMvteW7zefYp8OgxBsQ+aOHywVLcVmli2cyJyChfaWlwz0SVibP7LVuGkpLw=
Received: from DM6PR03CA0059.namprd03.prod.outlook.com (2603:10b6:5:100::36)
 by MN2PR12MB4175.namprd12.prod.outlook.com (2603:10b6:208:1d3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 21:55:05 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:5:100:cafe::df) by DM6PR03CA0059.outlook.office365.com
 (2603:10b6:5:100::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.14 via Frontend Transport; Wed,
 11 Dec 2024 21:55:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Wed, 11 Dec 2024 21:55:05 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Dec
 2024 15:55:01 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.13
Date: Wed, 11 Dec 2024 16:54:48 -0500
Message-ID: <20241211215449.741848-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|MN2PR12MB4175:EE_
X-MS-Office365-Filtering-Correlation-Id: 4968b84a-3c1b-4d48-71cd-08dd1a2e78d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RHZqZStwSSs0K3FFejg2eDJ6NDJTQ3YxeWw4bjM3Skd5VDdyVE9xZmZWRC9r?=
 =?utf-8?B?ckcvZzIwSWhZbUJaSWtVWmNVRmhnb2dBOVRpNm9aZHRpbHBDMTVuM0JiQTVp?=
 =?utf-8?B?UnRIcFdUNzFwNENjaW1RUnM5eUc5VW0vc2hGeVlTNTVIMHY4ZGZXODRjeElQ?=
 =?utf-8?B?bTV0enFINldPVSt1bTA3d1ZSU081ZmhnOU54ZjRxUDFuQ25LSWN1WjlOaTBx?=
 =?utf-8?B?Yzk1em9lWGpNajkvaDRXbElOWm9UTWlLeFJOTE14ZFYyRTNSRXIwWGpJeTho?=
 =?utf-8?B?cGNsTTA3Yyt6ZEE0RWphcUdFb0ZwdUI2VVV6SkFaSlVSeUtERW0wVXF5bG90?=
 =?utf-8?B?M2F0ZXQ5dEpkYkgvS2lMQmdyRTFPN2ZmaVpLa09UNTg2NmwxNGo1ekRINWNZ?=
 =?utf-8?B?SW5hOVFKSU5GZXpodHQyNEY4eVhsTm5xc284ZVNUWXMrWXhrUXROZ2JoYTF6?=
 =?utf-8?B?UTlhRjhCdlhLaEh1Mlp4bVg2Rng5UHd5TGZUdFNESjRsdGRjRm9qNkM5SXNU?=
 =?utf-8?B?TDkvNVE0Nk80Qm91RGZId3FEMDNxZFliSVd4TjdZRE9EUW1hbWNQdG0wbDYw?=
 =?utf-8?B?S3lBZm1Cd0VqK25oM01CRE04VGpLMXdPdFoyeVJiUDg4K1JrdVdoVDhZNm5p?=
 =?utf-8?B?dFFXdUsvaDcrMXlIMVZOcVF3VXNFUlJ2bTg3ZEdqSUZSRm9SOG4wS1dSWndm?=
 =?utf-8?B?L3pZYUM5aDVQZHRpZjAxM29xeGxES1JVOTRqSkIxUzFVY0NCVlB0QU1PWXc0?=
 =?utf-8?B?UDNmUHBPYmEzMHdoS0JJbjZtRUovTlZGRm1ybDBScnZDVDYyS1JJV3RHcGRZ?=
 =?utf-8?B?Q3oyVjl5SFBNTHZ1UmpRMkZpU0l2VU5ucWlIci85enhXSldxaXlySEs2L0sy?=
 =?utf-8?B?cE9SOEJ3ekpEVjRmSmhEN0dLaDZJbnpRdkZWSHk2bk1xWjNvcHJGVHhHcUFI?=
 =?utf-8?B?OEV0bEt0ejdaemZkd09ORy9QZ0JMek5NTTFLY0NvZUhlN3ZsdVdabElBM1U2?=
 =?utf-8?B?L0piNFBvWFdTcm8wbmorV2pIdzNkU045L1FHdzExNE9halZzTVhDYjYyWXhR?=
 =?utf-8?B?VUIwa3h0dEt3MkFEQ2lJakMyRTBHSlcyajNyc0VzY2dITytRSHFOZ1J4K2Jl?=
 =?utf-8?B?UEc0U1FEZGtpcW5IWUdvNDdlVG9VZzZvdHFKb01FOURWYUQwd0QwaVBkcDJP?=
 =?utf-8?B?bU1WSzMyZ1BaL3E3WEoyOGxjMmJaaWlvSWpkaGFNZ2V2cklIKzJSc3hmMFc0?=
 =?utf-8?B?WkhlUVVGUGl5VktaSnJUZ2ROcCtVbmV3a2JQMGFiMDQ2NFEzandxclExN0Yw?=
 =?utf-8?B?YUppUEppL0tRYWdQcy90bUgxdUpESUVjU2JhdGh0eU9UVEtzMURVMVRUeTBx?=
 =?utf-8?B?Q1ZabEdrb3FRMXhLYUZUVjdHdVh4TU90NVIwRWNJK0R0SkIwQ1FWNmFyclNv?=
 =?utf-8?B?WGdtQVRVcnJwZEhGYTZoblBtNElhb3FvOVhPZ1FvRHQ4M29EanozN2FJRmlB?=
 =?utf-8?B?NFlBNWZaakFaSS9reFpxU1lsaG5Jd1A2enBzc1hBeDBWeFFMMVltaG1kc1F0?=
 =?utf-8?B?SWZkV2x0dk5UWkZmdjAvM1RWSUJ2NzRyWExUYXlLaFpObytKSU53bXZtZmhF?=
 =?utf-8?B?ZzlMYlZhOHBDcTNFMzVVZzJtVGNGTnFpY0IxT210emZxNW1tKzAzRGhKOGJx?=
 =?utf-8?B?VjdHOUNocDZpY1pyMWZzZ1RUcjgwekJkQlpuZnk3WHRITFZ5eWw0Rm9tSHZT?=
 =?utf-8?B?RkgwWXFkMnNlbzdsOGxwQ285aHhxa2VBK0dNYzQzVENWeVdEYjMxaDJZR3FG?=
 =?utf-8?B?Y0hqL1dvRVZKcUVYZk9Sd0I2K092dXJXOGtLeGlRdmQrRWw0Z2V6amRoTDVr?=
 =?utf-8?B?aXpYU08wSjUvTE9BbHlGaEt1T1VSTVhnVWlrQXZNOGE4d2c9PQ==?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 21:55:05.2766 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4968b84a-3c1b-4d48-71cd-08dd1a2e78d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4175
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

Fixes for 6.13.

The following changes since commit 73dae652dcac776296890da215ee7dec357a1032:

  drm/amdgpu: rework resume handling for display (v2) (2024-12-03 18:19:23 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.13-2024-12-11

for you to fetch changes up to 438b39ac74e2a9dc0a5c9d653b7d8066877e86b1:

  drm/amdkfd: pause autosuspend when creating pdd (2024-12-10 10:26:18 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.13-2024-12-11:

amdgpu:
- ISP hw init fix
- SR-IOV fixes
- Fix contiguous VRAM mapping for UVD on older GPUs
- Fix some regressions due to drm scheduler changes
- Workload profile fixes
- Cleaner shader fix

amdkfd:
- Fix DMA map direction for migration
- Fix a potential null pointer dereference
- Cacheline size fixes
- Runtime PM fix

----------------------------------------------------------------
Andrew Martin (1):
      drm/amdkfd: Dereference null return value

Christian König (2):
      drm/amdgpu: fix UVD contiguous CS mapping problem
      drm/amdgpu: fix when the cleaner shader is emitted

David (Ming Qiang) Wu (1):
      amdgpu/uvd: get ring reference from rq scheduler

Harish Kasiviswanathan (2):
      drm/amdkfd: hard-code cacheline size for gfx11
      drm/amdkfd: hard-code MALL cacheline size for gfx11, gfx12

Jesse.zhang@amd.com (1):
      drm/amdkfd: pause autosuspend when creating pdd

Kenneth Feng (1):
      drm/amd/pm: Set SMU v13.0.7 default workload type

Lijo Lazar (1):
      drm/amd/pm: Initialize power profile mode

Pratap Nirujogi (2):
      Revert "drm/amdgpu: Fix ISP hw init issue"
      drm/amdgpu: Fix ISP HW init issue

Prike Liang (1):
      drm/amdkfd: Correct the migration DMA map direction

Victor Zhao (1):
      drm/amdgpu: use sjt mec fw on gfx943 for sriov

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             | 17 +++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             | 13 ++++++------
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            | 10 +++++++--
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              | 24 +++++++++++++++++++---
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  | 15 ++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |  4 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           | 23 ++-------------------
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c | 12 +++++++----
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |  1 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          | 24 +++++++++++++++-------
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  1 +
 14 files changed, 97 insertions(+), 53 deletions(-)
