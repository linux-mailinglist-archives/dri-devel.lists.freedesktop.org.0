Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F203B66F7
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 18:47:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E1C6E4CA;
	Mon, 28 Jun 2021 16:47:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40506E4C9;
 Mon, 28 Jun 2021 16:47:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fd+k30fhtqq1U9Fgds+yWflHzIFlDYRo/kNZr8B7TnbpVAcuEXMb4elql7sKbdcxguIqRprY9iV9xWr1nf5HNo/yr58YyIkrBNf01WiKo/L1BlNoE2jP5qX0U7avdS9fpjyHxaS+QhH1y/vrpuoNahtxIQBVeEgINVPXavpv2aM+R5uHXoQ5DdXLJO+WAkuEi/3WwNv3cOY0C7u7pLpeBVTVAirDFL/Q+rHRF/qTmndOhNRkM/nYeUV2oVe2xwB0s4hDbPbs1xYp/mYdZ7V8RcYHZdPoJJIPKkI68RYp1nmmUjNQ1n9K576gehCltLqrmoAJjTBLsE2xnlafJCa6cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6xa9nBhRPhAbXzugk+lM3GMXBxPAV3UekqYIKTOlWc=;
 b=TflTfz+2u/S8IsYPJJc0/hbRt1z1/r/AKmgn6ai7GSvVWn/P+/h5Nw7Ru6+lcf0XvHsstIVRLq4/fCRtM/DObOLUvkaOZ3puflD14o/5MMG2vqBszgHSrUGwf6ZHQfG/M01k0kUri2gBMdK8+bIBjwDs6cz1RoiN0V0+7mPCD4/Bdf7uCKkYm6qV82nXisfV2/irMSYZjxsHo79kDFUAbyHX1NUkR/FqM2TXrk7IyNq1wa9wvKHEiZJ+ygil4FqIGtemfc00poHOmUka/Gzqce1KHdoyvZRzNIn7qBEFVYCu0mBI8mYwHLo4vdCIe6s5YM0n7iK5HyTYxJse4Xx7Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6xa9nBhRPhAbXzugk+lM3GMXBxPAV3UekqYIKTOlWc=;
 b=mV2XbJ6GCKvtnxgrcEc/o11zIXwKKBO62A6ggocLLLAqZlz94iY5+PSLPcZBBSNxXL0ZLNYAR72+ztytB3NaiF5hRsYaoa7pucQrMC4uGXzxwuDbP9JbTqhOmY0XRZ979NrA0EA2GEHnTKS949xfDvZELFob4QZDSDui+tgbaeM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5211.namprd12.prod.outlook.com (2603:10b6:408:11c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Mon, 28 Jun
 2021 16:47:02 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd%6]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 16:47:02 +0000
Subject: Re: [PATCH v3 2/8] mm: remove extra ZONE_DEVICE struct page refcount
To: Ralph Campbell <rcampbell@nvidia.com>, Alex Sierra <alex.sierra@amd.com>, 
 akpm@linux-foundation.org, linux-mm@kvack.org, linux-ext4@vger.kernel.org, 
 linux-xfs@vger.kernel.org, "Yang, Philip" <Philip.Yang@amd.com>
References: <20210617151705.15367-1-alex.sierra@amd.com>
 <20210617151705.15367-3-alex.sierra@amd.com>
 <7163dbb6-67b5-6eef-5772-500fd2107e5c@nvidia.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <cecd2164-ebfd-382b-af73-992cdc4304b7@amd.com>
Date: Mon, 28 Jun 2021 12:46:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <7163dbb6-67b5-6eef-5772-500fd2107e5c@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [142.186.84.51]
X-ClientProxiedBy: YTOPR0101CA0009.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::22) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.186.84.51) by
 YTOPR0101CA0009.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Mon, 28 Jun 2021 16:47:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7479cdc7-c6ed-431e-8b72-08d93a545a74
