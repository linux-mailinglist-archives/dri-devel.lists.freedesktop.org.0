Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE066A99FB
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 15:56:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4659F10E637;
	Fri,  3 Mar 2023 14:56:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C28810E637;
 Fri,  3 Mar 2023 14:56:27 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 w25-20020a4ae9f9000000b0052513fb2e09so455671ooc.13; 
 Fri, 03 Mar 2023 06:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677855386;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=j/4RouuzL8ECEZl/Td7VxjLgxpMUQ1N2h9CsjJHqpzQ=;
 b=ptzbIgpn9x7yaYK4ePpO+ZiSffSoMq+TiyEeGrcUpgC7fYXaP6ADJzwM16U7GDuFde
 2sNuCnj5mqDCbKVfikxSVYdCGVKraZ4DZ+uWearU7e2hB6MXMEX4D2jZyhPOUkNK0SRc
 AEFCNSFlpnU9roEI1YW3jeaNZuUxUriGffS6kom2nqE2dkdadcnCSDwDuKbVUtAYNLWH
 gGM1utAcuu8tVAYEv5U2T1CGAHNp7OCVjKO2hd7BGJhpXgRXNagZv29COrKdt2rT+U3W
 Ij+Y+ru6fDRq+qeeIaa682wAPKXVFfGU7CcwPs3VBtsb9+C5pT4vEFVKjNGQUD2IZZFo
 Easg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677855386;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j/4RouuzL8ECEZl/Td7VxjLgxpMUQ1N2h9CsjJHqpzQ=;
 b=WWus2dhmZdq2Ip4SZ8Vxb5DcmZwT8be+VLAS7S5+7hh0ilJcRYiIUZJn03OC99IIcv
 EgaieQQ0QeGGLeFnP5SZQyIQqHpnW62KPDNTr/G1L0jmBXzJQGt3izm3voLaUWYYJQxO
 VEx9x2ZrxNB2wkA1oEJiWSsM6bbvUF+WapX/BmAFQM2397mjgdbZwpIJ9NXPg7FHfbE+
 ihzMpwuRYHyQn4fViKZdakI6OZPJ4tj3WRO/Eto4tluTWJXDdHRwPGdiS0bIMxtZ1QYd
 V9o05S3dAT9SbSZxF9JJ1aYIINmYzXt72fK/QVme2v0P0RbF0VuG0VDXJDRwty0og6wi
 Qa9A==
X-Gm-Message-State: AO0yUKV/urNuvQsCXsNPJ+BCVzztxUjyCnbnx4aGjDFIq/vUtn2X2t/f
 UPdO8mj3werdKP9JV86fMx3ollf218fpXAuTbcQ=
X-Google-Smtp-Source: AK7set9DozOLls/GqeNNYMtL9qqeRU16SuGiQ/es+hts/l4SEgNO+U56KdamwzBeKrgQ3qz4RsqVVO2+e9OtUlVXskE=
X-Received: by 2002:a4a:ae84:0:b0:525:270c:25e with SMTP id
 u4-20020a4aae84000000b00525270c025emr749593oon.1.1677855386220; Fri, 03 Mar
 2023 06:56:26 -0800 (PST)
MIME-Version: 1.0
References: <20230302235356.3148279-1-robdclark@gmail.com>
 <20230302235356.3148279-16-robdclark@gmail.com>
 <ZAFnqbycMleLmRe9@intel.com>
In-Reply-To: <ZAFnqbycMleLmRe9@intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 3 Mar 2023 06:56:15 -0800
Message-ID: <CAF6AEGvAR9BG+PxLZXhOP_YzAcujjfp5oL8SObppvQYxdFvuXQ@mail.gmail.com>
Subject: Re: [PATCH v9 15/15] drm/i915: Add deadline based boost support
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 2, 2023 at 7:21 PM Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>
> On Thu, Mar 02, 2023 at 03:53:37PM -0800, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
>
> missing some wording here...

the wording should be "Pls replace this patch, kthx" ;-)

>
> > v2: rebase
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/i915/i915_request.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> > index 7503dcb9043b..44491e7e214c 100644
> > --- a/drivers/gpu/drm/i915/i915_request.c
> > +++ b/drivers/gpu/drm/i915/i915_request.c
> > @@ -97,6 +97,25 @@ static bool i915_fence_enable_signaling(struct dma_fence *fence)
> >       return i915_request_enable_breadcrumb(to_request(fence));
> >  }
> >
> > +static void i915_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
> > +{
> > +     struct i915_request *rq = to_request(fence);
> > +
> > +     if (i915_request_completed(rq))
> > +             return;
> > +
> > +     if (i915_request_started(rq))
> > +             return;
>
> why do we skip the boost if already started?
> don't we want to boost the freq anyway?
>
> > +
> > +     /*
> > +      * TODO something more clever for deadlines that are in the
> > +      * future.  I think probably track the nearest deadline in
> > +      * rq->timeline and set timer to trigger boost accordingly?
> > +      */
>
> I'm afraid it will be very hard to find some heuristics of what's
> late enough for the boost no?
> I mean, how early to boost the freq on an upcoming deadline for the
> timer?

So, from my understanding of i915 boosting, it applies more
specifically to a given request (vs msm which just bumps up the freq
until the next devfreq sampling period which then recalculates target
freq based on busy cycles and avg freq over the last sampling period).
For msm I just set a timer for 3ms before the deadline and boost if
the fence isn't signaled when the timer fires.  It is kinda impossible
to predict, even for userspace, how long a job will take to complete,
so the goal isn't really to finish the specified job by the deadline,
but instead to avoid devfreq landing at a local minimum (maximum?)

AFAIU what I _think_ would make sense for i915 is to do the same thing
you do if you miss a vblank pageflip deadline if the deadline passes
without the fence signaling.

BR,
-R

> > +
> > +     intel_rps_boost(rq);
> > +}
> > +
> >  static signed long i915_fence_wait(struct dma_fence *fence,
> >                                  bool interruptible,
> >                                  signed long timeout)
> > @@ -182,6 +201,7 @@ const struct dma_fence_ops i915_fence_ops = {
> >       .signaled = i915_fence_signaled,
> >       .wait = i915_fence_wait,
> >       .release = i915_fence_release,
> > +     .set_deadline = i915_fence_set_deadline,
> >  };
> >
> >  static void irq_execute_cb(struct irq_work *wrk)
> > --
> > 2.39.1
> >
