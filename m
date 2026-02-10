Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHR1FY0Mi2lXPQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 11:46:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F086119C8F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 11:46:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4FE310E54D;
	Tue, 10 Feb 2026 10:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jyfhBqGi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B433510E54D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 10:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770720391;
 bh=fcXLEs3iKoX0LK0VD+rgm08IUhQC12HKMryXdl56JOw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jyfhBqGi/dHT4li4/P+k0XGMF7uF0DAmxArybxYbeRn+bT7tdecQREXq/IDKDdTaC
 hU9X3/8gbsyxzN7mpAd/tjXicAObOE5YUu7oDtu1X0F+iBFqgLWKPCRJiYUPcYnxi2
 oLfojrulJ/l3m5rrv+PL9dXbpBgo7VYZNnlILCHy7tyr60BYwxeu8/OSo5ctdkvFU4
 jxckZhy5s8pT//k7rsevbh3UXOYeWw5i64bwQUbhxDzePhiy8eMqYi5QPO2tZmw/W5
 dA3nnNCuvzzlm82wK+TRrvX6gsraEHlog4zie1jNxImyfURX6SPYc+7n1k36WR74d1
 +tjT/TixCJEHw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8D43F17E0E6A;
 Tue, 10 Feb 2026 11:46:30 +0100 (CET)
Date: Tue, 10 Feb 2026 11:46:23 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: "Christian =?UTF-8?B?S8O2bmln?=" <christian.koenig@amd.com>, Philipp
 Stanner <phasta@mailbox.org>, phasta@kernel.org, Danilo Krummrich
 <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Gary Guo <gary@garyguo.net>, Benno Lossin
 <lossin@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Joel
 Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
Message-ID: <20260210114623.65485df3@fedora>
In-Reply-To: <aYsFKOVrsMQeAHoi@google.com>
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-4-phasta@kernel.org>
 <20260205095727.4c3e2941@fedora>
 <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:christian.koenig@amd.com,m:phasta@mailbox.org,m:phasta@kernel.org,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gary@garyguo.net,m:lossin@kernel.org,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,mailbox.org,kernel.org,gmail.com,ffwll.ch,garyguo.net,collabora.com,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9F086119C8F
X-Rspamd-Action: no action

On Tue, 10 Feb 2026 10:15:04 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Tue, Feb 10, 2026 at 10:15:25AM +0100, Boris Brezillon wrote:
> > On Tue, 10 Feb 2026 08:38:00 +0000
> > Alice Ryhl <aliceryhl@google.com> wrote:
> >  =20
> > > On Tue, Feb 10, 2026 at 09:16:34AM +0100, Christian K=C3=B6nig wrote:=
 =20
> > > > On 2/9/26 15:58, Boris Brezillon wrote:   =20
> > > > > On Mon, 09 Feb 2026 09:19:46 +0100
> > > > > Philipp Stanner <phasta@mailbox.org> wrote:
> > > > >    =20
> > > > >> On Fri, 2026-02-06 at 11:23 +0100, Danilo Krummrich wrote:   =20
> > > > >>> On Thu Feb 5, 2026 at 9:57 AM CET, Boris Brezillon wrote:     =
=20
> > > > >>>> On Tue,=C2=A0 3 Feb 2026 09:14:01 +0100
> > > > >>>> Philipp Stanner <phasta@kernel.org> wrote:
> > > > >>>> Unfortunately, I don't know how to translate that in rust, but=
 we
> > > > >>>> need a way to check if any path code path does a DmaFence.sign=
al(),
> > > > >>>> go back to the entry point (for a WorkItem, that would be
> > > > >>>> WorkItem::run() for instance), and make it a DmaFenceSignallin=
gPath.
> > > > >>>> Not only that, but we need to know all the deps that make it so
> > > > >>>> this path can be called (if I take the WorkItem example, that =
would
> > > > >>>> be the path that leads to the WorkItem being scheduled).     =
=20
> > > > >>>
> > > > >>> I think we need a guard object for this that is not Send, just =
like for any
> > > > >>> other lock.
> > > > >>>
> > > > >>> Internally, those markers rely on lockdep, i.e. they just acqui=
re and release a
> > > > >>> "fake" lock.     =20
> > > > >>
> > > > >> The guard object would be created through fence.begin_signalling=
(), wouldn't it?   =20
> > > > >=20
> > > > > It shouldn't be a (&self)-method, because at the start of a DMA
> > > > > signaling path, you don't necessarily know which fence you're goi=
ng to
> > > > > signal (you might actually signal several of them).
> > > > >    =20
> > > > >> And when it drops you call dma_fence_end_signalling()?   =20
> > > > >=20
> > > > > Yep, dma_fence_end_signalling() should be called when the guard is
> > > > > dropped.
> > > > >    =20
> > > > >>
> > > > >> How would that ensure that the driver actually marks the signall=
ing region correctly?   =20
> > > > >=20
> > > > > Nothing, and that's a problem we have in C: you have no way of te=
lling
> > > > > which code section is going to be a DMA-signaling path. I can't t=
hink
> > > > > of any way to make that safer in rust, unfortunately. The best I =
can
> > > > > think of would be to
> > > > >=20
> > > > > - Have a special DmaFenceSignalWorkItem (wrapper a WorkItem with =
extra
> > > > >   constraints) that's designed for DMA-fence signaling, and that =
takes
> > > > >   the DmaSignaling guard around the ::run() call.
> > > > > - We would then need to ensure that any code path scheduling this=
 work
