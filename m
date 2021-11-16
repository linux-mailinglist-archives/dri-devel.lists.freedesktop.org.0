Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F46452C91
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 09:20:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57CF6EDFF;
	Tue, 16 Nov 2021 08:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2076.outbound.protection.outlook.com [40.107.93.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5A66EDFF
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 08:20:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S7D7r/mk25ZpAXhBnBnXjnv96t/AHbzeOHZpE1uUXK3uQQMqbsk+jI7SE3w9BrBSz2dVsPDtXdbeHvzLaHXPVsPrkFHUqpSVjMB1BBzL/0otLFUkB4MnxAp5E4i349NMBJuakS3bQiVV6UQhKgOTdor+wqnOo1CkgteM1BvSx0eJ/V8L/DnQ4+I9+j5yBXzIGVK/vCBhUYV8T07sDtalxVVhF3g1DXcbUYHZ8o++5aaH1cotSsAs7SUmNJXI/SFNYFAw5dKlhnhf21rvIOa6lLVmSxgoI9ICYcwzd/KQFMK5Uz/n6itZC2P+VYIfRGRrgE5NdUtUwIl+g0ct49eVqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdi/ww458uQYS0MHsBnrK60RdBOwSeXg6NsagwHHdA8=;
 b=CC3rEpo3s2qDSOZh/PrsSRi9qx14yD/mOWorjbIkJh+toO2p0aDlxFNTcPxOlQx5cNeN9uZRUG1d0xntjvS2rD/guZzLjfW77XvYviJmZocYZrgOwM5+5o0cAvPD6+MU+9/oEuqLT97Jwv9ayHJCuzbDoz7FpDXCMIi4Y17YOXYzbHMd6osXgu8CggXorqB91g76GPEb6+X1Ve7LZmMiDR0nUQI1y4P0gIPkipfkKnn48xV5rM9Gshf10FUX+ctFfFyUu1g4Ek2ph1OHrivCsLKGfpI0knvFssUV+bl0HmcEYagY7EvBiuKlfuwqZMxO9phz7H0OgxpEDmN0RD40Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdi/ww458uQYS0MHsBnrK60RdBOwSeXg6NsagwHHdA8=;
 b=ZsJP+huZUaOXhvpTm6e11g6+DKekCNgqQFq9BU5g8RjLtmCrhVkoFtoldO6ZeB6JE4AgwZq4JTWE8b11AIzl+2HLPr6k2MWf3RsDtggqiyTu+7LVDLeKLAAFldnzA6yFVtg3kpqtegpqQ98wnZaZWoA779EnA5SthdP9e8IyPQM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1407.namprd12.prod.outlook.com
 (2603:10b6:300:15::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19; Tue, 16 Nov
 2021 08:20:11 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 08:20:11 +0000
Subject: Re: [PATCH v4] drm/ttm: Clarify that the TTM_PL_SYSTEM is under TTMs
 control
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Zack Rusin <zackr@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <3687c5f0-edb9-3cdb-2bb7-e45549a1cfb8@amd.com>
 <20211110145034.487512-1-zackr@vmware.com>
 <61aa563096a20dca80b4cc48037998b932c2e4fc.camel@vmware.com>
 <48dbcca4-a47b-28c5-9163-5a1e8960639e@linux.intel.com>
 <a5a987cd-493f-a089-d3d6-5c4e2fb171e8@amd.com>
 <52b8c310-ebab-a68e-a2f2-62a56b5216e3@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <112af1da-87ff-ee03-9461-e23173e84e86@amd.com>
Date: Tue, 16 Nov 2021 09:20:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <52b8c310-ebab-a68e-a2f2-62a56b5216e3@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM6P191CA0070.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::47) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (87.176.183.123) by
 AM6P191CA0070.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.17 via Frontend Transport; Tue, 16 Nov 2021 08:20:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db363308-247c-4eab-2c55-08d9a8d9e879
X-MS-TrafficTypeDiagnostic: MWHPR12MB1407:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1407E2FFB51B175FC43CBA8483999@MWHPR12MB1407.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wgzHl9nNPQ5481/RfyHB7EPhcuBOnGoFvBND1cdYurDXVmNeV7woVHUoMITEZRwd65kIdqy0nNWYpRqnP40Y8f49x9zo1r3uc0GCf73PMAngqjIvo1l1tLU0Gwam2PQzQPh/NTJKOIOYYm6rbXfLYTCJ7glucbHoAnkodeA/ral6+7AKTnTC8zHjZt95Jame7Y5qUuGJQ1HgZicMY3m4Cat6UmA1OwnSE7UdlabKOebXSC/lMdq3UL/Yu/+yH/hSrnJ49g6sbuLBH8ftH80M3tGTr+cp1KdYHDV1V5e7yGSOTcQ3+vDJs7Pf1hrTN79uUIGbkcdonF4ruivSMKKJxYcDb6njbFbws6bDXkgZtIhpkjFLpvcDaowuG3l7Z+gDqcxe6K3su4ibX5MUMoN4TdjE0/QEfcdcVStw7UyZ9CS/IKDn30SAhUpVaJHrjtcfTSrc+bTIhxFv/XzZhz8MHh4fUvEgf2nMz6ybY8DJIa/S/YwmhGjCjJJI5oigUCzM7+pqGmejziJLB4Urmal0KcEEKJZzyMDkHCcr3sotFcFmeNFt0OpRyGERprDpltHuv8mEM5deqKyhSaGlV95lAEfTezhgcof8E1pqWT1Im9//I5fBgFP4TsQNe/CXU6l/+LoOLJzyaeLhe5xPsrgvDRjtsK6LEulqWtm2wuWX/nUszAmgwfU0YrcT8boIiDw3iG++r+d9pKKmwJc/Ql0grJpwSusZZfTvTEpHlF/J8IWD2Rn2KmedYMRRrcnGpTJbpE9RhPWvebu4qRzdom0b7Ynp8YSXP/N+tVbx8O1ZQc3Zf+8g2w6aOCJkaAZj/vTI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(66946007)(8676002)(8936002)(36756003)(966005)(6666004)(31696002)(16576012)(316002)(110136005)(4001150100001)(53546011)(508600001)(45080400002)(186003)(66574015)(6486002)(31686004)(86362001)(83380400001)(66476007)(38100700002)(956004)(5660300002)(66556008)(2616005)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFEwRmQramtLb3B2eXRYWnRobmxBTDM4NWJGVHgxc0V6SzV5TnFRYmJZSFkr?=
 =?utf-8?B?ektrQ01TUDV0UG8rY0FleWx2WjU5VXBsNDF1bTA2VlRvQWhOaE5wVXdDNE83?=
 =?utf-8?B?d3pWVTdWNGlHbW5DYk9neHlqSkY1M1VQNUc5UzFTUlpvZCtJbThwSC9WbmxV?=
 =?utf-8?B?RVUzUEg1QkJpQk1uSkk1cmVWdHU1elV6WFdxaGpQb0NaWkQrczBYcFNPOEdT?=
 =?utf-8?B?cFdGMWFEVmdxUmhrNmVPNVNpWExvdmx0Y3RwRG9hSFYvMWpVMWxQcDJ1Vkp1?=
 =?utf-8?B?Kzc5dkMrb3dqdXc2V0VOVnRRUkZteWV4eUNYUUtZc0RKakJxUzVUS1FzODVM?=
 =?utf-8?B?MXVzRFZmOW9IZC9va05pdytZN3Y0L2xUL2Rsc3JvL1pYbXBEL281Q0hlUXIv?=
 =?utf-8?B?K0FkamJvR2dSUEMvOGdJeWtQTlJRb2J1N29GUUxDWTRQWU94bElFVHFSNGFr?=
 =?utf-8?B?enlyeHNjZE9CUFl0TkxzMnhLRmprR25UY3Evemx6eVlVOVNtMW1wYXhuMnVR?=
 =?utf-8?B?UFMvNkJablBUMTd1YWh3UEtRSzJJQ09tVEpUbGwzRXBramcyUW9BOHNOczhQ?=
 =?utf-8?B?cnUxNjFLWEQ3OHRsWnFEQWtxN1crenF0NytyenFEUEJnWUpjblZMbDUwaFh1?=
 =?utf-8?B?Y0N2c2w4YitBQWtjRG9mQWlDMlozek81OTh1NGJCUVFiVE00aGtVU2ttUUZo?=
 =?utf-8?B?RXFyRndIb2lJSDlWNmJqM3BNb2RTM0xaU0FvVUxlTUNaZWppVXdrSXNrU3lL?=
 =?utf-8?B?RFpyZmtqKzE0MDd0bU1xSlo4RlVDMEpJRVVUUThYNmJ1TVNVZnlFbS9NeGFN?=
 =?utf-8?B?Sk1xVE9TN01rWXVEYUpkVXBrSzRacWpwMGtmK0Z0SzExZFpzM3h3MFFBVHRR?=
 =?utf-8?B?dkZnWnFYSFcrKyt0UTFDaGp1RlE3QWNrU1NGVzIvMXZBR05DQS9PRnYwblAr?=
 =?utf-8?B?Rmp0RkZqRDR4SjA0a3pKQmM3bDhOaUR5ZEZFa3VUUCtvQUpiUllEbU9rcDk0?=
 =?utf-8?B?Vm55VHplcUJaTmJUcmpOLyt1bndvMUtGSXpPdmYxalBCNFgzOGlpOHp3dUhM?=
 =?utf-8?B?RWtIOGVCZUx6dElFL1RpV05CclFhMUhRZUUycE9kRUJrQ1N2ck9KWkMwNkNS?=
 =?utf-8?B?RWxyOUt5bnEwMjl3Y1hnWlpQNUo4L29DMWpQNWZ2Q2NXaHB6MkhJcmpTdmRo?=
 =?utf-8?B?MlR4QUJFZzZ0c2FYbUp5WFFIWDJ4NnpxYlY5L2dwVzVuZHVKVythdWZ1MXpj?=
 =?utf-8?B?WVRXSFd6VWV2NEhVM1dOQldnOFlXbGYvYldsbEdiTnR3clJnQ1FCTXZYTzlp?=
 =?utf-8?B?dlZpMTY2ZE9pd3RoZE9Bcy8vTTNwN2xGTTdOSFpqb3BzZGZkc0oxWWdTRkpF?=
 =?utf-8?B?WndTc05nNW9ra1ZjSmZnaWdWZWlSZUIxT3VnZzFhN0RjTkd3SFFFTERIbW1u?=
 =?utf-8?B?eGg5N21KbjJCVCtSbWdCWE1ocEU2UllOMnBYcG9SOG5OVjQxRzdDMFpNbDdR?=
 =?utf-8?B?NUFocW4yeDdMblQ1ZTU1S0JKRERYOUlZSTVnQ2ttTGRXY2tUWW0xM2ozUHpj?=
 =?utf-8?B?blpGU0tFMFhDdnpMZmVQNjFmc2NjZHgvbVZmcDVEYlVXT3U4amhtSVB4SitM?=
 =?utf-8?B?bEUzY2R3QWErZmtNMVVGenoxTDBsZUVNeCtlZEd0QlFzT1BoQUdBRDRud2ZL?=
 =?utf-8?B?cm5XQVIya0pkYlh2b2lwTkI2M0t2Q0NhNW5YelVweXNXU3RhNFFreHlTMFpN?=
 =?utf-8?B?aXJkUklKMHZkMnRWdExPQVEzY3FvbmhVeEdpVWJGQmpTS1RzMjFlL3dtb3Jp?=
 =?utf-8?B?MHJFamtMS2dIOVhhaHRpbFMyc2p3eU9NdmZmd1RCa2pBVjdnbGpyKytRR0Rn?=
 =?utf-8?B?VTRhN20vTndNOFNkM2QycnZUOHdNM2gwd2JxRlY5WFJ3TTkycjRTcS94Ky9p?=
 =?utf-8?B?K0ZNbE1hL3dDaElEQmdJSERBQkJyZHFLcEs1dVBGZjhXS0JicFJLUWF5MUNo?=
 =?utf-8?B?Y0pDUGhzdlNsdjhhR3A1M2dZdWkwTCs1T0FPWnhwK1hjOXYxQ1k0a21HWU1O?=
 =?utf-8?B?RjBqLzR1dHFmMW5mZVZYRThYblUzRTJzVTNjM0tON2VwWnlKYXZtU04wVUFm?=
 =?utf-8?Q?lNFs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db363308-247c-4eab-2c55-08d9a8d9e879
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 08:20:11.4029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LJdbNMGaoRB3LUVeW8Tq5FUMdsjfdeJSDXaXNws+HeFhEvfndBK+BVGy5ZSPtnBz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1407
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

Am 16.11.21 um 08:43 schrieb Thomas Hellström:
> On 11/16/21 08:19, Christian König wrote:
>> Am 13.11.21 um 12:26 schrieb Thomas Hellström:
>>> Hi, Zack,
>>>
>>> On 11/11/21 17:44, Zack Rusin wrote:
>>>> On Wed, 2021-11-10 at 09:50 -0500, Zack Rusin wrote:
>>>>> TTM takes full control over TTM_PL_SYSTEM placed buffers. This makes
>>>>> driver internal usage of TTM_PL_SYSTEM prone to errors because it
>>>>> requires the drivers to manually handle all interactions between TTM
>>>>> which can swap out those buffers whenever it thinks it's the right
>>>>> thing to do and driver.
>>>>>
>>>>> CPU buffers which need to be fenced and shared with accelerators
>>>>> should
>>>>> be placed in driver specific placements that can explicitly handle
>>>>> CPU/accelerator buffer fencing.
>>>>> Currently, apart, from things silently failing nothing is enforcing
>>>>> that requirement which means that it's easy for drivers and new
>>>>> developers to get this wrong. To avoid the confusion we can document
>>>>> this requirement and clarify the solution.
>>>>>
>>>>> This came up during a discussion on dri-devel:
>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F232f45e9-8748-1243-09bf-56763e6668b3%40amd.com&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C55e15a3b151b401993ca08d9a8d4c878%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637726454113422983%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=HSg2rZf1yFsCCOUOcoG5Y0ogGE%2FsUymh3UqJYvZ1%2BDM%3D&amp;reserved=0 
>>>>>
>>>
>>> I took a slightly deeper look into this. I think we need to 
>>> formalize this a bit more to understand pros and cons and what the 
>>> restrictions are really all about. Anybody looking at the prevous 
>>> discussion will mostly see arguments similar to "this is stupid and 
>>> difficult" and "it has always been this way" which are not really 
>>> constructive.
>>>
>>> First disregarding all accounting stuff, I think this all boils down 
>>> to TTM_PL_SYSTEM having three distinct states:
>>> 1) POPULATED
>>> 2) LIMBO (Or whatever we want to call it. No pages present)
>>> 3) SWAPPED.
>>>
>>> The ttm_bo_move_memcpy() helper understands these, and any 
>>> standalone driver implementation of the move() callback _currently_ 
>>> needs to understand these as well, unless using the 
>>> ttm_bo_move_memcpy() helper.
>>>
>>> Now using a bounce domain to proxy SYSTEM means that the driver can 
>>> forget about the SWAPPED state, it's automatically handled by the 
>>> move setup code. However, another pitfall is LIMBO, in that if when 
>>> you move from SYSTEM/LIMBO to your bounce domain, the BO will be 
>>> populated. So any naive accelerated move() implementation creating a 
>>> 1GB BO in fixed memory, like VRAM, will needlessly allocate and free 
>>> 1GB of system memory in the process instead of just performing a 
>>> clear operation. Looks like amdgpu suffers from this?
>>>
>>> I think what is really needed is either
>>>
>>> a) A TTM helper that helps move callback implementations resolve the 
>>> issues populating system from LIMBO or SWAP, and then also formalize 
>>> driver notification for swapping. At a minimum, I think the 
>>> swap_notify() callback needs to be able to return a late error.
>>>
>>> b) Make LIMBO and SWAPPED distinct memory regions. (I think I'd vote 
>>> for this without looking into it in detail).
>>>
>>> In both these cases, we should really make SYSTEM bindable by GPU, 
>>> otherwise we'd just be trading one pitfall for another related 
>>> without really resolving the root problem.
>>>
>>> As for fencing not being supported by SYSTEM, I'm not sure why we 
>>> don't want this, because it would for example prohibit async 
>>> ttm_move_memcpy(), and also, async unbinding of ttm_tt memory like 
>>> MOB on vmgfx. (I think it's still sync).
>>>
>>> There might be an accounting issue related to this as well, but I 
>>> guess Christian would need to chime in on this. If so, I think it 
>>> needs to be well understood and documented (in TTM, not in AMD 
>>> drivers).
>>
>> I think the problem goes deeper than what has been mentioned here so 
>> far.
>>
>> Having fences attached to BOs in the system domain is probably ok, 
>> but the key point is that the BOs in the system domain are under TTMs 
>> control and should not be touched by the driver.
>>
>> What we have now is that TTMs internals like the allocation state of 
>> BOs in system memory (the populated, limbo, swapped you mentioned 
>> above) is leaking into the drivers and I think exactly that is the 
>> part which doesn't work reliable here. You can of course can get that 
>> working, but that requires knowledge of the internal state which in 
>> my eyes was always illegal.
>>
> Well, I tend to agree to some extent, but then, like said above even 
> disregarding swap will cause trouble with the limbo state, because the 
> driver's move callback would need knowledge of that to implement moves 
> limbo -> vram efficiently.

Well my long term plan is to audit the code base once more and remove 
the limbo state from the SYSTEM domain.

E.g. instead of a SYSTEM BO without pages you allocate a BO without a 
resource in general which is now possible since bo->resource is a pointer.

This would still allow us to allocate "empty shell" BOs. But a 
validation of those BOs doesn't cause a move, but rather just allocates 
the resource for the first time.

The problem so far was just that we access bo->resource way to often 
without checking it.

Regards,
Christian.

>
>> What we could do is to split the system domain into SYSTEM and SWAP 
>> and then say only the swap domain is under TTMs control.
>
> This probably needs some thought also on how to handle the limbo state?
>
> I could craft an RFC hiding these states with helpers that we could 
> compare against the SYSTEM + SWAP memory type.
>
> /Thomas
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> Thanks,
>>>
>>> /Thomas
>>>
>>>
>>>>
>>>> Polite and gentle ping on that one. Are we ok with the wording here?
>>>>
>>>> z
>>

