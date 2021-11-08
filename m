Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1A3449E4B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 22:36:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F6D6E245;
	Mon,  8 Nov 2021 21:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2046.outbound.protection.outlook.com [40.107.212.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36A26E29D;
 Mon,  8 Nov 2021 21:36:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ru/fza6XspOxT0s03bWPTr8vMzUjHxBBYTVvY6HZhtWpteQdYbcgiSJ+r0FvU4O43pCHOBkeBtX462Vh4NmFqeqWa9JUgrPkZE3ifIZbt0T4adW/xcpn4+q0Wp570YvGSmUWBTLz85422/CAl0JeeYKRFpDBWqBmYOuwkIq7WspyhWlFQbeeHoH2VEPJvMXwCTX8m9OWVLhu3hkL6ypHaK8UpVxWXs/SO8w9pOv0xEPzDXfjLQqg5v3tgxe+ZuD3d1LS2UGDDMl2zzyebt0Trm2+tJrRbbiZd9ayfMyimbt5RCpxKsFrSVdDBSszM2sE2mx6/CD5PZ9kEhddY81CbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PuoIfhv+proPdNwElPVjr3vSTDTeG8ip6jt0twe7x+U=;
 b=H3Sc88yL2saJTFW59+2OBJZtT3U/2Op88yJimFuIiHyfg48+GfnfMGYSLPaGX4WWMpMoKV1X6/I7KmAC6a4FYsqwPgg0lBFv3jzjP7if33dIqN12P9GNs6E/CUNUY4juYtv+VYxNS84zcI2e6rUCGw4HFyCF1VfMYRi5OTBsG6t5JRsQ9JMyqMJidFv/eDsXy9lEpz1nf5DV4aXLeS3MZ8/A0N2pqdth8s7+6BEFQm/A0KsU/BzZofmyoiMy5uC312JkbcJwqe5B1ozhq4aIPlG4Va9I9KJjSwu5YnmBK5OZ3odeZZfZybPrMGQmdZBEFxvgmEvCuPuAzcnXZn/6bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PuoIfhv+proPdNwElPVjr3vSTDTeG8ip6jt0twe7x+U=;
 b=cissT8J90dtgctNskazGrr5AnxsStKx9kKDFY9/LO5ru6PFhQHBKxrBw2+UY0BinWFat5m0m4+yFy9VZSvXcFE+ctgxoyqWhZmEyOkdx8r29fFQUuMmm84eRTP+2yaH6UB4KX3OJyOhrZnh/yY+/vm5pyYvVNmiayK8EdxZJIk4=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MN2PR12MB4255.namprd12.prod.outlook.com (2603:10b6:208:198::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Mon, 8 Nov
 2021 21:36:28 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6972:7084:df02:6dc3]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6972:7084:df02:6dc3%9]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 21:36:27 +0000
Message-ID: <09e9294f-71cb-fa93-4214-0769f7505b0b@amd.com>
Date: Tue, 9 Nov 2021 03:15:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 3/8] drm: implement top-down allocation method
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211025130033.1547667-1-Arunpravin.PaneerSelvam@amd.com>
 <a5fcbbc3-6c06-d676-3403-1e77a04ddde5@intel.com>
From: Arunpravin <arunpravin.paneerselvam@amd.com>
In-Reply-To: <a5fcbbc3-6c06-d676-3403-1e77a04ddde5@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXPR01CA0012.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:d::22) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
Received: from [10.138.142.32] (165.204.156.251) by
 BMXPR01CA0012.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:d::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10 via Frontend Transport; Mon, 8 Nov 2021 21:36:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7d583bf-7d55-4e66-5212-08d9a2ffd21c
