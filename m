Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE177628703
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 18:27:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F4F10E099;
	Mon, 14 Nov 2022 17:26:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0933B10E099
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 17:26:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g42BzH/iZ+nQ9lwkXCBtcv7i2uc75GDVd3qWVLu8WC+wsxWERABIyZM+6XI0+AW0nO5FIFJEgy7lcV6935qIBY22V6pE+QxMRclyTuj8jfh7AYV8QgUuuOAdyAQfvMpDRZWtP3cG1Yst88VcS/wKhL1Qot2cgZE6zkIB8KWSqycKJiTUNg7kmlsXQsnNR9b48c9AaxFJFDrEDiBPrq/VYOaUPEbm4yC5FFx8ZtuJp8Ca6OiSSocaxRsIQrN9Tl5ItpF9udBLDEm2vBJ8mEVzJkARxLMAGFyLqaMcT/GW9r0Ungykg841ZypTEy97u71vdhqTWZeY67kDAVWxsdcLAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ToR8niXwvdkCXlS+38pMACpOaopVVz1ya7e+plFsbU=;
 b=b/Z6WjqyJOts12pSipTtWT6djHDhLpMvaVqjG5/aEzrgcFfBwukSznz2BY/h4JSsDGn5o4Xpx4J/ToGLoUQ3CNcooMkrE3sk+TyPrqtTvAjjcKEIe5oeWh+pqaIcRkSpjYvL0gpZCRZAuQUznKUOpjAM+zZoUjOhxWIwkrCzmMUfsq0/QSIwMhDA0yqN3/I8w8mwgzYFkAABRjnfGUbm1gTnCzWCWExFzzGL9RkqHVll/pE1iU/NIbqIJAXvIZo/V98Qz1ZmT0PAemJeCOjnhXEDieYCwGW1V0f/cKJV94SlRl6KdVvKJspL6Ba4L5xsW7IsU3K1zlyh/okDoT9dMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ToR8niXwvdkCXlS+38pMACpOaopVVz1ya7e+plFsbU=;
 b=PkBp7adbb7qjro40y9ViD3mrGgYUvaltgf/SRvEM2YezyY4m6TkGvll1p+S6KPlaNnPvhGIsN/B5Tr/Qq7EU4Eopcip8LVEuC673J+2IGNDgPjez5JXBH9LYuG2Tg3EHNOYcc6xDEdZ/IYW81RX7mqYFuFGVkUmHry8NLpyoFDk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SA1PR12MB6678.namprd12.prod.outlook.com (2603:10b6:806:251::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 17:26:46 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::5d8:f3f2:d940:5350]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::5d8:f3f2:d940:5350%3]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 17:26:45 +0000
Message-ID: <858a5396-964a-24c8-cee3-4c555058a5d6@amd.com>
Date: Mon, 14 Nov 2022 12:26:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] mm/memory: Return vm_fault_t result from migrate_to_ram()
 callback
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, Alistair Popple
 <apopple@nvidia.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
References: <20221114115537.727371-1-apopple@nvidia.com>
 <f9826c72-7265-7c6f-371b-7ebab4aa27e0@redhat.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <f9826c72-7265-7c6f-371b-7ebab4aa27e0@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4P288CA0096.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::25) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SA1PR12MB6678:EE_
