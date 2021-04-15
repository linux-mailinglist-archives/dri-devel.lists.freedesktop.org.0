Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D73235FF41
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37E76E991;
	Thu, 15 Apr 2021 01:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62CB06E98E;
 Thu, 15 Apr 2021 01:24:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nS1T/Z7NaZzdQiG526gizUKNM8j7FjXKggoZtgZvhfaCNV18NhG3FA+zfGFAnfRATprEBguN/n5hei4PFAaqQBRM9XbpdBgW3633zkGS5nbuZnTfUa8i6f5iYciGum3Gn73wExSwv8qYY4Ysc9xViq2ciNETu1EDm9iv2jzlUryZsvgZHc4Mus9wqhf4vejv6uEtzMVHycko1fvkeCECGC+bruJhxp7YHEz67W9E/OfKy1dcoHs9ThyaWSLj3GmkCsXQrDk+q8mxWo2uz+MVthZOCw4d2zaXKNJviMxaINblPBuA+KCCbiV8xo8+S2H2WEOrzNWzC07D0K0C4NUqeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjNq+6DHPjUFoAzTVULn9gSidoXURNkUuaJDIymrsaw=;
 b=NBdZeZH49MWoPvg3rg0OlT8ZCX/8KViwoPZeeHtShu8BLyzX/2wuvfq7cXq/QdpePl8hV7oA/ppD7fLiutsPB8N4YodlJeCKoYuQKRUnIizCra/UnEB79oHSAdP2r/kWrgIKYk1UjiiVmKEYdjPw0sPiAxMCpkK5sNUEyeTbIZcbIEPhiDbKc+eH4chIo4ax+87RwoZ0ZvyENT0v9VZDOiI7WRvZA2epVpqOskrdyA5PMnRbSHObY7hmovybX2aSWUo3MJgfGO5QurwqggdGYa7aekJ218/KeiZrGx8Pt2mvc7+szqtvZd5htHCnHcOUds1aoPCtJr9yV6u5Xw8ccg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjNq+6DHPjUFoAzTVULn9gSidoXURNkUuaJDIymrsaw=;
 b=SeCKIdqPigY6A37yqB9/QpULgit4AHveqHG8ob1rJPcqIMwKRyrpKqbYact89UmfNGCQ+QAIT+4N065jCZCX2WewLhwYasWPwD90aTEHzAQNPTGFFGNeMc1jFHzkKNJlcL9rFlBOB/lh1C3LW1oOdWBP20wM+3pVM3jVKdmV3OU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3839.namprd12.prod.outlook.com (2603:10b6:208:168::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Thu, 15 Apr
 2021 01:23:55 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 15 Apr 2021
 01:23:55 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 00/34]  Add HMM-based SVM memory manager to KFD v5
Date: Wed, 14 Apr 2021 21:23:03 -0400
Message-Id: <20210415012337.1755-1-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::48) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21 via Frontend
 Transport; Thu, 15 Apr 2021 01:23:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 846f223a-70a8-40b2-1d2f-08d8ffad22b3
