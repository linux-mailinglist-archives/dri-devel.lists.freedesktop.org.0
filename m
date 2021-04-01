Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DE8350D97
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 06:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1853B6E077;
	Thu,  1 Apr 2021 04:22:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEEED6E077;
 Thu,  1 Apr 2021 04:22:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G1GxdYzJB9PrSZHcuWijK+iSj7fjspH7iIOWFz3SOx9tmgl67oBxJISpd9mcFdkirKvMq5sz5HNp3fGCpytPDAlBdZJSsOF8O7iBoNT3xF6QPcpmsGdBG0msl7UuVE35VBwPVmwjhig7uDgUEMitoncqh7e446Se6SElSTEsm+uBRHPzsf3vbOMILYUNM4L55abQydvdfWBCsGLCTzby06F0r+sFzbqWzJm+z++mErtsRwPTUma8zpf3MiRjXTguJNw0olykyvOhZNW02WgYm4qrX6Un6C0NaOybmZ15Dgwn5kho6ByhlSAN8BStkm59liVVlyOi0ooivzdzdE3t6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKPLLELeVr+Kfn5q+uNgsOVd2aVbI3/rCdIZ1/vO/rI=;
 b=VJNbQS80e2rzZJiYFO/TyjfpcWFiJ/7dG3VmJ9ntoX8Mni08BHnnBBd+agBeTTV9NGxhX+AsGnrrpp19fmNVolZPOmrtgUVA8HWqMZ48Xt+XxEUSbBaaHM2F9VEeMvvR8GICb2ChjMdyszX4RyWyaltOhNFqpA7/1KXR2yFtDyLcLb/CsoMtgUGvnPEpSPfYTSwDkfJhBib7DF5mQnoIX/GPZ0MXexfXqyD7r6qM29MNC2d6yXke8pchEHrP8TVxQL0JGqzTMFIuxQuQMtH+7TrX+6jNsa8GQfhcOF/gtKc5zbTHUvy4a65DXu3u5kwnWACBPGO6ngnSnN9hTfStRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKPLLELeVr+Kfn5q+uNgsOVd2aVbI3/rCdIZ1/vO/rI=;
 b=Lmy4vfm4DN+jLmmp7zsSzTiCyAwVTFbHI2NjUMw/zwOJXZcyqfrWrOwiLiunlfgCjPh6Ody0+7wPte3Bi62cmPfVxDw5yuxpNvisqRaCv2Q26niBnNV3qHCu6b170SOJsRv4b6oDLdm49nxvMQOa0netwvRfhX9Vkx/nbYLfORQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4916.namprd12.prod.outlook.com (2603:10b6:208:1ce::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Thu, 1 Apr
 2021 04:22:42 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Thu, 1 Apr 2021
 04:22:42 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 00/34] Add HMM-based SVM memory manager to KFD v3
