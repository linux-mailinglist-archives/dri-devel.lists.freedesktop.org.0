Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE50C40A9F8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 10:53:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 352EF89CA1;
	Tue, 14 Sep 2021 08:53:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4063389CA1;
 Tue, 14 Sep 2021 08:53:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J03hDRI2hM1CRsxOyFQNfzu8TZYS15ZEtYnCfLgYFbp9yxtaABTjaOgBex+qTaixmaOy9aeZ2uJEmiM3FZHNN7ktGx630I0lqGOHg1Y5KH3vTSM3+nFiF8TwoYG465VWQR08HW7Mu/y++kNG7mce1YURqHUkOI7VWxmMTqre2mY2PoNAaYWbKw9pKGxRarLrLDggX/WmjyXU7fuOjXQL862SJ8A9QKwcvrIbpY6Bp/jJh2LAAovIy9aqxcl7W4qdLgwxe8cvHlVbXw+h3n4bLO9kdeEC3+ZIMguszwT2GiVyeRwp+VTAAN2jPqxsb6r7LrDeVz58vl0ztU9kW2VnmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=bQOlxEscMguxmuEtyLpM9iL82CEK7MOGCZNmqLpa5y4=;
 b=lCrr6oFD607xA/SrJJSk8YFape3U03AosbYoSe/ILMvCdANLjfqqRq6xZdwDSAE+d9fCQQNi2rN6mXnWL8BZKiXnHZnHORSCHKwFS3mFGf0nS9ncVFP+CxzrbkYas7WRv+WotA245q+EbXxBGePjJf5cl/6d2kAx2JkVM67qXYnQ95n4KpOZqim53Mcl3VsKbs0iQvWTHoOlOI+zXa0nr9OK1udpY0qQg5/Q1giZ88jGbGq1bAvDZeiw3WehTgbS09hxpDFpZ75hMnadiBH+CYmfyBgNHyNTyJtvt8wQQrtHwrEAr7Y2MQ9DqiQpnRaItg8sAFxtqHrZgmuPbPzIqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQOlxEscMguxmuEtyLpM9iL82CEK7MOGCZNmqLpa5y4=;
 b=GsWAzNznorjmdUAa6OnSaROR161H2OgdoiUSS5oWfgya+u5JsFE6eg2vSsLdlgVAlt7I8uI7Az1gaM0lOEPHy12HoFr4ZfD6ctCCVwWWs8e6MEY8WvE3hrjMvXXOs+necqEDNKQRRdkq/OAyTEuq52iA5GyhkPLhTmWQP9hfjRo=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 14 Sep
 2021 08:53:32 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 08:53:32 +0000
Subject: Re: [RFC PATCH] drm/ttm: Add a private member to the struct
 ttm_resource
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, matthew.auld@intel.com,
 Matthew Auld <matthew.william.auld@gmail.com>
References: <20210910131512.161655-1-thomas.hellstrom@linux.intel.com>
 <d7570cab-d402-761d-40e0-3d08d9b9d3c9@amd.com>
 <a1a8fd3f1ca13b84192bd3c8719f510e5b655b2c.camel@linux.intel.com>
 <c8484b51-4365-bedd-be73-4c0898ac70b1@amd.com>
 <5ea3f498cc5ae84fa6aeba97a64e4eb8ab32e02b.camel@linux.intel.com>
 <c67b3b42-d260-44dc-81cb-1d1eb18db643@amd.com>
 <a6badfa3-efbb-7830-e019-1dd61b0f800e@linux.intel.com>
 <5ca10e93-9bac-bd8f-39b0-d60fe06bc289@amd.com>
 <4b9e25e3-0a9d-a7a8-e092-8355c6b5878f@linux.intel.com>
 <7c0b6e6d-fd36-9a5c-758d-7c172c0c5e05@linux.intel.com>
 <0a0f1b45-a668-e0a8-dcd0-d4413ec3b39b@amd.com>
 <4add643ae0b1a1daa4657106f5554894145a9778.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d3982c91-99eb-a0a8-a8ca-163d90feb0b6@amd.com>
