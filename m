Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 723566B2D28
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 19:51:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F6610E1A5;
	Thu,  9 Mar 2023 18:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0342C10E0D5
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 18:51:07 +0000 (UTC)
Received: from 2603-8080-2102-63d7-c4a8-7e10-0391-f3ff.res6.spectrum.com
 (2603-8080-2102-63d7-c4a8-7e10-0391-f3ff.res6.spectrum.com
 [IPv6:2603:8080:2102:63d7:c4a8:7e10:391:f3ff])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: gfxstrand)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id DDC18660301A;
 Thu,  9 Mar 2023 18:51:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1678387866;
 bh=zPXp5AMyM+LyVyVsVhwqeE/YMpO/1h91SWBCIwbGY8Y=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=hzY5Xjqq1Ff801e1gA3d/buyz5enJc/g8Vg3GpDS6VuqP0XbQZv2nYxReUBY2qhWY
 X/qOcyu99DpWfIXFZ1k3qpsBbEn5CLglj4Uma2rMdDXlIdX6dfyFPFSVLpEkLtwB2e
 P9q2DqIPMtKF6Ux/76WjJomnvNO/NCoGFxxRX1SJyivPx9rUVLIgJEYdghbBqv4vBV
 QTadMP3uCKZ2BKDskNWWmWrCz2iNgWGnUDow1rgYMCA7k7CfY9Ud9cG+qfUVQkI3jy
 /Mjvt5wuxamF6Hq/t3mWJAmuyLkHSQiPICPn39ftcc5T6dKnCfUoUCUl7AFIJbTdH9
 vprKfebsi0aVw==
Message-ID: <f89fad4d05bc1e603fb166569e20102ceb09fb4c.camel@collabora.com>
Subject: Re: [PATCH RFC 10/18] drm/scheduler: Add can_run_job callback
From: Faith Ekstrand <faith.ekstrand@collabora.com>
To: Asahi Lina <lina@asahilina.net>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Alex
 Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Luben Tuikov <luben.tuikov@amd.com>, Jarkko
 Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
Date: Thu, 09 Mar 2023 12:50:57 -0600
In-Reply-To: <d36046e6-acf5-89a3-46b4-1c813ca925c8@asahilina.net>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-10-917ff5bc80a8@asahilina.net>
 <cd788ccf-0cf1-85d5-1bf8-efc259bd7e11@amd.com>
 <a075d886-0820-b6fb-fcd0-45bfdc75e37d@asahilina.net>
 <2b1060e9-86ba-7e16-14f1-5b5fa63de719@amd.com>
 <9f76bb68-b462-b138-d0ad-d27c972530d4@asahilina.net>
 <a39c6b40-f190-002d-ae1c-8b58c6442df2@amd.com>
 <4bbfc1a3-cfc3-87f4-897b-b6637bac3bd0@asahilina.net>
 <b0aa78b2-b432-200a-8953-a80c462fa6ee@amd.com>
 <c0624252-070e-bd44-2116-93a1d63a1359@asahilina.net>
 <d1fccceb-ca77-f653-17fc-63168e0da884@amd.com>
 <9c3dc2ad-11e4-6004-7230-8ca752e3d9f7@asahilina.net>
 <d544748c-8a2b-7c08-f199-182a56af22be@amd.com>
 <3e5e0120-50fd-51c0-d817-5b1dc4c14e97@asahilina.net>
 <f93448e6-4133-8a49-a12e-7a7012cb5409@amd.com>
 <d36046e6-acf5-89a3-46b4-1c813ca925c8@asahilina.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
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
Cc: linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mary <mary@mary.zone>, asahi@lists.linux.dev,
 linux-sgx@vger.kernel.org, Ella Stanforth <ella@iglunix.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jumping in here quick... (Sorry, I was out yesterday and was ignoring
my e-mail on Tuesday so I could finally type some compiler code.)

