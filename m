Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KPqGl7YqmnmXgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 14:36:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2490221CCC
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 14:36:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B792310E29A;
	Fri,  6 Mar 2026 13:36:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="lNY9+2nE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD5410E29A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 13:36:24 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fS6r44m6Nz9tsw;
 Fri,  6 Mar 2026 14:36:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1772804180; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QKyH3TVnqWlMIKp2RtH3PEwmMlKs7BH8aWr2qNp28fY=;
 b=lNY9+2nEb14ot9QOD2Zn1HLiqIdvkhYTI3d9GWx3nDrdYi4exULiFFgocEoxrpJ8uR80aK
 FY/hetLdBeWNXZFJwTKtJtnvAW/FsusIJSqyO1XXt2lIh0OillaOpwuZB+oeD1jy7QOcvw
 7oBYaaemhhdLGQEBpZbFMcxQEXMD+NZyjIUzrUFJq1xgIE2/fPSk5XwDw0tRAIZtZK2thS
 iOQHcCIk7uuIBaF4z0Wi01XQDo9YYWOg9t4g9ufd1jiiqLt3xNqarlDqd93eICQzk87y7X
 uWKznuBovSntvP6yTT2p7lw2QEC7i50IWbHFXQkM8gAerFemI7yOQCuXQf0wgQ==
Message-ID: <63dc8c72baac42199ede72b153fdec71e0b4fe9e.camel@mailbox.org>
Subject: Re: dma_fence: force users to take the lock manually
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo
 Krummrich <dakr@kernel.org>
Cc: phasta@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel
 <dri-devel@lists.freedesktop.org>
Date: Fri, 06 Mar 2026 14:36:17 +0100
In-Reply-To: <c3a23b78-68ec-4ee3-b142-3ebf0131a0ce@amd.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: c2980005ecabd8f1199
X-MBO-RS-META: m4q9kg9x6p78tbwp7cg7e4k1m8tq9e3o
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: C2490221CCC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:dakr@kernel.org,m:phasta@kernel.org,m:boris.brezillon@collabora.com,m:tvrtko.ursulin@igalia.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mailbox.org:dkim,mailbox.org:mid];
	FORGED_SENDER(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	HAS_REPLYTO(0.00)[phasta@kernel.org]
X-Rspamd-Action: no action

On Fri, 2026-03-06 at 14:15 +0100, Christian K=C3=B6nig wrote:
> On 3/6/26 14:03, Danilo Krummrich wrote:
> > On Fri Mar 6, 2026 at 1:36 PM CET, Philipp Stanner wrote:
> > > On Fri, 2026-03-06 at 13:31 +0100, Christian K=C3=B6nig wrote:
> > > > All fences must always signal because the HW operation must always =
complete
> > > > or be terminated by a timeout.
> > > >=20
> > > > If a fence signals only because it runs out of scope than that mean=
s that you
> > > > have a huge potential for data corruption and that is even worse th=
an not
> > > > signaling a fence.
> >=20
> > If that happens, it is a functional bug, the potential data corruption =
is only
> > within a separate memory object, e.g. GEM etc., no? I.e. it may fault t=
he GPU,
> > but it does not fault the kernel.
>=20
> That makes assumption that DMA operations are protected by an MMU which p=
rovides virtual memory.
>=20
> But the VM functionality of modern GPUs are the exception and not the nor=
m for devices using DMA fences.
>=20
> > > > In other words not signaling a fence can leave the system in a dead=
lock
> > > > state, but signaling it incorrectly usually results in random data
> > > > corruption.
> >=20
> > Well, not signaling it results in a potential deadlock of the whole ker=
nel,
> > whereas wrongly signaling it is "only" a functional bug.
>=20
> No, that results in random memory corruption. Which is easily a magnitude=
 worse than just a kernel deadlock.
>=20
> When have seen such bugs numerous times with suspend and resume on laptop=
s in different subsystems, e.g. not only GPU. And I'm absolutely clearly re=
jecting any attempt to signal DMA fences when an object runs out of scope b=
ecause of that experience.

But you're aware that both in C and Rust you could experience UAF bugs
if fences drop unsignaled and the driver unloads?

Though I tentatively agree that memory corruptions on a large scale are
probably the worst error you can have on a computer.

>=20
> > > It all stands and falls with the question whether a fence can drop by
> > > accident in Rust, or if it will only ever drop when the hw-ring is
> > > closed.
> > >=20
> > > What do you believe is the right thing to do when a driver unloads?
> >=20
> > The fence has to be signaled -- ideally after shutting down all queues,=
 but it
> > has to be signaled.
>=20
> Yeah well this shutting down all queues (and making sure that no write op=
eration is pending in caches etc...) is what people usually don't get right=
.
>=20
> What you can to is things like setting your timeout to zero and immediate=
ly causing terminating the HW operation and resetting the device.
>=20
> This will then use the same code path as the mandatory timeout functional=
ity for DMA operations and that usually works reliable.

Why is all that even an issue? The driver controls the hardware and
must "switch it off" before it unloads. Then the hardware will not
access any memory anymore for sure.


P.

>=20
> > > Ideally we could design it in a way that the driver closes its rings,
> > > the pending fences drop and get signaled with ECANCELED.
> > >=20
> > > Your concern seems to be a driver by accident droping a fence while t=
he
> > > hardware is still processing the associated job.
> >=20
> > I'm not concerned about the "driver drops fence by accident" case, as i=
t is less
> > problematic than the "driver forgets to signal the fence" case. One is =
a logic
> > bug, whereas the other can deadlock the kernel, i.e. it is unsafe in te=
rms of
> > Rust.
> >=20
> > (Technically, there are subsequent problems to solve, as core::mem::for=
get() is
> > safe and would cause the same problem. However, this is not new, it app=
lies to
> > lock guards in general. We can catch such things with klint though.)
> >=20
> > Ultimately, a DMA fence (that has been exposed to the outside world) is
> > technically equivalent to a lock guard.
>=20
> +1
>=20
> Yes, exactly that.
>=20
> Regards,
> Christian.
>=20
> >=20
> > > (how's that dangerous, though? Shouldn't parties waiting for the fenc=
e
> > > detect the error? ECANCELED =E2=87=92 you must not access the associa=
ted
> > > memory)
>=20

