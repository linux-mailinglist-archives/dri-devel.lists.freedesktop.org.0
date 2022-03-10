Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5394D5402
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 22:58:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102D810E242;
	Thu, 10 Mar 2022 21:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5081610E241;
 Thu, 10 Mar 2022 21:58:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BIV7HQefJOhcNsyVfXlI49UYhKwgLc3e3vi4J3wQ4EVqEPOrql0aBf4Y1qoYCp2t6UiIkTnGs9ZdJR3Sr8oj44Nq4UgDi0Q6o3KREvfGjCC3WcT8LJ0T2cmBTt7F88vmpATrJarvSD52p/G7VSwn5uLMX2UiUu8nLZSEjdhh8rOuP2NBQAf7dwySMm63YB6V1EZuDQuNdO/MDQL/09UflUWP1yVggY5eVRIafN4FLc9PA4dvZoraCiUEF6R9aH3htgQdJZ2OI5+QsCm4YnrDz6+JMcLJeWVMOCmoG0QEE4SyV7Ffhlq7XwJE9DM4PGpvSV+3O6EvXTO84nxu0vREhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hG8C5P3c2VIPpHqHKDI2kwpp7WkhSn7iDcW/5F6Iybs=;
 b=AkW/w6DVx/cUewKC3Uqxme1RNO8U1L8boF9ws9htlk8FkFbI2kCpLn6xEFaFUDhUAYRgVKFWhusPVmzHjn6zjnnpIKgSCmp4y2rjAOUo3N1Xg/xELe6Egh4vVlchC2Nncx/chanJspBgxWJ9r+5nbdFWATWg3pJ3muRx8lql+z3aUqEKkUKBEXXEWApEWONLsaEtJYegb8TU/x/OnbJvXUKkA1pTGwrY9rffTtb+7CkVAfJGKnPY19Hza1bNfjD7cn9CgMDK2O1KOlVDD5NW1FXNAL6nl2r+4rDXFDXqFvjAW+oVYVDrEA69Gr1lnEsJXRuhpgmXSYH3/hUNOmZxzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hG8C5P3c2VIPpHqHKDI2kwpp7WkhSn7iDcW/5F6Iybs=;
 b=ghCAAcAGlyZzGg1qw3jgSzIj0vldu6eSEzCklB84Y+J3MpC2JChGmS9JQbanLg1NfzwvVCdOc5cWH8L/QFjTnARgwXPYS/rX1I3WPpxXrgbFK0snxuOMTPFnJ4bIQ0svi0BW+tNMWE0OkKpCat0LaZWlxwQ2DjfHHAfmFf8mUYg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM4PR12MB5039.namprd12.prod.outlook.com (2603:10b6:5:38a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Thu, 10 Mar
 2022 21:58:07 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::4839:9431:1040:5cd5]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::4839:9431:1040:5cd5%3]) with mapi id 15.20.5061.022; Thu, 10 Mar 2022
 21:58:07 +0000
Message-ID: <651099d6-21ae-16a6-e500-a87002468cda@amd.com>
Date: Thu, 10 Mar 2022 16:58:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 1/3] mm: split vm_normal_pages for LRU and non-LRU
 handling
Content-Language: en-US
To: Matthew Wilcox <willy@infradead.org>, Alex Sierra <alex.sierra@amd.com>
References: <20220310172633.9151-1-alex.sierra@amd.com>
 <20220310172633.9151-2-alex.sierra@amd.com>
 <YipQqqpTz8hZAbLZ@casper.infradead.org>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <YipQqqpTz8hZAbLZ@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0125.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::34) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f5dbb83-4109-42a2-7ccc-08da02e10f2e
