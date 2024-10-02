Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA06398CF45
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 10:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DED710E6CC;
	Wed,  2 Oct 2024 08:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9F57410E6CC
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 08:54:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F2AB367;
 Wed,  2 Oct 2024 01:54:47 -0700 (PDT)
Received: from [10.57.64.205] (unknown [10.57.64.205])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7E5B3F64C;
 Wed,  2 Oct 2024 01:54:14 -0700 (PDT)
Message-ID: <974cf95e-38fe-4949-ba63-b1513ce8abb5@arm.com>
Date: Wed, 2 Oct 2024 09:54:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/5] drm/panthor: introduce job cycle and timestamp
 accounting
To: Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20240923230912.2207320-1-adrian.larumbe@collabora.com>
 <20240923230912.2207320-2-adrian.larumbe@collabora.com>
 <20241002103809.26d34ee0@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20241002103809.26d34ee0@collabora.com>
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

On 02/10/2024 09:38, Boris Brezillon wrote:
> On Tue, 24 Sep 2024 00:06:21 +0100
> Adrián Larumbe <adrian.larumbe@collabora.com> wrote:
> 
>> +static u32 calc_profiling_ringbuf_num_slots(struct panthor_device *ptdev,
>> +				       u32 cs_ringbuf_size)
>> +{
>> +	u32 min_profiled_job_instrs = U32_MAX;
>> +	u32 last_flag = fls(PANTHOR_DEVICE_PROFILING_ALL);
>> +
>> +	/*
>> +	 * We want to calculate the minimum size of a profiled job's CS,
>> +	 * because since they need additional instructions for the sampling
>> +	 * of performance metrics, they might take up further slots in
>> +	 * the queue's ringbuffer. This means we might not need as many job
>> +	 * slots for keeping track of their profiling information. What we
>> +	 * need is the maximum number of slots we should allocate to this end,
>> +	 * which matches the maximum number of profiled jobs we can place
>> +	 * simultaneously in the queue's ring buffer.
>> +	 * That has to be calculated separately for every single job profiling
>> +	 * flag, but not in the case job profiling is disabled, since unprofiled
>> +	 * jobs don't need to keep track of this at all.
>> +	 */
>> +	for (u32 i = 0; i < last_flag; i++) {
>> +		if (BIT(i) & PANTHOR_DEVICE_PROFILING_ALL)
> 
> I'll get rid of this check when applying, as suggested by Steve. Steve,
> with this modification do you want me to add your R-b?

Yes, please do.

Thanks,
Steve

> BTW, I've also fixed a bunch of checkpatch errors/warnings, so you
> might want to run checkpatch --strict next time.
> 
>> +			min_profiled_job_instrs =
>> +				min(min_profiled_job_instrs, calc_job_credits(BIT(i)));
>> +	}
>> +
>> +	return DIV_ROUND_UP(cs_ringbuf_size, min_profiled_job_instrs * sizeof(u64));
>> +}

