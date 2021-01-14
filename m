Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E05C02F58E3
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 04:27:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 446E5898A4;
	Thu, 14 Jan 2021 03:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E646898A4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 03:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610594841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dfTm9isnE1zGSRnUBOFXkHkiidWlW552qwMDPpoU2IA=;
 b=S2OgtAzfHOFltNsaydtxpiepgGhJkgRYDQd6gdfWvudFuFt4ub10kjw17yUN5rkpA3n6qa
 BxrTJRs/Kk5JkouieU5n0ta2tReoBcYNjGS073tiOHrVvUhEukfyvgOgy9OqDucILHAx49
 Iws6XpuUqUcFKUE8XEuYz+Q7Pt0x0PA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-Gd6lNX1SMkCM1-D-YHBvXA-1; Wed, 13 Jan 2021 22:27:18 -0500
X-MC-Unique: Gd6lNX1SMkCM1-D-YHBvXA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8B29806661;
 Thu, 14 Jan 2021 03:27:16 +0000 (UTC)
Received: from redhat.com (ovpn-112-31.rdu2.redhat.com [10.10.112.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C1DA760C0F;
 Thu, 14 Jan 2021 03:27:15 +0000 (UTC)
Date: Wed, 13 Jan 2021 22:27:13 -0500
From: Jerome Glisse <jglisse@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 00/35] Add HMM-based SVM memory manager to KFD
Message-ID: <20210114032713.GD535630@redhat.com>
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
 <X/bTFWL3HYVc8LEF@phenom.ffwll.local>
 <6daf9ebc-507e-6e83-04dd-d7c5fc6998d6@amd.com>
 <X/hux3eX8Ywf61h7@phenom.ffwll.local>
 <20210113165646.GB521755@redhat.com>
 <CAKMK7uEiYXHp99mUkmMcQVJTdWgHQWOZpDJ1vfNYacKghbtYtw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKMK7uEiYXHp99mUkmMcQVJTdWgHQWOZpDJ1vfNYacKghbtYtw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jglisse@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
Cc: Alex Sierra <alex.sierra@amd.com>, "Yang, Philip" <philip.yang@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 13, 2021 at 09:31:11PM +0100, Daniel Vetter wrote:
> On Wed, Jan 13, 2021 at 5:56 PM Jerome Glisse <jglisse@redhat.com> wrote:
> > On Fri, Jan 08, 2021 at 03:40:07PM +0100, Daniel Vetter wrote:
> > > On Thu, Jan 07, 2021 at 11:25:41AM -0500, Felix Kuehling wrote:
> > > > Am 2021-01-07 um 4:23 a.m. schrieb Daniel Vetter:
> > > > > On Wed, Jan 06, 2021 at 10:00:52PM -0500, Felix Kuehling wrote:
> > > > >> This is the first version of our HMM based shared virtual memory=
 manager
> > > > >> for KFD. There are still a number of known issues that we're wor=
king through
> > > > >> (see below). This will likely lead to some pretty significant ch=
anges in
> > > > >> MMU notifier handling and locking on the migration code paths. S=
o don't
> > > > >> get hung up on those details yet.
> > > > >>
> > > > >> But I think this is a good time to start getting feedback. We're=
 pretty
> > > > >> confident about the ioctl API, which is both simple and extensib=
le for the
> > > > >> future. (see patches 4,16) The user mode side of the API can be =
found here:
> > > > >> https://github.com/RadeonOpenCompute/ROCT-Thunk-Interface/blob/f=
xkamd/hmm-wip/src/svm.c
> > > > >>
> > > > >> I'd also like another pair of eyes on how we're interfacing with=
 the GPU VM
> > > > >> code in amdgpu_vm.c (see patches 12,13), retry page fault handli=
ng (24,25),
> > > > >> and some retry IRQ handling changes (32).
> > > > >>
> > > > >>
> > > > >> Known issues:
> > > > >> * won't work with IOMMU enabled, we need to dma_map all pages pr=
operly
> > > > >> * still working on some race conditions and random bugs
> > > > >> * performance is not great yet
> > > > > Still catching up, but I think there's another one for your list:
> > > > >
> > > > >  * hmm gpu context preempt vs page fault handling. I've had a sho=
rt
> > > > >    discussion about this one with Christian before the holidays, =
and also
> > > > >    some private chats with Jerome. It's nasty since no easy fix, =
much less
> > > > >    a good idea what's the best approach here.
> > > >
> > > > Do you have a pointer to that discussion or any more details?
> > >
> > > Essentially if you're handling an hmm page fault from the gpu, you can
> > > deadlock by calling dma_fence_wait on a (chain of, possibly) other co=
mmand
> > > submissions or compute contexts with dma_fence_wait. Which deadlocks =
if
> > > you can't preempt while you have that page fault pending. Two solutio=
ns:
> > >
> > > - your hw can (at least for compute ctx) preempt even when a page fau=
lt is
> > >   pending
> > >
> > > - lots of screaming in trying to come up with an alternate solution. =
They
> > >   all suck.
> > >
> > > Note that the dma_fence_wait is hard requirement, because we need tha=
t for
> > > mmu notifiers and shrinkers, disallowing that would disable dynamic m=
emory
> > > management. Which is the current "ttm is self-limited to 50% of system
> > > memory" limitation Christian is trying to lift. So that's really not
> > > a restriction we can lift, at least not in upstream where we need to =
also
> > > support old style hardware which doesn't have page fault support and
> > > really has no other option to handle memory management than
> > > dma_fence_wait.
> > >
> > > Thread was here:
> > >
> > > https://lore.kernel.org/dri-devel/CAKMK7uGgoeF8LmFBwWh5mW1k4xWjuUh3hd=
SFpVH1NBM7K0=3DedA@mail.gmail.com/
> > >
> > > There's a few ways to resolve this (without having preempt-capable
> > > hardware), but they're all supremely nasty.
> > > -Daniel
> > >
> >
> > I had a new idea, i wanted to think more about it but have not yet,
> > anyway here it is. Adding a new callback to dma fence which ask the
> > question can it dead lock ? Any time a GPU driver has pending page
> > fault (ie something calling into the mm) it answer yes, otherwise
> > no. The GPU shrinker would ask the question before waiting on any
> > dma-fence and back of if it gets yes. Shrinker can still try many
> > dma buf object for which it does not get a yes on associated fence.
> =

