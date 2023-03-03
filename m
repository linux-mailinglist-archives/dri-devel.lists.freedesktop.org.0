Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEB76A99C5
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 15:49:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF7810E12A;
	Fri,  3 Mar 2023 14:48:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5EA10E0FE;
 Fri,  3 Mar 2023 14:48:57 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id t22so1927644oiw.12;
 Fri, 03 Mar 2023 06:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677854936;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=95fD1OMocm4n8bJJC6tFnFtkplpEQySvwjBizvI/Tpo=;
 b=H8QbelVEw4Vh8BarvpWGCoSzGSZZvuUsFbB+c82/q20vffUTswfFY2u+Tl0R3sXrbW
 cFKl8/7P2yLWoKR1UV5jhiJfMbPITDEreXyy3XUd3Bx+EePTrtoW9mrK6wscRkoJ+2aJ
 5fjoNNJzTeh5EoCDXG3GysgWY338xt4aBazpADFEOOpjcX08urE7ZuZGcrmHjRu/uNll
 6wekbPxRCxNR6/RU2Jo+llW1KSCE+U/RMRtNk1Bjv+Ogrl1ILAEF4/5YyQNmzXZeqBGb
 +m066zgXiE7fg+2WBqFBzKeXmpaWIPJHHVW6knXxmSiKugJXUMdzE/fK+fI6SYy+sDv7
 YpWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677854936;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=95fD1OMocm4n8bJJC6tFnFtkplpEQySvwjBizvI/Tpo=;
 b=mp12758yUF3jF/V4u4uLgm2sS3e5acU3z8siDO0vDePXdk/WOuEnh9l3U4IU0r50Sy
 awBi+AtPF4gfxi4JBjeAiZTY9hjO7OqE7GDsNUWBiZ0yFMh9HWtLPVIlOOD+1hzUzvCo
 fSs5OwMG5EaLwsEXy8GzsQQMGrqnHT8CL6tiwq33sNai1vih6NtxJk8bvMml7y+VzBwA
 8D7k6UqCH8hrCFm0E6JUDYghekvCmVHYZxZjp0yhQm1NOnccVypHgJLomLBxE9VmYLfQ
 OadnlLSfu0mttl300eybcg4Ysh7nyxNcefepHXWax+4rGSdHe2PGwEUmsPaUn5H1jhvv
 gr1Q==
X-Gm-Message-State: AO0yUKXqkgHOtbzc38VN1D9OJEM+KqfZsGCDugLFLHuiluyVTOFzEq+/
 tKzFLFscz6PGoseB16bU4ybvGlfZvs7ui1/Y1/E=
X-Google-Smtp-Source: AK7set+3e72I1aKOy6TuglUkJuSkxFy00dwwauEHhVb/G5t4QUiLGNGQh5N5d5lD2/Blvvsq/7AIUvcQeTiZih4TE1k=
X-Received: by 2002:a05:6808:354:b0:384:692c:56c9 with SMTP id
 j20-20020a056808035400b00384692c56c9mr624924oie.3.1677854936419; Fri, 03 Mar
 2023 06:48:56 -0800 (PST)
MIME-Version: 1.0
References: <20230302235356.3148279-1-robdclark@gmail.com>
 <20230302235356.3148279-16-robdclark@gmail.com>
 <ZAFnqbycMleLmRe9@intel.com>
 <3bded9d7-9796-4a9b-7c11-aac994d4fdc6@linux.intel.com>
In-Reply-To: <3bded9d7-9796-4a9b-7c11-aac994d4fdc6@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 3 Mar 2023 06:48:43 -0800
Message-ID: <CAF6AEGs6QYTESuwB8E9cTbv9LqQX16tz6-geeu9BCyFos9=sOA@mail.gmail.com>
Subject: Re: [PATCH v9 15/15] drm/i915: Add deadline based boost support
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Rob Clark <robdclark@chromium.org>, Luben Tuikov <luben.tuikov@amd.com>,
 Matt Turner <mattst88@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 3, 2023 at 1:58 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 03/03/2023 03:21, Rodrigo Vivi wrote:
> > On Thu, Mar 02, 2023 at 03:53:37PM -0800, Rob Clark wrote:
> >> From: Rob Clark <robdclark@chromium.org>
> >>
> >
> > missing some wording here...
> >
> >> v2: rebase
> >>
> >> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >> ---
> >>   drivers/gpu/drm/i915/i915_request.c | 20 ++++++++++++++++++++
> >>   1 file changed, 20 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> >> index 7503dcb9043b..44491e7e214c 100644
> >> --- a/drivers/gpu/drm/i915/i915_request.c
> >> +++ b/drivers/gpu/drm/i915/i915_request.c
> >> @@ -97,6 +97,25 @@ static bool i915_fence_enable_signaling(struct dma_fence *fence)
> >>      return i915_request_enable_breadcrumb(to_request(fence));
> >>   }
> >>
> >> +static void i915_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
> >> +{
> >> +    struct i915_request *rq = to_request(fence);
> >> +
> >> +    if (i915_request_completed(rq))
> >> +            return;
> >> +
> >> +    if (i915_request_started(rq))
> >> +            return;
> >
> > why do we skip the boost if already started?
> > don't we want to boost the freq anyway?
>
> I'd wager Rob is just copying the current i915 wait boost logic.

Yup, and probably incorrectly.. Matt reported fewer boosts/sec
compared to your RFC, this could be the bug

> >> +
> >> +    /*
> >> +     * TODO something more clever for deadlines that are in the
> >> +     * future.  I think probably track the nearest deadline in
> >> +     * rq->timeline and set timer to trigger boost accordingly?
> >> +     */
> >
> > I'm afraid it will be very hard to find some heuristics of what's
> > late enough for the boost no?
> > I mean, how early to boost the freq on an upcoming deadline for the
> > timer?
>
> We can off load this patch from Rob and deal with it separately, or
> after the fact?

That is completely my intention, I expect you to replace my i915 patch ;-)

Rough idea when everyone is happy with the core bits is to setup an
immutable branch without the driver specific patches, which could be
merged into drm-next and $driver-next and then each driver team can
add there own driver patches on top

BR,
-R

> It's a half solution without a smarter scheduler too. Like
> https://lore.kernel.org/all/20210208105236.28498-10-chris@chris-wilson.co.uk/,
> or if GuC plans to do something like that at any point.
>
> Or bump the priority too if deadline is looming?
>
> IMO it is not very effective to fiddle with the heuristic on an ad-hoc
> basis. For instance I have a new heuristics which improves the
> problematic OpenCL cases for further 5% (relative to the current
> waitboost improvement from adding missing syncobj waitboost). But I
> can't really test properly for regressions over platforms, stacks,
> workloads.. :(
>
> Regards,
>
> Tvrtko
>
> >
> >> +
> >> +    intel_rps_boost(rq);
> >> +}
> >> +
> >>   static signed long i915_fence_wait(struct dma_fence *fence,
> >>                                 bool interruptible,
> >>                                 signed long timeout)
> >> @@ -182,6 +201,7 @@ const struct dma_fence_ops i915_fence_ops = {
> >>      .signaled = i915_fence_signaled,
> >>      .wait = i915_fence_wait,
> >>      .release = i915_fence_release,
> >> +    .set_deadline = i915_fence_set_deadline,
> >>   };
> >>
> >>   static void irq_execute_cb(struct irq_work *wrk)
> >> --
> >> 2.39.1
> >>
