Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D63CE939506
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 23:01:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A052F10E19B;
	Mon, 22 Jul 2024 21:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="m46XLCYz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F0310E19B;
 Mon, 22 Jul 2024 21:01:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7BABFCE0BAF;
 Mon, 22 Jul 2024 21:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDFC9C116B1;
 Mon, 22 Jul 2024 21:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721682080;
 bh=NI8ymRZG9MIZcjZLm0vLtyw9OIJl09V8sxhdYuvkmX0=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=m46XLCYzv/rEmFZN0f9j/3LmXum6eaxczRus3erHpJAsAyUYcTV22/mdSqbfGNLfH
 25PvVKieSrt9g50zmCrh7B8If6aEEbAs7/W8wH/K8WYZFeUQnosyKypbX5/h/eWCO/
 CAjiut/9UrOJhaHKFspkurwHX15qzsJJrWSEFiuk5xDEil/VKqygt22CpE6Deqk3Pt
 FGahHLhyYBxOPktoY+ihPIUfirWMAD/buN6sTzwlVW/otQB0SRTbWsospFHkVLJIby
 y3Ztqdj5/X+N4MOcq8QyVRj+Prt967M18NxS/vbnwZBmtZLIIJtbozi1Pmu/UMjed+
 Ocw86yA6E5UoQ==
Message-ID: <260f84d6-17dd-471a-a0c2-f21542da9ae2@kernel.org>
Date: Mon, 22 Jul 2024 23:01:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Nouveau fixes for TTM refcount rework
To: Ben Skeggs <bskeggs@nvidia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20240718165959.3983-1-dakr@kernel.org>
 <eeceb079-2397-447a-9217-64ba01e21b0f@nvidia.com>
Content-Language: en-US
Cc: dri-devel@lists.freedesktop.org,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
From: Danilo Krummrich <dakr@kernel.org>
In-Reply-To: <eeceb079-2397-447a-9217-64ba01e21b0f@nvidia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/18/24 7:53 AM, Ben Skeggs wrote:
> On 19/7/24 02:58, Danilo Krummrich wrote:
> 
>> Hi Christian,
>>
>> Those three patches should unblock your series to use GEM references instead of
>> TTM ones.
>>
>> @Lyude, Dave: Can you please double check?
> 
> Hi Danilo,
> 
> These look fine to me, and appear to resolve the issues I see with just the refcount series applied.
> 
> Ben.
> 
> 
> Reviewed-by: Ben Skeggs <bskeggs@nvidia.com>

Thanks for reviewing!

@Christian, I applied the series to drm-misc-next for you to go ahead and
cherry-picked the bug fix to drm-misc-fixes.

- Danilo

> 
>>
>> - Danilo
>>
>> Danilo Krummrich (3):
>>    drm/nouveau: prime: fix refcount underflow
>>    drm/nouveau: bo: remove unused functions
>>    drm/nouveau: use GEM references instead of TTMs
>>
>>   drivers/gpu/drm/nouveau/dispnv04/crtc.c | 43 +++++++++++++++------
>>   drivers/gpu/drm/nouveau/dispnv50/disp.c |  4 +-
>>   drivers/gpu/drm/nouveau/nouveau_bo.h    | 50 ++-----------------------
>>   drivers/gpu/drm/nouveau/nouveau_chan.c  |  2 +-
>>   drivers/gpu/drm/nouveau/nouveau_dmem.c  |  4 +-
>>   drivers/gpu/drm/nouveau/nouveau_prime.c |  3 +-
>>   drivers/gpu/drm/nouveau/nv10_fence.c    |  2 +-
>>   drivers/gpu/drm/nouveau/nv17_fence.c    |  2 +-
>>   drivers/gpu/drm/nouveau/nv50_fence.c    |  2 +-
>>   drivers/gpu/drm/nouveau/nv84_fence.c    |  4 +-
>>   10 files changed, 46 insertions(+), 70 deletions(-)
>>
>>
>> base-commit: 99e0fb8b087120b5a7019f1cff6c5c2b5b925ae5
