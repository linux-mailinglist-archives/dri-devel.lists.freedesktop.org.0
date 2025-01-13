Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72532A0BAA7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 15:56:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A9D10E6C9;
	Mon, 13 Jan 2025 14:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iz9WZarH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF9A10E6C9;
 Mon, 13 Jan 2025 14:56:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C02085C5439;
 Mon, 13 Jan 2025 14:55:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A25DAC4CED6;
 Mon, 13 Jan 2025 14:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736780199;
 bh=WQwU4HWk7Y8b0EsHJA0kt+CkA2ILWJfO1qw9MW86I9w=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=iz9WZarHHO99P8oVBf8AAJ38E68CUbLb5k16F9CpyDx813fP3SkJKMMJ+YUjiAcO9
 Cj3kg3cK1Po55oRDO9o3VxCM7AONMWvsXub9fmP92/XVCugih6BBwflFpIw3iYEAN7
 e4b+c7Hr3Pv3BLqmNXNVGdQxjbRraBD/TPvr0SIiSg3WNhKBqHhzHLnfK8YrdbOQl9
 e1xsYyP/8hdAvbekzzUDqiFiYAG+Y54SpKlSjMSgJ5Q2UVpT9hSgX5DOjBZr0SkAOp
 NeMpMdLNJUYoVcm3qqUP927sXW1cztdU40qR4DZsKfD29rMbhXxl1qmhxw2hO5fjxV
 hgWaomjXsXvFA==
Message-ID: <460ab763-12ed-4842-9811-9e9da64ac6ec@kernel.org>
Date: Mon, 13 Jan 2025 15:56:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nouveau/fence: handle cross device fences properly. (v3)
Content-Language: en-US
From: Danilo Krummrich <dakr@kernel.org>
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20250109005553.623947-1-airlied@gmail.com>
 <Z4AATjxamye7yq4E@cassiopeiae>
In-Reply-To: <Z4AATjxamye7yq4E@cassiopeiae>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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


On 09.01.2025 17:58, Danilo Krummrich wrote:
> On Thu, Jan 09, 2025 at 10:55:53AM +1000, Dave Airlie wrote:
>> From: Dave Airlie <airlied@redhat.com>
>>
>> This is the 3rd iteration of this after talking to Ben and
>> Danilo, I think this makes sense now.
>>
>> The fence sync logic doesn't handle a fence sync across devices
>> as it tries to write to a channel offset from one device into
>> the fence bo from a different device, which won't work so well.
>>
>> This patch fixes that to avoid using the sync path in the case
>> where the fences come from different nouveau drm devices.
>>
>> This works fine on a single device as the fence bo is shared
>> across the devices, and mapped into each channels vma space,
>> the channel offsets are therefore okay to pass between sides,
>> so one channel can sync on the seqnos from the other by using
>> the offset into it's vma.
> 
> Huh, they indeed all share and map drm->fence->bo, good catch.
> 
>>
>> Signed-off-by: Dave Airlie <airlied@redhat.com>
>> Cc: stable@vger.kernel.org
>> ---
>>  drivers/gpu/drm/nouveau/nouveau_fence.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
>> index ee5e9d40c166..a3eb1f447a29 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
>> @@ -367,11 +367,13 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan,
>>  			if (f) {
>>  				struct nouveau_channel *prev;
>>  				bool must_wait = true;
>> +				bool local;
>>  
>>  				rcu_read_lock();
>>  				prev = rcu_dereference(f->channel);
>> -				if (prev && (prev == chan ||
>> -					     fctx->sync(f, prev, chan) == 0))
>> +				local = prev && prev->drm == chan->drm;
> 
> struct nouveau_channel has no pointer to a struct nouveau_drm, this should be
> prev->cli->drm and chan->cli->drm instead.
> 
> No need to resend, I can fix it when applying the patch if you want.

Applied to drm-misc-fixes.

> 
>> +				if (local && (prev == chan ||
>> +					      fctx->sync(f, prev, chan) == 0))
>>  					must_wait = false;
>>  				rcu_read_unlock();
>>  				if (!must_wait)
>> -- 
>> 2.43.0
>>

