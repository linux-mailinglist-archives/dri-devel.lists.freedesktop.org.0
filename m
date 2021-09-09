Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC294044A1
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 06:55:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 538FB6E43D;
	Thu,  9 Sep 2021 04:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44456E43D;
 Thu,  9 Sep 2021 04:55:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncNJgeUy0YEH37285qi5jRGnR2QmYGWipfFE70KcR844V8vnLjJwKlmHD9YkIIVr4EH1zp8RWubPG3Oeu+p82so6dyjqKlbM89tZS/m/zKAUm6H3Jz+rC5nTEsGXeuYCBaLb++Dsk51lQXe4e+ltIBzRHkgjlJkYvNtogLlbp851Fsmnt5PIiaKb6hJwmpS1NapZjtRuwL1Morph7T9cvtXSxzDrCQR0azNPbfDPtTV69TUpTd0irWtJicvhQ9u0PWX9yL5NKB23nEA2//QL8L8DihUhJd7IggsKligBp2JaX95ch9kU+V4npenVHiQWsTcn0Mc1ywnYPpNFFYc5fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=N6GBzgUI8Hl7R7sAwq6Mknhf5rrJbjLV0Ngq//bZrCQ=;
 b=gNXTCqAvCv+cLsifFSriG1TYwhF9+4YZETJEP9ICypQw5QjsRoboe/On2XFmXhQHnNK3uAlVXuFZa+so2ZXocfaUyNRnjgRCHAvun9nAEUud2siLJBiYPaIeqNrUskY4aanl5fASks3w8AwatClJbBVYuvRS1kphV0PlSu56K9jfDAF0fG3zizYXI9G/r6Fy2qMjmWE9WVmY6xvR6w08i3ZjXZBBsLUxmsTfxZM/g5wcRdxt01VhT7Lxz/4UAHyr1Bx7CoaYzBxEfzsLYDVR34ovSwo658wRHfIKjWQjVFckXQ5vYaoc5tSk2BuoPLbpQ6jEdThryq30ihUc0CD4Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6GBzgUI8Hl7R7sAwq6Mknhf5rrJbjLV0Ngq//bZrCQ=;
 b=weeNnqIVxkQBHAZZaxqsLitAXaIr1vVfgkZneZkaME735LPPNgkvW9XdDDyLCyNLgd0z6x3V9Bl2at5gAj74SlDLWdxpPC/njLKXlKPEEJg45d0+hOZRCuNItVYpLAQDPuwSlGg2sPC+2e/5yq0XPjs9bekLnRINZD8GTjI3y+Q=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5036.namprd12.prod.outlook.com (2603:10b6:408:135::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Thu, 9 Sep
 2021 04:55:26 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::94bc:6146:87a:9f3c]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::94bc:6146:87a:9f3c%5]) with mapi id 15.20.4500.016; Thu, 9 Sep 2021
 04:55:26 +0000
Subject: Re: [PATCH v1 03/14] mm: add iomem vma selection for memory migration
To: Dave Chinner <david@fromorbit.com>
Cc: Christoph Hellwig <hch@lst.de>,
 "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>,
 akpm@linux-foundation.org, linux-mm@kvack.org, rcampbell@nvidia.com,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jgg@nvidia.com, jglisse@redhat.com
References: <20210825034828.12927-4-alex.sierra@amd.com>
 <20210825074602.GA29620@lst.de>
 <c4241eb3-07d2-c85b-0f48-cce4b8369381@amd.com>
 <a9eb2c4a-d8cc-9553-57b7-fd1622679aaa@amd.com> <20210830082800.GA6836@lst.de>
 <e40b3b79-f548-b87b-7a85-f654f25ed8dd@amd.com>
 <20210901082925.GA21961@lst.de>
 <11d64457-9d61-f82d-6c98-d68762dce85d@amd.com>
 <20210901220308.GL2566745@dread.disaster.area>
 <e6a9e3cc-9dca-946a-c3fc-f86753fe8fd4@amd.com>
 <20210902011438.GM2566745@dread.disaster.area>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <4e84bc2d-fce6-ec48-4817-36ff48030f0a@amd.com>
