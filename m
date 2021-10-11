Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6873428872
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 10:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8434894B7;
	Mon, 11 Oct 2021 08:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30871894B7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 08:17:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aRzOfBvBT/RSXkbzOT4HyfDAGU85iB4JsicW1G1s5I6pKj/M8aNzm1DU98ECg/ZV0BazLTu/pBsqI8N7qFWymd3ydLZ9h6Cml/tfK7bSj9P2XDY5GcPtwJaxuh+HVA41sf05DaB9D0fvNRrZmGxLjjkRocfsQM2fhmpWDzRUv6Y9EzqGODWex7tAESB0m/xpc2AZ3xX9NuoRfxu/xAj7p4GnOpInU3yk7TZ7JTv/EYn9YgTm7cXhLs4kykPO0qDdKeV1qES92AKdJstFoeeKBE79uxETPecHiCKdt3PTOU5e2yADX49GDC23MRpCrgamg1KZ9GOR4xGcwFKa41210g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xFBPVNjM+G+a/OTLVngyi8YH05Dpl4duihnIelmkr+c=;
 b=Xd8xqPifAsdLP55YYsRJSgCqXC7LnOefaQMZq27zF2Miv1h9QKeGtaCQ9uRr1FI15sj2/6oudH+BjXKgRL6lUxe3hhqFzGTt4Ih7aqqHNtdJ7hOyEzW8AyrsMR8k3MX8Y55iHIStiSOfW+apcyp02JE+NOFjlD/pcKHZy2YZrCc9EeT4AjYTdoe8xrjpVbDCljtsL4xwUqvJIJvQ8D5HZ/x1S6dHjOpamSA46PSYZ7HUM7+7TWRKkFerXfMxJale/g2pLqcUL/eGXU8eckUN/NkPT8jQMVwlJihRFTI0UCI6SI/a+7/XhvFVJ6l/1Km+2sYIisEo7XMgKoRLrXcvSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xFBPVNjM+G+a/OTLVngyi8YH05Dpl4duihnIelmkr+c=;
 b=usyYHQVxZsVJXwxPy/iJgAtjjji1J2PLy8OCRJ3TEczgZL1u2FuuSb4jQ6PTcpys93N8Ot7c4+FnNrx+FcVsKLq/W3AGVLKW7F8vh7b9U2JKnXIo8JOYb8TUysopxdQl1S0ahHsqgKxnNjyyDhi4zyRA5UAatsT1q9/hVNHtmgQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1407.namprd12.prod.outlook.com
 (2603:10b6:300:15::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Mon, 11 Oct
 2021 08:17:33 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4587.026; Mon, 11 Oct
 2021 08:17:32 +0000
Subject: Re: [PATCH 0/5] drm/vmwgfx: Support module unload and hotunplug
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Zack Rusin <zackr@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20211008173146.645127-1-zackr@vmware.com>
 <7abe3906a814e40786da5cd5d45a7b826e262d8e.camel@linux.intel.com>
 <dbfb505f1034a2d725d76e30a26d2da0a850dd41.camel@vmware.com>
 <96a89fdb5a10141e87d7283720b4088461db722b.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <232f45e9-8748-1243-09bf-56763e6668b3@amd.com>
Date: Mon, 11 Oct 2021 10:17:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <96a89fdb5a10141e87d7283720b4088461db722b.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM6PR05CA0015.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::28) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:a75c:41fc:3f29:351c]
 (2a02:908:1252:fb60:a75c:41fc:3f29:351c) by
 AM6PR05CA0015.eurprd05.prod.outlook.com (2603:10a6:20b:2e::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 08:17:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9aae829-3762-40df-3859-08d98c8f92ef
X-MS-TrafficTypeDiagnostic: MWHPR12MB1407:
X-Microsoft-Antispam-PRVS: <MWHPR12MB140784DD086FBB1AF7C05B6183B59@MWHPR12MB1407.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XHQenEeamZDAPMip26R8rYzH8uQg1z7QHiR7y6xo2Yakw2UGZg5u9P7t5A7W3JUvvdhyIuQ7oDfg1UpuP8M6Tab0n5wV0XmzKCpMYLMuKpIbEadbP2Nir4J99Kf1RstOSIFZJrDEUdx2Gp5Rmt5mAREuMKrnJKVruuK2B6+qkzz5iPAeYeIhsAHNZUxgVTnhB7SUzjcP+9dy4Pz4sUGM6MSOQx1vgmWHC80RMexFaQwqBcY6cKb//lt7W/VFCMgvszEdoNI1fu0hmurEcEYV8gEzg+hvxD2XoeDiWmS+JCjqpr/3JmrKg74uxrbiA8VIRqjAsP+u3qdYko//BgZQlGecz3SUdCslLaNWgNI0z2pKgGw4tL2n+5f+crASsc7+4ekvIwW3u1PxVtXIu7kO56HG7TpfEMDQIRfqSjYOqQaYORFvUOwsd89ARHD7UqjFARXv2u0UiAj46RJmg1u7zydd9SsqEI7ZefqNjiX5/sZ3mbBMauwrO9V07ISrkRHCTlGRajrVS+RhDLBFmbQNjhKuRpY2WbRk+RwFxAXeK6tm0wCUjeI+J4QbO7rtgWnOwO0THna/LSVBODSMaB8cJaIdeh0WzfusSuHbSAqATNS0P3eP7iErIdfu6KiLy0glILRmWsJdp6wM2pUyd60x5VtutrN5eAm85F89AnLg3+chobwyS7OTTbV6aRQBZxu0N5Pj8h+FKhV3FEn4Rjhe9xLubvbzCvGbN1l98awclgs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66574015)(110136005)(8676002)(8936002)(186003)(316002)(2616005)(83380400001)(2906002)(31686004)(38100700002)(45080400002)(36756003)(508600001)(31696002)(966005)(86362001)(6486002)(5660300002)(6666004)(66556008)(66946007)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFBhYzRzbWhjck05NXdPYloybmVmTCtRVS9PKzR2b0VXT3dwYkdhYkQwNW5L?=
 =?utf-8?B?TEJSaks0c3ltemdUWnp1RWt2TVEvWFYyOEhmRmdKZ0VKSGJlVFprRWlHL1Iv?=
 =?utf-8?B?MkF5RVZxTjdaYVJhWGhmNVV5OWFSc0pTUEhZY0JDOVFVcndXTTNnZEhlTGJi?=
 =?utf-8?B?TDM0U0ZuSFd0NzcyUEljWjdKUzlIMmF6Um5sT3RKeHcvSVgreDZ4emY4Z1Vu?=
 =?utf-8?B?UitxdXc1MDBOdEE4RVp1OXNGaEJqdERsZTY3U2lBN09vU2JxaGNCU1pGMHc5?=
 =?utf-8?B?Tzkzc2d5dnZveGNSS0xBNkdibkg4aWpRL0FBU1k0U2gzblY1bmpCazEzcGR5?=
 =?utf-8?B?V0VvZWNjdGpzS1dra0JYZ1FRY1B4Q1kvdUxhbEZCV01oVWk0WG1MdVNjQVJU?=
 =?utf-8?B?K2VhN0tmOVkyVTNCamdyZXQ2eFQzU3gwQ1FlZk1MQmxLa21Od0dkS3VQL01N?=
 =?utf-8?B?MnVSV1ZDd1VST2VsM3M2TEtiL2tpTFVHTW5LRGVFSzVqMVhIeGpUazJBUm9U?=
 =?utf-8?B?MEV0WXMzNXY4ZWJYZDBhY2VYV1c3Zi9sZzZCSGZ6U1JFRkxRbTZVYzlZYzhs?=
 =?utf-8?B?MHcwVFZrVFJDWkNpMWR3SmJ4UGUyTDAyR2I2SHlYQVhBTkxSWTlJQUoxNlF3?=
 =?utf-8?B?aHR3cHlFUkwrNklKUlYwMk0xalFmZkNxZUxQK2RabjE0SUhIdGIreHdKYTE2?=
 =?utf-8?B?eVpkcXpPZ2tkM1V0Y1g3WnVleFAxdCtsTXpLbjZqUVk3eU1mOU41eXFycFkz?=
 =?utf-8?B?TnhBU2lmcytQa2R1NUhONEtneVl5Q3JLaGpTaFdoL2pDT3B5WFpIWXZ4V1ow?=
 =?utf-8?B?ZVhhanVhTmZ0NVpBMVpGK0xwQ0xZNXE5L1ZXdzRGWFhwdFVzR2lxWmwyZ0w4?=
 =?utf-8?B?Unk4VnNTWHE5a0pFdm5mcDc3cWk3ZlVFT0xKc1FTb2lBODloOVRFMGEvK2Q2?=
 =?utf-8?B?M2dsdndpUE90Q0dxdW5vbW5LTTBDdDhGRkV2bDc3QlFpVmN4MGo3NE01aXpn?=
 =?utf-8?B?TFl0WVlVS21CdGE4WHlWN1JnT01WaU84ODhxQk5oUHkwaWplR3pZd0d2Rk10?=
 =?utf-8?B?SEoyaENWZTVmeXJ0eEU2ek1PbmtxWmxPdUhyOGsvVE1QUEkreGtsaHB1eXBO?=
 =?utf-8?B?WmVvL1hiTzRhNGNSSFJ2RWd2bGtsODZSTHB4REl0UTlpLzJRN0p1SkJyS0Q1?=
 =?utf-8?B?em1YekJRQVZQaEhlck9xcU5VSGJEcmg1QVlOa1VsKzVsbHdqUW1SWHpia1hO?=
 =?utf-8?B?aXlmVSt3UVByOHBadUt4dlRJZURVTXQ4NFU3UldXY081S3lYZll2SEpYdGgr?=
 =?utf-8?B?Zm5hUkVzU2ZjMEJQZTNqcVUzclc5YVFXSWpNTnlWaUJKRTlBVDZhamJ4R3ND?=
 =?utf-8?B?TDJySllFbGlqc29xd3BpU1JtblFSQ1hiT2l4cy9CNUNaV3EvNi9KNStuWFZq?=
 =?utf-8?B?YjFuM2Fkd2dGMno5ajF2MnpOUVhFOHJwcXNiZ01jU1hDd1RVOUdJMmh6TEQ0?=
 =?utf-8?B?cE1NOU94SDZIQk5LS01sNTFWUXVvSTFxdDBPRmhHaWFjaS9rSzVMenVJRnhP?=
 =?utf-8?B?c3dvU3Bra2JXaDVZYXNRRGxoRzFwSi9SY1JZUVl0cWQrTFJYZXFuTXZoOUhJ?=
 =?utf-8?B?c0huRUVwVDkxVUNjOHZrdFhST3pqQXAwZnpXaXhXemlyV2t6VlA2ZGYvbThz?=
 =?utf-8?B?MTVCbEJHc2hOYVh0Si9peUlEdW9xb2tYUmxyMU4ydThvUU41V3JqOFJFUzJ3?=
 =?utf-8?B?NW5QckU0NFNlTWxQL1hxK3Q2Vzl0QS8rckc4VVVlZzBrdE4vaXdocjFTNjFI?=
 =?utf-8?B?V3FvK1gzOFN5SENMU3pZOW1Yc3d1WW82cXA3R0g0SGVFL2RqNWE2dGQ2NEN3?=
 =?utf-8?Q?z342fHGDjMcKU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9aae829-3762-40df-3859-08d98c8f92ef
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 08:17:32.6877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ee90dO1nwKVcP2eR5xQvqttnDo4E4pFCWkkrrW04eFmyFmW7mCPaWqZdNvIh6Ygi
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

Am 08.10.21 um 23:13 schrieb Thomas Hellström:
> On Fri, 2021-10-08 at 20:40 +0000, Zack Rusin wrote:
>> On Fri, 2021-10-08 at 22:28 +0200, Thomas Hellström wrote:
>>> On Fri, 2021-10-08 at 13:31 -0400, Zack Rusin wrote:
>>>> This is a largely trivial set that makes vmwgfx support module
>>>> reload
>>>> and PCI hot-unplug. It also makes IGT's core_hotunplug pass
>>>> instead
>>>> of kernel oops'ing.
>>>>
>>>> The one "ugly" change is the "Introduce a new placement for MOB
>>>> page
>>>> tables". It seems vmwgfx has been violating a TTM assumption that
>>>> TTM_PL_SYSTEM buffers are never fenced for a while. Apart from a
>>>> kernel
>>>> oops on module unload it didn't seem to wreak too much havoc, but
>>>> we
>>>> shouldn't be abusing TTM. So to solve it we're introducing a new
>>>> placement, which is basically system, but can deal with fenced
>>>> bo's.
>>>>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Hi, Zack,
>>>
>>> What part of TTM doesn't allow fenced system memory currently? It
>>> was
>>> certainly designed to allow that and vmwgfx has been relying on
>>> that
>>> since the introduction of MOBs IIRC. Also i915 is currently relying
>>> on
>>> that.
>> It's the shutdown. BO's allocated through the ttm system manager
>> might
>> be busy during ttm_bo_put which results in them being scheduled for a
>> delayed deletion. The ttm system manager is disabled before the final
>> delayed deletion is ran in ttm_device_fini. This results in crashes
>> during freeing of the BO resources because they're trying to remove
>> themselves from a no longer existent ttm_resource_manager (e.g. in
>> IGT's core_hotunplug on vmwgfx)
>>
>> During review of the trivial patch that was fixing it in ttm
>> Christian
>> said that system domain buffers must be idle or otherwise a number of
>> assumptions in ttm breaks:
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Farchives%2Fdri-devel%2F2021-September%2F324027.html&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C2391a82208e6464c8db208d98aa08dd2%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637693244449717755%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=BZ3C00rZDDdpKNoGa0PYwoHeM89uVzN1Md4iN2qkGB0%3D&amp;reserved=0
>> And later clarified that in fact system domain buffers being fenced
>> is
>> illegal from a design point of view:
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Farchives%2Fdri-devel%2F2021-September%2F324697.html&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C2391a82208e6464c8db208d98aa08dd2%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637693244449717755%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3eXNqeh7Ifqe6lllRMvdfJX%2F7rX7%2FqH3wldNE5AodMc%3D&amp;reserved=0
> Hmm, this looks very odd, because I remember reminding Christian as
> late as this spring that both vmwgfx and i915 sets up GPU bindings to
> system buffers, as part of the review of a patch series pushing a
> couple of changes to the swapout path that apparently had missed this.

Well that was the trigger to look more deeply into this and as far as I 
can tell TTM was never capable of doing this correctly.

> This more sounds like there have been changes to TTM happening not
> taking into account or knowing that TTM was designed for system buffers
> bound to GPU and that there were drivers actually doing that.
>
> And there is still older code around clearly implying system buffers
> can be fenced, like ttm_bo_swapout(), and that there is dma fences
> signaling completion on work that has never touched the GPU, not to
> mention async eviction where a bo may be evicted to system but has tons
> of outstanding fenced work in the pipe.
>
> So if there has been a design change WRT this I believe it should have
> been brought up on dri-devel to have it properly discussed so affected
> drivers could agree on the different options.
>
> Perhaps Christian can enlighten us here. Christian?

There are multiple occasions where we assume that BOs in the system 
domain are not accessible by the GPU, swapout and teardown are just two 
examples.

When Dave reorganized the buffer move code we also had to insert waits 
for moves to complete for anything which goes into the SYSTEM domain.

Apart from that it certainly makes sense to have that restriction. 
Memory which is accessed by the hardware and not directly evictable must 
be accounted differently.

Regards,
Christian.

>
> /Thomas
>
>
>> z
>

