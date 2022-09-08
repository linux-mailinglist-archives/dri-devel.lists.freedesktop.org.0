Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 972405B2621
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 20:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC10110EBC1;
	Thu,  8 Sep 2022 18:48:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362E210EBC1
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 18:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662662881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+Eze3ns7vu3ZUKRiyZpms9Q8jqMwv3JwYb3aUxFrFpI=;
 b=dxnzRAJ/6WhU0Uk3angoSRNyVvepXE+EshOOcWssSRfOnbKFGw8XEN34FqUyRoF2VpKKnK
 M9V/JiXP2uNQhdcwECW2BcdSkBibhFQgak5LgLxssTQlD7qvp8lHUkGo3Z/jI6O7xyTQUy
 CYst8/G/HBB/u/CTLiQQxCHdt8ebjbY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-153-iAy8-lxwPsCrYodDYReTWQ-1; Thu, 08 Sep 2022 14:48:00 -0400
X-MC-Unique: iAy8-lxwPsCrYodDYReTWQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 c6-20020a0ce7c6000000b004abe95fbed8so3687676qvo.11
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 11:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=+Eze3ns7vu3ZUKRiyZpms9Q8jqMwv3JwYb3aUxFrFpI=;
 b=oroAro1zUYCq7+5KqMJk4oY8fUz+daJ8QSupZSmloQp9vD9dY7n16Wry0wbL6gLjwz
 iqTKcPAVvdUaNV+WeDax4WvPsR1SXWoHHpPl1M3pj9wAF0tOLT6SNYP8pkQZwIeaZg2C
 BMg8RGxXQ3l7E2Q12BVLnVR17J3ojq8yMUCc35lVyOwrJbSrT/U8nvOnb/9ftO/9wc/4
 l433eX9QOfNNLv7Ktg3icq+rVgV2JZFrMdxbtBcR0r6tXBeRydgRZbdywkG9Jeb6vS25
 qn7hw6wW1ovjWTGghbombM7lxibibpL7tBCM2HrwDqZ/e/dmy9yRNCbhC8QQkmnJGt9z
 wsXQ==
X-Gm-Message-State: ACgBeo3ScC0WND/7D0aHI6oIpbdQP9MOmiUtqMCl9d3LRLMX1aA09Uk0
 6K2Nj1Yw4xNTifGbA//jndyoQekmd8ChSXF/nT+uTa2unYyOEJOdw/LNGST2H7LTOTFcSXRnK0K
 2pvy+NWVI/bmp6cAO/+I87TYkWHWNX1MTvDwH7a42pBzJ
X-Received: by 2002:a05:620a:4384:b0:6bb:268c:1c3c with SMTP id
 a4-20020a05620a438400b006bb268c1c3cmr7672174qkp.16.1662662879415; 
 Thu, 08 Sep 2022 11:47:59 -0700 (PDT)
X-Google-Smtp-Source: AA6agR57h7h8mAy+MEGQpnrsw0Ab85qOzvcf7ShO8SUllhtoTH8zDtpuSbPiQ9CQ5bfw59KyB7BGDaLKXgg+vQn/Nl4=
X-Received: by 2002:a05:620a:4384:b0:6bb:268c:1c3c with SMTP id
 a4-20020a05620a438400b006bb268c1c3cmr7672144qkp.16.1662662879048; Thu, 08 Sep
 2022 11:47:59 -0700 (PDT)
MIME-Version: 1.0
References: <CACO55tspZpSCE7U1WB2QRExXe=C8E51Vj3Ss9=K71QWqP8MxHA@mail.gmail.com>
 <CAF6AEGtb5TNXj4Eo3ACUc_AG_iDeQroeKnN9RPPcBeNaWORsfg@mail.gmail.com>
 <CACO55ttztg76GOCoNWSse7Xu6LAOz66LUeeZ8AmCdePZhghokA@mail.gmail.com>
 <CACO55ttrvvk=zH7hGdfv7xxUoUONpxbbVDVd1bp_zKs5X3NiGQ@mail.gmail.com>
 <CAF6AEGu9gq8Nsw60ZmdUKTOM-mT7Z7SM6mKBkzNDiY9p9-Eh9g@mail.gmail.com>
 <CACO55tsgz6_c0wLzwBXdRfm9--NnSi6N+QBAuiLB+csc5Rkyfg@mail.gmail.com>
 <c9e47776a1328e077ce20643d0cd81dbf4381012.camel@collabora.com>
 <CACO55ttOspgm-XNHtjWROjRs_mrm23da_e_ytFjZesVUzPdVWA@mail.gmail.com>
