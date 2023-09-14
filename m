Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6495C7A10FA
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 00:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE1510E593;
	Thu, 14 Sep 2023 22:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B478C10E593
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 22:29:36 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9ada6b0649fso208575966b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 15:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694730574; x=1695335374;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=obV8+bcnRi/J9RquhfwwRZFHOsJK4qK3A3iNjPmPcnM=;
 b=KVSUgw+J3Ss4IhXXEPHgUDqTcRjtAVx//xPwCMe6Sv2H+nh0MxK5Cao6lwEGtmU+OI
 Sg/yWgsfnvZnTr9NuJdav/UDkWUUtY2kiRu65mJcu6gl5MJ+oSZCIU9nbVAgrriVorLV
 c12nCRyA3SSlF+iSBwIZCjd1bgTKtHPDbZDGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694730574; x=1695335374;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=obV8+bcnRi/J9RquhfwwRZFHOsJK4qK3A3iNjPmPcnM=;
 b=PF4Pk+dqWt/4fGZU3uHRUJnqnjwdQXz8040da6ddrJld9Av4qjDGhtqhAUVI1yZxTi
 0ilEml9qQWHzUXv124zTJcF9V9iwmxG75s+ijcMb/4sjvVWzbh6gIa8yd/1reG+V43+C
 6WkAog/BzKMQ7qXJP/tzvcciHeTMnaMWc+COSLb3QuSXyExuh3qDZsFD6mlGVEx48wwT
 dMGEtY/t7DBGPp0j/oXB30wMjPThD9ozAvLxi9Lli0BMQd1FHOnv/Fjq3JF1++kHeoP7
 7WTQ6wGS762i06a+2MjGKOqT6N3KRHzkLxaYACTZ3jvObiK6KK5gEHH+Ue56jD9X04Ol
 cmsg==
X-Gm-Message-State: AOJu0Yyb8N0yTd8a4VbjYU/3jBEkZQbNIDzIR0PVmc8/T8dB/4yZcXOB
 JGUsXYaPxpT3xVAuKFBFL4B0p1B2qth1dK3aJg2HTg==
X-Google-Smtp-Source: AGHT+IEGKRn17rEXiP9yT/OxrbDP5rm11bwcZ4k0SI2V3uBCIeUD/CYgHNF5HfTnr9RcGcB8bQmEYQ==
X-Received: by 2002:a17:906:30da:b0:9a5:ac56:3b63 with SMTP id
 b26-20020a17090630da00b009a5ac563b63mr5742168ejb.63.1694730574225; 
 Thu, 14 Sep 2023 15:29:34 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51]) by smtp.gmail.com with ESMTPSA id
 j19-20020a170906411300b009930308425csm1555932ejk.31.2023.09.14.15.29.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 15:29:33 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4005f0a6c2bso11625e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 15:29:33 -0700 (PDT)
X-Received: by 2002:a1c:4b02:0:b0:3fe:e9ea:9653 with SMTP id
 y2-20020a1c4b02000000b003fee9ea9653mr55567wma.4.1694730573066; Thu, 14 Sep
 2023 15:29:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230901234202.566951-1-dianders@chromium.org>
 <20230901164111.RFT.3.Iea742f06d8bec41598aa40378fc625fbd7e8a3d6@changeid>
 <288af70dafc5e73d0fdfac71a33449385d4d6bd3.camel@crapouillou.net>
 <CAD=FV=VuJe7ACFw3pt1z=EAh14_Z4iTOc5VKJt24CGwZYjRpeQ@mail.gmail.com>
 <3prgpsxxnf3hzeqcpjs5r37nfojbkuwk4ezizrwfrcthm666k6@t2q2qcpnfkiu>
 <CAD=FV=VSTP2g1RttMu_9+AGQbMK87MzQO+tw1cZBEJ3g-jAmYg@mail.gmail.com>
 <vkdjbjda23fwofsbt23wtjgiya3uhelby7evwtvteqkpwb4dr4@ybla63hqndic>
