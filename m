Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BF0D3AC3B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 15:37:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8845410E470;
	Mon, 19 Jan 2026 14:37:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g+EN7LOJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD3C10E470
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 14:37:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3D1C841AD3;
 Mon, 19 Jan 2026 14:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B64A4C116C6;
 Mon, 19 Jan 2026 14:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768833444;
 bh=CSTmPBA6jWnROZuwiJTIQySlhBcVu9NnVrQTCL3GAR4=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=g+EN7LOJd5DlifzhjK5E3WGKGFyat9PZSAr8WAdmz92XyVQwA0sE/+zXvsfHrjksQ
 OzdVmrMR3A/aRfcu/3/a0yumSxnw0rPX+iBlowxF1yAGR8zh/F1xYC90p+YvxlsH3O
 wMLpMieaxjyyQMQeCeBS1XOvZKPKITy9j2MgViu9ZHZow3Ud3u7Gv8+AziAiCXF8so
 En3otoLhwMVyrfC6vukQRGMfXLyhBp3d5j6ey6aacwOFGcn+gDlSVGFgm1iS1mX6DW
 e7vP5v4tJCpBSILrj/cOdTfMrqHDnqSUfdzt0XVst1ej3wx6AJUgrv8QMkU5OLUF5/
 HWAhYAbPvnOuw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 15:37:17 +0100
Message-Id: <DFSN4FDCYHMW.3J3237PEBV2ZP@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, "Viresh
 Kumar" <viresh.kumar@linaro.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Drew Fustini" <fustini@kernel.org>, "Guo Ren"
 <guoren@kernel.org>, "Fu Wei" <wefu@redhat.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-riscv@lists.infradead.org>,
 <linux-pwm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
To: "Maxime Ripard" <mripard@kernel.org>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <20260108-delectable-fennec-of-sunshine-ffca19@houat>
 <98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
 <20260119-thundering-tested-robin-4be817@houat>
 <aW4lCfUyumOKRRJm@google.com>
 <518D8B09-B9A1-4DB4-85CD-37A2DD3D5FB1@collabora.com>
 <DFSLCI9U4NCW.2HI2UPUI7G134@kernel.org>
 <20260119-weightless-pelican-of-anger-190db0@houat>
In-Reply-To: <20260119-weightless-pelican-of-anger-190db0@houat>
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

On Mon Jan 19, 2026 at 3:18 PM CET, Maxime Ripard wrote:
> On Mon, Jan 19, 2026 at 02:13:48PM +0100, Danilo Krummrich wrote:
>> On Mon Jan 19, 2026 at 1:54 PM CET, Daniel Almeida wrote:
>> >> On 19 Jan 2026, at 09:35, Alice Ryhl <aliceryhl@google.com> wrote:
>> >> I think that if you still want an API where you just call enable/disa=
ble
>> >> directly on it with no protection against unbalanced calls, then that
>> >> should be the special API. Probably called RawClk and functions marke=
d
>> >> unsafe. Unbalanced calls seem really dangerous and use should not be
>> >> encouraged.
>>=20
>> +1; and unless there is a use-case that requires otherwise, it should no=
t even
>> be possible to do this at all -- at least for driver code.
>
> I mean, it's great, it's safe, etc. but it's also suboptimal from a PM
> perspective on many platforms. It's totally fine to provide nice, safe,
> ergonomic wrappers for the drivers that don't care (or can't, really),
> but treating a legitimate optimisation as something we should consider
> impossible to do is just weird to me.

I said that an unsafe API with potentially unbalanced calls is something we
should clearly avoid for drivers. This is *not* equivalent to "treating a
legitimate optimisation as something we should consider impossible".

If we discover use-cases where the current API doesn't work well, we can
invenstigate further.

>> > I think we should discourage RawClk if at all possible. But if the con=
sensus
>> > is that we *really* need this easily-abused thing, I can provide a fol=
low-up.
>>=20
>> I think we should only do this if there are use-case with no alternative=
, so far
>> there haven't been any AFAIK.
>
> I don't really care about which alternative we come up with, but look at
> devm_regmap_init_mmio_clk for example. It is a valid use-case that
> already exists today, and has had for more than a decade at this point.

I don't see the issue with devm_regmap_init_mmio_clk()? It takes a referenc=
e
count of the clock and prepares it when called and unprepares the clk in dr=
ops
its reference in regmap_mmio_free_context() called from the devres callback=
.

That something we can easily do with the current API, no?
