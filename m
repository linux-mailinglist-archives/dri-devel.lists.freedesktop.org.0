Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F054CB53631
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 16:48:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8783F10E388;
	Thu, 11 Sep 2025 14:48:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="HNenGeBU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8819A10E388
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 14:48:27 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cN0mR2sD2z9tVm;
 Thu, 11 Sep 2025 16:48:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1757602103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rvKHZYTAposH6bvPHvR8LAHmRFjXDMsuj/JRvWzYtYc=;
 b=HNenGeBUV+8reHKwcktBZK6xQpU960cV6EU0gzsd9aALYNOOto3DS55AoTXFp+rb288pit
 Xp4xuBnQ6haTu7Acc0FE7W0RmfYnx6vsMnPCESSxI+452DX8k+Ux/z5EWP4XxEWQ6TAx4U
 /UcDQDlfMRwMlYvCMKun5BGr+pdXc8EYxCTHyi0nrNOtzDxrHAxNvp3MG1SBanxsJqIokS
 V3GqEY3smmpxIr2yPeUFPQACZIvY4CR5W+ww9QD/AqYecc4NaglcPsw2ysS2yChDmNj50x
 4KzQxdhoYNYKyoMXnta9BNVKV9XPneByrO2XkJkZ5xxw7xFN+cN+P6xJmIgjnQ==
Message-ID: <979f8223-68b0-4a75-b410-fd86cfe6c372@mailbox.org>
Date: Thu, 11 Sep 2025 16:48:19 +0200
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
 <c6cbaa8d-cb90-45d5-b3b6-279196f958ce@mailbox.org>
 <3227b440-5dbf-433d-8658-f37f9561554a@amd.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <3227b440-5dbf-433d-8658-f37f9561554a@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: g8qgqzdim7qgfppq9qk4ijdh1518qo93
X-MBO-RS-ID: 12c791ed71481f193a9
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

On 11.09.25 16:31, Christian König wrote:
> On 11.09.25 14:49, Michel Dänzer wrote:
>>>>> What we are seeing here is on a low memory (4GiB) single node system with
>>>>> an APU, that it will have lots of latencies trying to allocate memory by
>>>>> doing direct reclaim trying to allocate order-10 pages, which will fail and
>>>>> down it goes until it gets to order-4 or order-3. With this change, we
>>>>> don't see those latencies anymore and memory pressure goes down as well.
>>>> That reminds me of the scenario I described in the 00862edba135 ("drm/ttm: Use GFP_TRANSHUGE_LIGHT for allocating huge pages") commit log, where taking a filesystem backup could cause Firefox to freeze for on the order of a minute.
>>>>
>>>> Something like that can't just be ignored as "not a problem" for a potential 30% performance gain.
>>>
>>> Well using 2MiB is actually a must have for certain HW features and we have quite a lot of people pushing to always using them.
>>
>> Latency can't just be ignored though. Interactive apps intermittently freezing because this code desperately tries to reclaim huge pages while the system is under memory pressure isn't acceptable.
> 
> Why should that not be acceptable?

Sounds like you didn't read / understand the scenario in the 00862edba135 commit log:

I was trying to use Firefox while restic was taking a filesystem backup, and it froze for up to a minute. After disabling direct reclaim, Firefox was perfectly usable without noticeable freezes in the same scenario.

Show me the user who finds it acceptable to wait for a minute for interactive apps to respond, just in case some GPU operations might be 30% faster.


> The purpose of the fallback is to allow displaying messages like "Your system is low on memory, please close some application!" instead of triggering the OOM killer directly.

That's not the issue here.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
