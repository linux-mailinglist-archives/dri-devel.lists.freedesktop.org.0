Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAF34B8D44
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 17:06:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F58910E6A9;
	Wed, 16 Feb 2022 16:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 16CCA10E6A9
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 16:06:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFA3D1474;
 Wed, 16 Feb 2022 08:06:41 -0800 (PST)
Received: from [10.57.38.29] (unknown [10.57.38.29])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A675D3F70D;
 Wed, 16 Feb 2022 08:06:40 -0800 (PST)
Message-ID: <b6139559-bcd1-76fe-7ebd-7df05fe69b2f@arm.com>
Date: Wed, 16 Feb 2022 16:06:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 6/9] drm/panfrost: Add "clean only safe" feature bit
Content-Language: en-GB
To: Alyssa Rosenzweig <alyssa@collabora.com>
References: <20220211202728.6146-1-alyssa.rosenzweig@collabora.com>
 <20220211202728.6146-7-alyssa.rosenzweig@collabora.com>
 <fcfedc32-32c6-4827-4cfa-d2b7098ee22b@arm.com> <YgqK0ZjnXVux9d6Y@maud>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <YgqK0ZjnXVux9d6Y@maud>
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, alyssa.rosenzweig@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/02/2022 17:01, Alyssa Rosenzweig wrote:
>>> Add the HW_FEATURE_CLEAN_ONLY_SAFE bit based on kbase. When I actually
>>> tried to port the logic from kbase, trivial jobs raised Data Invalid
>>> Faults, so this may depend on other coherency details. It's still useful
>>> to have the bit to record the feature bit when adding new models.
>>>
>>> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>>
>> Reviewed-by: Steven Price <steven.price@arm.com>
>>
>> Sadly I don't have the hardware to try this out on, but it should be a
>> simple case of the below (untested):
>>
>> ----8<----
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
>> index 908d79520853..602e51c4966e 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
>> @@ -212,9 +212,13 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
>>          * start */
>>         cfg |= JS_CONFIG_THREAD_PRI(8) |
>>                 JS_CONFIG_START_FLUSH_CLEAN_INVALIDATE |
>> -               JS_CONFIG_END_FLUSH_CLEAN_INVALIDATE |
>>                 panfrost_get_job_chain_flag(job);
>>  
>> +       if (panfrost_has_hw_feature(pfdev, HW_FEATURE_CLEAN_ONLY_SAFE))
>> +               cfg |= JS_CONFIG_END_FLUSH_CLEAN;
>> +       else
>> +               cfg |= JS_CONFIG_END_FLUSH_CLEAN_INVALIDATE;
>> +
>>         if (panfrost_has_hw_feature(pfdev, HW_FEATURE_FLUSH_REDUCTION))
>>                 cfg |= JS_CONFIG_ENABLE_FLUSH_REDUCTION;
> 
> Yes, this is the patch I typed out... causes DATA_INVALID_FAULTs for me
> with Mesa. Which makes me wonder if userspace needs to respect some
> extra rules for this to be safe.

Odd - the invalidate at the end of the job shouldn't be needed to read
the job descriptors from userspace only the one at the beginning.

However I'm wondering if there's something fishy happening with the
flush reduction. That allows skipping the cache maintenance at the
beginning of a job if there has already been one for other reasons. But
I can't immediately see any difference in the way kbase handles this.

Steve