Date: Thu,  1 Apr 2021 00:21:54 -0400
Message-Id: <20210401042228.1423-1-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::27) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.32 via Frontend Transport; Thu, 1 Apr 2021 04:22:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f21045ef-acf3-444e-e4c9-08d8f4c5ca90
X-MS-TrafficTypeDiagnostic: BL0PR12MB4916:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4916B6C9EBC71B7B531C84C4927B9@BL0PR12MB4916.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X03P8oItb7Gi+bWxvdqMHmfCMgGkqDMLgRK3EmPHeBBVV3UTMHFgxTK1j+IAwfQAheZ62nTSvIVBbdWLs1zLpXaLWRZ+EUI71hngJL3V25cwAfGzWs+hZab53CrVo6lN90tr4+ylzzEI9ARM1tP18E88CcYnswL9FU70QeYW0njBfp4dVtm0W+YiHEQ3yDUcIzRxpZ8jrE4N5gp8jIRRlE3aBwLHlPuL6Jv34KFAmFH6+VpCFiP8dr8PvyXZZ88TL1KkPWA79n+yMaVV+tSz8RVNyDoG7UeDNDa0WCsTHUdce0gBuYYire/UjSvVVQ4GJ66rQaLz9yvl9lTpZOUeJArGPr+a68+woqSHePjeHgGKVQ0xJ4nrPi01l/e6DkRNh3YKdhHxAdS4/V8d2oDmnzAy7wOsDBqLuK1d7yH1ELFU5sbfwkkLN8d71S3oPnm9BEmRzHqghVk9VU4T+ip9RAFZ57W60jkQJbDz91jmup4V2BbtbL5Mdm5tqv2x1XDTbWr/AbXRpjgNX1JPUYELFDeB0SRGIFGcwqMdawYnhrJYnUR0gHskvEdScNYPhGLutVGZ13PyyCpnesh25D9AlYLKsQhZknBgakCzBOsGeiuFoOxEAzPnsdVqi07MYeY5DGVkuoPT60Kw1aDqMSbsVYsxmNrJm/fWXm3fubZNqnjoXqAG7PPJHDzxb7B6NZaOJ9+umX2jnGF9Njlf2q5g12fgIYr9tk7F3EblCD0KQNo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(5660300002)(478600001)(36756003)(16526019)(186003)(1076003)(316002)(6486002)(66946007)(956004)(66556008)(26005)(966005)(83380400001)(8676002)(8936002)(450100002)(38100700001)(52116002)(7696005)(2616005)(2906002)(66476007)(6666004)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?BAi29hkW87U3DelWDbSqb9vch0yjVOmGIRU70/2zxm9z4/ocU/y0poDCBFdy?=
 =?us-ascii?Q?B+rlKDgsISkSa7V0UzjDVgCxcEdQN+6MjUD8YKdS2BjoRPeuWvMWPkQPV1Gv?=
 =?us-ascii?Q?1ZFKe/dzOkiHpJj+NwdnfQU1zrv9xz1JkrBrJkvY8UGmZ/JtWmP6iwqMScRj?=
 =?us-ascii?Q?3Uo3CZiDRcycTXVkFF7/Z7QIq1VSWuAL/HB2jf2Pyk8IWPab+dSpc/nMON3p?=
 =?us-ascii?Q?WBkN7qhlWSnpzsus4P031t6xLfUfry8SCP9SGwryB8v2UrKLnaFhKprlb9EN?=
 =?us-ascii?Q?2NDg74qQMfymv3tU1SWhDLA7tITstoSnA+OjXrWastDu2hKJGBfk/HEZW/k2?=
 =?us-ascii?Q?KkIylFzBxrMzSn3lU0b1zwo7aNdxvkcaEIdgU5+oXGo/jSoGUQwI/NtxAgVK?=
 =?us-ascii?Q?oX52VaJIvJkcXwkpDIolzwo4lZHgRIUIG60566ouKskqFxTQcZfogIpBEGXa?=
 =?us-ascii?Q?UBIf8oCQXaBdSrveEcIl6AbLwMnhH5e6hbZRduhySvgLZfsHu1Rpoa7Hep3U?=
 =?us-ascii?Q?TDBCn094YXJAg9Dvz4uF3Tdpqdi1d2w8BYc1gd2OBTZgxukDznwWVotupqCC?=
 =?us-ascii?Q?OvaWOGipQbmmUuWxJF3wJgCog9nAFUBuLUBvIR6m8O6h94LA4jYutCqlwa9W?=
 =?us-ascii?Q?PGDLgjrdwL6nCmmrroxNRdGbX6AADn7+In6IauvjFkHHVXa2jAcudxrrb+4r?=
 =?us-ascii?Q?GQaBXl82D5WlYnNhz25m0FSy1uyc+qcOyoojWeM0jF6+EWAaKQdTe8gXgPzX?=
 =?us-ascii?Q?8DQC+Yo0JqdMWcF5V43hgmqv/DQYGD3xL5xPIsr5RJ+NKHlhXyyd6HD39lay?=
 =?us-ascii?Q?jXa1zd5wtnA2H+uKjLLEcHeWLigNdDiVZvg6U91mPmp81nEstRgCI2fR+8mG?=
 =?us-ascii?Q?OdBcfz2Ki5uD9S7yMbYKX4FsSoQdt04numPmOp0jlYL/360FPm5Wv860s/6e?=
 =?us-ascii?Q?gUQ0CiPt74NaEdVu38WGyHz36NikADoec8D9U/djKEQ8oA2iA5J3DqLQeU4O?=
 =?us-ascii?Q?x1jlaV7ICjyfYQVaYsuc5n7JZFYyJlLEQjw1FkuZWPzO9w2z12nUyOWXlORd?=
 =?us-ascii?Q?Ki2CfP+35QIcvdrATO2lZnHrXCg9CeMC6FVlvirWH+rRuO8G58uRQ1DTEeg2?=
 =?us-ascii?Q?J4uj5MfbJsQJgYkl3F24N5AofvWFuikeDvTgIYwoDvhEd+yU0NS+KyeZ15bd?=
 =?us-ascii?Q?syuQYjnS0WZ/zVApvbasXVSTN38BCVpODpN11ZpRFGi4vNeULlHyhsKJ5Tzu?=
 =?us-ascii?Q?i3U+yn4NblmOIWCILzQcC4ujhN1VOHt/6ougtxHKsOimAj0VnsMW048LIveg?=
 =?us-ascii?Q?G6rcXPSS8Tl3U6pP+ljnVXND?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f21045ef-acf3-444e-e4c9-08d8f4c5ca90
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 04:22:42.1533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xBrjqjIAt0ee0DJv8T7HkA31sdMJFDQQNvSNT9sPstya5KVWHQkeV8ncsbS8A6eqD0SKX/QFrP08JoQymC+74g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4916
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

