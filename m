Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EpJLb8DgmmYNgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 15:18:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AF1DA781
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 15:18:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ADE210E68C;
	Tue,  3 Feb 2026 14:18:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qvZA1lAt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488CF10E05A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 14:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770128313;
 bh=7znWxXYIyAFor7GBuPQ2iXaTErwfqu61GaPtTURriHE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qvZA1lAt8ZY/5dEMmWSkR8L29JOmH/j4xZl98vyrl2DG/cLP2IhKeHPZAD6pz4OA1
 g7mKVbvOzPfqqxcYxYwFq1mogaUBhh7Ao3fPd83SvvnAuxD5HhWIII9j2bb2fV4j/9
 sDkP/3NmyDhV9xJnpYLup9AbtDdpSqzgPeZ11dAU81QbRQ/FVIBVP5A9BrcLxECw7j
 7fZe4VVivXBnAJEQEU1Emc8VdQ/w6R9fGX7FfnxHLT/WWC31+QdnPVzUe5zaE/ks9X
 Gz+wZ6OXmiy4g5ujtJB8f50rWEc3rvBzRHTiQRtQws0A3NWeQjp0MNm3AbfhRrm3Bo
 SGzG3aL2hXr9A==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9FADB17E1276;
 Tue,  3 Feb 2026 15:18:32 +0100 (CET)
Date: Tue, 3 Feb 2026 15:18:28 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Gary Guo <gary@garyguo.net>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Drew Fustini <fustini@kernel.org>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Uwe =?UTF-8?B?S2xlaW5lLUs=?=
 =?UTF-8?B?w7ZuaWc=?= <ukleinek@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?B?QmrDtnJu?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
Message-ID: <20260203151828.669c29cb@fedora>
In-Reply-To: <E786E2B1-E233-45D3-923D-A2DBA54BB166@collabora.com>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <DFSMRQFIYQPO.1A38Y84XZ1GZO@garyguo.net>
 <20260202171038.10e51e18@fedora> <20260203100913.6d224657@fedora>
 <E786E2B1-E233-45D3-923D-A2DBA54BB166@collabora.com>
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
	FORGED_RECIPIENTS(0.00)[m:daniel.almeida@collabora.com,m:gary@garyguo.net,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:dakr@kernel.org,m:aliceryhl@google.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:ukleinek@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-pwm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
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
	FREEMAIL_CC(0.00)[garyguo.net,kernel.org,linaro.org,google.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,redhat.com,baylibre.com,protonmail.com,umich.edu,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 11AF1DA781
X-Rspamd-Action: no action

On Tue, 3 Feb 2026 10:37:15 -0300
Daniel Almeida <daniel.almeida@collabora.com> wrote:

> > On 3 Feb 2026, at 06:09, Boris Brezillon <boris.brezillon@collabora.com=
> wrote:
> >=20
> > Hello Daniel,
> >=20
> > On Mon, 2 Feb 2026 17:10:38 +0100
> > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> >  =20
> >>>> -#[pin_data(PinnedDrop)]
> >>>> +#[pin_data]
> >>>> pub(crate) struct TyrData {
> >>>>     pub(crate) pdev: ARef<platform::Device>,
> >>>>=20
> >>>> @@ -92,13 +92,9 @@ fn probe(
> >>>>         pdev: &platform::Device<Core>,
> >>>>         _info: Option<&Self::IdInfo>,
> >>>>     ) -> impl PinInit<Self, Error> {
> >>>> -        let core_clk =3D Clk::get(pdev.as_ref(), Some(c_str!("core"=
)))?;
> >>>> -        let stacks_clk =3D OptionalClk::get(pdev.as_ref(), Some(c_s=
tr!("stacks")))?;
> >>>> -        let coregroup_clk =3D OptionalClk::get(pdev.as_ref(), Some(=
c_str!("coregroup")))?;
> >>>> -
> >>>> -        core_clk.prepare_enable()?;
> >>>> -        stacks_clk.prepare_enable()?;
> >>>> -        coregroup_clk.prepare_enable()?;
> >>>> +        let core_clk =3D Clk::<Enabled>::get(pdev.as_ref(), Some(c_=
str!("core")))?;     =20
> >>>=20
> >>> Ah, more turbofish.. I'd really want to avoid them if possible.
> >>>=20
> >>> Any disadvantage on just ask the user to chain `.get().prepare_enable=
()?`? This
> >>> way it is also clear that some action is performed.   =20
> >>=20
> >> I've just disc =20
> >=20
> > Sorry, I've hit the reply button before I had finished writing my
> > answer. So I was about to say that I had started writing something
> > similar without knowing this series existed, and I feel like we'd don't
> > really need those prepare_enable() shortcuts that exist in C. We might
> > has well just go:
> >=20
> > Clk::get(dev, Some(c_str!("core"))).prepare()?.enable()?;
> >=20
> > and have the following variant-specofoc functions
> >=20
> > - Clk<Unprepared>::get[_optional]() (no get on Prepared and Enabled
> >  variants)
> > - Clk<Unprepared>::prepare()
> > - Clk<Prepared>::{enable,unprepare}()
> > - Clk<Enabled>::{disable}()
> >=20
> > Regards,
> >=20
> > Boris
> >=20
> >  =20
>=20
>=20
> I don=E2=80=99t understand how is this better than the turbofish we curre=
ntly have.
>=20
> In other words, how is this:
>=20
> Clk::get(dev, Some(c_str!("core"))).prepare()?.enable()?;
>=20
> Better than this:
>=20
> Clk::<Enabled>::get(/*=E2=80=A6*/);

For one, it doesn't force you to expose multiple functions in the
implementation (::get[_optional]() is only present in the Unprepared
impl variant, no shortcut to combine state transition, ...) which means
less code to maintain overall. But I also prefer the fact this clearly
reflects the state transitions that exist to get an Enabled clk (first
you get an Unprepared clk that you have to prepare and enable to turn
that into an Enabled clk). That's a matter of taste of course, just
saying that if we get rid of the turbofish syntax like Gary suggested
at some point, I think I'd find it clearer to also just expose the
transitions between two consecutive states, and let the caller go
through all the steps.
