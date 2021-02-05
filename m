Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8038310B0C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 13:28:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A2C6E241;
	Fri,  5 Feb 2021 12:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED306E241
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 12:28:22 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id h7so9634632lfc.6
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Feb 2021 04:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=idein-jp.20150623.gappssmtp.com; s=20150623;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=c86064i25H6BW4AJEOqS3wfUiyIHZJ/hQ8MH7o1Lf/U=;
 b=FBWCocjtAbR9IPCY91u8iED03CFf3BNvqKwZMFmDkB0kM5/BXUIRh4cbTGpNwK3I/T
 UoWHVe/5+fjGK48Og+H/yZZcB5vxmivw+1OI2dIdysdDV1/by5i+CSGKiFzVH61yp70S
 g3CEuKTBpkCaoW1TV7yc2JedxTN4LbBxbvMrejw5saMwHPXZimdzo/C17mhZDGnj0P3s
 dFhyzeCr6pg0s1Uc6WXhT82JLrIvMbwNP5N10C/nN2RRHq/89VO8bXdugv9DuY0LJIUy
 bBWwRFSoNmK4q1ohMoYvwnWlcbywhpQA157F9l9pqwnAF8NRFOXfLkzTH4TPf+lp8Zu/
 +eaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=c86064i25H6BW4AJEOqS3wfUiyIHZJ/hQ8MH7o1Lf/U=;
 b=C/TXQHsZcAa8AQoqMmJ0eMQo0LhJ6X1VXvR4wsiFcTUOMV2k7tQPz/+yasdjqmjnmp
 d9pQ5R6XIbiZcZAoxoB6cJrO5zEa5Zh3hN+SnoeaRSctzjAv2afjPzzNrnp9Wcfs/UrR
 0d7Rcuc/6EKAqGM6s3NKEm9vS1d31ivYJgaHbTFQE0PYfzKzjwGxbeek2ui0naJ6KQD/
 3ShN/PLlZQZdjH161vQJfMtzK5U24wsLxTS/p2aScpGDETlsEqIxf9w+ZYDGGAgaDFG4
 o36GpM1UnB/kBS13j3/pFKyLPA+fjx1+2ix7/tGTur4+DPOYZDHBeu/HxY/JVp20Pehn
 Ge/Q==
X-Gm-Message-State: AOAM531lfiP+M1Gu62PuXhiepedjCNFQBkEnnjTun5OPkccFNSOAP4dh
 GOPYKSDKqU8lpwSCx4z5E3Ep+H8RAvzD2qAdjuJo
X-Google-Smtp-Source: ABdhPJzESgc6cVT77pW/LyX/o20CwXC3PfpeV2wQdl78UP26sAa0BJWr0Q/t+rPg+RpoUqC961/PEkQqrhXpEeKmJQo=
X-Received: by 2002:a05:6512:6c4:: with SMTP id
 u4mr2359821lff.63.1612528100934; 
 Fri, 05 Feb 2021 04:28:20 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6512:25b:0:0:0:0 with HTTP; Fri, 5 Feb 2021 04:28:19
 -0800 (PST)
In-Reply-To: <CADaigPWcU5rB8HJWNtrb7p=icr5jFrqZnAQd-K6tWKvm0Yjr9Q@mail.gmail.com>
References: <20200903164821.2879-1-i.can.speak.c.and.basic@gmail.com>
 <20200903164821.2879-4-i.can.speak.c.and.basic@gmail.com>
 <0f552124-ebcf-2f7c-6aa2-9ad84f838717@igalia.com>
 <CADaigPWcU5rB8HJWNtrb7p=icr5jFrqZnAQd-K6tWKvm0Yjr9Q@mail.gmail.com>
