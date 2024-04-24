Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0DD8B1483
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 22:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 577B310EBAD;
	Wed, 24 Apr 2024 20:24:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vghoGisI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2072.outbound.protection.outlook.com [40.107.236.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBED610E967;
 Wed, 24 Apr 2024 20:24:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ph2OLfnoDYJwAHYJF/12fYlAqdrFSy8YMxyf5RQmd8mzl1ZlmUxiQPg5jiOYOYr2i6ge0jo+iPPUMSdVcZnjOAhJ4RV9KiwXfSiA3CFKx5jCQ+j6gz+wfBxbxryw6sidqVumZV8cB0NAd1U78Z+jexfe2sNhz6NaRx6th8XyPoo8+78ItEjTOOCerLkgmFNnFCt+syv1PYezKr78hiAAElV/NYnaMG2AKN/eCUzs/bqz7mFDV9e1C1sICGL3EWdLKCDwuY4oTalfVzuHM8jSP1iyYrZeemUkmpmQdD3bXCUX4WTHtOGboJ06/HCNXanLE21TpR3t0c+UT/so1AtF+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DfVehpG/D6yWE+S5eQrGA2QkYMisLD09G3Q3umc5Eic=;
 b=bliA/EP3hCdfL3vebjpaO74zFuBKtxKQmBeglFyMzWoF60mVH530Ne9Zu+F5aH/SN7Me8aDP+8E2+5SZC9tNm1hqmsqp5t/VlYOxRvJ6upE+wsY/y/KG14zJ9Psc4BAXepDGWpVkZndjlxrUt8Xk2e9s6td7tbXn7tflAGCRSWYG+QLXe6y4O0wGJjt1RCJqvLDYonj/lsLuA8rqStsfnd+P3IwWrGCWsC7rYXWBt8U1SAHYsS+FI0fNH+YdNjg0Y/5ryW/EIT/H3Z/1T2KTPPiCbF/K48a6ktPH0JMc80qju/LnD2p365RkvHGbM9gxdvyeVCy5fPqO2Xw8OhQrPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DfVehpG/D6yWE+S5eQrGA2QkYMisLD09G3Q3umc5Eic=;
 b=vghoGisIN6Mwm943KFFEFF3am7LQMsZHO7dJFlBdSBgOqyAW+8EDp6TRveiHebjK3kw7Ib3h6OXCpYL0IT6ciV7zC/HcslH4TjK7EYPkO4ASs3VMuXp4Hf/UEibywBoo58gtvTBzhMqnjkZaQ9EbB6bYcs6nROreRNLABL4QFH0=
Received: from SA9PR13CA0007.namprd13.prod.outlook.com (2603:10b6:806:21::12)
 by CH3PR12MB8510.namprd12.prod.outlook.com (2603:10b6:610:15b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Wed, 24 Apr
 2024 20:24:24 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:806:21:cafe::fb) by SA9PR13CA0007.outlook.office365.com
 (2603:10b6:806:21::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.9 via Frontend
 Transport; Wed, 24 Apr 2024 20:24:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Wed, 24 Apr 2024 20:24:24 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 24 Apr
 2024 15:24:23 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.9
Date: Wed, 24 Apr 2024 16:24:08 -0400
Message-ID: <20240424202408.1973661-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|CH3PR12MB8510:EE_
X-MS-Office365-Filtering-Correlation-Id: 02cec62b-6287-42d9-2287-08dc649c884e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|82310400014|1800799015|36860700004; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0FvQ1hNbm4wdkhzUVB1bm54Sk5RenArSTJBakd2czZYR05WNlNkMkNyemxB?=
 =?utf-8?B?Uk5vb01WWjBSYnVJaW1GNFZVbVhmL1o0QjI2ekRXMUQxM1c0OE42VXh0dUVh?=
 =?utf-8?B?K3FXV1k0NzBOMlg2a3lySmR2QU5jRC9ESGVjUFp2MTJaZENmbmg2KzFHTFVS?=
 =?utf-8?B?MTdVTnlDTW1xdGNNdDRaVkJnMXpBZjBjMTB0SFRiWndVTFdFam43S1RvOHJP?=
 =?utf-8?B?WFg5UWRKd1VwSXYxclpBc3VOcUhDVyswdU96aTg2Z0JDUThhd2V4RzI5eDFa?=
 =?utf-8?B?Sm9PR3p0YkorZUNyVVZNbkNpalFCM1FZdGpFR0FMZmlWODdBbnV3ZDdmR0FO?=
 =?utf-8?B?SElGMjBKL3dGSStvNytpRklGemVMOWhXNnJwU2t5RlIxNnltNU9WZjIrRnpq?=
 =?utf-8?B?dHFocS8zNGVmWCs4akhHR2g3MEhQN2FxN0JRcGVsSmpJUklHc2pkWnk3RFVo?=
 =?utf-8?B?ZmIxaUZUUTN3SXhJVmFxM3V5Q1lSbkZaTlR1cW1SemR6RzdDZmN0UXlXN2lE?=
 =?utf-8?B?WUhxdzJVaGZVeGNDNldkSkNZOHJKYkRkQnJ4djdNRUVGdGNWUWRhS3UrUTg5?=
 =?utf-8?B?ZkFNK1ljZ3NwcXZGbUEzV1pObGo4SGlFajVHRDNKSnI5TkFxRkdYRUtxM1RJ?=
 =?utf-8?B?Rkt3dnZVS0YyaytiUUhSV1k2VEJSTU1ZRGRiUlJxZzFveHZ6U2tOaU9tM2Vo?=
 =?utf-8?B?WUdjNVkveDc4ak5LQjJZSER3NGc2R0src2xtaVh3T3FjcXZIeGJSMWp5NmdG?=
 =?utf-8?B?clFwMVBpTW51c2R0MXZJV2RPYTUrMXBmZ0ZmSFdJdHdEd1FVTG5zYTNEbExO?=
 =?utf-8?B?ZXpRVCs1VFlxTGRkVkZ3RytaTndqZytwdzZudHE3S3I1MkpDN3ZRdElmS0ZV?=
 =?utf-8?B?YkZ4dFF2cjJxeTBaWUJMN2MwdllzSFdoMTMrSzlUdmxSSllIWHBrZ1FQbENW?=
 =?utf-8?B?QU41clpDR3Y2V09FNzNwZVRNbDM5VVBiTTAyUklxSEtYMUFEOElxQTZCcUN1?=
 =?utf-8?B?YVpHTDlOc3NZQ29iWEEzRDUrSEFLQmJhWWhYV0N5K3FYcjRVU0Y3NTlwS0RJ?=
 =?utf-8?B?a2tJRVdVK1NBOFVESmNxUlFKSmN4QUI4VmVTcGpsamdNN2dmWXdsa2NCU3VO?=
 =?utf-8?B?VHNuN3ZoNVN3dkRmbnpFMytOU0hGdFNqTkFtTHJvY3JweGFFNlg2VDNLMFJY?=
 =?utf-8?B?S2tqL3FGZGN5MDRXUW4rcUhBMGNRNGVMK2ZpUTRMT0ZWckFVOGdRekZTOUdv?=
 =?utf-8?B?NDg1Qk5DRUVGbFRyZ1BjSGE1M2xHODMwMUdiRFNTZVRpWi8wbFVoc1VJNlU2?=
 =?utf-8?B?MXpmc0w4aUhYRVNqYVcwcnNRVGRCOGFvd1daN0VHQmlnelJ2c0wyV0FBSEdx?=
 =?utf-8?B?VjFvYlNGSHFCcHpTM0xhbVJkWVZ1eWhyNnB6NjhCamo4Qkd3SUNidTBuT3R5?=
 =?utf-8?B?bllTQ1lnWWpPZ1N2NEo4bFR5K0QxUkRsaGtNcVdKdlllKytoMnlESzAyMllB?=
 =?utf-8?B?NFZyUTBzNS9PNXVKSWhBZFk0Y2Z3MCtIMVZqN2l5RUJqSDhhM1ZNT0RyaVg0?=
 =?utf-8?B?ZDdrNmNGcTU1QWlrYWlGazhuTDNBdTdmTkU2QkxvUk11UDNMWnVVVVl2cEtO?=
 =?utf-8?B?YlM1ODFEM0h6S05BMlVGd1JwU0lORVV6ejRGSkY0TThWR09qZ0M1cDB0QnBM?=
 =?utf-8?B?T3JCdFpjYXA0bVVOYTg4ZGh3azdHU3pTS3JscVl6ZjRmaHpHcDFJRFdzWk92?=
 =?utf-8?Q?FmKOOb5mMPN4/HItw6s6+wjvYa2AN2XL1rws08l?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(82310400014)(1800799015)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 20:24:24.3171 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02cec62b-6287-42d9-2287-08dc649c884e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8510
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

The following changes since commit ed30a4a51bb196781c8058073ea720133a65596f:

  Linux 6.9-rc5 (2024-04-21 12:35:54 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.9-2024-04-24

for you to fetch changes up to 948255282074d9367e01908b3f5dcf8c10fc9c3d:

  drm/amdgpu/mes: fix use-after-free issue (2024-04-23 23:23:46 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.9-2024-04-24:

amdgpu:
- Suspend/resume fix
- Don't expose gpu_od directory if it's empty
- SDMA 4.4.2 fix
- VPE fix
- BO eviction fix
- UMSCH fix
- SMU 13.0.6 reset fixes
- GPUVM flush accounting fix
- SDMA 5.2 fix
- Fix possible UAF in mes code

amdkfd:
- Eviction fence handling fix
- Fix memory leak when GPU memory allocation fails
- Fix dma-buf validation
- Fix rescheduling of restore worker
- SVM fix

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/sdma5.2: use legacy HDP flush for SDMA2/3

Felix Kuehling (3):
      drm/amdkfd: Fix eviction fence handling
      drm/amdgpu: Update BO eviction priorities
      drm/amdkfd: Fix rescheduling of restore worker

Jack Xiao (1):
      drm/amdgpu/mes: fix use-after-free issue

Joshua Ashton (1):
      drm/amd/display: Set color_mgmt_changed to true on unsuspend

Lang Yu (2):
      drm/amdkfd: make sure VM is ready for updating operations
      drm/amdgpu/umsch: don't execute umsch test when GPU is in reset/suspend

Lijo Lazar (2):
      drm/amdgpu: Assign correct bits for SDMA HDP flush
      drm/amd/pm: Restore config space after reset

Ma Jun (1):
      drm/amdgpu/pm: Remove gpu_od if it's an empty directory

Mukul Joshi (2):
      drm/amdgpu: Fix leak when GPU memory allocation fails
      drm/amdkfd: Add VRAM accounting for SVM migration

Peyton Lee (1):
      drm/amdgpu/vpe: fix vpe dpm setup failed

Prike Liang (1):
      drm/amdgpu: Fix the ring buffer size for queue VM flush

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   | 35 +++++++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c       |  3 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  2 --
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |  3 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             | 26 +++++++++-------
 drivers/gpu/drm/amd/amdgpu/vpe_v6_1.c              | 14 ++++-----
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           | 16 +++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           | 15 +++++-----
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  1 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  7 +++++
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   | 25 ++++++++++++++++
 17 files changed, 111 insertions(+), 49 deletions(-)
