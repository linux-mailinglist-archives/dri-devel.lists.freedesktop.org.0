Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B90753733
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 11:57:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D3B410E83F;
	Fri, 14 Jul 2023 09:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2047.outbound.protection.outlook.com [40.107.94.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7117410E83F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 09:57:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2htelgq7Glb6v3CoiwHuJlL3uF9HC+ZxSFSE2xnj1lix2CnPx75M4X7kuGtPE2Vn9kEf2plLtqn1oIMay3LB1QztKBUR67rOLiS8Oj5ZqHbyebK2jAWGvJR9xUXfAhTkzUjlsJOIVpXq7SoR0TSxcZ8H5v8IxtgMx0BpelQ9QOCaEapatEAHZq2BdgBk9bihHjPjpkGd68mUc2SfdjaTCdlbVLAWb4EMkdsLiUB4H3VWMXFxuSC/zn/DmnxNAAwIrdroYqtmXsPaYmRlcZxrfmcnmAr7CdHsvjfiZvvlWE9kgV6dF5dBYald7hg4SKPuenZVdK6rGjlYD/zGFkhSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zowt3R4gpRblp2S1kd007f/Xwd68vk6XjXZWASLYM0I=;
 b=gnp6m56a5Otdzzp8ieLNYVo705OOm3So4K5QDqjtyPPlh8KndttVnubnKuMTuuL++wudJCaHxBGuw8MvIQ+TTkjY3Hg6443hr8ffCGGtcgvbFzTodmRXC0HarpDY4O43hvsLeBOt6SJuwsfMKKaeC2b4ftWFVlQ6/0PcPjOeKPuxgKxSZHx5q1rkAP8K7RSj+t8+nmFEVnBDGJPWvQeTVAQH+sMaR4feJrqhFO9sOKiJ9x9jc21SiyW6RqDt1y7lN1qPfC2Sj36zp7FkXpibG4MhNfzmcBt9N7JBZchk7IUoO8dguyC/4aKycvrcWnCEarMHyO5vh02HbNxMhFbpVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zowt3R4gpRblp2S1kd007f/Xwd68vk6XjXZWASLYM0I=;
 b=1+KAQQZneMJ8sd9mAwFkTbTL3+Ga4Syxm7/7Lc2yKZyiDkzTYb73qWv4gHPK7LP6VczTgnOzHIm89MSGDN5jLNxMulM2wyFRot1eQxasla/JWYLme1pGQEa/GPZPdbzL2G2ShRRQUlLM23IUb978nEYMxkDU6oGdTrIBXzORAfg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA3PR12MB7974.namprd12.prod.outlook.com (2603:10b6:806:307::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 09:57:08 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921%4]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 09:57:08 +0000
Message-ID: <d9dc2fd5-d054-dbf3-72b7-fe9deaa46350@amd.com>
Date: Fri, 14 Jul 2023 11:57:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/3] drm/scheduler: Fix UAF in
 drm_sched_fence_get_timeline_name