X-MS-TrafficTypeDiagnostic: BN9PR12MB5211:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB5211C013EE36A1D13AAACBFD92039@BN9PR12MB5211.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /NR3t/uGbDaaIgg8ksVn/h+K83WHFeFoNel23/yWfhDcqb8Bt1WJtgsXQ5O3p5dAW7I8GAIKaLN/7zP9umDTTmvKkcNZ44j++fcDkr/q8mn8Nyel7z0cXckSvVCcqWZZdIrafpopfweP5mFkg3Fcc2oJ3sqx7YM1SN/83QiV0aBl5XZAVOmrmRmeOIM53Fd6QxItIrAoX1uzsyTceavolJrSIzqqVQEscyLgiUx8EAkQf6ecIls3rLg5dYeXuz5y/fovd88AcsZVJoB9GmnNPM8xhIJfuCJC9VoMNXJbpaVrKi6ta1S58qM3RnhgCXEZgDpAWoOsXTpshLoRNKS8PnTRALW9nmD/Qhth5T9CWZ9qkYhojEcC9wUNHlocsF4BTAl2bXBUxkibbmCW1PnwvzuSSB7Jb5F8d1H916Qnn7/OqzXrEldzVo00Z4zYyIS7C29mtQMyx6qfSyXhK/esDb/1cuVsJ2qsYop8sds7twTZTXtLHv2BBYCjZgBzP5zvEgg4noMNRUsoqpiKl0tv4k8BaJoZM5NenjTGXJYlnu/PLYNtF8HoKZaEhHlErkKM2lnRlCMO1hmZikhe2+mrNMx0cS2OXexrofeyycSJjAdlFVTD8yAtyCDMSFyVgUBRbdr+evUgGeXticsIRDx23MtNcNdLBU6qJ6H4V4C1NpRU2fb/7PjvXwWmBsucvE0/7mJqEORaXYmK9W65avq9gQI/ZxphUz/uUzDGURhUAOo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(316002)(16576012)(6486002)(26005)(7416002)(110136005)(16526019)(186003)(38100700002)(4326008)(83380400001)(956004)(478600001)(8676002)(86362001)(5660300002)(31686004)(44832011)(2906002)(6636002)(2616005)(31696002)(66946007)(36756003)(8936002)(53546011)(66556008)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWdHWXdxZ25sNlhna1MyQWJCYVpFT0tJRkVEdmUzZUZaSzVQRFpmZUFWOVFF?=
 =?utf-8?B?OHBrSUlHOEY0dFZFOHBPaExhdTgydDRwRnRWQmtVd1ZjVWtqL3NlUk1uOEg5?=
 =?utf-8?B?alU4TEM2ZmFzdklSa1lEb2NYVkRtZDRvZzMxUVRvN0U1MElicXVQaS9UQ2c4?=
 =?utf-8?B?M2xiWklzNGo2eloyb1VxL0twdGpSVHVrQThsUU5rbDFCRHdhZzJ0VTNZSU5u?=
 =?utf-8?B?RFJTbm9sbFc1R0M4OHJNQVpQSzFTM3Q5YzNRVmJyOXJhbEpWR1FESWI1WUJC?=
 =?utf-8?B?WHhhU2R0bmN5WjFwa01Zdm8zQWdnbUwyVTlmS3kvcUxGVEp6TG5wL0tQYlQy?=
 =?utf-8?B?MlhOSlUvdmZOeWdKS1BvZnFLWFZCajkvOTYvOTVDTFJzc3ZJTThTMlFQcVBQ?=
 =?utf-8?B?WE1xeTg5bFc2YWVpZ0ZPTWtxZzRqcEJDU3c5blNJWDVPb0RtOFFXVjRub3RG?=
 =?utf-8?B?RzlDbmxsNkpwMmkyb2ZqRTE3bnpLNkhhbjV1ald0V0RQSjhEZDEzZ042MmpP?=
 =?utf-8?B?VzliRWZ5cHNJVnUzTytXZ3FOUmRBODByVVMzQVpEZG52SjNKOTFTQzdJd2t0?=
 =?utf-8?B?amxESnpMMytxeHZvc0d4WnNxVHVZSFVmU1pEY2lwUFNDU1h2SUZYcVpwa3N2?=
 =?utf-8?B?dGh3bjIxajF4alRWdmRQYUlEdkVBSHBYWkxLemZUUWF1RTJqbG5GeW0ySUo4?=
 =?utf-8?B?ejgzV0FOUjRGK2NKMCtmL3dOL0FwUUtJTUFlUkRJb1JuS1c3Y1RFWHluNFhR?=
 =?utf-8?B?cjBSa0tvZ1oxOXlxcHBKT1dyWnFlNzBMbjVhdWpYWWZMYTZtVnloZWduaXBR?=
 =?utf-8?B?NlhxK1N6dlE0cnlHQnpycktWTytIeVJzbVZRb1cwY1NYMmRsLzhnN2w0dFlj?=
 =?utf-8?B?MzhTWXJSdXMzU1hkQXlscEpJMHhIZE9HWU5KOVhFSmdNckorblVndjN6MWxW?=
 =?utf-8?B?Y0RGWllFbjFJZ1JZT1V2eENla3FpUmRIVXNSai94NE9uVnN1L2QvRlM4bkpH?=
 =?utf-8?B?M3R2YkVZU3NOekRGVUROeExEalBjSm1aY0ovcXFkSnlYRDcwMUhQVUtVRUNR?=
 =?utf-8?B?MDd3dSs2V1FOZThuQ0FZaFovRmZDbVR1Mmp1bTBaOG9uUTI1VDNGY3hoci9i?=
 =?utf-8?B?L0J6NzlRYmFncUljTG43YUdScWkzcjdtbGc3VFVNNEE5TDFnU1JzK1R3Qnk4?=
 =?utf-8?B?UUd5R0JuK05Zd0N2MU5xdFRMRWt1TkwrMFFkdHdDN2V4Q3dRUG1TNnlBSkFw?=
 =?utf-8?B?RDd2WmI5UFQxcE02V05LWXBNbEZIdytqd1REYnZETmRHQVVBOEZWVmdlM3RV?=
 =?utf-8?B?dVlFTmFnTld6dzI0cXlYVDdWM1ExaW1FWVZzZDFTTTc3bWkwTjRVdVdkUGRi?=
 =?utf-8?B?UnRtT3E2cERjVXZQREpUdGc2RWRKejF1b1cydFAwOVgzaWZzVmdzeTIvZWxO?=
 =?utf-8?B?Tkphd28rellIZE1hVEFJZ0gvWkF3WlBjaGRiR0phWDZoc0hCZEhWU1hDY2xk?=
 =?utf-8?B?NEtSdjhqT2p3Z1E3ZHpLMFpOQ29tV01SN05RM0p1S2lRWmtTTklraURyODdC?=
 =?utf-8?B?eDB5VlVuai9oTWZmZ0ZvZitLMkdKRmtwd0hmNEFjSjBhRFA2dW9MVFhSMTAv?=
 =?utf-8?B?ZlNrTEFldHB5aUF1cXF6dFY0U0tGV1lSRy9BQThmVGNESXM5T3pOb3h1Y1lR?=
 =?utf-8?B?LzFzWlhwb3JzRFF1Rm5uRUU5VlRYM3R3UE9QS245ODkyWUNaeEhLVFJQZ3o5?=
 =?utf-8?Q?He4bFy7utaHOf1pmhQn9wFr33oa2pUGB+rq+x2a?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7479cdc7-c6ed-431e-8b72-08d93a545a74
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 16:47:02.1087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9CFlwEuYWaNAl2aHlm31gbOgkdpjwdw9ar4WlDQA9RYcEvPIs1iYdodtcaRBpLVFZBmCKx3+2NsyUsHURc6XZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5211
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


