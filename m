Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEYmEUW1hWmbFQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 10:32:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A585DFC0E5
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 10:32:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A8410E64B;
	Fri,  6 Feb 2026 09:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="abxZ6bvf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9DB10E64B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 09:32:48 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4f6plw4p46z9tpC;
 Fri,  6 Feb 2026 10:32:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1770370364; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fAFhVmmwigZehhMFWD9AUSYXd2DpExwQIgAcNMsKsgg=;
 b=abxZ6bvfId+OVQ5olSdmRpHoLL1RjKjqx62ZrOucEaHd5CrmsMJD/eyn0ySoUEZgIkA5gn
 A+OTtKlrHdiUY8jZ2gz0ujOlx6WcKkv3xFC1WfezAcGYcaakAVqx0T9/8Cbehjo8NwzMBx
 Sw+RWwpt/YCU2XPAHrs2JFtT5RHgQgmz2DEmAuZuUAcwJbEtnAR7cJQjFyJJ32yBZGHcDW
 N2Im4X1oT/gyZmoT27islZoMMTORHeu4XceKlt+1Ejbxdk6Ar0WGbDQz39OEPhTzmNsn1L
 xoWRntJ8tG25DIuPauxobDaXfsdwZ5tSBcN2jpI/4HviBftcyAt9dqy6SIYIWw==
Message-ID: <62b82ffdd40d568d822bda8cdea83cd030851f68.camel@mailbox.org>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
To: Gary Guo <gary@garyguo.net>, Boris Brezillon
 <boris.brezillon@collabora.com>,  Philipp Stanner <phasta@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Benno Lossin <lossin@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  rust-for-linux@vger.kernel.org
Date: Fri, 06 Feb 2026 10:32:38 +0100
In-Reply-To: <DG721WEFTFZY.2CSCXBQ8H0Y1A@garyguo.net>
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-4-phasta@kernel.org> <20260205111635.5307e1fa@fedora>
 <DG721WEFTFZY.2CSCXBQ8H0Y1A@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: uwrhoghfu5fgzspwmd3gedu94i9msomy
X-MBO-RS-ID: d1c55b22c0f954b8976
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
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gary@garyguo.net,m:boris.brezillon@collabora.com,m:phasta@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:dakr@kernel.org,m:aliceryhl@google.com,m:lossin@kernel.org,m:christian.koenig@amd.com,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,kernel.org,google.com,amd.com,collabora.com,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Queue-Id: A585DFC0E5
X-Rspamd-Action: no action

On Thu, 2026-02-05 at 13:16 +0000, Gary Guo wrote:
> On Thu Feb 5, 2026 at 10:16 AM GMT, Boris Brezillon wrote:
> > On Tue,=C2=A0 3 Feb 2026 09:14:01 +0100
> > Philipp Stanner <phasta@kernel.org> wrote:
> >=20
> > >=20

[=E2=80=A6]

> > > +#[pin_data]
> > > +pub struct DmaFence<T> {
> > > +=C2=A0=C2=A0=C2=A0 /// The actual dma_fence passed to C.
> > > +=C2=A0=C2=A0=C2=A0 #[pin]
> > > +=C2=A0=C2=A0=C2=A0 inner: Opaque<bindings::dma_fence>,
> > > +=C2=A0=C2=A0=C2=A0 /// User data.
> > > +=C2=A0=C2=A0=C2=A0 #[pin]
> > > +=C2=A0=C2=A0=C2=A0 data: T,
> >=20
> > A DmaFence is a cross-device synchronization mechanism that can (and
> > will)
> >=20

I'm not questioning the truth behind this statement. They are designed
to do that. But is that actually being done, currently? I recently
found that the get_driver_name() callback intended to inform the
consumer of a fence about who actually issued the fence is only ever
used by i915.

Who actually uses that feature? Who needs fences from another driver?

Just out of curiousity


> >  cross the driver boundary (one driver can wait on a fence emitted
> > by a different driver). As such, I don't think embedding a generic T in
> > the DmaFence and considering it's the object being passed around is
> > going to work, because, how can one driver know the T chosen by the
> > driver that created the fence? If you want to have some fence emitter
> > data attached to the DmaFence allocation, you'll need two kind of
> > objects:
> >=20
> > - one that's type agnostic and on which you can do the callback
> > =C2=A0 registration/unregistration, signalling checks, and generally al=
l
> > =C2=A0 type-agnostic operations. That's basically just a wrapper around=
 a
> > =C2=A0 bindings::dma_fence implementing AlwaysRefCounted.
> > - one that has the extra data and fctx, with a way to transmute from a
> > =C2=A0 generic fence to a implementer specific one in case the driver w=
ants
> > =C2=A0 to do something special when waiting on its own fences (check do=
ne
> > =C2=A0 with the fence ops in C, I don't know how that translates in rus=
t)
>=20
> If `data` is moved to the end of struct and `DmaFence<T>` changed to
> `DmaFence<T: ?Sized>`, you would also gain the ability to coerce `DmaFenc=
e<T>`
> to `DmaFence<dyn Trait>`, e.g. `DmaFence<dyn Any>`.


I think we should go one step back here and question the general
design.

I only included data: T because it was among the early feedback that
this is how you do it in Rust.

I was never convinced that it's a good idea. Jobqueue doesn't need the
'data' field. Can anyone think of anyone who would need it?

What kind of data would be in there? It seems a driver would store its
equivalent of C's

struct my_fence {
   struct dma_fence f;
   /* other driver data */
}

which is then accessed in C with container_of.

But that data is only ever needed by that very driver.


My main point here is:
dma_fence's are a synchronization primitive very similar to
completions: informing about that something is done, executing every
registrants callbacks.

They are *not* a data transfer mechanism. It seems very wrong design-
wise to transfer generic data T from one driver to another. That's not
a fence's purpose. Another primitive should be used for that.

If another driver could touch / consume / see / use the emitter's data:
T, that would grossly decouple us from the original dma_fence design.
It would be akin to doing a container_of to consume foreign driver
data.

Like Xe  doing a

struct nouveau_fence *f =3D container_of(generic_fence, =E2=80=A6);

Why would that ever be done? Seems totally broken.

So I strongly think that we'd either want to drop data: T, or we should
think about possibilities to hide it from other drivers.

I've got currently no idea how that could be addressed in Rust, though=20

:)
:(


P.

>=20
> Best,
> Gary
>=20
> >=20
> > > +=C2=A0=C2=A0=C2=A0 /// Marks whether the fence is currently in the s=
ignalling critical section.
> > > +=C2=A0=C2=A0=C2=A0 signalling: bool,
> > > +=C2=A0=C2=A0=C2=A0 /// A boolean needed for the C backend's lockdep =
guard.
> > > +=C2=A0=C2=A0=C2=A0 signalling_cookie: bool,
> > > +=C2=A0=C2=A0=C2=A0 /// A reference to the associated [`DmaFenceCtx`]=
 so that it cannot be dropped while there are
> > > +=C2=A0=C2=A0=C2=A0 /// still fences around.
> > > +=C2=A0=C2=A0=C2=A0 fctx: Arc<DmaFenceCtx>,
> > > +}
>=20