X-MS-TrafficTypeDiagnostic: MN2PR12MB3839:
X-Microsoft-Antispam-PRVS: <MN2PR12MB38395A1C14DA9A94CA83E888924D9@MN2PR12MB3839.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cP+uKRPJnSNLhuOCLNImtQmdiW5lIC32sJqbI4HFPHBOsIfMuelJA/x5lHOOVVto7RtMP8sBx6PENbOfJPObOv3a4ysM/JP0gWXWZkNMnTvkmRxiAiL/IKKSJdDeer6bJikK5KVM9V5tmytvAcShuZksJ+7EZde6SZgySAanCCvP9/mRp/FckfocduO6pbvVzGf/MdWsE4l3gG44IoHQKXy55+vPaJuby46gOqWh8PTWI7y6ISLpgW73gFPbtsON5oBkMjYOYAIY7D5FwFO81a3HniKbM+HDP0k4EycTI0wHGdIAz6OQoe0KeTPCy3ic+4IbwUXng9bl4rj+Ab3UEnHfM5CYiK2wNpepNA/XCurIhs4tA2jHfhKYL6L7Q6ULZ8xMA10qmCkEqMJfCmZiRJUauZtn4w1QqdQOGAdAld7rX0oRT5X2L/QT1oYwNxhuSzJgQB/EPh6MI4tUUkTwwuZhw7+WenYmYJqqnYS/N+mdm4DMUjvUIxTyAH5q4PS9l3N7yQN+e/oX6YGvYvZcUblzXej3nGsIjdCyRNBrCyXd+afm187bURN+xN6VN7ycQZNO86bF9m6T608tNxlOxNYSdRsmWm+Zy9fwB5iJ5LJLrd5Yz0ylGE3iTYgLnu53wCdscssa5+h7k4BtPhTTiwydcjy3A2TxPYdVTsZDR6uPyxCxvEjASCSg9GKNzi9n32Tjv7aYr3sppdvW9JF5uS3kGLURpL6V70swnGiAGBA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(2616005)(86362001)(26005)(956004)(52116002)(8676002)(966005)(316002)(83380400001)(5660300002)(38100700002)(38350700002)(6666004)(478600001)(450100002)(8936002)(7696005)(66476007)(6486002)(66556008)(36756003)(66946007)(2906002)(1076003)(16526019)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?/M36qvrYrOhgL4RpQbJA5sPTYaFep2094l43DtHch8czRqsu6sVB9+gapsYj?=
 =?us-ascii?Q?qceh6r1lblc2c7TPY1EvyAUtA/4CgJ95nIWKBxBoLMlCwUezWcCnCJgomcpO?=
 =?us-ascii?Q?uvB9iHsxUPWsrPdNE1s2YB59zOTBFF5JApRJEmvDQndFk8xdKPmbPOHV7XN+?=
 =?us-ascii?Q?UYFoAEVqaLgXfsqOxGd4hH9da7I0QSMI/PjiXgacQnf6HF5wdlCUhKOFDrXL?=
 =?us-ascii?Q?8I4u2dXvVjK37Z/7+BHzDQTpPH7IbVhap2NbsxTkiTcwd0AVFPnibg+sw5p5?=
 =?us-ascii?Q?H1T4gdlCPwqIm+jZdIjCU6tLBIDLCmihLzWiAtd+tqPv174Amdt3E+/G5zug?=
 =?us-ascii?Q?2Ivm+a+7Siz5w7l8nOeKHewIqzrzgzdfpCrVzvhTX460sTM/uCqYY8WDsuxs?=
 =?us-ascii?Q?pgIsJjIJL6GA5OEa+tIMmmluu2fXdP/DZNuP5zlrS3Jw9gIPz9T7ptidLmi8?=
 =?us-ascii?Q?VzTo24VGBRjKBUfaiEXhvMyNES2ZsaobDn6v29TcIxYF+sqGI3n6LEdas4un?=
 =?us-ascii?Q?KOevU/KZXpVKdrnFGlhYgt6ZYYzJxL/QHrWTw3F3YbYNVa7Pka+/owAvQCnI?=
 =?us-ascii?Q?qHfsgh9vDZ1C4keKHsQRQZXpVwOt0FXI+PoeYvKMaGZfbGJa6Tk9rMKd9eto?=
 =?us-ascii?Q?j3ZZJiA4tg/B58pLEFNkrhN/XZssefgVmoHRnWnWWulhoj9uiXz7R/htiOM9?=
 =?us-ascii?Q?flgtwaZmLzK6hCAJM5YBOxbFx1z/hoObemw0uyRusQAeNUeubBd4f3uRoxyn?=
 =?us-ascii?Q?cqxHcFg72bE/rHsaflasb1zyjWM7ye/WH0D2s9YIBUrJ8tKi6/vdqSdCE86G?=
 =?us-ascii?Q?IlxwLB9xll06fTfZ6zcmKa35jS5Tmf6Ftm2+L+4mEnyxtOyaimHh6smDIgpd?=
 =?us-ascii?Q?/LzwT1eEwC+G5l94FCvJBfNieJk6i21JJUXQtItBmiddMOpQ8FUuU1oGMX1R?=
 =?us-ascii?Q?qNTTnLI6GgD1+YlYpVX4a687C/8XhXDCaVhUNZLpkYCBQ4Ni1IeQXTcIrjmc?=
 =?us-ascii?Q?4hEX2DZIZs16X4LmsqljIDM/eb3/MqI9yiAme7XeYjEbCEdMv6XnqI5NzVNc?=
 =?us-ascii?Q?DHRmT9FpUNizueiRxgz8B5StPJV1mDFLYPuCnaBrh1+F+JOMUlgPQc1BtdRs?=
 =?us-ascii?Q?jL/mCU045ZtkoTKBCGLgd6GylMCXUR9pcgz/XRdagCIhLRBAsG3F3W2BGGTw?=
 =?us-ascii?Q?z4ayFVi3azZpvU9+ZAlRO5UZAJuUPKHKi258H10rBv+qv9zUyeOYUhhsCBSi?=
 =?us-ascii?Q?1vMxGAQlBCjlsc/A9bHeYLw/8U2R3QBsW9wn16HkItOudbgasmu0RIM21dwE?=
 =?us-ascii?Q?4dhaOoGUydLVD3aKGka2zVy/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 846f223a-70a8-40b2-1d2f-08d8ffad22b3
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 01:23:55.1385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pz5uUM4d944zqNeLGESKEn/OHBK5FUEadCvlaX8U+ATXP6dMyHC++caZsGwL34WsOMzP3FNi01+aziGoGEB2xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3839
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Updates since v4:
- Rebased on upstream.
- Added SPDX license headers and updated copyright on added files
- Disabled XNACK on GFXv10 and later GPUs that don't support shader
  preemption on fault