Am 2021-06-17 um 3:16 p.m. schrieb Ralph Campbell:
>
> On 6/17/21 8:16 AM, Alex Sierra wrote:
>> From: Ralph Campbell <rcampbell@nvidia.com>
>>
>> ZONE_DEVICE struct pages have an extra reference count that
>> complicates the
>> code for put_page() and several places in the kernel that need to
>> check the
>> reference count to see that a page is not being used (gup, compaction,
>> migration, etc.). Clean up the code so the reference count doesn't
>> need to
>> be treated specially for ZONE_DEVICE.
>>
>> v2:
>> AS: merged this patch in linux 5.11 version
>>
>> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
>> ---
>>   arch/powerpc/kvm/book3s_hv_uvmem.c     |  2 +-
>>   drivers/gpu/drm/nouveau/nouveau_dmem.c |  2 +-
>>   fs/dax.c                               |  4 +-
>>   include/linux/dax.h                    |  2 +-
>>   include/linux/memremap.h               |  7 +--
>>   include/linux/mm.h                     | 44 -----------------
>>   lib/test_hmm.c                         |  2 +-
>>   mm/internal.h                          |  8 +++
>>   mm/memremap.c                          | 68 +++++++-------------------
>>   mm/migrate.c                           |  5 --
>>   mm/page_alloc.c                        |  3 ++
>>   mm/swap.c                              | 45 ++---------------
>>   12 files changed, 45 insertions(+), 147 deletions(-)
>>
> I think it is great that you are picking this up and trying to revive it.
>
> However, I have a number of concerns about how it affects existing
> ZONE_DEVICE
> MEMORY_DEVICE_GENERIC and MEMORY_DEVICE_FS_DAX users and I don't see this
> addressing them. For example, dev_dax_probe() allocates
> MEMORY_DEVICE_GENERIC
> struct pages and then:
>   dev_dax_fault()
>     dev_dax_huge_fault()
>       __dev_dax_pte_fault()
>         vmf_insert_mixed()
> which just inserts the PFN into the CPU page tables without increasing
> the page
> refcount so it is zero (whereas it was one before). But using
> get_page() will
> trigger VM_BUG_ON_PAGE() if it is enabled. There isn't any current
> notion of
> free verses allocated for these struct pages. I suppose init_page_count()
> could be called on all the struct pages in dev_dax_probe() to fix that
> though.