On Thu, 2023-03-09 at 18:14 +0900, Asahi Lina wrote:
> On 09/03/2023 17.05, Christian K=C3=B6nig wrote:
> > Am 09.03.23 um 07:30 schrieb Asahi Lina:
> > > On 09/03/2023 05.14, Christian K=C3=B6nig wrote:
> > > > > I think you mean wake_up_interruptible(). That would be
> > > > > drm_sched_job_done(), on the fence callback when a job
> > > > > completes, which
> > > > > as I keep saying is the same logic used for
> > > > > hw_rq_count/hw_submission_limit tracking.
> > > > As the documentation to wait_event says:
> > > >=20
> > > > =C2=A0 =C2=A0* wake_up() has to be called after changing any variab=
le
> > > > that could
> > > > =C2=A0 =C2=A0* change the result of the wait condition.
> > > >=20
> > > > So what you essentially try to do here is to skip that and say
> > > > drm_sched_job_done() would call that anyway, but when you read
> > > > any
> > > > variable to determine that state then as far as I can see
> > > > nothing is
> > > > guarantying that order.
> > > The driver needs to guarantee that any changes to that state
> > > precede a
> > > job completion fence signal of course, that's the entire idea of
> > > the
> > > API. It's supposed to represent a check for per-scheduler (or
> > > more
> > > specific, but not more global) resources that are released on job
> > > completion. Of course if you misuse the API you could cause a
> > > problem,
> > > but what I'm trying to say is that the API as designed and when
> > > used as
> > > intended does work properly.
> > >=20
> > > Put another way: job completions always need to cause the sched
> > > main
> > > loop to run an iteration anyway (otherwise we wouldn't make
> > > forward
> > > progress), and job completions are exactly the signal that the
> > > can_run_job() condition may have changed.
> > >=20
> > > > The only other possibility how you could use the callback
> > > > correctly
> > > > would be to call drm_fence_is_signaled() to query the state of
> > > > your hw
> > > > submission from the same fence which is then signaled. But then
> > > > the
> > > > question is once more why you don't give that fence directly to
> > > > the
> > > > scheduler?
> > > But the driver is supposed to guarantee that the ordering is
> > > always 1.
> > > resources freed, 2. fence signaled. So you don't need to check
> > > for the
> > > fence, you can just check for the resource state.
> >=20
> > Yeah, but this is exactly what the dma_fence framework tried to
> > prevent.=20
> > We try very hard to avoid such side channel signaling :)
>=20
> Right, and it's fine, I can use the fences directly easily enough.
> I'm
> just trying to explain why my original idea works too, even if it's
> not
> the best solution for other reasons!
>=20
> Of course I don't have the context of what other drivers are doing or
> did historically and what the pitfalls are, so I can't know what the
> "right" solution for any of this is in that context. I did my best to
> understand the drm_sched code and come up with a solution that works
> (which it does) without any more info. When I saw the hw submission
> limit stuff, I thought "okay, I need the same thing but with slightly
> more complex logic, so let's add a callback so the driver can
> customize
> it and do its own inflight counting".

So, I think there's a difference here between "impossible to implement
correctly", "likely to be implemented correctly", and "impossible to
implement incorrectly".  It's obviously possible to implement
correctly.  You can just always return true or do exactly the same
check or do some simple thing where you can guarantee that it will only
ever return false when there's a bunch of other stuff in the queue.=20
That doesn't mean that it's likely to be implemented correctly by some
other driver.  Some idiot will come along and try to take advantage of
it and cause themselves horrible problems.

And, to be clear, for the purposes of this discussion, we're ALL
idiots, myself included.  If there's one thing the DRM community has
learned over the years, it's that drivers are so complex that we all
turn into idiots at some point, relative to the complexity of the code
and hardware behavior.  That's why things like dma_fence are written so
incredibly defensively and why we're so harsh about the rules.  It's
the rules and not our individual smarts that keep us from making
mistakes.  (Kinda like Rust, in a way.)  So while I appreciate the
frustration of "I'm just trying to do something that's clearly correct
here", that doesn't mean that then next person to come by and fix a bug
by tweaking that callback isn't going to screw it up irreparably.  That
person may even be you in 6 to 12 months after this e-mail thread is a
distant memory.

So, yes, does the implementation you have today work without deadlocks
or starvation?  Maybe it does.  I've not verified.  Is the suggested
callback a giant foot-gun in the already treacherous territory of
scheduling and fencing?  Yeah, it probably is and there's another way
to implement the same behavior which is likely safer in the long run.

> After this discussion, I can see that this is equivalent to doing the
> same check in prepare_job() followed by returning the oldest running
> job's fence (as long as there's no race there... it should be fine if
> the fence reference is taken first, before the resource check, or if
> everything is done within the same critical section taking the
> firmware
> queue lock), so I'm happy to switch to that and drop this patch.
>=20
> But keep in mind none of this is documented, and there's no way for
> us
> driver authors to understand what we're supposed to do without
> documentation. As I said I spent a long time trying to understand
> drm_sched, and then my original attempt missed the drm_sched_fini()
> issue with dangling jobs and Alyssa managed to hit an oops on the
> test
> branch, I guessed what the problem was from her trace, figured out a
> way
> to reproduce it (the kill-loop glmark2 thing), and fixed it in the
> next
> patch in this series. So even trying my best to figure out how to do
> this, reading the code and what scarce docs there are, I managed to
> miss
> something that caused a potential oops on the first try. If I can't
> even
> get the API usage right after spending hours on it trying really hard
> not to (because it's not just about my driver, I need the Rust
> abstraction to be safe for any driver), there's no way I'm going to
> divine what approaches to resource/dependency signaling are
> problematic/easy to abuse... the most I can hope for is "I got the
> wrapper right and the API/driver interaction is correct and
> guarantees
> forward progress if the driver follows the rules".

