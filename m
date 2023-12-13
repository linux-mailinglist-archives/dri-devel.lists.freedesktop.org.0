Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B3F8117FD
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 16:46:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C2210E287;
	Wed, 13 Dec 2023 15:46:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9474F10E10A;
 Wed, 13 Dec 2023 15:46:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFUm4LEO9QDPEGE9WHdulajD1xoOO3v0cmo09qmMpIwlX/1FyuIZx3M7notMwZS7MXiyP6p5H91c6OBL6KzvrqsY0tQPCq2LQFDtezFwKWf7Ebo51SefRY9z5CMaz8Ifl8wHb/k5mg61qMhTk7rcWLOG13LW7IsrEM/jGm3HMhafrsismgddDc3VvoXtGx0IK1IPOS0KG1ykfUhpJffX+jyyBl2DRJA7Q/QEA11pRxDYV88Li3q6e0/evBvSbEWnb6wds4GW7pqqZOYyOf9yPVn7qZFdlCiPqzdEAGoIzf6hM4NfyNt+m/j/tUUxOPWYw8TnF0lW860FMg1vCcpA7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ll7wIGi60w/y97uJe1xioZ6VY6w4sOBmxkALhriM+Z4=;
 b=TGMVNW21XijbqITl2+kveJzIs9u+ptU4/ZGipyTegDjIE+zhmHerMwFv3Tk0Gpo7USH+7yeHADEjoxZTQZINuzQtSk+1BaErRTIS08ISd/iPDIdWnODBucRyhrg5YqVlvjOUfm0ixE3xyzGJnpsPWmxi3wSqIQTEX5LF6FLtSJo0Xu1wm82OOKmgfkU6b4hLSiwIdCq+IemkSjEerVW7ElkfTYCeQoFjV0UGgo/aZB64hXAKnZJZTeooWjf1n4bMx+WqGc9UGR/wfi8aBL3G0/8PabRhVdKB9D4ZrNb+7fph0cId0KarZrbE3J2FiZ9yvBJqtOI5LLQbP/sxzBT9NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ll7wIGi60w/y97uJe1xioZ6VY6w4sOBmxkALhriM+Z4=;
 b=oCsHtqoi5o6+ZQ5POKotJoahVSgv2sJt8EdFazIPYyn/K3/nCarOISh8OvHL57OGeFKybZZJyrl9CIGVP6V+eTb4VMdQh7xfJ+q77vgeWhq08jAIJx5T9tUh62jC1ZQmElkOGQPfnpUyeX6nNsAz5JZBfHA33NWBGuT5acMNPy0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA0PR12MB9048.namprd12.prod.outlook.com (2603:10b6:208:408::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 15:46:26 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 15:46:26 +0000
Message-ID: <e6c05843-fcaf-4c5b-9a3f-e21f6a787407@amd.com>
Date: Wed, 13 Dec 2023 16:46:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amdgpu: Enable clear page functionality
Content-Language: en-US
To: Felix Kuehling <felix.kuehling@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <20231207151142.929349-1-Arunpravin.PaneerSelvam@amd.com>
 <20231207151142.929349-2-Arunpravin.PaneerSelvam@amd.com>
 <d30b7992-5c39-49f5-889c-c31d4994a5c3@amd.com>
 <CADnq5_PdWUDVK0mvMgyTyogMnT-DD2nhXHarO+BLg9BjtGPRGA@mail.gmail.com>
 <473652dd-8ca1-436b-aa52-eb85eb0e98df@gmail.com>
 <381345a6-64bc-4cda-b787-fc431827b289@amd.com>
 <86b95faa-fda4-4354-97bd-a1c15fed0771@amd.com>
 <8316182c-1b28-49cf-97ef-23c683c1140b@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <8316182c-1b28-49cf-97ef-23c683c1140b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|IA0PR12MB9048:EE_
X-MS-Office365-Filtering-Correlation-Id: a39a4d3d-a81f-4645-c3a4-08dbfbf2aa36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J5fF0y+31eYf1TnXLLzTZ0x4MGA43R+113N1vkML/ztyQTObf+VO5IXRzovpxpSmqLfNwwbHBPBmtUwaOCN/M1RANIdMjr87N18rfLBOwWZSC3VHvDWPNpxHGRxG/JboMY0vhim94GAuKu2LvSbmJaEI907BImDCuK9lSoqDdb4Xiad0RWKFWcQG5Xw32i2kzOHpsbrYI1vZEYFujD04EXKBid1Nz+jQ/lQBQKDozKfC3OZWt5v6JgS+dYYzU/ccb1o4AOe7CdrZtPtK2wl+AEckhtuXSVT0otNjUlrir5Sfi0cJ9set/LBZuej2f3Nwgw2EWoxzBBLosAxwIQfKHnrUgWal75GN8v0+CEAQrnpOuDLGNfce6FTBeyXZ/hCHk2tt0vHlWxctHDUmG8eFkJPOfVbQSAWZlD+zl+FdTvxAh+pP7yVKX5Xkm6PVGWlvOKuMrmmT0ZfnoDOS1HhO/PTTNa20RZPDzmoz2KZZl3XV1YA+9VGo6qzKYXPWI0dDR+ei+6pIAIpQ7tlhk1t7UtI5fCvZAj6aJHLPjVt/3IMpD3J/EvAX2hIyVpDN7Lh12QnLWIWTv6NfJnaHziVPHVFjGt5SLla8S1xcwcavY2puTQMj5WTV7b0PkVT/Cg2NYtSkmhYhK6/rLIw6QBhPQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(396003)(136003)(366004)(346002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(31686004)(2616005)(66574015)(26005)(6666004)(6512007)(6506007)(31696002)(86362001)(36756003)(38100700002)(5660300002)(8676002)(8936002)(4326008)(53546011)(83380400001)(66476007)(4001150100001)(66556008)(110136005)(66946007)(41300700001)(2906002)(316002)(6486002)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mlc1V3F4WnoyMEYveXpBTWZPdVJpWXhqaERTQy9RWUtaaHh2L0lQWE1XUHg1?=
 =?utf-8?B?QUJ3bVFoVUZwK0xvendseFRtN0RGT3ZRY3EwbWV5amNlZkN0c0VIMGIweGpK?=
 =?utf-8?B?Vms5a2s1eEJyR013cURzUm5oWnNFdTNyZ2FKR2xTdk0wRTNtZyszQVV2V1h3?=
 =?utf-8?B?NWxvYUhUcVE0UVc4K25LdzdXd1hIb1ZLTFUrVFg4b0xwTEZTc05JMzZDTTA0?=
 =?utf-8?B?YTJoa3FnbG5rZ0dPVU5mUDdzSHFHUTg4Ymh1YllzWXpMSWErZ0lldU8xOHNt?=
 =?utf-8?B?UUN2ZjgxTnU1VUl1Mi8vNUFzc2ROM3hEUXl6QTlpUm9YTmw3V0lVZ2lQVmRQ?=
 =?utf-8?B?MldFcXpkeUVubzBrRE1HYkIxTzZxYjhhTCtoZXZyaENsaUZaTUx2cWYvS1Aw?=
 =?utf-8?B?MGpLSThFSnFLaWZzVTNtNnJuL0dsTHQxV3hVUEFaYmpVbjc4cFdHN2g2WHhS?=
 =?utf-8?B?NUNLZnFPVU1Nc2U4c3plZHlQRWtqMmJCTzVDeUpRdjJUTkEvd0FSNGg1dHdo?=
 =?utf-8?B?RzF5T0Erdlcyc1kxQlMvaGNSNXFOUmNHVHFjeUl5Y0MyaEVPY1lDWmVxQVN2?=
 =?utf-8?B?TldQWXoxY3orYWhWQ3o4Z3N1RHNVdVI5OVRvMktxMUxJQ1ZJNS9sQXRlSkZC?=
 =?utf-8?B?WWNjTTV1MnJlRFBDZjYwaGpsaTZBcFJYWGFRK0VpS2wyZWduaTdFc2VmTzl1?=
 =?utf-8?B?K1NSL2R6UDF3QXpKYkZ5NnFtaTd6RmcyVE10d3VyV3RxVnVRa2ZLaHBOMGl2?=
 =?utf-8?B?ZHF6d0JvWGdDZHk0OGQ0a1A3YUduUFdib09nSFdiaUttREVVU2NhbXpiWEgx?=
 =?utf-8?B?ZjQ3d0FjV1lxcGJ3VW91WUpGUUQ0UmVhM3A4K0RHM0NHU1lESG5kMkxIcnVL?=
 =?utf-8?B?M2hOdVFxN3BMOUhvSkt4K0lvUHZ2UmxsYkZ1R2RuS3RJM1pvS2lvcC85TDVP?=
 =?utf-8?B?dDVLajBvTHJOVjlLVEJwRHAzaWw1eDgxaCtxbU43VW04ZGxMVHZxdXl6dWhi?=
 =?utf-8?B?NEx0K0E1WHp0RjI1d2p1clBQUTNuT3RjL2FPd2ZZWFZtODlMTkFBQWlNMzg3?=
 =?utf-8?B?QTRRdXMvWEZuT3NCR3d6Q2w4UytBaHBCaGVIcUhxN1MxNWV2T2RKQitpc0hM?=
 =?utf-8?B?WXY5Mk4yYytmd1VjeFhLam1ZTEQ4bDVjKzFmSXQwcW81TXM1MUVBNExiQWlv?=
 =?utf-8?B?UXg0b040R3o0SkhtVHBKd0Y1T3RZV2lxQkhXZHkra2xTM0RQQVNBQUxUUU5y?=
 =?utf-8?B?STVDQjBLcStJY3Q2VWRJeUppcWJlZjNnM2dkNjdvRUZBQTYwOXk2YmNpMWhl?=
 =?utf-8?B?ZmEzTTRkc2VOZmhoZjhZdkVrY3A1ZW5tamJZRUhLcmkwTVg4NjREMTg5MUVW?=
 =?utf-8?B?MUFFcUlGR2hJN3lDc0c3Szl3RzdNd216UTlDYWl4TTdOMjdMVW40WmlReGc4?=
 =?utf-8?B?QWhFS1hPcU5ma1U3Ty82MHJSbVc5bUVVZHhML0p6Uk10ZzJxbnY3N1orS0JX?=
 =?utf-8?B?ZThqYnJiVmdnVFFCK0YrNm5LUEQ3bHNJZno4bm11dmdkWkNYS1RmTU5VUnoz?=
 =?utf-8?B?djgwQkZpTnVFTVBMZEw3dmRQY1VzeFRXM0g0MVFndHZPQlBUdVNiUjhWalpx?=
 =?utf-8?B?amVvcktzMk5sbHVEOHA1ejR6QlRSOE12OVp0Nk5WVmlqSFhyd0R5cWtFWTMy?=
 =?utf-8?B?bHdUTzdSMitoM0ZjelczSm1sVTBLdTAwcHRNOGs1NFViSC9HdERUN2Vhc29B?=
 =?utf-8?B?cHpNdUNRMjlyZzZzRnlDUE9DRnNPSXd6Y2pKTkRqTkUxSDVTVi9ZNC9PakNs?=
 =?utf-8?B?SDNoT1ZMUEdCaVNTdFd0Qithb2NHR3JFSmk2RDBrOUJrQkhCZnRmb2RsVC9a?=
 =?utf-8?B?KzIvUUdPMktySTlOcVFNRlVPT2ZHUktKdTZrRE1QdFdOUTIyS0xNblR5Ujlw?=
 =?utf-8?B?S0pqbGdzQmswLzQ1RHRPTU96TnNjTWY5VlRESEdWSE1wWVFTb2d0MDhHS2VD?=
 =?utf-8?B?K3JBVzFFd1JONXFBU3A4V2VETWpac0M1M2pYTG05NDFuemRoWU9uZVpEOXEy?=
 =?utf-8?B?UEVYVnMzNGxadndlbmVZTGQrMDZNc0s1THFHUmVUUFk0eENOUFFOVFNncFd5?=
 =?utf-8?Q?SCHs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a39a4d3d-a81f-4645-c3a4-08dbfbf2aa36
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 15:46:26.0803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MEqIf4HeiKGJixHtHJp4Sgm6jWCaDM+jsAtGdsyYE18kzHKAIyS6asNF8DeG3SM4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9048
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, dri-devel@lists.freedesktop.org,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.12.23 um 16:39 schrieb Felix Kuehling:
> On 2023-12-13 9:20, Christian König wrote:
>> Am 12.12.23 um 00:32 schrieb Felix Kuehling:
>>>
>>> On 2023-12-11 04:50, Christian König wrote:
>>>> Am 08.12.23 um 20:53 schrieb Alex Deucher:
>>>>> [SNIP]
>>>>>> You also need a functionality which resets all cleared blocks to
>>>>>> uncleared after suspend/resume.
>>>>>>
>>>>>> No idea how to do this, maybe Alex knows of hand.
>>>>> Since the buffers are cleared on creation, is there actually 
>>>>> anything to do?
>>>>
>>>> Well exactly that's the problem, the buffers are no longer always 
>>>> cleared on creation with this patch.
>>>>
>>>> Instead we clear on free, track which areas are cleared and clear 
>>>> only the ones which aren't cleared yet on creation.
>>>
>>> The code I added for clearing-on-free a long time ago, does not 
>>> clear to 0, but to a non-0 poison value. That was meant to make it 
>>> easier to catch applications incorrectly relying on 0-initialized 
>>> memory. Is that being changed? I didn't see it in this patch series.
>>
>> Yeah, Arun stumbled over that as well. Any objections that we fill 
>> with zeros instead or is that poison value something necessary for 
>> debugging?
>
> I don't think it's strictly necessary. But it may encourage sloppy 
> user mode programming to rely on 0-initialized memory that ends up 
> breaking in corner cases or on older kernels.
>
> That said, I see that this patch series adds clearing of memory in the 
> VRAM manager, but it doesn't remove the clearing for 
> AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE in amdgpu_bo_release_notify and 
> amdgpu_move_blit. This will lead to duplicate work.
>
> I'm also not sure how the clearing added in this patch series will 
> affect free-latency observed in user mode. Will this be synchronous 
> and cause the user mode thread to stall while the memory is being 
> cleared?

Yeah, that's not fully working at the moment. I already pointed out as 
well that Arun should remove the clearing in the VRAM manager.

Regards,
Christian.

>
> Regards,
>   Felix
>
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> Regards,
>>>   Felix
>>>
>>>
>>>>
>>>> So some cases need special handling. E.g. when the engine is not 
>>>> initialized yet or suspend/resume.
>>>>
>>>> In theory after a suspend/resume cycle the VRAM is cleared to 
>>>> zeros, but in practice that's not always true.
>>>>
>>>> Christian.
>>>>
>>>>> Alex
>>