Content-Language: en-US
To: Asahi Lina <lina@asahilina.net>, Luben Tuikov <luben.tuikov@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
 <20230714-drm-sched-fixes-v1-2-c567249709f7@asahilina.net>
 <bef7ef62-3cd9-6ceb-5eb4-5ae0c0236778@amd.com>
 <de502b41-2864-db1e-16a0-8a5d5e0e4ad3@asahilina.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <de502b41-2864-db1e-16a0-8a5d5e0e4ad3@asahilina.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA3PR12MB7974:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e8b3b93-8a35-40c5-50f4-08db8450af49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2J52WrKfa0XVqVr+zt0VYXceQfjCYKoYR6oMR2DbMRcCnPN8jNOpie9FtJgXGZuTAdj4IiCDJkoIEnMZ5di+w9l++u1wxagy3OcSW5lywpDMzjoxpvlwtkgiOT6BoSDZ6wFQvUDPsxkWz7gSKm1cpyer949597w7RYUJtEzciAki4gKt2JZCOf9UEoJumBIWdJMzxtJMCXY2/Jt9N28a0BiPMrOCCxn8cuLrohSaNVmaei9tSkMWOKqjfwMF0XKdKrFfC9whLZyFJ16Mu/mIQzhWptmJnUOhcFYivrMVX9Nfxr4kphGhda4Iz2piDaiFcYG2lu8IMr6JOB9c/QbCkLtbMDtgB3bdaGd6gS2dpz9z7L1Mn3Rb2AB1hXa84KM5s81tjbXSVTli3dtd1aeVOTNQhxD9zx1ZzkqclSLFZ/Xi42U1hJ4bhbgZ08l5uNVeoJkafpqQFgY8CZmD+BJcnJrlCHiK/TT9IQoiqqljkGRRfy1wVdhJPWHkKuJ5du+XSY9h7rYOpdIkz7Wle6r8a8bO0WWJzSBM08rYUw+LgnamFeTM0dHJ6Jn58PHSwfBwb+kTIu2ovk5MQ9oJFLe8bbptx0AYIFYq5U6JZYiJCRvM0M4dNl0jEMZGY9Y/xtqrF09MpocRlx3vj0/1lNcjrQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(366004)(39860400002)(396003)(136003)(451199021)(478600001)(66574015)(83380400001)(2616005)(6486002)(6512007)(6666004)(110136005)(4326008)(66946007)(66556008)(66476007)(54906003)(6506007)(186003)(31686004)(8936002)(8676002)(38100700002)(5660300002)(41300700001)(316002)(2906002)(31696002)(7416002)(86362001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnArSXA2UnZNalZQOWRVNUxhSXN4b010VGRWb0x1dlhCZ1FYMExkd0FqVjFD?=
 =?utf-8?B?WUtKWmRYRWVyNk4vN3ZVUjdjUm93RW02blRYandkaG02Q1lwRVJKTjZ6bkxX?=
 =?utf-8?B?aU9OM0R2V1JldTROQVUwdXJ2MDB3WVppSFNycGJmM0pEckN1OUhpN3FIc3po?=
 =?utf-8?B?VFRSalJ2b0g3Vk55bXBYS3FsVG9sSS9MQTZUVkJyeE9OM1lpTlc5cjRnTGw1?=
 =?utf-8?B?ZmxMcEhaOHJhZU9NR1B5SUJzTDhnWFZaUE13MlFSRHBybmxLNkJnOGhhdmo1?=
 =?utf-8?B?TjdBUy9YR2hqV2p3MmpZYWRwNmZVSi9sMm9FNXFPUUhOcUFhVE9RcjRVYmVB?=
 =?utf-8?B?NlBFYnkxT043cmsrV1pldk45MnpKTld0MW5qM1QvNHBOZ3dtRm13V1pKRmlB?=
 =?utf-8?B?akpuRFluWFFCbDJUemh2ZHdEaHpsZmNVdVpVTEc0NktvTmdyZEJ1ZXpRa1Zh?=
 =?utf-8?B?TlF0TTA1dFhCZzFQWCtCOFBYZnc2L2VOL3QwbndHMXpkZElmczFRTDZCNHA1?=
 =?utf-8?B?TlhvWkJxa28wL3g4RVVYUW9nRXlrSWZuR2lzanNNMEdoelVVL2RlUGV1RHdw?=
 =?utf-8?B?SndKeldxSHk3SHBXbU84UlZHL2ZRcm5pdHkxbGplRW02ME9CMzNFcFp3MWZ2?=
 =?utf-8?B?eXZYVWVVSG9KODJqMFZDbWtjTHdzRGsxbzRWSkpBSGpFU3RRWUZMc0lyeUk2?=
 =?utf-8?B?d25FY0tKMUV6SHoyelVCQjQvc0xsaDN0TXdhSHk1SUtRbnVseHF4NldzblV3?=
 =?utf-8?B?Z3hpeGo3UUJnNU4zWnpjZkIwSWFiUk5YUGtrZUNJdW05TGtmd3hhZ00rcFZ0?=
 =?utf-8?B?VU1VZkdWbUJGeFB5UEVkNHl6dnVySDVMVDNuL01ybnhtallFcllRTzZQZ2kz?=
 =?utf-8?B?S0IwVHJ6bXNjYXlxbnVkdFRvUUcrR3R6UGRYVWN4a2FOQ3V1ZkppcXI5Nndx?=
 =?utf-8?B?YnJsTVYxWm5ITFF5OGcwUldtYnF6WGJYd2ZMWnZmSnJ6S2xjRkhJY1E3RVZD?=
 =?utf-8?B?RzgvTTR1SzVvU0tsTW5SazQ3MWt0azZWaFgyeWtPVmd0d1R0Um10VGp4RDB2?=
 =?utf-8?B?L1ZiVEYvcCt4Sm9PL3hQMzhJK1lCOCtVZVVMS2VrREZiUTJ3Rk83MUozS2pF?=
 =?utf-8?B?YlVIb1RET3M5bDc4bnNJYlBFNkFDaWczVDF2MXZkaE5QZHRJbzc1UkdOUUdk?=
 =?utf-8?B?QnRIQVJvYUJFZHdIYm1MSFBUanpibnFaM0hRNkNSeXQzZFEvejE5cVhyVjNO?=
 =?utf-8?B?L3R0c3JvaHlhUTBDRXJkbUNmc05oeFJaeWQ1dUFseSt4RmliOTUyb29Nakl2?=
 =?utf-8?B?ajU5MThzcktnbkJWVDlaZnNSZzFLWUd6UFpWSjhmTk16eHpTb0wzVktHSHg2?=
 =?utf-8?B?eHJJZUZFcnkrN3hWdUJubzZzbTVWblVvU0lBd2R5SzVieWM3VDVmT1cvZytF?=
 =?utf-8?B?dXF6MzgycmN6Y3FIMnB6NWVJTFBBRGNoNHEzNDlqaUsvRG5jaXJPbjMrTVJR?=
 =?utf-8?B?R3RFMjk0R2p5R0hPeE40TWZ6Sm1aU1F6TDZXMjAvc0IweUhZUG1mV2dRSmc0?=
 =?utf-8?B?NExCdWt4SXhNTHlLRFIzRm40c1RMUW11T3BieFFJZ3VvOHNDNTJtc3Q4Uk85?=
 =?utf-8?B?QU5EK2l2WC9VNm05aUE1WGhuUkhpRjBJRDVVeG5tSHMzMUFYbGVGY0l4V2ox?=
 =?utf-8?B?aXBmQ0ZGaTUyVEVzZWs0U1JKQUlKRG9iaGtzeFloUmZWaHlUbEhKTE1FaklM?=
 =?utf-8?B?Y3dmZ3pJVWVDVjc5OWJNbFFaY1NZblpGQUpoOURHUFJpUFh6OS9HeDBMdnYw?=
 =?utf-8?B?d0FQeFJkZFZlYzQrZXVENEpVZ3hkaklFL09oeTNvZ3M0RVVhU0RnbVFSaGxQ?=
 =?utf-8?B?WnJWTzNzTlFIZUxWTEVNeFRYSzZUR0R3Uy8vTmtOcGIxNWxaRVJWamxMcUNH?=
 =?utf-8?B?MEZlbzc5dGlpV3JaanlkMWRtU1VkWDVFTGsvVzBwRXBOQml0YWEyVkpad0oy?=
 =?utf-8?B?ZDduSmRvb0tXZHR2QWFqY1kwamk3MXAzVkxMWk5JWDduVHhBTVVjTWNnSm4y?=
 =?utf-8?B?Nk5venh6eGNvbDFXWTZMVnc0cUNxN3V1OVN0V2JuVUJMQVo0clB0N1czS0J6?=
 =?utf-8?B?Q0c5OXN6cjhMMnNPQUhzV2orb1ZNcHlVUmZNMm1DdVVjbkZ6aTk1eE9hQTVk?=
 =?utf-8?Q?sV/4BI/1SYOshFacLhiCD37Ovf4K3JvlH+2Odzr7iMnP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e8b3b93-8a35-40c5-50f4-08db8450af49
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 09:57:07.9736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kVfrTz4tkLGi2JRoKNYIocpnGqkptRDHhbL6DKIJkhlz4WdyHmazaW9ZcA9V3bBz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7974
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
Cc: Faith Ekstrand <faith.ekstrand@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.07.23 um 11:49 schrieb Asahi Lina:
> On 14/07/2023 17.43, Christian König wrote:
>> Am 14.07.23 um 10:21 schrieb Asahi Lina:
>>> A signaled scheduler fence can outlive its scheduler, since fences are
>>> independencly reference counted. Therefore, we can't reference the
>>> scheduler in the get_timeline_name() implementation.
>>>
>>> Fixes oopses on `cat /sys/kernel/debug/dma_buf/bufinfo` when shared
>>> dma-bufs reference fences from GPU schedulers that no longer exist.
>>>
>>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_entity.c | 7 ++++++-
>>>    drivers/gpu/drm/scheduler/sched_fence.c  | 4 +++-
>>>    include/drm/gpu_scheduler.h              | 5 +++++
>>>    3 files changed, 14 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index b2bbc8a68b30..17f35b0b005a 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -389,7 +389,12 @@ static bool 
>>> drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>>>               /*
>>>             * Fence is from the same scheduler, only need to wait for
>>> -         * it to be scheduled
>>> +         * it to be scheduled.
>>> +         *
>>> +         * Note: s_fence->sched could have been freed and reallocated
>>> +         * as another scheduler. This false positive case is okay, 
>>> as if
>>> +         * the old scheduler was freed all of its jobs must have
>>> +         * signaled their completion fences.
>>
>> This is outright nonsense. As long as an entity for a scheduler exists
>> it is not allowed to free up this scheduler.
>>
>> So this function can't be called like this.
>
> As I already explained, the fences can outlive their scheduler. That 
> means *this* entity certainly exists for *this* scheduler, but the 
> *dependency* fence might have come from a past scheduler that was 
> already destroyed along with all of its entities, and its address reused.

Well this is function is not about fences, this function is a callback 
for the entity.

>
> Christian, I'm really getting tired of your tone. I don't appreciate 
> being told my comments are "outright nonsense" when you don't even 
> take the time to understand what the issue is and what I'm trying to 
> do/document. If you aren't interested in working with me, I'm just 
> going to give up on drm_sched, wait until Rust gets workqueue support, 
> and reimplement it in Rust. You can keep your broken fence lifetime 
> semantics and I'll do my own thing.

I'm certainly trying to help here, but you seem to have unrealistic 
expectations.

I perfectly understand what you are trying to do, but you don't seem to 
understand that this functionality here isn't made for your use case.

We can adjust the functionality to better match your requirements, but 
you can't say it is broken because it doesn't work when you use it not 
in the way it is intended to be used.

You can go ahead and try to re-implement the functionality in Rust, but 
then I would reject that pointing out that this should probably be an 
extension to the existing code.

Christian.

>
> ~~ Lina
>