X-MS-TrafficTypeDiagnostic: DM4PR12MB5039:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB50396AA06F3908DD8966CDD9920B9@DM4PR12MB5039.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1zS/aaaBjIFIfMAkhBRBPIw+aBv0faoIVk3qDrkgS8WzXqAJ/L1kG9y8VSa4uIKXHRPj3M9H1NNeMF5jP5lwpBgUdKaRPQVbF50bvv8TZarV0fmoEnOkSH6aS3FDLHauyGNZEZT9rdQqnGk83jAeBO/4L/D/03CnTQ2kyN/grBxw8nm3MoKF3BOJdRpNKGJPQARxonWbt/KnolGPH2aYh9aqh43Da5CgWlo67qebVkN1Sj1nomotLl2H1yq4n7cu35y9g2km4MyWi3G8dEQjMksJOHNKKNBIpmFHLA3H+8S7zH+MRs/vohzkXmf71GYz4bnxwiZo7opIuTKLCnXWzJ8U+duR0g2Pv0ZAKhCYXkp2z+kC7ixc3VAJ8P/yS32qCVt0JSO48J442OwpWs+9SGhQWUUZXxtM5U6ky06cZdnP9iM0f3Y9M2JwdnYrNYNQgfYaInmGldd3Ltpt+qZsonMrtupVjcFSzclIus8gnfEyuKJJ5ojbIp6pOveJmkAot/14gyO20NvCo1CxCa2qC/eKDe53S4Oee94L+C8hzbj2ybc+ybaewUnTV7FSFR4nZVKF7bVPIKWW9ysr7/pNux2jMRUwLLRh15Jti+TmeHZeQOjUyiJp/emKSdjuqtaRwfy3ii/aaXlNgsOxxqQcFwCo2YB1klZOOzJyoeQrTiM9OcttiJrxi/Gw9rkRF6Ffkfo85xiFSAG4uqC0fmDOUghoqpsYYg4hDUkcsNcYivE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(8936002)(86362001)(6486002)(6506007)(316002)(2906002)(83380400001)(508600001)(66946007)(66476007)(66556008)(31696002)(4326008)(8676002)(36756003)(7416002)(110136005)(6636002)(44832011)(31686004)(38100700002)(2616005)(5660300002)(186003)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0pkLzFNd0tIODBuYlVBUE1HTFdkUU8xK2V5RENsb0xFUmcwTi94UEluQTBj?=
 =?utf-8?B?QVRETmxKeDYyQU5sUnBCQXZIQVhna29ESDVOL0xKU21rbFlaWmh6dFVDSjlB?=
 =?utf-8?B?WFpnMHNUMVQ0bVVBMS82RVN6cDdaMjFnSGxtSnlweldFbDFueUQvL2wxb0I1?=
 =?utf-8?B?enRIVk1aRGxUeHlqZHBlVjhITTduT0xVUktnVEtpRERaMnBET01hZGFXQXg1?=
 =?utf-8?B?TTdNSlU5bUw2WDUwamwyZDQrUmwrVTlya0x5QVEzZlUxZktITHZhSy9XTXgy?=
 =?utf-8?B?TFcyVE0yYUxVSHlZdGdjT1o4citxQ3MrUEpoSVBORTVuckRxZ1diVW4zTDd3?=
 =?utf-8?B?eXNSUjFRaVdEODVxYmxHTngwYjZ2b2krT3Y4c0dQOXQyMTZlVnViWVp1THpk?=
 =?utf-8?B?aERjRkswL1dPajZUMGhvSU9KNW5hd2ZsWC80UHVMQld3UjdjZDIzdlE4ME9T?=
 =?utf-8?B?U3dPaFZVV3c3N0hsNVAySUxsOGFZd2lHdDh2dWJkRkpaUGpoZkJqSUZEQXVE?=
 =?utf-8?B?VDRTVm5pdllFL2VFZDFObmpocFh3L2Z4cm5xRkJjZ2ttbVpUM3htMDBRNUkz?=
 =?utf-8?B?SzVQQ1doTnd5MHdOUytuY1BMa3RaR05uZWdKM1VVa25zeFdGc3R1MERtT3p0?=
 =?utf-8?B?eHAreUNhVGE2YXdZVXVGMW5SS3FVSGxZUCtKNkNjMlhsU2I3Mm9SM3dIVkhO?=
 =?utf-8?B?TDZCQjJJMHdETmZCbWdYZWt2elY5bmdkRXhtV0MreVdCbW1pZkJRWDZwd0dj?=
 =?utf-8?B?RjJVMVJVWEJKUHRWLzFJUjNiSmdpeHRvQ2NuVE85VzRCTkk0ZCt1Tmkzb3F3?=
 =?utf-8?B?czhuVTkzR1VYVDZZTWFtL0JZamZSdC9id3ZsL283akFRUkNHc1h3Sm8veU4y?=
 =?utf-8?B?MjlzelFyNy9QcStvV1lmZ0RlaVVHc0c2WXN6eFliUjkrb3VWN1hIRS9wVlF2?=
 =?utf-8?B?YnhqdTRMSkR6bkN6U3ZaWHRlQUkwa0RPRVJOUVlHaE81WmFNOTlJcDU2eXQv?=
 =?utf-8?B?VDJmVnBtekVCMDl3RU16RVl5NDUwUG04K1BYeU9Ud1dZdGRRVE5qVmlFVGpt?=
 =?utf-8?B?MFdjWmlidVNWTWlDZVFjUURVVXJHaVFIYzdXUlRoQXhRdUltRHJXcUt1a1dW?=
 =?utf-8?B?REZoWkRsTmVFbkpST0pxNk01ZEdFM1pBNVpMeUNvcXBncitVMVA4ejNqZ3dE?=
 =?utf-8?B?ejFJbkpaTDcyOTM1b254ZXVrMll4NWVDWi8vZUdPUVRYcGgwdzdHd1lrdnJh?=
 =?utf-8?B?WUl3aHNCVHViZGh4Z2ZpNnd6OFQrMzhULzR4ZmRzSzNpampqUktreEsrWDRi?=
 =?utf-8?B?YkFvMmlMWktBUmEwMCsrSE1MaGhmelMrWG56ZThnRzZtQXQvVDg4RWQwV2Ur?=
 =?utf-8?B?MjNnSWw2R0xHSWE5RUNoTHpmVUdPdVMwZitMREdKVnNQM20yQ2tpY1ZQNWVa?=
 =?utf-8?B?RFJBU2hrUmNRMDZQT21veVNMMmkxUG9YdEdPNUFHM2pJRDZld1A3K3IzaFhj?=
 =?utf-8?B?aWlxbVNWUTNUQk93dUgvWkJ1VXFLaU1zNllMZnpQWi9qcmlOcFJHOXlyYjhu?=
 =?utf-8?B?R29mYjdELzJSYlBXZWxHZzQ2ZDgvY0s3MzQzUzJzUzRHa0l2MmJLVkhYRXF6?=
 =?utf-8?B?bWdlSjRBcGxNLzAvRTlLOFdDdTNkdFMveStwSDdBRjVrRGxJeGp2SVlUMzlw?=
 =?utf-8?B?ajUydy9kd1Mrd0xxYlUvcmRQd0J0MFVCTzhxUHZJK0xrc3JoWWJFVncwcW5k?=
 =?utf-8?B?SUQzaVZHN1cxZExORzlFVmpvQ3g5ZFl2UUpZOFlXb0hKN21ZTlk2ejNMcEUz?=
 =?utf-8?B?SndoY3h4eEdSMlArUnhVYjUwN24zNFBWWXRieStMQUcvR3dPbVhzQm02Y3BW?=
 =?utf-8?B?VHNjVVQ1MjVlYWpWd1FhSEtHTkFldmg3SnFNampTZVhQbWtDMjdHL0dETUtX?=
 =?utf-8?Q?Xzee7lFuVpLePmot8ezAv5pVqIhPGkwM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f5dbb83-4109-42a2-7ccc-08da02e10f2e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 21:58:07.4291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +9Z+UMcgb70fml3MUG0P4z06g5ICIqZOVBEIBupFqTniLsVJuHteq6oHhfZ0I5j/fYNESpOkRCrTv7rElqP75g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5039
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
Cc: rcampbell@nvidia.com, david@redhat.com, apopple@nvidia.com,
 amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, dri-devel@lists.freedesktop.org, jgg@nvidia.com,
 akpm@linux-foundation.org, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 2022-03-10 um 14:25 schrieb Matthew Wilcox:
> On Thu, Mar 10, 2022 at 11:26:31AM -0600, Alex Sierra wrote:
>> @@ -606,7 +606,7 @@ static void print_bad_pte(struct vm_area_struct *vma, unsigned long addr,
>>    * PFNMAP mappings in order to support COWable mappings.
>>    *
>>    */
>> -struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
>> +struct page *vm_normal_any_page(struct vm_area_struct *vma, unsigned long addr,
>>   			    pte_t pte)
>>   {
>>   	unsigned long pfn = pte_pfn(pte);
>> @@ -620,8 +620,6 @@ struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
>>   			return NULL;
>>   		if (is_zero_pfn(pfn))
>>   			return NULL;
>> -		if (pte_devmap(pte))
>> -			return NULL;
>>   
>>   		print_bad_pte(vma, addr, pte, NULL);
>>   		return NULL;
> ... what?
>
> Haven't you just made it so that a devmap page always prints a bad PTE
> message, and then returns NULL anyway?

Yeah, that was stupid. :/  I think the long-term goal was to get rid of 
pte_devmap. But for now, as long as we have pte_special with pte_devmap, 
we'll need a special case to handle that like a normal page.

I only see the PFN_DEV|PFN_MAP flags set in a few places: 
drivers/dax/device.c, drivers/nvdimm/pmem.c, fs/fuse/virtio_fs.c. I 
guess we need to test at least one of them for this patch series to make 
sure we're not breaking them.


>
> Surely this should be:
>
> 		if (pte_devmap(pte))
> -			return NULL;
> +			return pfn_to_page(pfn);
>
> or maybe
>
> +			goto check_pfn;
>
> But I don't know about that highest_memmap_pfn check.

Looks to me like it should work. highest_memmap_pfn gets updated in 
memremap_pages -> pagemap_range -> move_pfn_range_to_zone -> 
memmap_init_range.

Regards,
   Felix


>
>> @@ -661,6 +659,22 @@ struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
>>   	return pfn_to_page(pfn);
>>   }
>>   
>> +/*
>> + * vm_normal_lru_page -- This function gets the "struct page" associated
>> + * with a pte only for page cache and anon page. These pages are LRU handled.
>> + */
>> +struct page *vm_normal_lru_page(struct vm_area_struct *vma, unsigned long addr,
>> +			    pte_t pte)
> It seems a shame to add a new function without proper kernel-doc.
>
