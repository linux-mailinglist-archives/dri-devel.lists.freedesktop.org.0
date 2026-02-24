Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKClMTN+nWk/QQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 11:32:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F48185677
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 11:32:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B51489083;
	Tue, 24 Feb 2026 10:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="l3gHVYZg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9181C89083
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 10:32:15 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fKvDD2SSGz9vGx;
 Tue, 24 Feb 2026 11:32:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1771929132; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Q6QPkQGSNXa6+cmfsogIufuj+sWVtBm0OC1M1VOKTE=;
 b=l3gHVYZg+AeABjc7WUS/yWZfY5tunDMlnilPWOGvQB01eVQXQwbRAA9VAlJimsvT+WI9WR
 IUaNPiC0SrvsXhmFkpUj/bQ0B2ItNceX+2q2k9nhk1GRryD9KnO8xVl2U+OUj6+jFvvrKL
 MTmOqmBTYo+B2NgVaFeGK+vbMX7ZMcq/KRqs/Yx2RI4DKg1r9A2OEeADQjsf1km5l4HgVf
 l9I0hQNMyQsjZCHqhEzZdODNGDtrlSQ7PT4QDeueZeozOZLPU1L3X77vwYcQ0FuK8JaZI3
 7LfLUkyyZvgSbL+0DWUKMmJmLFTFieF0s7g7InzgJw4fvQc9M77nyLGTQ+zhIw==
Message-ID: <ceaa533664599c294beb307b198c1fa48197f581.camel@mailbox.org>
Subject: Re: Opportunistic dma_fence polling
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 phasta@kernel.org
Cc: dri-devel@lists.freedesktop.org, Boris Brezillon
 <boris.brezillon@collabora.com>, Danilo Krummrich <dakr@redhat.com>
Date: Tue, 24 Feb 2026 11:32:10 +0100
In-Reply-To: <e9bbe32f-b165-483b-a2c9-e581bfe57b59@amd.com>
References: <91f84eccd59d593822dbb97c995ae9c52ba788d2.camel@mailbox.org>
 <e9bbe32f-b165-483b-a2c9-e581bfe57b59@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: e41dc6c7afb45d5f25e
X-MBO-RS-META: bdrwh5stob78angmfco5bhehwdiyu5ud
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:phasta@kernel.org,m:boris.brezillon@collabora.com,m:dakr@redhat.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mailbox.org:mid,mailbox.org:dkim];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	HAS_REPLYTO(0.00)[phasta@kernel.org]
X-Rspamd-Queue-Id: 27F48185677
X-Rspamd-Action: no action

On Mon, 2026-02-23 at 12:42 +0100, Christian K=C3=B6nig wrote:
> Hi Philip,
>=20
> I only found this message by coincident, please make sure to always CC my=
 AMD work email address as well.

You've been the direct recipent, in the To: header field :)

>=20
> On 2/19/26 12:06, Philipp Stanner wrote:
> > Yo Christian,
> >=20
> > I'd like to discuss the dma_fence fast path optimization
> > (ops.is_signaled) again.
> >=20
> > As far as I understand by now, the use case is that some drivers will
> > never signal fences; but the consumer of the fence actively polls
> > whether a fence is signaled or not.
> >=20
> > Right?
>=20
> Close but not 100% right. The semantic is that enabled_signaling is only =
called when somebody actively waits for the dma_fence to finish.
>=20
> So as long as both userspace and kernel only poll for the fence status en=
able_signaling is never called and only is_signaled is called.

So you're telling me that enable_signaling enables interrupt-driven
signaling, typically. IOW in some cases you can request that a specific
fence gets signaled the expensive way (interrupt) while polling on the
others.

What is the hw->hw signaling that the documentation details?

hw->sw signaling seems to refer to interrupts.

>=20
> What drivers/fence implementations do with that is up to them. For exampl=
e userqueues use it as preemption signaling, but most drivers simply try to=
 avoid waking up the system with IRQs.
>=20
> > I have a bunch of questions regarding that:
> >=20
> > =C2=A0=C2=A0 1. What does the party polling the fence typically look li=
ke? I bet
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 it's not userspace, is it? Userspace I'd=
 expect to use poll() on
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 a FD, thus an underlying driver has to c=
heck the fence somehow.
>=20
> No no, that is indeed userspace.

Userspace has no direct access to a fence. It's, ultimately a kernel
ioctl through which userspace can check a fence. That's what I meant:
it's kernel code implemented in the driver [but running in the user's
process context]

>=20
> As soon as the kernel starts to call dma_fence_wait() (for example) we ha=
ve the normal guaranteed to signal semantics we always have.
>=20
> > =C2=A0=C2=A0 2. What if that party checks the fence, determines it is u=
nsignaled?
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Will it then again try later?
>=20
> I have no idea, that depends on how the userspace component is implemente=
d.
>=20
> > =C2=A0=C2=A0 3. If it tries again later anyways, then what is the probl=
em with
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the fence-issuing driver itself checking=
 every 5, 10 or 50
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 milliseconds what the counter in the GPU=
 ring buffer is, and then
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 signals all those fences?
>=20
> That you need to wake up for that, this costs quite a lot of power.
>=20
> See two different approach:
>=20
> 1. Interrupt driven, e.g. somebody says signal me as soon as possible whe=
n the work is done.
>=20
> 2. Poll driven, e.g. userspace wakes up every N milliseconds anyway and i=
t doesn't matter if the status changes a bit later.

Makes sense, I guess.

>=20
> > So it circles around the question why ops.is_signaled is supposedly
> > unavoidable.
>=20
> Additional to the interrupt/poll handling it is also a really important o=
ptimization for multicore systems, e.g. it makes the signaling state visibl=
e to other CPU cores even when the core handling the IRQ is still busy.

What is the "signaling state"?

A fence's signaled status is indicated through an atomic flag which
becomes visible globally once someone, like said interrupt, has
signaled the fence.


P.

>=20
> That is also really important for some use cases as far as I know. Keep i=
n mind that this framework drivers everything from Android mobiles all the =
way up to supercomputers.
>=20
> I mean what we could potentially do is to fix the locking invariant of th=
e is_signaled callback, but that is probably the only simplification possib=
le without breaking tons of use cases.
>=20
> Regards,
> Christian.
>=20
> >=20
> > Regards
> > P.
>=20

