Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDC22EC880
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:02:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50A76E3DA;
	Thu,  7 Jan 2021 03:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5345E6E3DA;
 Thu,  7 Jan 2021 03:02:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eIZIhHZqPRzwpa3xtR1hrf5tkTmEPRpq3UFqxid9x+DLZZJoK1/KHef1U/wOD6QK1fP6OuRYMIumKFfQrXE18G4N962CDUcwWmczgxK2CureJLWoWVoEtXmtzOlw1ITBDbD3wnapZZO6rS6L9mbJg7I9XDi93Ey49nfiFfqP9vB5PdcDR/DdfaDT8tRKazt63Ee+DQL4SORoMzhlgKKxWW61p3+M31J+cnMclcreVbK2GO0+hJFJFeqhy54pbK4Gsi755hg/EzzNa6XCnw/A2YclCnnuXuHbNCtq94/VOTIscO4zgerNmziOo5RFYxgSISxIHKgqC+pojpbjV3/M9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqfDOA/KMWkzpMB4Wt3Ze+smbT4tG/dPR4/rH+Mp4Ps=;
 b=XBB0BoTfujMLn6GC/lHaLtghUXWH2M0a7os9Wo3oJ9C1IAlOBbgDRel8/nAMn+rjHPj8oo/m30Du5rw++ExUx4HQ3oRFCHxlYJCU9XM46+PAf8r5GGX1wB8KoG2vrkzo/kK8+sd6AkHoPjpIDrr+f1HRB0972ILu1hK5J12sJI1UbzAL+3Uff6L9II8HGhNcnyOmzFCrQ5kzhC50Pd1fKUax0Ql974pUSHxSdUph1dY1K/tWF+KBC63hGly+KpXFgnY5Qyfv3OKkrwsmgiFVoH6oGajWwQH1y03a6EhRItNeXGSzrteIc9UBR6owUtiLozU6sDtdBHkDskpE+vsBOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqfDOA/KMWkzpMB4Wt3Ze+smbT4tG/dPR4/rH+Mp4Ps=;
 b=MnztciLffRbn4wRQ8iHerqQljl1OKevReFBdWj9Uy5szfSVLEyMM3818QYLRu9Hi9cxXem+hy6KMioEGqgo5XA8VKjvlBdwxOuuaPxJjLT39FnlNKlj5i9AUA+InBdrmPNX+opKXoe0zg4C/dB6DEpeAPugksp4cdfg4OX5tX/k=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3999.namprd12.prod.outlook.com (2603:10b6:208:158::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24; Thu, 7 Jan
 2021 03:02:45 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 03:02:45 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 00/35] Add HMM-based SVM memory manager to KFD
