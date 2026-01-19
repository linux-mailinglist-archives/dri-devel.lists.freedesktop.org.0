Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F77FD3AF68
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 16:45:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE8710E49C;
	Mon, 19 Jan 2026 15:45:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="KxW9bP5V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1FB510E49A
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 15:45:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768837515; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=eoL4anMNIFCNVXUGpwYCuMW8aapkcG8L+IAN470CthTc1LenglW7Ny9fZxnWHWiKXApg9J1X03jXK198PtsRp7WTLiW5hTKITq/A5+FU5Wpil4gKW19pBLelOvPuWUdMIZ8acK9XASygSL6pvbsOBH3aiVrNKhqCq66dYlHTd7E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1768837515;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=+rU0eXeKg2yMjigsFoDJa3iuRWBFFdh53RB8m7idKP8=; 
 b=XjETq4XwCFHKZ1llhEHi5oJL4mFU2YLBrair61IXJvP0gj8eNfOkXyF0QMFWqiEHMrtyC5vQWv5Q4Fw6NHicjcrEAaGC52/uslJDU43JBajfwG6/+PksXUnIcm9qNgp20AGfoodKOA5NlFH+tQAG914tKKJW1/+eGUk0KPYZLMg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768837515; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Content-Transfer-Encoding:From:From:Mime-Version:Subject:Subject:Date:Date:Message-Id:Message-Id:References:Cc:Cc:In-Reply-To:To:To:Reply-To;
 bh=+rU0eXeKg2yMjigsFoDJa3iuRWBFFdh53RB8m7idKP8=;
 b=KxW9bP5VDZNbOlWgvCNIH/cGiJvmdNzK4UwcL21DpmkPb7QV6BtrOn0kp1lVkNsY
 STwHPCZUaLRxMtMaeVA2Q3m8lgTJ7jFoJ6Q4+0/Dl4AZ/cgNOeqeGeC4/YtzNf97hzh
 3vgTkqwFsAyy24DslR8sohh6YqiG+mT5kZMXsWRM=
Received: by mx.zohomail.com with SMTPS id 1768837512991874.9478843764485;
 Mon, 19 Jan 2026 07:45:12 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Daniel Almeida <daniel.almeida@collabora.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
Date: Mon, 19 Jan 2026 12:44:47 -0300
Message-Id: <533CE7C2-A42A-43DF-8D23-B7D6AE346C4E@collabora.com>
References: <DFSMW4IERCOT.1QCQ4CAY8KJFK@garyguo.net>
Cc: Maxime Ripard <mripard@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Drew Fustini <fustini@kernel.org>,
 Ren Guo <guoren@kernel.org>, Wei Fu <wefu@redhat.com>,
 =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Gary Guo <gary@garyguo.net>
In-Reply-To: <DFSMW4IERCOT.1QCQ4CAY8KJFK@garyguo.net>
To: Gary Guo <gary@garyguo.net>
X-Mailer: iPhone Mail (23C55)
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


>> Yes, that would be great. I do wonder though if it wouldn't make sense
>> to turn it the other way around. It creates a fair share of boilerplate
>> for a number of drivers. Can't we keep Clk the way it is as a
>> lower-level type, and crate a ManagedClk (or whatever name you prefer)
>> that drivers can use, and would be returned by higher-level helpers, if
>> they so choose?
>>=20
>> That way, we do have the typestate API for whoever wants to, without
>> creating too much boilerplate for everybody else.
>=20
> One solution is to have a new typestate `Dynamic` which opts to track thin=
gs
> using variables.
>=20
> struct Dynamic {
>    enabled: bool,
>    prepared: bool,
> }
>=20
> trait ClkState {
>    // Change to methods
>    fn disable_on_drop(&self) -> bool;
> }
>=20
> struct Clk<State> {
>    ...
>    // Keep an instance, which is zero-sized for everything except `Dynamic=
`
>    state: State,
> }
>=20
> this way we can have runtime-checked state conversions.
>=20
> Best,
> Gary

There used to be a Dynamic state in the past in a similar setting. That was r=
emoved after some thorough discussion. I=E2=80=99d say we should refrain fro=
m going back to this. Specially considering that the current design works fi=
ne.

 I can remove the turbofish if you want, even though I think they=E2=80=99re=
 useful so that we have the same API for all states.

=E2=80=94 Daniel



