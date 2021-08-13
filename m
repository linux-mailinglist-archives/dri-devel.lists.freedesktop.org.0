Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A08EA3EB018
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 08:32:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 762466E4DD;
	Fri, 13 Aug 2021 06:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C8526E4CD;
 Fri, 13 Aug 2021 06:32:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAqHGAtxyPhCp/xLUnmdbI1JOEL6NRP9sRI7kqyw/C+vAmqGtH8EVZmAwakhpeEXeKD5Lfz2ZuLwydJ3s5KTF/geRbFc5lYMdNrrS29TuZxZ8r1TK6LuvYSA6bjel0NcfXXvYQ8XRtXEi7+aos+4Q3bp2xwBi7vgMOe5q2Hcci8zyy75BVqHjXOl/iXMGaZ/Kpn/HQITZbiRRfNQeGBlNiYcaMG2t7zQFRE8o2zNM5Jo3/GfXb5NfBTgNB/6vWvKH13uMFOGmZcDSb+VW7wINgsW7ZHULk9M5ZivL776bcfoPf3zwXtbjFxJT+h+e+5KQzTjzvOsunFs8tHEgGmcSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WonmvqEiug6jc57fMTf30E+WOAD6E2j+AWBiBhOkmzo=;
 b=iWPZlNsAc9zpuyuoC9Mq1DV/3JQYRPdMmp058OVujST0rN2Zm5riukCgNdZ8rAYUkYOmhp6tm+Q4ZhYHFnBjiD30B1gE0CiivxJJikukx1ZjJgZeRKMugcZu/JG7Kkfy8GxBZbe8dk5ecq4Ucl4Vv24DfwoRABsv5Cu34JhaH42MfALFT0OywaKQQFRNsv1NQI7peL5Eh4fC2iLklYfLKwXkLZwHSQf+PwapNXrFIaphZ4K8XnvqMU73x+srq4XG8fX/hsl7N8vunkEs7E7yuDXHiFZ7MgCtAtiWYfJw4ekyg/cDWGlOguhU02ihBqZ0JRCUjx5OmaBCc064/IZh6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WonmvqEiug6jc57fMTf30E+WOAD6E2j+AWBiBhOkmzo=;
 b=D1cMM5V6yhxVJI1cLsnj9R+xXSXuSYocJEjHEKmsDv4myb07E6KOlYsNoAG/ok0SWzqpOP66+I09yRNzVowAHbhlJAkdwDg5MN3xqLMP0HbkuEeDznob465o78itsMBgv1wSvVKk6ia3xcUHd691e/llrmxnDsN5K1+ioAKgCdE=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB2718.namprd12.prod.outlook.com (2603:10b6:805:6f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Fri, 13 Aug
 2021 06:32:02 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb%5]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 06:32:02 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v6 00/13] Support DEVICE_GENERIC memory in migrate_vma_*
