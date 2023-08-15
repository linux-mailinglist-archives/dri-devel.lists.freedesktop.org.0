Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6831777D5D5
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 00:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C2B10E27C;
	Tue, 15 Aug 2023 22:17:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::623])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A3510E045;
 Tue, 15 Aug 2023 22:17:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NZrYv9Ly0AyFytksDhjFvujrvw7kRfQNlPTJ3J8J65DGVT4zoHjJ8ppnTSbd/BWb8A+DGN9ZZlmHXbmRhx+iEUtT28Yu6F/eoNHuguVavNYuwx5d2uqcfhHIEdjEEABOGFWjRmJEUC2T604vZ6JoPww8sef80MexgNX23pkthah2/BOnaW3szMv0iYEd+apS6vyRhb90j2zKevAyqYk0UQ8O9qEXztGMOCKAIYiCmaeQFAJLFybKB5kKrj8p893wnK8ig5FnEwm9pPgmWTLMCToPlZia1WIzcGLSmN4ksL91aO1890U3uBLZ/O7aOmgbpBrbZm6O0/mibszZ/KeM0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2bFySLMNPXXR9p2YjsXtuYN9+bS9WwOBZaxFvrX14Q=;
 b=KQEIJoekNQZxWxTOmjk6zMxVc2EM8guVQxDqXF1z5HFurdvMOmoVFqZPzfKeaIpOtxENj7hT61EmaBhgp4pxGoDVxrPBvT87K7wm8eqrQku9AeG34iu3e6CkFLc1xXVK+yuotB5wjQUGvJHNkE/jkGyrrNXQUQ63GjjkBLeww7PlCsW7ZFWAcJdZK6cEy+eV+nqUqlQjE39aFnes2q+tfrejPF+GMK0Y8x6JATs5hnCfQubJDikkt3hfsfYkyv1VQ8g+yqEjsQDjgh36ejz40AEacSxgKBo8edUzgdJSHN0HCpzP9T12nRhUP4CgfmY8QYoWi8u3sXJE7DAyq/jweA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2bFySLMNPXXR9p2YjsXtuYN9+bS9WwOBZaxFvrX14Q=;
 b=lWdsCnQo1U3fYxhqmRPZKruTE6jZZXggnTouqmUNZidqu/BTsi767GX2bwrp8ZOW5dWQ2Rv8a63uhne55gZ44uC45gvVt6MJnWj8lz+9iip+nqLfRg/6ZgBFJhKBt7bv3t8W9Bb17DqFyzlfbsyEw4V43NZjjI5c6vNTMFevOwk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM6PR12MB4547.namprd12.prod.outlook.com (2603:10b6:5:2a9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 22:17:13 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::ca28:efb4:a838:58fb]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::ca28:efb4:a838:58fb%4]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 22:17:13 +0000
