Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qH/iGAOuiWndAgUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 10:50:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B38A610DC63
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 10:50:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E8210E3AC;
	Mon,  9 Feb 2026 09:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="GAl5PSI0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD6C910E3B7
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 09:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770630653;
 bh=lg8CE3wdX+dcJL6yDeqGzT+IDyDi7+zFMbcdS7bHqvY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GAl5PSI0gxZCB4fRfIXmb+OCpJY8qNOwXLz9veN8T1muQZoP1SLZuyEN5jFkvF2vC
 ipEp3b4sMip86VDrIuyv0saU6cadpiIbCjLXvBVVbeZAQqEsKVjT0taFlrKIdQOG5o
 OZQLZf2qXFX+xYlx0veU9pFtFvMJZFR5drDK3SDbpdlXo4c3lYspdavKG7jiw9NlZW
 xa/6D7KeI3iQ35tMqN3uTY1pHR6VVhFsLSaG8GVpX+qBCwtkSmIJAVf9ZN5odCFfCe
 6XncsOBtXX+6Ns4d6I4xWWAvxrKDHBZuGV6cEunws0xUFhCtHMLYrEcFSnZW8x55/J
 GOPQBqzU8Vu7A==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id F334C17E12C5;
 Mon,  9 Feb 2026 10:50:51 +0100 (CET)
Date: Mon, 9 Feb 2026 10:50:47 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich
 <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Drew Fustini <fustini@kernel.org>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Uwe =?UTF-8?B?S2xlaW5lLUs=?=
 =?UTF-8?B?w7ZuaWc=?= <ukleinek@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
Message-ID: <20260209105047.693f2515@fedora>
In-Reply-To: <20260204-angelic-vermilion-beagle-fd1507@houat>
References: <20260119-thundering-tested-robin-4be817@houat>
 <aW4lCfUyumOKRRJm@google.com>
 <518D8B09-B9A1-4DB4-85CD-37A2DD3D5FB1@collabora.com>
 <DFSLCI9U4NCW.2HI2UPUI7G134@kernel.org>
 <20260119-weightless-pelican-of-anger-190db0@houat>
 <DFSN4FDCYHMW.3J3237PEBV2ZP@kernel.org>
 <20260122-majestic-masterful-jaguarundi-d0abde@houat>
 <2F3D3A40-6EF9-46FC-A769-E5A3AAF67E65@collabora.com>
 <20260204-nickel-seal-of-poetry-8fdefb@houat>
 <91A92D84-1F2E-45F3-82EC-6A97D32E2A78@collabora.com>
 <20260204-angelic-vermilion-beagle-fd1507@houat>
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
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:daniel.almeida@collabora.com,m:dakr@kernel.org,m:aliceryhl@google.com,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:ukleinek@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-pwm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[collabora.com,kernel.org,google.com,linaro.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,redhat.com,baylibre.com,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B38A610DC63
X-Rspamd-Action: no action

Hi Maxime,

On Wed, 4 Feb 2026 15:34:29 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> On Wed, Feb 04, 2026 at 09:43:55AM -0300, Daniel Almeida wrote:
> > > I'm probably missing something then, but let's assume you have a driv=
er
> > > that wants its clock prepared and enabled in an hypothetical enable()
> > > callback, and disabled / unprepared in a disable() callback.
> > >=20
> > > From a PM management perspective, this usecase makes total sense, is a
> > > valid usecase, is widely used in the kernel, and is currently support=
ed
> > > by both the C and Rust clk APIs.
> > >=20
> > > The only solution to this you suggested so far (I think?) to implement
> > > this on top of the new clk API you propose is to have a driver specif=
ic
> > > enum that would store each of the possible state transition. =20
> >=20
> > Yes, you need an enum _if_ you want to model transitions at runtime. II=
UC you
> > only need two variants to implement the pattern you described. I do not
> > consider this  =E2=80=9Cboilerplate=E2=80=9D, but rather a small cost t=
o pay. =20
>=20
> A maintenance cost to pay by every driver is kind of the textbook
> definition of boilerplate to me.
>=20
> > I would understand if this was some elaborate pattern that had to be
> > implemented by all drivers, but a two-variant enum is as
> > straightforward as it gets. =20
>=20
> And yet, that framework has dozens of helpers that do not remove
> anything from drivers but a couple of lines. So surely its users must
> find value in reducing that boilerplate as much as possible. And you do
> implement some of them, so you must find value in that too.
>=20
> > > That's the boilerplate I'm talking about. If every driver wanting to
> > > implement that pattern has to make such an enum, with all the relevant
> > > traits implementation that might come with it, we go from an API where
> > > everything works at no-cost from a code-size perspective to a situati=
on
> > > where every driver has to develop and maintain that enum. =20
> >
> > There are no "traits that come with it". It's just an enum, with two
> > variants.
> >  =20
> > > API where everything works at no-cost =20
> >=20
> > The previous API was far from =E2=80=9Ceverything works=E2=80=9D. It wa=
s fundamentally
> > broken by design in multiple ways, i.e.: =20
>=20
> Out of context and not what I meant, but ok.
>=20
> > > a) It only keeps track of a count to clk_get(), which means that user=
s have
> > > to manually call disable() and unprepare(), or a variation of those, =
like
> > > disable_unprepare().
> > >=20
> > > b) It allows repeated calls to prepare() or enable(), but it keeps no=
 track
