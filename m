Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1D46B8260
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 21:11:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A9D10E618;
	Mon, 13 Mar 2023 20:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E3A10E618
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 20:11:25 +0000 (UTC)
Received: from 2603-8080-2102-63d7-c4a8-7e10-0391-f3ff.res6.spectrum.com
 (2603-8080-2102-63d7-c4a8-7e10-0391-f3ff.res6.spectrum.com
 [IPv6:2603:8080:2102:63d7:c4a8:7e10:391:f3ff])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: gfxstrand)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 140006603082;
 Mon, 13 Mar 2023 20:11:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1678738283;
 bh=/Hk85AyfI2+qDYVuOaAdIFIbZ8GVt1D5Rz/mY9nD+bc=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=krDlgSytWz0sq/iTTW2SXDHQwmmoR/jFvL+iPFDdhh+hBIMSZibRB3CXnlKa9F73H
 qSp4p37r52VSbu5JqPRO+6CeH+2sk+i78khJsZnBycxcIrTvDo8qv/bjRU9Z5dwqsB
 cytuIQG6xpVV5NAG3rsqqmDySlodqud00MVf9uaoYXvyHaDEEGF7Qmfg09x1oeVlTu
 chvk9g2gtKNj4gr2PwF9BOt+P0uT+Yt8KVCPZdN6FUTOrgeTM6bnIG0xC4EG2F7ZdP
 1k/YwrgTIB3VubeTEAqsHGvPSYtRE5FoqNHOqF6OHYR7YjT4P3FIs82xL5tPXu8Dj9
 FYdqe2qpyxCNg==
Message-ID: <4b7101104e6775a4cbe5a0be9ad7f27fe1e28cdb.camel@collabora.com>
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
Date: Mon, 13 Mar 2023 15:11:14 -0500
In-Reply-To: <25349030-5cc6-90a2-f1d2-4f9a67c4f194@asahilina.net>
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
 <777dea65ef81c402d0765b1244b40633c483f4b2.camel@collabora.com>
 <25349030-5cc6-90a2-f1d2-4f9a67c4f194@asahilina.net>
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

On Fri, 2023-03-10 at 18:58 +0900, Asahi Lina wrote:
> On 10/03/2023 04.59, Faith Ekstrand wrote:
> > On Thu, 2023-03-09 at 18:43 +0900, Asahi Lina wrote:
> > > On 09/03/2023 17.42, Christian K=C3=B6nig wrote:
> > > > Long story short: Don't do this! This is what the Windows
> > > > drivers
> > > > have=20
> > > > been doing and it creates tons of problems.
> >=20
> > Yeah, we tried to do a bit of that in the GL days.=C2=A0 It was a bad
> > idea.
>=20
> I think I should clarify: I was proposing re-queueing innocent jobs
> from
> innocent queues/VMs that were impacted by a fault. The reason is that
> we
> may be able to tweak firmware state to force it to do that safely,
> during the firmware recovery cycle, such that an aborted job restarts
> and then subsequent jobs/commands continue as normal. We can't leave
> it
> to userspace because if we do nothing, the affected job ends up
> incomplete but then everything after it that is already queued still
> runs, and that is definitely a recipe for a bigger mess if userspace
> wants to seamlessly recover. The firmware recovery cycle is a
> "stop-the-world" situation for the GPU (the firmware literally
> busy-loops waiting for the driver to set a continue flag in
> memory...),
> so that's the only real chance that the driver gets to make decisions
> about what is going to happen next.

Ok, that makes sense.  Yes, if you have other jobs on other queues and
are able to recover everything that isn't in the faulting VM, that's a
good thing.  I wasn't sure how hang/fault recovery worked on AGX.  In
tat case, I don't think there's a dma_fence problem.  As long as you
keep recovering and killing off any faulting contexts, eventually the
good contexts should make progress and those fences should signal.

Of course, the firmware recovery cycle may be complex and need (or at
least appear to) memory allocation or similar and that's where
everything gets hairy.  Hopefully, though, if you've already got the
resources from the old context, you can re-use them after a bit of
clean-up work and still get deterministic and reliable recovery cycles.

> Of course, that only works if individual possibly concurrently
> running
> commands are idempotent, but I think a lot of typical GPU work is?

No, that's not a valid assumption.  For a single 3D render pass which
doesn't do any image or SSBO access, it may be possible to re-run it.=20
However, that won't be true of compute work and isn't necessarily true
of back-to-back passes. Lots of modern apps do temporal stuff where one
frame depends on the previous and a re-run might screw that up. Also,
with Vulkan's memory aliasing, it's hard to tell just from which
resources are accessed whether or not a command buffer leaves its input
memory undamaged.

> (E.g.
> any render pass without side effects other than the render targets
> and
> where the background shader does no loads, or even render passes that
> do
> loads but where all draws are opaque, which are all things the
> current
> Gallium driver is intimately familiar with since Crazy Tiler
> Optimizations=E2=84=A2 need that info to be provided anyway). So I was
> wondering
> whether it'd make sense to have such an idempotency/restartable flag
> on
> job submission, and then the driver would do its best to recover and
> rerun it if it gets killed by an unrelated concurrent bad job.
>=20
> Then again this all depends on an investigation into what we *can* do
> during firmware recovery that hasn't happened at all yet. It might be
> that it isn't safe to do anything really, or that doing things
> depends
> on touching even deeper firmware state structs that we treat as
> opaque
> right now and we really don't want to have to touch...
>=20
> But maybe none of this is worth it in practice, it just sounded like
> it
> could be useful maybe?

