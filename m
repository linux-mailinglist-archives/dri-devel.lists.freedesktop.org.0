Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPjTHSBvjGlmngAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 12:59:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A0D12406A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 12:59:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417B810E027;
	Wed, 11 Feb 2026 11:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="arlu/v2Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC25910E027
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 11:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770811163;
 bh=YePnWc5kuw57XGIEWaGONaead5PBtr/HlIQj9QeApGg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=arlu/v2YbLUiiUP+jKahtg7ISCUyLwnhpidRd39ZUQtJDqQPFhhcOIWD5C40o3Ard
 snK3VUGKV2YZsydT4GaxH2gvE3JWgtW1Uz2w/gfZtO9tMI6J66Iy2WkDIEMtv15M/k
 Ac1PMUwf+50XxNr4A4M7BLdHD+Si9i0u8H26Co4hT81VuPuG8wdSvA++GA4lNO41xh
 3Wq6DH3LHWeEOZV5enhIkyYj95HFM4tBT0fNV1OqWevM9xZdLAOSv/kzTTuFlVNQjz
 udBR1UBBP/jyFSsEiKVdz7yf01RGFP7yAT3p7tv2GYcxNVMir88b50vh2BWQ8/8Xqs
 O9RNU6888S1zQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D707E17E0097;
 Wed, 11 Feb 2026 12:59:22 +0100 (CET)
Date: Wed, 11 Feb 2026 12:59:17 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Philipp Stanner <phasta@mailbox.org>
Cc: phasta@kernel.org, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>, Benno Lossin
 <lossin@kernel.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Daniel Almeida <daniel.almeida@collabora.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 3/4] rust/drm: Add DRM Jobqueue
Message-ID: <20260211125917.286e0fb6@fedora>
In-Reply-To: <f3d2e3b370bed55cc2a95287b3c257f878b5e92b.camel@mailbox.org>
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-5-phasta@kernel.org>
 <20260210155750.5cdbe6cc@fedora>
 <8ea48ce49f2c7b6fd715dd54c24e755e8ac3262c.camel@mailbox.org>
 <20260211120742.0e9e7122@fedora>
 <f3d2e3b370bed55cc2a95287b3c257f878b5e92b.camel@mailbox.org>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@mailbox.org,m:phasta@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:dakr@kernel.org,m:aliceryhl@google.com,m:gary@garyguo.net,m:lossin@kernel.org,m:christian.koenig@amd.com,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,ffwll.ch,google.com,garyguo.net,amd.com,collabora.com,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mailbox.org:email,collabora.com:dkim]
X-Rspamd-Queue-Id: E1A0D12406A
X-Rspamd-Action: no action

On Wed, 11 Feb 2026 12:19:56 +0100
Philipp Stanner <phasta@mailbox.org> wrote:

> On Wed, 2026-02-11 at 12:07 +0100, Boris Brezillon wrote:
> > On Wed, 11 Feb 2026 11:47:27 +0100
> > Philipp Stanner <phasta@mailbox.org> wrote:
> >  =20
> > > On Tue, 2026-02-10 at 15:57 +0100, Boris Brezillon wrote: =20
> > > > On Tue,=C2=A0 3 Feb 2026 09:14:02 +0100
> > > > Philipp Stanner <phasta@kernel.org> wrote:
> > > > =C2=A0  =20
> > > > > +/// A jobqueue Job.
> > > > > +///
> > > > > +/// You can stuff your data in it. The job will be borrowed back=
 to your driver
> > > > > +/// once the time has come to run it.
> > > > > +///
> > > > > +/// Jobs are consumed by [`Jobqueue::submit_job`] by value (owne=
rship transfer).
> > > > > +/// You can set multiple [`DmaFence`] as dependencies for a job.=
 It will only