> Having that answer on a given fence isn't enough, you still need to
> forward that information through the entire dependency graph, across
> drivers. That's the hard part, since that dependency graph is very
> implicit in the code, and we'd need to first roll it out across all
> drivers.

Here i am saying do not wait on fence for which you are not sure.
Only wait on fence for which you are 100% certain you can not dead
lock. So if you can never be sure on dma fence then never wait on
dma-fence in the shrinker. However most driver should have enough
information in their shrinker to know if it is safe to wait on
fence internal to their device driver (and also know if any of
those fence has implicit outside dependency). So first implementation
would be to say always deadlock and then having each driver build
confidence into what it can ascertain.

> =

> > This does not solve the mmu notifier case, for this you would just
> > invalidate the gem userptr object (with a flag but not releasing the
> > page refcount) but you would not wait for the GPU (ie no dma fence
> > wait in that code path anymore). The userptr API never really made
> > the contract that it will always be in sync with the mm view of the
> > world so if different page get remapped to same virtual address
> > while GPU is still working with the old pages it should not be an
> > issue (it would not be in our usage of userptr for compositor and
> > what not).
> >
> > Maybe i overlook something there.
> =

> tbh I'm never really clear on how much exactly we need, and whether
> maybe the new pin/unpin api should fix it all.

pin/unpin is not a solution it is to fix something with GUP (where
we need to know if a page is GUPed or not). GUP should die longterm
so anything using GUP (pin/unpin falls into that) should die longterm.
Pining memory is bad period (it just breaks too much mm and it is
unsolvable for things like mremap, splice, ...).

Cheers,
J=C3=A9r=C3=B4me

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
