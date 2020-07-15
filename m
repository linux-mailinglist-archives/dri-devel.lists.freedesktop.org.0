Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EAB220C7F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 13:57:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC8AF6EB1B;
	Wed, 15 Jul 2020 11:57:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59F86EB1B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 11:57:11 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id o36so398564ooi.11
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 04:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S1vWkNDq8ilucIymWKAlkOAuy47r8e5xfL8ne720plc=;
 b=GPc9UHNokUUD2+AvdsbRTDT6CdqwFr7oTCqFELGIXmIAQ8jt6jrrgmzS5JEzf+qKKS
 uAbtqaJo2qH2sGi+gNHJ8YgCD27UTdLL1qLHgtvzPeWDoRslOUOwbzd1udNxvkwDfODK
 hRHO74djleERINZQEy/8t5QcyI3fT78h2RdQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S1vWkNDq8ilucIymWKAlkOAuy47r8e5xfL8ne720plc=;
 b=DtvK/xJcAqZYnNt7sGVmk59AvL7pQGTfeDzTCzfZRC+iUKHdWC4Ckv3NNkNhKaMcsl
 kfTtmCqbDoDpY8U3mh+XFS8NdnxZtNYXmSy0eTp6JYCYejEZ8oADaNUBzBqPjWjRslhl
 CY2rsvIE0EfbzCE5ZPVx3ytxM50UYj7Y3gDFaRORtWUWsCLoRB7z88P1GJpRCSUlzDco
 Nmluq9gXda2Xj7xJ6CvFyiIFIFXnJincHZ4nWWBXYg2wOvXfaciOkTU8Uwpi2M4orhbL
 gXv0uoL7vioYOHFSdOLX1/yvw4XGPGIRqKwuluLK+yUqqSBAJyZjDbeHcOKV9tsIbP5G
 HVnw==
X-Gm-Message-State: AOAM533M+d8PtAY5ZwX5WVwxdaDRCyI9Oc+6DtmPL6yQRqmkN5aA2quo
 JfLArW5OnH8mRYMoSlVTOf/l4N/IkVyYEV9lB6AxZQ==
X-Google-Smtp-Source: ABdhPJy4wqJRnsXmPU3pvsNn0LdFwI8ca825p+RaqrYygUhl1NSen9TJGsaiBzm4eBllGYE2AL8EjkAqTsh3Ezyt3CY=
X-Received: by 2002:a4a:9653:: with SMTP id r19mr9030351ooi.85.1594814231128; 
 Wed, 15 Jul 2020 04:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200715100432.13928-1-chris@chris-wilson.co.uk>
 <CAP+8YyF9djTo++3Gww2NNkOE_=fu9n+HzjoN7e78pVgJf_SP7A@mail.gmail.com>
 <159480926758.13728.809663901463022623@build.alporthouse.com>
 <CAP+8YyHDYQSBmRohBwnhcB96p+ZHU2hT106CS6_-8A0Fk1Hegw@mail.gmail.com>
 <CAPj87rN+Sg6PRzGx-FjRFBoenpD9EsV9=ZbiCHEThcgt09YbMQ@mail.gmail.com>
In-Reply-To: <CAPj87rN+Sg6PRzGx-FjRFBoenpD9EsV9=ZbiCHEThcgt09YbMQ@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 15 Jul 2020 13:57:00 +0200
Message-ID: <CAKMK7uFw_cu4kc5poS2et3j0UXogS4z0Gt3CXj-kS9OvpGpkDA@mail.gmail.com>
Subject: Re: [Intel-gfx] sw_sync deadlock avoidance, take 3
To: Daniel Stone <daniel@fooishbar.org>, Rob Herring <robh@kernel.org>, 
 John Stultz <john.stultz@linaro.org>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 15, 2020 at 1:47 PM Daniel Stone <daniel@fooishbar.org> wrote:
>
> Hi,
>
> On Wed, 15 Jul 2020 at 12:05, Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl> wrote:
> > On Wed, Jul 15, 2020 at 12:34 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > > Maybe now is the time to ask: are you using sw_sync outside of
> > > validation?
> >
> > Yes, this is used as part of the Android stack on Chrome OS (need to
> > see if ChromeOS specific, but
> > https://source.android.com/devices/graphics/sync#sync_timeline
> > suggests not)
>
> Android used to mandate it for their earlier iteration of release
> fences, which was an empty/future fence having no guarantee of
> eventual forward progress until someone committed work later on. For
> example, when you committed a buffer to SF, it would give you an empty
> 'release fence' for that buffer which would only be tied to work to
> signal it when you committed your _next_ buffer, which might never
> happen. They removed that because a) future fences were a bad idea,
> and b) it was only ever useful if you assumed strictly
> FIFO/round-robin return order which wasn't always true.
>
> So now it's been watered down to 'use this if you don't have a
> hardware timeline', but why don't we work with Android people to get
> that removed entirely?

I think there's some testcases still using these, but most real fence
testcases use vgem nowadays. So from an upstream pov there's indeed
not much if anything holding us back from just deleting this all. And
would probably be a good idea.

Adding Rob and John for more of the android pov.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