Date: Fri, 13 Aug 2021 01:31:37 -0500
Message-Id: <20210813063150.2938-1-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR18CA0026.namprd18.prod.outlook.com
 (2603:10b6:806:f3::18) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN7PR18CA0026.namprd18.prod.outlook.com (2603:10b6:806:f3::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.17 via Frontend Transport; Fri, 13 Aug 2021 06:32:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4da46a32-f002-4c74-b60c-08d95e240fd2
X-MS-TrafficTypeDiagnostic: SN6PR12MB2718:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB27181874A5CB4B96A77AF240FDFA9@SN6PR12MB2718.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sq01c+VaHwGjv16eSuxsHuKVHOH7n0vob5laqd+xGfsbGeLjTIRaubSZkixUZkh7qERLwwEi5amqPGe1v2+USSYgS6+GF9ugHkYIFg8vwHrK/vULIcahsknLYxLkXYotgRnjXftZqnvXhHXySGljtxBC2jnBI0lJ91/u94iGKvNHE/SPrlPNi/xvJuDaqi5t0wlZoelFNQAke0yfTT0PVjr9M0Zh4osOkdUJ+1LvJO4+/b9YD1LQ82yRMfGHxbjDZAnDmGiTCXz+RcP9bizZROOpabtmTShQkyPM4BJcR79Gf2fqICabl7VxCs6R7ANPVIr2WYg3STKkC7sHIa61i0nB+uvMXuSSLCgXG8PILwyKkgx+UScO8KWNCbNUUrJkZ5gBP/yod6USB6T0VDScevkvDdz8Oi9p+wNpbbOYeAsRpRARcZXqpI44qtv65Xec4Og+Yr/Ws//uMv8+14Bux840W5SRcXgYy6g5e6XaFpnoWnsMfZbeMeYoUMWa8/QR6xTcE/yCyedjgfwE3vBfIts24Rww+4K2w6Kw3sNFW8M8rAGbTR27tAuTZc3WRqmaZOrLYvx62Zu04XH30KycIzDPONPUgSTL7W4I7izr9rXZhvUedeHc1BOoqlTcaeUWsX8DGS8wWfdNtYXAshFE3Nt43ft9dpfxfjlg9XPSZEGrf/2HyS++65tOvx8lrmNON8QJBuhpMGmGYTasHF+bV9LtmVHCCduMXlSSV8suIUy3rtce0VQvJcfD4tNgqgLHnS8cCNeM4EiqACANzmzO456BLKSGDg97B8SXCGcCa+L2fiivxoAMHL0vJpf5nVgoN8A23Q72gZExOgWBySLNQ7EyULr9q7iuvlnj8PKKAwE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(956004)(44832011)(30864003)(2616005)(6486002)(4326008)(86362001)(1076003)(5660300002)(478600001)(8676002)(38100700002)(8936002)(316002)(38350700002)(7416002)(2906002)(66946007)(6666004)(36756003)(66476007)(186003)(26005)(7696005)(52116002)(966005)(66556008)(83380400001)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UE5VSy9PVmlpakk1WXJRMytOaFJnU3JyWWJoODRvV2JYOG9hOTNZVk55MTdE?=
 =?utf-8?B?a1RQM3EzSE1RTjMrUEVKVjBQRENXdmdSUkhnNXNva0QzbDdkZTUxbkxyR081?=
 =?utf-8?B?TnJDaVZNRms0WEZscUxURXkvM0Q4Mmk3SmRLY09BeHQxdVdvNjd0SG1yZlRy?=
 =?utf-8?B?MzFhanp3Ky9rOFpQenJ4d1NPTXJ4bUd4S0lOWlhQTkNwWXBZdUlFVHIxTFNr?=
 =?utf-8?B?NHNMTUtndHVuNXN2c01GMEFGWkptUTNOUFhWcUU1RnNJcDlkOFVGQUQ2M0g1?=
 =?utf-8?B?MlNNK0ljVmVFa1lIL3kvdWlDeVFnN0JjMFB4OFV2a2gxNS9CUGtNNHNUaXdn?=
 =?utf-8?B?YWdZTGFNa3c4WjBDR21PRGtuMFVqU29UUGZZT0ZLTnNEM1FHbG1LZjI3Tm1H?=
 =?utf-8?B?SlcxaC85dmFPT2JmTi9lV0ZUSWRVVHZqVlpiSGo0SjFvYWxqSDZTUEM0UXla?=
 =?utf-8?B?VUVJM3h1bzV6Vk83REx4RkpxTURZc3VUbzljM3NGZW5pb1QyQVFwSHh4NEtU?=
 =?utf-8?B?NWFqdmxCZVFzazZOTUJTdzNMTEVvM3QyOTRlbDByc25lZ2JFbi9qREdnWHMr?=
 =?utf-8?B?WTVTa2k3OUgvZWYybGlvTVVpWXJaWEpjT1lTZTc5L0xSNHJYeEtkRm1MaWRv?=
 =?utf-8?B?Skw0bVZpNWx5cFQ5U2ZQclVnZ1Y3cUx6YVJLN1BDWldrdXFwS2x0R01TYzdL?=
 =?utf-8?B?S3pucW56TVJ4WTVWU0FGUVE2Vlg2cS9CUWxwMW13c3lYbzFvU2FtRHpWODUy?=
 =?utf-8?B?c2pTMVhzY1I5RFR3TlErMmtKUXM0Z1NkR0IvMEx4eU90eGVIalNFYTVONHk3?=
 =?utf-8?B?RjA3UDVIckFITjdOK2RiUFlpalhWSjQ2OEltaU5GNG9oK3Q4Wi9WbEZnMnlN?=
 =?utf-8?B?blpzd0RHSzJFUDlTYkVsUy9Felk2MXhoOXB5aHRwUVRZN3lxZEo4S0orcHhi?=
 =?utf-8?B?ZU9NUFdwZ1NMTjJaMnZkVW9nV25icmRpNGZVZytWOHN0cll3SGtoSTVGSDhs?=
 =?utf-8?B?eUxSSzFsM0RFTWVZdWd6ZjRpYmswL1ZsSU1FOUZkZmxHNjkyd1ovSGFPeUx4?=
 =?utf-8?B?dmdTWXp1UFcxWFRCWnZDMUlpZlNLOEQ1ZXJtUTFXSjg5VG0wNWdSNkZBUzNG?=
 =?utf-8?B?eGk1UUE3bEtXWEREQTBTZjJrVTQxR3hvMElOaUZvaTcrSkhBZy96enVwY25m?=
 =?utf-8?B?Ny9LYURzdi8vRzRwdS9qcDI2YVA5RVRreTBHK3NTeXh1Ty9obml0ME9sM21F?=
 =?utf-8?B?Mk53ekd3YXlnWFdnMXdVQ1lMT3FaemV1eWhYZXhVN1RRYWhTQXpGdWNQU0xt?=
 =?utf-8?B?TmZtREc3T1ZkTGZ4azlLa0xFclZUV0RUVU9MUGpqby93eVdOTWNKdnlZeSta?=
 =?utf-8?B?OExLeHYwdENnTnYxbDZaMHYzdVl0cG00K2lwK3pRTjUvVlZ4K1ExNi9rc0JT?=
 =?utf-8?B?YWxoRDE1cEswQVJrUXlOTGIraTd1cHoyMTRtNllUOGpnLzU4bHJOM0NoK3hR?=
 =?utf-8?B?aWJTcTgrUTRSNDFpOGMvZHY2VFNVd1QwT0FaRDR3RGJLWURNVkgwekowakd6?=
 =?utf-8?B?cWo2NmREUGRGYkU4THBYSFVRMEpMYnNhcFR0YkcvdTFRWDJ3ZWhib1V6enJ3?=
 =?utf-8?B?a0RoTVNkVFFzbG1EK2JzbzVHV01JQW1qRGt1YUk3a29jRUp2R2V0OE5pdklE?=
 =?utf-8?B?NEI3L1p1M1lZTmRWeWUyTUpYT1BuOW9TanB6VVVYUS9FcmxoN1BpNWZkSC9s?=
 =?utf-8?Q?cx/CCgrElNcmNRTErRXjbeA2LZQenjKedNaueOq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4da46a32-f002-4c74-b60c-08d95e240fd2
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 06:32:02.8425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ncn3fBvBn0tSeMCVy/B2Gy9ZCWVpBM2ZnnPG/VMRUQoijMwvhOirYUGTnPtRyoT2qwgxYq9UoOROsCr/P9gjug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2718
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

v1:
AMD is building a system architecture for the Frontier supercomputer with a
coherent interconnect between CPUs and GPUs. This hardware architecture allows
the CPUs to coherently access GPU device memory. We have hardware in our labs
and we are working with our partner HPE on the BIOS, firmware and software
for delivery to the DOE.

The system BIOS advertises the GPU device memory (aka VRAM) as SPM
(special purpose memory) in the UEFI system address map. The amdgpu driver looks
it up with lookup_resource and registers it with devmap as MEMORY_DEVICE_GENERIC
using devm_memremap_pages.

Now we're trying to migrate data to and from that memory using the migrate_vma_*
helpers so we can support page-based migration in our unified memory allocations,
while also supporting CPU access to those pages.

This patch series makes a few changes to make MEMORY_DEVICE_GENERIC pages behave
correctly in the migrate_vma_* helpers. We are looking for feedback about this
approach. If we're close, what's needed to make our patches acceptable upstream?
If we're not close, any suggestions how else to achieve what we are trying to do
(i.e. page migration and coherent CPU access to VRAM)?

This work is based on HMM and our SVM memory manager that was recently upstreamed
to Dave Airlie's drm-next branch
https://cgit.freedesktop.org/drm/drm/log/?h=drm-next
On top of that we did some rework of our VRAM management for migrations to remove
some incorrect assumptions, allow partially successful migrations and GPU memory
mappings that mix pages in VRAM and system memory.
https://lore.kernel.org/dri-devel/20210527205606.2660-6-Felix.Kuehling@amd.com/T/#r996356015e295780eb50453e7dbd5d0d68b47cbc

v2:
This patch series version has merged "[RFC PATCH v3 0/2]
mm: remove extra ZONE_DEVICE struct page refcount" patch series made by
Ralph Campbell. It also applies at the top of these series, our changes
to support device generic type in migration_vma helpers.
This has been tested in systems with device memory that has coherent
access by CPU.

Also addresses the following feedback made in v1:
- Isolate in one patch kernel/resource.c modification, based
on Christoph's feedback.
- Add helpers check for generic and private type to avoid
duplicated long lines.

v3:
- Include cover letter from v1.
- Rename dax_layout_is_idle_page func to dax_page_unused in patch
ext4/xfs: add page refcount helper.

v4:
- Add support for zone device generic type in lib/test_hmm and
tool/testing/selftest/vm/hmm-tests.
- Add missing page refcount helper to fuse/dax.c. This was included in
one of Ralph Campbell's patches.

v5:
- Cosmetic changes on patches 3, 5 and 13
- A bug was found while running one of the xfstest (generic/413) used to
validate fs_dax device type. This was first introduced by patch: "mm: remove
extra ZONE_DEVICE struct page refcount" whic is part of these patch series.
The bug was showed as WARNING message at try_grab_page function call, due to
a page refcounter equal to zero. Part of "mm: remove extra ZONE_DEVICE struct
page refcount" changes, was to initialize page refcounter to zero. Therefore,
a special condition was added to try_grab_page on this v5, were it checks for
device zone pages too. It is included in the same patch.

This is how mm changes from these patch series have been validated:
- hmm-tests were run using device private and device generic types. This last,
just added in these patch series. efi_fake_mem was used to mimic SPM memory
for device generic.
- xfstests tool was used to validate fs-dax device type and page refcounter
changes. DAX configuration was used along with emulated Persisten Memory set as
memmap=4G!4G memmap=4G!9G. xfstests were run from ext4 and generic lists. Some
of them, did not run due to limitations in configuration. Ex. test not
supporting specific file system or DAX mode.
Only three tests failed, generic/356/357 and ext4/049. However, these failures
were consistent before and after applying these patch series.
xfstest configuration:
TEST_DEV=/dev/pmem0
TEST_DIR=/mnt/ram0
SCRATCH_DEV=/dev/pmem1
SCRATCH_MNT=/mnt/ram1
TEST_FS_MOUNT_OPTS="-o dax"
EXT_MOUNT_OPTIONS="-o dax"
MKFS_OPTIONS="-b4096"
xfstest passed list:
Ext4:
001,003,005,021,022,023,025,026,030,031,032,036,037,038,042,043,044,271,306
Generic:
1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,20,21,22,23,24,25,28,29,30,31,32,33,35,37,
50,52,53,58,60,61,62,63,64,67,69,70,71,75,76,78,79,80,82,84,86,87,88,91,92,94,
96,97,98,99,103,105,112,113,114,117,120,124,126,129,130,131,135,141,169,184,
198,207,210,211,212,213,214,215,221,223,225,228,236,237,240,244,245,246,247,
248,249,255,257,258,263,277,286,294,306,307,308,309,313,315,316,318,319,337,
346,360,361,371,375,377,379,380,383,384,385,386,389,391,392,393,394,400,401,
403,404,406,409,410,411,412,413,417,420,422,423,424,425,426,427,428

v6:
- These patch series was rebased on amd-staging-drm-next, which in turn is
based on v5.13:
https://gitlab.freedesktop.org/agd5f/linux/-/tree/amd-staging-drm-next
- Handle null pointers in dmirror_allocate_chunk at test_hmm.c
- Here's a link to the repo including these patch series:
https://github.com/RadeonOpenCompute/ROCK-Kernel-Driver/tree/alexsierrag/device_generic

- CONFIGS required to run hmm-tests and xfstest with no special Hardware.
For hmm-tests:
CONFIG_EFI_FAKE_MEMMAP=y
CONFIG_EFI_SOFT_RESERVE=y
CONFIG_TEST_HMM=m
CONFIG_RUNTIME_TESTING_MENU=y

For xfstest using emulated persistant memory:
CONFIG_X86_PMEM_LEGACY=y
CONFIG_LIBNVDIMM=y
CONFIG_BLK_DEV_PMEM=y
CONFIG_FS_DAX=y
CONFIG_DAX_DRIVER=y
CONFIG_VIRTIO_FS=y

HMM configs for both hmm-test and xfstest:
CONFIG_ZONE_DEVICE=y
CONFIG_HMM_MIRROR=y
CONFIG_MMU_NOTIFIER=y
CONFIG_DEVICE_PRIVATE=y 

- Kernel parameters to run hmm-tests and xfstests.
These tests require to either emulate persistent memory (EPM) for xfstests or
fake special memory purpose (FSPM) for hmm-tests device generic type
configuration. This is achieved by using system memory for both purposes.
The idea is to reserve ranges of physical address by passing specific kernel
parameters. Make sure your kernel has built with the proper CONFIGS mentioned
above. Once you reserve memory ranges through these two mechanisms, they
cannot be used by the kernel as regular system memory. Until these kernel
parameters are removed. Both mechanisms use similar parameters to define
physical address and size. FSPM, however, uses a third field which is the
attribute value. Here’s the syntax for both:
FSPM: efi_fake_mem= nn[KMG]@ss[KMG]:aa
EPM: memmap=nn[KMG]!ss[KMG]
'nn' defines the size (in GB) of memory reserved 
'mm' physical/usable start address. This can be taken from BIOS-e820 mem table
'aa' specify attribute. SPM attribute is EFI_MEMORY_SP(0x40000)
[KMG]: refers to kilo, mega, giga
To find an available memory region address, you could look into BIOS-e820 mem
table. Usually this is printed at kernel boot (dmesg). At this table, make sure
you choose ranges marked as 'usable' and has at least the same or more range
size as your desired reservation. Ex. Range below has a size of 13GB, from a
total of 16GB of system memory.
[ 0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000044eafffff] usable

In our testing, we require two ranges of 4GB each for xfstests. And two more of
1GB each for hmm-tests. Total of 10GB.

Based on range above we set these two kernel parameters as follows:
EPM:
memmap=4G!4G memmap=4G!9G
FSPM:
efi_fake_mem=1G@0x200000000:0x40000,1G@0x340000000:0x40000
We alternate one EPM reserve (4GB) and one FSPM (1GB). Starting @4GB address.
These kernel parameters can be passed by editing grub file. Under "/etc/default/grub".
GRUB_CMDLINE_LINUX="memmap=4G!4G memmap=4G!9G
efi_fake_mem=1G@0x200000000:0x40000,1G@0x340000000:0x40000"
Once you have modified this file, don’t forget to update the grub.
$sudo update-grub

After booting with these parameters applied, you should see the new ranges
defined at the "extended physical RAM map" table. This is printed at boot:
reserve setup_data: [mem 0x0000000100000000-0x00000001ffffffff] persistent (type 12)

reserve setup_data: [mem 0x0000000200000000-0x000000023fffffff] soft reserved

reserve setup_data: [mem 0x0000000240000000-0x000000033fffffff] persistent (type 12)

reserve setup_data: [mem 0x0000000340000000-0x000000037fffffff] soft reserved

As you see, EPM ranges are now labeled as Persistent (type 12) and FSPM ranges
as soft reserved. 

- Setting and running hmm-tests
These tests can now be run either with device private or device generic types.
This last, by setting Special Purpose Memory.
To manually run them, on your kernel directory go to:
$cd tools/testing/selftests/vm/

To run device private, enter:
$sudo ./test_hmm.sh smoke

To run device generic, you must pass the physical start addresses for both SP
regions. In this example, these can be taken from above’s table labeled with
"soft reserved":
$sudo ./test_hmm.sh smoke 0x200000000 0x340000000

The same hmm-tests are executed for both device types.

- Setting and running xfstest
Clone xfstests-dev repo
$git clone git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
$cd xfstests-dev
$make
$sudo make install

On xfstests-dev directory, create a local.config file with the following
information:
TEST_DEV=/dev/pmem0
TEST_DIR=/mnt/ram0
SCRATCH_DEV=/dev/pmem1
SCRATCH_MNT=/mnt/ram1
TEST_FS_MOUNT_OPTS="-o dax"
EXT_MOUNT_OPTIONS="-o dax"
MKFS_OPTIONS="-b4096"

Create mounting directories:
$sudo mkdir /mnt/ram0
$sudo mkdir /mnt/ram1

Everytime you boot, you need to create ext4 file system for the emulated
persistent memory partitions.
$sudo mkfs.ext4 /dev/pmem0
$sudo mkfs.ext4 /dev/pmem1

To run the tests:
$sudo ./check -g quick

Alex Sierra (11):
  kernel: resource: lookup_resource as exported symbol
  drm/amdkfd: add SPM support for SVM
  drm/amdkfd: generic type as sys mem on migration to ram
  include/linux/mm.h: helpers to check zone device generic type
  mm: add generic type support to migrate_vma helpers
  mm: call pgmap->ops->page_free for DEVICE_GENERIC pages
  lib: test_hmm add ioctl to get zone device type
  lib: test_hmm add module param for zone device type
  lib: add support for device generic type in test_hmm
  tools: update hmm-test to support device generic type
  tools: update test_hmm script to support SP config

Ralph Campbell (2):
  ext4/xfs: add page refcount helper
  mm: remove extra ZONE_DEVICE struct page refcount

 arch/powerpc/kvm/book3s_hv_uvmem.c       |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  22 ++-
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |   2 +-
 fs/dax.c                                 |   8 +-
 fs/ext4/inode.c                          |   5 +-
 fs/fuse/dax.c                            |   4 +-
 fs/xfs/xfs_file.c                        |   4 +-
 include/linux/dax.h                      |  10 +
 include/linux/memremap.h                 |   7 +-
 include/linux/mm.h                       |  21 +-
 kernel/resource.c                        |   1 +
 lib/test_hmm.c                           | 237 +++++++++++++++--------
 lib/test_hmm_uapi.h                      |  16 ++
 mm/internal.h                            |   8 +
 mm/memremap.c                            |  69 ++-----
 mm/migrate.c                             |  23 ++-
 mm/page_alloc.c                          |   3 +
 mm/swap.c                                |  45 +----
 tools/testing/selftests/vm/hmm-tests.c   | 142 ++++++++++++--
 tools/testing/selftests/vm/test_hmm.sh   |  20 +-
 20 files changed, 411 insertions(+), 238 deletions(-)

-- 
2.32.0

