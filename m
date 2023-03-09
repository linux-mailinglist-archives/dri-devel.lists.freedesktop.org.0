Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA376B2E08
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 20:59:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF4110E258;
	Thu,  9 Mar 2023 19:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ECA710E258
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 19:59:26 +0000 (UTC)
Received: from 2603-8080-2102-63d7-c4a8-7e10-0391-f3ff.res6.spectrum.com
 (2603-8080-2102-63d7-c4a8-7e10-0391-f3ff.res6.spectrum.com
 [IPv6:2603:8080:2102:63d7:c4a8:7e10:391:f3ff])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: gfxstrand)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0FCC8660304A;
 Thu,  9 Mar 2023 19:59:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1678391965;
 bh=NqKVAOhcKdhQW0/TxyKzapD+cj1W7moCr1nx/DjwpP4=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=XLDUUeexPtWWfguSgsO3s2uFYzDQ5oyXB7UxKkODfYmLDKkWgNNML0gpRL7k9P6Ig
 Gcapetoj8+9KXXygkDKUrt+Ey6JzGtr4vJsAD9BLzEWeYFKIiBKJ9y4Rgp2ZxawXPg
 rs0hIvXlg8MyvYJkWQ4pDH1uQXkdC8Rp/k5zDCHXEsegGRetc4eIZ1hYxZqpwgVCWY
 dmKndolpBV3X28bBdfLIeQhbD6bQ1rq5P0VfFJATYwGHS5TIfGTIrUqr2nsCZKURUi
 oqdcLW+uq5/ktpZXr8jNXwn25TtV+Fb0BAlHomMl4OKV6n+L21hhTus2l4xxkrydhT
 lB4ORAMuOH0Yg==
Message-ID: <777dea65ef81c402d0765b1244b40633c483f4b2.camel@collabora.com>
Subject: Re: [PATCH RFC 11/18] drm/scheduler: Clean up jobs when the
 scheduler is torn down
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
Date: Thu, 09 Mar 2023 13:59:14 -0600
In-Reply-To: <9403e89d-a78f-8abd-2869-20da23d89475@asahilina.net>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-11-917ff5bc80a8@asahilina.net>
 <bbd7c5ee-c2f0-3e19-757d-a9aff1a26d3d@linux.intel.com>
 <585fa052-4eff-940e-b307-2415c315686a@amd.com>
 <3320e497-09c0-6eb6-84c5-bab2e63f28ec@asahilina.net>
 <7b39ef96-3ec5-c492-6e1b-bf065b7c90a2@amd.com>
 <0f14c1ae-0c39-106c-9563-7c1c672154c0@asahilina.net>
 <e18500b5-21a0-77fd-8434-86258cefce5a@amd.com>
 <8696d00a-c642-b080-c19a-b0e619e4b585@asahilina.net>
 <5f0814a3-4be3-a609-d3b3-dd51a4f459a1@amd.com>
 <9403e89d-a78f-8abd-2869-20da23d89475@asahilina.net>
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

