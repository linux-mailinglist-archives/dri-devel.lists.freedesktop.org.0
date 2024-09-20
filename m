Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC2297D366
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 11:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07BB010E7DE;
	Fri, 20 Sep 2024 09:09:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="izCI2CRp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968A210E2E3;
 Fri, 20 Sep 2024 09:09:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jG//0Fctdj9jINkJ/yHDF/P+aQMwRLyo2pr4kqUmlBzPeyvok3NswJszq3BNqrReGge+zPnFRC/q6JYk2+dGMLA9aAnVePs7+0cjol9dSMckxPjUG5PwJHBDm5pdexPcqzTJIhgTSp6OdUpzLCoTgiz+1rBV62ASrj9b5mzgj4ICFZYVC2N0JGsaOtRgfPC2W4vSw7udkKp5EkqMXywBoG86XgeRYyHZhhFFfKqVL4Rr6iUnkwyS9Ak96zSNBsMgDuwlxI+tgY6UsngKN5N38PFy+5S6LJmgBNdO9M7OvELVPo0/tINFhb8PJRRISPmL8vZootz2qntPhdO8MpEdHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezoH+MTd0WcFgsGusw1CRIXDb3cWHXWRK+stFd5C3wg=;
 b=lBZjiddQxMjH/bFHZyi1SDfQdnKkpKPPB8VoSbkMg4jYwUsGbSZpn7RgphOvAUt3Gz8pNEeUSCJyjfnTDzDxIpEbcn+AMDSrcndVSlXLPgbLsTAcsgC6Iskjs+yC9uNBAg9TJoFPTBOyIl1MA4LeWKPGpZEAc5J3qhLN/C8wwODZHYBb6JEUka2/MhDYbFNtvgTPQretV474HkPxiVfiyJB2qkD7qsKd0OK6ZF/h3gHlHq9oeFdG6RGiiFuHRR47J1fyp/trMz6DeM94jO010afw4xX7LJmA5qjO7C2ol1S5q68FAFuIw9Ay6lQNLhIwyOE+aPM5FTJYysRZQz/j7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezoH+MTd0WcFgsGusw1CRIXDb3cWHXWRK+stFd5C3wg=;
 b=izCI2CRppvJJdORuSJ2YAp+j21w6q6H0M+PtzJHmx+TvTMjsItV1iOnCqfRh0Jc31AJoqT/Xn+Xj3ZP6YJ7DcnSNipamn8fn2Dkxorr5mmL59HsudCoEeDstUPSCm80JMDfIZEkMQjOEwJ3QXpF7RhaRg/GZuEV5AJB0t27DE2k=