- Updated PTE flags for Aldebaran

This series and the corresponding ROCm Thunk and KFDTest changes are also
available on gitub and patchwork.

Link: https://github.com/RadeonOpenCompute/ROCK-Kernel-Driver/tree/fxkamd/hmm-wip
Link: https://github.com/RadeonOpenCompute/ROCT-Thunk-Interface/tree/fxkamd/hmm-wip
Link: https://patchwork.freedesktop.org/series/85563/

Alex Sierra (9):
  drm/amdkfd: helper to convert gpu id and idx
  drm/amdkfd: add xnack enabled flag to kfd_process
  drm/amdkfd: add ioctl to configure and query xnack retries
  drm/amdgpu: enable 48-bit IH timestamp counter
  drm/amdkfd: SVM API call to restore page tables
  drm/amdkfd: add svm_bo reference for eviction fence
  drm/amdgpu: add param bit flag to create SVM BOs
  drm/amdgpu: svm bo enable_signal call condition
  drm/amdgpu: add svm_bo eviction to enable_signal cb

Felix Kuehling (13):
  drm/amdkfd: map svm range to GPUs
  drm/amdkfd: svm range eviction and restore
  drm/amdgpu: Enable retry faults unconditionally on Aldebaran
  drm/amdkfd: validate vram svm range from TTM
  drm/amdkfd: HMM migrate ram to vram
  drm/amdkfd: HMM migrate vram to ram
  drm/amdkfd: invalidate tables on page retry fault
  drm/amdkfd: page table restore through svm API
  drm/amdkfd: add svm_bo eviction mechanism support
  drm/amdkfd: refine migration policy with xnack on
  drm/amdkfd: add svm range validate timestamp
  drm/amdkfd: multiple gpu migrate vram to vram
  drm/amdkfd: Add CONFIG_HSA_AMD_SVM

Philip Yang (12):
  drm/amdkfd: add svm ioctl API
  drm/amdkfd: register svm range
  drm/amdkfd: add svm ioctl GET_ATTR op
  drm/amdgpu: add common HMM get pages function
  drm/amdkfd: support larger svm range allocation
  drm/amdkfd: validate svm range system memory
  drm/amdkfd: deregister svm range
  drm/amdgpu: export vm update mapping interface
  drm/amdkfd: register HMM device private zone
  drm/amdkfd: support xgmi same hive mapping
  drm/amdkfd: copy memory through gart table
  drm/amdkfd: Add SVM API support capability bits

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |    4 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c  |   16 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |   13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c        |   86 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h        |    7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |   90 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |   38 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |   11 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c      |    8 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c       |    6 +-
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c        |    1 +
 drivers/gpu/drm/amd/amdkfd/Kconfig            |   13 +
 drivers/gpu/drm/amd/amdkfd/Makefile           |    5 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |   64 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c       |    4 +
 .../amd/amdkfd/kfd_device_queue_manager_v9.c  |   13 +-
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c  |    4 +
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |  923 ++++++
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h      |   65 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |   36 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |   90 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          | 2902 +++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h          |  206 ++
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c     |    6 +
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h     |   10 +-
 include/uapi/linux/kfd_ioctl.h                |  171 +-
 28 files changed, 4693 insertions(+), 106 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_svm.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_svm.h

-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
