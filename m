Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4460D6780F0
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 17:07:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B086B10E4EF;
	Mon, 23 Jan 2023 16:07:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1820910E4EF
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 16:07:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTl54oWNZyu9nr8DNQFYH6WHCMIwxGmcBI3Jbd8qj64jzW/H9iaSdXICExWcgPElQ1B7CigkdHI4Dji7LYQw8AxI+Vum7Q3mXjbQErRjarb1zy/GO57b6L6gIt4gBj3TqoNGaxWOg6NkmZeXYbkipwlFjgDLpm0sENYAPepyELjTWEApfxjLJII5/2M88KSnN6mDwMYFgzSgrqS+kUHIp9VtwNz1HYIeM6RRrnKy3X3+Ei/Y6NqSQEykM6ecQvB0ZAMb+jEXlWs/W56fErH3wzXJ7ZHq0a7FGzf/A5J4oSTp9b3Sz5k1Vel9aWiH4SRh6Te2DjEwU/YwvHSus6C3Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o25A/AkxmjEh+ldckL/iVfkiQh1lfn5jYxLkkJWvg6M=;
 b=C3w1sQ5oPdQRKaPdFCpxd8MJcjYdMMjrgD0Kyymz01zvSjhQXAOUJYlU/6X6iLZzjldd/Nqo8Ap7zYDfiwTCsrGQtKYBrxxNCvMc6pNYrZbWaHhspbDrFA6rAYjkQLKdIlDycRSmRTcqp1yMiF62LnQwOdGqfjMhe8PWsd95qayCeTmBIo/NDhXXy0e+3o26iTWJ67HdICl2yJr8aBugnPxbCwD3Kn7sKQE9w1+WDtE0b5XAfnl+AIBItFdIDuhVA1LV8E2MyBq8Hi1W36anSLY3hKCN7Q41r6WE69/o1z76lYlz8Z2a5Iu8z9l4xPNVUQZaZBA28+zs9qPs3+FdbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o25A/AkxmjEh+ldckL/iVfkiQh1lfn5jYxLkkJWvg6M=;
 b=PW+PA5fTc7OhgR7DjUiLZNodetPFzTq/jflj9LYbTuQ0lLcZNS2LJTXqE8B8abGbhxEROc84k8SjgXrYH1oegIKmXHabuldINWOhqhODDi7kyx4PVYby3cbW5WSp1NvHsDvEkmQ830IDzXDdGgbhyJp1DmEzGXElKRkQRtzhbwc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA1PR12MB6704.namprd12.prod.outlook.com (2603:10b6:806:254::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 16:07:36 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0%3]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 16:07:36 +0000
Message-ID: <7d2f3e92-ae58-188e-fa72-c932abc6fb48@amd.com>
Date: Mon, 23 Jan 2023 17:07:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC] TTM shrinking revisited
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20221230111159.75410-1-thomas.hellstrom@linux.intel.com>
 <ac777256-2400-1b19-81ce-af9ec7adfe9c@amd.com>
 <8d86a6c8-de19-02bc-c254-58c2642f15dd@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <8d86a6c8-de19-02bc-c254-58c2642f15dd@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::21) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA1PR12MB6704:EE_