On Thu, 2023-03-09 at 18:43 +0900, Asahi Lina wrote:
> On 09/03/2023 17.42, Christian K=C3=B6nig wrote:
> > Am 08.03.23 um 20:37 schrieb Asahi Lina:
> > > On 09/03/2023 03.12, Christian K=C3=B6nig wrote:
> > > > Am 08.03.23 um 18:32 schrieb Asahi Lina:
> > > > > [SNIP]
> > > > > Yes but... none of this cleans up jobs that are already
> > > > > submitted by the
> > > > > scheduler and in its pending list, with registered completion
> > > > > callbacks,
> > > > > which were already popped off of the entities.
> > > > >=20
> > > > > *That* is the problem this patch fixes!
> > > > Ah! Yes that makes more sense now.
> > > >=20
> > > > > > We could add a warning when users of this API doesn't do
> > > > > > this
> > > > > > correctly, but cleaning up incorrect API use is clearly
> > > > > > something we
> > > > > > don't want here.
> > > > > It is the job of the Rust abstractions to make incorrect API
> > > > > use that
> > > > > leads to memory unsafety impossible. So even if you don't
> > > > > want that in
> > > > > C, it's my job to do that for Rust... and right now, I just
> > > > > can't
> > > > > because drm_sched doesn't provide an API that can be safely
> > > > > wrapped
> > > > > without weird bits of babysitting functionality on top (like
> > > > > tracking
> > > > > jobs outside or awkwardly making jobs hold a reference to the
> > > > > scheduler
> > > > > and defer dropping it to another thread).
> > > > Yeah, that was discussed before but rejected.
> > > >=20
> > > > The argument was that upper layer needs to wait for the hw to
> > > > become
> > > > idle before the scheduler can be destroyed anyway.
> > > Unfortunately, that's not a requirement you can encode in the
> > > Rust type
> > > system easily as far as I know, and Rust safety rules mean we
> > > need to
> > > make it safe even if the upper layer doesn't do this... (or else
> > > we have
> > > to mark the entire drm_sched abstraction unsafe, but that would
> > > be a pity).
> >=20
> > Yeah, that should really not be something we should do.
> >=20
> > But you could make the scheduler depend on your fw context object,
> > don't=20
> > you?
>=20
> Yes, and that would fix the problem for this driver, but it wouldn't
> make the abstraction safe. The thing is we have to make it
> *impossible*
> to misuse drm_sched in such a way that it crashes, at the Rust
> abstraction level. If we start depending on the driver following
> rules
> like that, that means the drm_sched abstraction has to be marked
> unsafe.
>=20
> > Detaching the scheduler from the underlying hw fences is certainly=20
> > possible, but we removed that functionality because some people
> > people=20
> > tried to force push some Windows recovery module into Linux. We are
> > in=20
> > the process of reverting that and cleaning things up once more, but
> > that=20
> > will take a while.
>=20
> Okay, but I don't see why that should block the Rust abstractions...
> I
> don't even need a new API to do that, all I need is to know that
> drm_sched_fini() will do it so it won't crash when the hw fences
> complete later, as this patch does.
>=20
> > Instead of detaching you could also block for the hw to become
> > idle, but=20
> > if you do that synchronous on process termination you run into
> > trouble=20
> > as well.
>=20
> Yes, but again this something that can only be done at the driver
> level
> so it doesn't solve the safe abstraction problem...
>=20
> > > The firmware queue is itself reference counted and any firmware
> > > queue
> > > that has acquired an event notification resource (that is, which
> > > is busy
> > > with running or upcoming jobs) hands off a reference to itself
> > > into the
> > > event subsystem, so it can get notified of job completions by the
> > > firmware. Then once it becomes idle it unregisters itself, and at
> > > that
> > > point if it has no owning userspace queue, that would be the last
> > > reference and it gets dropped. So we don't tear down firmware
> > > queues
> > > until they are idle.
> >=20
> > And could those fw queue not reference the scheduler?
>=20
> Yes but again, that rule can't be encoded in the abstraction... so
> that
> makes it unsafe. The goal is to have a safe abstraction, which means
> that all the rules that you need to follow to avoid memory safety
> issues
> are checked by the Rust compiler.
>=20
> > > I actually don't know of any way to actively abort jobs on the
> > > firmware,
> > > so this is pretty much the only option I have. I've even seen
> > > long-running compute jobs on macOS run to completion even if you
> > > kill
> > > the submitting process, so there might be no way to do this at
> > > all.
> > > Though in practice since we unmap everything from the VM anyway
> > > when the
> > > userspace stuff gets torn down, almost any normal GPU work is
> > > going to
> > > immediately fault at that point (macOS doesn't do this because
> > > macOS
> > > effectively does implicit sync with BO tracking at the kernel
> > > level...).
> >=20
> > Oh, that is an interesting information. How does macOS do explicit
> > sync=20
> > then or isn't that supported at all?
>=20
> They have the equivalent of sync objects at the UAPI level, but they
> also have the implicit stuff and their UAPI seems to always pass a BO
> list to the kernel as far as we could tell, even though it still
> works
> without it. I think it's a weird hybrid of explicit+implicit sync.
> From
> the Metal docs:
>=20
> > By default, Metal tracks the write hazards and synchronizes the
> > resources
> > (see Resource Fundamentals) you create from an MTLDevice and
> > directly bind
> > to a pipeline. However, Metal doesn=E2=80=99t, by default, track resour=
ces
> > you
> > allocate from an MTLHeap (see Memory Heaps).
>=20
> So it's both, and you can override it...
>=20
> At the firmware level, I've never seen Metal use queue barriers yet
> like
> I do (other than the vertex->fragment ones), so either they always do
> CPU round trips for cross-subqueue sync (render<->compute) or we just
> haven't figured out the magic combination to get it to do that yet.
> Honestly, I suspect they just always do it on the CPU. macOS is
> pretty
> ugly behind the scenes and it's pretty obvious a lot of their own
> driver
> was rushed (the firmware seems to support quite a few features the
> driver doesn't... maybe it even has a job abort mechanism, we just
> haven't found it yet).
>=20
> Of course, our goal is to do things better than macOS (and we already
> do
> some things better!) but getting confident enough about firmware/HW
> details to diverge from what macOS does is tricky and a slow
> process...
>=20
> > > By the way, I don't really use the hardware recovery stuff right
> > > now.
> > > I'm not even sure if there is a sensible way I could use it,
> > > since as I
> > > said we can't exactly abort jobs. I know there are ways to lock
> > > up the
> > > firmware/GPU, but so far those have all been things the kernel
> > > driver
> > > can prevent, and I'm not even sure if there is any way to recover
> > > from
> > > that anyway. The firmware itself has its own timeouts and
> > > recovery for
> > > "normal" problems. From the point of view of the driver and
> > > everything
> > > above it, in-flight commands during a GPU fault or timeout are
> > > just
> > > marked complete by the firmware, after a firmware recovery cycle
> > > where
> > > the driver gets notified of the problem (that's when we mark the
> > > commands failed so we can propagate the error).
> >=20
> > Yeah, that's exactly what we are telling our fw people for years
> > that we=20
> > need this as well.
>=20
> Yeah, the ugly bit is that the firmware does a full GPU recovery even
> on
> simple page faults (which could be handled more gracefully) so even
> stuff like that can possibly break concurrent GPU work.
>=20
> On the other hand, macOS configures things so page faults are ignored
> and silently return all-00 on reads for shader accesses, which is how
> they implement sparse buffers/textures... and we'll probably have to
> do
> that to improve reliability against app faults if nothing else. But
> right now the driver enables explicit page faults for everything so
> we
> can debug Mesa (it's a kernel module param, GPU global and I haven't
> found a way to change it after initial load unfortunately, but it
> might
> be possible).
>=20
> I think there's also a way to do actual page fault handling (like
> swap
> in pages and resume the GPU), but that's one of those firmware
> features
> Apple's driver just never uses as far as I can tell. There's so much
> unexplored territory...
>=20
> >=20
> > > There is no re-submission or anything, userspace just gets told
> > > of the problem but
> > > the queue survives.
> >=20
> > > In the future it might be possible to re-submit innocent commands
> >=20
> > Long story short: Don't do this! This is what the Windows drivers
> > have=20
> > been doing and it creates tons of problems.

