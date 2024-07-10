Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 571D692D345
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 15:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158B310E7D4;
	Wed, 10 Jul 2024 13:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="V3T9yeTb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B3E10E7CD
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 13:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HnTEAebRjmwJwIK8u1DwlpfGeniS8ONdDLsPMqVk5Ms=; b=V3T9yeTbb+h1phwbP3mLa/jS5u
 4ePkNw4ls4BwS5MG2imz/FKcZXHuCN8VcSwES5y5zkdSN89lpm0LxMuNGadHKVmd2bwYOFdozLQxo
 TXG8JAuZrehS1txX0oyuNGyaR6pt1VX3vuvgXKQu/jRx8FjkBkgk6KnfV3JU5ToRnFHslJKnLNlGA
 tdJD3QdOPKvi6P0Keo6DnofiAqjVgpYAJ3eBPAXC0G3i5eUp2I0p9tXKFjpAqwPNd35tDnNXqEexN
 SmGaXEODjyxfun5dKJMRWLg0pzZM6k3fmSLTvIvX3Z1Y9qH3uh1JmWrJazg+a9heFAtCjsKSu/SYT
 oib4nuOA==;
Received: from [84.69.19.168] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sRXdS-00DH8Y-FE; Wed, 10 Jul 2024 15:45:30 +0200
Message-ID: <b53944eb-3132-40e8-9ed3-3aab44bd3992@igalia.com>
Date: Wed, 10 Jul 2024 14:45:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] v3d: Perfmon cleanup
To: Iago Toral <itoral@igalia.com>, Tvrtko Ursulin <tursulin@igalia.com>,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, kernel-dev@igalia.com
References: <20240709163425.58276-1-tursulin@igalia.com>
 <d15dedd5ee4fcecac132a7558f29b555831cbb17.camel@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <d15dedd5ee4fcecac132a7558f29b555831cbb17.camel@igalia.com>
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


Hi Iago,

On 10/07/2024 07:06, Iago Toral wrote:
> El mar, 09-07-2024 a las 17:34 +0100, Tvrtko Ursulin escribió:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> When we had to quickly deal with a tree build issue via merging
>> 792d16b5375d ("drm/v3d: Move perfmon init completely into own unit"),
>> we
>> promised to follow up with a nicer solution.
>>
>> As in the process of eliminating the hardcoded defines we have
>> discovered a few
>> issues in handling of corner cases and userspace input validation,
>> the fix has
>> turned into a larger series, but hopefully the end result is a
>> justifiable
>> cleanup.
>>
> 
> Thanks for going the extra mile with this :)
> 
> Patches 1 and 5-8 are:
> Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

Thank you!

Unfortunately I had to re-order the patches in the series so fixes come 
first, and as that caused a lot of churn in each patch I did not apply 
your r-b's when re-sending.

Hmmm actually I should have for the first patch, that one is unchanged. 
I will fix that one.

Regards,

Tvrtko

>> Tvrtko Ursulin (12):
>>    drm/v3d: Prevent out of bounds access in performance query
>> extensions
>>    drm/v3d: Prefer get_user for scalar types
>>    drm/v3d: Add some local variables in queries/extensions
>>    drm/v3d: Align data types of internal and uapi counts
>>    drm/v3d: Fix potential memory leak in the timestamp extension
>>    drm/v3d: Fix potential memory leak in the performance extension
>>    drm/v3d: Validate passed in drm syncobj handles in the timestamp
>>      extension
>>    drm/v3d: Validate passed in drm syncobj handles in the performance
>>      extension
>>    drm/v3d: Move part of copying of reset/copy performance extension
>> to a
>>      helper
>>    drm/v3d: Size the kperfmon_ids array at runtime
>>    drm/v3d: Do not use intermediate storage when copying performance
>>      query results
>>    drm/v3d: Move perfmon init completely into own unit
>>
>>   drivers/gpu/drm/v3d/v3d_drv.c                 |   9 +-
>>   drivers/gpu/drm/v3d/v3d_drv.h                 |  16 +-
>>   drivers/gpu/drm/v3d/v3d_perfmon.c             |  44 +--
>>   .../gpu/drm/v3d/v3d_performance_counters.h    |  16 +-
>>   drivers/gpu/drm/v3d/v3d_sched.c               | 106 ++++---
>>   drivers/gpu/drm/v3d/v3d_submit.c              | 285 ++++++++++------
>> --
>>   6 files changed, 281 insertions(+), 195 deletions(-)
>>
> 
