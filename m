Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D327956CE8
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 16:14:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630A710E284;
	Mon, 19 Aug 2024 14:14:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="AJTs91ZN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA9010E284
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 14:14:40 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4290075c7e1so4801735e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 07:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1724076879; x=1724681679; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tyS+Xc0805UyXQbuRAg4s3FWmNackLzPt0P1cCvOh4A=;
 b=AJTs91ZN08iElIOaWdcZNCsOBpDfhP3lXJEZsQN/6t/6kxjcj4ZVg6mvY5LlVKyO2n
 8wbUqzkyDEf0oCehZfaH4PVu+befr6uFqdJNi7aESeRloM2gTzC6KHb2uI8X31dcLuHM
 sHppMEdvYdDCU5VJajTbxMw8gBBsm370Ot6BQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724076879; x=1724681679;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tyS+Xc0805UyXQbuRAg4s3FWmNackLzPt0P1cCvOh4A=;
 b=vGsWsw5Q2PfYA20JkipsQ2fV5u7aNGo4g87ozMCIdGjZ38nvMJsYaA8mf9/WtP1Mcv
 sMFlE8/LH0LJvY+fhhXkkyG0fmxOagX6lqbhAoEXSEThQMAz73ItlBMHe3AXZNahsRPg
 Xz8DAMX0GH7Xh1K8xqk9fbkYDe7Vd5v8DBfnlZ2u6NoYTtxTjcIdNdelkZD7OJnW+NKb
 M5ScAENHQqTnw2TuUwcrlCkEIkRWy1J+3RlmFKeNcmL8XvXw7FjlEETmXpeB3y4tTMW7
 CaqVyKlU2+dcQUyF+iZbxtSG96k9F1Neb3wuwJElAq0y2/5+pyZQq8IV7YdBe1uu9n+Q
 8OSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQdQPvLByLdeACqSrKsIMiTtEhuEn5yIaoj3T7JzZVNah9ASyfNCKIC3YLPXh5FhEO1RFVSjY296sD8OJzKUxAW5hi+U35IcAdvjOcLBEd
X-Gm-Message-State: AOJu0Yz/Hp+s1dYB4VAU21siQiijmItSmPZjS6n48ENpv2Gv1+wNYSsV
 k6S2cXWzEnDSBHkP6yVlF3VIfDe9qFsDoUfD7kEvSpu/YhKPfrUgm/RtbNL9U3k=
X-Google-Smtp-Source: AGHT+IFfNbrKfFsL6HpEkIdTzG0zKVOQpaxIIL/PiIbZJjEOzOQ3/ERtsKrDz/+axP8iOm+5WjnCXA==
X-Received: by 2002:a05:600c:3b27:b0:426:6358:7c5d with SMTP id
 5b1f17b1804b1-429ed7f6a4bmr46348145e9.4.1724076878690; 
 Mon, 19 Aug 2024 07:14:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-371b1551b07sm5560606f8f.3.2024.08.19.07.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 07:14:38 -0700 (PDT)
Date: Mon, 19 Aug 2024 16:14:36 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 4/7] drm/ttm: move LRU walk defines into new internal
 header
Message-ID: <ZsNTTCfBCpZNrSQH@phenom.ffwll.local>
References: <20240710124301.1628-1-christian.koenig@amd.com>
 <20240710124301.1628-5-christian.koenig@amd.com>
 <Zo7QpJKtVNw4RvUd@DUT025-TGLU.fm.intel.com>
 <14b70a4d-dc65-4886-940c-ffc1a8197821@gmail.com>
 <77995ffc6de401bc8ed2f4181848dffb18540666.camel@linux.intel.com>
 <20bceb24-8cae-4f0a-897e-326dbf8dc186@amd.com>
 <7d3c647a2df19aa0f8a582b7d346ba8014cf6ca3.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d3c647a2df19aa0f8a582b7d346ba8014cf6ca3.camel@linux.intel.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Mon, Aug 19, 2024 at 01:38:56PM +0200, Thomas Hellström wrote:
> Hi, Christian,
> 
> On Mon, 2024-08-19 at 13:03 +0200, Christian König wrote:
> > Am 06.08.24 um 10:29 schrieb Thomas Hellström:
> > > Hi, Christian.
> > > 
> > > On Thu, 2024-07-11 at 14:01 +0200, Christian König wrote:
> > > > Am 10.07.24 um 20:19 schrieb Matthew Brost:
> > > > > On Wed, Jul 10, 2024 at 02:42:58PM +0200, Christian König
> > > > > wrote:
> > > > > > That is something drivers really shouldn't mess with.
> > > > > > 
> > > > > Thomas uses this in Xe to implement a shrinker [1]. Seems to
> > > > > need
> > > > > to
> > > > > remain available for drivers.
> > > > No, that is exactly what I try to prevent with that.
> > > > 
> > > > This is an internally thing of TTM and drivers should never use
> > > > it
> > > > directly.
> > > That driver-facing LRU walker is a direct response/solution to this
> > > comment that you made in the first shrinker series:
> > > 
> > > https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@amd.com/T/#ma918844aa8a6efe8768fdcda0c6590d5c93850c9
> > 
> > Ah, yeah that was about how we are should be avoiding middle layer
> > design.
> > 
> > But a function which returns the next candidate for eviction and a 
> > function which calls a callback for eviction is exactly the opposite.
> > 
> > > That is also mentioned in the cover letter of the recent shrinker
> > > series, and this walker has been around in that shrinker series for
> > > more than half a year now so if you think it's not the correct
> > > driver
> > > facing API IMHO that should be addressed by a review comment in
> > > that
> > > series rather than in posting a conflicting patch?
> > 
> > I actually outlined that in the review comments for the patch series.
> > E.g. a walker function with a callback is basically a middle layer.
> > 
> > What outlined in the link above is that a function which returns the 
> > next eviction candidate is a better approach than a callback.
> > 
> > > So assuming that we still want the driver to register the shrinker,
> > > IMO that helper abstracts away all the nasty locking and pitfalls
> > > for a
> > > driver-registered shrinker, and is similar in structure to for
> > > example
> > > the pagewalk helper in mm/pagewalk.c.
> > > 
> > > An alternative that could be tried as a driver-facing API is to
> > > provide
> > > a for_each_bo_in_lru_lock() macro where the driver open-codes
> > > "process_bo()" inside the for loop but I tried this and found it
> > > quite
> > > fragile since the driver might exit the loop without performing the
> > > necessary cleanup.
> > 
> > The point is that the shrinker should *never* need to have context.
> > E.g. 
> > a walker which allows going over multiple BOs for eviction is exactly
> > the wrong approach for that.
> > 
> > The shrinker should evict always only exactly one BO and the next 
> > invocation of a shrinker should not depend on the result of the
> > previous 
> > one.
> > 
> > Or am I missing something vital here?
> 
> A couple of things,
> 
> 1) I'd like to think of the middle-layer vs helper like the helper has
> its own ops, and can be used optionally from the driver. IIRC, the
> atomic modesetting / pageflip ops are implemented in exactly this way.
> 
> Sometimes a certain loop operation can't be easily or at least robustly
> implemented using a for_each_.. approach. Like for example
> mm/pagewalk.c. In this shrinking case I think it's probably possible
> using the scoped_guard() in cleanup.h. This way we could get rid of
> this middle layer discussion by turning the interface inside-out:
> 
> for_each_bo_on_lru_locked(xxx)
> 	driver_shrink();
> 
> But I do think the currently suggested approach is less fragile and
> prone to driver error.
> 
> FWIW in addition to the above examples, also drm_gem_lru_scan works
> like this.

a iteration state structure (like drm_connector_iter) plus then a macro
for the common case that uses cleanup.h should get the job done.

> 2) The shrinkers suggest to shrink a number of pages, not a single bo,
> again drm_gem_lru_scan works like this. i915 works like this. I think
> we should align with those.

Yeah that's how shrinkers work, so if we demidlayer then it realls needs
to be a loop in the driver, not a "here's the next bo to nuke" I think.

> 3) Even if we had a function to obtain the driver to shrink, the driver
> needs to have its say about the suitability for shrinking, so a
> callback is needed anyway (eviction_valuable).
> In addition, if shrinking fails for some reason, what would stop that
> function to return the same bo, again and again just like the problem
> we previously had in TTM?

Yeah I think if consensus moves back to drivers not looking at ttm lru
directly, then that entire shrinker looping needs to be as some kind of
midlayer in ttm itself. Otherwise I don't think it works, so agreeing with
Thomas here.

> So basically all the restartable LRU work was motivated by this use-
> case in mind, so making that private I must say comes as a pretty major
> surprise.
> 
> I could have a look at the 
> 
> for_each_bo_on_lru_locked(xxx)
> 	driver_shrink();
> 
> approach, but having TTM just blindly return a single bo without
> context will not work IMO.

Another thing to keep in mind is that at least experience from really
resource-starved igpu platforms says that cpu consumption for shrinking
matters. So really need to not toss list walk state, and also at least
from I think msm experience and maybe also i915 (i915-gem's a bit ... too
complex to really understand it anymore) is that parallelism matters too.
Eventually under memory pressures multiple cpu cores just aboslutely
hammer the shrinkers, so being stuck on locks is no good.

But maybe let's get this off the ground first.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
