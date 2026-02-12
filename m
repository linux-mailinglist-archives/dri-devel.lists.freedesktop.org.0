Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPLZA9XXjWng7wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 14:38:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C02D12DDD2
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 14:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E25CB10E74B;
	Thu, 12 Feb 2026 13:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dkvdZmwM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 226ED10E76B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 13:38:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D5EB140AE4;
 Thu, 12 Feb 2026 13:38:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33C76C4CEF7;
 Thu, 12 Feb 2026 13:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770903503;
 bh=rllsvS5vCvLouAChQEOMtRmUwKUDPEURx2urJ+uvPlY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dkvdZmwMXBcBLaDqhrvu5KUcJ+JYQqpgg3sgFG+oGJeT7Adm+RMikI/+UKfn4xr+4
 72u7NAh2eFOOL+ZwVSRtIL+cksx5baiKTWNH197JEW0XnKvoCpzjsV/A5uDekKqHhb
 e2DpXAosQE5kKHUym/sNk1Y6evumdwGveIqZnJFbSPohj1fV1JxAlZvrcJtKrop9tP
 jr3OtAwdWZ/CNfjiiDUM6dyuPfeDfOF2UXMOu3mX0qp2vrxbT9y9w4a6hgf5KdfiCe
 6B+fKnUuMApKQk3XFo+tWM/gS8n9223P30NhMdU0H0ilMDospXdcKn3wpSkMiFPDtp
 KnYddVCDt5rNw==
Date: Thu, 12 Feb 2026 14:38:20 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, 
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, 
 linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
Message-ID: <20260212-lumpy-uptight-petrel-cac725@houat>
References: <20260119-weightless-pelican-of-anger-190db0@houat>
 <DFSN4FDCYHMW.3J3237PEBV2ZP@kernel.org>
 <20260122-majestic-masterful-jaguarundi-d0abde@houat>
 <2F3D3A40-6EF9-46FC-A769-E5A3AAF67E65@collabora.com>
 <20260204-nickel-seal-of-poetry-8fdefb@houat>
 <91A92D84-1F2E-45F3-82EC-6A97D32E2A78@collabora.com>
 <20260204-angelic-vermilion-beagle-fd1507@houat>
 <20260209105047.693f2515@fedora>
 <20260211-flawless-feathered-boar-0b87ad@houat>
 <CAH5fLgiQE7mJBpAxv6xTVKKFWadg2GdVe31hRM6gNk3Vah61MA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="txoc7rlouq7hrwvr"