Received: from CH2PR14CA0004.namprd14.prod.outlook.com (2603:10b6:610:60::14)
 by SA3PR12MB8809.namprd12.prod.outlook.com (2603:10b6:806:31f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.27; Fri, 20 Sep
 2024 09:09:54 +0000
Received: from DS3PEPF000099DA.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::68) by CH2PR14CA0004.outlook.office365.com
 (2603:10b6:610:60::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Fri, 20 Sep 2024 09:09:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DA.mail.protection.outlook.com (10.167.17.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 20 Sep 2024 09:09:53 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Sep
 2024 04:09:50 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <dri-devel@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <tursulin@igalia.com>, <simona.vetter@ffwll.ch>, <robdclark@gmail.com>,
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v3 0/6] DRM_SET_NAME ioctl
Date: Fri, 20 Sep 2024 11:06:42 +0200
Message-ID: <20240920090920.1342694-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DA:EE_|SA3PR12MB8809:EE_
X-MS-Office365-Filtering-Correlation-Id: b3230c0a-b294-4df1-8a11-08dcd953fd26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHRCK1lTcUVFTUFjL0ZvSyszYjJIZXRZb25XL3NtWTFWVXp6QThxb1ZRMzBy?=
 =?utf-8?B?eTB1dWNIL0N6a0QzTzhwZzlCcW9oaVp0bkp2azVCQzVvZkJRaHFtbjRUZzds?=
 =?utf-8?B?cmFwUlFoZEwwRFV5L29PbHFpTWx6WW1HYzB3bGRHWDNjLzlzTWV0eTZDR3N6?=
 =?utf-8?B?ajcxNzRWMVdIZ1hlN3ltYjYvVHpxaU5CMEVKbFpVVGdIcUNWc2NORS83NEpq?=
 =?utf-8?B?NGhJbEdhSGI3OVhrOXU3bmdwNXB1WlY0bWg3RCtnSEFZNGwrcktLdTZ4SVB3?=
 =?utf-8?B?QThEYlUrNCtQNjNodWI2L2VZbEVlc3FUS2krdXEwK2k2SWEySk9OUkJVK2tN?=
 =?utf-8?B?VGJtY2RxRFFuemN1VkZCSXR0Ym1ZeWlGUWhFMjIwdDBOdUpYYWpMOEF3MG4z?=
 =?utf-8?B?Q1h3Qkx6a2R4VGxQRzNIWGlNeXY4YmNjcmhpK2M4MWRKQUJFNnhRbVNWaDhI?=
 =?utf-8?B?eTRZREovd09sdDFvRzFjdWtZcm9KZTU4MUQ4WUFTcW5reGpWdHByWnIrV1NE?=
 =?utf-8?B?T0hRV21VKzRZQjdoRmNveklDc1h4WGNrNDVrdzEwTXBVKytuM0FXM1NGOWFS?=
 =?utf-8?B?dFVkODNpQURlbkhnZ2dHS2preE56SGlOanRJdXZVY0Q1UnFZR3hlcEhHTkY2?=
 =?utf-8?B?anFmYzkwU0E5Y3RKNUpmd1lQRnBsYkNmMk9XMVpVaGdkVEgyYXg0SjdoanlO?=
 =?utf-8?B?VmR6RWI4ZjR5NjE0SzIxeGZ3YnRwOU05dkVEWE1haGJ0eGdoMkFIVjg0cGxx?=
 =?utf-8?B?WGtiTFVkZ25FVXJQOGE4SW9PTEY1QkFYcUovd3R2SUZUMTVZL0FEZXhIcDll?=
 =?utf-8?B?a24ycHlaMTdndWtnb0RJWWIyTHdnM3JTb056QmlUQlFTRFY5WHhDd0VJdHJx?=
 =?utf-8?B?c2RkR2RQSVQ1QXp0T3lnSUVVckRQUmdSYUhEa1pMWTJVd0tiRDhwVEtNNU5Y?=
 =?utf-8?B?L1JoUVMvNHNnR3J1eGd5OC9ndWdma0Q0cHFCTTRFWnRCc3hCb0ZYNUZPTWNi?=
 =?utf-8?B?eTZhR1BhSU84a0JTaVNudGJGUUp4KzBSK2pTdU9MVmhkVjdWTWVDQ2ZIWG1V?=
 =?utf-8?B?ZzhKMHBMb2JabG04NGNEYmlLMUd3VzNBU2tQMDY4V01vZjFUbWR0bFhDVXV2?=
 =?utf-8?B?a1RqajhaQWlFZWpOdnp3T3prYzBEUlVrNk5mY1E5RTZwWDB5czY1MFhzaUhD?=
 =?utf-8?B?dnFVYzNGcnI0VHc5cTA4WVhsTGpTQW53RWlnYUNiL2N6TUJLVzRZWk1RRSs1?=
 =?utf-8?B?eFkza3pUZkFxVmJNd2dSWEJxK1VvK3BkWlduV25MU0NpK2tyd2hmWWJMNFRk?=
 =?utf-8?B?U0tGTm1KN0RqbVlvZDE2U3ZIaWpUWThwRFd1T0NtT1JvUktXcXRtNmFHdTlS?=
 =?utf-8?B?MjRoaHFvUnJUMnVrRmVSOHB2VHp6dEE2M2Z5MmduU3I3ZnpkaFJ1MHNobHBE?=
 =?utf-8?B?Ylg4ak8vYi8vemdTZGlqL3VIZUZFMW9udERtSzk3VVlFRVE3MW1UWDd1MFg5?=
 =?utf-8?B?Mm9CSW93cy9UVzhuUzd1VlFGWStGRk9Cc3FiVzMyRk1ZbzBtSWxIZ2JVOEtH?=
 =?utf-8?B?UFF6OHRQUXdaR0xjYkNJd3IrV2huWUgrSWJROFE1WnRISDAyME51Y2YxalNW?=
 =?utf-8?B?NGJoYjUxQU1wOEV0OWlwbnlKSDFUNjBrSHJmZ2IwWDF4ZzRhTWowUmxGdTJX?=
 =?utf-8?B?Umc5S2RiK3VlMG5HWktPSnAwdDREVmFqQVNnRktJY1BEc3ZqWTV4Rlo3WTZH?=
 =?utf-8?B?YzhQVTFiZWJzMHJvVnZxalFCME0zendCTEplb2FpKzl0VFFCZFJvTmVXR1NN?=
 =?utf-8?B?TWxuU1p2VXFIS2FvRTBodndESjVwMXB3YVByNGtCVmF1QTlCNldIdWVJZ0R6?=
 =?utf-8?B?NXl4ZGc5UWNrcjlwQ1Nvbjh6NlpRZ3hYL3pRNXROWnJJQzlTano5dUtZQUg1?=
 =?utf-8?Q?jf69BMbEEA5rvDoZvncyMy/nTiCc8f+5?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 09:09:53.1504 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3230c0a-b294-4df1-8a11-08dcd953fd26
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8809
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

v3 changelog:
* Added DRM_NAME_MAX_LEN instead of using NAME_MAX
* Fixed Tvrtko & Christian comments on patch 1
* Added R-b tags to patch 2
* Following Christian' suggestion patch 3 became 4 patches:
   - amdgpu_task_info::process_name is now a flexible array
   - amdgpu_vm::task_info is allocated on first submit
   - amdgpu_task_info::process_name was renamed process_desc,
     and includes drm_file::name when set. Like task_info
     allocation this is done only once.

Pierre-Eric Pelloux-Prayer (6):
  drm: add DRM_SET_NAME ioctl
  drm: use drm_file name in fdinfo
  drm/amdgpu: delay the use of amdgpu_vm_set_task_info
  drm/amdgpu: alloc and init vm::task_info from first submit
  drm/amdgpu: make process_name a flexible array
  drm/amdgpu: use drm_file::name in task_info::process_desc

 Documentation/gpu/drm-usage-stats.rst         |  5 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  1 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  6 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 48 +++++++++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |  4 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c      |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c       |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  3 ++
 drivers/gpu/drm/drm_debugfs.c                 | 12 +++--
 drivers/gpu/drm/drm_file.c                    | 10 ++++
 drivers/gpu/drm/drm_ioctl.c                   | 48 +++++++++++++++++++
 include/drm/drm_file.h                        |  9 ++++
 include/uapi/drm/drm.h                        | 17 +++++++
 23 files changed, 159 insertions(+), 31 deletions(-)

-- 
2.40.1