> > > > > +/// get run once all dependency fences have been signaled.
> > > > > +///
> > > > > +/// Jobs cost credits. Jobs will only be run if there are is eno=
ugh capacity in
> > > > > +/// the jobqueue for the job's credits. It is legal to specify j=
obs costing 0
> > > > > +/// credits, effectively disabling that mechanism.
> > > > > +#[pin_data]
> > > > > +pub struct Job<T: 'static + Send> {
> > > > > +=C2=A0=C2=A0=C2=A0 cost: u32,
> > > > > +=C2=A0=C2=A0=C2=A0 #[pin]
> > > > > +=C2=A0=C2=A0=C2=A0 pub data: T,
> > > > > +=C2=A0=C2=A0=C2=A0 done_fence: Option<ARef<DmaFence<i32>>>,
> > > > > +=C2=A0=C2=A0=C2=A0 hardware_fence: Option<ARef<DmaFence<i32>>>,
> > > > > +=C2=A0=C2=A0=C2=A0 nr_of_deps: AtomicU32,
> > > > > +=C2=A0=C2=A0=C2=A0 dependencies: List<Dependency>,=C2=A0  =20
> > > >=20
> > > > Given how tricky Lists are in rust, I'd recommend going for an XArr=
ay,
> > > > like we have on the C side. There's a bit of overhead when the job =
only
> > > > has a few deps, but I think simplicity beats memory-usage-optimizat=
ions
> > > > in that case (especially since the overhead exists and is accepted =
in
> > > > C).=C2=A0  =20
> > >=20
> > > I mean, the list is now already implemented and works. Considering the
> > > XArray would have made sense during the development difficulties. =20
> >=20
> > I'm sure it does, but that's still more code/tricks to maintain than
> > what you'd have with the XArray abstraction. =20
>=20
> The solution than will rather be to make the linked list implementation
> better.
>=20
> A list is the correct data structure in a huge number of use cases in
> the kernel. We should not begin here to defer to other structures
> because of convenience.
>=20
> Btw. lists in Rust being so horrible has been repeatedly a reason why
> some other hackers argued that Rust as a language is not suitable for
> kernel development.
>=20
> So getting that right seems more desirable than capitulating.

I'm not capitulating, and I'm not saying "No list, never!" either. I'm
saying, if there's something that fits the bill and is easier to use,
maybe we should consider it...

>=20
> >  =20
> > >=20
> > > If it were to make sense we could certainly replace the list with an
> > > xarray, but I don't see an advantage. The JQ just needs to iterate ov=
er
> > > the dependencies to register its events on them, and on drop to
> > > deregister them perhaps.
> > >=20
> > > We have many jobs, but likely only few dependencies per job, so the
> > > lower memory footprint seems desirable and the XArray's advantages
> > > don't come to play =E2=80=93 except maybe if we'd want to consider to=
 avoid the
> > > current unsafe-rawpointer solution to obtain the job, since obtaining=
 a
> > > job from an Xarray is far faster than by list iteration. =20
> >=20
> > I don't think we need O(1) for picking random deps in a job, because
> > that's not something we need at all: the dep list here is used as a
> > FIFO.
> >  =20
>=20
> Wrong. The dep list here has no ordering requirements at all. JQ does
> not care in which order it registers its events, it just cares about
> dealing with dep-fences racing.

What I mean is that it's used as a FIFO right now, not that deps have to
be processed in order.

>=20
> You could (de-)register your callbacks in random order, it does not
> matter.

Again, that's not my point, and I think we're just saying the same
thing here: the list seems to be a good match for this dependency
array/list, because right now deps are processed in order. Now, being
the right construct in one language doesn't mean it's the right
construct in another language.

>=20
> List and Xarray might be useful for the unsafe related to the
> DependencyWaker. There you could avoid a raw pointer by getting the job
> through a list iteration or through the hypothetical XArray.
>=20
> Please take a look at my detailed code comments for DependencyWaker.

Sure, I'll have a closer look.

>=20
> >  There's the per-dep overhead of the ListLinks object maybe, but
> > it's certainly acceptable. And I don't think cache locality matters
> > either, because the XArray stores pointers too, so we'll still be one
> > deref away from the DmaFence. No, my main concern was maintainability,
> > because managing lists in rust is far from trivial, and as a developer,
> > I try to avoid using concepts the language I rely on is not friendly
> > with. =20
>=20
> This would be a decision with wide implications, as detailed above.
>=20
> If we were to admit that lists just don't work in Rust, then wouldn't
> the consequent decision to remove them all together?

I'm not going as far as saying they don't work, I'm just saying they
are trickier to use, and that's a fact.

>=20
> "Lists in kernel-Rust are not supported. Too difficult to maintain.
> We're sorry. Use XArray et al. instead :("

No, there are patterns where an XArray wouldn't be a good fit. For
instance, LRU lists where objects get moved between lists depending on
their usage pattern. If we were to use XArrays for that, that would
imply potential allocations in paths where we don't want them. In this
dep array case, the deps are added at submit time, and they get
progressively dropped, so the array can't grow, it can only ever
shrink, and XArray allows it to shrink from both ends (and even have
holes), so it sounds like a good match too. Not saying a perfect match,
not saying better than a list in general, but an XArray is easier to
use than a list **in rust**, and the fact it fits the bill (if it does
in C, it should in rust too) had me thinking that maybe it's what we
should use.

If every one is happy with a list, then lets go for a list.
