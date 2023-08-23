Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AAC785012
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 07:49:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6110410E224;
	Wed, 23 Aug 2023 05:49:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789B510E224
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 05:49:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UmpPd9MdO+FwfUUGOAg4fGOUpQLaYokW3XEczYRqZKnpsB0L7pz2FRTCmSPG4h0OUMSrEUFPNxieklpUUBkDY8jUDsLx9iB+nX0+dFeFxQ6Kv+YZF+fqPbmA9KZmX7H92f/lMwUKkXUArL4drOYxpXsg+4wYI7MtlVFmE2UOvySXbR4O763YrPbqDiWu6B9mW4iAzOAW5tvQMGb0w7nF5aY+aazvPUZp1DI5V5kU863kelmbWeVCLCT83ahrhw+NP0tCizflVsu3TTa8nggMkOKegNN4Ex1Grq/ABHgcsUfLUXh5HEyn9vd2SHdAQlj8Cmf5MwEUCSQm1Trn3RVsXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rCrjA36T+iTpIte0DBERo+0biaRUbAXdj+vMVmwgVo=;
 b=DuU8eFqIPFUhAiDHS8CJx1QNCcCAfoLtmVARCz7dAYrE8gXqPG1fvl+ZX9e13Ernqa2QrVDOR3OvtuMk5z3CKSEMjNnrWtNnbarSGo4s661DCYC0afyx3sD/5bsie9LS3297OygfkcAcSWrfeS/FxDPC5z4YaImXjek0SHayJcL9Ef9vBN9SX7aZpaK+udvIAO9jMkoI3shINQQvdecl7Dmr5S58Xj5URT4Pj4h5MOb3n9/X6IxXJyzexT5OhbZIRQIv1VIexXLjoyT7nwpr4rL45+ijLLvpSJ4xKVQ+R8mPo7xAYm7yGCPOwNEOqeo0LmiOIkT6ofa+IcqBDnk+bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rCrjA36T+iTpIte0DBERo+0biaRUbAXdj+vMVmwgVo=;
 b=J9i1rrSUWgYbEOMwjk9gbf062JLMNp0EPqk0M806eXekP3Zci19LbROSohR87P0xO0BKWosb4HKjKM+9OrZdtg/cq20i7QV6Z1xo1iIrPuDWMVnrImkI4v9tPl/nRqI1NZfeaC69oDk25I4MewJoTPtlMm+iuRDgV24pmPofoa0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ2PR12MB7961.namprd12.prod.outlook.com (2603:10b6:a03:4c0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25; Wed, 23 Aug
 2023 05:49:20 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6699.025; Wed, 23 Aug 2023
 05:49:20 +0000
Message-ID: <fd742874-8d85-98e1-b40e-8be2e8b0b6bc@amd.com>
Date: Wed, 23 Aug 2023 07:49:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/prime: Support page array >= 4GB
Content-Language: en-US
To: Philip Yang <yangp@amd.com>, Philip Yang <Philip.Yang@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20230821200201.24685-1-Philip.Yang@amd.com>
 <690278ed-1f89-2380-c105-1c85f8da5ab9@amd.com>
 <97714a7b-8ea8-0b23-f851-aa337026ce21@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <97714a7b-8ea8-0b23-f851-aa337026ce21@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ2PR12MB7961:EE_
X-MS-Office365-Filtering-Correlation-Id: b4c375ef-d4ef-44e1-c7d9-08dba39cb24c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZKUPkuBbbksGKQZyR9aHWbjoyI7tbmJWcJuFNoTDdO7MHhCRp8eShU/4uvQYmFW9lN3StXyeOIESRv8HrKX12bcGOAsSZrUHlar5dFiQcQ7eSnUnANWBnGOWxHEcTy0HfcshLg/+ZT30j8gTna+RBPCkifTegtN5+7KoB73Ugk1grcQlganwPqE66T+yhReEE9q+0ZPD2p7Cov6nQqg8JddKJTTAPonNQsRg113h7ohEP1P10plfkDFeVv1hBjxj1aBNI16HoMtDO6jikFnifw+N15ajmvewHIG2lbpbaZrrPuXjE49CC7hSLPXqNUr/q/zbF/MQFoNNIskn0lWcqcA1U4FgQrm8DqGdhtvnqyDKcoum1dqLzCdKHw6Mx1SWOTWID4bYpucFk5F1Dq8f4qY47YZf530cUGMUGnG4gBxIvHEq9KYlYS0bNbD0Aa6nlgAQmjekFXmneuavs2nHDa6/OhfIBpqAEs1YzqEu4oMyKUKJxhP9bi91nOLqAuuM+TdGjArGLpJIdGAivD4ffJPqmWR7wOrAewZ5JNaMFnmYoWy+KsUJKgYygTVX178YcqssOC0IeDsYr4USDa4RxmCp/10RFm22XZZG9xK3+6GgqknQTjR2Piymn2L+27mI2r6hsO6M6TqV3av3LKlH/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(376002)(39860400002)(366004)(451199024)(186009)(1800799009)(31686004)(478600001)(6666004)(6486002)(110136005)(66574015)(83380400001)(38100700002)(2906002)(26005)(53546011)(6506007)(2616005)(6512007)(4326008)(31696002)(36756003)(86362001)(41300700001)(316002)(66946007)(5660300002)(8936002)(66556008)(8676002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0I3bXNuOHp4ZjNETE1aVnYzL2UvRnZiVlpFWWNzUzMxNFloYWdGbit5UXhw?=
 =?utf-8?B?ZVJDNXJMQlN1TU1uRmVGUEo0MEhsRElmMTZKdkVtQ0pNRnpvNGRVV1I3bGZt?=
 =?utf-8?B?QTFOQVRhYk9nd1lqZk9SM0puNHlIbTlZSy9DL25nSWhmRUhiV012RS9kM2xK?=
 =?utf-8?B?Z0EzR2lSeUFwSnhpUTc1amdjVE9CdDRoZUREWUNYV1c0YXFxRWUvNFJFd0Fs?=
 =?utf-8?B?MWdxb0ZPeHZzMFAwS1F1V0d6eVVwcmdlYUdyZkNRNmNic1dQSGxYTXFGWVB3?=
 =?utf-8?B?R0xoNXBYUk5BKzdDc1c1WHRWTlE4SUxCQzc4L1FFRFJsV1I5TEIrL3RDNElh?=
 =?utf-8?B?LzBmRUUwakFScVRyUjVPNUFqQUh6c2lreEpmblZiTDNWZlBSOXY5TVdrSUlx?=
 =?utf-8?B?d2FFcENBYitTRllnVFRtUkl2M3Q0Wmo0VldMK0I0UXN2bysrZDhBNmgxNHh1?=
 =?utf-8?B?Ui9RUVBmeEtBbzk1S0tSTHErVmw3Wnd4Y2lqWjhzOHFndS84UEpoSzFnL2hn?=
 =?utf-8?B?UmljUWgxUXpIUVdFMjJYZENWZU9nOE92UGc2RTVtTDBoZWlrZjYrSVVlMFNW?=
 =?utf-8?B?WVVlQThnK2FNeVlULzh0QVpLSXdlV1FVSkxZaldKQy9EbDhFaS9YbmJKcDJE?=
 =?utf-8?B?QmpKY0NLM0JLN3RReVFWdkhndTJmdEt4WWVObWFMZGxQOWFicjRjU3JHZ1Rp?=
 =?utf-8?B?TFMwMUZRTC9JQmoyOTRPU0w2VTc0WmtvZlkrS0RrUUFLMm9PZ3EyYWMzQllG?=
 =?utf-8?B?RTF4ZjhWRzNkV1hKMjJJSC9iUS85ZDdyVjROMFo0RUs0Zit3aHFkMWQ5L05r?=
 =?utf-8?B?eExZOGdLTnJvM0ZoUHUvQVZjNmx6cmNUSHFrMklBV2lUdmYySjdBVWFCa213?=
 =?utf-8?B?cUJBRjl5TzdZOU1YYnpPTndyTHRLdCt6bkZ4TDFsbFJLNE5SR2dqSXJxZUlz?=
 =?utf-8?B?ZWJxdVNPalYzOVhUdmVQcTcxQjBRMWNkSUFxWVltZEMwcFVyamxTaGlJM0Rs?=
 =?utf-8?B?YzJkTnhRZ2NiWElTdGx3S1QraFZkcmxyUjU3d0FBcGQzT3oxSk5LM01tQ1Ar?=
 =?utf-8?B?YWY5QksrVDMrYXdDSnFuQXZ2alNpNEhYbnB2SklxNkIvZGg5Qm1Ic3pKaGVE?=
 =?utf-8?B?NWxVMjc4eHZGRFdieGZyb2xETDZwNzlmdldEVElTZkJjbzNEZ3VFa3RyZlov?=
 =?utf-8?B?S0xoNWpNZHozNGxmTFJTNXpvRkNIckRxeG01VE1KUktrTG1wZXltaDRyQUx2?=
 =?utf-8?B?UTFqdVB3NVA5dXptTGg3cHNRWllyQ3o4WkpsV0VXUWVnRnI1WDd1SmswVCtM?=
 =?utf-8?B?ZWJuUWQ1Y21Lc3F6Vy81WitkdGNxb3JneTkzNGpWWG9UdTJQSzZwVUdmeVRS?=
 =?utf-8?B?dDZ6d3BJTEU2NnZKME9NVHFsaWRCUlZVc2NVd3IvZWEzWkxnNnE1ZTg3MHRo?=
 =?utf-8?B?YWJISlJNRW9mZ1poa1p2UUVoaFUxaWhoQWlKYUJGaDE3N2N4Z2ttMVdKRlZR?=
 =?utf-8?B?b1dSc3FmRFZLYklzRkhiVmt4UU9xTUd1N0pCL0tTWU44MkpGUHdrS214OXJJ?=
 =?utf-8?B?b0pwcGFPbjVKVS9HeXZSUnY0V1NZZmw5eVQwN0tYNm9IUytnWmhVMXlUR0J6?=
 =?utf-8?B?SzBtOE1OSzNxQnBzV3hjcFR2MHpwV1g5ZlFNUk9hcGg4WW1xVDJtRzBZOUdP?=
 =?utf-8?B?RlQ4ZUJQdXVORzJRWFFIZmcwdjBLQjdyUndhRnFSLzVVa0tONFgrZVlaWE9u?=
 =?utf-8?B?TXRFRDRmZ25rL05zVkFmYWJlR2IwVkxzbmVYSU1nRXlNU3JncWw5UHZTZFVt?=
 =?utf-8?B?cCtmL1RYZHlOT0M4UWpSaHoxdjVpbGpBeWs4S2RrYXVMNnFrMi9jQ0NRTlRr?=
 =?utf-8?B?Z0pTdWNUWWNRS3dYSTVNaDVHamVrZkVCWC9oRitHUUJDci9YREJSWGhyVU44?=
 =?utf-8?B?ZndhQTFDeWNGUEh1YVhHdDZWaUZhbkROZDRnU04xNjZOSTh0bEJpRlNMa3ZL?=
 =?utf-8?B?TkFmcklRWGpaVzFwT1NNc1F2MkZjZlI2WHExVy95ZkFJcWRBNkh2N0txUllo?=
 =?utf-8?B?bldoc1RhZnFXVnNlUFFLcjJMUzVGQ1BVb29NVGwvdk90Z0IxZGFLOFhBa2pQ?=
 =?utf-8?Q?XZPV4MssYn4QBQW73ngs/bAAF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4c375ef-d4ef-44e1-c7d9-08dba39cb24c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 05:49:20.6177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NsQev0GBff5QMW9H+CWYuY4GdfmnyJ7NIFA3wV/SXToWJVsrtuWSa+7FGGCWUfl8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7961
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
Cc: Felix.Kuehling@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.08.23 um 20:27 schrieb Philip Yang:
>
> On 2023-08-22 05:43, Christian König wrote:
>
>>
>> Am 21.08.23 um 22:02 schrieb Philip Yang:
>>> Without unsigned long typecast, the size is passed in as zero if page
>>> array size >= 4GB, nr_pages >= 0x100000, then sg list converted will
>>> have the first and the last chunk lost.
>>
>> Good catch, but I'm not sure if this is enough to make it work.
>>
>> Additional to that I don't think we have an use case for BOs > 4GiB.
>
> >4GB buffer is normal for compute applications, the issue is reported 
> by "Maelstrom generated exerciser detects micompares when GPU accesses 
> larger remote GPU memory." on GFX 9.4.3 APU, which uses GTT domain to 
> allocate VRAM, and trigger the bug in this drm prime helper. With this 
> fix, the test passed.
>

Why is the application allocating all the data as a single BO?

Usually you have a single texture, image, array etc... in a single BO 
but this here looks a bit like the application tries to allocate all 
their memory in a single BO (could of course be that this isn't the case 
and that's really just one giant data structure).

Swapping such large BOs out at once is quite impractical, so should we 
ever have an use case like suspend/resume or checkpoint/restore with 
this it will most likely fail.

Christian.

> Regards,
>
> Philip
>
>>
>> Christian.
>>
>>>
>>> Signed-off-by: Philip Yang <Philip.Yang@amd.com>
>>> ---
>>>   drivers/gpu/drm/drm_prime.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>>> index f924b8b4ab6b..2630ad2e504d 100644
>>> --- a/drivers/gpu/drm/drm_prime.c
>>> +++ b/drivers/gpu/drm/drm_prime.c
>>> @@ -830,7 +830,7 @@ struct sg_table *drm_prime_pages_to_sg(struct 
>>> drm_device *dev,
>>>       if (max_segment == 0)
>>>           max_segment = UINT_MAX;
>>>       err = sg_alloc_table_from_pages_segment(sg, pages, nr_pages, 0,
>>> -                        nr_pages << PAGE_SHIFT,
>>> +                        (unsigned long)nr_pages << PAGE_SHIFT,
>>>                           max_segment, GFP_KERNEL);
>>>       if (err) {
>>>           kfree(sg);
>>