Hi Ralph,

For DEVICE_GENERIC pages free_zone_device_page doesn't do anything. So
I'm not sure what the reference counting is good for in this case.

Alex is going to add free_zone_device_page support for DEVICE_GENERIC
pages (patch 8 of this series). However, even then, it only does
anything if there is an actual call to put_page. Where would that call
come from in the dev_dax driver case?


>
> I'm even less clear about how to fix MEMORY_DEVICE_FS_DAX. File
> systems have clear
> allocate and free states for backing storage but there are the
> complications with
> the page cache references, etc. to consider. The >1 to 1 reference
> count seems to
> be used to tell when a page is idle (no I/O, reclaim scanners) rather
> than free
> (not allocated to any file) but I'm not 100% sure about that since I
> don't really
> understand all the issues around why a file system needs to have a DAX
> mount option
> besides knowing that the storage block size has to be a multiple of
> the page size.

The only thing that happens in free_zone_device_page for FS_DAX pages is
wake_up_var(&page->_refcount). I guess, whoever is waiting for this
wake-up will need to be prepared to see a refcount 0 instead of 1 now. I
see these callers that would need to be updated:

./fs/ext4/inode.c:        error = ___wait_var_event(&page->_refcount,
./fs/ext4/inode.c-                atomic_read(&page->_refcount) == 1,
./fs/ext4/inode.c-                TASK_INTERRUPTIBLE, 0, 0,
./fs/ext4/inode.c-                ext4_wait_dax_page(ei));
--
./fs/fuse/dax.c:    return ___wait_var_event(&page->_refcount,
./fs/fuse/dax.c-            atomic_read(&page->_refcount) == 1,
TASK_INTERRUPTIBLE,
./fs/fuse/dax.c-            0, 0, fuse_wait_dax_page(inode));
--
./fs/xfs/xfs_file.c:    return ___wait_var_event(&page->_refcount,
./fs/xfs/xfs_file.c-            atomic_read(&page->_refcount) == 1,
TASK_INTERRUPTIBLE,
./fs/xfs/xfs_file.c-            0, 0, xfs_wait_dax_page(inode));

Regarding your page-cache comment, doesn't DAX mean that those file
pages are not in the page cache?

Regards,
  Felix


