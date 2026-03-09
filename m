Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SK2oDNiBrmlfFQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 09:16:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AFE235668
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 09:16:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9BF510E13F;
	Mon,  9 Mar 2026 08:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="oanmKicT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DE910E4A0
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 08:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1773044179;
 bh=x3Z5KoEwZB4ezSphq/oYkBNg31z8DD/TEsQ/5nYzjIU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oanmKicTTEWGJxXYUuUktpLR/VcG8sP2uOA6xCN0TpvKoFz9tsxMLHCB3ggmeYC18
 tRYP4HppoaUl5hlY2LYa3CAscjEyRemkHRjWeB4PXuSPuIWkf0A5px6DZKQo1kvJGQ
 QkD6ziBaVOXBH+kefQBy7bsrwViJFa2G1JMvYqRbp2SEZPYnSHn8wWy0rJKpKnV66v
 +Br9xnzHHh/gfB1dfYi4CAHL2B4S4XC0T84nKi6vW19fDddmWVhx9SkH3IGcOFRCd8
 UwCSHQ2108Ol/4q6GeVfSBu08lFLQY55Xb6t5qOymGqIcc7JBwtb4bQYDRJw16V5+w
 Xl6cRO518OMig==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D347717E005F;
 Mon,  9 Mar 2026 09:16:18 +0100 (CET)
Date: Mon, 9 Mar 2026 09:16:13 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Philipp Stanner <phasta@mailbox.org>
Cc: phasta@kernel.org, Christian =?UTF-8?B?S8O2bmln?= 
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Tvrtko
 Ursulin  <tvrtko.ursulin@igalia.com>, dri-devel
 <dri-devel@lists.freedesktop.org>
Subject: Re: dma_fence: force users to take the lock manually
Message-ID: <20260309091613.427a3d2c@fedora>
In-Reply-To: <d7bc1e7a0d33c675ef42135717ceee604bf0876b.camel@mailbox.org>
References: <080395923c92ef758ca6062f1e01392186413015.camel@mailbox.org>
 <718ad034-8fc2-4b43-9b04-729c5befc3ca@amd.com>
 <20260305161212.7dfbadbd@fedora>
 <e8b47e9f-f8cd-4be4-953a-931816e5f429@amd.com>
 <20260306104646.36319162@fedora>
 <9718fa34-95f7-4461-9d01-2ad4eed60b14@amd.com>
 <20260306113723.1f13010c@fedora>
 <b5830a15-af9f-47b0-a811-d43c0c3828dd@amd.com>
 <20260306122417.6febebf4@fedora>
 <6246da89fed7669247527fc36bfee5d92ada96e3.camel@mailbox.org>
 <0009b35c-265f-43ff-84bc-39fbf7109a3d@amd.com>
 <87197ff8d812debbd348ccb2befff855b30abb31.camel@mailbox.org>
 <DGVPXPMB8JB3.3VWBBX3YOK3G5@kernel.org>
 <c3a23b78-68ec-4ee3-b142-3ebf0131a0ce@amd.com>
 <63dc8c72baac42199ede72b153fdec71e0b4fe9e.camel@mailbox.org>
 <90b8cc84-7fdb-4116-827a-3fe95b4a8119@amd.com>
 <20260306162525.7ff98df5@fedora> <20260306164315.42524bf0@fedora>
 <d7bc1e7a0d33c675ef42135717ceee604bf0876b.camel@mailbox.org>
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
X-Rspamd-Queue-Id: 92AFE235668
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:phasta@mailbox.org,m:phasta@kernel.org,m:christian.koenig@amd.com,m:dakr@kernel.org,m:tvrtko.ursulin@igalia.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,collabora.com:dkim,collabora.com:email]
X-Rspamd-Action: no action

On Fri, 06 Mar 2026 20:02:58 +0100
Philipp Stanner <phasta@mailbox.org> wrote:

> On Fri, 2026-03-06 at 16:43 +0100, Boris Brezillon wrote:
> > On Fri, 6 Mar 2026 16:25:25 +0100
> > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> >  =20
> > > On Fri, 6 Mar 2026 15:37:31 +0100
> > > Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> > >  =20
> > > > On 3/6/26 14:36, Philipp Stanner wrote:=C2=A0  =20
> > > > > > > > > In other words not signaling a fence can leave the system=
 in a
> > > > > > > > > deadlock state, but signaling it incorrectly usually resu=
lts in
> > > > > > > > > random data corruption.=C2=A0=C2=A0=C2=A0  =20
> > > > > > >=20
> > > > > > > Well, not signaling it results in a potential deadlock of the
> > > > > > > whole kernel, whereas wrongly signaling it is "only" a functi=
onal
> > > > > > > bug.=C2=A0=C2=A0=C2=A0  =20
> > > > > >=20
> > > > > > No, that results in random memory corruption. Which is easily a
> > > > > > magnitude worse than just a kernel deadlock.
> > > > > >=20
> > > > > > When have seen such bugs numerous times with suspend and resume=
 on
> > > > > > laptops in different subsystems, e.g. not only GPU. And I'm
> > > > > > absolutely clearly rejecting any attempt to signal DMA fences w=
hen
> > > > > > an object runs out of scope because of that experience.=C2=A0=
=C2=A0=C2=A0  =20
> > > > >=20
> > > > > But you're aware that both in C and Rust you could experience UAF
> > > > > bugs if fences drop unsignaled and the driver unloads?
> > > > >=20
> > > > > Though I tentatively agree that memory corruptions on a large sca=
le
> > > > > are probably the worst error you can have on a computer.=C2=A0=C2=
=A0=C2=A0  =20
> > > >=20
> > > > Yeah, of course I'm aware of the UAF issue we have.
> > > >=20
> > > > But those are relatively harmless compared to the random memory
> > > > corruption issues.
> > > >=20
> > > > Linux has the unfortunate habit of re-using memory directly after
> > > > freeing it because that means caches are usually hotter.
> > > >=20
> > > > So rough DMA operations have the tendency to end up anywhere and
> > > > tools like KASAN can't find anything wrong.
> > > >=20
> > > > The only protection you sometimes have is IOMMU, but that is usually
> > > > not able to catch everything either.
> > > > =C2=A0  =20
> > > > > > =C2=A0=C2=A0  =20
> > > > > > > > It all stands and falls with the question whether a fence c=
an
> > > > > > > > drop by accident in Rust, or if it will only ever drop when=
 the
