Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABD1512CEB
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 09:32:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76DE10E3F0;
	Thu, 28 Apr 2022 07:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A7210E3F0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 07:32:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C0hs8zPcEb6PtsS9cv50Djn55OhC7UYWzPFNAZ5y3owBQZ5Vdrn4CwKA+hDgDAqeMfIkvryI+NdduLCf+5yqHCjwW8QIrtruidXEKBu4hl7+0PlZZHU2x1kTj6IT+iodbP193LsW7M13H1GDEDQblbh3M2MK6XUTt4If4GFNJGoACep+M2Vjnv45YTLi394WDJm+QGCwspMw05aGMbGiG5ILz9pMKoB8aVfazhJsGY8aEOx4YqpGp6AE4LodPtxV9F6azkA/4vgX33lnlydTgJhGxI2IlfXNOF16akIy/+xxnv8IcuQCR+zkmMoHSqMJdlxnZJmEBNeE+PNLX/hB4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PPlZKM9HRIzfRZB5Xn+IGOE1rY0Hmj769tLvdcYMrhU=;
 b=adrQM7dymHTNCOfC+4VwNf72Hqyo6iM4wNtoCCiGMboY5n2R/AJRtVafJSB6ZmXymJH7ZlAq/0f9soVQOO/h+iKS1a2VoG3Ja0Xe8JAuKU6Qif8J5j7xPUoY6oWIwoZK5vju5dvEkFPt5I65r9J7FVtWvfQTJ0tftsnHj7ooKWFLA6m4bxWPUswfZ7Wd9nForlElZ4r+AhSq0RslsLGggZK9LacOHNIZrui3gvz8MCyg+pJlolSFi9W/JFV+ycB34wJ8ZLziAkGwW3V12uvMISVuZrIVwPYvu5RFGw3hHpXL6mF7KeoR5cIJOYLIiiSpPZ8FFY4IYJWl2h9J+oUKXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPlZKM9HRIzfRZB5Xn+IGOE1rY0Hmj769tLvdcYMrhU=;
 b=BqexeCjHJ48LI4TDYIQy/ZS2t3I17QChiWGdgl2gq2dm4+k3mHP7CPQCXsHA3OC+77kwCCHYSM8731/nnJcSWDAIBpDEtcRIGSWCuXgY0+UGWHMhnxHDOprlXWcpKetuP2m/VA1KsVTXn0tV30++tfhymiV+JUvdtGpj/iD5MAk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ1PR12MB6242.namprd12.prod.outlook.com (2603:10b6:a03:457::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Thu, 28 Apr
 2022 07:32:30 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5186.021; Thu, 28 Apr 2022
 07:32:30 +0000
Message-ID: <69a2da78-0325-c412-6b37-03d4242e5a5e@amd.com>
Date: Thu, 28 Apr 2022 09:32:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm: handle kernel fences in
 drm_gem_plane_helper_prepare_fb
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org
References: <20220421191002.2251-1-christian.koenig@amd.com>
 <877dc0d9-c6c6-022c-20d8-14b33e863934@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <877dc0d9-c6c6-022c-20d8-14b33e863934@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0193.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8815c04-6732-4edb-9582-08da28e9408f
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6242:EE_
X-Microsoft-Antispam-PRVS: <SJ1PR12MB6242557786B283A552FC749583FD9@SJ1PR12MB6242.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SDmNBjh6CSdXhdhzw/2tAZPZp8KdPuBmgGB0MhmWJl4BPk8kfUkM7UouKkAqKLf9N3bFhJzHADeauf1sRQcs4PnWr6kSXJ+WQTEsNIgn0SvCceUaJe6BQpXE6jcuIB75Lvopesz4B0L/EPbCg8oOk6+tUuKfstsLWUk2ugUfpUsho7u3J/PxiZxpP+4JgLqX8GXrDImm9HQKDlszAjBF9/uxvQY0edDnS8bP9sGj/THdHsn7/dXyohMH1MQzD/EEc2Ek0ZTRgmqYGuMcOp6E+RmHB1ZIN/hANP+6qiisPonDw5ASzqP9/LrpBBEfZp14eJqiOXC6W2BYWtxLT4qO+eKBCVjcOEmfUUEVhValiSyVxNV13LwXJtEHDNw2mRU/pK+bKe7aZ7WTosnVGsesAp86kfgkeTMn2vzknnkgyc3gvLs7yNxhQKEGR6zntxfhGqKitVNqocYID1IJfNYc/o95yT5jgspa67VPrNAsDpIcq5OT8iPHiQd3PFppFroHqHVGKn2EqMi6yobODHf1XuSk099EMNspigk+hl0o3Xpg8Xdv91O42EAxn8Q1k7kZqx9f1jyE4sMqzRxtEJH9UFPw1AnLJi7soohPFd6oPmyvBj3oO7JqJSwuzYh/ycwuM3G6lhkvA0PlhV5vyXNWHWRUgpRkpNR4m990LbkLEPgX1UqM3XeSBGQODybVsZwvc/mFLYYoGcu9AZXAjG10s5JMRn0lj4W7Cvtld3nqF45qG2ogA3nIU19gf09PtL2k+jVTEl8xiJPlYChB1jHefsGH9oh9+Ogom3mWl5174Cn9p8aBbArNPwFhLNb8FkyaxpPdyiHl0WdOn3S3bIO9hw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(8936002)(316002)(2616005)(186003)(6486002)(966005)(6506007)(31696002)(5660300002)(83380400001)(38100700002)(110136005)(6512007)(31686004)(26005)(2906002)(6666004)(36756003)(66476007)(86362001)(8676002)(66946007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjVZbkJDTGJwdWVCbWdqZi91aEVRT3VYVjNGVGs0THhOUVBkNHBJTFFJZjZ0?=
 =?utf-8?B?RzU4bHRsbUIvWngxbWVrVjZRZ2ZQTVNzeG1pQWNWbDhkOU9GQjAzR2l1Y2d1?=
 =?utf-8?B?bllrb0RFR2tUNVJFQXNZbEVwMFNXRWNJVnh1ak9QTWU4Lzluak8xc1AyYnQ0?=
 =?utf-8?B?YnR5bmxZTFlmL3hhQmpmTTBIbkJKS25NQ2xkbVphNnpGMWJka0dsRXpTNzBh?=
 =?utf-8?B?U1JXYS9WTkYvUTRsSlFxZklqYmtweUZVZ1RYb3hZbHNWRmxkZVdxdVJqcUFI?=
 =?utf-8?B?SDE0Q0owUEJMZFpnOHRBZFl4SjZlemNtR01hVVZHdEFPWU50SU1QRmt6eGZx?=
 =?utf-8?B?WFJQaUhLM0w1NWFwUnRBaGVNdEZpV1pwcUR6NnhBU2FjQUFrU3hiazk1QXFD?=
 =?utf-8?B?aUJQN3gwUjRLbVlvWnUvQXBTWGw2T1R6MlY5OWxONVpjWldqb3d2dDAySjdr?=
 =?utf-8?B?SFk5SUdsczJxOTRIZW9WOVBaWi9aem1PTFVSTzgzTDYyTTlIRDMxeXdqSzBs?=
 =?utf-8?B?S3JjQjJKV0NFaGQ2a3dYalZieVdSVTBPUUVzZWxlYXBiVzJya005cTY3S3NX?=
 =?utf-8?B?NFcrZjJKTWdqUDdBVGd2amJGNW5oWXNNZUp0T0R3dXVpS2R0d3NOK0lnTzlw?=
 =?utf-8?B?Z1IwMWVURngvb0dzU1F1VklDMzhXSS9iU2VteU9iUlRGVUcxSFRxNzhGTVZx?=
 =?utf-8?B?bGVTTUI3REVaY1ZaaGQ1SnRMRVI5L1I0dDNvY1p3QzAzZW1OTWszQVJKZ0pV?=
 =?utf-8?B?Rzd1TnJZWTZJeENBT0J0WUMwOHZaN1c4aVF4MlJLd2dxS3pBelFRRENDVGJj?=
 =?utf-8?B?c3ZvY1pPNkpyQmZXdnhJTXlxRFM1dDl2TkV2MlVLcWtqVStyMUtRV3dhZGpK?=
 =?utf-8?B?Zk9HK2IrSXdhVzlFNWhZVkpvcWlnNFVTd0NYQTg2R0ZlY0tFRG0vMVNJVFJN?=
 =?utf-8?B?NTd5MEhIMVBOdDJ1NzZCb1dCYU9XK0pBZm4zYVRaL09EUUZ4dVVXZ0NDYlVa?=
 =?utf-8?B?N0pNWjBjUXQrbmIxUjhETkN1eU9HczBjOUhheWwrOTBFK1p1WnBJQ0pKYllF?=
 =?utf-8?B?U2VCUFl4WElBVHovQTU3UFBzMHAycEEvSzBqd3kxNEp0OFV4aW54K2FFTFpM?=
 =?utf-8?B?N0ltSnRxWVh5TVRvVy9QdDlERTNmd0tFTHZZNTV1TlZmTXlUZ085VlJYU25H?=
 =?utf-8?B?MEY4cjFqYkU2WEN4ZmlLY3RqODZBbGpQV3pSN0JWT1pWOUtFVEJCcDNwdEdh?=
 =?utf-8?B?akVLK3E1RnZCRkU4U0R4Z2sxT2RlREgxVGZ3K2I1WmovVk1zNGhTYnEzcndl?=
 =?utf-8?B?aTlTN0xwWnFZNnhVazhGMjhZc2NZQ0NJTDR3ZHlhY0Q0MEJxOUlqOUREb2lk?=
 =?utf-8?B?K2RrZWVyVWhSRzM2LzBGT2pTMjBVWDE3YjJseU45ZHd3UTV6bUlBUnpob2hY?=
 =?utf-8?B?WUpUQTZGLzhFVHVXUUlWQytRSmlRWjR3OWdSR3prYnNqWWc0ZGpUYVYyVnhM?=
 =?utf-8?B?c1pua2J6U0pYMXB2b2trelFJdGdDSmo0UnlydE96bkljR1JucWtBUzNJMlBq?=
 =?utf-8?B?UXJUQkVtQVlQVUFLelhER2h2N0JiY1RHanY1RE0zRkZSM2FWUHBTc3dRL3Nj?=
 =?utf-8?B?NVdBdUtDdnFjUzZ5a1gyS1Evd2NxLzZReEhzNEl2cVRacEdBNFBaUkYza09r?=
 =?utf-8?B?bjZ3ZnYrbE5zdjhPWVBLbThGVEo4OTVQbjh6TnRlSjRBNDE0UmNhVzN0a3Fk?=
 =?utf-8?B?SXgxN3lSdlIvN2FWVzV4SGR2RzdpcXVBYVZyK2hOSThDdHM5OUdhMXZGWWdT?=
 =?utf-8?B?Rjd5T1ZMQllnM2o5Q2hRbkNsNGhQV2Q4bFRiZzhaVW0wN2VTeVh5TS9pV3Bh?=
 =?utf-8?B?TVlHUGJnNE5YWHVSQmFjbXJ2LzlnL0ZiR0ZEYlJnYUorRVBKbTdMNHcvZFJY?=
 =?utf-8?B?eDl4QU1SZzJjc3h6aFhRWitlWVRQOENJR1ZtNU9LbzNNUGJ0T3ZpNkkrZFl0?=
 =?utf-8?B?d3d0TkNBNlpuOWszK3FGSzBoUzlrNm9PUHhnOTBrQmw3c2x3TVNIa1ZKaUVP?=
 =?utf-8?B?TFhuZkx0akRZZ1VNVWx5K1luVHhiZFRkQmNCZDlHeWNNRnhjVDllNUpWRmlr?=
 =?utf-8?B?NmhhTVFwVUVaNDBYZjhaNnVoTEk4MUF1UjU2NGxDQmxQZHFlMU5EQ2U5MzJ4?=
 =?utf-8?B?Mk5ySUJFOG5GRkU2VXJmd3BDMUxzQjViODdjMllOQk5ib0t4RkRKc2JoWmJZ?=
 =?utf-8?B?alR6ajFRT244OTdCcUlsNGdCWkhqTEYybnpHMXJLWFBzb3d1ZzEvSnlTdXUy?=
 =?utf-8?B?QzkxWDQzVjZ1TEtJd0NhOU9FdzBvc3dRYWFRNGNrc3ZVZngrVnR2Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8815c04-6732-4edb-9582-08da28e9408f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 07:32:30.3864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6eNw4doDoI5t/OTu+1fhm7mdsUEG7bh7Pcc70yvRWqNuPGbPSHMqGWVZSwEeQJaJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6242
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

Am 28.04.22 um 09:23 schrieb Thomas Zimmermann:
> [SNIP]
>> diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c 
>> b/drivers/gpu/drm/drm_gem_atomic_helper.c
>> index a6d89aed0bda..8fc0b42acdff 100644
>> --- a/drivers/gpu/drm/drm_gem_atomic_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
>> @@ -1,6 +1,7 @@
>>   // SPDX-License-Identifier: GPL-2.0-or-later
>>     #include <linux/dma-resv.h>
>> +#include <linux/dma-fence-chain.h>
>>     #include <drm/drm_atomic_state_helper.h>
>>   #include <drm/drm_atomic_uapi.h>
>> @@ -141,25 +142,67 @@
>>    * See drm_atomic_set_fence_for_plane() for a discussion of 
>> implicit and
>
> This comment still refers to the function you just deleted. Maybe the 
> deleted docs could be integrated here somehow, if still relevant?

Yeah, Daniel point that out as well.

>
>>    * explicit fencing in atomic modeset updates.
>>    */
>> -int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct 
>> drm_plane_state *state)
>> +int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane,
>> +                    struct drm_plane_state *state)
>
> We have a 100-character limit. Please leave this on the same line.