Since the last patch series on March 22, I integrated all fixes into
the original patch series. An additonal fix was added for handling
failed migrations during GPU page faults. (A bigger rework of
migrations and VRAM mappings will come in the future.) Support for
per-process XNACK mode selecation was added for Aldebaran. The
initialization of svm_migrate was moved to happend before
kfd_topology_add_device in order to fix reporting of the
SVMAPI_SUPPORTED capability. An updated kfdtest now checks this
capability before running any SVM tests.

Support for SVM can now be controlled by a Kconfig option added in
patch 34.

This series and the corresponding ROCm Thunk and KFDTest changes are also
available on gitub:
  https://github.com/RadeonOpenCompute/ROCK-Kernel-Driver/tree/fxkamd/hmm-wip
  https://github.com/RadeonOpenCompute/ROCT-Thunk-Interface/tree/fxkamd/hmm-wip

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
  drm/amdkfd: validate svm range system memory
  drm/amdkfd: deregister svm range
  drm/amdgpu: export vm update mapping interface
  drm/amdkfd: register HMM device private zone
  drm/amdkfd: support xgmi same hive mapping
  drm/amdkfd: copy memory through gart table
  drm/amdgpu: reserve fence slot to update page table
  drm/amdkfd: Add SVM API support capability bits

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |    4 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c  |   16 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |   13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c        |   83 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h        |    7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |   90 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |   48 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |   11 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c      |    8 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c       |    6 +-
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c        |    1 +
 drivers/gpu/drm/amd/amdkfd/Kconfig            |   14 +
 drivers/gpu/drm/amd/amdkfd/Makefile           |    5 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |   64 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c       |    4 +
 .../amd/amdkfd/kfd_device_queue_manager_v9.c  |   13 +-
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c  |    4 +
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |  922 ++++++
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h      |   64 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |   36 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |   82 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          | 2866 +++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h          |  205 ++
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c     |    6 +
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h     |   10 +-
 include/uapi/linux/kfd_ioctl.h                |  171 +-
 28 files changed, 4652 insertions(+), 108 deletions(-)
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
