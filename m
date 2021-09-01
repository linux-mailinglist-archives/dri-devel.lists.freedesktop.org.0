Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA403FE596
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 01:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D774A6E3D8;
	Wed,  1 Sep 2021 23:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2066.outbound.protection.outlook.com [40.107.237.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 184546E3D8;
 Wed,  1 Sep 2021 23:07:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kuk3o8nf9D/AQOQGmXVbmlTbMu9k8Fre/PMveLnQdqnRH3yJHU0M84PZT9Fg2R290VsC5rT9djutyocjHZM79iiwpl+Ahw7biZbnwX9eKeEbHuoxP+m+iHer2x7/cxgbQrenPIL/tfKRSYudUomZ63rXlhu7Es2M+0ifoqcBu1ANMeN7NTUipggjqD66zQHeMwXFT+jnZSLGQmu4p7bnuh27ibV8pI7r8KQt7eaxQ8LWnefGId0UnDFo5semlZyfUAZ5tQ10hhRpUipNhWFDGWQs3u2HtN+pJbMLay2DOY8h9m4GboXJMxrChWaJfsxC8BN2djbbkOVMQnq7cpSL9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9mGnP4zcvqLblZBTKeRNvjAwGkvdqYqhhLc3UMhixts=;
 b=oOl7o4jYf0xk7M0hDJ/CKbi9YEUQE73I6Grq3E6ka2VQXeiAtcxrO1g9qBe1WzDwI9VBbNmOyyovrumHElhyldwiMui7BZze2a52McMEaxNnoAMhp5ViqBX3tDWwnoh7eBblvZ5R1BYYqvrVUCfQtu4cYhELAff+3D+vQSPkSEkGQjaqMdCOrOo5OagRbihXl4I5e6J8kwQ1LLbkfyfRGFG6cvDnrF8RgAG63vme0ZOih/8j1sdlvOedGHCovGyPt2h3RKoiDwTlIorwSXiwZ6gmskCfbkj8H5F8jxwKON4l9UryzK5zS+udB5+ZWbQGIM3LG6mFhsTbuEiii6D3cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9mGnP4zcvqLblZBTKeRNvjAwGkvdqYqhhLc3UMhixts=;
 b=AgprL/yNd4KvPXIPkEbFqZGR/4u0mTcSeYe+orFxzdPlJ6r/037PbMuhRIaKa8iS3ARDDCVGcbGjMZSJSp4ffbAogeyGzFgba+KB2UIxJyZ9ff4nAZDR2GCWZ9rypaUh8gAiDxZyR2qGkvTIFtyfbXdoSAfjvEmji6sQDcQJFqs=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5083.namprd12.prod.outlook.com (2603:10b6:408:134::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 23:07:37 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb%3]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 23:07:36 +0000
Subject: Re: [PATCH v1 03/14] mm: add iomem vma selection for memory migration
To: Dave Chinner <david@fromorbit.com>
Cc: Christoph Hellwig <hch@lst.de>,
 "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>,
 akpm@linux-foundation.org, linux-mm@kvack.org, rcampbell@nvidia.com,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jgg@nvidia.com, jglisse@redhat.com
References: <20210825034828.12927-1-alex.sierra@amd.com>
 <20210825034828.12927-4-alex.sierra@amd.com> <20210825074602.GA29620@lst.de>
 <c4241eb3-07d2-c85b-0f48-cce4b8369381@amd.com>
 <a9eb2c4a-d8cc-9553-57b7-fd1622679aaa@amd.com> <20210830082800.GA6836@lst.de>
 <e40b3b79-f548-b87b-7a85-f654f25ed8dd@amd.com>
 <20210901082925.GA21961@lst.de>
 <11d64457-9d61-f82d-6c98-d68762dce85d@amd.com>
 <20210901220308.GL2566745@dread.disaster.area>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
Message-ID: <e6a9e3cc-9dca-946a-c3fc-f86753fe8fd4@amd.com>
Date: Wed, 1 Sep 2021 19:07:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210901220308.GL2566745@dread.disaster.area>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT2PR01CA0019.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::24) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.226.80] (165.204.55.251) by
 YT2PR01CA0019.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.20 via Frontend Transport; Wed, 1 Sep 2021 23:07:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3fbcfa1-7f8b-45b6-0577-08d96d9d49d3
