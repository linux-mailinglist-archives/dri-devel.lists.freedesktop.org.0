Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AACA4EFAB7
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 22:08:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E7E10E07E;
	Fri,  1 Apr 2022 20:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2086.outbound.protection.outlook.com [40.107.96.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E4E610E012;
 Fri,  1 Apr 2022 20:08:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7NuSIqWSDYaONOH63kOKjr/j0dYmWixNttt7ZszJ39r/2b+OksVmPFudnIZuOuPOB82r6WNdoMwqcjgOHeay/uqmZMNQHulVuBDLdo5y/ntiXKX05XCmlazYe7+AktDyNyECiRB4tgAozdl/KSxb8Dli2TLZedHJ9xdWD89QSIU2d7dM5AkqWcj75A/z8eS8xnEbDwPmKBBIZAf16Mou4ULhAbC8FMRMa620ZtaPK+KzPSaLOI1R4NMKE4oIZ8CjYi5uAHzKnOXVEogYZVFzVh8UmlynkiZ+hEsKMmSeCclZjsRV7SywC3AfcSc2EafkSkgsmMoHYrBZb6EjD++rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3EF+Q2R2VRE6MXe5yV5yQEaHL1L1UKjIEwysxrHJ7hY=;
 b=i5EiPvZ0nuconhGUYIZup4LuZ8rZ7z5HlWM20L2ljg/UbKB0lEVp9TwOiA4VXzoZUygGCQOmfM8hDU6zO77xZB0RoXxg0raAS6aulyn5CE1etQxNwX1fXYkICSzuIZVHfK8doqLd31+16YZSiTMwGex352ycMWn2p/JCysCvznzf9ViQlh0xZVuFTynqjXIhWRMgHYRgRQbt79Cc5IV/m1F5OR+f0t5U7Z7X80ZZCeMZmZvlgqDueSp+CFt1ui7pvY4Iqu2ytboj8n6N6usqs9wkUfcMESH4TvccdC/cHUut0g70n8Ik0NAODaJctpIeDst0y6hiBjvVmJjgLnyGkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EF+Q2R2VRE6MXe5yV5yQEaHL1L1UKjIEwysxrHJ7hY=;
 b=dQ1t9/L8zY3Mbn/Gsl/fCezo3KM9Yn6AbPauh2eJlQ395hB5jr1U2N4LM58tRDmCEIyCdQe+acWw6KjODyg2Ng2Od3S5azM/ShPhSOiV1TL6YgEKuXyyPhTB4MpUhCdNpv22yrZJnykkPTvemINs0d6NVC43RiatQFF0CIPDIxE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN8PR12MB2929.namprd12.prod.outlook.com (2603:10b6:408:9c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.26; Fri, 1 Apr
 2022 20:08:37 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::4839:9431:1040:5cd5]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::4839:9431:1040:5cd5%3]) with mapi id 15.20.5123.026; Fri, 1 Apr 2022
 20:08:36 +0000
Message-ID: <82ed845d-2534-490c-f9b9-a875e0283cc9@amd.com>
Date: Fri, 1 Apr 2022 16:08:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/3] mm: add vm_normal_lru_pages for LRU handled pages
 only
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Alex Sierra <alex.sierra@amd.com>
References: <20220330212537.12186-1-alex.sierra@amd.com>
 <20220330212537.12186-2-alex.sierra@amd.com> <20220331085341.GA22102@lst.de>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20220331085341.GA22102@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR17CA0032.namprd17.prod.outlook.com
 (2603:10b6:208:15e::45) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 102534fd-ee60-456f-de85-08da141b67f2
