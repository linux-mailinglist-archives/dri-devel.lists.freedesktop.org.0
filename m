Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D698CD3A83D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 13:14:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ABCB10E427;
	Mon, 19 Jan 2026 12:14:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="LlhyNelP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C32D10E427
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:14:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768824845; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=KcH7GdA7xBbH241i8NfLausAddZyz5ZlVGcytkTvCFJXBaA1vUO5Rp034wbCuKZ3Fqjbxmu4MCMOzor6ONFvrToKZPNYfAJ3q5tUMVj58cLajsxQ5nJhuQWyJradG4fePU7j+UhLknsTkcd1UGRIj+PBk4zWKSadvCwhWUdTRg8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1768824845;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=BfXcIt0tBHjjnsqIXHlPzY4FaLVvmObvvbSPyRVGDJw=; 
 b=B7r2bhf1aqYK4OQhfSjxB7LKy2l0mXKBzV0JObD+J5aXvnXABeA37KdUMKgFJQGsmxTjK1gaW83dsmhSIrxSh4K1wue3eMmCWMvOSwVGPpMwpMDKOxrIfGX3e2+tKPKsizJOhH5yl9g6G5Kafs1SszcRV+ZUPOtNNndiz5jwRh8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768824845; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=BfXcIt0tBHjjnsqIXHlPzY4FaLVvmObvvbSPyRVGDJw=;
 b=LlhyNelPGUcdcnD3sv710vqtJ394DhGzCFIYy1VDO/AqvAtqn8iV315jYgwKQTkg
 iVh6l9dmKL+dt+yz7PIARqIJV3TJEzHUjI7ZVsNDS7ctjEzlzypmJnIIsqCbfSz9y/N
 02gC9vOvF/g4PJdAVl1/5lqZQqQxaSO9WWtyAJPo=
Received: by mx.zohomail.com with SMTPS id 1768824843531275.960036876614;
 Mon, 19 Jan 2026 04:14:03 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260119-thundering-tested-robin-4be817@houat>
Date: Mon, 19 Jan 2026 09:13:43 -0300
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
Message-Id: <14A9284F-A773-4F21-A5FC-9762AE5A5390@collabora.com>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <20260108-delectable-fennec-of-sunshine-ffca19@houat>
 <98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
 <20260119-thundering-tested-robin-4be817@houat>
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



> On 19 Jan 2026, at 07:45, Maxime Ripard <mripard@kernel.org> wrote:
>=20
> On Thu, Jan 08, 2026 at 11:14:37AM -0300, Daniel Almeida wrote:
>> Hi Maxime :)
>>=20
>>>=20
>>> I don't know the typestate pattern that well, but I wonder if we =
don't
>>> paint ourselves into a corner by introducing it.
>>>=20
>>> While it's pretty common to get your clock from the get go into a =
state,
>>> and then don't modify it (like what devm_clk_get_enabled provides =
for
>>> example), and the typestate pattern indeed works great for those, we
>>=20
>> Minor correction, devm_clk_get_enabled is not handled by the =
typestate
>> pattern. The next patch does include this function for convenience, =
but
>> you get a Result<()>. The typestate pattern is used when you want =
more
>> control.
>>=20
>>> also have a significant number of drivers that will have a =
finer-grained
>>> control over the clock enablement for PM.
>>>=20
>>> For example, it's quite typical to have (at least) one clock for the =
bus
>>> interface that drives the register, and one that drives the main
>>> component logic. The former needs to be enabled only when you're
>>> accessing the registers (and can be abstracted with
>>> regmap_mmio_attach_clk for example), and the latter needs to be =
enabled
>>> only when the device actually starts operating.
>>>=20
>>> You have a similar thing for the prepare vs enable thing. The =
difference
>>> between the two is that enable can be called into atomic context but
>>> prepare can't.
>>>=20
>>> So for drivers that would care about this, you would create your =
device
>>> with an unprepared clock, and then at various times during the =
driver
>>> lifetime, you would mutate that state.
>>>=20
>>> AFAIU, encoding the state of the clock into the Clk type (and thus
>>> forcing the structure that holds it) prevents that mutation. If not, =
we
>>> should make it clearer (by expanding the doc maybe?) how such a =
pattern
>>> can be supported.
>>>=20
>>> Maxime
>>=20
>> IIUC, your main point seems to be about mutating the state at =
runtime? This is
>> possible with this code. You can just have an enum, for example:
>>=20
>> enum MyClocks {
>> Unprepared(Clk<Unprepared>),
>>        Prepared(Clk<Prepared>),
>> Enabled(Clk<Enabled>),=20
>> }
>>=20
>> In fact, I specifically wanted to ensure that this was possible when =
writing
>> these patches, as it=E2=80=99s needed by drivers. If you want to, I =
can cover that in
>> the examples, no worries.
>=20
> Yes, that would be great. I do wonder though if it wouldn't make sense
> to turn it the other way around. It creates a fair share of =
boilerplate
> for a number of drivers. Can't we keep Clk the way it is as a
> lower-level type, and crate a ManagedClk (or whatever name you prefer)
> that drivers can use, and would be returned by higher-level helpers, =
if
> they so choose?

The problem with keeping it the way it is that you=E2=80=99re back to =
manual
prepare/unprepare and enable/disable, as the type-state is what=E2=80=99s =
enforcing
the correct order of calls. This is also the case when the type is =
dropped.

In fact, one of the aims of this patch is to get rid of the current Clk =
type
before we have more users. The current series fixes this by enforcing a =
sane
order of operations. Most importantly, it enforces that the refcounts to =
get(),
enable() and etc are handled correctly using the type system.

It rids us of this problem, which is possible today:

clk.enable();
clk.prepare();
clk.prepare();
clk.disable_unprepare();
clk.set_rate();


>=20
> That way, we do have the typestate API for whoever wants to, without
> creating too much boilerplate for everybody else.


But that's how it works in this series. The typestate pattern is opt-in. =
If you
need to "set and forget" there's the devm API that's introduced by the =
next
patch. I can expose more devm_* APIs if you want.

I'm not sure the boilerplate is significant, by the way. You can just =
do:


Clk::<Enabled>::get();


As a starting point, and have the enum thing (which is also simple) _if_ =
you
need to manually enable/disable at runtime. Most of the time, you will =
only
need to mention the type state once, like I did in the call above, and =
then
the type system will figure out the rest when transitions take place.

What boilerplate did you have in mind?

=E2=80=94 Daniel


