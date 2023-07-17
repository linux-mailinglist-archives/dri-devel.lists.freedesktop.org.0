Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95570756860
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 17:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98FE010E272;
	Mon, 17 Jul 2023 15:55:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F7C10E272
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 15:55:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YlkPIEnRPC+dG8hjwPX98u9BVmEXALKAXhyiDDMBwxyO6Hmu5mLjfFrqC/0Ndz/XuI97rCPKFVr642MaTUxkHpTh6xcsyK9GKBH4o7l4gLhtIBQAU+PYJw3ejPD8OevD32OkpoBblbF2unAlcRmfZ+wPZM78yInSMBAD6F/yp8jR6GRK7hshwI8Eu2Lfrtz0O49WoPEFh9K5gG5zlHpeWm8u6OvynrgoEvLc9wQKsSDFWwLQ5u5zC9INE+XQrIzjX+3Rnts1v5Zs/nxcfPodftwQnLtEDkkerC86iodv/Zm9aMphhNX3e7ipvFT/0K3oNqK5rAgc5KCr/i1sUdhW/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qsgMCit+eK5h2CgPZgwdQGiemPnSTWmd+AOLmXd6Q0E=;
 b=GP9iW/JTLWdv5eClmA3pMo5kEm/tPfUBhtzV18+09gstk72NxsHvESLLelIg+s81cY4O+AJRf4CK3mZWxBXAqisY1E7VBLOWAsPJ9me1AfvMpKpRhd5LXBF/a62eUlH8u3NIpcOyDns+6kYon9EnkIhuT65p21hrPDljBgwuyvcwK8O3OEtSX5sTqhHF1AlWWHkxy5SdXqbYJzMHIpWevYQjY74la5O7PqVEmuF7i90DUhKMV3ifIsOh1fgkNxFJ5B6N02XjK2U4BGYeFcA52GsjCR0vPynOgtpBoBDxYEbVqzPOxqxzlV6LVBDTMeIaSE78Z8FXY9FBsVfSEuLg8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qsgMCit+eK5h2CgPZgwdQGiemPnSTWmd+AOLmXd6Q0E=;
 b=D5xlgQ6JXtAlLJv5p4XXFIglIvoFGqU9LowwHTD6oJF7EJvH2VG1exkvdz5QWqOdaLuP9ZkrCWVmzVN3sPfARpssJVgZBguEi1pNHg+I8jobxbBXAMDf37x6zyosNGeMq0fjAALIMftIZSKPa4lQ6OZltQz7BlWdPoXe5o15/XU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by IA1PR12MB6411.namprd12.prod.outlook.com (2603:10b6:208:388::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 15:55:11 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::142:d8f:e6bb:695d]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::142:d8f:e6bb:695d%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 15:55:11 +0000
Message-ID: <a42bd218-6eb5-6ddb-bbb4-d25118c59f40@amd.com>
Date: Mon, 17 Jul 2023 17:55:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/3] drm/scheduler: Fix UAF in
 drm_sched_fence_get_timeline_name
Content-Language: en-US
To: alyssa@rosenzweig.io, Luben Tuikov <luben.tuikov@amd.com>,
 Asahi Lina <lina@asahilina.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
References: <9c0cff84-45b1-268f-bdad-38c16316dbc3@amd.com>
 <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
 <20230714-drm-sched-fixes-v1-2-c567249709f7@asahilina.net>
 <bef7ef62-3cd9-6ceb-5eb4-5ae0c0236778@amd.com>
 <de502b41-2864-db1e-16a0-8a5d5e0e4ad3@asahilina.net>
 <d9dc2fd5-d054-dbf3-72b7-fe9deaa46350@amd.com>
 <236422117088ca854a6717114de73d99b2b9ba2f@rosenzweig.io>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <236422117088ca854a6717114de73d99b2b9ba2f@rosenzweig.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0221.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::17) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3589:EE_|IA1PR12MB6411:EE_
