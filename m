Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9A4343EEA
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:07:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B5B8991A;
	Mon, 22 Mar 2021 11:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE7B89870;
 Mon, 22 Mar 2021 11:07:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HbNkbjDRCTQFIzE4sc4hCXqdRI3lfN2MfZIek2G1avSKM/TSjyvSG8Y1WCn2o2t+OLtDH/XzpuN/KURe/Do6dMqieLqFVCf7hAwu8LB3qK08YbeCuqtFwHLvL8TSgpd3CXRyCO8ZEsFNBjHMEcCixQPL+m/NlCHn80zz3fnqAmwGC4FCyyKRk2LEDVWGKb+EoOU3KmvKrU0xCUyYs3qP6SC8jReSdXHLoooOsYSvG/w7ZE4qUwbK+G1ToMn8z/Hs0trM/NOfgdrIQOLHfHsY+VsPOdl+LUsu7u0ITc6590W6pwJLqbsnBJfm0SGm7F368WnnCe3U7G9jMCoafzYE5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vm1GA0FNpFU1GC81c8sb1sFeboU+10w+ZPEJ/lowcRs=;
 b=CZA+wgOU5iElB6okJx/cr/XyzFjhLRsDtccYgrqyEu955PekJ2l4czqc0pne+pZHX2BAAS78s67tccSXqngDMhU4l1mtX+SLzsmF4DlCBZBkvnbi8F9fZYDlc/QK1gZSv2+Wahe0HizOueqZ6Dz4Z8rgGeIaC9KCnzWHn1f6dfWSJo0oWh3/aTmkXANGnQHGmKnMm3/j/V5qxgOmIkd8Y9S5LB6fwPGGSPxOodtnr9+YAfJ4O3p+wrE25PGHJpHeKAO4R89C/YelCt/+5pjLjO/ZUvWACgvUch7BIw2BFit5U5G2zbe29vVnH3SUij+hRX8MeQomIoGwmoiiil1+ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vm1GA0FNpFU1GC81c8sb1sFeboU+10w+ZPEJ/lowcRs=;
 b=Y5JxPTkl8eTRB5za9ke8vk4nh6luOCdHZHc1Bt/5Ybq2Y6xewI/Kw+uWTPupZG0vs483vB49Qs5qKJqCf7u+xtrBtBrkkRvwAS54zKwCiSE9FVzgWMEoTfVfH9SOfg9ErQoC5DTTpE3lWV/42qG35IurtP0NRTbS4na+mYcsz3Y=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3935.namprd12.prod.outlook.com (2603:10b6:208:168::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 11:07:29 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:07:29 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 00/44] Add HMM-based SVM memory manager to KFD v2
Date: Mon, 22 Mar 2021 06:58:16 -0400
Message-Id: <20210322105900.14068-1-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.0
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::21) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24 via Frontend
 Transport; Mon, 22 Mar 2021 11:07:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e98f68a7-f6bd-480c-74b5-08d8ed22aee1
