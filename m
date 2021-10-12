Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 542B7429FC8
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 10:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE476E7DA;
	Tue, 12 Oct 2021 08:27:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 454656E7E2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 08:27:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PGY1YUy0tgfavGnpfBW6emzK4/kZr0ks1r5MjR9Yh74zQ9yBivFSzCgNB7ifnyi71n1x41EIVDhDO5x0bXW567wlmcGuMcx3frqP0WVJKjV2fnnE57zZo8Anb/yHpHOo+phKoH7lkDkPjkjux9D13NGPkOeJv1t9HxXpoMkiIzvk80r7Y8+36vzFobaMfGCOk3Ne9g+Ns6SKPiIjvlGP7/hWyx4Zzpba/mW7x19HTh0TRPhrOKRF9AvgaZKktTW7ZSWmNB7Qyj1oBOyb6ApqUwjiLJ+OYZ6yyzvLjiHIC0+JZwSD26BwAWtojv+6b3GkXMGK028rbRLSiwkVy7tAKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GUnEBP6UALjjgyemUQ6ky4Zj4td615R7ElxCs29UB18=;
 b=gWSXyPVJjPb2afH3Mskb9YpmQklLt9HejM8uyoQqVWRbF+L74OnyqeiWPefRD4O91F4UOc9okBV8o8yBiI/RS4kC0Bx5faihqcz5HEYEER1DPxVBT2w9/pRwKiSxd6cjGlpMN1L/k/ADsrvshkmQ5GMlTv3o/MLpYozhGsaP+3ZEzQJ3kruVsT/7Ex38IJDiGHQDM/4yJWDhUcXglKrFOOvDatDiOyahe3o5EW4lZykhNWFwKQ10v4Rmx4UqF3Ke6Uqj+vera0Ma3BZ6cC67ELaQwYnGEBmMu9ZXwIBCWcoY7Urk/pUqMlwBfBGYboUP/AGrj5T0+GAoQ2BNTYHgBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUnEBP6UALjjgyemUQ6ky4Zj4td615R7ElxCs29UB18=;
 b=yAU1gIbj+E0FeftOSyT7s1eboV8H7hEvA/56VG7tRqXH6Yq7VdrXjIPFkzztXhz3LH7xDHCtKe66dTAsoDUX5e/oqSj64lQqQF3ZI8D82qlweIi3CXNbQJnkcl2Af7/cgUjjvmUZThmyWYv9PbVR5zncGFHw9dOwEgi7HAwmzN8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR1201MB0189.namprd12.prod.outlook.com
 (2603:10b6:301:59::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Tue, 12 Oct
 2021 08:27:50 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4587.026; Tue, 12 Oct
 2021 08:27:50 +0000
Subject: Re: [PATCH 0/5] drm/vmwgfx: Support module unload and hotunplug
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Zack Rusin <zackr@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20211008173146.645127-1-zackr@vmware.com>
 <7abe3906a814e40786da5cd5d45a7b826e262d8e.camel@linux.intel.com>
 <dbfb505f1034a2d725d76e30a26d2da0a850dd41.camel@vmware.com>
 <96a89fdb5a10141e87d7283720b4088461db722b.camel@linux.intel.com>
 <232f45e9-8748-1243-09bf-56763e6668b3@amd.com>
 <4041c72ff1d3d149437cedbcf3c598ae2238519d.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <1b80b739-3d7e-1228-03d5-eba11f58dbe0@amd.com>
Date: Tue, 12 Oct 2021 10:27:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <4041c72ff1d3d149437cedbcf3c598ae2238519d.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS9PR06CA0178.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::10) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:87c8:f860:ca5d:9823]
 (2a02:908:1252:fb60:87c8:f860:ca5d:9823) by
 AS9PR06CA0178.eurprd06.prod.outlook.com (2603:10a6:20b:45c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Tue, 12 Oct 2021 08:27:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93e62b8c-c608-416f-e875-08d98d5a2db1
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0189:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB01891E5BC130512D7377DDA183B69@MWHPR1201MB0189.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jhHA4Q9pZlMNUN1O6BcH5TY6NdY4+naqC0RdIZxuX+0Hr40bvVqy83XJuWQp7YVr+xVlkEpuxTC4Cp6zqtMfnO2kNc0hB+0BMyxxszucx4QJ9pxmcZ+cUSVD0YiAcAhUunQnsPhk780w61DCXhAWVE3KT2/LjxWNLmB9LtX0AQN9zGvJ9etbpp/iTpRkg+f3ryzidpKVgsC31VUer8gUWGmWf5javg5FvKbTTKoC/mDpOMTMUXWcwsKMRsOR60q4RSiNfZzEeTqcOq2eNSfjuxDiSDIPfng2YpVNjt6iAKDcYhc7Unx+kRZCaTESJCstkhOhhd6ZrOThejP2TQr2sdaxDoe/F7MSeoQrN4jgP87p3xKsh1+qylrjsyjFo05OgMAJIHFZ+tIDvjKXqK3rCdz6XxfL2QvGM+Y5Sp6etsATarQ5/qYZWIacfKAbp9CmWqtWGPN1PWRXI9niYcyY1vLUYw8JDpVRC+VR8RyKJzk3esOWHQGTkD+ZMfJRshv/SLn1WUKfn5Fei+2zGNsxjGm2/yVaZTSecr/YSxZFkPduUdMKJZCxGZ+N3aDxLpI714KkTl1UXdkSEnhN/Oci9oY+Ems2k5oFYIZwcVmAKCJxoiJWWnjD2SqEKDmh2QnHOtu2JT8tfRtWNmC8rbGenl0tLClEm84r/BLwbyS+iFtzmJ75AdG0ddTIjYyN207LBDKwcAy5/er5pJ0TqOf227tsO9QFiFzUybPbuHQ4WBdwYBSOCQWjkG4/ZX36yl8z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(36756003)(83380400001)(186003)(8936002)(6666004)(38100700002)(2616005)(8676002)(66574015)(66946007)(66476007)(86362001)(5660300002)(508600001)(31696002)(2906002)(316002)(110136005)(66556008)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkhBWjNCTEdXSXN4RnFJcFd1SHI5V0xHRGJ3dlFnWU8zb1o4Q2pIdW4xdVZU?=
 =?utf-8?B?TVkvSjVoZkVzcFFhdnNRNVRGRFpiQWVYOHJPUTRpMk44L3hoQkdXL1VGRXli?=
 =?utf-8?B?TnRscVFpcGg3dlU4K1ltdTZUbnhiZktwWXJ1dE5tV3hiY2dqa2RBSzRPcHR6?=
 =?utf-8?B?MUh5RzFxNjhqS1pIY2RiWTI5bHE4NGRjaG44TUU5eDdYcVBYbm50Rk9TSkxn?=
 =?utf-8?B?b0tVV2l1SWlUVW84SGp3Yi9wOExNdzZ4NGVzOFZ1b0FORHRBWnpiZ041QzF2?=
 =?utf-8?B?Zzg4d0dFNis5NlYyaU1SM1FETkhrWnZKQy9Wc1NtbTJqMjlrVlhESWMyM0w5?=
 =?utf-8?B?OVF4QURjdmxZY1FqNUJDcTJuUTJiS0R4NDE5SVBnV0NGV29KaU9LOGFPdTJj?=
 =?utf-8?B?YW5RaXFJb3FtQlh2N21xTG81R0loOHdRcjdvZG1ZT2xRN3IvWDdlU3ZWWkNT?=
 =?utf-8?B?Z0RENXRpQnByWlJiNm9aaTR3ZVpneER5ajRTS1NqaFQrMDdWemdlTi9xNHlR?=
 =?utf-8?B?OS9XSlJNTmc1alNtUXE1UGNqbUwweWxHV1k5K2dva3pNRGtSaElUWmw4S2RP?=
 =?utf-8?B?NWxkN2UrdUxMelM2S3JWUnlRK2g5VFFqS2Zkd3A3YzJvR2FxTHhjTDlMbE9s?=
 =?utf-8?B?SGVlc09XZDNzTFZOdVkyODZoQTFLYkkrSUJMY0dpTWpidjFIelhuUDdRTThp?=
 =?utf-8?B?ekhnTUFKN3dPMzJTeFRyWHV0WmJGYjZKNFZUOW56Y2Q4R1NTU2FMNmdlcXRR?=
 =?utf-8?B?bmQrRFJMVDE0cE53djRVZmpYQzhhT09WejBjell2ZVpOTUhuSkZpbXZjcmRy?=
 =?utf-8?B?VVUwc3lNaW5wajVRQ2phTGhieUZ0QkxoME1lSytCN3Mva2pyZyswMGJwU2Uv?=
 =?utf-8?B?VnhQV21sTFpidUllQ2t2YU5wV3Vwb3pSUHVOaGQ0ZlQ1S3paRmFJK0dBdTRv?=
 =?utf-8?B?ZXhFVWVoY3pobit2NXpEYXNsMW9zbW5jZlk3RndWeHZuVkJacG1CYWg0N2dL?=
 =?utf-8?B?bmwvL2hjWTkyZlNISmJTT3dJSi8yM2xuUHdhem9jbXpmUnpqWVdXcGRVYW1w?=
 =?utf-8?B?REQ0aHhVanRtMWhwOFk1L3dVdkUwcXc1c0ZkOWs4elFrMHdmUEJsSkRpMzMr?=
 =?utf-8?B?ZDBLSTdLYzBmMFdVd1FVc0o3RzgxaG8reGwvTHJWYlUwcjNObzdtZG4xYzRP?=
 =?utf-8?B?cjJubUVVQUpGMWNpb0V6RVd0UE1BMkh3cmVRTCthT1ZDQzdKb3owRnVCeTZJ?=
 =?utf-8?B?RlZtelNkcTFLRElvUENsZlVtTjE0VEpQckd3ekszYlkzQ0RqWVlkM1MwbGln?=
 =?utf-8?B?L0RDeG1FekdEQkhzYTZaUmw0UmQwUmhYUVUxbVVXK1lsbmpmN1pnVTRuQjNw?=
 =?utf-8?B?dW9iWHlrMjRpbmp4QVNqNHY0UWU4akdlZ2NNQndFeGJUeTlQQzROcWdCamtR?=
 =?utf-8?B?TWM2dS85MjBhczJDS3Fqdmg3VmlxTm8rY3hYNUpyL0dFWENHM0RUeHRSemVM?=
 =?utf-8?B?ZjN0byszM0J2dmI3WlRJV3pXeDlBb25kdFBjaVUvNkQ3UStWa0d4aEpQRHlp?=
 =?utf-8?B?dUpiSzhRRXMzWUcxcjd5elNVVnZqZjZzUHFEME1uaG5iYjFHSjBNRGc4MEto?=
 =?utf-8?B?VVhxWTl3SHVCK3hPUmFPbjN6emtaaDl2dkZNaVB0L0pUZERpeHprM1Z2ZHVk?=
 =?utf-8?B?ZHI3NncvU2YzaEsweGw5NUVWNzluOUdnV21SN0pzL1BOVVVtUHFPZWR4NW9E?=
 =?utf-8?B?bUJGejFmV2ZDNnZPcUhuNGpiczgrM3UvVHArK1pjQVkzaDVUVHhzWWRsU0lh?=
 =?utf-8?B?dEZ0ZlFNZmlUT3MwMjlJWVJ4bVdSSk1DWVY4V2c0ZURtYS9MNTlqNnNtUTYr?=
 =?utf-8?Q?TBVbRYIxb6WgN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93e62b8c-c608-416f-e875-08d98d5a2db1
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 08:27:50.5391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ER0B/164+YBv0N8lHvWPpNUmmKImIlerPmIt2khqtuSn4DhVFDfQnqoi4L2yn4+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0189
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

Am 11.10.21 um 14:04 schrieb Thomas Hellström:
> [SNIP]
>>> Hmm, this looks very odd, because I remember reminding Christian as
>>> late as this spring that both vmwgfx and i915 sets up GPU bindings
>>> to
>>> system buffers, as part of the review of a patch series pushing a
>>> couple of changes to the swapout path that apparently had missed
>>> this.
>> Well that was the trigger to look more deeply into this and as far as
>> I
>> can tell TTM was never capable of doing this correctly.
> So apart from the teardown, which appear to be an oversight when the
> system manager was introduced where do whe fail currently with this?

During validation for example. Moving BOs into the system domain means 
that they are potentially swapped out.

In other words when drivers are accessing BOs in the system domain they 
always need to take care of TTM_TT_FLAG_SWAPPED manually.

>>> This more sounds like there have been changes to TTM happening not
>>> taking into account or knowing that TTM was designed for system
>>> buffers
>>> bound to GPU and that there were drivers actually doing that.
>>>
>>> And there is still older code around clearly implying system
>>> buffers
>>> can be fenced, like ttm_bo_swapout(), and that there is dma fences
>>> signaling completion on work that has never touched the GPU, not to
>>> mention async eviction where a bo may be evicted to system but has
>>> tons
>>> of outstanding fenced work in the pipe.
>>>
>>> So if there has been a design change WRT this I believe it should
>>> have
>>> been brought up on dri-devel to have it properly discussed so
>>> affected
>>> drivers could agree on the different options.
>>>
>>> Perhaps Christian can enlighten us here. Christian?
>> There are multiple occasions where we assume that BOs in the system
>> domain are not accessible by the GPU, swapout and teardown are just
>> two
>> examples.
>>
> At swapout we *do* wait for idle after moving to system, It's relying
> on the swap_notifier to unbind. That's why the swap_notifier is there,
> so swapout is working perfectly fine.

You can of course define that BOs are not swapable or call 
ttm_bo_validate() with a system domain placement and then make sure they 
are swapped in manually, but that is extremely hacky and bad design.

As far as I know that's what i915 does, but that doesn't mean that this 
is a good idea.

Additional to that I've already noted that I think this swap_notify 
callback is not a good idea either. We should rather have a separate 
TTM_PL_SWAPPED domain for this so that drivers are cleanly informed 
about the state change.

>> When Dave reorganized the buffer move code we also had to insert
>> waits
>> for moves to complete for anything which goes into the SYSTEM domain.
>>
>> Apart from that it certainly makes sense to have that restriction.
>> Memory which is accessed by the hardware and not directly evictable
>> must
>> be accounted differently.
> Could you elaborate a bit on this? From a swapout point of view, it
> looks to me like SYSTEM is treated just like TT by TTM? Or is the
> accounting you mention something amdgpu-specific and more related to
> the amd GEM domains than to the TTM memory types?

No, that is something the Android people came up with to improve the 
shrinker behavior.

> Note that TTM was never designed to deal with GPU binding, but to
> provide a set of placements or memory-types where the memory can be
> mapped by the CPU and bound by the GPU. TT was a special case solely
> because of the mappable apertures. A bind mechanism had to be provided
> for TTM to be able to map TT buffers, and most drivers used that bound
> mechanism for convenience.

Well that's certainly not correct. Before Dave moved this back into the 
drivers TTM had bind/unbind callbacks for the translation tables.

It's just that vmwgfx was an exception and all other drivers where using 
that correctly. This vmwgfx exception is now what Zack is trying to fix 
here.

> So now if this is going to be changed, I think we need to understand
> why and think this through really thoroughly:
>
> * What is not working and why (the teardown seems to be a trivial fix).
> * How did we end up here,
> * What's the cost of fixing that up compared to refactoring the drivers
> that rely on bindable system memory,
> * What's the justification of a system type at all if it's not GPU-
> bindable, meaning it's basically equivalent to swapped-out shmem with
> the exception that it's mappable?

Well, once more that isn't correct. This is nothing new and as far as I 
know that behavior existing as long as TTM existed.

It's just that vmwgfx was a little bit special and broken in some aspects.

> It's probably a non-trivial effort to refactor i915 to not use system
> for gpu-binding and in that case I think we need some solid
> justification why we need to do that rather than fix up what's not
> working with TTM + bindable system:
>
> So could you please elaborate (assuming that the teardown is fixable)
> on the other parts that don't work.

Well you can of course design i915 however you like, you just need to be 
aware that when it breaks you need to keep the pieces.

Regards,
Christian.

>
> Thanks
>
> /Thomas
>
>
>> Regards,
>> Christian.
>>
>>> /Thomas
>>>
>>>
>>>> z
>

