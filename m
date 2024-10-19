Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F619A4E0C
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 15:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 864D810E14A;
	Sat, 19 Oct 2024 13:04:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wiredspace.de header.i=@wiredspace.de header.b="0jsJRIhA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com
 [95.215.58.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBCCF10E23B
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 07:54:16 +0000 (UTC)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiredspace.de;
 s=key1; t=1729323926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jSq9GVLt33+jDNVvC/+rsp4P18o8up9zIaShzUja2qs=;
 b=0jsJRIhAzV1ql6BxLFLvaM9IqtbrWF3vNA9BZT2osQ/shuSsz/CGbwyp5QniC878ccgPjC
 cOK7w1i1v2Q3de6G9LVShaGshvciCU3PNH1rIfo0JBtE8u5wiFPcDh/kxiZVM5BZqPbyje
 7Y9Ey9r4wB58B3EIbMmFAd93X0nxa1c=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 19 Oct 2024 09:45:22 +0200
Message-Id: <D4ZM62F6HHAQ.3TLFSGQ3IU0DG@wiredspace.de>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Jocelyn Falempe" <jfalempe@redhat.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/7] drm/panic: avoid reimplementing Iterator::find
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: =?utf-8?q?Thomas_B=C3=B6hler?= <witcher@wiredspace.de>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
References: <20241012075312.16342-1-witcher@wiredspace.de>
 <CANiq72kG0Ai2DHfERD0aPDVuEpLYrZ_2uYdw17=eeHRp+2Q1Rg@mail.gmail.com>
In-Reply-To: <CANiq72kG0Ai2DHfERD0aPDVuEpLYrZ_2uYdw17=eeHRp+2Q1Rg@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Sat, 19 Oct 2024 13:04:47 +0000
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

On Sat Oct 12, 2024 at 1:04 PM CEST, Miguel Ojeda wrote:
> Hi Thomas,

Hi Miguel,

>
> On Sat, Oct 12, 2024 at 9:53=E2=80=AFAM Thomas B=C3=B6hler <witcher@wired=
space.de> wrote:
> >
> > implementing the same logic itself.
> > Clippy complains about this in the `manual_find` lint:
>
> Typically commit messages use newlines between paragraphs.

I wanted to logically group these sentences together, but can also use
paragraphs of course.

> > Reported-by: Miguel Ojeda <ojeda@kernel.org>
> > Closes: https://github.com/Rust-for-Linux/linux/issues/1123
>
> Since each of these commits fixes part of the issue, I think these are
> meant to be `Link:`s instead of `Closes:`s according to the docs:
>
>     https://docs.kernel.org/process/submitting-patches.html#using-reporte=
d-by-tested-by-reviewed-by-suggested-by-and-fixes
>
> In addition, these should probably have a `Fixes:` tag too -- I should
> have mentioned that in the issue, sorry.

Good point, I didn't realise this when I read the documentation. I'll
change/add the trailer as suggested.

> Finally, as a suggestion for the future: for a series like this, it
> may make sense to have a small/quick cover letter saying something as
> simple as: "Clippy reports some issues in ... -- this series cleans
> them up.". Having a cover letter also allows you to give a title to
> the series.

Makes sense, v2 will have a cover letter :)

> Thanks again!

Thank you for the nits, they're exactly what I've been looking forward
to!

I'll prepare a v2 within the coming days as I'm currently limited on
free time, so thank you in advance for the patience.

> Cheers,
> Miguel

Kind regards,

--=20
Thomas B=C3=B6hler
https://wiredspace.de