In-Reply-To: <vkdjbjda23fwofsbt23wtjgiya3uhelby7evwtvteqkpwb4dr4@ybla63hqndic>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Sep 2023 15:29:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VWF8tP2aykNW7+4tkqQExdoja71OqtiDFGZs+c7Gjttw@mail.gmail.com>
Message-ID: <CAD=FV=VWF8tP2aykNW7+4tkqQExdoja71OqtiDFGZs+c7Gjttw@mail.gmail.com>
Subject: Re: [RFT PATCH 03/15] drm/ingenic: Call drm_atomic_helper_shutdown()
 at shutdown time
To: Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Sep 14, 2023 at 1:14=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> > > So it doesn't have any relationship with the unbind/remove timing, an=
d
> > > for all we know it can be there indefinitely, while the application
> > > continues to interact with the driver.
> >
> > I spent some time thinking about similar issues recently and, assuming
> > my understanding is correct, I'd at least partially disagree.
> >
> > Specifically, I _think_ the only thing that's truly required to remain
> > valid until userspace closes the last open "fd" is the memory for the
> > "struct drm_device" itself, right? My understanding is that this is
> > similar to how "struct device" works. The memory backing a "struct
> > device" has to live until the last client releases a reference to it
> > even if everything else about a device has gone away. So if it was all
> > working perfectly then if the Linux driver backing the "struct
> > drm_device" goes away then we'd release resources and NULL out a bunch
> > of stuff in the "struct drm_device" but still keep the actual "struct
> > drm_device" around since userspace still has a reference. Pretty much
> > all userspace calls would fail, but at least they wouldn't crash. Is
> > that roughly the gist?
>
> Yes, but also, no.
>
> In the spirit, you're right. However, there's three things interfering
> here:
>
>   - You don't always have a match between device and KMS entity. Display
>     pipelines are usually multiple devices working together, and while
>     you probably have a 1:1 relationship with bridges and panels (and to
>     some extent encoders/connectors), the planes and framebuffers for
>     example are a mess :) So, if the device backing the planes is to be
>     removed, what are you removing exactly? All of the planes and
>     framebuffers? Do you free the buffers allocated by the userspace
>     (that it might still use?)?
>
>   - In addition to that, KMS doesn't deal with individual entities being
>     hotplugged so neither the subsystem nor the application expect to
>     have a connector being removed.
>
>   - ioctl's aren't filtered once the device is starting to get removed
>     on most drivers.
>
> So due to 1 and 2, we can't really partially remove components unless
> the application is aware of it, and it doesn't expect to. And most
> drivers still allow (probably unwillingly though) the application to
> call ioctls once the DRM device has lost at least one of its backing
> devices.

We "can't", but we "can", right? Userspace can freely unbind a driver.
Unless you want to dig into if the community would allow a driver to
block "unbind" then we have to, at the very least, not crash the
kernel when userspace does this. Ideally we'd have something more
elegant than just "don't crash the kernel", but at least we shouldn't
crash.


> > Assuming that's correct, then _most_ of the resource acquiring /
> > memory allocation can still happen in the device probe() routine and
> > can still use devm as long as we do something to ensure that any
> > resources released are no longer pointed to by anything in the "struct
> > drm_device".
> >
> > To make it concrete, I think we want this (feel free to correct). For
> > simplicity, I'm assuming a driver that _doesn't_ use the component
> > framework:
> >
> > a) Linux driver probe() happens. The "struct drm_device" is allocated
> > in probe() by devm_drm_dev_alloc(). This takes a reference to the
> > "struct drm_device". The device also acquires resources / allocates
> > memory.
>
> You need to differentiate resources and allocations there. Resources can
> be expected to go away at the same time than the device, so using devm
> is fine. Allocations are largely disconnected from the device lifetime,
> and using devm leads to UAF.