X-MS-TrafficTypeDiagnostic: BN8PR12MB2929:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB292931D30EED15F77CDD4F7292E09@BN8PR12MB2929.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YwdsWEuOsKnrDC5kis7yJ76cuBN+ARXyx0DrmoC7YQpMIz0/cz8pUIej+VGux2ZnDdwmm+6bD2hnjBnBqpDMyyayTvSXCwv8dysXwfcAUNrDFs0rbUc8Irp+JOPZOSUODvjPsEXDAwxsUK2pT2UZYEVmI4rErFUElJ8EZutZdonxcWnf5ZGnirZpCB8sAFIIL3ZX+4++oZ9cKtAhndPbFz4H2FmGWGkjrja/egZaobyUZkaKIY5q4icQGZm++Ek+HkldRuojxmuVcbBZd65khajWkqr/Fs0B+DZl3JmmRaVymHaUhx3l8S2DuivuiM4r+EyvdYSgG/u3k1PxWQ++gAU+0kz0YFbQu5kzbbv0QZ7jf5spnnc2V6G7LUpr6OQ0Xxb+iFpgl0ftNJ5FV5HR52kRnDTu34CbSMVE9E559W1A9w+nm7EgN8hVptL5p42s18XJPcZ9vBNm310ctvlDuTTSh6LHBgIyfC7zLYfisREGjZySCJKBX+OmRyEPAM4wtRbr2Cvm6pZQj7F7keklT0lGbGKJ1BEYHtHlwvaaL8cXNAhLvD3cGnQwA2pPDA9GPFIaZADZvu9YIoe+17oS1qNcR7r1naX+Tz6XTmYFXN9GOTbUlONKhDpP/I0J32wiHaCUHjufIEKtOKOYYuH29/WwKVUH+9yQfAq41GoXR4sBaV0LGoK6H+9IdRjz1OfVIDSdvN6d33RyIM8qp86maTvucYD51KG0f0IIhagI8ztW4MLwMWvpoQ9vjHVBd+Fy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(53546011)(8936002)(36756003)(2906002)(7416002)(26005)(36916002)(186003)(31686004)(2616005)(6512007)(6506007)(508600001)(38100700002)(110136005)(316002)(6636002)(31696002)(86362001)(66946007)(4326008)(66476007)(5660300002)(44832011)(8676002)(66556008)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTJ0MkYweHNDV3F5L1JjZkh4QmR3c3ZrbDlhbUtJbGI5RlR0K3c4RU1jV2ls?=
 =?utf-8?B?UDFzM0ZCNFM1UlpPNk9yRkg3VWQ5NTNNK0RydEYzWFpqZmxINWs5dEFKMDlS?=
 =?utf-8?B?S1NPdjk1cCs5Snk4dDRNZk1JamltMVNHeTN3WmE5dmorUkNFR2drVHpyOVVt?=
 =?utf-8?B?Qmlka0RyU29YRlFkTE1yandRS0xEb3RxTFJnWmFpSDhqUmN3VHlXbG9Sb1kr?=
 =?utf-8?B?ZzhEWlEyemlpeTdYMjVtd2xhS0NpZGZNTkZPNDZBQlFKT0liQnp6aGRyVWdZ?=
 =?utf-8?B?bDQ4OEVjSGxUN0NiOGhGeVdFYk05QzNjOW9LRTNOcXVzQUVSNlV4NjFyYkVr?=
 =?utf-8?B?K3JzeExqZVllN0JMQ1pKRjZLMW5GNW9Od0hWWVBqRmFKRHhSUzJRdDMxMmMw?=
 =?utf-8?B?VlhzMk15anl6elRSakdoeGVsaWI0ajM2cUx2d3NQZERNbm80THdRekE4UVFO?=
 =?utf-8?B?OW84bFlsV1hPU1ViUGZXVmlSNURnb0tNdTVBZTZyZ1FqSWNvQm51b2pJL1h5?=
 =?utf-8?B?ZWY4bFRXWTkva1F4dzRzdmtWcFRpQ2dxUkJiTEpqaFdTeThMbU9nVGd1aFRh?=
 =?utf-8?B?RG5nK0JDbGh5WXpGR1AybXVhZ0Vrd3VWUGUwYzlxR0I1SG5aMEJGaE1pYWZS?=
 =?utf-8?B?S2JrbzhIWU8rUk04TnpuTUMwdEFvM3YvZ0Y1ZEljNThqNDJmK0VQTks4NFBH?=
 =?utf-8?B?STRpZzYwdUlJZ0FkbXh0Wk9paFhxQW9ZbjVJSmVkVDZXWlBpSnNOeTlzYUUz?=
 =?utf-8?B?QWJITVFwb29oNDFscG1YZUJGZzArQmhacEpTVC9RdXNZbFRkMStTT3RKbFRn?=
 =?utf-8?B?clRxWHBTZ0h1NVUvOWxpSUNGNnBZZXJkZWRjTEJPYWNRSjRHV1pjWjdIN3h5?=
 =?utf-8?B?TW9mcm1QSDdNaVRVV1lVL21RNTdSQk5EQ0szRXpQb2lXd01rNnRyZ2Jvc1JC?=
 =?utf-8?B?QTFDS0w5MjlCSkN3VUNiM08wYmhZdVA2aEorMDh6UEFxbG9oZWJGZjFOWG9G?=
 =?utf-8?B?WUdJb3JScTMrYTAwMlZTc1FiNWhUVVkrMS96cjMxclNSaVZtQmR2S0N0M3Fk?=
 =?utf-8?B?UWNVaVV3NkkvRVdxYTM0MGVVOFI1RmFucTd1UDVmQkJHenArSkR6aDNxL3Bw?=
 =?utf-8?B?M1QvOHU2SDQzczhmWWRMUUlad0ZSUW9SOTZFNmdRemVQVW40ODFJMlF2YkE5?=
 =?utf-8?B?UFlJeTU3RGpoSnlMclR3eFBwTUlTMUJwSkM5eTdwYU0wZ2x0UzNxaXQ1QUs1?=
 =?utf-8?B?R09KbkNXWEI5ZGhLRGVyTUpoMEVqdzB6Y3V3WnM0WXZqMEhZOWcvMnlnTlN0?=
 =?utf-8?B?RlV6YjB4dlhQbVltNTR4UHJCeEZwUFRxWTFBOFVIVTJpWS9YUXdSVUV4MFd1?=
 =?utf-8?B?UmlRQ0NKZ3ZYakFVM0hVRnNIak9JTE1qVlBtZGxsZklPd1hJVWlUTFJUcFZW?=
 =?utf-8?B?VERHZjdscHZUQXQzaHNLWHdOdUkzQXo4bUttcXpKdU9vQjZva1ZpZnBVTEFY?=
 =?utf-8?B?V1M3WnVVd0Z1dlJHdUMyUHUzMVVuTTNWcVFtZkN0K2xDbHJHdytBSmNHODZN?=
 =?utf-8?B?V2JKa25kV0F2NVFvZnJmTWxJdXBTRllYKy9DT3ozSGRkUmFrbC82c3RmcTJv?=
 =?utf-8?B?akVDK3ByRExkVDNwVHBSU0NnUzdwaWptdVI3SG9uQUZyNk9FNGN1eWNkZjZ6?=
 =?utf-8?B?UGVVc2lSa1hWUFdRTjhBWHdicDRONk5rMGZWSmliOVpDZzhJOGpyMHo4WnpQ?=
 =?utf-8?B?RDFIL0kwREdmaUhISit4ZE8zN3JMT3VOeENFbmg1UEViQzFsWnBLRWRMY1U5?=
 =?utf-8?B?T2JuUkxFMmIrNGhBaGh5MXJZTE9HVUlOSHNVVnZGQmJsWmk2S2kzTWdnbUMv?=
 =?utf-8?B?NDN5TnBuTXIxcE9ZaVhvM01TaGdzRmVJUlA4QVBTYitYamdXdXhBVGVaZzYz?=
 =?utf-8?B?UktKQ2RGQTdjRUdkVVZYK3BISjdRbExnb3JldGkzaE9ZWXFYN3dNNzRaZHRT?=
 =?utf-8?B?TVRFblRSV0VLYzIwbGNkWHR5ZnlLR0w1ZnNRTDVHWFVhdnM1MmZIbncrbS9i?=
 =?utf-8?B?TnN2TFRnTDdvSmt0WUwwQ0FvS0h4Skt2ZVJyWXgvdStXUXVreExVVmRHQ29B?=
 =?utf-8?B?dEpSUmJOZEJwZ3c2UjhWeStta2ZOVTJWeDBKOXhFUnE3L0V0QkpDVjFmVmxj?=
 =?utf-8?B?T3JGeU5rcVlmVFlkUlpQUlZUMXBtbWRtR0pnYnZ3K0lTZ3Fpdk1kWDNVdDBJ?=
 =?utf-8?B?UTJnRkR6LzVXcHBGWnZsMVQwWnNJNHB2RTNJd0J3RVc5ckhKT1k2SmYwLzBj?=
 =?utf-8?B?M0FFMXFQejJMcDNxT1o1bmFaY21Pck1HMEZISzhIUzFsUGJLZUtKZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 102534fd-ee60-456f-de85-08da141b67f2
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 20:08:36.9019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tgg9i3FXs7OVQZRpagmfav/jVdJhxfdMXZ0Lzw1pzFR9DGk1PlIApNS5TuwI71ExHTpRNg3Uo8WUqDr97Z4w3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2929
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
Cc: rcampbell@nvidia.com, willy@infradead.org, david@redhat.com,
 apopple@nvidia.com, amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, dri-devel@lists.freedesktop.org,
 jgg@nvidia.com, akpm@linux-foundation.org, linux-ext4@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-03-31 04:53, Christoph Hellwig wrote:
