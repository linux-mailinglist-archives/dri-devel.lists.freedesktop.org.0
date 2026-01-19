Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F256DD3AA0A
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 14:13:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0277210E455;
	Mon, 19 Jan 2026 13:13:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XXNWw6OB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8F010E454
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 13:13:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9E0324090E;
 Mon, 19 Jan 2026 13:13:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A1A7C116C6;
 Mon, 19 Jan 2026 13:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768828435;
 bh=+CgZWcmNGygQjfD27T+jBsRojt6pw3uvENO+XS4NxvM=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=XXNWw6OBkSaH02cWAwZjvJOZJZXBsqeN2f6csk5pLRwKU5shzpE2NsU3v9YEDJPsH
 HxcwDQK7tfuapzHJdyV+rrcU0+Zk3kVTeosGsJkNUBJx435U7ra+OcGeR+pY8ZKOQ9
 8TxtniuuKmJqYxSO1/7NavnefBHny0TvTF+OOQHEdgAimnSmdAqtcpBm8PucbDJIPf
 9WiKs0Lota3kNRR8lNBq1JsrnWksFx/gDG9myqT+rW7Gd+EjT9DDu/Fabd0IcdQZyb
 ENN4Eoo2lb4iuTU98WnZi+/J3/RPgApwF0FqMzEtPGu+zO7NKR7n0dGkPsaRXw1whH
 gO9xFz8YVSIrg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 14:13:48 +0100
Message-Id: <DFSLCI9U4NCW.2HI2UPUI7G134@kernel.org>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, "Viresh
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
To: "Daniel Almeida" <daniel.almeida@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <20260108-delectable-fennec-of-sunshine-ffca19@houat>
 <98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
 <20260119-thundering-tested-robin-4be817@houat>
 <aW4lCfUyumOKRRJm@google.com>
 <518D8B09-B9A1-4DB4-85CD-37A2DD3D5FB1@collabora.com>
In-Reply-To: <518D8B09-B9A1-4DB4-85CD-37A2DD3D5FB1@collabora.com>
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

On Mon Jan 19, 2026 at 1:54 PM CET, Daniel Almeida wrote:
>> On 19 Jan 2026, at 09:35, Alice Ryhl <aliceryhl@google.com> wrote:
>> I think that if you still want an API where you just call enable/disable
>> directly on it with no protection against unbalanced calls, then that
>> should be the special API. Probably called RawClk and functions marked
>> unsafe. Unbalanced calls seem really dangerous and use should not be
>> encouraged.

+1; and unless there is a use-case that requires otherwise, it should not e=
ven
be possible to do this at all -- at least for driver code.

> I think we should discourage RawClk if at all possible. But if the consen=
sus
> is that we *really* need this easily-abused thing, I can provide a follow=
-up.

I think we should only do this if there are use-case with no alternative, s=
o far
there haven't been any AFAIK.
