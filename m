Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4905D3AB800
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 17:56:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6646E2D5;
	Thu, 17 Jun 2021 15:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2080.outbound.protection.outlook.com [40.107.93.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF3F6E2D5;
 Thu, 17 Jun 2021 15:56:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a41bWvB7ykb76vSZbesuckFxfDOurgd8SjiAPZMQZMWaykCGriycta7iAH5UEGYeZ72I7tK0pScBe2BdB0A9xI/JRVnQpRZDTJdOw3lChTfMbnB0lCshac6vpVT1TXmKffy7ti0Orm7uqWqX4ynwjEPgV/R2TevVsKMzFDl9tpkDGHx6g5Fvwo3gRTqSfaJGuOJfPRBAyfHnDKaFJYIJNOzoejCOEC2ln2fTRa8Z4Yj0R2uerpYep8F523IMWVzugOsDWGCgwOrtelXIDyWvWBzHQ08DQC8Ja/o22Qi11HxiWsRvnFR4CxcK88CJ7LvzSEcJ+eo+KHpCx1T/QzHLnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cOkTr4Kl6SlhwHgAG8nAuma6ebCpCn/ek+GIvZ0HRYY=;
 b=bE01sbJ4gniNxpzRVcyWaEuhhqG3NpbvQhaoBLOfG9HaghKNM3Dlk8q7x84OHr51hfC5oatV5HYur3x4GUcFc4C++ZONp6LOI6h6ZcwYQarxxmSrlYE1FMKndwPEXtK4QyOZ+niQy51fpoBgiHIT2XyHUPiy6JPxDCWdKQFmNsci5DOQ5WzKgC7drQDQqm+FJJ+f2Kjlg17JCcUEVzx4P/fDU8MpzYfkIbqqWVmGq/MEow1DC3fxbmqcZ9gsqyKi+AGH58DA6uFc4b1KrH5+vZfqXFsZ+e9XFlA821hr+1sJD6Sau2MbDoGp0DK0trf9mh6HA3J3zStY2pufjygQyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cOkTr4Kl6SlhwHgAG8nAuma6ebCpCn/ek+GIvZ0HRYY=;
 b=fyP5pku8kk1z+tdVW4G73mqdc1YWrexBUCCOTUknh1QqVPF+6KLoWpMzlXpcXOj1I2LtmdyWIus/8ZSWy/NlKnAfK7QPuI2EccXiY/Ar7vspbHtjJ4bqEC4jzypU3kIzCfPCOoK2CLpoPqEEUuxYBoFd+S+1HzOZ5TyqU2GV048=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4419.namprd12.prod.outlook.com (2603:10b6:5:2aa::20)
 by DM6PR12MB2634.namprd12.prod.outlook.com (2603:10b6:5:49::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Thu, 17 Jun
 2021 15:56:06 +0000
Received: from DM6PR12MB4419.namprd12.prod.outlook.com
 ([fe80::b972:f4d6:9db3:5761]) by DM6PR12MB4419.namprd12.prod.outlook.com
 ([fe80::b972:f4d6:9db3:5761%2]) with mapi id 15.20.4242.021; Thu, 17 Jun 2021
 15:56:06 +0000
Subject: Re: [PATCH v3 0/8] Support DEVICE_GENERIC memory in migrate_vma_*
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
References: <20210617151705.15367-1-alex.sierra@amd.com>
From: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
Message-ID: <6c49988d-e158-8297-d7e4-97db279458cd@amd.com>
Date: Thu, 17 Jun 2021 10:56:03 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210617151705.15367-1-alex.sierra@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [165.204.77.11]
X-ClientProxiedBy: SA9PR13CA0137.namprd13.prod.outlook.com
 (2603:10b6:806:27::22) To DM6PR12MB4419.namprd12.prod.outlook.com
 (2603:10b6:5:2aa::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.9.47] (165.204.77.11) by
 SA9PR13CA0137.namprd13.prod.outlook.com (2603:10b6:806:27::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.7 via Frontend Transport; Thu, 17 Jun 2021 15:56:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c76a64f6-9a2f-4744-2bf1-08d931a86a65
X-MS-TrafficTypeDiagnostic: DM6PR12MB2634:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB26343EF635AA4FC342CB2629FD0E9@DM6PR12MB2634.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1YtlQwm5GIPu5iOKxQ2Ka8N4YrDr21f9BrPkAPLmIQeGPa6pwQq3ochPeOJFuMfvXuRUBIvz7a9mzrw9v6mqr/E71ph3InOWNneaN09pqxhqE7pBKXRg2fVH0ESKS7jdo3/M3lqtmu9djb1OujFmiUYnBhvSfx16WtQs0h5HK5eBW0SVbjXrsqxVnUldfzZpfAoIIJXF2hPdwQXJYwUC01ggJAWlgsOlFkB72iEI8dSU9CmmWmuEhluGuvPwp2C1TgC1gRLadu7WbG/zXrqkE04z0sWk5qyng9cjsFz9h3OGtUMLNxwCoij5FDCsWDt78g+SgDId5HjtNnFymraoBmGVJr6GAg7AlwVrIP1ZeqD7/j9+5CVYeUu3hB35fVCzd4eRurBMarEyf9tnKdUYjRVcnFb/r0txAN0BBEqYPnt4mp6E6ln6pd5jJkNehP2Ri10aTlOQ/H3yEhbTrZEDIjZxA1MUgF50aN7VX7EcI8Utxk5/9XaYsRAblNmVoAa055lNmOU3HLxX6tvIF6RNClbszkMJ7231KKeLor8rXxLB/QT9MfKZygGj3GBPOlSLPZ9df+IWnvOwt/kFfTuIJZckBPL3ypJQeRgT4ZTF+/4ADaAnnoRA056sx7vLypn/vNBqwdl7uHRDJnBfPksgru3lkT8yZtqCf+97GlTjN1GtPXi4WJ9LNULS8uKxkPYsEOzxnqANYHw9lZNeb6vUclDvn09Ox5oH6JR19Jk9+rbxtJOQ1sAdqFzm7zCqUqp8ZajqwV8fHwUX/9KTMZSAAltfQkYu3zF07XV4RkHveoVHEs63+KKT3caN0S9US527pF7jW7wsI3pI0b5YEF1a4UJo/zRNLKvAteq4txw2kC2uVY0HHPOphC5FJZVv4gGx/8/uY/T2gH0rXfCwyDRziA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4419.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(316002)(16576012)(53546011)(26005)(478600001)(16526019)(8936002)(6486002)(186003)(38100700002)(2616005)(956004)(36756003)(31696002)(8676002)(31686004)(52116002)(4326008)(7416002)(966005)(66476007)(86362001)(66556008)(2906002)(66946007)(5660300002)(83380400001)(38350700002)(41533002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0htRUFJaFAydTFxQzZQYnFBYjNFSHl4b1dYTmwxaFUrejdYL0lnRjRJdmwx?=
 =?utf-8?B?aFk1cjlkRXFYVDdlQkVxeEYwWldnU1VhdW1yZ2E0VVMrWEJ6ZXBaUXJ6eFd3?=
 =?utf-8?B?OFBkaFRJQ2JZS21xTlNFb2k1K3poaXA0Z244ZkpqSXhjS00wMFhMZ3J5SFhW?=
 =?utf-8?B?bEZnbUVtNXlFa1BqeHUzYUdUb2dIbXpLTGZFTnlMNUM1UG5nZ0NXbThBdGtK?=
 =?utf-8?B?SWZtT1lZUUhiOWUyRjlodkZHczZ3VStyd2kxcTlza0R4VDhsNHVtVUFlODY2?=
 =?utf-8?B?ZUo5M0lrQUxnZlVDY09RMFJleG1MR3hVWlhpdVprWnFHVG5mRnJyR2w1eVB2?=
 =?utf-8?B?M2NXZ2NJZHhOR25PYndiSkJCWm01bytlTUc4eDZjTzFvQk9HOVBmZktJWklL?=
 =?utf-8?B?VW1TQ285Nk84ejdiT0ZXL0pMMXVMejhCblo4Qzl5a3lsRFludmRxd2VPcjlX?=
 =?utf-8?B?VDRnUmdNcEUzaW5GTFJFZHo1b2htUzFBakIvZ1dtcVFMcXovREZCa1JyRXYw?=
 =?utf-8?B?dDFCMXJ2S2xoNkVEY29aWkhxcno1T1lzMmlYSXd3dDEyTkQwVFlReWsxTi9F?=
 =?utf-8?B?YkoyR2hhNjVteHhPcHRudVRZZ2NVbU5jam1mbFFrTHFTVkhyaVFuTGI3VVAv?=
 =?utf-8?B?YmdKQU1RMVNNSWNwRlpQOUR1RnRpUlo2RTYrVURIaXBseHg1b3B2a1NadEda?=
 =?utf-8?B?cGFtMFMwSm54a05xdFk0dU1QT2Fka1gyQUhtdXRTZUM5VVpWa3FYRDRnNkM3?=
 =?utf-8?B?ZDBNMThvRkhxaE1xay9jdjNGZHNrbklNOUxEY1AvZGZWWU1YOWxrNjNSMjlo?=
 =?utf-8?B?MitZdnk0ZzR0bk1zWHZQVml5bXpQNTNqMWl1TDE0MlFKeUR3a3JQWUdUdmlL?=
 =?utf-8?B?cXJSeFBOZkJXWGtSdTBzM0h5TDJyajFTUnlZd0JyUm1xbTlwZnVBZVQ2YTRL?=
 =?utf-8?B?T09jalZBTU9HWFpLY2JpUy9WT1EzNm5PeFYyUm4xSEcyR1BrYWltWTFXTXlJ?=
 =?utf-8?B?TmRVc3luem41Z1ozNm54ODREUWZpRUU5OHEybzRkKzZzc2FlT1NqRFIreGI3?=
 =?utf-8?B?T1c4eGQwN0pieitEMi9hcU1kcWV1SVRsR051NkhUbEYxbFFtSndMaWMrb211?=
 =?utf-8?B?bVEyOGJ2amFwMENMZE5SNTBiMzlRZ09zNUlxU0l3UDR0STlGaVh4UFUwd3hu?=
 =?utf-8?B?SlZsUlBTVzhISkowMTJqQ2hUSGZBb2VObllFbXFXVTN2YUs0U0hIVVgrblZ4?=
 =?utf-8?B?SmEySXp1dVNQN2FCaGtMaHBFMGpRMFZuakJBTkZRWUZvbHJhbVZ2b2RCU0w4?=
 =?utf-8?B?OGNEV0cyaW1FWTl4QVh2ZjJUSWE5d3NLUXJBWVlxaDQ0TllYbmRJb1VQU0NM?=
 =?utf-8?B?MnE4emYvbUlxUkVTVEFETzF1eG9nT3YwVkhMYURCR2kwelNwSkZlSGFJUysy?=
 =?utf-8?B?U05NeFNVaU51eGNKcngwOGtHTXpVR01LdW5oVFdPeXd1NEtpS2ZZRUR0cE9N?=
 =?utf-8?B?WGdDOW9TdldRTjNvV0NEL0MxQ3c3VlhabW1IcUplTjVBenR3M0F4YTVYUncr?=
 =?utf-8?B?Rkw2eWdMVmNKQTdzdk1kRU5STW9ORzRQSXBHajcxOVpuZlk4dTFyV2R0Z2tK?=
 =?utf-8?B?ckZMS0puK1R4cEY0cm9qaDRiejFvaTFtNk9jZXUvMjd2T1JKWll1SHVveGtq?=
 =?utf-8?B?aWVSVVBBTytzUGRsNWtGQ2tJYU5pZFhhc0tRUlZFZjF6bVU4aXdjRmFEMzlp?=
 =?utf-8?Q?6OjPKUwPwbFoKQwA26nyRhorc7ZxbNyXtwTZ7V7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c76a64f6-9a2f-4744-2bf1-08d931a86a65
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4419.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 15:56:06.0590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zoZB1F6PdJV0UzeW62w+AlpJvgrcIh10jskmZuZFu1INvAn8SdHLcpvNCMXJvxl1NlHIG99th9CE3vmYVH6a8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2634
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
Cc: jglisse@redhat.com, jgg@nvidia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/17/2021 10:16 AM, Alex Sierra wrote:
> v1:
> AMD is building a system architecture for the Frontier supercomputer with a
> coherent interconnect between CPUs and GPUs. This hardware architecture allows
> the CPUs to coherently access GPU device memory. We have hardware in our labs
> and we are working with our partner HPE on the BIOS, firmware and software
> for delivery to the DOE.
>
> The system BIOS advertises the GPU device memory (aka VRAM) as SPM
> (special purpose memory) in the UEFI system address map. The amdgpu driver looks
> it up with lookup_resource and registers it with devmap as MEMORY_DEVICE_GENERIC
> using devm_memremap_pages.
>
> Now we're trying to migrate data to and from that memory using the migrate_vma_*
> helpers so we can support page-based migration in our unified memory allocations,
> while also supporting CPU access to those pages.
>
> This patch series makes a few changes to make MEMORY_DEVICE_GENERIC pages behave
> correctly in the migrate_vma_* helpers. We are looking for feedback about this
> approach. If we're close, what's needed to make our patches acceptable upstream?
> If we're not close, any suggestions how else to achieve what we are trying to do
> (i.e. page migration and coherent CPU access to VRAM)?
>
> This work is based on HMM and our SVM memory manager that was recently upstreamed
> to Dave Airlie's drm-next branch
> https://lore.kernel.org/dri-devel/20210527205606.2660-6-Felix.Kuehling@amd.com/T/#r996356015e295780eb50453e7dbd5d0d68b47cbc
Corrected link:

https://cgit.freedesktop.org/drm/drm/log/?h=drm-next

Regards,
Alex Sierra

> On top of that we did some rework of our VRAM management for migrations to remove
> some incorrect assumptions, allow partially successful migrations and GPU memory
> mappings that mix pages in VRAM and system memory.
> https://patchwork.kernel.org/project/dri-devel/list/?series=489811

Corrected link:

https://lore.kernel.org/dri-devel/20210527205606.2660-6-Felix.Kuehling@amd.com/T/#r996356015e295780eb50453e7dbd5d0d68b47cbc

Regards,
Alex Sierra

>
> v2:
> This patch series version has merged "[RFC PATCH v3 0/2]
> mm: remove extra ZONE_DEVICE struct page refcount" patch series made by
> Ralph Campbell. It also applies at the top of these series, our changes
> to support device generic type in migration_vma helpers.
> This has been tested in systems with device memory that has coherent
> access by CPU.
>
> Also addresses the following feedback made in v1:
> - Isolate in one patch kernel/resource.c modification, based
> on Christoph's feedback.
> - Add helpers check for generic and private type to avoid
> duplicated long lines.
>
> v3:
> - Include cover letter from v1
> - Rename dax_layout_is_idle_page func to dax_page_unused in patch
> ext4/xfs: add page refcount helper
>
> Patches 1-2 Rebased Ralph Campbell's ZONE_DEVICE page refcounting patches
> Patches 4-5 are for context to show how we are looking up the SPM
> memory and registering it with devmap.
> Patches 3,6-8 are the changes we are trying to upstream or rework to
> make them acceptable upstream.
>
> Alex Sierra (6):
>    kernel: resource: lookup_resource as exported symbol
>    drm/amdkfd: add SPM support for SVM
>    drm/amdkfd: generic type as sys mem on migration to ram
>    include/linux/mm.h: helpers to check zone device generic type
>    mm: add generic type support to migrate_vma helpers
>    mm: call pgmap->ops->page_free for DEVICE_GENERIC pages
>
> Ralph Campbell (2):
>    ext4/xfs: add page refcount helper
>    mm: remove extra ZONE_DEVICE struct page refcount
>
>   arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 15 ++++--
>   drivers/gpu/drm/nouveau/nouveau_dmem.c   |  2 +-
>   fs/dax.c                                 |  8 +--
>   fs/ext4/inode.c                          |  5 +-
>   fs/xfs/xfs_file.c                        |  4 +-
>   include/linux/dax.h                      | 10 ++++
>   include/linux/memremap.h                 |  7 +--
>   include/linux/mm.h                       | 52 +++---------------
>   kernel/resource.c                        |  2 +-
>   lib/test_hmm.c                           |  2 +-
>   mm/internal.h                            |  8 +++
>   mm/memremap.c                            | 69 +++++++-----------------
>   mm/migrate.c                             | 13 ++---
>   mm/page_alloc.c                          |  3 ++
>   mm/swap.c                                | 45 ++--------------
>   16 files changed, 83 insertions(+), 164 deletions(-)
>