Maybe? It's not clear to me that such a flag would be useful or even
practical to provide from the Mesa side.  Ideally, you'd be able to
figure out when a fault happens, what VM it happened in and exactly
what work was in-flight when it happened and only kill the one guilty
VM.  However, it sounds like your understanding of the firmware is
currently rough enough that doing so may not be practical.  In that
case, the best thing to do is to kill any VMs which were on the GPU at
the time and hope the individual apps are able to recover.

> Now that I look at it, we have a lovely "what is this flag doing
> anyway"
> bit already passed from Mesa through to the firmware we called
> ASAHI_RENDER_SET_WHEN_RELOADING_Z_OR_S which, now that I look at it,
> is
> actually getting set when any attachment (any color, Z, S) is not
> being
> cleared for that pass (so it's loaded). That could very well be an
> "is
> not idempotent" flag... and maybe that means the firmware does this
> for
> us already? Sounds like something to test... I might have some
> 16Kx16K
> GLmark runs to do concurrent with an evil faulting job now ^^ (and
> then
> that also means we need to set it when shaders have side effects and
> stuff, which right now we don't).
>=20
> > > > Just signal the problem back to userspace and let the user
> > > > space
> > > > driver=20
> > > > decide what to do.
> > > >=20
> > > > The background is that most graphics applications (games etc..)
> > > > then=20
> > > > rather start on the next frame instead of submitting the
> > > > current
> > > > one=20
> > > > again while compute applications make sure that the abort and
> > > > tell
> > > > the=20
> > > > user that the calculations might be corrupted and need to be
> > > > redone.
> >=20
> > The guarantee that Vulkan makes is that, if you idle the GPU and
> > you
> > haven't gotten a DEVICE_LOST yet, your data is good.=C2=A0 If you get a
> > DEVICE_LOST, all bets are off.=C2=A0 The problem is that, no matter how
> > fast
> > the error propagation may be in the kernel or userspace driver,
> > errors
> > can still show up in strange ways.=C2=A0 An OOB buffer access could end
> > up
> > modifying a shader binary which gets run 3 frames later and causes
> > a
> > corruption.=C2=A0 Once you've faulted, you really have no idea how far
> > back
> > is good or what memory is corrupted.=C2=A0 You have to assume that
> > everything mapped to the GPU VA space is potentially toast.
>=20
> Yes of course, for the actually faulting VM all bets are off after a
> fault (though we can try a bit harder at least... I have a READ_ONLY
> BO
> flag now, I should set it on the shader pools!).
>=20
> > > Actually I wanted to ask about error notifications. Right now we
> > > have
> > > an
> > > out-of-band mechanism to provide detailed fault info to userspace
> > > which
> > > works fine, but in principle it's optional.
> >=20
> > This is fine, in principal.=C2=A0 Because of the nature of errors, asyn=
c
> > is
> > fine as long as the error shows up eventually.=C2=A0 Faster is better,
> > for
> > sure, but error latency doesn't really matter in practice.
> >=20
> > > However, I also mark the hw
> > > =C2=A0fences as errored when a fault happens (with an errno that
> > > describes
> > > the overall situation), but that never makes it into the
> > > drm_sched
> > > job
> > > complete fence. I looked at the drm_sched code and I didn't see
> > > any
> > > error propagation. Is that supposed to work, or am I supposed to
> > > directly mark the drm_sched side fence as complete, or did I
> > > misunderstand all this? I get the feeling maybe existing drivers
> > > just
> > > rely on the recovery/timeout/etc paths to mark jobs as errored
> > > (since
> > > those do it explicitly) and never need error forwarding from the
> > > hw
> > > fence?
> >=20
> > The end behavior needs to be that all fences for all jobs submitted
> > to
> > the queue get signaled.=C2=A0 That's needed to satisfy the finite time
> > guarantees of dma_fence.=C2=A0 Exactly how that happens (let the job
> > run,
> > abort all the jobs, etc.) is an implementation detail for the
> > driver to
> > decide.=C2=A0 If you want, you can also set a bit on the context (or
> > queue)
> > to mark it as dead and start returning EIO or similar from any
> > ioctls
> > trying to submit more work if you wanted.=C2=A0 Not required but you
> > can.
>=20
> Fences have an error flag though, does that get reported to userspace
> somehow? I thought it did, but maybe not, or maybe only drm_sched not
> propagating it is the issue?
>=20
> In other words, absent my fancy stats reporting BO system, what is
> the
> normal way that an explicit sync driver signals to userspace that the
> job associated with a syncobj has failed?

One is via the return value from exec/submit.  Often there's also a
query mechanism for more detailed information.  It's not particularly
standard at the moment, I'm afraid.  I could point you at i915 but I
wouldn't call that uAPI something to be emulated, in general.

> (If there is no way, then I'll probably want to change the stats BO
> system to be configurable, so if you ask for no stats/time info, you
> only get overall job status and faults, which has less overhead.)

There is an error but it doesn't automatically get propagated to
userspace.  So, for instance, a SYNCOBJ_WAIT ioctl won't return an
error if it sees a fence error.  It needs to get caught by the driver
and returned through a driver ioctl somehow.

~Faith