Message-ID: <e0d7d6a2-5c9d-6e17-4b4b-be03deb6c130@amd.com>
Date: Tue, 15 Aug 2023 18:17:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Implement svm without BO concept in xe driver
Content-Language: en-US
To: "Zeng, Oak" <oak.zeng@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "Welty, Brian" <brian.welty@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Philip Yang <Philip.Yang@amd.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <SA1PR11MB699192A66D7A2CC7305A59569214A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <SA1PR11MB6991F9E3107C963BDF95E04E9214A@SA1PR11MB6991.namprd11.prod.outlook.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <SA1PR11MB6991F9E3107C963BDF95E04E9214A@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0160.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ac::24) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DM6PR12MB4547:EE_
X-MS-Office365-Filtering-Correlation-Id: d94a898f-e963-44ad-52a0-08db9ddd607c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KgLtuhwzqEwy0TKKAg91HTktXhLJLhJ+9Q1zXoxjIsLlVaKMg8YnYDtGHIQ1EqcW/24ND6/ytKY73oTsOyzcRcU1tVFql/kbDSBrTDkRwzzazSbAmghskECiZeg4ZlwwBQygIHPZ7FPESKKRZGP7AP1XMTz0K1auk9jPycKpbbsZ88XzstXgMvtVxidIR71k+h07CsARwYcR0c+uAbTAFrxj3O/+j+WlwuXJblo78z6sTTGwheD/RlHC13dpEMr6sgCgEIOiyL9VbBfFc8wVD7W21bVHNWsDBUUvxYWwBJkVTn9RfcUwPwzbbdQy1TQB5spK7S6XuOJRSr0+tPZ9uGeHsLmILe7N8Jxzg/E6BEKjCTBYO8Sjdp+2SnGVqtq63kLtJ/1aKNxWRXJwYG5j1GRR/Er0L/VbEa3Z+QU5q2sdgtXV29YRgNlSQ6FKJNo17JGmJ8YiRTtAf04KtpJu4rICy9ZMWouzvi7L1dxFLDNzrogzsb5KCFzGnb3y7SliLWN7TALhPoKl2v8iMIbya1uYnIfBDi5yZ4Qdj8C8VAfJXq5BUk/UXoU2rt2MLNAb3NykAZA4s8yeCO6sdndrvpfG6ykYLlBTqJ4wmHrfKVgVC16njVNGqbrbIDFqha+DE9qb7hk6AeM8BeZY8abVQDGSvAAFqQUqI0XjFMm4bBg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(376002)(346002)(366004)(136003)(451199024)(186009)(1800799009)(44832011)(66574015)(31696002)(66946007)(66556008)(66476007)(36756003)(86362001)(6512007)(316002)(2906002)(53546011)(26005)(6506007)(478600001)(8676002)(6486002)(2616005)(83380400001)(921005)(5660300002)(38100700002)(110136005)(41300700001)(8936002)(31686004)(36916002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjVONlJuc21pZEQxOFl6aTBuZEZucjdSNjVSVXMxVjdkek16eEpISkdJUE5V?=
 =?utf-8?B?ZGVNUVg5Mjdvbk1rcGVId1ZaL2pyckp1Y2hDMFN3VC81OG9DM2hpb2ZPTTZs?=
 =?utf-8?B?UVNGNEFaWFMwRG5aVVZGbE9Zdmd3Ly85THp0a005b3lJWWpBbjM4Z09hdlV3?=
 =?utf-8?B?UmZ4Zys0VDU2VlpSYmVkem5FQ1pKaE1GVlBEc0ZBNDBQQ1ByNFJnZHQ0Tjhh?=
 =?utf-8?B?d0RYYjFOYm5YNEtBUlNXYk9BZVB3bWFkbnRUYVFNWWx6WS9wUW0vTWltYVBI?=
 =?utf-8?B?V2oyajRMSGRHdngzYVhpNThoU21EaWMxU2Z4Uno1a1A4ZVBKakhoZ0xqTWsr?=
 =?utf-8?B?bW9tcmlRblptV283Tnlqdk9pL1JRNG1oTHZMUHViaFozMDJyaGlyeWczbnRU?=
 =?utf-8?B?ajRQWWVyR0lEYlFvVTJuWXl1Wjh3clNWeEVJNS9wQ000Vzg2bjc4b3N5VFk3?=
 =?utf-8?B?OGtzcU5zS2JGcXlES3B0M1ZNZDI4ZHVBeVhVM3A2MUV1Z0hSaDNORGRGZXRz?=
 =?utf-8?B?cHJkam1VQmNzSElFZ3duV04zSlFUMXloQVFvaWlKZGxpSVR2NGoxYXpwYktP?=
 =?utf-8?B?dWZqajNyVW1WVGVNWWQ4c0I5U1RPaE9NL0pxeGNlSUtwUkNyUjdoS3R0ZUYy?=
 =?utf-8?B?bU1hNmZURFBQanNZa1F6Y21zRE5RUVc4Ym5CUzdRSXdPdXQyeE12c29TR2Np?=
 =?utf-8?B?UHM0clhMOUEyVGpkNGlBZDdFQXBnV25KdENNOElvSEk0QVdudklYOGJJZlRK?=
 =?utf-8?B?dloxOWZmOEJONkZ5aTFhMTdmZWNDUm85QjF2NEdGd2JPRVkyV3g4NTZPNHNL?=
 =?utf-8?B?NFVJNGYzSkJBS2ptOE9tOFBnaUU4cTJ0OUZkbENRUnk3eERpZzJuckVyMUJJ?=
 =?utf-8?B?NmFwWmtlamc2VERmQmVWSUNJT0xBMmNzWURRMDhlNnZLWC82YTRpNElxVDMz?=
 =?utf-8?B?WmpHWFdjZ1FLYVlvNmhyNHZKNlc3MVk4dXlHUzRtMVIyQ2s0eDBySzd1Njdm?=
 =?utf-8?B?clBJNlFTcWtZNFBGNjNxdzJnS0RhbDlkM2g5QzE4NHZwSkp3cWpFZkFGMEp2?=
 =?utf-8?B?UFUxUVNRY1E1V2JqQWFuOTJ2cmZPaTgzZVJHdnErYWxhRnp2NUhsODY2K3NX?=
 =?utf-8?B?RzhlZk5DOUIrcWYxSXlKY1J4Tm41VDRGdTRlWW9IWVErM3M3ajZYR0d3T1Nj?=
 =?utf-8?B?RkpwbWllNjR4YnJmeUx1T2FtTHdPbXQ3cEJDejB3OWI1SXMzSVVEQ0J1Y3Vn?=
 =?utf-8?B?QjZnNk5QUkhCNUJaN0Q5MkZORi8yOUlCb0ppb0hIK2pucTF0cjhZQzdTeVdN?=
 =?utf-8?B?MTJRMWRjVUVtWm1XYTBkclBjb2tDNC9nUnVmejBLUFZhVGlSQUoyWVprVjdC?=
 =?utf-8?B?S2M3djdNWnhtS0E5WWlyOG5ZYUpJNjRwZnRvUkhoVVpFNmxadVBQYTFiYjBu?=
 =?utf-8?B?MkZqQnk0V3RXdUxONFd0L2lnaG9ZVnUvMVRSdXJSR3E4anA4U0FNQ1hQNncr?=
 =?utf-8?B?TW9WWktTS003NmtMTGN0UHJlaG5OeXJTK012Vkc1MDg5OTY3QUNBQTlleXdK?=
 =?utf-8?B?NGJnRjk1MnpTdVZrK3FDMUVWUm5tZEhONkVwVWRZWHJBM2FSYzR2NktpL3hh?=
 =?utf-8?B?MlAxMG1Nb1VSTFV3a3JYWUEwR0VyMmJsT1Y2cHZrQ0xyTHBNUWNqcGEvbjB1?=
 =?utf-8?B?Qi81UWg5cDZNZEM3WlNyNHdUaWlYQko1Ky9hY2l5eEV5WFl2d0N3ek9ZeEpm?=
 =?utf-8?B?cFJPYzQ3R01mbWhiVnk4ZFpVRnFNNVlxSm81TzlWTHlGVzlhSDIrZFBFZTd2?=
 =?utf-8?B?WG9FaC9KN1ZnRUJFdlllZjdUUXovQ000dUhKcjJNZ2Q1SUdLVlpxSjF3RXUz?=
 =?utf-8?B?S05HZ2l5eGQ0SGgwU1gyem9la1BaTWQzcU9XL09PNHg2dk9Cb2JYUmtMRGdJ?=
 =?utf-8?B?d2pQdzNJWTRocUs3eWJESHJYcTJ2ZFUreHM1ZWRQUFFSMzJOS214cnBOOGo1?=
 =?utf-8?B?T3JVL3hqWkl3THZwK2NYY2lMLzdiYjRhb0NJVmZkV09sb3NXVU15NkVlUG84?=
 =?utf-8?B?RlJxdGtnZ3hlQmhJQUk3YkxsVVhJUG90SzdVVk8zTjlxUkNMMXFyQzFWbUls?=
 =?utf-8?Q?B8tkXHQY8ebWXk+EwJm4gsEru?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d94a898f-e963-44ad-52a0-08db9ddd607c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 22:17:13.6543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3DHcRmwCvO55oyxigFb7FB5+nx75pqO7F7bt6+xzRvcerpWAlgupgKmwWk5+IChpZKqVIKEQR6My7LdCyrEBXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4547
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

Hi Oak,

I'm not sure what you're looking for from AMD? Are we just CC'ed FYI? Or 
are you looking for comments about

  * Our plans for VRAM management with HMM
  * Our experience with BO-based VRAM management
  * Something else?

IMO, having separate memory pools for HMM and TTM is a non-starter for 
AMD. We need access to the full VRAM in either of the APIs for it to be 
useful. That also means, we need to handle memory pressure in both 
directions. That's one of the main reasons we went with the BO-based 
approach initially. I think in the long run, using the buddy allocator, 
or the amdgpu_vram_mgr directly for HMM migrations would be better, 
assuming we can handle memory pressure in both directions between HMM 
and TTM sharing the same pool of physical memory.

Regards,
   Felix


On 2023-08-15 16:34, Zeng, Oak wrote:
>
> Also + Christian
>
> Thanks,
>
> Oak
>
> *From:*Intel-xe <intel-xe-bounces@lists.freedesktop.org> *On Behalf Of 
> *Zeng, Oak
> *Sent:* August 14, 2023 11:38 PM
> *To:* Thomas Hellström <thomas.hellstrom@linux.intel.com>; Brost, 
> Matthew <matthew.brost@intel.com>; Vishwanathapura, Niranjana 
> <niranjana.vishwanathapura@intel.com>; Welty, Brian 
> <brian.welty@intel.com>; Felix Kuehling <felix.kuehling@amd.com>; 
> Philip Yang <Philip.Yang@amd.com>; intel-xe@lists.freedesktop.org; 
> dri-devel@lists.freedesktop.org
> *Subject:* [Intel-xe] Implement svm without BO concept in xe driver
>
> Hi Thomas, Matt and all,
>
> This came up when I port i915 svm codes to xe driver. In i915 
> implementation, we have i915_buddy manage gpu vram and svm codes 
> directly call i915_buddy layer to allocate/free vram. There is no 
> gem_bo/ttm bo concept involved in the svm implementation.
>
> In xe driver,  we have drm_buddy, xe_ttm_vram_mgr and ttm layer to 
> manage vram. Drm_buddy is initialized during xe_ttm_vram_mgr 
> initialization. Vram allocation/free is done through xe_ttm_vram_mgr 
> functions which call into drm_buddy layer to allocate vram blocks.
>
> I plan to implement xe svm driver the same way as we did in i915, 
> which means there will not be bo concept in the svm implementation. 
> Drm_buddy will be passed to svm layer during vram initialization and 
> svm will allocate/free memory directly from drm_buddy, bypassing 
> ttm/xee vram manager. Here are a few considerations/things we are 
> aware of:
>
>  1. This approach seems match hmm design better than bo concept. Our
>     svm implementation will be based on hmm. In hmm design, each vram
>     page is backed by a struct page. It is very easy to perform page
>     granularity migrations (b/t vram and system memory). If BO concept
>     is involved, we will have to split/remerge BOs during page
>     granularity migrations.
>
>  2. We have a prove of concept of this approach in i915, originally
>     implemented by Niranjana. It seems work but it only has basic
>     functionalities for now. We don’t have advanced features such as
>     memory eviction etc.
>
>  3. With this approach, vram will divided into two separate pools: one
>     for xe_gem_created BOs and one for vram used by svm. Those two
>     pools are not connected: memory pressure from one pool won’t be
>     able to evict vram from another pool. At this point, we don’t
>     whether this aspect is good or not.
>
>  4. Amdkfd svm went different approach which is BO based. The benefit
>     of this approach is a lot of existing driver facilities (such as
>     memory eviction/cgroup/accounting) can be reused
>
> Do you have any comment to this approach? Should I come back with a 
> RFC of some POC codes?
>
> Thanks,
>
> Oak
>