Despite some efforts to change this that is still documented as 
80-character limit: 
https://www.kernel.org/doc/html/v5.18-rc4/process/coding-style.html#breaking-long-lines-and-strings

>
>>   {
>> +    struct dma_fence *fence = dma_fence_get(state->fence);
>>       struct drm_gem_object *obj;
>
> I'd declare this variable within the for loop.
>
>> -    struct dma_fence *fence;
>> +    enum dma_resv_usage usage;
>> +    size_t i;
>>       int ret;
>>         if (!state->fb)
>>           return 0;
>>   -    obj = drm_gem_fb_get_obj(state->fb, 0);
>> -    ret = dma_resv_get_singleton(obj->resv, DMA_RESV_USAGE_WRITE, 
>> &fence);
>> -    if (ret)
>> -        return ret;
>> -
>> -    /* TODO: drm_atomic_set_fence_for_plane() should be changed to 
>> be able
>> -     * to handle more fences in general for multiple BOs per fb.
>> +    /*
>> +     * Only add the kernel fences here if there is already a fence 
>> set via
>> +     * explicit fencing interfaces on the atomic ioctl.
>> +     *
>> +     * This way explicit fencing can be used to overrule implicit 
>> fencing,
>> +     * which is important to make explicit fencing use-cases work: One
>> +     * example is using one buffer for 2 screens with different refresh
>> +     * rates. Implicit fencing will clamp rendering to the refresh 
>> rate of
>> +     * the slower screen, whereas explicit fence allows 2 independent
>> +     * render and display loops on a single buffer. If a driver allows
>> +     * obeys both implicit and explicit fences for plane updates, 
>> then it
>> +     * will break all the benefits of explicit fencing.
>>        */
>> -    drm_atomic_set_fence_for_plane(state, fence);
>> +    usage = fence ? DMA_RESV_USAGE_KERNEL : DMA_RESV_USAGE_WRITE;
>> +
>> +    for (i = 0; i < ARRAY_SIZE(state->fb->obj); ++i) {
>
> Instead of ARRAY_SIZE, rather use state->fb->format->num_planes. It's 
> the number of planes (i.e., GEM objects) in the framebuffer.
>
>> +        struct dma_fence *new;
>> +
>> +        obj = drm_gem_fb_get_obj(state->fb, i);
>> +        if (!obj)
>
> With the use of num_planes in the for loop, there should probably be a 
> drm_WARN_ON_ONCE() around this test.
>
>> +            continue;
>
> goto error handling.
>
> Or is there a use case for framebuffers with empty planes? At least 
> it's not possible to instantiate one via drm_gem_fb_init_with_funcs().
>

I was asking myself the same thing, but found this handling be used at 
other places as well.

Thanks for taking a look,
Christian.