Date: Thu, 9 Sep 2021 00:55:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210902011438.GM2566745@dread.disaster.area>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0056.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::33) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
Received: from [192.168.2.100] (142.186.47.3) by
 YTOPR0101CA0056.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Thu, 9 Sep 2021 04:55:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7b129fc-6052-49e5-c727-08d9734e099f
X-MS-TrafficTypeDiagnostic: BN9PR12MB5036:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB5036DF41F8CC2466F38522C192D59@BN9PR12MB5036.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pSQ16ls/P3Djg5XaZugzj8+yeHq4cGfLMCDSvzFKPCmry4+UVv2zlbCh1WPWramR50Mc5ri3D+tzVI4C3g96h5L09D50bUonx/tyZRZNj6ThYWYakKgKtdOCtQiu8B5Cjof+Q8AMuR0E9k72oaLu2DHfqnJ9lKG14+lHAD9RM0fqO/KhIEJFWgbwdVQEUSjY8CgiHjJrhXYQGJassbXhFxYs3wugv0v+3fiTE+BxGzMqMAt27Zt+Tn590qwE2AEh6TGnbAyiqjRfmk6gw9v+cE5c+Gi7LL7+gBSZkMMyOdfrsj+6wwh3R67sJII/H893UMZbu3YayPqLsyqfYsREOmkjhX09asjQLYd/41NoRfwTmEe10UFja1SEFZr3Qfua9BgzHHQ8a5ZDU19GjWV2imIo1ifiloFp+CNT5lJhe2mgKW7cOb0H38jeTcAOhTgkLv+3pzrjqUtLeXtFz5EMgdu0arA2AhK+DUd4zq4aj9uR8eC4bQEApj+PVsQd3GQekWUAcVr2p9aZFbZs5mBxe3UrVIOpl7GJI8xGqs0cn4mPiTo7rabEuygOSS2P4mY00pPlesUqdi0onNq++PpqAiSrGgk9WOde6eWT0U7qCFgGpb5hkMutXk//axU0OJRkLJos1gE9oxYXDk8UOy4YWe1xUvzqeg8Q657fVs4NzmFd6LKg+TcTn7Lmy7DNlTTs9lFf5gRdc81Bq2jLVwEQCK/Z/2WCU6DiKlu6f9hnqrY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39860400002)(136003)(366004)(346002)(31686004)(956004)(38100700002)(2616005)(36756003)(186003)(66946007)(86362001)(6916009)(2906002)(8936002)(478600001)(31696002)(16576012)(8676002)(44832011)(5660300002)(66476007)(66556008)(316002)(6486002)(7416002)(83380400001)(4326008)(54906003)(53546011)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWhmMUxTWWZjTnRKQ1gzL29mb1NHd2RlRjhobzJuQnJ4RU9id3NILzBMNXNl?=
 =?utf-8?B?ZFFXdEFmNURBYWpRd3o5cXNLVW16NTVBaW4vZklKZlNPSnFrRVpsRzVvTkRv?=
 =?utf-8?B?SDErZnJvcGVhSVhWYUlkUDd4ZFAxMnU3bVkxeStSL3BrVlVmK1FhUjF4Y1RF?=
 =?utf-8?B?b1dwbGZWNDBMNEg2WmlkbEVQYTNpRmJTS1JsUTVBTWJaSkJoNGUyK0pHS1l3?=
 =?utf-8?B?UWQyNE90QVJ6SzFldmVLYytxaVBEaXpITGd0VTQrVUNyOFVneHlKb0FXUzJi?=
 =?utf-8?B?WTJReEM1bXlubHlRWkNmU1ZSMGtQWDIyZUpKaTNuQnVBaHNPZldlZVFGZGJU?=
 =?utf-8?B?N3ZHZ2JuVUFVdzN4Nk1xeDVIa25halV2V245M0c3WkxFK21LYTZoRUJWSlZ1?=
 =?utf-8?B?VzRCajZybDcvU0VQbGFvTndFelc5VWZMSno4WVVVZGk2eUtTeDRmVjZDaVVG?=
 =?utf-8?B?NnZjc1RPSDJMeW1VUlprTmJ0UzVpeUI2V3duTjFKRHZsSS9sY1dUNDRWTW1G?=
 =?utf-8?B?MmFBWjFCVVYvRWRDcVROR3BPL1ZDYllqL3JYTk54aXQ5MlpxTzk2REgyQzZG?=
 =?utf-8?B?RWR0QlI2b09nWVdMaGJVZTYzWjVtdlhUSEgyazNRQjFrQldDM3RJODNwanEr?=
 =?utf-8?B?dVBWeTRyU2hvOTlEd3hLcWFQT3EwV2F6OUprL2FqZjdya3VIalhCZ2pidEZY?=
 =?utf-8?B?NEJKZW1aRkVhVVZUMmtiU3ZFbFRTR2VPemx2RzU2SjlvdmRuS0lUa3FtTTJn?=
 =?utf-8?B?OStCZTdRMGowZ1BFK2tMS3MxbGc3K2pxTVJzMUJHQUY0SXpjakxvNHY0NTZG?=
 =?utf-8?B?ZVl5KzZkUjcyZjVaRXNtVmZNa0VnU1R1S1FzMG8zc2t6aFZrREl6ZEtPR1lo?=
 =?utf-8?B?L0NwVjN5VGdTN09NZEhUR2Y4djg2T3dPZkNJc1NHWUtDUGxUNGRveFVyUzBK?=
 =?utf-8?B?MFJnQm9oeXNsSEFDY0xTVnVOU25Gdi9LUzEzZWRIaWRvb3BZbjhad1ZVYUFy?=
 =?utf-8?B?MHVUbmEwSWRVeExzMEx5V1F4cHlFS1hhTXJjcGV1MElBTXdsRUZOc1hEYzBF?=
 =?utf-8?B?YXFES3JjMXpRMnl1ckRkNUplWXhNYWd3V2FyelBHejhnRGVEOUtPRmcxdlVF?=
 =?utf-8?B?R1VkMmdyZHVkeko1c09jRzdTTElUWFY2S2RXdFlUMzM0SXpsdzZSVVFDRVpH?=
 =?utf-8?B?MmlKNnJJMGNOd0V1NHdnbE9qVjRzWks1eTVkWDBpckxrYVMzaGJ2RzV0OGdt?=
 =?utf-8?B?bUF5T1JmdXAzT0FOcDJ2dm5lRVA3akFZb1J5RXp2RDlSdnBYbkNmNm4ySERz?=
 =?utf-8?B?Vlk0a01DbkpwbkxTa0UzRHFReFRUTElVU0tSaXJQTEx3clFma1RIK0JpWW0r?=
 =?utf-8?B?QXZOVmdNeTZ4a2lGWFdHNHBYOU1XTyt2UXhEM0RpcXZkdFB1MFZjV2F3Vnly?=
 =?utf-8?B?cWlST0lHUEExWVlqT2R5bStxa3dJVzJiamFWZytpZ3RuaitIVWRFU1MweFh1?=
 =?utf-8?B?UXRubEtyZ0hHcEJFUTBvM0Jjck5LdlhkNTZGK2pJWlFxdmxBS0R2Vkh2ekQr?=
 =?utf-8?B?M3JPNFNjbVJhYWZiN0x4MGpNZUFyL0FkakFEbDBMK0krMGcwYjhYb1B3T2hU?=
 =?utf-8?B?d3N2OUozc2VSSEx4RHh5dGc4TjRsMmVPTURCY09jRWVGTGl2L1BXWlBUTTkv?=
 =?utf-8?B?dUYvUVIySUU2cjBoRnBOVW01dmJmVG5PcE9DNC9TS0Y2amJjS0IxS3FYR25s?=
 =?utf-8?Q?GkCujqC9MMO9+LDy9V9mH+vijggVhzYrbhNE/dG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7b129fc-6052-49e5-c727-08d9734e099f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 04:55:26.0375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 84u4kBzeC9EGmZHXLYRIMxqhsJfyi8Wd4haFLVIRaB7AcJVmaJoyydroODzBtzIfxd/kpX88REUM2GB1IlOKZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5036
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