Yeah, we tried to do a bit of that in the GL days.  It was a bad idea.

> > Just signal the problem back to userspace and let the user space
> > driver=20
> > decide what to do.
> >=20
> > The background is that most graphics applications (games etc..)
> > then=20
> > rather start on the next frame instead of submitting the current
> > one=20
> > again while compute applications make sure that the abort and tell
> > the=20
> > user that the calculations might be corrupted and need to be
> > redone.

The guarantee that Vulkan makes is that, if you idle the GPU and you
haven't gotten a DEVICE_LOST yet, your data is good.  If you get a
DEVICE_LOST, all bets are off.  The problem is that, no matter how fast
the error propagation may be in the kernel or userspace driver, errors
can still show up in strange ways.  An OOB buffer access could end up
modifying a shader binary which gets run 3 frames later and causes a
corruption.  Once you've faulted, you really have no idea how far back
is good or what memory is corrupted.  You have to assume that
everything mapped to the GPU VA space is potentially toast.

> Then we're good with what we're currently doing, since we already
> notify
> userspace like that!
>=20
> Actually I wanted to ask about error notifications. Right now we have
> an
> out-of-band mechanism to provide detailed fault info to userspace
> which
> works fine, but in principle it's optional.

This is fine, in principal.  Because of the nature of errors, async is
fine as long as the error shows up eventually.  Faster is better, for
sure, but error latency doesn't really matter in practice.

> However, I also mark the hw
> =C2=A0fences as errored when a fault happens (with an errno that describe=
s
> the overall situation), but that never makes it into the drm_sched
> job
> complete fence. I looked at the drm_sched code and I didn't see any
> error propagation. Is that supposed to work, or am I supposed to
> directly mark the drm_sched side fence as complete, or did I
> misunderstand all this? I get the feeling maybe existing drivers just
> rely on the recovery/timeout/etc paths to mark jobs as errored (since
> those do it explicitly) and never need error forwarding from the hw
> fence?

The end behavior needs to be that all fences for all jobs submitted to
the queue get signaled.  That's needed to satisfy the finite time
guarantees of dma_fence.  Exactly how that happens (let the job run,
abort all the jobs, etc.) is an implementation detail for the driver to
decide.  If you want, you can also set a bit on the context (or queue)
to mark it as dead and start returning EIO or similar from any ioctls
trying to submit more work if you wanted.  Not required but you can.

~Faith
