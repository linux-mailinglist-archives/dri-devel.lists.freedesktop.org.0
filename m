Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B020452B79
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 08:19:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9CFA6EDCE;
	Tue, 16 Nov 2021 07:19:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A6076EDCE
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 07:19:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YmtOllOlKCakGQSSotd7rGiVobQAsqRb3ahLufSSiyvbd6K/Qs3/ofYendCvNitpRbn3mn1+ZPLQfcFB4Uy4cBVwnxCzR1sUQmktV680Y+fBzD2jAaQSfa83/giI0qMQsMLFMgiemJx0Oj9eUTZFSH1aU5AeNQio29cB/bAM7S1R+9UwHaiPBgqZPOi6JtJLMC8V4Q7CVHJdTsOFr2+woJWEK/XceTf4RjvMXYbiguFTHKv6HYPvxDkCIpm5agz353op9dq0PCebyAc6ZvfwOCzmgAxPsGnjmxPsRm6dDSXIdVsNhy7nnKkwV/wnih8aif9W8M5PPo0QhIsUTcqYiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TI74pzeuW59f53/yLqI7T/LIWXdg9m7W44krlg+O6eM=;
 b=FHrWX/Fhan7JuuamYZm3O9XV5KU90Hms0y8Yv/+v1yYD/8ZKebAXhL/pMiSOmstQd+xbuAaFboxT2kp6PL0MBicCjfQmFNcGOKDVpqjenGKD8WytdfpIpik/CG5ohKO5BbEo3NS9HrFDbFko30pLUSs2rG0EXmB2zw+HYzzOOeZt/jJhBkpQuW4fOlNy39PK/QUtQCJ4OYd1dFZH0A0MqUAwv9noKKplX0cUODhlzlqgUu4/gZi68mUQh/CcIfU2OH6Lh7701OvgFTYTAXB7qaloTwWh4nP9OMbkJNNl1G0k/h1a1BJkXH+zKquWGKcMy0eCoV+hQ2jt4PCJViJcOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TI74pzeuW59f53/yLqI7T/LIWXdg9m7W44krlg+O6eM=;
 b=LuWm0U22KKRD4d0MFAhNxZdXnt3gRBKPNz1qRC3EX0BjemIrYf70rxORMf5EM11Kv22ZzEa8k/NerTIZXd7HwonURuBurMwMXUWnRdefOE8OuBubMyWUWbINYwzs6f0nql/ErvtIMQuLJIB3Pf9oKNPAMxHI+xx+Xkp87Fm/LIY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW3PR12MB4412.namprd12.prod.outlook.com
 (2603:10b6:303:58::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 07:19:39 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 07:19:39 +0000
Subject: Re: [PATCH v4] drm/ttm: Clarify that the TTM_PL_SYSTEM is under TTMs
 control
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Zack Rusin <zackr@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <3687c5f0-edb9-3cdb-2bb7-e45549a1cfb8@amd.com>
 <20211110145034.487512-1-zackr@vmware.com>
 <61aa563096a20dca80b4cc48037998b932c2e4fc.camel@vmware.com>
 <48dbcca4-a47b-28c5-9163-5a1e8960639e@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a5a987cd-493f-a089-d3d6-5c4e2fb171e8@amd.com>
Date: Tue, 16 Nov 2021 08:19:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <48dbcca4-a47b-28c5-9163-5a1e8960639e@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR03CA0100.eurprd03.prod.outlook.com
 (2603:10a6:208:69::41) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (87.176.183.123) by
 AM0PR03CA0100.eurprd03.prod.outlook.com (2603:10a6:208:69::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.16 via Frontend Transport; Tue, 16 Nov 2021 07:19:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c781152-923f-4f74-bf59-08d9a8d173c7
X-MS-TrafficTypeDiagnostic: MW3PR12MB4412:
X-Microsoft-Antispam-PRVS: <MW3PR12MB44129255A44F346302912EFC83999@MW3PR12MB4412.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aGPJ1B/U2AmPvp2Ei1hhaL3DIGXOoU/SKWKZpznKiM6uXaZvjRN4wUi1KFUb5p1sLknDdTH4FmJTEtXXDzcnatEv0ULVoxEi5P0nq561l7pR4DQJAFIQjAKWNcE/NVaFYm+nA7/KOOdMihKZfhTvHpyQkU9hf7vGeFOyRcH3QlHizTO2mXvJ+G07aqT9eorNwzBsyhgt4mH5u44FHN0sTXHuA20pLqeEI8avSL7+dt2rGjCJqlXIIzO7se8x08/UM6RTzbdLaaTWrxEmohspO4w+RHM5zhI8KJ7+Pjua3w2ZsV03qvxA87zLdsh6B4iciFYF38RxwwG12GBKjWZGChxnN/PgqJnScPisSpp7oGiAXsjc76iExQDPgGzEprdPKjHeFrHCa8ex3f7q4FzDP2+NgXjGhR/5w5EtSjUrjTceRP/eas/yB+jMUMCk1I8zou8YgAi0ruFrY9K8afEyIxwSd3Pj7ZYiHYtv6OtPo8DFsRBpbG9oVQxxruWFinoVQEAWPmSf/0lwEapsDc9eEUiUUGQ0IsOKJwMriAczhgzAVHqtZAQDUeVlXYbhYakvgKsR9+jOw3C6aeWTHp3bOH+XDnwHLMf0oeSByATUWeZJvG8bo5T70zHTeY8N99KKRbZRSwDbvzRA3OzWK6AjtMFE0eKlajfQCMtLN8n28dcoNO2oCjBAd4O+JZspYmmW4x1KFUx6mfeGfULIGhkuXjbZMl+NOteVZUOVEVuQGl1ACqJYGbhxxsAyhXlGk3lJNwxMzGNkEfo+bTp1kWXXrvc2rJS+Kr1Xspz3EPGCchpe9gyiYLtfpeyTNXdwBiTp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(36756003)(31686004)(38100700002)(966005)(956004)(53546011)(2906002)(45080400002)(5660300002)(508600001)(186003)(4001150100001)(66946007)(6666004)(66476007)(66556008)(26005)(86362001)(16576012)(8936002)(6486002)(110136005)(316002)(31696002)(8676002)(66574015)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXhYN05ka3g1Q096N2d0alM2dU9TczJvMVRiMDdRamZPcFplejc3WE5RN1Nt?=
 =?utf-8?B?a25YWlZaQ1pVUTB1bXFIUXJzcFRGY1JWV2swMGpaVzN1Q1JnL2g3VUliSjNv?=
 =?utf-8?B?M05ZQlM5VzJoWWs3L0NkSi80b1ptTUdhcFY2UDZCTkEwU1pYRVhJczlyempl?=
 =?utf-8?B?ekJCMERyZTZzMjBNRnZRNlBmSFJNTTB4NEZRa0xKYVBabFVzMFBLVW9kVmU1?=
 =?utf-8?B?ODRwODRTcFZIUVBpVXI0ZVNOVTFqSlZudSt5SkcvdVRGQWNLSnhKWEt4dmhx?=
 =?utf-8?B?OGJid1VuZnhTUzNmcjFBMmowVnMyTFJkRlR3a0NqbElqMzZGcERZS0J1ZEhL?=
 =?utf-8?B?NzB3cm1LZ2hCbUljdXlnWGVseGJzQi8wUFVxdEdFUjhhZGtETmNFbXNTV2ZY?=
 =?utf-8?B?L2R0dG9OUVA4OXpOb0lwMDBjdVc2M0lZd3VjMGhsTW91OE0vWS91eVNka2dk?=
 =?utf-8?B?ZEhyNmZKNW9pb1FTODNSZXVOdWQrTFZtWTRvRGZwclNIRkZlbDN1Yno1MnYz?=
 =?utf-8?B?RFVpM2JBOHhFd01CaUFYM0tnMEt0OStkTHFocUhnZUFaWmtyaHlPdUwxc1ds?=
 =?utf-8?B?aFdXd0NEUzRtOE01MFFadDRnQWhVNmt1RURuV21VTnBMTHZBeXBWRXZ6clhl?=
 =?utf-8?B?Q2VNNlIzNXVKU3BqVUx5cjFQT2w4ZDdZMFRBZm5IYVpMOWpORTNZaTFCTU5r?=
 =?utf-8?B?SGJGc2JEL3lzMUJ4b09Ua3AwWlR3S21kZWVqMVBqd3dJbEp3amFpRjFxWHVM?=
 =?utf-8?B?SXRIbHVUS3E3OW80RzJ3N0tpVkpUTmVveFZSdlorb2FMa1U2eHZxZENGTjF4?=
 =?utf-8?B?NjJReTR1VDVLcFBDcU4yVU05ZkROTTVlanlVTHVCMVBBVURlb1ZvbVR3OG9z?=
 =?utf-8?B?Qjh6bUJRWjdUNHpDa2xYQlZtM2E2ZGhIbVFlSGlidHdaeGlXeW1DSm9HWTRt?=
 =?utf-8?B?aTdaNVdwRXYxamRCTVYvVnVxNnVBRGNsdnEyTkZ4emZQRmZNeUZkYUZoR0pW?=
 =?utf-8?B?WkhrcXFRYStDdGtMTlFFV3dkdFpwTWZiM2FUbW9KdGtkZFg4aFIxbHRQWHZu?=
 =?utf-8?B?cVB3NWZEOW1iRzZFbk1Vd1ZGYmlxdXhIaWNscjJlWEx0WXR4ZEtxaWhMSEpq?=
 =?utf-8?B?aStYWk0wU0hZemdFbDJlZjRQWU5UR3dRN2xsaG8xUXI1QXJ4Uk02ZVlDTllC?=
 =?utf-8?B?WkFwVnR5ajVRTDRzYXE1SnJmS2p0c1A0RFc4cDVsS1ZGNVlZSm1Kc3EwK1N5?=
 =?utf-8?B?bmpROTZ5emxxb2VIc1p1T2Y2TS82d0VDdXFqM2RQaG44ZzZBci94WHJpRm0w?=
 =?utf-8?B?MjNGN0Z2VzhUUDhYcWNYdUFVNEdvbUs5bWFPQ2VMRjc0bUg1ejlDK3VsbHI5?=
 =?utf-8?B?a0s2RWpJUnNBM3RSS3V0N2loRzd3b0hLc0wrR1ByNlZkRk5aZkNJU3NsV1NP?=
 =?utf-8?B?M0J4cE1SMzN2MkRhUkVOb0UrU1VxTS9RY1NiNFFjaExmRGdQdHFMYXFkeFIr?=
 =?utf-8?B?dFB1Syt5d29nbWV5Wk92UGdjcHlQcTNoZE92VWRmWEs4d2xhUTRObGIzUlhy?=
 =?utf-8?B?VlAyMHU0aDFWdGI2dERJeEQyazU4MzhCOG1NaGRqYVpOa09HWWZQOWZyMFBJ?=
 =?utf-8?B?TEN2WHFDc2Jlci8xdmQ3U1Zua3RVVjcxbHArVEtTWmQ3ME5vZVQ3OXRWeWo5?=
 =?utf-8?B?L2grS1dmRTRnK1JMZkx6V3hmR292NWwrck91a2ZGUUNyeWpVZHdlNGllK1lD?=
 =?utf-8?B?T2J1Yi9NdFpNRUhZVG1nMjBpdkNIYUdXbkJsMjdnMHBoRzdQdnBkM3JnbU9m?=
 =?utf-8?B?L3NMUGk4djlyaExsRGg4S0lIR0diRmtQUi9QcmQzZCs1UHk3WlZIQ3NkREU2?=
 =?utf-8?B?bkdETHlZRWJ5cG5HcmZmU3kzTXdSSXRTS3kxcmxORVNobVZScWNqSmU1Zkcx?=
 =?utf-8?B?TFFKZUlwTXZiNFBSb2pHc29sK3o1ZVFGQWZwQk1QNTFFUkJhSlhPbmg0aTBT?=
 =?utf-8?B?ZDZSK0VrRjloNFlnYldGOWFvSzR1WDdZRjQvOHpGcUVVK1ZyNXlnaGNYNTU1?=
 =?utf-8?B?Z2hYM1pORlFCUEFmUzFBZkpKWE13cExYWnNRcExnMGtCak1ZSS9ubTVhRkZk?=
 =?utf-8?Q?sW/k=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c781152-923f-4f74-bf59-08d9a8d173c7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 07:19:39.5116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3gCd+gzDQhUGBjM4rxydyuvqo2jemNlJc1KzzCKA7mhiKv8a5RqZffrHO4Li+6u5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4412
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

Am 13.11.21 um 12:26 schrieb Thomas Hellström:
> Hi, Zack,
>
> On 11/11/21 17:44, Zack Rusin wrote:
>> On Wed, 2021-11-10 at 09:50 -0500, Zack Rusin wrote:
>>> TTM takes full control over TTM_PL_SYSTEM placed buffers. This makes
>>> driver internal usage of TTM_PL_SYSTEM prone to errors because it
>>> requires the drivers to manually handle all interactions between TTM
>>> which can swap out those buffers whenever it thinks it's the right
>>> thing to do and driver.
>>>
>>> CPU buffers which need to be fenced and shared with accelerators
>>> should
>>> be placed in driver specific placements that can explicitly handle
>>> CPU/accelerator buffer fencing.
>>> Currently, apart, from things silently failing nothing is enforcing
>>> that requirement which means that it's easy for drivers and new
>>> developers to get this wrong. To avoid the confusion we can document
>>> this requirement and clarify the solution.
>>>
>>> This came up during a discussion on dri-devel:
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F232f45e9-8748-1243-09bf-56763e6668b3%40amd.com&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C3459542a8eab4bc98ecb08d9a69863d9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637723995727600044%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=6SZIpReHIaNxbu0WsLmwkjKM6e%2Bsk5d%2BDUg1KrfYewI%3D&amp;reserved=0 
>>>
>
> I took a slightly deeper look into this. I think we need to formalize 
> this a bit more to understand pros and cons and what the restrictions 
> are really all about. Anybody looking at the prevous discussion will 
> mostly see arguments similar to "this is stupid and difficult" and "it 
> has always been this way" which are not really constructive.
>
> First disregarding all accounting stuff, I think this all boils down 
> to TTM_PL_SYSTEM having three distinct states:
> 1) POPULATED
> 2) LIMBO (Or whatever we want to call it. No pages present)
> 3) SWAPPED.
>
> The ttm_bo_move_memcpy() helper understands these, and any standalone 
> driver implementation of the move() callback _currently_ needs to 
> understand these as well, unless using the ttm_bo_move_memcpy() helper.
>
> Now using a bounce domain to proxy SYSTEM means that the driver can 
> forget about the SWAPPED state, it's automatically handled by the move 
> setup code. However, another pitfall is LIMBO, in that if when you 
> move from SYSTEM/LIMBO to your bounce domain, the BO will be 
> populated. So any naive accelerated move() implementation creating a 
> 1GB BO in fixed memory, like VRAM, will needlessly allocate and free 
> 1GB of system memory in the process instead of just performing a clear 
> operation. Looks like amdgpu suffers from this?
>
> I think what is really needed is either
>
> a) A TTM helper that helps move callback implementations resolve the 
> issues populating system from LIMBO or SWAP, and then also formalize 
> driver notification for swapping. At a minimum, I think the 
> swap_notify() callback needs to be able to return a late error.
>
> b) Make LIMBO and SWAPPED distinct memory regions. (I think I'd vote 
> for this without looking into it in detail).
>
> In both these cases, we should really make SYSTEM bindable by GPU, 
> otherwise we'd just be trading one pitfall for another related without 
> really resolving the root problem.
>
> As for fencing not being supported by SYSTEM, I'm not sure why we 
> don't want this, because it would for example prohibit async 
> ttm_move_memcpy(), and also, async unbinding of ttm_tt memory like MOB 
> on vmgfx. (I think it's still sync).
>
> There might be an accounting issue related to this as well, but I 
> guess Christian would need to chime in on this. If so, I think it 
> needs to be well understood and documented (in TTM, not in AMD drivers).

I think the problem goes deeper than what has been mentioned here so far.

Having fences attached to BOs in the system domain is probably ok, but 
the key point is that the BOs in the system domain are under TTMs 
control and should not be touched by the driver.

What we have now is that TTMs internals like the allocation state of BOs 
in system memory (the populated, limbo, swapped you mentioned above) is 
leaking into the drivers and I think exactly that is the part which 
doesn't work reliable here. You can of course can get that working, but 
that requires knowledge of the internal state which in my eyes was 
always illegal.

What we could do is to split the system domain into SYSTEM and SWAP and 
then say only the swap domain is under TTMs control.

Regards,
Christian.

>
> Thanks,
>
> /Thomas
>
>
>>
>> Polite and gentle ping on that one. Are we ok with the wording here?
>>
>> z