From: Yukimasa Sugizaki <ysugi@idein.jp>
Date: Fri, 5 Feb 2021 21:28:19 +0900
Message-ID: <CACzkUEu2TtWVzJ6obR4LovP5G9mqzRZzgMArP73qmB4S9LP2CQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/v3d: Add job timeout module param
To: Chema Casanova <jmcasanova@igalia.com>, Eric Anholt <eric@anholt.net>
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
Cc: David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/02/2021, Eric Anholt <eric@anholt.net> wrote:
> On Thu, Feb 4, 2021 at 10:09 AM Chema Casanova <jmcasanova@igalia.com>
> wrote:
>>
>> On 3/9/20 18:48, Yukimasa Sugizaki wrote:
>> > From: Yukimasa Sugizaki <ysugi@idein.jp>
>> >
>> > The default timeout is 500 ms which is too short for some workloads
>> > including Piglit.  Adding this parameter will help users to run heavier
>> > tasks.
>> >
>> > Signed-off-by: Yukimasa Sugizaki <ysugi@idein.jp>
>> > ---
>> >   drivers/gpu/drm/v3d/v3d_sched.c | 24 +++++++++++++-----------
>> >   1 file changed, 13 insertions(+), 11 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/v3d/v3d_sched.c
>> > b/drivers/gpu/drm/v3d/v3d_sched.c
>> > index feef0c749e68..983efb018560 100644
>> > --- a/drivers/gpu/drm/v3d/v3d_sched.c
>> > +++ b/drivers/gpu/drm/v3d/v3d_sched.c
>> > @@ -19,11 +19,17 @@
>> >    */
>> >
>> >   #include <linux/kthread.h>
>> > +#include <linux/moduleparam.h>
>> >
>> >   #include "v3d_drv.h"
>> >   #include "v3d_regs.h"
>> >   #include "v3d_trace.h"
>> >
>> > +static uint timeout = 500;
>> > +module_param(timeout, uint, 0444);
>> > +MODULE_PARM_DESC(timeout,
>> > +     "Timeout for a job in ms (0 means infinity and default is 500
>> > ms)");
>> > +
>>
>> I think that  parameter definition could be included at v3d_drv.c as
>> other drivers do. Then we would have all future parameters together. In
>> that case we would need also to include the extern definition at
>> v3d_drv.h for the driver variable.
>>
>> The param name could be more descriptive like "sched_timeout_ms" in the
>> lima driver.
>>
>> I wonder if it would make sense to have different timeouts parameters
>> for different type of jobs we have. At least this series come from the
>> need additional time to complete compute jobs. This is what amdgpu does,
>> but we probably don't need something such complex.
>>
>> I think it would also make sense to increase our default value for the
>> compute jobs.
>>
>> What do you think?
>>
>> In any case I think that having this general scheduling timeout
>> parameter as other drivers do is a good idea.

I agree with your observations.
I'm going to add bin_timeout_ms, render_timeout_ms, tfu_timeout_ms,
v3d_timeout_ms, and cache_clean_timeout_ms parameters to v3d_drv.c
instead of the sole timeout parameter.
Though not sophisticated, this should be enough.

> Having a param for being able to test if the job completes eventually
> is a good idea, but if tests are triggering timeouts, then you
> probably need to investigate what's going on in the driver -- it's not
> like you want .5second unpreemptible jobs to be easy to produce.
>
> Also, for CS, I wonder if we have another reg besides CSD_CURRENT_CFG4
> we could be looking at for "we're making progress on the job".  Half a
> second with no discernible progress sounds like a bug.

If binning/render/TFU/cache_clean jobs keep running over 0.5 seconds,
then it should be a bug because they normally complete processing
within the period.
However, a CSD job can do anything.
For example, SaschaWillems's ray tracing example requires about 0.7
seconds to compose a frame with compute shader with Igalia's Vulkan
driver.
Another example is our matrix computation library for QPU:
https://github.com/Idein/qmkl6
It requires about 1.1 seconds to multiply two 2048x2048 matrices.
Because in general we do not know what is the expected behavior of a
QPU program and what is not, we also cannot detect a progress the
program is making.
This is why we want to have the timeout parameters to be able to be modified.

Regards,
Y. Sugizaki.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