X-MS-TrafficTypeDiagnostic: BN9PR12MB5083:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB508320C1751AE4078A3E36C692CD9@BN9PR12MB5083.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k1HZSz8Ti7gi74ZFW7OlmI3RJSNuFs7s5jvzEF0VzfZUcyfRynhkUjaR/l08BypQoLBllu+/iZAc3KKnVAlizdzl0+JusVc0YwmFHB3EFziEV84dSF1ZzxyPTGb4gUnxEpH4Q3/UPKlEQpf5at/XRzzgHPO4mAcjP1p5uVa8Cgk1qNrjDLdQ9x9iBzPkLDLGnASpn1ECpNm65oh9g83aJS6ypV3YVuTOxbBIH6bOKZOZuAgEf5Lo0laYTb93TzKsQhweCaiChHeG/ko0lQgUAMeQ1QqWgkhcvuVhd9TJ6qwicCyJV0lD4Fs+GOHZ4VoS8CEfKJ8hcQFjaS0IJtv+WoOA0xac9imZfu9SKhKfYJfMt5V1VJCM4IXPmKtU0rTc1NDl3G4oViC4WvhG8pZ6X/F3gnmHOVM6cxCDXjsSPYBKDugPyey1XYlK3I6AfdOxGY4yZQEcBN3KykgJdLD2eiHMCaXL4RceRrPwAPpzeaRNXXLIdLA4yvqDVYkNBjqJuLkkAyuuSBuqOp1x2uQ9S+kcun8Jy/geFpDZjeljyezWxiBnunektQm/pdDPuk3icaw++oUIdIQDRN3JXR5sq2B3Gw797S4KXH5SrnF/S8uSNjf6aMYoYki3X/XZvb16fSuQrrTtm2ZbaTSG14MdnofpOjy/P+qI79dtZErhJDAgAjX3fA0rI7cFobPYHRfAGunkT0rR7FG8fp8RT1PEDk++P4OYK3wHalfi7uzUcfI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39860400002)(346002)(366004)(396003)(5660300002)(38100700002)(316002)(4326008)(6486002)(16576012)(31686004)(66946007)(66476007)(54906003)(66556008)(83380400001)(86362001)(2906002)(6916009)(36756003)(8936002)(31696002)(44832011)(7416002)(36916002)(2616005)(956004)(8676002)(26005)(186003)(53546011)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VS9tejh3bUhRc2tQNUUrRGN1MWx4VzZwc0xObU0zWW9aWC9MSHQvd01ML2V5?=
 =?utf-8?B?S2o0aURQbktDUmZPdmNlZUxDUlpGWEQ5Q0U2MVhVd3JoVit3eUFsdGgzK25o?=
 =?utf-8?B?Z2Nic0pZUTFFWFZseTlZaWhPTFJ6bkdyREN2SVVVYmhqU2xrMkNETThZSVpG?=
 =?utf-8?B?Q3ZjbE5UNVAzS2M5VDJSc21YcER4b25WMFA0dnhVc1ZMSlVpYnVmNHFuYTl1?=
 =?utf-8?B?bWhsK3pnV0RZdnR0OHdvWHZvRGd4ZzBCU1ltNktTT3hzalo4MVRQZnVLMzVI?=
 =?utf-8?B?UmljRkh5OHIzSVVVMHI1dFgwZUdjdE53bWFXMEZXUDRHOXQwN3A0ajRzc1BS?=
 =?utf-8?B?TUdHWXFhVVd2Y0tuRkdSOXpQZFY3RmZaN0N1Z0ZuSVB4NHRMc3p5RGE2MGN2?=
 =?utf-8?B?azlxSGZuZnBxblFkWWZWWmxJaWxGTFZ0OE44Wmord3VZTXhSQS9yK0FCUXhU?=
 =?utf-8?B?dnVkNnRkd0ZkRE1HUnM5dzBDSkF0VlA4LzVaOEptYVphN2hqcW5xemRyeG8z?=
 =?utf-8?B?RE5oZEMyVUJqRWFpSjU1Zkk3Q0gzV1lZT1RGLzh3VEdKTWRQVkVvU3hYQTZ6?=
 =?utf-8?B?alloZWdVYWMwYUVxOXVMQ0pQd1ppQm9aOUxOeWFvTEwzbk1MQlVGYzM3T1lz?=
 =?utf-8?B?ZmdOc3NHWmk2a2I4dTNRMFBTNjZmUG1OQnNCdGtDemVZVzltUStETkVYYzAr?=
 =?utf-8?B?S0RsQ3FxL016OStuR1ZRVEV6MzBlYmRHRVU4WEdoV09kN0VjUGNEV1NEQlF3?=
 =?utf-8?B?TlpjNElLcUNmUm9LR2IveUZmb01wNjNFbi83aStFaFh6NXNlWndvVjZ6SGF2?=
 =?utf-8?B?RXJLWjA2RjE1QUhZRFNpS2c4cTYrUkJnRU9JajJ2cGNMbk5XUURXOFFDNjE1?=
 =?utf-8?B?NFBQQ253VDc3ejBtM0E4WUxaOGFHZ3loV1YvbENFVmh5Ym90d050Ly8rMjdv?=
 =?utf-8?B?TjhLa2VYODRqakNTelBOVldWOENxWE1uSWpLNGh0REdXWEZEZzVBcWUwKzBh?=
 =?utf-8?B?NzRUNFNraWhFN25mbk1ic1NvekRBOHBzQmFnc28vbU96dHhoc3YzenpNMkl6?=
 =?utf-8?B?Nm91SElPdmF5QXlEd1B6RlZ3ZzJSb0NiWUNQQWw4SWF1ZEp6Slh2ZDducUhw?=
 =?utf-8?B?RWxtZFp5VXVLMCtVTS9Gei9jWExXQitnYlJ0dnZCM2tmVHdpaFhvSVh3NWFY?=
 =?utf-8?B?NDlnNHJUbHJiTUs2SkFEbFRVZ09SS1Z1dkRrcE1TTHhkM0RVdXJaVnNjYkUz?=
 =?utf-8?B?d2hUaDJvUkhHT3BWWXNYejlCVXFKWXZRNzNjTDdtb1ZtVzZLN0FINi90clg4?=
 =?utf-8?B?RllIcjIxWkZIRzJwamtYZDlDYkxseHZGM2ZWRUVZQ3JSVnpjUEV1czVhUDYx?=
 =?utf-8?B?WGdQdkZlcVNXMU9FYmZPd2JkTk5kTy93ZU1iRGNTTlVPV1prUm5FUks5dWli?=
 =?utf-8?B?Z1hiVXlKM3phdkJRdnBCc1NCTkoyUWhrTHU1TTIra2IyRUp1bUhpSExObXYv?=
 =?utf-8?B?MWd0bXFCL1kybXA5aDJWUE1iL05HNUxXTkh4QllqdStnWlRlTU53RkRrbWty?=
 =?utf-8?B?cEM0U1J0RVJoVURiZzNhME9UZzlQb29pK0hUcUd0Vkl3dUEvL2RnRlIyWmNR?=
 =?utf-8?B?SDYwbmJVUFhqZ3lQYWNyNnZad0ZYZERnbnNQaWg4bGo4c0hTRHNqUDE0c2hM?=
 =?utf-8?B?TmFvMDVNQ3RoUUtudzVCT3dFdllGN0F6OUFFSWJBQWZSTUxRbmhuWTN5WjFu?=
 =?utf-8?Q?4zPBnBy4R8t/7PLGqQAyliCpUbx9h640URFJXbd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3fbcfa1-7f8b-45b6-0577-08d96d9d49d3
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 23:07:36.7556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e5xkqkg1ANOhzyGwalAUh3b3mUkszVtNmr58wxdRXxEjx20SeogdfunsGQJPS0zkzy+olaHFeR6l48vNRblz6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5083
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