Am 2021-09-01 um 9:14 p.m. schrieb Dave Chinner:
> On Wed, Sep 01, 2021 at 07:07:34PM -0400, Felix Kuehling wrote:
>> On 2021-09-01 6:03 p.m., Dave Chinner wrote:
>>> On Wed, Sep 01, 2021 at 11:40:43AM -0400, Felix Kuehling wrote:
>>>> Am 2021-09-01 um 4:29 a.m. schrieb Christoph Hellwig:
>>>>> On Mon, Aug 30, 2021 at 01:04:43PM -0400, Felix Kuehling wrote:
>>>>>>>> driver code is not really involved in updating the CPU mappings. Maybe
>>>>>>>> it's something we need to do in the migration helpers.
>>>>>>> It looks like I'm totally misunderstanding what you are adding here
>>>>>>> then.  Why do we need any special treatment at all for memory that
>>>>>>> has normal struct pages and is part of the direct kernel map?
>>>>>> The pages are like normal memory for purposes of mapping them in CPU
>>>>>> page tables and for coherent access from the CPU.
>>>>> That's the user page tables.  What about the kernel direct map?
>>>>> If there is a normal kernel struct page backing there really should
>>>>> be no need for the pgmap.
>>>> I'm not sure. The physical address ranges are in the UEFI system address
>>>> map as special-purpose memory. Does Linux create the struct pages and
>>>> kernel direct map for that without a pgmap call? I didn't see that last
>>>> time I went digging through that code.
>>>>
>>>>
>>>>>>  From an application
>>>>>> perspective, we want file-backed and anonymous mappings to be able to
>>>>>> use DEVICE_PUBLIC pages with coherent CPU access. The goal is to
>>>>>> optimize performance for GPU heavy workloads while minimizing the need
>>>>>> to migrate data back-and-forth between system memory and device memory.
>>>>> I don't really understand that part.  file backed pages are always
>>>>> allocated by the file system using the pagecache helpers, that is
>>>>> using the page allocator.  Anonymouns memory also always comes from
>>>>> the page allocator.
>>>> I'm coming at this from my experience with DEVICE_PRIVATE. Both
>>>> anonymous and file-backed pages should be migrateable to DEVICE_PRIVATE
>>>> memory by the migrate_vma_* helpers for more efficient access by our
>>>> GPU. (*) It's part of the basic premise of HMM as I understand it. I
>>>> would expect the same thing to work for DEVICE_PUBLIC memory.
>>>>
>>>> (*) I believe migrating file-backed pages to DEVICE_PRIVATE doesn't
>>>> currently work, but that's something I'm hoping to fix at some point.
>>> FWIW, I'd love to see the architecture documents that define how
>>> filesystems are supposed to interact with this device private
>>> memory. This whole "hand filesystem controlled memory to other
>>> devices" is a minefield that is trivial to get wrong iand very
>>> difficult to fix - just look at the historical mess that RDMA
>>> to/from file backed and/or DAX pages has been.
>>>
>>> So, really, from my perspective as a filesystem engineer, I want to
>>> see an actual specification for how this new memory type is going to
>>> interact with filesystem and the page cache so everyone has some
>>> idea of how this is going to work and can point out how it doesn't
>>> work before code that simply doesn't work is pushed out into
>>> production systems and then merged....
>> OK. To be clear, that's not part of this patch series. And I have no
>> authority to push anything in this part of the kernel, so you have nothing
>> to fear. ;)
> I know this isn't part of the series. but this patchset is laying
> the foundation for future work that will impact subsystems that
> currently have zero visibility and/or knowledge of these changes.

