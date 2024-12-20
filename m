Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DE09F90F9
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 12:12:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C29010EF86;
	Fri, 20 Dec 2024 11:12:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6312910EF86
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 11:12:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F0FA1480;
 Fri, 20 Dec 2024 03:13:01 -0800 (PST)
Received: from [10.1.31.19] (e122027.cambridge.arm.com [10.1.31.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A58673F58B;
 Fri, 20 Dec 2024 03:12:30 -0800 (PST)
Message-ID: <42ec58fd-d570-43a0-b440-cd0983e6d1e9@arm.com>
Date: Fri, 20 Dec 2024 11:12:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] drm/panthor: Expose size of driver internal BO's
 over fdinfo
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241218181844.886043-1-adrian.larumbe@collabora.com>
 <20241218181844.886043-2-adrian.larumbe@collabora.com>
 <awusmheh5i3qnhgyubf2gxmam6oio7xleb2wbnnsylhbhzfqtt@b4q66zp7i2ci>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <awusmheh5i3qnhgyubf2gxmam6oio7xleb2wbnnsylhbhzfqtt@b4q66zp7i2ci>
Content-Type: text/plain; charset=UTF-8
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

On 18/12/2024 19:14, Adrián Larumbe wrote:
> On 19.12.2024 02:18, Adrián Martínez Larumbe wrote:
>> From: Adrián Larumbe <adrian.larumbe@collabora.com>
>>
>> This will display the sizes of kenrel BO's bound to an open file, which are
>> otherwise not exposed to UM through a handle.
>>
>> The sizes recorded are as follows:
>>  - Per group: suspend buffer, protm-suspend buffer, syncobjcs
>>  - Per queue: ringbuffer, profiling slots, firmware interface
>>  - For all heaps in all heap pools across all VM's bound to an open file,
>>  record size of all heap chuks, and for each pool the gpu_context BO too.
>>
>> This does not record the size of FW regions, as these aren't bound to a
>> specific open file and remain active through the whole life of the driver.
>>
>> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
>> ---

[...]

>> +size_t panthor_heap_pool_size(struct panthor_heap_pool *pool)
>> +{
>> +	struct panthor_heap *heap;
>> +	unsigned long i;
>> +	size_t size = 0;
>> +
>> +	down_read(&pool->lock);
>> +	xa_for_each(&pool->xa, i, heap)
>> +		size += heap->chunk_size * heap->chunk_count;
>> +	up_write(&pool->lock);
> 
> Oh well, just realised I forgot to change this to up_read() so will do in a final revision.

With that fixed, feel free to add:

Reviewed-by: Steven Price <steven.price@arm.com>

Thanks,
Steve
