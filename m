Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEB8D03406
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 15:15:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D932310E73F;
	Thu,  8 Jan 2026 14:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Q33QbIuW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E54710E73F
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 14:15:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1767881700; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=OgOvL1Aj2mnVcSiCXZanKA1S2JdaXAst4uy2XsutDQ64qK5oFfGqRgArHiHCtndDXzUHyUglqp4e1p9rkbhB2n49oY4Xfilsi2M9jg0wFw1h2CRYWss+qp68deHhYUG46wLfl8tTD7BDelMwiu6JEoSGy0hvabtZfkM9wXLv74Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1767881700;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=8UM2EJGpOoTDr6b1jkTnYeu3NfhCiVAeZ2kTc9yJTiU=; 
 b=AD5CegN4htv3QyoMFvZpDT+YdBJBhdtnI7h9fdWt0CNf3Izg69j1OZnXioURgb+4WkvTzWkSbMmW7QPbxTodVhnJXQagYghw/9JcQ8PrcphqG+/Tmst1UUoB5hWWtBOEWMdKByYbnEv8G0oldS5fSqSFFVJuBj77WLlnPU0rrPo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767881700; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=8UM2EJGpOoTDr6b1jkTnYeu3NfhCiVAeZ2kTc9yJTiU=;
 b=Q33QbIuWQqMUSKdgziXZxyPQwxnQgEqOfTPTd/jfY10/4wxZfV95J4iBJSGVD4i0
 W0gRtPHqTzxUelPNlZg39Mx3gLKNHuSuAKKDRmWAmfORaK8B4uzbpKMtLhttQNVN+oW
 OhlEFTn4MRJkMinkcQUfSZM4U61Wh3EQ7djT+4qg=
Received: by mx.zohomail.com with SMTPS id 1767881698439518.0714680558849;
 Thu, 8 Jan 2026 06:14:58 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260108-delectable-fennec-of-sunshine-ffca19@houat>
Date: Thu, 8 Jan 2026 11:14:37 -0300
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
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
Message-Id: <98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <20260108-delectable-fennec-of-sunshine-ffca19@houat>
To: Maxime Ripard <mripard@kernel.org>
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

Hi Maxime :)

>=20
> I don't know the typestate pattern that well, but I wonder if we don't
> paint ourselves into a corner by introducing it.
>=20
> While it's pretty common to get your clock from the get go into a =
state,
> and then don't modify it (like what devm_clk_get_enabled provides for
> example), and the typestate pattern indeed works great for those, we

Minor correction, devm_clk_get_enabled is not handled by the typestate
pattern. The next patch does include this function for convenience, but
you get a Result<()>. The typestate pattern is used when you want more
control.

> also have a significant number of drivers that will have a =
finer-grained
> control over the clock enablement for PM.
>=20
> For example, it's quite typical to have (at least) one clock for the =
bus
> interface that drives the register, and one that drives the main
> component logic. The former needs to be enabled only when you're
> accessing the registers (and can be abstracted with
> regmap_mmio_attach_clk for example), and the latter needs to be =
enabled
> only when the device actually starts operating.
>=20
> You have a similar thing for the prepare vs enable thing. The =
difference
> between the two is that enable can be called into atomic context but
> prepare can't.
>=20
> So for drivers that would care about this, you would create your =
device
> with an unprepared clock, and then at various times during the driver
> lifetime, you would mutate that state.
>=20
> AFAIU, encoding the state of the clock into the Clk type (and thus
> forcing the structure that holds it) prevents that mutation. If not, =
we
> should make it clearer (by expanding the doc maybe?) how such a =
pattern
> can be supported.
>=20
> Maxime

IIUC, your main point seems to be about mutating the state at runtime? =
This is
possible with this code. You can just have an enum, for example:

enum MyClocks {
	Unprepared(Clk<Unprepared>),
        Prepared(Clk<Prepared>),
	Enabled(Clk<Enabled>),=20
}

In fact, I specifically wanted to ensure that this was possible when =
writing
these patches, as it=E2=80=99s needed by drivers. If you want to, I can =
cover that in
the examples, no worries.

Same for Regulator<T>, by the way.

=E2=80=94 Daniel=