X-MS-TrafficTypeDiagnostic: MN2PR12MB3935:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3935499A0735F3877711DF1192659@MN2PR12MB3935.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: giypqP/4aog+eW8TRYj7U+5r8AaU9kDpBp5juzCRVEYk4zmzwpJYm+gZClJB092YYZMSMAWl8xFPDum00H2iB3JbmnjBEBJzhU2VG9YOAwnwcF1oU5359DcL334qVmjNoBv81plf183NsG2MBMcWpexUXFZP20ktyqIRuNq5WC4hqjT0R7w+zdT6TggJaiXe7QBmBvu1n1wtO8ABXKcgGuCtMHN8GMV9N2Z//6OWMsaJLw+2xgxqqm9upRxIG7O3/S9omsUDtWiXX3626ioioNS7hE10+xCbkvtUBHd7tjKNJzBIGX6dRwSVn6aSa1z0/tRilRCjZJOi4SV78rBoe2InyaM7PtX9OeJWIZ2JgcROGg38cFNPeNcHAnOOL2xZGR6QyKoYj4F1x+Uyl1kIdY9TKU6vSdKn4yF53W0oRWv3kXW3Pa3xkJT0jAeUt5txGur7BU00gcL7drevkD0Lnsn/kjLaIcxfoVhCBZHtHnfkF8GoXcoesgdkV1LrpgAIAylig1B0Kbcnu4Powt2lOx5Q1GeDqGR5EnIhBdKnTo5Y4A9zM4M9ud+1eYPdmCmvj7K8Mq8P6fHO/vqS6FSPoAUW9WvkTGolSh9XDOjdEI16LMi5qMgyaFufhzCmzh94sN3M+/mJZv6ubPKGsjJKVNzdCLUQ8Ht3VwDs/0FocSulZlhardAYQztROO5A45cGx0nXAJHKYCU8wSMvILNVCsZxyLNLDnTuGTBe5jFAq4c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(5660300002)(966005)(8936002)(450100002)(6486002)(478600001)(83380400001)(1076003)(86362001)(8676002)(956004)(2906002)(36756003)(7696005)(26005)(16526019)(52116002)(186003)(316002)(66946007)(66556008)(6666004)(66476007)(2616005)(38100700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?B1NI1Ls9/w30qehkEQgGGFrGWi5NBs0VTha12NVZY8zuZ71wyhwUr+q13Kvr?=
 =?us-ascii?Q?ApbdzRAlDI7IT/RVw049e2j9TDBTROD4eMC7ie6tWeql0WW5q0apKuFQiT2J?=
 =?us-ascii?Q?4om5rT0u+EATK8/6PmCBkPWLa+xY/tRreHkITsXJs1lGL/buCrQrK35dLBpz?=
 =?us-ascii?Q?0cBouMF3KbYp7Qohv7wUgxJ2x8v7KYUt2Ln7DnQNEbSTfQ8n1FKb5h7+UtiS?=
 =?us-ascii?Q?ClkxwNuAcztoJfNael/V6jh/WEUAav4B+VqSJy+BiyM6VTuupRpNUOosH0u4?=
 =?us-ascii?Q?uqY533BgEb82WvOBzElWpt1lomHfWOzYX+fbMzKJa5lXg4diW/N72x3WZVNs?=
 =?us-ascii?Q?YOTNBe6I2kC/9LYQzmrGL5Rs3glblo4K3PZqWMc5y5l8W7PZm7Yi6eZXrEkZ?=
 =?us-ascii?Q?tcHejVwpPkuYAdPtUt8D3IcNbTd95YZO2rU/ZCiTY5gg19fsvFhoScWXJgAR?=
 =?us-ascii?Q?93D3JHJJj1cC0gIEm9YjZ+LbWqLfhpN9UUQPT3eXwkrdmPQRREHHT/zbX2lq?=
 =?us-ascii?Q?p2JA0yE6BpMepUfqCXpZKOBn6PHHNz/Cj8nWxusfI1+RIUACZVvIyRpPkL3b?=
 =?us-ascii?Q?xW7j+X4Phh7i6SUX6K3i6Leh7H3AlCcDZOcpgeaj1qeAUVZi6UCTIFl9PU7N?=
 =?us-ascii?Q?yx4wwDaElWBe6XD4605ChITMhY2W1TiCN56QR93Mk8niYO6x0WYZC6KvcEmo?=
 =?us-ascii?Q?pp3noaaJIexvuFf2Tkm/QYkRs+AqgrAEM6CObT6HJjcRjkwDgI/Iwqtytfo4?=
 =?us-ascii?Q?qGo6MGpOeMeGJbW0q+ZPG0v8c0u0d7VHHPW6dS70/nMIaPbZxO6VAMiH0Hrm?=
 =?us-ascii?Q?iXKlh2NK0XDjUHsQZMUn6ikfBZQBBdKrHI2zdNXN6RWRuJBZ9LpAPcTjrxaR?=
 =?us-ascii?Q?tyYgwR5oGT0eAsgZe9QN5lRf6xFCdB0B2dMmzsSW1yMKBmhh1XqfI+kIbaxd?=
 =?us-ascii?Q?e9DlhnkGRQ4f+2Uroag6gz5vFc8dzQ9Rxa+alZxDCpGDp1hv0vrHu10issfn?=
 =?us-ascii?Q?NZtOmBhba+7EuMj0ZhhfToNQ7bg0KVayzqsEvXTV+lv7pt7a5X1YXnEBY9Ot?=
 =?us-ascii?Q?1Q+nAQ5I/cNNB79AxeDwKDaSiC93WwN/IKTYbLzd4d8/e5wqfxf5/97pBOsU?=
 =?us-ascii?Q?Mr7xJNlo+L3KmHXt1SlWUK6LNzPbt71rccD2QDqllqH2ss9hssc/egJo5Z+T?=
 =?us-ascii?Q?RN12Rea7kaBk3ZjnnEi5X7m3wMiNCj+Qa54PHyntNuw7dPRgoyvwdFXSBH6g?=
 =?us-ascii?Q?se+gCw00lS0/RGT7wj7jFe6PVaArtYGgwKasR50padn1Xrj7ECJ9wQdO8JGz?=
 =?us-ascii?Q?zVirlDjyM6sNOThir+hKB+a+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e98f68a7-f6bd-480c-74b5-08d8ed22aee1
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:29.3867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JM0Q+vEz9GZEbeQoRyLsVgesNkwr6NR0QjgnTVH9YcK5bT0ynIEUFRiv7e9WMJ3sW/gS7jWVa414XxxBC3LpDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3935
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

