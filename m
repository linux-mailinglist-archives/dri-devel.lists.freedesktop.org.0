Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB16B21A434
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 17:59:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2090C6E0C6;
	Thu,  9 Jul 2020 15:59:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 46AAF6E0C6
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 15:59:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4C5131B;
 Thu,  9 Jul 2020 08:59:26 -0700 (PDT)
Received: from [192.168.1.84] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 048743F792;
 Thu,  9 Jul 2020 08:59:24 -0700 (PDT)
Subject: Re: [PATCH] drm/panfrost: fix ref count leak in panfrost_job_hw_submit
To: Rob Herring <robh@kernel.org>, Navid Emamdoost <navid.emamdoost@gmail.com>
References: <20200614062730.46489-1-navid.emamdoost@gmail.com>
 <CAL_JsqL=+ToP1w3m8GdK0K0o8ER2eYSiM5ffuFVxyMsZns4gqA@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <30c2031a-4975-43d0-c8ca-8664969e5df3@arm.com>
Date: Thu, 9 Jul 2020 16:59:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqL=+ToP1w3m8GdK0K0o8ER2eYSiM5ffuFVxyMsZns4gqA@mail.gmail.com>
Content-Language: en-GB
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
Cc: wu000273@umn.edu, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>, kjlu@umn.edu,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Navid Emamdoost <emamd001@umn.edu>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Stephen McCamant <smccaman@umn.edu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/07/2020 16:44, Rob Herring wrote:
> On Sun, Jun 14, 2020 at 12:27 AM Navid Emamdoost
> <navid.emamdoost@gmail.com> wrote:
>>
>> in panfrost_job_hw_submit, pm_runtime_get_sync is called which
>> increments the counter even in case of failure, leading to incorrect
>> ref count. In case of failure, decrement the ref count before returning.
>>
>> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
>> ---
>>   drivers/gpu/drm/panfrost/panfrost_job.c | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
>> index 7914b1570841..89ac84667eb1 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
>> @@ -147,11 +147,10 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
>>
>>          ret = pm_runtime_get_sync(pfdev->dev);
>>          if (ret < 0)
>> -               return;
>> +               goto out;
> 
> If the get failed, I don't think we want to do a put.

The pm_runtime_get_sync() does actually always increment the reference 
(even when returning a failure), but actually I don't think we want it 
here anyway, as I think I explained before[1].
  [1] 
https://lore.kernel.org/dri-devel/272650ba-2c44-9084-7829-b04023eba723@arm.com
> 
>>
>>          if (WARN_ON(job_read(pfdev, JS_COMMAND_NEXT(js)))) {
>> -               pm_runtime_put_sync_autosuspend(pfdev->dev);

This is a correct change - we don't want the put here. (Although this 
should never happen).

>> -               return;
>> +               goto out;
>>          }
>>
>>          cfg = panfrost_mmu_as_get(pfdev, &job->file_priv->mmu);
>> @@ -184,6 +183,9 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
>>                                  job, js, jc_head);
>>
>>          job_write(pfdev, JS_COMMAND_NEXT(js), JS_COMMAND_START);
> 
> So we start the job here and then...
> 
>> +out:
>> +       pm_runtime_put_sync_autosuspend(pfdev->dev);
> 
> ...turn off clocks/power here. Typically, you'd be fine as autosuspend
> has a delay by default, but userspace is free to change the delay to
> 0.
> 
>> +       return;

A return at the end of the function with no argument is pointless.

Steve

>>   }
>>
>>   static void panfrost_acquire_object_fences(struct drm_gem_object **bos,
>> --
>> 2.17.1
>>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
