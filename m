Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E57D3A98D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 13:54:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4BB810E430;
	Mon, 19 Jan 2026 12:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="R4MWI0V3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34FC10E430
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:54:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768827273; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=EMz8U/slnbqZVwl92w3iqz0shk9k0y/WL1n4Htr0AfZoktCSU5Zn2K/B6CnCFrrc9d6+/HFPvpmxX8rA/xcsSKodl2lTrrHK9qDyE4QOUpOcFw6O+4ImOfsARRtC6sPthf005IKkfRFZH/io0om/gAaUyjIzngjBGg5Jur98t94=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1768827273;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=zLDnJZLgAOrpoEGFnBjgHoA0s4migwFpwVUCiQLiYbE=; 
 b=auuDHlGY39i8UFoY2S3ax0Ylo3TMvo/gCo8Ydo+0OembHXTR86/6E4pnwWPkDsEKL9KRxX74cIxpKPpo4tuJUwu3ADAT2EQIaUJOW+LqGXakCFnPJJJjBbShQyJH3mCRJD8xRYOO2M7VG2EaqSDqK3jtsJWkSVDyI2kr7zugf7s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768827273; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=zLDnJZLgAOrpoEGFnBjgHoA0s4migwFpwVUCiQLiYbE=;
 b=R4MWI0V3IEJiVaX8Hq9T9sxTQcgm9LF2HJ0ECpjnvRIG7s4E4c2DlRzP2kCq2vZt
 vxIbkTXjyOlGqjskS0iuccLwzIKp8dRdbmkrLrmlBjWafvqM8YlWU3GlUj+sR0rs3N4
 HzPR0YjucxiEXXyp95gt6LvlwbYSs8Hmlcc5DVS4=
Received: by mx.zohomail.com with SMTPS id 176882727146931.323097316967164;
 Mon, 19 Jan 2026 04:54:31 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <aW4lCfUyumOKRRJm@google.com>
Date: Mon, 19 Jan 2026 09:54:10 -0300
Cc: Maxime Ripard <mripard@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <518D8B09-B9A1-4DB4-85CD-37A2DD3D5FB1@collabora.com>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <20260108-delectable-fennec-of-sunshine-ffca19@houat>
 <98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
 <20260119-thundering-tested-robin-4be817@houat> <aW4lCfUyumOKRRJm@google.com>
To: Alice Ryhl <aliceryhl@google.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
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



> On 19 Jan 2026, at 09:35, Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> On Mon, Jan 19, 2026 at 11:45:57AM +0100, Maxime Ripard wrote:
>> On Thu, Jan 08, 2026 at 11:14:37AM -0300, Daniel Almeida wrote:
>>>> For example, it's quite typical to have (at least) one clock for =
the bus
>>>> interface that drives the register, and one that drives the main
>>>> component logic. The former needs to be enabled only when you're
>>>> accessing the registers (and can be abstracted with
>>>> regmap_mmio_attach_clk for example), and the latter needs to be =
enabled
>>>> only when the device actually starts operating.
>>>>=20
>>>> You have a similar thing for the prepare vs enable thing. The =
difference
>>>> between the two is that enable can be called into atomic context =
but
>>>> prepare can't.
>>>>=20
>>>> So for drivers that would care about this, you would create your =
device
>>>> with an unprepared clock, and then at various times during the =
driver
>>>> lifetime, you would mutate that state.
>=20
> The case where you're doing it only while accessing registers is
> interesting, because that means the Enable bit may be owned by a local
> variable. We may imagine an:
>=20
>    let enabled =3D self.prepared_clk.enable_scoped();
>    ... use registers
>    drop(enabled);


Not sure I understand. You can get a Clk<Enabled>, do what you need, and =
then
consume Clk<Enabled> to go back to Clk<Prepared>. I think I added this, =
but if
I didn=E2=80=99t, it=E2=80=99s a trivial thing to do.

>=20
> Now ... this doesn't quite work with the current API - the current
> Enabled stated owns both a prepare and enable count, but the above =
keeps
> the prepare count in `self` and the enabled count in a local variable.
> But it could be done with a fourth state, or by a closure method:
>=20
>    self.prepared_clk.with_enabled(|| {
>        ... use registers
>    });
>=20
> All of this would work with an immutable variable of type =
Clk<Prepared>.
>=20
>>>> AFAIU, encoding the state of the clock into the Clk type (and thus
>>>> forcing the structure that holds it) prevents that mutation. If =
not, we
>>>> should make it clearer (by expanding the doc maybe?) how such a =
pattern
>>>> can be supported.
>>>>=20
>>>> Maxime
>>>=20
>>> IIUC, your main point seems to be about mutating the state at =
runtime? This is
>>> possible with this code. You can just have an enum, for example:
>>>=20
>>> enum MyClocks {
>>>    Unprepared(Clk<Unprepared>),
>>>    Prepared(Clk<Prepared>),
>>>    Enabled(Clk<Enabled>),=20
>>> }
>=20
> I believe you need an extra state if the state is not bound to the =
scope
> of a function:
>=20
> enum MyClocks {
>    Unprepared(Clk<Unprepared>),
>    Prepared(Clk<Prepared>),
>    Enabled(Clk<Enabled>),=20
>    Transitioning,
> }
>=20
> since mem::replace() needs a new value before you can take ownership =
of
> the existing Clk value.

Right, I need to update the docs to account for this, as they imply that =
you
can do this with only two states.

>=20
>>> In fact, I specifically wanted to ensure that this was possible when =
writing
>>> these patches, as it=E2=80=99s needed by drivers. If you want to, I =
can cover that in
>>> the examples, no worries.
>>=20
>> Yes, that would be great. I do wonder though if it wouldn't make =
sense
>> to turn it the other way around. It creates a fair share of =
boilerplate
>> for a number of drivers. Can't we keep Clk the way it is as a
>> lower-level type, and crate a ManagedClk (or whatever name you =
prefer)
>> that drivers can use, and would be returned by higher-level helpers, =
if
>> they so choose?
>>=20
>> That way, we do have the typestate API for whoever wants to, without
>> creating too much boilerplate for everybody else.
>=20
> I think that if you still want an API where you just call =
enable/disable
> directly on it with no protection against unbalanced calls, then that
> should be the special API. Probably called RawClk and functions marked
> unsafe. Unbalanced calls seem really dangerous and use should not be
> encouraged.

I think we should discourage RawClk if at all possible. But if the =
consensus
is that we *really* need this easily-abused thing, I can provide a =
follow-up.

>=20
> The current type-state based API is the least-boilerplate option for
> drivers that exist today.
>=20
> Alice