> > > > > > > > hw-ring is closed.
> > > > > > > >=20
> > > > > > > > What do you believe is the right thing to do when a driver
> > > > > > > > unloads?=C2=A0=C2=A0=C2=A0  =20
> > > > > > >=20
> > > > > > > The fence has to be signaled -- ideally after shutting down a=
ll
> > > > > > > queues, but it has to be signaled.=C2=A0=C2=A0=C2=A0  =20
> > > > > >=20
> > > > > > Yeah well this shutting down all queues (and making sure that no
> > > > > > write operation is pending in caches etc...) is what people
> > > > > > usually don't get right.
> > > > > >=20
> > > > > > What you can to is things like setting your timeout to zero and
> > > > > > immediately causing terminating the HW operation and resetting =
the
> > > > > > device.
> > > > > >=20
> > > > > > This will then use the same code path as the mandatory timeout
> > > > > > functionality for DMA operations and that usually works reliabl=
e.=C2=A0=C2=A0=C2=A0  =20
> > > > >=20
> > > > > Why is all that even an issue? The driver controls the hardware a=
nd
> > > > > must "switch it off" before it unloads. Then the hardware will not
> > > > > access any memory anymore for sure.=C2=A0=C2=A0=C2=A0  =20
> > > >=20
> > > > Well exactly that is usually really complicated. Let me try to
> > > > explain that on a HW example.=20
> > > >=20
> > > > Between a shader and the actual system memory you usually have
> > > > different IP blocks or stages where a memory access needs to go
> > > > through:
> > > >=20
> > > > Shader -> device VM -> device cache -> PCI bus -> CPU cache -> memo=
ry
> > > >=20
> > > > Now when you want to terminate some shader or make some memory
> > > > inaccessible because it is freed drivers update their page tables a=
nd
> > > > issue the equivalent of TLB invalidation on a CPU.
> > > >=20
> > > > The problem is now that this will only invalidate the translation in
> > > > the device VM. It doesn't affect the device cache nor any ongoing
> > > > memory transaction on the bus which waits to snoop the CPU cache.
> > > >=20
> > > > To make sure that you don't corrupt system memory you actually need
> > > > to wait for a cache flush event to be signaled and *not* just update
> > > > the VM page tables and tell the HW to invalidate it's TLB.
> > > >=20
> > > > So what is needed is usually a fence operation. In other words a
> > > > memory value written over the PCIe bus into system memory. Backgrou=
nd
> > > > is that memory writes are ordered and this one comes after all
> > > > previous PCIe memory writes of the device and so is in the correct
> > > > order.
> > > >=20
> > > > Only when the CPU sees this memory write you can be sure that your
> > > > operation is completed.
> > > >=20
> > > > This memory write is then often implemented by using an MSI interru=
pt
> > > > which in turn signals the DMA fence.
> > > >=20
> > > >=20
> > > > So the right thing to do is to wait for the DMA fence to signal
> > > > through its normal signaling path which includes both HW and SW
> > > > functionality and *not* just tell the HW to stop some ring and then
> > > > just assume that this is also sufficient to signal the DMA fence
> > > > associated with the HW operation.=C2=A0  =20
> > >=20
> > > Ultimately this
> > > "stop-HW-and-make-sure-all-outcomes-are-visible-even-for-partially-ex=
ecuted-jobs"
> > > is something you'll have to do, no matter what. But it leading to
> > > having to wait for each pending fence, I'm not too sure. What about t=
he
> > > case where jobs/ops further away in the HWRing were not even consider=
ed
> > > for execution by the HW, because the STOP operation prevented them fr=
om
> > > being dequeued. I'd expect that the only event we'll get for those is
> > > "HW queue is properly stopped now". So at this point it's a matter of
> > > signalling everything that's left, no? I mean, that's basically what
> > > Panthor does:
> > >=20
> > > 1. it stops
> > > 2. wait for all executing ops to land (with all the cache maintenance,
> > > etc, you described)
> > > 3. signal(ECANCELED) what's left (things not picked by the HW by
> > > the time the STOP was effective).
> > >=20
> > > It's currently done manually, but does it have to? =20
> >=20
> > All this being said, I'm also a pragmatic guy, so if you tell us "no
> > way!" even after these arguments, I'd rather give up on this
> > auto-signaling feature and have rust drivers be forced to manually
> > signal stuff than have the whole Fence abstraction blocked. We can add
> > a warn_on!(!is_signaled()) in the DriverFence::drop() path for the time
> > being, so we can at least catch cases where the driver didn't signal
> > the fence before dropping the signal-able object. =20
>=20
>=20
> In past discussions with my team members we were also not very
> determined whether we want autosignal or not.
>=20
> The only thing I'm concerned about is the RCU vs. UAF feature. We
> already invested a lot of time and pain into that feature, so we most
> probably want it.

Right, there's this UAF situation too. I guess if auto-signal is not
an option, we could add an _ORPHAN_BIT (or _DEAD_BIT) flag, and have
it tested along the _SIGNALED_BIT one in paths where we check if
dma_fence::ops are usable.