> > > > >   item is also in a DMA-signaling path by taking a ref to the
> > > > >   DmaSignalingGuard. This of course doesn't guarantee that the se=
ction
> > > > >   is wide enough to prevent any non-authorized operations in any =
path
> > > > >   leading to this WorkItem scheduling, but it would at least forc=
e the
> > > > >   caller to consider the problem.   =20
> > > >=20
> > > > On the C side I have a patch set which does something very similar.
> > > >=20
> > > > It's basically a WARN_ON_ONCE() which triggers as soon as you try to
> > > > signal a DMA fence from an IOCTL, or more specific process context.
> > > >=20
> > > > Signaling a DMA fence from interrupt context, a work item or kernel
> > > > thread is still allowed, there is just the hole that you can schedu=
le
> > > > a work item from process context as well.
> > > >=20
> > > > The major problem with that patch set is that we have tons of very
> > > > hacky signaling paths in drivers already because we initially didn't
> > > > knew how much trouble getting this wrong causes.
> > > >=20
> > > > I'm strongly in favor of getting this right for the rust side from =
the
> > > > beginning and enforcing strict rules for every code trying to
> > > > implement a DMA fence.   =20
> > >=20
> > > Hmm. Could you say a bit more about what the rules are? I just re-read
> > > the comments in dma-fence.c, but I have some questions.
> > >=20
> > > First, how does the signalling annotation work when the signalling pa=
th
> > > crosses thread boundaries? =20
> >=20
> > It's not supposed to cross the thread boundary at all. The annotation
> > is per-thread, and it that sense, it matches the lock guard model
> > perfectly.
> >  =20
> > > For example, let's say I call an ioctl to
> > > perform an async VM_BIND, then the dma fence signalling critical path
> > > starts in the ioctl, but then it moves into a workqueue and finishes
> > > there, right? =20
> >=20
> > It's a bit trickier. The fence signalling path usually doesn't exist in
> > the submitting ioctl until the submission becomes effective and the
> > emitted fences are exposed to the outside world. That is, when:
> > - syncobjs are updated to point to this new fence
> > - fencefd pointing to this new fence is returned
> > - fence is added to the dma_resvs inside the gem/dma_buf objects
> > - ... (there might be other cases I forgot about)
> >=20
> > In the submission path, what's important is that no blocking allocation
> > is done between the moment the fence is exposed, and the moment it's
> > queued. In practice what happens is that the job this fence is bound to
> > is queued even before the fences are exposed, so if anything, what we
> > should ensure is the ordering, and having a guarantee that a job being
> > queued means it's going to be dequeued and executed soon enough.
> >=20
> > The second DMA signaling path exists in the context of the
> > workqueue/item dequeuing a job from the JobQueue (or drm_sched) and
> > pushing it to the HW. Then there's the IRQ handler being called to
> > inform the GPU is done executing this job, which might in some cases
> > lead to another work item being queued for further processing from
> > which the dma_fence is signaled. In other cases, the dma_fence is
> > signaled directly from the IRQ handler. All of these contexts are
> > considered being part of the DMA-signaling path. But it's not like the
> > fence signaling annotation is passed around, because the cookies
> > returned by dma_fence_begin_signalling() are only valid in a single
> > thread context, IIRC. =20
>=20
> Ok I understand what's going on now.
>=20
> You talk about it as-if there are two signalling paths, one in the ioctl
> and another in the workqueue. But that sounds like a workaround to make
> it work with how dma_fence_begin_signalling() is implemented, and not
> the true situation. (Added: looks like Christian confirms this.)
>=20
> One way you can see this is by looking at what we require of the
> workqueue. For all this to work, it's pretty important that we never
> schedule anything on the workqueue that's not signalling safe, since
> otherwise you could have a deadlock where the workqueue is executes some
> random job calling kmalloc(GFP_KERNEL) and then blocks on our fence,
> meaning that the VM_BIND job never gets scheduled since the workqueue
> is never freed up. Deadlock.