X-MS-Office365-Filtering-Correlation-Id: da7900ba-1241-4197-e1c6-08dafd5bf18e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +1HQSyJNehV61RzBqgqVKquobwOusxlX+4e2ro6mJCt+gfCOnKMSqF/9SIYlsXxjN+jZexNqU/YAinmWot57VPsSIjbr2Q33RTa0pEa+H8C9ke/ZufbK1eQu3FFOwmOSPAWtQiW2iRnO6QsLfJxFTL4V87crKUv4Gzi+fp/ZNp3sVEjJsPABqNo5nVNC46h0d16QpB+MBnfuHA25ttdmxsHhdZnMUkex5DKx8VGkaQdTp3Zaxvmu4IKIQ6UVazmOsBxQ/RT7ycK/AZh2R81nsGB+/CtdAtINHiQVRyGPsGwGk03NV8jFFyX2YOkI36fKfdS7JkysAxCyic0yBmnjGiZ0Yw8ULXihBGw/lVV7ALyz5aHxFBbHAGD+k1QO02w2HjxOJ6AcULLCLYd4asWRCDa/FIZ0zTLkW7uqC+X+Z/XduswKADipWorXJM2w3safr3Y7LZdbsa1O4Vq5TciByHQ7qcVT5iPGGqFRq419zcyPJOGDrIjvt/IfiDrJ13w2XX2IGPi9SBIUm/eaAaa5doh8ElowQR6HW8D4ylDawelOs0inGQQt5bPORNBE54Tzb1dK9dF1Pfr/XSdsdlIg0b9FpVOZ0CxJbte+cO5PQPzoZMG+GuWcvOsvhSe8wTW9KMQYC5pGuAk5JdZTj0RLjOcZkw7vNDFIaov5ePcRsPnKluzQOX82AddECbCAYHPtXMNcDV1zsz2X6xdmrXzz+l1JgZt4RPu9/TrlTgJXOmE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(451199015)(86362001)(83380400001)(31696002)(38100700002)(5660300002)(2906002)(41300700001)(8936002)(316002)(186003)(6506007)(8676002)(6512007)(53546011)(66556008)(66574015)(6666004)(66946007)(2616005)(478600001)(6486002)(31686004)(66476007)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anRCbGdYemhMYzZkRkptUlBkcEE4N3NBM2dYY0lBZHMzUngrQi9rVVUvRW84?=
 =?utf-8?B?NkhCOGlYNmszZjcwaWdPaTkwLytNODZ2Ry9yWVI3cXVhVzFJUzlmbGNyaE9K?=
 =?utf-8?B?azMyNU5hdTZGb055TWJEeWcycFdGZzZjSmg1VEExRTZVVWUwQXdSNGRuS29K?=
 =?utf-8?B?cmRWdUdZRGpsL3pmNDduVHJuUU5SRUxCbm9jVDY5SVJweUQyek1EVWRKVHRt?=
 =?utf-8?B?Rm1uSlRtVjNqams4bVBzWTN0dXJ1bnExK1hsRnpmNi9CNG9TeDNCYjJPYW5n?=
 =?utf-8?B?a0lHc1B1WjNPK0Z2WWFRSlNsaFBtTjFPWFEyNzZKK0tCeUwwN3ZTRTBzVGNt?=
 =?utf-8?B?K1BjdXJxYUxqdHVLd25PWDM0UWhnY25ETVQ3d0xGd2JMVFJwczhGaXhLWDlG?=
 =?utf-8?B?K3Y1N1g4OFZBckRUOVQ0NCt3YXh5VkE2TmRlejlRUVFDRFJjLzJyRlNOc1Zs?=
 =?utf-8?B?MkMxdkw5cDcvTXJlejlRZTdVOGJYT1FHeXVXL2hFT09LcDdpK0FVaTNXVkl3?=
 =?utf-8?B?eWFldDV3K1h2eEwyWVVMUXpmbDMzanZKSzlRcXJYaVNhcFgzS2tjaWdlL2ta?=
 =?utf-8?B?eDMzVXNxd09uUFJ1dCtFbkthY09YbFJxb2w3d2xqTXduOStCSkhnN0xSY1pF?=
 =?utf-8?B?dzN5c2p1ekl1OG9tSEU1a2JzM09WKzRXeEJIdlhzVW8wNXdJZGtlalJ5bUdD?=
 =?utf-8?B?WDJ2UEVpdDk5NDM5VmdCZ3dnWG9BbmNnNkUzYzBSY1VVVkVuc3RuWE9Pb1RM?=
 =?utf-8?B?ZmNaSHlsUzZJNXFSYnZVQ2hJbnNTZ3RsNDE4NHZqK3dmRU1OWTFON0dZdk9o?=
 =?utf-8?B?OG1PblFwdFZpMGJ6SXllQzBQdW54dEJMcXY3dUVmRWJ6bCt4UHJveVQ0aFQ2?=
 =?utf-8?B?dkQ5M2ZaZVFTZmgxUDBtdnJuMDg5WUhmc21meUlQbkEwVGJSdnFSTTdIVUFH?=
 =?utf-8?B?RENURklIZi9SNVNGNXlObWN3ck93K1EyT2FmWWt1WGgyc2VrWVZ4RnB0Vnc2?=
 =?utf-8?B?S0xZM2kyM0pra1Y3NmZCNEhjbXM5OTA2d1FiZmJVSVlRTlZvS05KZlR5VlBv?=
 =?utf-8?B?Y2V5ZmpzdFlFZC95d3hTQjNwQ1o5VEJCZU9oYmdzVjBKVU9LajNJWWJiODU4?=
 =?utf-8?B?TkZFMERnZ2k5SHpEaVdLNC9JTUMzKzUyR3U5RDNOMnUzMWZXTFhsOHQ1Qm9N?=
 =?utf-8?B?anVJQU5zTUhWUjI2dGJRQW5UUVUrRnRwd2Yza3Y0ZzNCMXJMTk4xaGExbmVD?=
 =?utf-8?B?M1pMcGJSYS9mSkR4Y1grQTNuY3JNYW5XY3dhODI4MDZKSGowZkxtM2FFTzhY?=
 =?utf-8?B?dUFoVXR5cDRQRjlZM3MzeUVMaDAycHpDYzFyNmpMeDNEUHlsdnptNnhFRnEz?=
 =?utf-8?B?cHFKMkhycWlHVzBJcHpER0NCOE5BUmhQUjUvRVhTd1Npc2J1Z0FsNElsOERk?=
 =?utf-8?B?ekl0c2NaVWxJalE2bGk4aE05VGtBQVdIWnpQTWttaUgxUUZmQ1dMUlFHN1hY?=
 =?utf-8?B?dG5UdnNRRzBzQWhKOUJqRE1TcGdTc1IwbWVoa0cyKzM5WEw5NWJnRkdmazl1?=
 =?utf-8?B?c0tHSHF3RVZNbzN1MUkvV0JEMmdYcnZPU1R3TThtNERkK0xrbHI5Wk9FaCtX?=
 =?utf-8?B?WjRQNVRhNXFNRmI5b3RDOWwwRGFNRUNSNGp6ZGhTTFVFRmg2WFhHYncrTDBS?=
 =?utf-8?B?a1QyeGRqYVRHa2hXVWhEOUxoQjZYZnAyK3RFNTk0c3MxdUs3azJpakE1UGZK?=
 =?utf-8?B?S2RhZzd1MWFTb2t5NjBTYktCMHhmdHFabUExY2R0eVhlVnJrYWxLT0NFc1NB?=
 =?utf-8?B?emU3bSttd1hTR2hwL3JUM3lvelE2QjgvK25oaEFqcFBlQllIa0VmY2ZXZDIw?=
 =?utf-8?B?UjV0R2plb2RmV2JNdmFobmNYem9lVjQyWEpZL1cvaWo0dXQycXJrTkFIeHk0?=
 =?utf-8?B?cmJMQ09heXZZYTMzRUQ4bzVCOTl2WFpFNndpS284WjZVM0psZHkybkwzNHF6?=
 =?utf-8?B?L25WUldNMkJ6MlZVOWhBczZrSlpjR3BlUnBCYmJlM1V0NDFsTHJUVVZ6U2pG?=
 =?utf-8?B?VmNsTExjbTcwLyt4M0VJUzVZTW1GUitZaEVWL0hVQVdwUUJoSWVEUG4rd2Y4?=
 =?utf-8?B?TDFuYkw5MFJQU0dCSklYVEVNeVljZjNyamh4c3lJU1JnVlFMUVptQjczNnlt?=
 =?utf-8?Q?zGjigMMmFppFh4OGybjFY/+JtVfpmq6gum1mSd0FSKu3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da7900ba-1241-4197-e1c6-08dafd5bf18e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 16:07:36.4120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: euffxo8uTyWu0FB++h+fvyv9V2pivTgiEcVW18Uj/uQL7QDneT4GZOFb+X1kogwj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6704
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