Your frustration with the lack of good documentation in DRM is entirely
justified.  It's a mess and there's not a whole lot of people who
understand all these subtleties.  Connecting to the hive mind via e-
mail and asking questions is the best you can do a lot of the time, I'm
afraid.  I wish we had better documentation for a lot of things and I'd
be happy to see the situation improved added but we've got a lot of
debt there and not always a lot of time.  (Yeah, I know, that's every
senior engineer's excuse...)  We really are trying to be better about
it moving forward, though.  Daniel has been pushing people to document
things a lot more in recent years.  But, yeah, lots of debt...

Also, in a weird way, I think these conversations are sometimes better
than documentation.  It took a while to get around to it all but
there's a lot of context that was brought together in this e-mail
thread that wouldn't have been in the docs no matter how good they are.
A lot of it isn't an isolated thing that should clearly be explained in
the run_job docs.  It's subtle interactions which happen when all the
pieces come together.  I see this complaint a lot about Vulkan as well.
There are behaviors which only become evident when you find the right 5
pieces of the spec and put them all together and squint.  It'd be good
to call those out sometimes but there's no way we can document all of
them.

> So when I submit something, and you reply with "Well complete NAK",
> that's just not nice. Honestly, I was kind of upset when I got that
> email. It sounded as if you were saying my solution was completely
> broken and couldn't work, but no matter how I looked at it I couldn't
> figure out how it's broken. And then it took several emails to even
> understand what you were suggesting with the prepare_job callback
> (and
> yes, that works too and is probably harder to abuse than a new
> callback). I'm trying really hard to make this all work and be
> correct,
> and of course I make mistakes too... but then I look at the code and
> no
> matter what I can come up with it seems to work and be correct, what
> am
> I supposed to do? I'm happy to learn and figure out better approaches
> for everything that lead to better drivers, but I need an actual
> explanation of the issues, not just a NAK...
>=20
> I also would appreciate it if people give me the benefit of the doubt
> and let me explain what I'm doing and how I'm doing it and how this
> hardware works, because the whole thing is subtle to the core and
> very
> different to other GPUs. Honestly, I don't think any reviewer that
> hasn't spent hours poring over the driver/abstraction code could
> confidently say that a certain subtle sync issue exists at a first
> pass
> (other than for really obvious bad code sequences). I'm happy to look
> into issues and I definitely want to know what cases to look at and
> what
> to check for and fix anything we find... but isn't it better if we
> work
> together instead of shouting "this is broken" at the first hint of
> possible trouble?

Debating if I want to wade in in this one because this thread is
already getting a bit warm and I don't want to make it worse.  But, I'm
an idiot, so...

Knowing what I do of both people in this thread, I think Christian is
giving you more benefit of the doubt than you realize.  Yes, his tone
may be a bit abrupt but he continued to spend his time responding in
detail to every question you raised.  That means he was taking you
seriously, even if he wasn't yielding ground.

Communication is hard, especially with all the different personalities,
languages, and cultures involved in an international community like
this.  Sometimes the clarity of saying "no, this isn't going to work"
up-front is necessary.  Sometimes the person on the other end of the e-
mail could benefit from a gentler response.  It's hard to know from
early interactions.  Enough people have been wrong about dma_fence over
the years (Hi! It's me!) that "no" is often the right starting
position. =F0=9F=98=AD=EF=B8=8F  It doesn't always feel great to be on the =
receiving end
of that but Christian is pretty much guarding a dragon cave, so...

To be clear, none of that is a defense of the toxicity for which the
Linux community has gotten a reputation.  A lot of subsystem
maintainers have been known to start of with "no" to any idea they
didn't already think of.  That's bad.  Generally, you shouldn't assume
everyone but you is an idiot.  When it comes to dma_fence, though, the
assumption is that we're ALL idiots and the "No, seriously, don't go
into the dragon cave.  You won't come out alive.  You're not that
special." signs are justified. =F0=9F=98=93=EF=B8=8F

I hope the context I'm providing here is helpful.  If not, feel free to
ignore me.  It looks like you got the technical issues sorted.

~Faith

>=20