Right. I think my original point was looking at "ingenic-drm-drv.c".
Much of the "devm" stuff there is resources and those specific things
could be moved to probe() instead of bind(), right?

For allocations, I think you'd have to look at each allocation. If the
allocation needed to live as long as the "struct drm_device" then devm
is clearly the wrong choice. ...but not every allocation needs to live
that long. Also, even if in the "simple" case allocations need to live
as long as a "struct drm_device", it's possible that there are some
cases where there's only an indirect reference to the memory. In that
case, you could NULL out the indirect reference and then free it.
Obviously someone would need to take care here.


> > b) Userspace acquires a reference to the "struct drm_device". Refcount
> > is now 2 (one from userspace, one from the Linux driver).
> >
> > c) The Linux driver unbinds, presumably because userspace requested
> > it. From earlier I think we decided that we can't (by design) block
> > unbind. Once unbind happens then we shouldn't try to keep operating
> > the device
>
> That part is correct, because the resources aren't there anymore.
>
> > the driver should stop running.
>
> But for the reasons above, the driver needs to still operate (in a
> degraded mode).

So I think here is where the disconnect is from our viewpoints. IMO
when a Linux driver is unbound then it makes no sense to try to
operate the device in "a degraded mode". When a Linux driver is
unbound then it should be releasing all of the resources from the
device (iomaps, IRQs, regulators, GPIOs, etc). That's just what
unbinding a driver is supposed to do.

I understand what you're saying above about display pipelines being
multiple Linux drivers working together and that it doesn't make lots
of sense to just unbind a random Linux device driver in the middle of
things. ...and I don't really have a simple/great answer for how to do
something super elegant if userspace tries to just randomly unbind one
of the many drivers in an active display pipeline.


> > As part of the unbind, the remove() is called and also "devm"
> > resources are deallocated. If any of the things freed are pointed to
> > by the "struct drm_device" then the code needs to NULL them out at
> > this time.
>
> Right, we also need to make sure we don't access any of the resources
> that got freed. This is typically done by protecting all the accesses
> with drm_dev_enter/drm_dev_exit.
>
> > Also we should make sure that any callback functions that userspace
> > could cause to be invoked return errors.
>
> That would prevent any new ioctl from occuring after the device has been
> removed, but that doesn't fix the race condition if it's removed while
> there's a commit happening. This is further complicated by the fact that
> commits can be queued (so you would have multiple submitted already) or
> made asynchronous.

I guess I would have expected that the remove() callback in the device
would prevent new commits from starting and then block waiting until
any in-progress commits were finished? ...kinda like how drivers call
del_timer_sync() in their remove functions...


> > Our code could go away at any point here since userspace could "rmmod"
> > our module.
>
> Yeah, we probably have a bug there. Boris also reported something like
> that recently where if you add an action with drmm_add_action, and then
> remove the module, the function would have been free'd by the time it
> executes.

I'm fairly certain that you can prevent a module from being unloaded
by just grabbing a refcount to it. However, I'm not sure that's the
right solution. If we're trying to run driver code after a driver has
been unbound then, IMO, that's the bug.


> > However, it's not a panacea for everything. Specifically once
> > the Linux driver unbind finishes then the device isn't functional
> > anymore.
>
> What's wrong with it then?

I'm mostly just saying don't just search-and-replace "devm" with
"drmm" in your driver and call it done. You need to think carefully
about which things are which lifetime.

---

Ironically, while digging into this I'm tempted to take back my
original request. Despite the kernel docs I pointed at [1], it
actually looks like it might be fine to use "devm" within a
component's bind() function. In try_to_bring_up_aggregate_device() it
seems like the code is opening up a nested "devres" group specifically
to allow this to work. A little bit of testing that I did with this
shows that, indeed, the nesting seems to be working. Am I missing
something here?

[1] https://docs.kernel.org/driver-api/component.html