Date: Tue, 14 Sep 2021 10:53:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <4add643ae0b1a1daa4657106f5554894145a9778.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM9P250CA0024.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::29) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM9P250CA0024.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.16 via Frontend Transport; Tue, 14 Sep 2021 08:53:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f30d50e-0624-4374-4591-08d9775d2109
X-MS-TrafficTypeDiagnostic: BL0PR12MB4948:
X-Microsoft-Antispam-PRVS: <BL0PR12MB494843E89CDD8F15D02A6C4783DA9@BL0PR12MB4948.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VGiG3y8w61SseoqvFz/fFKvpWi1fZtj9K0Fh0oTCQmXWTFJ1Wi5GDqr/Le7kGkMmhwhke8OP1zVItYrE3s1UH6LPz3B2CgnRX37ZP+8DF5MzGAJkoRvehpsLS5LF94Q0zScR3qpLYBbsJRosv/r2On7lYjVZxAIYHQ/KNBXB376FtWTbH+E3lUw8y6soEAg4HdUX/H2lC2IZqp8fjb/01fT/Cm2eUlg37yyFZ7Y5aAkILS6W3eFI1C2Ad8C+9+ZcdN93H7tthnRl6qK5WVZVhlML0tFVWz4qsoDTWrK3RgGfzWuM/Atllww0v7f4BX0wmfjhXwXwyqLsWGkS+gj+aar7S2M3VhVmXUPmG1nTHMma3cDrGDDqcvKeC8Ih3Aw3lQPjOR7v+zsFFjdjDW0wuACfE5mFECIOJOicptH3lGGIipP/vlbt7ofyS2Smx0cMMEtCvkH2s11EYmF68CSpNiFx6c/rtJSFGX9+5M21bX/tF777vNWr0Ghzj66teHWhxCH/jJICa61g+vfkTQjhVN9busZ8q6BfHOLctH+QsoxwK/1R3AWwIjWkeyiFGW38jTWHhPOABn8/fpV3n9jChsQa2zDO8FZjWxVyRAnwL1zl7lbisvTlZECQ/Ei4I3qwZVXK9TeLm7NgVYr/WKFZOP3k/PqEkWJG9J7yChuiLeVD8MkB/Bxri73tEiCo7LCp3RCkQS2Kdo4zyiXHQVHNmj6+Gg6jx2EP658Cwt8p2uOzxv/qXc5Nqg7rpOGWJv3MyVk2DKFY3FUxMoNcPS0o4YcRVKk20vgx+bXFTpJiD686EJ15E4Gmx0L0ZKps3w7U
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(366004)(396003)(136003)(376002)(2906002)(6486002)(956004)(186003)(31696002)(66946007)(6666004)(31686004)(16576012)(66574015)(316002)(2616005)(86362001)(8936002)(26005)(478600001)(5660300002)(83380400001)(45080400002)(966005)(36756003)(38100700002)(8676002)(4326008)(66476007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NU5RMmRLOGtMTnljbksrNTB3WmhmN1AwY3JDYzFjUjBtcmFrMXZuYzdBZ2Rm?=
 =?utf-8?B?K2VheXROazNwM0hYSi9USzg5ZWgwUU9tSjBqZDNEVWpMVlcwNmNNamZXVlZH?=
 =?utf-8?B?Rkhqak9CQ2lKUVlPdFcxWGdaRjFhTlR1WW5leEd6K2tYRW9IUmdtdzUrRUR2?=
 =?utf-8?B?TmpmUEg2MDh4NWdvL0lKdE5rdzFPMm9aYlQ5T25hVHQ3YVIrdTZlN2diR2l0?=
 =?utf-8?B?YUtNNmV3WFNLVWJ2SU9CdnJockR0UC8zZkdVQXZDT1E3VnpKWVNkT3U5TzJV?=
 =?utf-8?B?eXNXS25qVlJJYWQySDlDLzY1RElhcmNBYnJpdFZuTUpYRCtkRnU5bi9rY01i?=
 =?utf-8?B?NEFUZ3R3Vitxbm0vbWhrQlFuL0xFR0VMVE1Va1R2dStxWGxqYmlNS05kWHVQ?=
 =?utf-8?B?U2Y3SjREQTJOSmRsQXdwbXBXQnUyTjg4cDl4Yy90NDRveXZQVlhFK0dhRFY4?=
 =?utf-8?B?Sks0dU5PNmpqdUQ2bTYrc2JqVDNBMExhRHcvUkpNNFhTUk9UWVRodldtRG1y?=
 =?utf-8?B?V0hSVzVuZEk3NzlzQ1NQbDFJL2krZThRQ3pvU3FyK2RXR1o3NHkyOEk5NTUr?=
 =?utf-8?B?bm95R3YweUsxNXg0ZVMyVjFLeEJpVWZDeHZrNnVlVmVHNjBWeXE0d2k4VXZP?=
 =?utf-8?B?QXpXNW9scEpVVFlOMFBmemFoUlZDcWVyZmV4RFVTd1owaG5SdDNmU29hVHpt?=
 =?utf-8?B?R0NkcnlOR251Rk1oYmh4cEpDbVpaMnVXMUNOTlA3MDlJM3hzSTVEWWxsZUs2?=
 =?utf-8?B?Rm1JcHNnZWgrRS80UkdNVlhUalY1WnpyMGlvMk85c3NoY3dWVFNBNkVNTy9w?=
 =?utf-8?B?LzB3YTZWaEZjUkNydDI5TzZFcXpjbk1TREs3RDgwNmo0QVkwVHdNamhDaGhi?=
 =?utf-8?B?TXBKVGo4NFNab1Juc2hmZVR1Z3JmV1kvTG10ZGVPQlFWaUlQeHNIaU93d0E2?=
 =?utf-8?B?TWVTamlVZ1R0NEJjeFJSc2dMaHJVWGdVS3pjVjRaLzZOQlFGKzZkc0Q3Ry9O?=
 =?utf-8?B?em1INENDMFlnMHFIVFF6TlcxdVdzL3BTek9uRUJyb1ZRTkRubktFTnUwbkdG?=
 =?utf-8?B?aVlXYU82cmxOU3Q3TFpoZ2pRcWpSb1ZMc21WM2UvaTQyWU92M3ZWZEpFbWMr?=
 =?utf-8?B?M0grS2ZvRHFOT0Y2YVlXSEhJUHdkRlJwVmJZbnlpUWVhSGRpTGc2a090RzJO?=
 =?utf-8?B?SVR6U1RmYVFaYVNQR21UK2RMVmFLdldzbXkzdTBNVjhvK1ZIb2hmSzBPaU4w?=
 =?utf-8?B?TlJyZ0FobWxFMDc2akEyTFpBQlErYzJTemgvSTZodUtTcGoxdjNVdXNKZkJw?=
 =?utf-8?B?MHMrT1BlK2tEL2VxNUYvdU5ySGdwYVdHSUlMc0FBWUw1TFo2czFSN1RiU3pK?=
 =?utf-8?B?R3ZpbmxkYm5GVzdPSzN6Y1JQQ29FSjNubmZvb0JmcTQxR2RqT3hHRnVGM0pX?=
 =?utf-8?B?d3Y0UXZ5Q3I3UkRSOXY0My9GVmlvZGZ4Wjh2ZzVTMUhlUGVybGxBdnEzOWtn?=
 =?utf-8?B?eUhwQis4R1hBQzhtbWxGMGhMamZqQVdEeW9ZeE80TnM3aHhUYStZZ3J3U3JG?=
 =?utf-8?B?TU5SaGZaZUZrY045RkRPUFNhT0tKYWJMMEhvSytUbEtPSFRTVXRrajkzeEw5?=
 =?utf-8?B?VHhjZ2ZZc0xBSzg2SVBYOWVQQ1BVbk1mMDVUL1gxQU5WN0VkUnRCYnJYUWgw?=
 =?utf-8?B?NUM2Q0ZrVlYwS0doVXgzbkZUejhsQis0anFPakwvTEF3eENhLzRtSS9sZE9X?=
 =?utf-8?Q?8ERQhu1tDIlX3YbIo5OOpq6sZwGOTGVK9jwJakf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f30d50e-0624-4374-4591-08d9775d2109
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 08:53:32.2004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IF6Sj0KFOnI7hMLzpi5I+84NsjruV1qLz3YmyY8V/r/wlCun5zifO4Mxtoez1S1N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4948
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

Am 14.09.21 um 10:27 schrieb Thomas Hellström:
> On Tue, 2021-09-14 at 09:40 +0200, Christian König wrote:
>> Am 13.09.21 um 14:41 schrieb Thomas Hellström:
>>> [SNIP]
>>>>>> Let's say you have a struct ttm_object_vram and a struct
>>>>>> ttm_object_gtt, both subclassing drm_gem_object. Then I'd say
>>>>>> a
>>>>>> driver would want to subclass those to attach identical data,
>>>>>> extend functionality and provide a single i915_gem_object to
>>>>>> the
>>>>>> rest of the driver, which couldn't care less whether it's
>>>>>> vram or
>>>>>> gtt? Wouldn't you say having separate struct ttm_object_vram
>>>>>> and a
>>>>>> struct ttm_object_gtt in this case would be awkward?. We
>>>>>> *want* to
>>>>>> allow common handling.
>>>>> Yeah, but that's a bad idea. This is like diamond inheritance
>>>>> in C++.
>>>>>
>>>>> When you need the same functionality in different backends you
>>>>> implement that as separate object and then add a parent class.
>>>>>
>>>>>> It's the exact same situation here. With struct ttm_resource
>>>>>> you
>>>>>> let *different* implementation flavours subclass it, which
>>>>>> makes it
>>>>>> awkward for the driver to extend the functionality in a
>>>>>> common way
>>>>>> by subclassing, unless the driver only uses a single
>>>>>> implementation.
>>>>> Well the driver should use separate implementations for their
>>>>> different domains as much as possible.
>>>>>
>>>> Hmm, Now you lost me a bit. Are you saying that the way we do
>>>> dynamic
>>>> backends in the struct ttm_buffer_object to facilitate driver
>>>> subclassing is a bad idea or that the RFC with backpointer is a
>>>> bad
>>>> idea?
>>>>
>>>>
>>> Or if you mean diamond inheritance is bad, yes that's basically my
>>> point.
>> That diamond inheritance is a bad idea. What I don't understand is
>> why
>> you need that in the first place?
>>
>> Information that you attach to a resource are specific to the domain
>> where the resource is allocated from. So why do you want to attach
>> the
>> same information to a resources from different domains?
> Again, for the same reason that we do that with struct i915_gem_objects
> and struct ttm_tts, to extend the functionality. I mean information
> that we attach when we subclass a struct ttm_buffer_object doesn't
> necessarily care about whether it's a VRAM or a GTT object. In exactly
> the same way, information that we want to attach to a struct
> ttm_resource doesn't necessarily care whether it's a system or a VRAM
> resource, and need not be specific to any of those.
>
> In this particular case, as memory management becomes asynchronous, you
> can't attach things like sg-tables and gpu binding information to the
> gem object anymore, because the object may have a number of migrations
> in the pipeline. Such things need to be attached to the structure that
> abstracts the memory allocation, and which may have a completely
> different lifetime than the object itself.
>
> In our particular case we want to attach information for cached page
> lookup and and sg-table, and moving forward probably the gpu binding
> (vma) information, and that is the same information for any
> ttm_resource regardless where it's allocated from.
>
> Typical example: A pipelined GPU operation happening before an async
> eviction goes wrong. We need to error capture and reset. But if we look
> at the object for error capturing, it's already updated pointing to an
> after-eviction resource, and the resource sits on a ghost object (or in
> the future when ghost objects go away perhaps in limbo somewhere).
>
> We need to capture the memory pointed to by the struct ttm_resource the
> GPU was referencing, and to be able to do that we need to cache driver-
> specific info on the resource. Typically an sg-list and GPU binding
> information.
>
> Anyway, that cached information needs to be destroyed together with the
> resource and thus we need to be able to access that information from
> the resource in some way, regardless whether it's a pointer or whether
> we embed the struct resource.
>
> I think it's pretty important here that we (using the inheritance
> diagram below) recognize the need for D to inherit from A, just like we
> do for objects or ttm_tts.
>
>
>>> Looking at
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FMultiple_inheritance%23%2Fmedia%2FFile%3ADiamond_inheritance.svg&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C268bb562db8548b285b408d977598b2c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637672048739103176%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=bPyDqiSF%2FHFZbl74ux0vfwh3uma5hZIUf2xbzb9yZz8%3D&amp;reserved=0
>>>   
>>>
>>>
>>> 1)
>>>
>>> A would be the struct ttm_resource itself,
>>> D would be struct i915_resource,
>>> B would be struct ttm_range_mgr_node,
>>> C would be struct i915_ttm_buddy_resource
>>>
>>> And we need to resolve the ambiguity using the awkward union
>>> construct, iff we need to derive from both B and C.
>>>
>>> Struct ttm_buffer_object and struct ttm_tt instead have B) and C)
>>> being dynamic backends of A) or a single type derived from A) Hence
>>> the problem doesn't exist for these types.
>>>
>>> So the question from last email remains, if ditching this RFC, can
>>> we
>>> have B) and C) implemented by helpers that can be used from D) and
>>> that don't derive from A?
>> Well we already have that in the form of drm_mm. I mean the
>> ttm_range_manager is just a relatively small glue code which
>> implements
>> the TTMs resource interface using the drm_mm object and a spinlock.
>> IIRC
>> that less than 200 lines of code.
>>
>> So you should already have the necessary helpers and just need to
>> implement the resource manager as far as I can see.
>>
>> I mean I reused the ttm_range_manager_node in for amdgpu_gtt_mgr and
>> could potentially reuse a bit more of the ttm_range_manager code. But
>> I
>> don't see that as much of an issue, the extra functionality there is
>> just minimal.
> Sure but that would give up the prereq of having reusable resource
> manager implementations. What happens if someone would like to reuse
> the buddy manager? And to complicate things even more, the information
> we attach to VRAM resources also needs to be attached to system
> resources. Sure we could probably re-implement a combined system-buddy-
> range manager, but that seems like something overly complex.
>
> The other object examples resolve the diamond inheritance with a
> pointer to the specialization (BC) and let D derive from A.
>
> TTM resources do it backwards. If we can just recognize that and ponder
> what's the easiest way to resolve this given the current design, I
> actually think we'd arrive at a backpointer to allow downcasting from A
> to D.

Yeah, but I think you are approaching that from the wrong side.

For use cases like this I think you should probably have the following 
objects and inheritances:

1. Driver specific objects like i915_sg, i915_vma which don't inherit 
anything from TTM.
2. i915_vram_node which inherits from ttm_resource or a potential 
ttm_buddy_allocator.
3. i915_gtt_node which inherits from ttm_range_manger_node.
4. Maybe i915_sys_node which inherits from ttm_resource as well.

The managers for the individual domains then provide the glue code to 
implement both the TTM resource interface as well as a driver specific 
interface to access the driver objects.

Amdgpu just uses a switch/case for now, but you could as well extend the 
ttm_resource_manager_func table and upcast that inside the driver.

Regards,
Christian.

>
> Thanks,
> Thomas
>
>
>
>> Regards,
>> Christian.
>>
>>> Thanks,
>>>
>>> Thomas
>>>
>>>
>>>
>