X-MS-TrafficTypeDiagnostic: MN2PR12MB4255:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4255359236CE9E7C6929DFBFE4919@MN2PR12MB4255.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9hEoJe9TIsoA/mVR5TzfF/ln3Jb0boUUqic3EM8PFAMDhBOxCJ4xTXlicMhve2B5deifRdDl4hJzs4lZyTmZxTVIEr1evNyWAoBdg3AT+MNDajDn3g5QUmj6t9GyXb6uJutq88b/RMG3D2NwlZuWrmOedM6lLAIdVKYpDx6fUxk3xlKQ3xrfVA629QUrsLwpKADDEARcAx5Tw0ooJnfbQuFuTmMIk8y0dPxk4mM2P01eZ6XK4vP6IkxGjzka7CKq6jjEbRAetBtf5dYplMYc/EDZhGmOBjt2HN2F6ymnZwiFsFXxpSdE+hfGZIqGOaXgkJfPrRvsN3hryV8SG23AJMsWR+rLaHMGoU28GIlL+0w/C+N6zI33V4pCcpXeB9alXf4kVhYGzlJfev/hY5cCQgEqALl37CWCT6qo75/6VxZrJilUs9b2Q7D3ZOnNe34uHP18Cv3RhMsDg4vGE+hBpdaSFqHHrKm0w1q4yePHcH7vC4vkWILebphOYL3/Aq8SOdgUwUcN+h+yDe+Vlz3rbzvJ9FMh6Vmpe7QH0wCNVvhPa4LGC6QW36wDYxUmBAvDUwsEHjOPEQAhw/2C2YASHCu/X4ympy7LWWUV55FxdHfpjyCD0YSN4912LkAUVeIezR0HTr3VBATnatEbyBXHqbINh+Ry5FNUHSwb8qI38cRGdikIy8OsKVGP5zWN/o37sQ5ZdOfTtot5HZpeIMnXUdJXiup+0pIGWntwi1IZ/FA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(956004)(86362001)(2616005)(2906002)(53546011)(4326008)(36756003)(31686004)(26005)(66556008)(186003)(5660300002)(6666004)(83380400001)(16576012)(6486002)(316002)(8936002)(508600001)(8676002)(38100700002)(66476007)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1EzQzlKbEJxYVZtZWc3cDZDUFd2V3ZHanFvWTRDMlZWR283Umd4TEdvWUZk?=
 =?utf-8?B?R01PVGdlK0xyMzBLei8wdElFQy95OVNkSEpXM283VStmVmR0K0dtUTF5emtZ?=
 =?utf-8?B?WGt3Y09qSzFjc3JzWHpiUU84T1d0c0NYSldMdVNTc3N5bEtTbnk2OTI4eHJU?=
 =?utf-8?B?K1BuZ2p3UlQ4ZUtWaWsxVTZsUTNrRG9hQm1hYXFMUUZPZEgrL3NjNDdYL01p?=
 =?utf-8?B?QkMxeUlGbFExRkEwQjZVZWRGbkRRNUFCcUNTc1hjbTJjRnhqOVlVSHRlaU1X?=
 =?utf-8?B?T3AzODNRTjlEejI3NnBuUUUvQ0ptZkdGSmYwZys3QTVaWlVhWlVZSlNTUGYr?=
 =?utf-8?B?dWRjM0ZqajMrMzg2aEVQSGtVczIra0xTeEFZQ3FKdjJqcnp4QkZXbjRUNFpr?=
 =?utf-8?B?WGdudkJrSGwyWWZVbUJZWTRzdFRGbVo2Z3d0Y0xmbzVNN0ozd3VkZEZjenNl?=
 =?utf-8?B?WXR5d0xiWmdwaVZLWUU1QlJVc2Q4cFJDRUVrcGcreTJCczF1YTdUOXZMTGNh?=
 =?utf-8?B?d0lSU1lZWkF6Tkw4OTJ5c1ArdzRwblVOaEMzVU8rOGxmK3NiRk5aVjlqenpR?=
 =?utf-8?B?MmhZTXpTZ1dhemp5bGtaUHpUSGNwS2xEeDFqUUdhYWtGZmlSUEJQM2ZqbFJr?=
 =?utf-8?B?VlpOOFZjV3JMUzlCSVdXaVJ4RUdjcDZiVUlGMzJsTjQ0Y2lGQkxUV3Q4MzlM?=
 =?utf-8?B?SWpWS2ZTcjhIS3RTUkJZNnAyYkxxZHVOR285L2NDY2dDM1cwMFdOQkVvY0VQ?=
 =?utf-8?B?YzJnWHRjT2FlNHJuaHJjanFOczA0L1V0TUMrMkdoNWpObXJmUTVhc2ZVZ1Qx?=
 =?utf-8?B?T1JIWmJtTmNiVndYRWs3dnFwUTM4WXJXMkdxcTdIbnBaaHZ3d0xNOW9OODVZ?=
 =?utf-8?B?dWs4a2JyRXFnTlFJaUtlUWFLVnREdTkyWHlzZk9oUExUR3hrdytJT1RXNmZa?=
 =?utf-8?B?NkZZaUpMSUhrVG40K2szbXA2S0FSdzl6SHhkUEhoMWpOSWFCa0RKZlNpbHVs?=
 =?utf-8?B?YWFVbzY4Q0xGZVdLbFJzTFdxaW9HZlMwclFjTmdOWllSTExhdytIM0VWSnhT?=
 =?utf-8?B?TnVQVkdMbGRibGw2WDBoSks4K2Z0L1EvckR5aDhCZDVCTGJyOGw0KytnOHR3?=
 =?utf-8?B?MjdpQzVHcjh3UlNFYVgvakF1UDZxZnRCTHFrOVpkaDhuNGR4VlNHME9Nc1Y0?=
 =?utf-8?B?TDRVTEJKWU1RRGIxZmQ4NmdNTkxxOWlUbjk5TU5OelZ4a09FQlM2b2JwNzR5?=
 =?utf-8?B?UER0N1ZKSkdobHRNNFV4OWpPNzZtVDI1YTJxaEpTaUxaaXN2V1FyZXVSeVJs?=
 =?utf-8?B?N1JvRFZhb0ovVU96bjJaRCt0UGN0djg5MEUvYnN6OHR4NlppdFpTdnFmYytF?=
 =?utf-8?B?cTBmR0o1c0V6Y3RzUndxcndGT0xiN1J0UndRVmpSMm1vdGxGQUlXMGJ4SkpG?=
 =?utf-8?B?Qzk4M0M3SU42MkVvRmJhNG4wNUc0TEZjRHFnT0hocU5qOWMwcEt5RjVlY3VF?=
 =?utf-8?B?SG0zUUhXKy9wU1FhY0tBaVFVK0IzVkQ5UHZJdmJNUG04aHBFRVB2SlMyVGpS?=
 =?utf-8?B?eHloMExwVlNmYW5wWVRsRXR2ZytXZS8wZ2hvZEhUWDRIQ3JPK2NtbWNQYm9l?=
 =?utf-8?B?VUlBc1lYZ2gxUC9WNElvdWsvdWhuSE5IVVpzeHFyYnBjRldkdDZlTWV4RnJx?=
 =?utf-8?B?TXdoeGt4SjdiYnc0d0lQeFVqV1lRVkNJYjM5QWtwZmJVNmZ2MkxacklkcXpS?=
 =?utf-8?B?eXloNjI0ZkNuTEcxNUJRblJSK3AzYWR4cjFrSjk1a0o4ckE5U3Z1OEJYZWZJ?=
 =?utf-8?B?UWNKSjNwcDBYRzEwYk0yWklMcFpNbE1aTmZmck4xZzNtbmNLdmNHck0zUEtE?=
 =?utf-8?B?Q1ZoYTVEZExVcVUzYU1pdktVNlB1K3ZLb0tnWmtEZDRsOWVzL2daczNMYUYr?=
 =?utf-8?B?dlVSVE1kaWR5SDhHY2Y5Sm41Zm5XY0hIdm45bll3NTlqVXMyQVM3dzA1UTFR?=
 =?utf-8?B?WlhyZGdDMFUvQ0xXOFVmVElYNGhmNDl2ZzRpcVpuN3lyY3ZackpUM2dRL1dz?=
 =?utf-8?B?b09rSlpWNWc1dDc4eHVFRGpvSUI1dFNnTkdKQ29RMmRhWTF2NjBtNEVaNE9L?=
 =?utf-8?B?b0oxTlZxdDZZMHkrOUVYbmVEUHZEUTcvenpmK3Eyc2pWU09Oek00K2xTOGdW?=
 =?utf-8?Q?81pSvvgWpFJ9DXUOmiJFXJQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7d583bf-7d55-4e66-5212-08d9a2ffd21c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 21:36:27.8163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cfqv21Kl2q/nogTX5gxsh6P2FgIVg40XyCoyMfg2NSFfyq/PLypeuaWxEPa69hN8/rS4d0liTb8Fv7JaNzWe7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4255
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
Cc: alexander.deucher@amd.com, tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 04/11/21 12:14 am, Matthew Auld wrote:
> On 25/10/2021 14:00, Arunpravin wrote:
>> Implemented a function which walk through the order list,
>> compares the offset and returns the maximum offset block,
>> this method is unpredictable in obtaining the high range
>> address blocks which depends on allocation and deallocation.
>> for instance, if driver requests address at a low specific
>> range, allocator traverses from the root block and splits
>> the larger blocks until it reaches the specific block and
>> in the process of splitting, lower orders in the freelist
>> are occupied with low range address blocks and for the
>> subsequent TOPDOWN memory request we may return the low
>> range blocks.To overcome this issue, we may go with the
>> below approach.
>>
>> The other approach, sorting each order list entries in
>> ascending order and compares the last entry of each
>> order list in the freelist and return the max block.
>> This creates sorting overhead on every drm_buddy_free()
>> request and split up of larger blocks for a single page
>> request.
>>
>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>   drivers/gpu/drm/drm_buddy.c | 42 +++++++++++++++++++++++++++++++------
>>   include/drm/drm_buddy.h     |  1 +
>>   2 files changed, 37 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index 406e3d521903..9d3547bcc5da 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -362,6 +362,27 @@ alloc_range(struct drm_buddy_mm *mm,
>>   	return ERR_PTR(err);
>>   }
>>   
>> +static struct drm_buddy_block *
>> +get_maxblock(struct list_head *head)
>> +{
>> +	struct drm_buddy_block *max_block = NULL, *node;
>> +
>> +	max_block = list_first_entry_or_null(head,
>> +					     struct drm_buddy_block,
>> +					     link);
>> +
>> +	if (!max_block)
>> +		return NULL;
>> +
>> +	list_for_each_entry(node, head, link) {
>> +		if (drm_buddy_block_offset(node) >
>> +				drm_buddy_block_offset(max_block))
> 
> Alignment.
[Arun] ok
> 
>> +			max_block = node;
>> +	}
> 
> I suppose there will be pathological cases where this will unnecessarily 
> steal the mappable portion? But in practice maybe this is good enough?
[Arun] we can go with the other approach, sorting each order list
entries in ascending order and compares the last entry of each order
list in the freelist and return the max block. I think this creates
sorting overhead on every drm_buddy_free() request and (max_order -
requested_order) iterations on every top_down allocation request.

With this method, there will be no unnecessary steal of the mappable
portion, but I guess there might be a performance hit.
> 
>> +
>> +	return max_block;
>> +}
>> +
>>   static struct drm_buddy_block *
>>   alloc_from_freelist(struct drm_buddy_mm *mm,
>>   		    unsigned int order,
>> @@ -372,13 +393,22 @@ alloc_from_freelist(struct drm_buddy_mm *mm,
>>   	int err;
>>   
>>   	for (i = order; i <= mm->max_order; ++i) {
>> -		if (!list_empty(&mm->free_list[i])) {
>> -			block = list_first_entry_or_null(&mm->free_list[i],
>> -							 struct drm_buddy_block,
>> -							 link);
>> +		if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
>> +			if (!list_empty(&mm->free_list[i])) {
> 
> AFAIK no need to keep checking list_empty(), below also.
[Arun] ok
> 
>> +				block = get_maxblock(&mm->free_list[i]);
>>   
>> -			if (block)
>> -				break;
>> +				if (block)
>> +					break;
>> +			}
>> +		} else {
>> +			if (!list_empty(&mm->free_list[i])) {
>> +				block = list_first_entry_or_null(&mm->free_list[i],
>> +								 struct drm_buddy_block,
>> +								 link);
>> +
>> +				if (block)
>> +					break;
>> +			}
>>   		}
>>   	}
>>   
>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>> index c7bb5509a7ad..cd8021d2d6e7 100644
>> --- a/include/drm/drm_buddy.h
>> +++ b/include/drm/drm_buddy.h
>> @@ -28,6 +28,7 @@
>>   })
>>   
>>   #define DRM_BUDDY_RANGE_ALLOCATION (1 << 0)
>> +#define DRM_BUDDY_TOPDOWN_ALLOCATION (1 << 1)
>>   
>>   struct drm_buddy_block {
>>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>>
