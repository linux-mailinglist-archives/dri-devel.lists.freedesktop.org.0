Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C46365311BA
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 17:53:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD7810E165;
	Mon, 23 May 2022 15:53:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 575E810E0A6;
 Mon, 23 May 2022 15:53:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id E6C261F43999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653321209;
 bh=NzwdUWK14vQgJs3bT2nJXsIJw7vgrnGZ5jOEJKZH3V4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cSl8zy7n2eDm5whb81GyXjTw7qC/3a3Br6GIQSyiBLYqyJvRF7d9eOKpwJFYeviUw
 ADqBnvYJfBhejzlUu6LRy35efOpT6TOvV//6Kzju3OJ76GfFmya5ddyCUWO18LwbZE
 i26QQtWLmg5xFPnYdIE0o6WQegUvow1wpB/6cZo5Z06PRvC6StAfEycFD4EslPE2gF
 OU65WIwuNEzCmm6XtePpiKgTQMD2nbhj9956j/DwvREc69MSdNqmH7zf5l/XKYXlXM
 m3xvxnJ2wLtlnchWBF2OUHCpOTOeT+rpwbR29wp6BKOqnpOj/Ip2U9vU96iMBTT8of
 4ow03fBArPfKg==
Message-ID: <f42a3dc9-2a6f-2467-b2ff-b6487669ae48@collabora.com>
Date: Mon, 23 May 2022 16:53:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 3/4] drm/i915: allow volatile buffers to use ttm pool
 allocator
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20220503191316.1145124-1-bob.beckett@collabora.com>
 <20220503191316.1145124-4-bob.beckett@collabora.com>
 <3ce81c514959e43f5afd7e74489dd5b89b1cd633.camel@linux.intel.com>
From: Robert Beckett <bob.beckett@collabora.com>
In-Reply-To: <3ce81c514959e43f5afd7e74489dd5b89b1cd633.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Matthew Auld <matthew.auld@intel.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/05/2022 13:42, Thomas Hellström wrote:
> Hi, Bob,
> 
> On Tue, 2022-05-03 at 19:13 +0000, Robert Beckett wrote:
>> internal buffers should be shmem backed.
>> if a volatile buffer is requested, allow ttm to use the pool
>> allocator
>> to provide volatile pages as backing
>>
>> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> index 4c25d9b2f138..fdb3a1c18cb6 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> @@ -309,7 +309,8 @@ static struct ttm_tt *i915_ttm_tt_create(struct
>> ttm_buffer_object *bo,
>>                  page_flags |= TTM_TT_FLAG_ZERO_ALLOC;
>>   
>>          caching = i915_ttm_select_tt_caching(obj);
>> -       if (i915_gem_object_is_shrinkable(obj) && caching ==
>> ttm_cached) {
>> +       if (i915_gem_object_is_shrinkable(obj) && caching ==
>> ttm_cached &&
>> +           !i915_gem_object_is_volatile(obj)) {
>>                  page_flags |= TTM_TT_FLAG_EXTERNAL |
>>                                TTM_TT_FLAG_EXTERNAL_MAPPABLE;
>>                  i915_tt->is_shmem = true;
> 
> While this is ok, I think it also needs adjustment in the i915_ttm
> shrink callback. If someone creates a volatile smem object which then
> hits the shrinker, I think we might hit asserts that it's a is_shem
> ttm?
> 
> In this case, the shrink callback should just i915_ttm_purge().

agreed. nice catch.
I'll fix for v2

looks like we could maybe do with some extra shrinker testing too? looks 
like nothing caught this during CI testing

> 
> /Thomas
> 
> 