Since the last patch series I sent on Jan 6 a lot has changed. Patches 1-33
are the cleaned up, rebased on amd-staging-drm-next 5.11 version from about
a week ago. The remaining 11 patches are current work-in-progress with
further cleanup and fixes.

MMU notifiers and CPU page faults now can split ranges and update our range
data structures without taking heavy locks by doing some of the critical
work in a deferred work handler. This includes updating MMU notifiers and
the SVM range interval tree. In the mean time, new ranges can live as
children of their parent ranges until the deferred work handler consolidates
them in the main interval tree.

We also added proper DMA mapping of system memory pages.

Current work in progress is cleaning up all the locking, simplifying our
code and data structures and resolving a few known bugs.

This series and the corresponding ROCm Thunk and KFDTest changes are also
available on gitub:
  https://github.com/RadeonOpenCompute/ROCK-Kernel-Driver/tree/fxkamd/hmm-wip
  https://github.com/RadeonOpenCompute/ROCT-Thunk-Interface/tree/fxkamd/hmm-wip

An updated Thunk

Alex Sierra (10):
  drm/amdgpu: replace per_device_list by array
  drm/amdkfd: helper to convert gpu id and idx
  drm/amdkfd: add xnack enabled flag to kfd_process
  drm/amdkfd: add ioctl to configure and query xnack retries
  drm/amdgpu: enable 48-bit IH timestamp counter
  drm/amdkfd: SVM API call to restore page tables
  drm/amdkfd: add svm_bo reference for eviction fence
  drm/amdgpu: add param bit flag to create SVM BOs
  drm/amdgpu: svm bo enable_signal call condition
  drm/amdgpu: add svm_bo eviction to enable_signal cb

Felix Kuehling (22):
  drm/amdkfd: map svm range to GPUs
  drm/amdkfd: svm range eviction and restore
  drm/amdkfd: validate vram svm range from TTM
  drm/amdkfd: HMM migrate ram to vram
  drm/amdkfd: HMM migrate vram to ram
  drm/amdkfd: invalidate tables on page retry fault
  drm/amdkfd: page table restore through svm API
  drm/amdkfd: add svm_bo eviction mechanism support
  drm/amdkfd: refine migration policy with xnack on
  drm/amdkfd: add svm range validate timestamp
  drm/amdkfd: multiple gpu migrate vram to vram
  drm/amdkfd: Fix dma unmapping
  drm/amdkfd: Call mutex_destroy
  drm/amdkfd: Fix spurious restore failures
  drm/amdkfd: Fix svm_bo_list locking in eviction worker
  drm/amdkfd: Simplify split_by_granularity
  drm/amdkfd: Point out several race conditions
  drm/amdkfd: Return pdd from kfd_process_device_from_gduid
  drm/amdkfd: Remove broken deferred mapping
  drm/amdkfd: Allow invalid pages in migration.src
  drm/amdkfd: Correct locking during migration and mapping
  drm/amdkfd: Nested locking and invalidation of child ranges

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

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |    4 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c  |   16 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |   13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c        |   83 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h        |    7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |   90 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |   48 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |   11 +
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c        |    1 +
 drivers/gpu/drm/amd/amdkfd/Kconfig            |    1 +
 drivers/gpu/drm/amd/amdkfd/Makefile           |    4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  173 +-
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c  |    4 +
 drivers/gpu/drm/amd/amdkfd/kfd_iommu.c        |    8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |  922 ++++++
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h      |   59 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |   54 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  191 +-
 .../amd/amdkfd/kfd_process_queue_manager.c    |    6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          | 2865 +++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h          |  175 +
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c     |    6 +
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h     |   10 +-
 include/uapi/linux/kfd_ioctl.h                |  171 +-
 26 files changed, 4681 insertions(+), 249 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_svm.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_svm.h

-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