Content-Disposition: inline
In-Reply-To: <CAH5fLgiQE7mJBpAxv6xTVKKFWadg2GdVe31hRM6gNk3Vah61MA@mail.gmail.com>
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
X-Spamd-Result: default: False [-1.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:boris.brezillon@collabora.com,m:daniel.almeida@collabora.com,m:dakr@kernel.org,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:ukleinek@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-pwm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	URIBL_MULTI_FAIL(0.00)[gabe.freedesktop.org:server fail];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,kernel.org,linaro.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,redhat.com,baylibre.com,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4C02D12DDD2
X-Rspamd-Action: no action


--txoc7rlouq7hrwvr
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
MIME-Version: 1.0

Hi Alice,

On Thu, Feb 12, 2026 at 09:16:51AM +0100, Alice Ryhl wrote:
> On Wed, Feb 11, 2026 at 5:37=E2=80=AFPM Maxime Ripard <mripard@kernel.org=
> wrote:
> > On Mon, Feb 09, 2026 at 10:50:47AM +0100, Boris Brezillon wrote:
> > > On Wed, 4 Feb 2026 15:34:29 +0100
> > > Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > > On Wed, Feb 04, 2026 at 09:43:55AM -0300, Daniel Almeida wrote:
> > > > > > I'm probably missing something then, but let's assume you have =
a driver
> > > > > > that wants its clock prepared and enabled in an hypothetical en=
able()
> > > > > > callback, and disabled / unprepared in a disable() callback.
> > > > > >
> > > > > > From a PM management perspective, this usecase makes total sens=
e, is a
> > > > > > valid usecase, is widely used in the kernel, and is currently s=
upported
> > > > > > by both the C and Rust clk APIs.
> > > > > >
> > > > > > The only solution to this you suggested so far (I think?) to im=
plement
> > > > > > this on top of the new clk API you propose is to have a driver =
specific
> > > > > > enum that would store each of the possible state transition.
> > > > >
> > > > > Yes, you need an enum _if_ you want to model transitions at runti=
me. IIUC you
> > > > > only need two variants to implement the pattern you described. I =
do not
> > > > > consider this  =E2=80=9Cboilerplate=E2=80=9D, but rather a small =
cost to pay.
> > > >
> > > > A maintenance cost to pay by every driver is kind of the textbook
> > > > definition of boilerplate to me.
> > > >
> > > > > I would understand if this was some elaborate pattern that had to=
 be
> > > > > implemented by all drivers, but a two-variant enum is as
> > > > > straightforward as it gets.
> > > >
> > > > And yet, that framework has dozens of helpers that do not remove
> > > > anything from drivers but a couple of lines. So surely its users mu=
st
> > > > find value in reducing that boilerplate as much as possible. And yo=
u do
> > > > implement some of them, so you must find value in that too.
> > > >
> > > > > > That's the boilerplate I'm talking about. If every driver wanti=
ng to
> > > > > > implement that pattern has to make such an enum, with all the r=
elevant
> > > > > > traits implementation that might come with it, we go from an AP=
I where
> > > > > > everything works at no-cost from a code-size perspective to a s=
ituation
> > > > > > where every driver has to develop and maintain that enum.
> > > > >
> > > > > There are no "traits that come with it". It's just an enum, with =
two
> > > > > variants.
> > > > >
> > > > > > API where everything works at no-cost
> > > > >
> > > > > The previous API was far from =E2=80=9Ceverything works=E2=80=9D.=
 It was fundamentally
> > > > > broken by design in multiple ways, i.e.:
> > > >
> > > > Out of context and not what I meant, but ok.
> > > >
> > > > > > a) It only keeps track of a count to clk_get(), which means tha=
t users have
> > > > > > to manually call disable() and unprepare(), or a variation of t=
hose, like
> > > > > > disable_unprepare().
> > > > > >
> > > > > > b) It allows repeated calls to prepare() or enable(), but it ke=
eps no track
> > > > > > of how often these were called, i.e., it's currently legal to w=
rite the
> > > > > > following:
> > > > > >
> > > > > > clk.prepare();
> > > > > > clk.prepare();
> > > > > > clk.enable();
> > > > > > clk.enable();
> > > > > >
> > > > > > And nothing gets undone on drop().
> > > > >
> > > > > IMHO, what we have here is an improvement that has been long over=
due.
> > > >
> > > > Nothing is absolute. It is indeed an improvement on the refcounting=
 side
> > > > of things and general safety of the API for the general case. I don=
't
> > > > think I ever questionned that.
> > > >
> > > > However, for the use-cases we've been discussing (and dozens of dri=
vers
> > > > implementing it), it also comes with a regression in the amount of =
code
> > > > to create and maintain. They used to be able to only deal with the =
Clk
> > > > structure, and now they can't anymore.
> > > >
> > > > You might find that neglible, you might have a plan to address that=
 in
> > > > the future, etc. and that's fine, but if you can't acknowledge that=
 it's
