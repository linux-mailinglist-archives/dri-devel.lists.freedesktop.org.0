Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2683640A80F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 09:41:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E59E6E425;
	Tue, 14 Sep 2021 07:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2080.outbound.protection.outlook.com [40.107.95.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97D36E423;
 Tue, 14 Sep 2021 07:41:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9IHqcQU81nHVLE4Yr7o76iKmk9X5RpaEwCqmXRs3tst4IQcokwMFAUh2XIjGK89QRVUPjtVQOXfepBcjHk6uVqWKEaA+EQsrVlxU6j0uuoVolAwBtGq5xOpfo5bLUZFBKyAMQAC7Sxr7b0w9FGJjxW8+OU9oCETp0kg4LKavqnkxHNK/7hwlC2l4jDP4WbAIxU3uX7tsLSPNSTIkrNKMW6+50OBeKcV6Nq6tf2QlSUaZkqrArzgzu3x8XnSV6U8ItMC2fAY2aMwhvkAXxreIZrDX5FyubnG+tyGXdoJJmw9uiC5TdgfEXcLCRNFJQnUqPVuTpJNnSmpfud6R4cWOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=VLLdL0m+A0QbCdVTb1LPUMdYa/FBVJh/ee7zQoJ4OO4=;
 b=J8gexBGmnFOPJKZnpFqTJW0tTjuZ8FIBHBMeTmZGx2NOBqjHGcySiXNh4FoqpmW6e6rS/BKRqJCOQ8PYlmreEvbMdBiinU2uIkn/tZWMS6RKHV+RurGW5zYszaNDlAYi7KUYtAQIqC3bb8kUI/85Ea5793nSkeyoTwjg9/1JFaVqPYuuSA2Qb0wzL+6fkPZWAwodkrOgh5r6RzfipH1PsWhKTSgYEX44xjcNQCgWBCDP0HIjmrvgORlGYnB+YwnDl6TgKq2VyXpNRW8Sz5THmPYMIQyhMRLbj0Wfiqmn6V2FDKKsMhaLmnxQEnJTrAjZFztRhYT/dKmOaQLAdAVdhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLLdL0m+A0QbCdVTb1LPUMdYa/FBVJh/ee7zQoJ4OO4=;
 b=jEfuWqKkdb1wPQ14tVnkVSBikB9c54JjgCCGA4NdE68forzcqJ5lQ6lu+IUzBdFh2TzwY+Zvf0YBqPSsJbBPybNZX62pjXHE+FX4WX0+IvcyDk+xz1P23BeEYwIFf4LA4JPdwOY9SXfT09pKDpeEKU57VHM77FAyNfaKowcj97E=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4302.namprd12.prod.outlook.com (2603:10b6:208:1de::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 14 Sep
 2021 07:40:59 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 07:40:59 +0000
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <0a0f1b45-a668-e0a8-dcd0-d4413ec3b39b@amd.com>
Date: Tue, 14 Sep 2021 09:40:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <7c0b6e6d-fd36-9a5c-758d-7c172c0c5e05@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM4P190CA0018.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:200:56::28) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM4P190CA0018.EURP190.PROD.OUTLOOK.COM (2603:10a6:200:56::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 07:40:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a0e75fe-f568-4b3d-4b76-08d97752fe6a
X-MS-TrafficTypeDiagnostic: MN2PR12MB4302:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4302032F2279D96F3CAF9ABC83DA9@MN2PR12MB4302.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YUlznyoQS4HV68AGDp53mXn6QoF1eznx/CWyVKyKFhS1c2KBnlKkIW8Z7qMRGpL+AWZT96G1net7WTpmS602j4K4RJbW3Q/95Hr8NhDIZasZ/kLY2T6YgC3MKOMK7lx+sKy1jtj2wgWi+9acMvJViikkAFOXWIVluXFLJk36hTJjw2Ss55UpJS5a64HZqKq8SgXV2fmvsH/fzVcb1oy7IsSML+JnAzkc5/r2lc7C2mKQ/wJr+UuxPSNKbvraZTxNlj9jiZv65DBZqUNiYUEwQHbZz4fkwZ1XFU6WKu3XLyDE5h4BPnuG5teF1DXs/W3/QgYrbRoOso3HgI8LSrZrdFfUfCya/o+cl7aMVT13MErw11T+Q1msLGBHE9db4Z41iLnu926fzvuG0kYIcKeDYFugBXQ2dV5UE9+X8bL/KDij4JSrPW9KREUZMfjtQtWceuXNQUC4mnz4LVNx/qdSBae+QhlnUEEs3+IF2oYJuoKtKmtaXHJvtI1svUOwp88EMkXFuI7LCv5Gt7kCoZEQn0ecZ/8qzsMBy9pDUgaYIq2ZSf20V5S717BxprAakFtwwBJ+Qq1XNpB2yeHn0oMkBGXbmG9p6a5hsxcw2G0Fdo6meMzrr55n0q6gYb2yM+UK6WCxHrTVhSaGY6nIfquEfCMKrXMcslZaG2tUR07D9DzhRP+VQm8a4AxD2rFOfJe6KMYhtLahOZzLP/Jriizi+2hbGiMSXz2Lgtfo7zsh/UAfNnDSJQqIOT7hA9ddQIw1KzPa0kCFk0PiOemd1sp4OaDqRjQWXv7O+oErvdmHwOhwkgdHplv5nqlHwxXxTXFg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(396003)(39860400002)(346002)(2906002)(316002)(38100700002)(66556008)(16576012)(956004)(66476007)(31686004)(31696002)(8936002)(8676002)(45080400002)(66946007)(6486002)(26005)(478600001)(966005)(36756003)(186003)(86362001)(4326008)(66574015)(6666004)(83380400001)(2616005)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHhHbERWVUpuNjI4V0lidHh3OEJkSlRza0MvNDhXQk9vSFE0bFZQYjJLZFht?=
 =?utf-8?B?NW1pK2tFTDFKdi9Henh0alBYOVhVL083WU9qdFhuenYrUmdMcHkyM20ra2xn?=
 =?utf-8?B?dmtDQTRNOUdCYzlReU5xQW1hRWxxVVN4U2gvVzRHaEl5V0pYSTF1WFBYNWM3?=
 =?utf-8?B?YndpV1BQcVdaLzIvOWNhRDNrRzNtUDBQaTJwQnlnNVBBMGIvZUk5YVR3MWJo?=
 =?utf-8?B?dStIMnJLdTU3dkJCd2NvWUV4allzTUdlWnNHSEp5REZEbXhXcnlDMTR6Zkhi?=
 =?utf-8?B?ZnlNYWFTYUFrRmRVSlRsVklYeEQ4ZVVzcXJ0TzZaNExnQ3o4TWFoYzM2eFB2?=
 =?utf-8?B?OUhXSmRzbVJqT1lpUHFFMFp1ZjdGWWEyZnA1WXNsVjZNM1NBMVIyaHp4ZDJG?=
 =?utf-8?B?Z3duWkszZVlRZERWNm1ZU1FwOGZLMFNmTnY4c3VWMXRsRU5qL00zZ3YzR3Fz?=
 =?utf-8?B?TkpKL0ZmYjNkVHBkVm5saVFtbHRzaHNnSXdhMG9lRGdvakZuTENSNExtVVk4?=
 =?utf-8?B?Y0FrUjFVQWMrUnYwUWxXdHBkM2JaVlJFYk9Bd3RvclBkY1pRdU04enVJZUtD?=
 =?utf-8?B?MGZueU9oYlJ3NjlzK3NRSDgzaVVPRHlMdlVDVS9UN0VxYStqalN3Q0ppR2JK?=
 =?utf-8?B?NnFnVDRGVlNENUN6OE1qRWI5N0U0emU4aGRQbFQ1c0EvcHA5czdhdlVQRUxm?=
 =?utf-8?B?ckcyZkMxSnhRd3dNQXY1L0wrbnhqVUt1KzQzMkd1cVQyMWxzWW1vYVlLZldR?=
 =?utf-8?B?NTdEOHZGamJlQnRrb0xqN29tS3A2UWJrRlplYmtsall6M0IvVGM1ZGxyenpx?=
 =?utf-8?B?dXVjMUhWTHlpYnNMVFdHOUg5TEM0OXdUczJlQlpJYXU5V0oxMXg0VUFRSFk1?=
 =?utf-8?B?elNENWRBcWE4bnZCTUFJbHFKZmg0VEtnMWRYUHFFQVEwUUVlMUpYN2pJL1hR?=
 =?utf-8?B?eVgxcWt5QU1VOVZtYnhhNHFESW04Qm84TXRZSmcxZ0l0VjJMSnhCakNRdGFU?=
 =?utf-8?B?cjlMcWMxYWxXakdtQm8yZWE1SVlZOEZrdHRpUFM1SEN4U2tXTWJlczBrSVo0?=
 =?utf-8?B?NjBwUmM5TjN2VVYydFB6eWJPbTEyZGdPUm8vT1YwNDlkcTJHLzl2eHFmV0hl?=
 =?utf-8?B?NEpTdENWTVJHUnZyV3JieElINk94UHNCOE9lOWtYNGtHVHFQVnM1d2Q5TVBK?=
 =?utf-8?B?SStrOHhXRFFvQTBYQ0YraHBwOEd3L1hmTVNJZEdOeEI5RUZoUERWVnNSSTVU?=
 =?utf-8?B?a2xqM2xrSGtFSFVsbW1HTGpnZGZWVCtIZEZQZUwzT29VK1h6bzBhMGI2OUtv?=
 =?utf-8?B?US9XL2VIYkNoYUJiMHhzU2syeGRQRG9mZ010c0JwYXB1MlpoUEdxNEhhdllm?=
 =?utf-8?B?NWlTN1pkRGNZSGU1OGcwWWRRWmV4UkRtOE5STEszSmxRNTZwWHpOQjhQSnlG?=
 =?utf-8?B?dFVnbFJlWGlQRDFZWUR1d085bis1L3ViV2ZVUGVhb2pFVW1TTTI2bmpuazV4?=
 =?utf-8?B?Mkc1VHFCOGtlVXc2blNYVWRCMkRackppVmVnbGkrOFQ4OXpQZEFTQUo5bHIv?=
 =?utf-8?B?cFZnZE43aHQ4a3dpcmZETUVoTWJybFphRU5JZVErRFVHVnZBWG5nUWRZUG1l?=
 =?utf-8?B?Z2l5bitnVzZCUmFwcDluYSt5bXprSzJSRWp3OWtWbUxmKzlQbi9oV1dvY0hL?=
 =?utf-8?B?bVNEbGxCTlAwUjNhU2trVFk5b1g2dy9UWXNFUlplZ3FzeHpCM1UrTU45Vytp?=
 =?utf-8?Q?nYdzt/Ol5zSagFiqv0ObsufzlC1Wslsr7gdxwC1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a0e75fe-f568-4b3d-4b76-08d97752fe6a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 07:40:59.1047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yLYFn8gu0D4DQYIwr8KlAVv5XoJ4/8YY6AZNSOMgEOOFQHa7gg19LkMavChmyoTg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4302
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

Am 13.09.21 um 14:41 schrieb Thomas Hellström:
> [SNIP]
>>>> Let's say you have a struct ttm_object_vram and a struct 
>>>> ttm_object_gtt, both subclassing drm_gem_object. Then I'd say a 
>>>> driver would want to subclass those to attach identical data, 
>>>> extend functionality and provide a single i915_gem_object to the 
>>>> rest of the driver, which couldn't care less whether it's vram or 
>>>> gtt? Wouldn't you say having separate struct ttm_object_vram and a 
>>>> struct ttm_object_gtt in this case would be awkward?. We *want* to 
>>>> allow common handling.
>>>
>>> Yeah, but that's a bad idea. This is like diamond inheritance in C++.
>>>
>>> When you need the same functionality in different backends you 
>>> implement that as separate object and then add a parent class.
>>>
>>>>
>>>> It's the exact same situation here. With struct ttm_resource you 
>>>> let *different* implementation flavours subclass it, which makes it 
>>>> awkward for the driver to extend the functionality in a common way 
>>>> by subclassing, unless the driver only uses a single implementation.
>>>
>>> Well the driver should use separate implementations for their 
>>> different domains as much as possible.
>>>
>> Hmm, Now you lost me a bit. Are you saying that the way we do dynamic 
>> backends in the struct ttm_buffer_object to facilitate driver 
>> subclassing is a bad idea or that the RFC with backpointer is a bad 
>> idea?
>>
>>
> Or if you mean diamond inheritance is bad, yes that's basically my point.

That diamond inheritance is a bad idea. What I don't understand is why 
you need that in the first place?

Information that you attach to a resource are specific to the domain 
where the resource is allocated from. So why do you want to attach the 
same information to a resources from different domains?

>
> Looking at
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FMultiple_inheritance%23%2Fmedia%2FFile%3ADiamond_inheritance.svg&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cece4bd8aab644feacc1808d976b3ca56%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637671336950757656%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=LPMnfvC1px0bW8o420vP72oBbkm1v76A%2B0PDUw7urQY%3D&amp;reserved=0 
>
>
> 1)
>
> A would be the struct ttm_resource itself,
> D would be struct i915_resource,
> B would be struct ttm_range_mgr_node,
> C would be struct i915_ttm_buddy_resource
>
> And we need to resolve the ambiguity using the awkward union 
> construct, iff we need to derive from both B and C.
>
> Struct ttm_buffer_object and struct ttm_tt instead have B) and C) 
> being dynamic backends of A) or a single type derived from A) Hence 
> the problem doesn't exist for these types.
>
> So the question from last email remains, if ditching this RFC, can we 
> have B) and C) implemented by helpers that can be used from D) and 
> that don't derive from A?

Well we already have that in the form of drm_mm. I mean the 
ttm_range_manager is just a relatively small glue code which implements 
the TTMs resource interface using the drm_mm object and a spinlock. IIRC 
that less than 200 lines of code.

So you should already have the necessary helpers and just need to 
implement the resource manager as far as I can see.

I mean I reused the ttm_range_manager_node in for amdgpu_gtt_mgr and 
could potentially reuse a bit more of the ttm_range_manager code. But I 
don't see that as much of an issue, the extra functionality there is 
just minimal.

Regards,
Christian.

>
> Thanks,
>
> Thomas
>
>
>

