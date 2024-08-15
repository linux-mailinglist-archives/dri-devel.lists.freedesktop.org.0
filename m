Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24989952AB2
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 10:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A2210E028;
	Thu, 15 Aug 2024 08:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="mUeEPhYj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8514910E028;
 Thu, 15 Aug 2024 08:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fS+Ia4UM+I2tTgaoG2DZUFNTzlzvvhStumNeJ1V63Bs=; b=mUeEPhYjPNq6RoCiZYR5s6KPxZ
 G57Sr1tXluPKPcjbj6JahpBS1lbsOfA5tSvJDXMAEHBwHux9jZluhslOWlrPI+sok4RYj7UgeRZ6o
 w90ozAfUNooP61Ao8bYrQqc4hm7T2m0YeV6mPjutZkQCHfHkspsNreE2M+Qxeh09Lg8Nciq0eUF3c
 wyln+YQXFbDm/UQI/f9g7UdThRdZgAdBk3ofQmdge68wkAiS/dwLbca1LUfIdpe3Eid4PWNre4nH3
 DjKNFFmhK7wakgvp5XOZBPK8hGvF3IDAQF+LMEsYqlGSVJdMyZaNt0bxsIo2x7UcCKZuBK1XvWRUD
 OVirrxgg==;
Received: from [84.69.19.168] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1seVzB-000UW2-Cs; Thu, 15 Aug 2024 10:37:32 +0200
Message-ID: <51bb99fd-4f50-41b0-836d-69606c50321c@igalia.com>
Date: Thu, 15 Aug 2024 09:37:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Documentation/gpu: Document the situation with
 unqualified drm-memory-
To: Rob Clark <robdclark@gmail.com>, Tvrtko Ursulin <tursulin@igalia.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, Alex Deucher <alexander.deucher@amd.com>,
 Rob Clark <robdclark@chromium.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20240813135712.82611-1-tursulin@igalia.com>
 <20240813135712.82611-2-tursulin@igalia.com>
 <CAF6AEGvbZDg4K642HJtNAhj2f8Sv9DvfU+en52gi42=ssPiNnQ@mail.gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <CAF6AEGvbZDg4K642HJtNAhj2f8Sv9DvfU+en52gi42=ssPiNnQ@mail.gmail.com>
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


On 13/08/2024 19:47, Rob Clark wrote:
> On Tue, Aug 13, 2024 at 6:57 AM Tvrtko Ursulin <tursulin@igalia.com> wrote:
>>
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> Currently it is not well defined what is drm-memory- compared to other
>> categories.
>>
>> In practice the only driver which emits these keys is amdgpu and in them
>> exposes the current resident buffer object memory (including shared).
>>
>> To prevent any confusion, document that drm-memory- is deprecated and an
>> alias for drm-resident-memory-.
>>
>> While at it also clarify that the reserved sub-string 'memory' refers to
>> the memory region component, and also clarify the intended semantics of
>> other memory categories.
>>
>> v2:
>>   * Also mark drm-memory- as deprecated.
>>   * Add some more text describing memory categories. (Alex)
>>
>> v3:
>>   * Semantics of the amdgpu drm-memory is actually as drm-resident.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Christian König <christian.keonig@amd.com>
>> Cc: Rob Clark <robdclark@chromium.org>
> 
> Reviewed-by: Rob Clark <robdclark@gmail.com>

Thanks!

So this one is stand alone and could be pushed to drm-misc-next.

2/2 can wait for AMD to give a verdict.

Regards,

Tvrtko

> 
>> ---
>>   Documentation/gpu/drm-usage-stats.rst | 25 ++++++++++++++++++++++---
>>   1 file changed, 22 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
>> index a80f95ca1b2f..ff964c707754 100644
>> --- a/Documentation/gpu/drm-usage-stats.rst
>> +++ b/Documentation/gpu/drm-usage-stats.rst
>> @@ -144,7 +144,9 @@ Memory
>>
>>   Each possible memory type which can be used to store buffer objects by the
>>   GPU in question shall be given a stable and unique name to be returned as the
>> -string here.  The name "memory" is reserved to refer to normal system memory.
>> +string here.
>> +
>> +The region name "memory" is reserved to refer to normal system memory.
>>
>>   Value shall reflect the amount of storage currently consumed by the buffer
>>   objects belong to this client, in the respective memory region.
>> @@ -152,6 +154,9 @@ objects belong to this client, in the respective memory region.
>>   Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
>>   indicating kibi- or mebi-bytes.
>>
>> +This key is deprecated and is an alias for drm-resident-<region>. Only one of
>> +the two should be present in the output.
>> +
>>   - drm-shared-<region>: <uint> [KiB|MiB]
>>
>>   The total size of buffers that are shared with another file (e.g., have more
>> @@ -159,20 +164,34 @@ than a single handle).
>>
>>   - drm-total-<region>: <uint> [KiB|MiB]
>>
>> -The total size of buffers that including shared and private memory.
>> +The total size of all created buffers including shared and private memory. The
>> +backing store for the buffers does not have to be currently instantiated to be
>> +counted under this category.
>>
>>   - drm-resident-<region>: <uint> [KiB|MiB]
>>
>> -The total size of buffers that are resident in the specified region.
>> +The total size of buffers that are resident (have their backing store present or
>> +instantiated) in the specified region.
>> +
>> +This is an alias for drm-memory-<region> and only one of the two should be
>> +present in the output.
>>
>>   - drm-purgeable-<region>: <uint> [KiB|MiB]
>>
>>   The total size of buffers that are purgeable.
>>
>> +For example drivers which implement a form of 'madvise' like functionality can
>> +here count buffers which have instantiated backing store, but have been marked
>> +with an equivalent of MADV_DONTNEED.
>> +
>>   - drm-active-<region>: <uint> [KiB|MiB]
>>
>>   The total size of buffers that are active on one or more engines.
>>
>> +One practical example of this can be presence of unsignaled fences in an GEM
>> +buffer reservation object. Therefore the active category is a subset of
>> +resident.
>> +
>>   Implementation Details
>>   ======================
>>
>> --
>> 2.44.0
>>
