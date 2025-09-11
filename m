Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2314B532BA
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 14:50:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 350B210EB1A;
	Thu, 11 Sep 2025 12:50:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Q1DF5xKy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB2B10EB1A
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 12:50:07 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cMy7w3bRWz9v84;
 Thu, 11 Sep 2025 14:50:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1757595004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+9Snp41rLKjqF2xK8uFOl0RQKFM4uGB1FBzOpQJ/veo=;
 b=Q1DF5xKyU5Q9w17X57HOMZtXWtPhSv5+XmMmPOjGtONDdUVkIPhsiKTuJ6SURopky4h9n5
 80+2OQs/toBUPZCE7kkAoCr18UjseHc8dQeK4b3AezUykwXCBYe5HYuZwJBpYIN0RFRPuW
 Ff7lP4lVtrHs+3VZSTVFK5dTRlHQo+7o7VJKvC/3wwVEfQ98AXFTBdKFYlX1DpD4vfsfS1
 EIWZGwf0qOLCEKrk1Tg3yHKftILEC7YfrJpagJRMoPsewpi19+VlT3Xp/p3nhq3J5Un/9F
 WhYp7LX5M3jrh+2zMDbaj+hxxO9yzjsNw3ERoHG7fAgi+rHwqOFzrBrfTJaHZg==
Message-ID: <c6cbaa8d-cb90-45d5-b3b6-279196f958ce@mailbox.org>
Date: Thu, 11 Sep 2025 14:49:56 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm: ttm: do not direct reclaim when allocating high
 order pages
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20250910-ttm_pool_no_direct_reclaim-v1-1-53b0fa7f80fa@igalia.com>
 <e79a134b-89de-4da1-b64b-b890227fce8a@amd.com>
 <aMF0fe7CIVD-8zVo@quatroqueijos.cascardo.eti.br>
 <262a176a-4c80-40de-96e0-c97f50c20fe6@mailbox.org>
 <b7c57dc3-ed0e-402f-8a3c-f832357f8763@amd.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <b7c57dc3-ed0e-402f-8a3c-f832357f8763@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: quy865kfnqb8x4cemzdr1q8jsn1ccife
X-MBO-RS-ID: a70ec45a6ba174afdb4
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

On 11.09.25 11:07, Christian König wrote:
> On 11.09.25 10:26, Michel Dänzer wrote:
>> On 10.09.25 14:52, Thadeu Lima de Souza Cascardo wrote:
>>> On Wed, Sep 10, 2025 at 02:11:58PM +0200, Christian König wrote:
>>>> On 10.09.25 13:59, Thadeu Lima de Souza Cascardo wrote:
>>>>> When the TTM pool tries to allocate new pages, it stats with max order. If
>>>>> there are no pages ready in the system, the page allocator will start
>>>>> reclaim. If direct reclaim fails, the allocator will reduce the order until
>>>>> it gets all the pages it wants with whatever order the allocator succeeds
>>>>> to reclaim.
>>>>>
>>>>> However, while the allocator is reclaiming, lower order pages might be
>>>>> available, which would work just fine for the pool allocator. Doing direct
>>>>> reclaim just introduces latency in allocating memory.
>>>>>
>>>>> The system should still start reclaiming in the background with kswapd, but
>>>>> the pool allocator should try to allocate a lower order page instead of
>>>>> directly reclaiming.
>>>>>
>>>>> If not even a order-1 page is available, the TTM pool allocator will
>>>>> eventually get to start allocating order-0 pages, at which point it should
>>>>> and will directly reclaim.
>>>>
>>>> Yeah that was discussed before quite a bit but at least for AMD GPUs that is absolutely not something we should do.
>>>>
>>>> The performance difference between using high and low order pages can be up to 30%. So the added extra latency is just vital for good performance.
>>>>
>>>> We could of course make that depend on the HW you use if it isn't necessary for some other GPU, but at least both NVidia and Intel seem to have pretty much the same HW restrictions.
>>>>
>>>> NVidia has been working on extending this to even use 1GiB pages to reduce the TLB overhead even further.
>>>
>>> But if the system cannot reclaim or is working hard on reclaiming, it will
>>> not allocate that page and the pool allocator will resort to lower order
>>> pages anyway.
>>>
>>> In case the system has pages available, it will use them. I think there is
>>> a balance here and I find this one is reasonable. If the system is not
>>> under pressure, it will allocate those higher order pages, as expected.
>>>
>>> I can look into the behavior when the system might be fragmented, but I
>>> still believe that the pool is offering such a protection by keeping those
>>> higher order pages around. It is when the system is under memory presure
>>> that we need to resort to lower order pages.
>>>
>>> What we are seeing here is on a low memory (4GiB) single node system with
>>> an APU, that it will have lots of latencies trying to allocate memory by
>>> doing direct reclaim trying to allocate order-10 pages, which will fail and
>>> down it goes until it gets to order-4 or order-3. With this change, we
>>> don't see those latencies anymore and memory pressure goes down as well.
>> That reminds me of the scenario I described in the 00862edba135 ("drm/ttm: Use GFP_TRANSHUGE_LIGHT for allocating huge pages") commit log, where taking a filesystem backup could cause Firefox to freeze for on the order of a minute.
>>
>> Something like that can't just be ignored as "not a problem" for a potential 30% performance gain.
> 
> Well using 2MiB is actually a must have for certain HW features and we have quite a lot of people pushing to always using them.

Latency can't just be ignored though. Interactive apps intermittently freezing because this code desperately tries to reclaim huge pages while the system is under memory pressure isn't acceptable.


Maybe there could be some kind of mechanism which periodically scans BOs for sub-optimal page orders and tries migrating their storage to more optimal pages.


> So that TTM still falls back to lower order allocations is just a compromise to not trigger the OOM killer.
> 
> What we could do is to remove the fallback, but then Cascardos use case wouldn't be working any more at all.

Surely the issue is direct reclaim, not the fallback.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