X-MS-Office365-Filtering-Correlation-Id: d2a48391-58e8-42f5-1b50-08db86de33ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4LYbNKH/HtJMDJBc5eaQOUTpIJ3SRdm07VUlUjbiqyDzGvjLQHoOqyyILTusp3zZHnzOWubbIcMGB2nv4MuuSBgaY61bEiR1EGnNfSi6+2wYd7FspQXoqLN4h5ZcmUzr1tiwHEh6qF2Dqm60HWYUXYQ5S6lkWdoJnNUz7FVMVfmYprJvyeRPhZtazxm1mxHawyMrhpXN2s2FLZDnFy2jZEEF8TGbYSHKoowYtjQpWBznagqj97FC+3y/6aLGvO7uvbwPhEqpRTP1RR0jBOzMraTc7brQqp+vmmWkvckEmjSvb7dM5Bia0r0pVH0icOTUGiZeDVoCaGMMmLbDFXXqjt8x8DSGtuC+mS5G2LTonI8JwPwRXwIbf1h7It8z9vLPvYCwYXs0rep39dZZn5iIXqnZeWipjreX8rXBcEqjdG8Y7FlfA7QVFpliFnQ3f5s6M4Ps+yfXAlNzoqStCaEpLs+4z+vztX4uvgaradtk7Xef1xBaIM6FmeAEqVuvy5YC9TUt/zGEELAAAEr25WGfDv/QxVg3YBC98kn5rkwyxdE3Rf7ie8AeXMtVIq/qAQxHmbjXYk5FgeUrr/T6S8QA0QTS7cR/yaBAUYaaiEfo6YCqlDgR78BvIlqaqNrGMo8zLhZZQiIdYNwx6IPuVwRtfw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199021)(31686004)(6486002)(6666004)(478600001)(110136005)(83380400001)(2616005)(31696002)(86362001)(66574015)(2906002)(186003)(6506007)(53546011)(6512007)(38100700002)(66476007)(66946007)(66556008)(41300700001)(4326008)(316002)(7416002)(8676002)(5660300002)(36756003)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmFPVzA4K1dlRTJqTG8zY2VKTzk2dDNHY2s1VTRLQS9pQUFTazFQc0h3a2dO?=
 =?utf-8?B?K0pQaWIzOVFBYnF3eTlZVjcrOE1JZFZOcTBNQUY1bHlPRndGLy9tWFhuNm54?=
 =?utf-8?B?Q0ZWU2I2Z3VCSWFlNTdEY0lMQjZPRHFVTW1hUGVNaGFqclBKVUF0MjZCRW50?=
 =?utf-8?B?cUdiUGZkVmRobmRXdWlBK0hZNEJTTmROMVdyVmViR2lyMmo0Z2ZiZFV5UHFC?=
 =?utf-8?B?YTdHMnFtU0YvOGNqT3JMM29FNXZYZzhCUzBhNjB4NXRXekJ6Z3FKemc1emlO?=
 =?utf-8?B?TTZXUlRHbmR0V0w1Rm8zSmNvSEl5ZnhJcXhCektPb28yQW9EQy9oWVNtLzc4?=
 =?utf-8?B?TDdZM3RvZTVubXEyS1VpVkVTc0hyYkRESGtXNGlRVy9BOWpaejhaQkxISVhT?=
 =?utf-8?B?VlMvU2ltd0t5RGJrSXpkMlVxWitScG1pWUV0WGR5Q2srNndGM3h0WHFaaXB5?=
 =?utf-8?B?c3hvdjFuM1BiUm90bEIwUEFXY1cyTmV3aXdSUVBWb1JZNEI4b0RFYS9kbEpn?=
 =?utf-8?B?L0J3enN0TU9sZUdJdXZHYWhjbDN1aHVOTWdBN2d4S0lQdWd6NlI0anF0VDAr?=
 =?utf-8?B?WDc3SFl0aXpLTVFaeVAzaGs3TkVjNkxoQ3lSQ204b0prUzIyODVUV0ZhQ2JM?=
 =?utf-8?B?VWhnbThmcmEvV0ZvZHlVTVFrYkZnT2J2aWlmbGJ3bHh5VHlOZy90Yno2dnhh?=
 =?utf-8?B?OXI3dWdXN3FRRGNvS0RhMHRYNURmc1daS1ZEYWlGZjhoWGRwRUExZnd1NS9U?=
 =?utf-8?B?c29FMVRONHg1c21VSi8wUExVT0pkLzkveXZWQzJqQTJZMWlRNENUMzRQWExI?=
 =?utf-8?B?UklNSjVtdUJCRTFBR1hEaXYyT1F5NXAycUVmQ0dyOVJFcW9NMUhzZVBvWGxk?=
 =?utf-8?B?MGxITENOeWlkcUdvR1lXTW42NXVhNWxKbHVZK3N3RTVYeFlQbnNjb1R2UjlQ?=
 =?utf-8?B?OHdoYmtYbTNWc1Z1bWpIVmFUTVR3czVWbmdYai9MMDAxQnJJd0dRaTZqdzI0?=
 =?utf-8?B?aTd2ODkwc2syeDhMSUtGTnZRTzN5Y0ptQlI2RzNNdFppL1dyUHlnaWZDazgr?=
 =?utf-8?B?bjZJOFUxTjBuNHdBdlhvU21XVU8vVE5xVE8zMm1HRTdLSVlac1J1MjN6VG5l?=
 =?utf-8?B?aTZ3Z3RPV3lWZ1VJNG9sU052ZVlCblZJRkljMklvQXhZbElYTktPMzBzenBl?=
 =?utf-8?B?UEZpSllqRVd3cmw0cmpXcVU4U0Z3NnIwb1ZmWGVUb2pQZTV4bDBQeFljU1hh?=
 =?utf-8?B?ZmhZNm5ZU1pqckhNTFJTYndsT0ZKSEgvYkZUd01TNmJVUUp1T1hOckFJWVU4?=
 =?utf-8?B?RmhKODY2VTh3UUpUQUhEb0xtT2RqMXpodEVuSjdWSDlUeHI2dWtTUWlZcEhu?=
 =?utf-8?B?MmJBMG52MWgrcEw0WC9zTkVGZVh1NkxSSjJBck1ncDRoOTZSN3VwTUZUOEJS?=
 =?utf-8?B?bzRZODVvMlJYUFFmNXBXM25TeG96UVZvR2NUMzFuMUlTK3NFNFlaakEwRFhZ?=
 =?utf-8?B?Y3R6Q0xhMXZjUnpJVXlJN3AyUkF1emxlYXlPVzNLTG9jeHcydGlGVUttLzZs?=
 =?utf-8?B?QWVHYWVZWi9TMkFSQnFpMzh4ajkwc1Mwa2RFeHBwZ05kY0VxdUJ3d2ZETHFn?=
 =?utf-8?B?TzBjWENGR2wyWEVmZVcvd3dJRkE2ZFp3R1QwSlN4VDMwUEl1S0NnaTdFWlF4?=
 =?utf-8?B?cjJSbXV0RWJVQm56b2l4OW1ESEw5VzFJMS9yYVZPWS80aGZCSDY3Yk4xOXU0?=
 =?utf-8?B?ZlQrT3NQUjhLTzBaUWZBeWMwZG91SCtxcGZrV1VVQ2RaUE1NNll6MGpSL1hi?=
 =?utf-8?B?UkR3RFg0OTZTbWoyVm53cERaRU9XN0RlV1o5TjlJdDZlaGF5OUZ3V2ZGR0pq?=
 =?utf-8?B?NzNvQm12WXlqRGRDaWVaSTVFS2lsWFlLWmt1TjAvRGJ1RDYrZUpHdVNCemlz?=
 =?utf-8?B?eC80THlpaHVSdnIzQW5zelpBOGYyVnZvaFpzK1JhMjRLQUJ4Skc3SU9xQUFs?=
 =?utf-8?B?aUdQMEFUOXU4NHA4bHM4SmZBMzVsVDBtODR5M1d4VkZ0c0FsOWN6V3NxMUpy?=
 =?utf-8?B?ODhoN3kwMmpBeVpOZFZsQ2wyTXljcjYwWnNrazNhMUJTL3dic3BVdzRXeWJm?=
 =?utf-8?B?Y1FZRitKMlVBTEVqNDgvTjQrWXdlbm8zWEl1dXZEUHlRUHoxWWFsNEVpMGo1?=
 =?utf-8?Q?Y5E2D7GoTEo4h64wyA9H/08fBWk11Mh0hoimv6mJR+3i?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2a48391-58e8-42f5-1b50-08db86de33ce
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 15:55:11.5755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j0qvQT1RCsq7XGfkETZewjBxAPxu1oVRBoPENC1qSfkww7BrPDk7nC1nj1j0+vLR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6411
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
Cc: asahi@lists.linux.dev, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Faith Ekstrand <faith.ekstrand@collabora.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.07.23 um 16:14 schrieb alyssa@rosenzweig.io:
> 15 July 2023 at 00:03, "Luben Tuikov" <luben.tuikov@amd.com> wrote:
>> On 2023-07-14 05:57, Christian König wrote:
>>
>>> Am 14.07.23 um 11:49 schrieb Asahi Lina:
>>>
>>>> On 14/07/2023 17.43, Christian König wrote:
>>>>
>>>   Am 14.07.23 um 10:21 schrieb Asahi Lina:
>>>   A signaled scheduler fence can outlive its scheduler, since fences are
>>>   independencly reference counted. Therefore, we can't reference the
>>>   scheduler in the get_timeline_name() implementation.
>>>
>>>   Fixes oopses on `cat /sys/kernel/debug/dma_buf/bufinfo` when shared
>>>   dma-bufs reference fences from GPU schedulers that no longer exist.
>>>
>>>   Signed-off-by: Asahi Lina <lina@asahilina.net>
>>>   ---
>>>      drivers/gpu/drm/scheduler/sched_entity.c | 7 ++++++-
>>>      drivers/gpu/drm/scheduler/sched_fence.c  | 4 +++-
>>>      include/drm/gpu_scheduler.h              | 5 +++++
>>>      3 files changed, 14 insertions(+), 2 deletions(-)
>>>
>>>   diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>>>   b/drivers/gpu/drm/scheduler/sched_entity.c
>>>   index b2bbc8a68b30..17f35b0b005a 100644
>>>   --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>   +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>   @@ -389,7 +389,12 @@ static bool
>>>   drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>>>                 /*
>>>               * Fence is from the same scheduler, only need to wait for
>>>   -         * it to be scheduled
>>>   +         * it to be scheduled.
>>>   +         *
>>>   +         * Note: s_fence->sched could have been freed and reallocated
>>>   +         * as another scheduler. This false positive case is okay,
>>>   as if
>>>   +         * the old scheduler was freed all of its jobs must have
>>>   +         * signaled their completion fences.
>>>
>>>   This is outright nonsense. As long as an entity for a scheduler exists
>>>   it is not allowed to free up this scheduler.
>>>
>>>   So this function can't be called like this.
>>>
>>>> As I already explained, the fences can outlive their scheduler. That
>>>>   means *this* entity certainly exists for *this* scheduler, but the
>>>>   *dependency* fence might have come from a past scheduler that was
>>>>   already destroyed along with all of its entities, and its address reused.
>>>>
>>>   
>>>   Well this is function is not about fences, this function is a callback
>>>   for the entity.
>>>   
>>>
>>>> Christian, I'm really getting tired of your tone. I don't appreciate
>>>>   being told my comments are "outright nonsense" when you don't even
>>>>   take the time to understand what the issue is and what I'm trying to
>>>>   do/document. If you aren't interested in working with me, I'm just
>>>>   going to give up on drm_sched, wait until Rust gets workqueue support,
>>>>   and reimplement it in Rust. You can keep your broken fence lifetime
>>>>   semantics and I'll do my own thing.
>>>>
>>>   
>>>   I'm certainly trying to help here, but you seem to have unrealistic
>>>   expectations.
>>>   
>>>   I perfectly understand what you are trying to do, but you don't seem to
>>>   understand that this functionality here isn't made for your use case.
>>>   
>>>   We can adjust the functionality to better match your requirements, but
>>>   you can't say it is broken because it doesn't work when you use it not
>>>   in the way it is intended to be used.
>>>
>> I believe "adjusting" functionality to fit some external requirements,
>> may have unintended consequences, requiring yet more and more "adjustments".
>> (Or may allow (new) drivers to do wild things which may lead to wild results. :-) )
>>
>> We need to be extra careful and wary of this.
> Either drm/scheduler is common code that we should use for our driver, in which case we need to "adjust" it to fit the requirements of a safe Rust abstraction usable for AGX.

Well this is the fundamental disagreement we have. As far as I can see 
you don't need to adjust anything in the common drm/scheduler code.

That code works with quite a bunch of different drivers, including the 
Intel XE which has similar requirements to your work here.

We can talk about gradually improving the common code, but as Luben 
already wrote as well this needs to be done very carefully.

>   Or, drm/scheduler is not common code intended for drivers with our requirements, and then we need to be able to write our own scheduler.
>
> AMD has NAK'd both options, effectively NAK'ing the driver.
>
> I will ask a simple yes/no question: Should we use drm/sched?

Well, yes.

>
> If yes, it will need patches like these,

No, you don't.

First of all you need to try to adjust your driver to match the 
requirements of drm/scheduler and *not* the other way around.

>   and AMD needs to be ok with that and stop NAK'ing them on sight becuase they don't match the existing requirements.
>
> If no, we will write our own scheduler in Rust, and AMD needs to be ok with that and not NAK it on sight because it's not drm/sched.
>
> Which is it?
>
> Note if we write a Rust scheduler, drm/sched and amdgpu will be unaffected. If we do that and AMD comes back and NAKs it -- as said in this thread would "probably" happen -- then it is impossible for us to upstream a driver regardless of whether we use drm/sched.
>
> Lina has been polite and accommodating while AMD calls her code "outright nonsense" and gets "outright NAK"s, and puts her into an impossible catch-22 where no matter what she does it's NAK'd.

Well as far as I can see I'm totally polite as well.

Pointing out that approaches doesn't seem to make sense and NAKing 
patches is a perfectly normal part of the review process.

What you need to to is to take a step back and ask yourself why this 
here is facing so much rejection from our side. I have to admit that I 
don't seem to be good at explaining that, cause we are obviously talking 
past each other, but you don't seem to try hard to understand what I'm 
pointing out either.

> That's not ok.

As far as I can see it is.

As maintainer of a commonly used component my first duty is to preserve 
the status quo and prevent modifications which are not well thought 
through. And to be honest those changes here strongly looks like Lina is 
just adjusting the code to match her requirements without looking left 
and right first.

Regards,
Christian.