On 2021-09-01 6:03 p.m., Dave Chinner wrote:
> On Wed, Sep 01, 2021 at 11:40:43AM -0400, Felix Kuehling wrote:
>> Am 2021-09-01 um 4:29 a.m. schrieb Christoph Hellwig:
>>> On Mon, Aug 30, 2021 at 01:04:43PM -0400, Felix Kuehling wrote:
>>>>>> driver code is not really involved in updating the CPU mappings. Maybe
>>>>>> it's something we need to do in the migration helpers.
>>>>> It looks like I'm totally misunderstanding what you are adding here
>>>>> then.  Why do we need any special treatment at all for memory that
>>>>> has normal struct pages and is part of the direct kernel map?
>>>> The pages are like normal memory for purposes of mapping them in CPU
>>>> page tables and for coherent access from the CPU.
>>> That's the user page tables.  What about the kernel direct map?
>>> If there is a normal kernel struct page backing there really should
>>> be no need for the pgmap.
>> I'm not sure. The physical address ranges are in the UEFI system address
>> map as special-purpose memory. Does Linux create the struct pages and
>> kernel direct map for that without a pgmap call? I didn't see that last
>> time I went digging through that code.
>>
>>
>>>>  From an application
>>>> perspective, we want file-backed and anonymous mappings to be able to
>>>> use DEVICE_PUBLIC pages with coherent CPU access. The goal is to
>>>> optimize performance for GPU heavy workloads while minimizing the need
>>>> to migrate data back-and-forth between system memory and device memory.
>>> I don't really understand that part.  file backed pages are always
>>> allocated by the file system using the pagecache helpers, that is
>>> using the page allocator.  Anonymouns memory also always comes from
>>> the page allocator.
>> I'm coming at this from my experience with DEVICE_PRIVATE. Both
>> anonymous and file-backed pages should be migrateable to DEVICE_PRIVATE
>> memory by the migrate_vma_* helpers for more efficient access by our
>> GPU. (*) It's part of the basic premise of HMM as I understand it. I
>> would expect the same thing to work for DEVICE_PUBLIC memory.
>>
>> (*) I believe migrating file-backed pages to DEVICE_PRIVATE doesn't
>> currently work, but that's something I'm hoping to fix at some point.
> FWIW, I'd love to see the architecture documents that define how
> filesystems are supposed to interact with this device private
> memory. This whole "hand filesystem controlled memory to other
> devices" is a minefield that is trivial to get wrong iand very
> difficult to fix - just look at the historical mess that RDMA
> to/from file backed and/or DAX pages has been.
>
> So, really, from my perspective as a filesystem engineer, I want to
> see an actual specification for how this new memory type is going to
> interact with filesystem and the page cache so everyone has some
> idea of how this is going to work and can point out how it doesn't
> work before code that simply doesn't work is pushed out into
> production systems and then merged....

OK. To be clear, that's not part of this patch series. And I have no 
authority to push anything in this part of the kernel, so you have 
nothing to fear. ;)

FWIW, we already have the ability to map file-backed system memory pages 
into device page tables with HMM and interval notifiers. But we cannot 
currently migrate them to ZONE_DEVICE pages. Beyond that, my 
understanding of how filesystems and page cache work is rather 
superficial at this point. I'll keep your name in mind for when I am 
ready to discuss this in more detail.

Cheers,
   Felix


>
> Cheers,
>
> Dave.