X-MS-Office365-Filtering-Correlation-Id: 06dd0b41-d768-4211-b293-08dac66566d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /o9sBpQbg/5SBAAUYLR1Kk1ap7MokUKWYzk7WoVP9VW3dtnle6+sxJ/A24gU8q+m2qGDAKONebrEHzw1lMldFvFlUnN2sALOwDG5JNJBoFBuA8Z3VoljMs7/tx3mCZpZq0oivi4Rq/5vrpsZKgCWaIbDl4xCoopMhU/Q+gqKafOhZMWB3fGN/YZjDprH4FHyjIgkEJzwl0NtTTdRf9Nm2Q4tVY7dBmnyILpQCAfYmNF6eJFsWB40tVFbGFU8pfWVlEylyo1fQhtx+dWfyIRyeoa2Ncudea+ry1eMuE42pZnyDHbtst99bX/N313u2IPN20i8nzFBy8TlpKA0Bq4Is8ra9gywFJr2/mPQAjw1xd8mykwfR+QC5SZ/I73UR1MDRaH9pvcFO0BhvzxteyDTFzqhlP5KvRNmqaajPvcB5bwk1G85nr7pATU1VT/cf4vkUuFM2eBiWwLnJbLOeR7TDu6Yv6CvVKHWNqr91n84dmBXCzd9rz+84P7GW0f+zLtrS9t1MUbGYSiajo/V0j6+LRUJNk0veEqDxZFgle283prRIWHJH0hPwUXSWVDIidGuEjBWur8Znhn592He/qju/QrhxdRr55Z0O23rxPJIJaXY8J0GpECc5sZh3x8S6cGMm0Esqw/J/aINhO5gIpHxGo+IghZ29KsogT2/sqYDVV+/QC8anKCNhsqTrUodFrL77M8r5/+w1ANaD3jSwD91qpZ3wS4QsF3X4GAM/bg2qPQgd/P4wDOHDLeUcgQMbyJ5xzrsMGKRSF55P9r6Zx83Lq27zHgLQrQvg0PBzDgn4BM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(39860400002)(366004)(136003)(376002)(451199015)(36756003)(38100700002)(31696002)(86362001)(6486002)(66946007)(66556008)(66476007)(316002)(8676002)(2906002)(44832011)(41300700001)(4326008)(4001150100001)(54906003)(7416002)(8936002)(5660300002)(83380400001)(110136005)(478600001)(6512007)(6666004)(2616005)(6506007)(186003)(26005)(53546011)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzEyb0xTeG1NSjN3SDVMMmw4a3N0cFFNZVp5azhnK3hmRXdyL2dOT0NzRmEw?=
 =?utf-8?B?cUx2WDMxVzNhL2FvSkZwemI0K09TOHFIcVYwOVI2TmtLOUI5eklNNDJCSlhU?=
 =?utf-8?B?bDljd1V2RUg4Zk9xUm13Unl3ZVRpQTZaV0IveWtKbzFZc2kxbXltbi9hYUli?=
 =?utf-8?B?U1AwRTBuaFIxb1BuZEg0VGNoeFVGbklUMHNMbmlUWmxPVXdVZE5vM0tsUlVX?=
 =?utf-8?B?bXlkNy9rRk01QWhIQm1XMlkvT0twbXNPZHcrZ3BKZTFYc1NxT2lIbXJDZ052?=
 =?utf-8?B?cUtDQ25PZlJHYTl0Qm51RzE2R21tNnFJd0pQV3VkZ0w4N1hXSVVjL01BN3A5?=
 =?utf-8?B?ZkUvUmMwV2puVG8zWmd5dzRnR3lNeFFhUlgrWkd0cUY4ZCtkSlF4QTNsQUxv?=
 =?utf-8?B?UGkvdzNmZjRqWFM0UTJhTjRTekQzd0p2UmtUdFpwZXpzYnlqSXlTanZIWmcx?=
 =?utf-8?B?dWdHdU5KbHRXSjZOcFFMUFdwMW1rMzhWRjZWQkIvL3lBalVJMFFCWkhIMHV3?=
 =?utf-8?B?ZHduOEV0QWNHbXMwZG9sTmJjQ1FjeFRMTnZPK0hlTkZZK3hqSFEvMUVReHdK?=
 =?utf-8?B?WUpLcTA4TVBNNldqdVIzWVRxYThCNlZKMWxCTithdzNwK3Y3ejRXaFduTVYx?=
 =?utf-8?B?TjRZYUdhb1dZRDVXeWMyTWNTZU56REthQkdhK3BjUk8wMXlYaThkQ01kOWxk?=
 =?utf-8?B?b1l4S0VjbGFiWVZzUmhEZy9wd0FNcExhWnJKTy9Vb2kvRkRyZEdPK3E1em1q?=
 =?utf-8?B?OElmN0pKN2liU0cwS2hYRTJDSjVlOU12Unk3WTJieDFZbi9RZ3pYejNMaDFY?=
 =?utf-8?B?UkNEYnZBOU9sQ2xxamFoK3lQcjNWQnJSc2dOUHhLT2pTVElYZEJzVWpXQ3U1?=
 =?utf-8?B?SU92NEovZnNuNVV6R05kOEk5RUg4VDAyVXVDRkRiVHBxSE1TYmRMUkxUa2h0?=
 =?utf-8?B?UVpnVGFMNVRPaE5PMk8vak9tZzVHZzNKWUZ1d0xBV3h2MDV3LzZwNFF4TWkz?=
 =?utf-8?B?d051OWJwS29wTTZDY3dkYlB5VXdzNjY5ekpZcXVXaWxJVDJGYVFKaTBkZzNn?=
 =?utf-8?B?NkdJSEY4eXp1cFI1NlF4a0FoRVVYTVFvckhQRHlsWGprREE1d1diR2daZ1RE?=
 =?utf-8?B?eWJib2xITGEzOWVDaXdKdDM5QjQ2QVd5ZXg2dkhkdmFYa0hDeXp0YjF2aTc3?=
 =?utf-8?B?SUR5Z25tbmlPUUYwekEzM2RNU2U4dGhOeEkrL1ZzWUVnaElEVDYvb0FzQm9D?=
 =?utf-8?B?eVlCWFNLWXlLbk5WcE1saEYxdEQvK3pvWlc4bmpsVWNlZFFKN0VJMGFXdysw?=
 =?utf-8?B?WHRIdUV6WUVvVkNTYmNPRkZndHoybHh6MTcyR2NpdzlnY25uQmJpNk0wQkFP?=
 =?utf-8?B?aHFiN0NOVFkzOEFVWkFVNFJuSGZabTY5dDV6NzZDOTFXTjBqQ2l3dFhGWXlI?=
 =?utf-8?B?NGFUbkhqYUxuSEpoODZDYzJNMFM5clMxd09LVXZtRitvM28vdkRycGo5VlRN?=
 =?utf-8?B?K25RMXRSL1FBUkQ3Nzdlb29KSnoxYVIvYVJvQ3ZYMHVocTFvZ3dhY2kwTE5J?=
 =?utf-8?B?bUw5VWpSVmJ4T0p1UFp2dnhNMW1CRk12cGF6b1Bzc2JnU3p4K3AzNFdHOVMw?=
 =?utf-8?B?aGxHVmNEMEdrdUoyaUwrOGVGNXRQR3Q4N0w1a1E0Q29OOUlYcHdtYUVoQVU1?=
 =?utf-8?B?VVdqMzdDVmtSUTNCSlZ1cURISjVtcW92VS9Gb0prdWk0WHBsczVLeTB0QSsr?=
 =?utf-8?B?d2tXNnpNQkNBK1Vja2IzOEs5azhIbUNxTHNUbE02c2J3Y241OXMzOWFZQ093?=
 =?utf-8?B?SDJKZWkzS3VGNmQ3aytydVRrb1ZDVVNOOUlaRDF5MnZyeXlxbzFDeVFEcCtL?=
 =?utf-8?B?VEZFQUlsS0kxSDc3Y0M1STFkcVYxNDdIMVZSd0MzK2xBNllndnVvaFE0b2kv?=
 =?utf-8?B?MG1IYWNrWDBKdENlWnBFOHgvNGtzMEtNZklNaWNPK3ZWbTZsMWZMVjd1OElj?=
 =?utf-8?B?UWs0aTZ3S09UOHlsbU9qb0JnaWZOUWRDekZKaHNqZHhpVkZtaTNWMVZoMHNC?=
 =?utf-8?B?VWtmdzU3UnV4K0VKYTJacUplV1RDWGhHWmxOTG1xUHNHWXYxLzBFL2VjZVRC?=
 =?utf-8?Q?ll8f+LoGpttPsHCQfuiFjcIl+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06dd0b41-d768-4211-b293-08dac66566d1
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 17:26:45.8144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lkGrRuhl3oPJ8CmjFpU2zROqT0Fibl1SpUYUo0cCBEcLGl8lmrCbZoJO9EEZlvi9K+VTRQPya5NA8qQf9a76Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6678
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
Cc: Alex Sierra <alex.sierra@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Michael Ellerman <mpe@ellerman.id.au>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2022-11-14 um 11:41 schrieb David Hildenbrand:
> On 14.11.22 12:55, Alistair Popple wrote:
>> The migrate_to_ram() callback should always succeed, but in rare cases
>> can fail usually returning VM_FAULT_SIGBUS. Commit 16ce101db85d
>> ("mm/memory.c: fix race when faulting a device private page")
>> incorrectly stopped passing the return code up the stack. Fix this by
>> setting the ret variable, restoring the previous behaviour on
>> migrate_to_ram() failure.
>>
>> Fixes: 16ce101db85d ("mm/memory.c: fix race when faulting a device 
>> private page")
>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>> Cc: John Hubbard <jhubbard@nvidia.com>
>> Cc: Alex Sierra <alex.sierra@amd.com>
>> Cc: Ben Skeggs <bskeggs@redhat.com>
>> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
>> Cc: Lyude Paul <lyude@redhat.com>
>> Cc: Jason Gunthorpe <jgg@nvidia.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


>>
>> ---
>>
>> Hi Andrew, I noticed my series needs another small fix which I'm
>> hoping you can apply for v6.1-rcX. Thanks (and sorry for not catching
>> this sooner).
>> ---
>>   mm/memory.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/mm/memory.c b/mm/memory.c
>> index f88c351aecd4..8a6d5c823f91 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -3763,7 +3763,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>>                */
>>               get_page(vmf->page);
>>               pte_unmap_unlock(vmf->pte, vmf->ptl);
>> - vmf->page->pgmap->ops->migrate_to_ram(vmf);
>> +            ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
>>               put_page(vmf->page);
>>           } else if (is_hwpoison_entry(entry)) {
>>               ret = VM_FAULT_HWPOISON;
>
>
> Acked-by: David Hildenbrand <david@redhat.com>
>