Date: Wed,  6 Jan 2021 22:00:52 -0500
Message-Id: <20210107030127.20393-1-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::17) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 03:02:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 15171c73-8b3b-4845-ecd3-08d8b2b8b538
X-MS-TrafficTypeDiagnostic: MN2PR12MB3999:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB39993B91E16F794BC9EBFBE592AF0@MN2PR12MB3999.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TvUuiEDJJg/fsjNZUXlfouvKWkcXVFynQNA7JajpuiAmt0Gidk81C2kHI0i4O7HsK6aMOTwTYPhL+jD4v8FNlujfFFkujwc9tDECSrPXPNNmT7inDu1DJjGVx3G09fzNJ1lq1E1DhlmL4AYlU40LXesFV1aXNC+laz6r8P2UAif9Dp45OtLrn6lgx7SDpoQ2im7yOVCs7SeFsq2Du4kk7pC7TO4ieVWyJslbN8joOxKKSCIVf5ByX6rJwNoFiSfWP2HAq5efG+SdcBXDosPJpsmSwdI/rvUJ1ljnnc9GxS8Uw2ggLca2IRVA7/ibdymgCT88i1vuAOGmDi/szqPlZ8sZ8xdWsPQu+FvFFNTy1Tru21IVq83KHBDlrE6Jn+k0FfWtcX1Sbyq5JWGEzaRXE9BQXsz41zDuwRLIYpLCaBVUM+YxtaQC9fbsQ0Sb1/DNdBzhuO6shWhHyIbkuxhxtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(316002)(6666004)(7696005)(966005)(2616005)(956004)(8936002)(4326008)(66476007)(8676002)(478600001)(5660300002)(26005)(52116002)(1076003)(86362001)(16526019)(66946007)(450100002)(186003)(6486002)(36756003)(83380400001)(2906002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?3Ia0oSx7Ji1RDaL5Z/Z9bz0XSpaYH+ZO7u0YhIJWNlzGFr4qXo5JNbjdJtWx?=
 =?us-ascii?Q?LJMClNEndDNvdL0Ne0m3XfPTkIjTmvcATIIMJhQnrht0vWCZFKtdVlk+uxsG?=
 =?us-ascii?Q?HAgQVzkw5e5k5nAOoKQrb2cFSETCQB/5xSRUBGtoAIEcjbnc8f1aLCkVrRNd?=
 =?us-ascii?Q?IU0hua+p60DJ5uVduezHa1pRYuvJegXmJlsPYE5wUbYjRs6pIF4PMCRD1PGg?=
 =?us-ascii?Q?cIEwTkC9z3U9tsDeDiwtVfSdXTAV2WPigj9UNhMkXMlE8KPPCAMkbJMiI/wx?=
 =?us-ascii?Q?DMPOGu4LpO+fkUWb8Go8L1uyH62OC31x7Ib1BeqD/EyWpVJw732/BFY85QGw?=
 =?us-ascii?Q?dRcyXzplXw83mEucaFsQz0zEbLaj17bOeGZus8EBrKP2cSycCNRg8vuXHzuY?=
 =?us-ascii?Q?eDiAEyrHNSrbZp48lXo+x2UADq6Lr1P0AyeATS2MMUXC9Z++NiFg69YLEHaK?=
 =?us-ascii?Q?4aGgWn0hGNsei1Y5xCZyIKvF/KnNkUV2RtPMUrGisJtKw6sjJkBIyIjfPFsS?=
 =?us-ascii?Q?mg8vwmEDKIN0KnB/NdNAQxg8XyKyL6jrOnqp220RnZC2y9hvoEb+9Idut38t?=
 =?us-ascii?Q?rBon/nY9UABAwgqBxCKaf9uDNPK+FmOrhBDZtlh6DNataQlaAEEiG5ADx6D4?=
 =?us-ascii?Q?sJ3DHaPFt9PQFR6IS2CsiDoij8THW89C/nC/x3aiOF3v9hTh4G0jxHiXnZuZ?=
 =?us-ascii?Q?+iCwlibexUo3zY3z1qSIXZXHTFvyuqpt5NeSqyRycBUi1zx8t7zNFkqv8N8F?=
 =?us-ascii?Q?DIOE7hnMKg1fyIzw6WvI7wrxtSb2yu6uE5Lj0l1tmLlh1BtSCyU8dUB0oTyV?=
 =?us-ascii?Q?C8Nyg6FRIflSTsGwLlGIRcUesvh37/hbH/WNMMrO2SKfSKPe0L5awLCzxTW8?=
 =?us-ascii?Q?uXi4uIGxQGxPlCZa7DxROPgC/dVOjDmIDFdkKd1t3DxeRT1l6HHAp8j2Mz9j?=
 =?us-ascii?Q?YrisyESS6BymulwJalFa8c6KVVtuV1bgm7y2pB3xbAYPNI3+DiLUIOzFGtGw?=
 =?us-ascii?Q?bhkr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 03:02:45.6142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 15171c73-8b3b-4845-ecd3-08d8b2b8b538
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kIlW1rTWIv1AAjl4uzth1cVpj/0Mlrg3vLtasY2vgvw5wp6tftc4nI1wJP6YOvBwobBurA3lTXJK0EzMLq3xpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3999
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
Cc: alex.sierra@amd.com, philip.yang@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the first version of our HMM based shared virtual memory manager
for KFD. There are still a number of known issues that we're working through
(see below). This will likely lead to some pretty significant changes in
MMU notifier handling and locking on the migration code paths. So don't
get hung up on those details yet.

But I think this is a good time to start getting feedback. We're pretty
confident about the ioctl API, which is both simple and extensible for the
future. (see patches 4,16) The user mode side of the API can be found here:
https://github.com/RadeonOpenCompute/ROCT-Thunk-Interface/blob/fxkamd/hmm-wip/src/svm.c

I'd also like another pair of eyes on how we're interfacing with the GPU VM
code in amdgpu_vm.c (see patches 12,13), retry page fault handling (24,25),
and some retry IRQ handling changes (32).


Known issues:
* won't work with IOMMU enabled, we need to dma_map all pages properly
* still working on some race conditions and random bugs
* performance is not great yet

Alex Sierra (12):
  drm/amdgpu: replace per_device_list by array
  drm/amdkfd: helper to convert gpu id and idx
  drm/amdkfd: add xnack enabled flag to kfd_process
  drm/amdkfd: add ioctl to configure and query xnack retries
  drm/amdkfd: invalidate tables on page retry fault
  drm/amdkfd: page table restore through svm API
  drm/amdkfd: SVM API call to restore page tables
  drm/amdkfd: add svm_bo reference for eviction fence
  drm/amdgpu: add param bit flag to create SVM BOs
  drm/amdkfd: add svm_bo eviction mechanism support
  drm/amdgpu: svm bo enable_signal call condition
  drm/amdgpu: add svm_bo eviction to enable_signal cb

Philip Yang (23):
  drm/amdkfd: select kernel DEVICE_PRIVATE option
  drm/amdkfd: add svm ioctl API
  drm/amdkfd: Add SVM API support capability bits
  drm/amdkfd: register svm range
  drm/amdkfd: add svm ioctl GET_ATTR op
  drm/amdgpu: add common HMM get pages function
  drm/amdkfd: validate svm range system memory
  drm/amdkfd: register overlap system memory range
  drm/amdkfd: deregister svm range
  drm/amdgpu: export vm update mapping interface
  drm/amdkfd: map svm range to GPUs
  drm/amdkfd: svm range eviction and restore
  drm/amdkfd: register HMM device private zone
  drm/amdkfd: validate vram svm range from TTM
  drm/amdkfd: support xgmi same hive mapping
  drm/amdkfd: copy memory through gart table
  drm/amdkfd: HMM migrate ram to vram
  drm/amdkfd: HMM migrate vram to ram
  drm/amdgpu: reserve fence slot to update page table
  drm/amdgpu: enable retry fault wptr overflow
  drm/amdkfd: refine migration policy with xnack on
  drm/amdkfd: add svm range validate timestamp
  drm/amdkfd: multiple gpu migrate vram to vram

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |    3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |    4 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c  |   16 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |   13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c        |   83 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h        |    7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |    5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |   90 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |   47 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |   10 +
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c        |   32 +-
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c        |   32 +-
 drivers/gpu/drm/amd/amdkfd/Kconfig            |    1 +
 drivers/gpu/drm/amd/amdkfd/Makefile           |    4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  170 +-
 drivers/gpu/drm/amd/amdkfd/kfd_iommu.c        |    8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |  866 ++++++
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h      |   59 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |   52 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  200 +-
 .../amd/amdkfd/kfd_process_queue_manager.c    |    6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          | 2564 +++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h          |  135 +
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c     |    1 +
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h     |   10 +-
 include/uapi/linux/kfd_ioctl.h                |  169 +-
 26 files changed, 4296 insertions(+), 291 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_svm.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_svm.h

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