In-Reply-To: <CACO55ttOspgm-XNHtjWROjRs_mrm23da_e_ytFjZesVUzPdVWA@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 8 Sep 2022 20:47:48 +0200
Message-ID: <CACO55tuLRUj1qBgyL3YQKD5J7svMQNHgFU0OhjYRBbaFGbCTWQ@mail.gmail.com>
Subject: Re: Rust in our code base
To: Jason Ekstrand <jason.ekstrand@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Jason Ekstrand <jason@jlekstrand.net>, marek.olsak@amd.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dylan Baker <dylan.c.baker@intel.com>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, mesa-dev@lists.freedesktop.org,
 Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

will merge Rusticl tomorrow or so unless somebody complains.

On Wed, Aug 24, 2022 at 5:34 PM Karol Herbst <kherbst@redhat.com> wrote:
>
> On Wed, Aug 24, 2022 at 5:18 PM Jason Ekstrand
> <jason.ekstrand@collabora.com> wrote:
> >
> > +mesa-dev and my jlekstrand.net e-mail
> >
> > On Sun, 2022-08-21 at 20:44 +0200, Karol Herbst wrote:
> > > On Sun, Aug 21, 2022 at 8:34 PM Rob Clark <robdclark@gmail.com>
> > > wrote:
> > > >
> > > > On Sun, Aug 21, 2022 at 10:45 AM Karol Herbst <kherbst@redhat.com>
> > > > wrote:
> > > > >
> > > > > On Sun, Aug 21, 2022 at 7:43 PM Karol Herbst <kherbst@redhat.com>
> > > > > wrote:
> > > > > >
> > > > > > On Sun, Aug 21, 2022 at 5:46 PM Rob Clark <robdclark@gmail.com>
> > > > > > wrote:
> > > > > > >
> > > > > > > On Sat, Aug 20, 2022 at 5:23 AM Karol Herbst
> > > > > > > <kherbst@redhat.com> wrote:
> > > > > > > >
> > > > > > > > Hey everybody,
> > > > > > > >
> > > > > > > > so I think it's time to have this discussion for real.
> > > > > > > >
> > > > > > > > I am working on Rusticl
> > > > > > > > (
> > > > > > > > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15
> > > > > > > > 439)
> > > > > > > > which I would like to merge quite soon.
> > > > > > > >
> > > > > > > > Others might also plan on starting kernel drivers written
> > > > > > > > in Rust (and
> > > > > > > > if people feel comfortable to discuss this as well, they
> > > > > > > > might reply
> > > > > > > > here)
> > > > > > > >
> > > > > > > > The overall implication of that is: if we are doing this,
> > > > > > > > people (that
> > > > > > > > is we) have to accept that touching Rust code will be part
> > > > > > > > of our
> > > > > > > > development process. There is no other sane way of doing
> > > > > > > > it.
> > > > > > > >
> > > > > > > > I am not willing to wrap things in Rusticl so changing
> > > > > > > > gallium APIs
> > > > > > > > won't involve touching Rust code, and we also can't expect
> > > > > > > > people to
> > > > > > > > design their kernel drivers in weird ways "just because
> > > > > > > > somebody
> > > > > > > > doesn't want to deal with Rust"
> > > > > > > >
> > > > > > > > If we are going to do this, we have to do it for real,
> > > > > > > > which means,
> > > > > > > > Rust code will call C APIs directly and a change in those
> > > > > > > > APIs will
> > > > > > > > also require changes in Rust code making use of those APIs.
> > > > > > > >
> > > > > > > > I am so explicit on this very point, because we had some
> > > > > > > > discussion on
> > > > > > > > IRC where this was seen as a no-go at least from some
> > > > > > > > people, which
> > > > > > > > makes me think we have to find a mutual agreement on how it
> > > > > > > > should be
> > > > > > > > going forward.
> > > > > > > >
> > > > > > > > And I want to be very explicit here about the future of
> > > > > > > > Rusticl as
> > > > > > > > well: if the agreement is that people don't want to have to
> > > > > > > > deal with
> > > > > > > > Rust changing e.g. gallium, Rusticl is a dead project. I am
> > > > > > > > not
> > > > > > > > willing to come up with some trashy external-internal API
> > > > > > > > just to
> > > > > > > > maintain Rusticl outside of the mesa git repo.
> > > > > > > > And doing it on a kernel level is even more of a no-go.
> > > > > > > >
> > > > > > > > So what are we all thinking about Rust in our core repos?
> > > > > > >
> > > > > > > I think there has to be willingness on the part of rust folks
> > > > > > > to help
> > > > > > > others who aren't so familiar with rust with these sorts of
> > > > > > > API
> > > > > > > changes.  You can't completely impose the burden on others
> > > > > > > who have
> > > > > > > never touched rust before.  That said, I expect a lot of API
> > > > > > > changes
> > > > > > > over time are simple enough that other devs could figure out
> > > > > > > the
> > > > > > > related rust side changes.
> > > > > > >
> > > > > >
> > > > > > yeah, I agree here. I wouldn't say it's all the responsibility
> > > > > > of
> > > > > > developers changing APIs to also know how to change the code.
> > > > > > So e.g.
> > > > > > if an MR fails to compile and it's because of rusticl, I will
> > > > > > help out
> > > > > > and do the changes myself if necessary. But long term we have
> > > > > > to
> > > > > > accept that API changes also come with the implication of also
> > > > > > having
> > > > > > to touch Rust code.
> > > > > >
> > > > > > Short term it might be a learning opportunity for some/most,
> > > > > > but long
> > > > > > term it has to be accepted as a part of development to deal
> > > > > > with Rust.
> > > > > >
> > > > > > > As long as folks who want to start introducing rust in mesa
> > > > > > > and drm
> > > > > > > realize they are also signing up to play the role of rust
> > > > > > > tutor and
> > > > > > > technical assistance, I don't see a problem.  But if they
> > > > > > > aren't
> > > > > > > around and willing to help, I could see this going badly.
> > > > > > >
> > > > > >
> > > > > > Yep, I fully agree here. This is also the main reason I am
> > > > > > bringing
> > > > > > this up. Nobody should be left alone with having to deal with
> > > > > > changing
> > > > > > the code. On the other hand a "not having to touch Rust code
> > > > > > when
> > > > > > changing APIs" guarantee is something which is simply
> > > > > > impossible to
> > > > > > have in any sane architecture. So we should figure out under
> > > > > > which
> > > > > > circumstances it will be okay for everybody.
> > > >
> > > > Yeah, this sounds fine to me.
> > > >
> > > > > > At least I don't see a way how I can structure Rusticl so that
> > > > > > somebody working on gallium won't have to also deal with
> > > > > > rusticl. One
> > > > > > possibility would be to have a libgallium.so file I can link
> > > > > > to, but
> > > > > > then it's all about "stable gallium API" vs "not having to
> > > > > > touch rust
> > > > > > code" and I hope everybody prefers the second :)
> > > > > >
> > > > >
> > > > > uhm... I meant "stable gallium API" vs "dealing with Rust code on
> > > > > API changes"
> > > >
> > > > Yeah, stable gallium ABI makes as much sense as stable drm (in-
> > > > kernel)
> > > > ABI (ie. it doesn't).  So even if we tried to make it so that folks
> > > > who haven't used rust much (or at all) yet on the gallium side,
> > > > we'll
> > > > still have to deal with it on the kernel side.  So let's not design
> > > > our APIs to avoid a learning curve.. lets' just recognize that the
> > > > learning curve will be there.
> >
> > I think this is mostly fine.  If you're making a gallium change that
> > touches all the drivers, you need cross-project review as well.
> > Learning a bit of rust or asking one of the rust-knowledgable people to
> > update rusticl's wrappers seems reasonable at that point.
> >
> > Where I would take issue is if various wrappers or inlines are
> > duplicated in rust such that a change which wouldn't break drivers
> > because they're all using the wrappers do break rust code.  I know
> > that, at least at one point, rusticl had some of this which is why I'm
> > pointing it out specifically.  I've not looked at the branch in a
> > while, though.
> >
>
> The only thing I am aware of is that I have an iterator written in
> rust for glsl's list implementation in order to iterate over variables
> inside nir shaders. But yeah, that has the potential to blow up if
> somebody decides to change how the list works without changing the
> definition of the list. But as I am actually running piglit on rusticl
> with llvmpipe, this might not be a problem we wouldn't catch.
>
> > > > > > > I do also wonder a bit about code tooling (indexers, etc)..
> > > > > > > I'm not
> > > > > > > sure what the state of things when it comes to cross c<->rust
> > > > > > > integration.  Ie. it is usually straightforward enough to
> > > > > > > track down
> > > > > > > all the spots in C code which would be affected by some
> > > > > > > change.  It
> > > > > > > might be easier to overlook things on the rust side.  On the
> > > > > > > mesa
> > > > > > > side, pre-merge CI jobs help to catch these issues.  Less
> > > > > > > sure about
> > > > > > > how to handle that on the kernel side.
> > > > > > >
> > > > > >
> > > > > > At least for Rusticl it's all within meson/ninja. We use
> > > > > > bindgen to
> > > > > > generate the bindings automatically so you simply run into
> > > > > > compilation
> > > > > > issues. And for the kernel side I think that Linus wanted Rust
> > > > > > to be
> > > > > > non optional. If something uses it, you also make sure the Rust
> > > > > > side
> > > > > > compiles. And the build system is dynamic enough that you can
> > > > > > also
> > > > > > wire up bindgen and make it part of the normal development
> > > > > > model.
> > > > > >
> > > > > > In regards to code tooling, for rust you usually rely on
> > > > > > rust-analyzer. I've already figured out with dcbaker on how to
> > > > > > integrate our meson setup with that. Atm I am able to get the
> > > > > > full
> > > > > > experience with VScode. Not sure if we also need to figure out
> > > > > > how
> > > > > > that can work with e.g. vim and how to deal with C <=> Rust
> > > > > > boundaries.
> > > >
> > > > Yeah, I've used vscode with rust codebase (crosvm).. just not for a
> > > > project that includes the combination of a significant amount of
> > > > both
> > > > .c and .rs.
> > > >
> > >
> > > we have meson generate a rust-project.json file which you can point
> > > rust-analyzer to: https://github.com/mesonbuild/meson/pull/10682
> > >
> > > Sadly there is no "real" integration of rust and C code, so all you
> > > get are references to the bindgen generated files, but you can't jump
> > > to the actual C headers from there.
> >
> > I would be very surprised if any sort of C refactoring tool could see
> > through bindgen now, or in the future.  Seeing across language
> > boundaries is tractable in C because it's basically a superset of C++.
> > (Yes, I know it's not really.)  I wouldn't expect a static analyzer to
> > see across a C/Python or C/Java boundary, so I don't expect it to be
> > able to see across C/rust.  (Sadly, the boundary is sharp enough that
> > that's a reasonable comparison.)
> >
> > > > If bindgen is integrated with the build system, that sounds fine as
> > > > far as helping to not overlook changes that are needed on the .rs
> > > > side
> > > > of things.. crosvm seems to mainly make bindgen a manual step, but
> > > > then again it is mostly used for external dependencies like the
> > > > interface to virglrenderer
> > > >
> > > > Side note, from my experience with crosvm, please be careful about
> > > > any
> > > > external rust dependencies that are used.. rust still seems to be
> > > > young enough and evolving quickly enough that thing can quickly
> > > > turn
> > > > into a big headache
> > > >
> > >
> > > That's easy: meson doesn't support external crates, so no external
> > > rust dependencies are used at the moment :)
> > >
> > > But yeah, I was planning on using some where it really makes sense,
> > > but we can have this discussion once we get there. So far it all
> > > works
> > > without any external dependency besides bindgen.
> >
> > I think most of us are agreed here.  Mesa has pretty strict rules about
> > pulling in piles of external dependencies and we don't want that to
> > change just because we added a bit of rust.  There may be a crate or
> > two that we want to pull in in the future but, for now, everything is
> > core.
> >
> > One point not mentioned above is Rust compiler versions.  Because Rust
> > is a rapidly evolving language, new features are being added to the
> > language and standard library every day.  If we impose the same
> > requirements on Rust that we're imposing on GCC where we still compile
> > with a version from 10-15 years ago, that's going to really hamper
> > development.  We probably don't want to require people to always pull
> > the very latest compiler from nightly but I do think we want to be able
> > to bump the compiler version once a year or something.  IDK how distros
> > and others will feel about that.  Hopefully, they feel about the same
> > way towards compiler requirement bumps as they feel towards rust
> > itself.
> >
>
> yeah.. atm I actually require 1.59 which is quite new (Feb 2022). I
> think we might want to make sure that at least debians rust compiles
> rusticl in the future, but they also seem to be willing to packaging
> specific versions if they need it for other things like Firefox. They
> have rustc (1.48) and rustc-mozilla (1.51), where the latter is even
> available in stretch. So we might actually decide to simply depend on
> the same rust version Firefox uses, because that's something
> distributions will have to deal with anyway.
>
> > --Jason
> >
> > > > BR,
> > > > -R
> > > >
> > > > > > > BR,
> > > > > > > -R
> > > > > > >
> > > > > > > > CCing a bunch of people who think are the most impacted by
> > > > > > > > it either
> > > > > > > > from a reviewer/maintainer or developer perspective. If you
> > > > > > > > think some
> > > > > > > > others should be explicitly aware of this, please point
> > > > > > > > them to this
> > > > > > > > discussion here.
> > > > > > > >
> > > > > > > > Karol
> > > > > > > >
> > > > > > >
> > > > >
> > > >
> > >
> >