>> -	page = vm_normal_page(vma, addr, pte);
>> +	page = vm_normal_lru_page(vma, addr, pte);
> Why can't this deal with ZONE_DEVICE pages?  It certainly has
> nothing do with a LRU I think.  In fact being able to have
> stats that count say the number of device pages here would
> probably be useful at some point.

Maybe at some point. However, this is in a function called 
"can_gather_numa_stats". There are no meaningful NUMA stats for device 
pages. I agree that the name "vm_normal_lru_page" is not optimal in this 
case.


>
> In general I find the vm_normal_lru_page vs vm_normal_page
> API highly confusing.  An explicit check for zone device pages
> in the dozen or so spots that care has a much better documentation
> value, especially if accompanied by comments where it isn't entirely
> obvious.

OK. We can do that. It would solve the function naming problem, and we'd 
have more visibility of device page handling in more places in the 
kernel, which has educational value.

Regards,
   Felix


>
>>   		page = follow_page(vma, addr,
>> -				FOLL_GET | FOLL_MIGRATION | FOLL_REMOTE);
>> +				FOLL_GET | FOLL_MIGRATION | FOLL_REMOTE | FOLL_LRU);
> Overly long line here.
>
>> +/*
>> + * NOTE: Technically this should goto check_pfn label. However, page->_mapcount
>> + * is never incremented for device pages that are mmap through DAX mechanism
>> + * using pmem driver mounted into ext4 filesystem. When these pages are unmap,
>> + * zap_pte_range is called and vm_normal_page return a valid page with
>> + * page_mapcount() = 0, before page_remove_rmap is called.
>> + */
> Please properly indent comments.
>
>> + * zone, as long as the pte's are present and vm_normal_lru_page() succeeds. These
>>    * pages also get pinned.
> Another overly long line here.
