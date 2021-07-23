Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1991E3D3607
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 10:02:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08EC26E92D;
	Fri, 23 Jul 2021 08:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2047.outbound.protection.outlook.com [40.107.96.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DAA36E92D;
 Fri, 23 Jul 2021 08:02:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oa1ZwXTUOFGtYYXQeXXSQpxEX1YKwtFKoVDYnt/Y355fNohMdYWEI1LSfqIEOL7RYMiWEXxpUDi1EmbrqYYeVjSLRSL0RvzgHUK0S3rJS+wmDIPbOchfNrSPNUP8PHTE1b1WQjK8JGGV9CtACtLR5pbDvtG4HPSb6V+hgCxuWBFutQv4X3R3nwThFt3W8t8HxzrzkexF2300o3g28WamBwlPI5GfLiPBsKibVDIXML8JG/khAj9kaGaBmW0p7eG2vQP1nSt8xpGlEWk1ohXQTw5K/anh4+fpAZwUys08JavsnVk0uwH0ARDcRBAFJftKz5D9geXVd9MU9PDo0n+YCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vq4+8Lyu2CH41Gi0rrFnDxpytAP//I1r9I/7upBb8o0=;
 b=KEKPiKFbaKpLReW92yxqchYumywj/tRNas+VznG5qNFOxE3G/yK+kx3TAsJ8P5kFYOkjNGZ6JLP1qj5p7g7672Edce30gzo1ZVF0owbbsVMQbSzXEqyXXJbP36B++ikaIvHSAFI8Tn+9h4POQ1YzR9hKOicMVYVwZq4Wa2Ruqu+Aj5Sf0hUw0xPpKxfYmGjw4s6Va+hIncLDouEFqy3ypily3gmAkiFJsjXIUoG07hjvfsY83MXoPgO0A0Zsq7KNb01tAkYj+m/oqM9rrUJe34H82QUODuJq+CRLZ0vlr1y5xF0yqPMBmmTpkbsJh0c+s7t16WIbAESUw2Q0anWZjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vq4+8Lyu2CH41Gi0rrFnDxpytAP//I1r9I/7upBb8o0=;
 b=IGB71ssdK93V65tBQF7HeUuX5iMxx+HnBH75CW7e4cqbaSsXLjY8Q7em+KZybDTv2r31iF0QxhHt7HaHKB7FDrG+J3ofrb2MAAvpBqDj4Trm0qGCOiRm0ADIK3qu88MTB6pPnIpliRzNLzhjMZkfaqVgKZDWSfixbQvCoFCLBak=
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4357.namprd12.prod.outlook.com (2603:10b6:208:262::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Fri, 23 Jul
 2021 08:02:46 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4352.028; Fri, 23 Jul 2021
 08:02:45 +0000
Subject: Re: [PATCH v4 3/4] drm/shmem-helpers: Allocate wc pages on x86
To: Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20210713205153.1896059-1-daniel.vetter@ffwll.ch>
 <20210713205153.1896059-4-daniel.vetter@ffwll.ch>
 <0e4eefe0-9282-672c-7678-8d3162de35e3@suse.de>
 <YPpxh0QhILXESykX@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <be56fbe8-5151-ef8d-13cb-0b8a71f4d1e0@amd.com>
Date: Fri, 23 Jul 2021 10:02:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YPpxh0QhILXESykX@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR03CA0032.eurprd03.prod.outlook.com
 (2603:10a6:208:14::45) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:b5eb:ae77:ac:3a23]
 (2a02:908:1252:fb60:b5eb:ae77:ac:3a23) by
 AM0PR03CA0032.eurprd03.prod.outlook.com (2603:10a6:208:14::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.25 via Frontend Transport; Fri, 23 Jul 2021 08:02:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 889af82e-1a7b-47e1-1aa0-08d94db0413b
X-MS-TrafficTypeDiagnostic: MN2PR12MB4357:
X-Microsoft-Antispam-PRVS: <MN2PR12MB43577B5A5F56AD9DEA29821883E59@MN2PR12MB4357.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tySJ1N3YStAjzwPL54KOpo7Bkj54T5CouzL3cmwhi4mTAvGT30bZywwSvOm/ZtM8YLdnE7Ev2fAC3+iXPulCYMGoVCo/dDMRZp12TIpyG+dr/CqPJYn9mHgezFb4X7/ajgRMBcriq7XX2awUR7s2bGjiQ2pjlxivRBLNSlKDXFucqXwq/7VCrmQmVPh/xXyeFH+UU0ynSrXlfVkCcw9GTDtSCcg7IYbzoLFveCJeLHh+e4MwYxhe5MyW9/FBoA2HbksFhBb6vujlf3Dvp3kf1npZTxq/YMt9fAOIwDsXvNinAg9PxtxGOAotPALY5jVb1Et8Ve3cq4vJSaqU6SddKX85hUDGXueW6ixDXDEcRBOBciE2l7iNRWqYiBCB03bBG2h4q/IFYDcnHG+RFqAUhOEoh/SlXEK2p6YXSod8FyFLDRJvGpoYPUuNYW5Z9C3Y3KD+Z/Nv7tcBd1kGFYX+XqQ6OZtJE9pEJgrnt6Qr3P3Sfe3RR/aExxEr9Hp/qIvt4CgQBBq3ppiqYERDrp1ukijYndtg4S7i9F9Xtiw84qI02Ojp+hZxVcv57CjQLTenXBjoia686gTTZlggnr5Fgx/ym4q+KAKoKFYUuj2LdUhgrmHVa//3C7qMHBoed4J0SwIYBcMnpy0Tu+UWmjJDmoCgwjKbMfYKlGkS1EyWwJBWACznOxRuDBmT97KVMq/kQCPqH/ZrhZJJnj2HfTaGtI1fNEBSiAwoYxBnP5POsDeCbefmS1U0WNjPKb/LsRcC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(36756003)(4326008)(110136005)(66946007)(66574015)(316002)(2616005)(2906002)(8936002)(66556008)(66476007)(54906003)(8676002)(31686004)(6666004)(186003)(31696002)(83380400001)(478600001)(7416002)(5660300002)(6486002)(38100700002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b01NNGxYeStFZDk3Q2U2aml5SGV2ZkJHb1lLNzdSZVJ4cTdQTDB0N3hIYVFi?=
 =?utf-8?B?VTJ3K1dXT2F3Wmt5RnNaTktrcCsrQnpjeGlsWm1qYTBJWEpERWhacFREcy9t?=
 =?utf-8?B?USt3bjh3K1lVS2trV3RJa1g5aDZJa2lrZEkzWWQ3enY1cVN1OE9xNVRVKzkv?=
 =?utf-8?B?M09Wc3VxOUgyYWdCZm14WUVodjZpUFBXZkpBbHpPYzQrZHRLNm9nMG0zSDhP?=
 =?utf-8?B?RXlIazlEK0FrZk9lNGl6VnlGRGg2KzZNSFpxOFdrYSsraGNUaFVJNXdSS1NN?=
 =?utf-8?B?SXozY3J4L0VOUnhuWGNVdGJOWUJlN25mUVJJVjVjNjlxbmNiZHB3dEhzUnJL?=
 =?utf-8?B?Q25mQzZuNXpUT3E0V3VvZGFhSXJDS1hsMjdRNzI3QnJ6NHNQeVEwMFc5bkF0?=
 =?utf-8?B?QytjSzMzc3BJY05pVU9QNlZ2dWpoeHY0OUdEQllGM2J3aWcyMW02eWVtQUQ3?=
 =?utf-8?B?c0hKcDUvUVVBeEkzdmVhd1dTRHN4aWYrZHUrVVlRa1h4ZVNTUG9yQzE1U0p1?=
 =?utf-8?B?VTNGTThoZjNKbUlickxnT1FUREx4QXUxYkVBdmhRWk9XR2Qxa0R6Nmpia1o5?=
 =?utf-8?B?VDRwVUlTNlpBdk1EQ2hnU2JHRC9YU1MrdjlZTiszS2RKMXJTZ2lMTm0vSzA4?=
 =?utf-8?B?Njl6RFkxVlpBR1NVcFNnTWNZaXVOZHQwSkoyUE9ySFFxc1gzcnh2TVhBVnFp?=
 =?utf-8?B?L0M5a0dhNmJTc2F3RVVIZGtXNkJzcG11RnVKSGZvdW5WQlJSNVUzTjk0cmZR?=
 =?utf-8?B?Y211eFNMUTVtZUIwMEczUWplNGJaamowRnM1YUdsQlBhSnhNUC9qd0dnQnFG?=
 =?utf-8?B?R3dLOEIvQ2dkZWFOTTArRjJFTE1HRWR6ajRxTEhLNCtoVXpBQzhYV1JjL2Vz?=
 =?utf-8?B?RmpwVGg4cDhFbnhMeHByRjRlTVBWUmZHZEFNRVEzRm1maEhSS2dDM1ZBc3Ro?=
 =?utf-8?B?bWNGOTAzL1hXOFpSWHhRb2UyOUJGRitCYW9POHpadmNySWVKYWNiQ1orSld2?=
 =?utf-8?B?WWNNUDhrSjczTzlETVFqSWtMZUJpeHNJSEdnM3g4c0h2YUlXcm13MXE3V0F0?=
 =?utf-8?B?Tjd3UWhWYlFMQWkrWjFBaTR6eFJGSzY2aWVCRVF2bGZpM3ZsVXhEdE0xcjB0?=
 =?utf-8?B?cVQyTmVxM0JIYnpaVmZJbVNSRFFwRWFSM05sSHJXTVg0c2lCVGZIZk55MS9P?=
 =?utf-8?B?cHJFRk83TWx5VnZXWjZwRHdkQmpYR1QydXlMWHlWaGZNalRwR0t2Y1gzMlhG?=
 =?utf-8?B?WkZxMTQwYWNSWVZLQkhhUjAxOVhqWDh5Qko3RTViUWpLUU5BVW8xN0FoQ3I3?=
 =?utf-8?B?Ulc4QWxJZ25FWUppeGI4L0trbHZkaVh3USthdjRva1FkZ2JNNHJCSi9yZk1K?=
 =?utf-8?B?SnFscTZiMlJEVCs3VFdGbE83SmJiMFpqdk9oWERmMjg1K2tEUHI5bDRXY3ht?=
 =?utf-8?B?dXdUQ3BkRGtyZ2E1L3lTZ25acXlpQU53SXl4Q0JDL2NDQlo5Z2JQRkhmZmN4?=
 =?utf-8?B?Rmw2QnZGMldlRmN6MnpuYlFObFFLaXJlSmFsbDEwVWJPRU9WZDJwV3lTeFN4?=
 =?utf-8?B?UlNOc3NIS25BLy9FNkF2Y0FNTWJQMFA2QzlmM3RFOWpWVytSWTNIK09XRnBx?=
 =?utf-8?B?elZVQ09oV3ZzcTcxTkFzZWVKWVFvZGZ1VnJneWRNY01iWjlHS01TMXVmY0lv?=
 =?utf-8?B?NFFtR2VodzJRV3A4djF6NXR2a3FldnIyblNFQTVqNUZ0by8zSzBPU0YvOGRP?=
 =?utf-8?B?N2Q0UlpEOVl0bkxkMkRCQVBycVVRRlFsRi95S3d1TzBiOEg2Z0tPc2R2bmhR?=
 =?utf-8?B?R0RDQUVzU2MxZnNNOGpGSGZLVzhFQUt0QjBFZ0RVMnV0bDAvOGtxUFlBSHZC?=
 =?utf-8?Q?Ll6/V+HfZ/u5k?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 889af82e-1a7b-47e1-1aa0-08d94db0413b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 08:02:45.5220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qrzTCy4nJp6/J5R52J/qaieYYS7yB8PU6NW1Pief3GG671sr2LklViKifMd/VFO8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4357
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.07.21 um 09:36 schrieb Daniel Vetter:
> On Thu, Jul 22, 2021 at 08:40:56PM +0200, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 13.07.21 um 22:51 schrieb Daniel Vetter:
>> [SNIP]
>>> +#ifdef CONFIG_X86
>>> +	if (shmem->map_wc)
>>> +		set_pages_array_wc(pages, obj->size >> PAGE_SHIFT);
>>> +#endif
>> I cannot comment much on the technical details of the caching of various
>> architectures. If this patch goes in, there should be a longer comment that
>> reflects the discussion in this thread. It's apparently a workaround.
>>
>> I think the call itself should be hidden behind a DRM API, which depends on
>> CONFIG_X86. Something simple like
>>
>> ifdef CONFIG_X86
>> drm_set_pages_array_wc()
>> {
>> 	set_pages_array_wc();
>> }
>> else
>> drm_set_pages_array_wc()
>>   {
>>   }
>> #endif
>>
>> Maybe in drm_cache.h?
> We do have a bunch of this in drm_cache.h already, and architecture
> maintainers hate us for it.

Yeah, for good reasons :)

> The real fix is to get at the architecture-specific wc allocator, which is
> currently not something that's exposed, but hidden within the dma api. I
> think having this stick out like this is better than hiding it behind fake
> generic code (like we do with drm_clflush, which defacto also only really
> works on x86).

The DMA API also doesn't really touch that stuff as far as I know.

What we rather do on other architectures is to set the appropriate 
caching flags on the CPU mappings, see function ttm_prot_from_caching().

> Also note that ttm has the exact same ifdef in its page allocator, but it
> does fall back to using dma_alloc_coherent on other platforms.

This works surprisingly well on non x86 architectures as well. We just 
don't necessary update the kernel mappings everywhere which limits the 
kmap usage.

In other words radeon and nouveau still work on PowerPC AGP systems as 
far as I know for example.

Christian.

> -Daniel
>
>> Best regard
>> Thomas
>>
>>> +
>>>    	shmem->pages = pages;
>>>    	return 0;
>>> @@ -203,6 +212,11 @@ static void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
>>>    	if (--shmem->pages_use_count > 0)
>>>    		return;
>>> +#ifdef CONFIG_X86
>>> +	if (shmem->map_wc)
>>> +		set_pages_array_wb(shmem->pages, obj->size >> PAGE_SHIFT);
>>> +#endif
>>> +
>>>    	drm_gem_put_pages(obj, shmem->pages,
>>>    			  shmem->pages_mark_dirty_on_put,
>>>    			  shmem->pages_mark_accessed_on_put);
>>>
>> -- 
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 Nürnberg, Germany
>> (HRB 36809, AG Nürnberg)
>> Geschäftsführer: Felix Imendörffer
>>
>
>
>