> > > of how often these were called, i.e., it's currently legal to write t=
he
> > > following:
> > >=20
> > > clk.prepare();
> > > clk.prepare();
> > > clk.enable();
> > > clk.enable();
> > >=20
> > > And nothing gets undone on drop(). =20
> >=20
> > IMHO, what we have here is an improvement that has been long overdue. =
=20
>=20
> Nothing is absolute. It is indeed an improvement on the refcounting side
> of things and general safety of the API for the general case. I don't
> think I ever questionned that.
>=20
> However, for the use-cases we've been discussing (and dozens of drivers
> implementing it), it also comes with a regression in the amount of code
> to create and maintain. They used to be able to only deal with the Clk
> structure, and now they can't anymore.
>=20
> You might find that neglible, you might have a plan to address that in
> the future, etc. and that's fine, but if you can't acknowledge that it's
> indeed happening, there's no point in me raising the issue and
> continuing the discussion.


Okay, let's see if I can sum-up the use case you'd like to support. You
have some PM hooks, which I'm assuming are (or will be) written in
rust. It will probably take the form of some Device{Rpm,Pm} trait to
implement for your XxxDeviceData (Xxx being the bus under which is
device is) object (since I've only recently joined the R4L effort, I
wouldn't be surprised if what I'm describing already exists or is
currently being proposed/reviewed somewhere, so please excuse my
ignorance if that's the case :-)).

The way I see it, rather than having one enum per clk/regulator/xxx
where we keep track of each state individually, what we could have is a

trait DevicePm {
	type ResumedState;
	type SuspendedState;

	fn resume(&self, state: SuspendedState) -> Result<ResumedState, Error<Susp=
endedState>>;
	fn suspend(&self, state: SuspendedState) -> Result<SuspendedState, Error<R=
esumedState>>;
};

enum DeviceState<T: DevicePm> {
	Resumed(T::ResumedState),
	Suspended(T::SuspendedState),
};

and then in your driver:

MySuspendedDeviceResources {
	xxx_clk: Clk<Unprepared>,
};

MyResumedDeviceResources {
	xxx_clk: Clk<Enabled>,
};

implem DevicePm for MyDevice {
	type ResumedState =3D MyResumedDeviceResources;
	type SuspendedState =3D MySuspendedDeviceResources;

	fn resume(&self, state: SuspendedState) -> Result<ResumedState, Error<Susp=
endedState>> {
		// FIXME: error propagation not handled
		let enabled_clk =3D state.xxx_clk.clone().prepare()?.enable()?;

		Ok(ResumedState {
			xxx_clk: enabled_clk,
		});
	}

	fn suspend(&self, state: ResumedState) -> Result<SuspendedState, Error<Res=
umedState>> {
		// FIXME: error propagation not handled
		let unprep_clk =3D state.xxx_clk.clone().disable().unprepare();

		Ok(SuspendedState {
			xxx_clk: unprep_clk,
		});
	}
};

With this model, I don't think Daniel's refactor goes in the way of more
generalization at the core level, it's just expressed differently than
it would be if it was written in C. And I say that as someone who struggles
with his C developer bias every time I'm looking at or trying to write
rust code.

As others have said in this thread (Danilo and Gary), and after having
played myself with both approaches in Tyr, I do see this shift from manual
prepare/enable to an RAII approach as an improvement, so I hope we can
find a middle-ground where every one is happy.

Regards,

Boris
