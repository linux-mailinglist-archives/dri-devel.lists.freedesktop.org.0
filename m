Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CI4LO1pgqWnj6QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 11:52:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 473B7210077
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 11:52:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F7AB10E279;
	Thu,  5 Mar 2026 10:52:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="HVjMb4Zw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8BAC10E272;
 Thu,  5 Mar 2026 10:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1772707925;
 bh=uOSvOEA86snVkC8Rsx48dLtVGDeiD89MLov76NFaq8w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HVjMb4ZwOpu4rm4ZIEj30Fh6x0FIGlxgbD+htP0il6UMt+1gk16K06mubq0IBZ2Pk
 1mnPhcamjRzDWKY3sYFFFx57P9gZLz2vhzXMcGZXPbrFWJt7vdg3zMZhubVl2YZSQm
 l5BZgvLcklm6B+Y+rBiT05WwppVnRM6dbX6gE1EEBkI02C+naT1JplZ8WF+vL1z7uF
 eYoX+jareCn/DWI3y3xn3uNUDzKFNHigBmdE1yMnpYiRO0zGWCuKQT/9fAjXj577xJ
 0I476bOmbwvS8viVlYCA0T5JbPHcgv0loAGXQ9oVQNqO1eveNY8/MefiU2O1La7bKR
 5Vq+X1Drs73aw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5CF9E17E1274;
 Thu,  5 Mar 2026 11:52:04 +0100 (CET)
Date: Thu, 5 Mar 2026 11:52:01 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Chia-I Wu <olvaffe@gmail.com>, ML dri-devel
 <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 "Steven Price" <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Danilo Krummrich
 <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, Christian
 =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>, Thomas
 =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>, open list <linux-kernel@vger.kernel.org>,
 <tj@kernel.org>
Subject: Re: drm_sched run_job and scheduling latency
Message-ID: <20260305115201.6fb044f0@fedora>
In-Reply-To: <aalWTOZSNYcKpvdd@lstrano-desk.jf.intel.com>
References: <CAPaKu7RbCtkz1BbX57+CebB2uepyCAi-3QzBy8BDGngCJ-Du0w@mail.gmail.com>
 <aajkqXZDGUFPlq1o@lstrano-desk.jf.intel.com>
 <20260305092711.20069ca1@fedora>
 <aalWTOZSNYcKpvdd@lstrano-desk.jf.intel.com>
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
X-Rspamd-Queue-Id: 473B7210077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,arm.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,intel.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,collabora.com:dkim]
X-Rspamd-Action: no action

On Thu, 5 Mar 2026 02:09:16 -0800
Matthew Brost <matthew.brost@intel.com> wrote:

> On Thu, Mar 05, 2026 at 09:27:11AM +0100, Boris Brezillon wrote:
>=20
> I addressed most of your comments in a chained reply to Phillip, but I
> guess he dropped some of your email and thus missed those. Responding
> below.
>=20
> > Hi Matthew,
> >=20
> > On Wed, 4 Mar 2026 18:04:25 -0800
> > Matthew Brost <matthew.brost@intel.com> wrote:
> >  =20
> > > On Wed, Mar 04, 2026 at 02:51:39PM -0800, Chia-I Wu wrote: =20
> > > > Hi,
> > > >=20
> > > > Our system compositor (surfaceflinger on android) submits gpu jobs
> > > > from a SCHED_FIFO thread to an RT gpu queue. However, because
> > > > workqueue threads are SCHED_NORMAL, the scheduling latency from sub=
mit
> > > > to run_job can sometimes cause frame misses. We are seeing this on
> > > > panthor and xe, but the issue should be common to all drm_sched use=
rs.
> > > >    =20
> > >=20
> > > I'm going to assume that since this is a compositor, you do not pass
> > > input dependencies to the page-flip job. Is that correct?
> > >=20
> > > If so, I believe we could fairly easily build an opt-in DRM sched path
> > > that directly calls run_job in the exec IOCTL context (I assume this =
is
> > > SCHED_FIFO) if the job has no dependencies. =20
> >=20
> > I guess by ::run_job() you mean something slightly more involved that
> > checks if:
> >=20
> > - other jobs are pending
> > - enough credits (AKA ringbuf space) is available
> > - and probably other stuff I forgot about
> >  =20
> > >=20
> > > This would likely break some of Xe=E2=80=99s submission-backend assum=
ptions
> > > around mutual exclusion and ordering based on the workqueue, but that
> > > seems workable. I don=E2=80=99t know how the Panthor code is structur=
ed or
> > > whether they have similar issues. =20
> >=20
> > Honestly, I'm not thrilled by this fast-path/call-run_job-directly idea
> > you're describing. There's just so many things we can forget that would
> > lead to races/ordering issues that will end up being hard to trigger and
> > debug. Besides, it doesn't solve the problem where your gfx pipeline is
> > fully stuffed and the kernel has to dequeue things asynchronously. I do
> > believe we want RT-prio support in that case too.
> >  =20
>=20
> My understanding of SurfaceFlinger is that it never waits on input
> dependencies from rendering applications, since those may not signal in
> time for a page flip. Because of that, you can=E2=80=99t have the job(s) =
that
> draw to the screen accept input dependencies. Maybe I have that
> wrong=E2=80=94but I've spoken to the Google team several times about issu=
es with
> SurfaceFlinger, and that was my takeaway.
>=20
> So I don't think the kernel should ever have to dequeue things
> asynchronously, at least for SurfaceFlinger.