I don't think this patchset is the foundation. Jerome Glisse's work on
HMM is, which was merged 4 years ago and is being used by multiple
drivers now, with the AMD GPU driver being a fairly recent addition.


> There must be an overall architectural plan for this functionality,
> regardless of the current state of implementation. It's that overall
> architectural plan I'm asking about here, because I need to
> understand that before I can sanely comment on the page
> cache/filesystem aspect of the proposed functionality...

The overall HMM and ZONE_DEVICE architecture is documented to some
extent in Documentation/vm/hmm.rst, though it may not go into the level
of detail you are looking for.


>
>> FWIW, we already have the ability to map file-backed system memory pages
>> into device page tables with HMM and interval notifiers. But we cannot
>> currently migrate them to ZONE_DEVICE pages.
> Sure, but sharing page cache pages allocated and managed by the
> filesystem is not what you are talking about. You're talking about
> migrating page cache data to completely different memory allocated
> by a different memory manager that the filesystems currently have no
> knowledge of or have any way of interfacing with.

This is not part of the current patch series. It is only my intention to
look into ways to migrate file-backed pages to ZONE_DEVICE memory in the
future.


>
> So I'm asking basic, fundamental questions about how these special
> device based pages are going to work.  How are these pages different
> to normal pages - does page_lock() still guarantee exclusive access
> to the page state across all hardware that can access it?