That's correct. I mean, I don't remember all the details around
workqueues, and it might be that a workqueue can be backed by multiple
threads, with new threads being spawned if things take too long. But
one of the reason most DRM drivers create their own workqueue is also
that they want to control what runs on it.

>=20
> And the correct way to model the above in lockdep is to have the DMA
> fence lockdep key be nested *outside* the lockdep key of the workqueue.
> Because there is a step in the signalling path where you wait for other
> jobs to complete before the signalling path is able to continue.

Yep, if the workqueue is shared, and non-DMA-signaling work items get
queued, they de-facto impact the DMA-signaling work items, and they
should be considered part of the DMA-signaling path too.

>=20
> And the meaning of such a lockdep dependency is exactly that the
> critical region moves from one thread to another.

We can see it like that. I was more referring to how this translate in
lockdep terms: that is, begin/end_signaling() need to be called in the
same thread, and any new thread which we know is going to help progress
on fence signaling needs to have its own begin/end_signaling(), no
matter how it's done (hopefully it's all automatic in rust).

>=20
>=20
> Perhaps we could have an API like this:
>=20
> // Split the DriverDmaFence into two separate fence concepts:
> struct PrivateFence { ... }
> struct PublishedFence { ... }
>=20
> /// The owner of this value must ensure that this fence is signalled.
> struct MustBeSignalled<'fence> { ... }
> /// Proof value indicating that the fence has either already been
> /// signalled, or it will be. The lifetime ensures that you cannot mix
> /// up the proof value.
> struct WillBeSignalled<'fence> { ... }
>=20
> /// Create a PublishedFence by entering a region that promises to signal
> /// it.
> ///
> /// The only way to return from the `region` closure it to construct a
> /// WillBeSignalled value, and the only way to do that (see below) is to
> /// signal it, or spawn a workqueue job that promises to signal it.
> /// (Since the only way for that workqueue job to exit is to construct a
> /// second WillBeSignalled value.)
> fn dma_fence_begin_signalling(
>     fence: PrivateFence,
>     region: impl for<'f> FnOnce(MustBeSignalled<'f>) -> WillBeSignalled<'=
f>,
> ) -> PublishedFence {
>     let cookie =3D bindings::dma_fence_begin_signalling();
>=20
>     region(<create token here>);
>=20
>     bindings::dma_fence_end_signalling(cookie);
>=20
>     fence.i_promise_it_will_be_signalled();
> }
>=20
> impl MustBeSignalled<'_> {
>     /// Drivers generally should not use this one.
>     fn i_promise_it_will_be_signalled(self) -> WillBeSignalled { ... }
>=20
>     /// One way to ensure the fence has been signalled is to signal it.
>     fn signal_fence(self) -> WillBeSignalled {
>         self.fence.signal();
>         self.i_promise_it_will_be_signalled()
>     }
>=20
>     /// Another way to ensure the fence will be signalled is to spawn a
>     /// workqueue item that promises to signal it.
>     fn transfer_to_wq(
>         self,
>         wq: &Workqueue,
>         item: impl DmaFenceWorkItem,
>     ) -> WillBeSignalled {
>         // briefly obtain the lock class of the wq to indicate to
>         // lockdep that the signalling path "blocks" on arbitrary jobs
>         // from this wq completing
>         bindings::lock_acquire(&wq->key);
>         bindings::lock_release(&wq->key);
>=20
>         // enqueue the job
>         wq.enqueue(item, wq);
>=20
>         // The signature of DmaFenceWorkItem::run() promises to arrange
>         // for it to be signalled.
>         self.i_promise_it_will_be_signalled()
>     }
> }
>=20
> trait DmaFenceWorkItem {
>     fn run<'f>(self, fence: MustBeSignalled<'f>) -> WillBeSignalled<'f>;
> }
>=20
>=20
> with this API, the ioctl can do this:
>=20
> let published_fence =3D dma_fence_begin_signalling(|fence| {
>     fence.transfer_to_wq(my_wq, my_work_item)
> });
> somehow_publish_the_fence_to_userspace(published_fence);
>=20
> And we're ensured that the fence is really signalled because the
> signature of the work item closure is such that it can only return from
> DmaFenceWorkItem::run() by signalling the fence (or spawning it to a
> second workqueue, which in turn promises to signal it).
>=20
> Of course, the signature only enforces that the fence is (or will be)
> signalled if you return. One can still put an infinite loop inside
> dma_fence_begin_signalling() and avoid signalling it, but there's
> nothing we can do about that.

At first glance it seems to enforce what we want to enforce, but I'll
have a closer look to try and understand all the subtleties.

Thanks a lot for bringing up your expertise to this discussion, that's
super helpful.