There's still the contention coming from the ring buffer size, which can
prevent jobs from being queued directly to the HW, though, admittedly,
if the HW is not capable of compositing the frame faster than the
refresh rate, and guarantee an almost always empty ringbuffer, fixing
the scheduling prio is probably pointless.

> If there is another RT use
> case that requires input dependencies plus the kernel dequeuing things
> asynchronously, I agree this wouldn=E2=80=99t help=E2=80=94but my suggest=
ion also isn=E2=80=99t
> mutually exclusive with other RT rework either.

Yeah, dunno. It just feels like another hack on top of the already quite
convoluted design that drm_sched has become.

>=20
> > >=20
> > > I can try to hack together a quick PoC to see what this would look li=
ke
> > > and give you something to test.
> > >  =20
> > > > Using a WQ_HIGHPRI workqueue helps, but it is still not RT (and won=
't
> > > > meet future android requirements). It seems either workqueue needs =
to
> > > > gain RT support, or drm_sched needs to support kthread_worker.   =20
> > >=20
> > > +Tejun to see if RT workqueue is in the plans. =20
> >=20
> > Dunno how feasible that is, but that would be my preferred option.
> >  =20
> > >  =20
> > > >=20
> > > > I know drm_sched switched from kthread_worker to workqueue for bett=
er
> > > > scaling when xe was introduced. But if drm_sched can support either
> > > > workqueue or kthread_worker during drm_sched_init, drivers can
> > > > selectively use kthread_worker only for RT gpu queues. And because
> > > > drivers require CAP_SYS_NICE for RT gpu queues, this should not cau=
se
> > > > scaling issues.
> > > >    =20
> > >=20
> > > I don=E2=80=99t think having two paths will ever be acceptable, nor d=
o I think
> > > supporting a kthread would be all that easy. For example, in Xe we qu=
eue
> > > additional work items outside of the scheduler on the queue for order=
ing
> > > reasons =E2=80=94 we=E2=80=99d have to move all of that code down int=
o DRM sched or
> > > completely redesign our submission model to avoid this. I=E2=80=99m n=
ot sure if
> > > other drivers also do this, but it is allowed. =20
> >=20
> > Panthor doesn't rely on the serialization provided by the single-thread
> > workqueue, Panfrost might rely on it though (I don't remember). I agree
> > that maintaining a thread and workqueue based scheduling is not ideal
> > though.
> >  =20
> > >  =20
> > > > Thoughts? Or perhaps this becomes less of an issue if all drm_sched
> > > > users have concrete plans for userspace submissions..   =20
> > >=20
> > > Maybe some day.... =20
> >=20
> > I've yet to see a solution where no dma_fence-based signalization is
> > involved in graphics workloads though (IIRC, Arm's solution still
> > needs the kernel for that). Until that happens, we'll still need the
> > kernel to signal fences asynchronously when the job is done, which I
> > suspect will cause the same kind of latency issue...
> >  =20
>=20
> I don't think that is the problem here. Doesn=E2=80=99t the job that draw=
s the
> frame actually draw it, or does the display wait on the draw job=E2=80=99=
s fence
> to signal and then do something else?

I know close to nothing about SurfaceFlinger and very little about
compositors in general, so I'll let Chia answer that one. What's sure
is that, on regular page-flips (don't remember what async page-flips
do), the display drivers wait on the fences attached to the buffer to
signal before doing the flip.

> (Sorry=E2=80=94I know next to nothing
> about display.) Either way, fences should be signaled in IRQ handlers,

In Panthor they are not, but that's probably something for us to
address.

> which presumably don=E2=80=99t have the same latency issues as workqueues=
, but I
> could be mistaken.

Might have to do with the mental model I had of this "reconcile
Usermode queues with dma_fence signaling" model, where I was imagining
a SW job queue (based on drm_sched too) that would wait on HW fences to
be signal and would as a result signal the dma_fence attached to the
job. So the queueing/dequeuing of these jobs would still happen through
drm_sched, with the same scheduling prio issue. This being said, those
jobs would likely be dependency less, so more likely to hit your
fast-path-run-job.