Yes. The migration API guarantees that pages are locked during the
migration. The driver code doesn't touch the page state itself. It only
uses the migrate_vma_* helpers to deal with that.

This is not new or changed by this patch series.


>  If not,
> what provides access serialisation for pages that are allocated in
> device memory rather than CPU memory (e.g. for truncate
> serialisation)?  Does the hardware that own these pages raise page
> faults on the CPU when those pages are accessed/dirtied?

Yes. This is done by the hmm_range_fault API, which the driver calls in
order to populate its device page tables. It is synchronized with any
mapping changes through mmu_interval_notifiers.

This is not new or changed by this patch series.


>  How does
> demand paging in and out of device memory work (i.e. mapping files
> larger than device memory).

That depends on how the device driver handles device page faults. The
AMD GPU driver can handle recoverable device page faults and update the
device page table on demand with updated pfns from hmm_range_fault.

This is not new or changed by this patch series.


>   How does IO to/from storage work - can
> the filesystem build normal bios out of these device pages and issue
> IO on them?

DEVICE_PUBLIC pages introduced by this patch series, are CPU and
peer-accessible like normal system memory.

DEVICE_PRIVATE pages are not CPU or peer-accessible. Any access to them
would go through the CPU page fault path and cause a
dev_pagemap_ops.migrate_to_ram callback into the AMD GPU driver to unmap
the memory from the GPU and migrate it back to system memory.


>   Are the additional constraints on IO because p2p DMA is
> needed to move the data from the storage HBA directly into/out of
> the GPU memory?
>
> I can think of lots more complex questions about how filesystems are
> supposed to manage remote device memory in the page cache, but these
> are just some of the basic things that make file-backed mappings
> different to anonymous mappings that I need to understand before I
> can make head or tail of what is being proposed here.....
>
>> Beyond that, my understanding
>> of how filesystems and page cache work is rather superficial at this point.
>> I'll keep your name in mind for when I am ready to discuss this in more
>> detail.
> If you don't know what the bigger picture is, then who does?
> Somebody built the design/architecture you are working towards, and
> they had to communicate it to you somehow. I'm asking for that
> information to documented and made available to all the people these
> changes might impact, not whether you personally know how it
> works....

This patch series builds on top of existing HMM work with major
contributions from several people on this thread: Jerome Glisse, Jason
Gunthorpe, Christoph Hellwig, Ralph Campbell.

Beyond the reintroduction of DEVICE_PUBLIC memory in this patch series
I'm not looking to invent a major new design here. Immediate future work
is more about chipping away on a few remaining limitations of the
implementation, with respect to migration of file-backed pages and maybe
transparent huge pages.

Regards,
  Felix


>
> Cheers,
>
> Dave.