Hi Thomas,

Am 23.01.23 um 15:59 schrieb Thomas Hellström:
>
> On 1/4/23 11:31, Christian König wrote:
>> Am 30.12.22 um 12:11 schrieb Thomas Hellström:
>>> Hi, Christian, others.
>>>
>>> I'm starting to take a look at the TTM shrinker again. We'll 
>>> probably be
>>> needing it at least for supporting integrated hardware with the xe 
>>> driver.
>>>
>>> So assuming that the last attempt failed because of the need to 
>>> allocate
>>> shmem pages and lack of writeback at shrink time, I was thinking of the
>>> following approach: (A rough design sketch of the core support for the
>>> last bullet is in patch 1/1. It of course needs polishing if the 
>>> interface
>>> is at all accepted by the mm people).
>>>
>>> Before embarking on this, any feedback or comments would be greatly
>>> appreciated:
>>>
>>> *) Avoid TTM swapping when no swap space is available. Better to 
>>> adjust the
>>>     TTM swapout watermark, as no pages can be freed to the system 
>>> anyway.
>>> *) Complement the TTM swapout watermark with a shrinker.
>>>     For cached pages, that may hopefully remove the need for the 
>>> watermark.
>>>     Possibly a watermark needs to remain for wc pages and / or dma 
>>> pages,
>>>     depending on how well shrinking them works.
>>
>> Yeah, that's what I've already tried and failed miserable exactly 
>> because of what you described above.
>>
>>> *) Trigger immediate writeback of pages handed to the swapcache / 
>>> shmem,
>>>     at least when the shrinker is called from kswapd.
>>
>> Not sure if that's really valuable.
>>
>>> *) Hide ttm_tt_swap[out|in] details in the ttm_pool code. In the 
>>> pool code
>>>     we have more details about the backing pages and can split pages,
>>>     transition caching state and copy as necessary. Also investigate 
>>> the
>>>     possibility of reusing pool pages in a smart way if copying is 
>>> needed.
>>
>> Well I think we don't need to split pages at all. The higher order 
>> pages are just allocated for better TLB utilization and could (in 
>> theory) be freed as individual pages as well. It's just that MM 
>> doesn't support that atm.
>>
>> But I really like the idea of moving more of this logic into the 
>> ttm_pool.
>>
>>> *) See if we can directly insert pages into the swap-cache instead of
>>>     taking the shmem detour, something along with the attached patch 
>>> 1 RFC.
>>
>> Yeah, that strongly looks like we way to go. Maybe in combination 
>> with being able to swap WC/UC pages directly out.
>>
> Christian, I was wondering here if
>
> 1) There is something stopping us from using __GFP_COMP and folios? 
> Reason is that for, for example a 2MiB page, if we can't insert it 
> directly for whatever reason, we don't want to allocate 2MiB worth of 
> swap memory before actually handing any memory back, and so may need 
> to call split_folio().

I've tried __GFP_COMP before and ran into massive problems. Folios 
didn't existed at that point, so they are probably worth a try now.

>
> 2) Also any objections to restricting the page allocation sizes to 
> PMD_SIZE and SZ_4K, again for split_folio().

We can't do that. A lot of applications assuming 64K as huge page size 
for GPUs cause that used to be the standard under Windows.

So only supporting 4K and 2M would result in quite some performance drop 
for those.

Christian.

>
> Thanks,
>
> Thomas
>
>
>> While swapping them in again an extra copy doesn't hurt us, but for 
>> the other way that really sucks.
>>
>> Thanks,
>> Christian.
>>
>>>
>>> Thanks,
>>> Thomas
>>>
>>