> > > > indeed happening, there's no point in me raising the issue and
> > > > continuing the discussion.
> > >
> > >
> > > Okay, let's see if I can sum-up the use case you'd like to support. Y=
ou
> > > have some PM hooks, which I'm assuming are (or will be) written in
> > > rust. It will probably take the form of some Device{Rpm,Pm} trait to
> > > implement for your XxxDeviceData (Xxx being the bus under which is
> > > device is) object (since I've only recently joined the R4L effort, I
> > > wouldn't be surprised if what I'm describing already exists or is
> > > currently being proposed/reviewed somewhere, so please excuse my
> > > ignorance if that's the case :-)).
> > >
> > > The way I see it, rather than having one enum per clk/regulator/xxx
> > > where we keep track of each state individually, what we could have is=
 a
> > >
> > > trait DevicePm {
> > >       type ResumedState;
> > >       type SuspendedState;
> > >
> > >       fn resume(&self, state: SuspendedState) -> Result<ResumedState,=
 Error<SuspendedState>>;
> > >       fn suspend(&self, state: SuspendedState) -> Result<SuspendedSta=
te, Error<ResumedState>>;
> > > };
> > >
> > > enum DeviceState<T: DevicePm> {
> > >       Resumed(T::ResumedState),
> > >       Suspended(T::SuspendedState),
> > > };
> > >
> > > and then in your driver:
> > >
> > > MySuspendedDeviceResources {
> > >       xxx_clk: Clk<Unprepared>,
> > > };
> > >
> > > MyResumedDeviceResources {
> > >       xxx_clk: Clk<Enabled>,
> > > };
> > >
> > > implem DevicePm for MyDevice {
> > >       type ResumedState =3D MyResumedDeviceResources;
> > >       type SuspendedState =3D MySuspendedDeviceResources;
> > >
> > >       fn resume(&self, state: SuspendedState) -> Result<ResumedState,=
 Error<SuspendedState>> {
> > >               // FIXME: error propagation not handled
> > >               let enabled_clk =3D state.xxx_clk.clone().prepare()?.en=
able()?;
> > >
> > >               Ok(ResumedState {
> > >                       xxx_clk: enabled_clk,
> > >               });
> > >       }
> > >
> > >       fn suspend(&self, state: ResumedState) -> Result<SuspendedState=
, Error<ResumedState>> {
> > >               // FIXME: error propagation not handled
> > >               let unprep_clk =3D state.xxx_clk.clone().disable().unpr=
epare();
> > >
> > >               Ok(SuspendedState {
> > >                       xxx_clk: unprep_clk,
> > >               });
> > >       }
> > > };
> >
> > I'm not sure we need to associate this with the suspend/resume state ei=
ther.
> >
> > > With this model, I don't think Daniel's refactor goes in the way of m=
ore
> > > generalization at the core level, it's just expressed differently than
> > > it would be if it was written in C. And I say that as someone who str=
uggles
> > > with his C developer bias every time I'm looking at or trying to write
> > > rust code.
> > >
> > > As others have said in this thread (Danilo and Gary), and after having
> > > played myself with both approaches in Tyr, I do see this shift from m=
anual
> > > prepare/enable to an RAII approach as an improvement, so I hope we can
> > > find a middle-ground where every one is happy.
> >
> > I do think we can find a compromise though. Miguel suggested for example
> > to make the current enable/prepare/disable/unprepare function unsafe,
> > and that's totally reasonable to me.
> >
> > Then we can implement the "managed" clock version on that unsafe API,
> > and we would end up with a "raw", unsafe, version kind of equivalent to
> > the one we have today, and where callers would have to justify why their
> > usage of the API is actually safe, or the new, managed, variant that is
> > safe and can be easily used by most drivers.
> >
> > And we can call these RawClk vs Clk, or Clk vs ManagedClk, or whatever.
> >
> > How does that sound?
>=20
> If you make the raw API unsafe, then that's okay but any use of an
> unsafe API from a driver will receive very hard scrutiny.

And that's totally fair to me. If drivers want to have a more optimal
but potentially unsafe use of the API, then it should be flagged,
documented and scrutinized.

> Yes, there are occasionally good reasons to use unsafe from drivers,
> but the entire point of this Rust exercise is to isolate unsafe code
> outside of drivers as much as possible.

So, aside from the risk of fuckups, are you concerned about something
here? Do you expect that scrutiny to be constly on the maintenance side
of things?

I guess what I'm asking is: except for the obvious "review" cost
associated with it, why would that be a probleme if we have, say, a few
dozen drivers using that unsafe API?

> If Daniel's proposal is inconvenient for some drivers, it would be far
> better to have a third API that is both safe and convenient for those
> drivers.

Yeah, I guess I was expecting that one to come after we have a few
unsafe drivers using it and we do need to consolidate / make it safe.

Anyway, thanks for your answer,
Maxime

--txoc7rlouq7hrwvr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaY3XyAAKCRAnX84Zoj2+
dlsCAX9YhXML2BwaihExT0HPvJLXsg7BkixgzooQn3BNo99C/1mpiA9oVlfe7oN6
WtWXkFUBgNp/U2OwfFwHtXpmeiv3x4zUulob7WSFkpPuLmDcuRD2SCrprKpMjAff
ouyyljoqFw==
=j/VR
-----END PGP SIGNATURE-----

--txoc7rlouq7hrwvr--
