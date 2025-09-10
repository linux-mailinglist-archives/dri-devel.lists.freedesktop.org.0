Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A771B52328
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 22:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B12A310E9E1;
	Wed, 10 Sep 2025 20:58:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X/aaX0WF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694A410E9E1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 20:58:05 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-325006ff07eso632289a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 13:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757537885; x=1758142685; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BxoYv6ear/flR5rAr5c7A/wGu93sOLIbo2XqrISjEys=;
 b=X/aaX0WFGcT8WqlnOHCjAaNPEddhWowfbJ7wDt8wWXmTo2nSXK6JW6YiUM9YBTu05N
 GRABE7F5Jiuq3u5f4h0dANNuSRPV1Z6zy0VxgvbjZAVvWre4KJKm9vo4DVki0vXbb13M
 obScn7TCWBhuvUW3rELr08skDLVX7zB9oYdIAy/M+R7OtJ4CVLsG7rnBUkWlypZdoNcv
 dJb0bZOOS5TqXa9fGiNorlTWDodptTRUwzF4+dm3wGFwGb+uR5P3/QN23pIF8UiTbIOp
 0OI2ITCJKDCqh5nnkpjlU6Cyq41GXa+rUUox67lES0qEoIIHhGopTIDBlaoo4/31u9Qu
 m8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757537885; x=1758142685;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BxoYv6ear/flR5rAr5c7A/wGu93sOLIbo2XqrISjEys=;
 b=SOwmkuFTBMJXB14BHi5z544O3MnRoXauOrh+Cx+6RG7i5NaTEEdW2v5rzx+hvYFEk8
 5B6pe4jrWKeVeybO33lPo1wbHm9rJjhVSz4fEBHEwsWrGw5jiUdt+TcNjFX+ZMD+Lrux
 f3KJAdDwgXE8/qHQJqgJMvZGe2HuoqP2ZkzsSSKAVA6BHyH9T54BlCuCWxZmbUlpRJ1C
 S9WgME2N71VebSDD3v2BkNa9xEpWd41wQIECYAms3/KWSdUkDB+CxAzYoHqvO3zG0QEL
 WiXTQ7btrQhnfgjvuLc2dQVHuARQpSMxFQNqs02ikd2nr3jmxSdUf5Iy2ZDkVnH2GG9U
 7OZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5r4hJ4WX5+ntBwkTG1ipDkSBOakGkNW2MCgYN/kUquXrBarsixOnVQsiY7BzQ9mnlbYhUtX8oHZ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNh2fco/2Xv0SuEpvqwhojmV4BxVoK6O+MCBta8+sjnuG0WtJC
 Or+EdHcAyPoyj0cj6eLx1giEV2KPWF32OY5f7OQ4OoDp5ghQOv1L972cqmja36GuX5ueHjCb3pC
 xelKPMMlZQ6CpS6G1Bc+31x0PQdFFGvk=
X-Gm-Gg: ASbGncuvbAIYeaaAYa5Kuch0uTMIMlKk/TQ/xCYqy9xMeRfFZxvJNHcBlKb1y5du/av
 I5NYQa3FeuaHoZejKf5+aQ/zGOKfdmsIRLk3xgsHmzetQZaafBkKV35r0Itt3mcx2tALWNEr7uK
 415qhCzir316l/3EkiUdwj7EfmkeimFkJ3u4UmJtFCVSsRYQyJ+ANj/IVIiEAZVXzFJV1qjRedl
 KYDYY6w6xARtMcHi1jJ2ve/I+wKRrubbaWUQLC9GGqgin1T0HNEa4LiinOSKzLR/mLAgLZPiBOU
 N/FXLRuqwnVAXG3ZFsdxAsCB0efCIeXq+S+K
X-Google-Smtp-Source: AGHT+IHOtyqVloSPxzWiVhs1DHE+nqj8s6NxjWWTZ+mliqirt76YYBTxY96SyGIZl1OENRfeSA3lt8/1dOvRBF8z1YY=
X-Received: by 2002:a17:90b:4a92:b0:32b:87ef:5faa with SMTP id
 98e67ed59e1d1-32d43f91aadmr12103792a91.4.1757537884710; Wed, 10 Sep 2025
 13:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
 <20250826-nova_firmware-v2-2-93566252fe3a@nvidia.com>
 <9adb92d4-6063-4032-bf76-f98dcfe2c824@nvidia.com>
 <DCD2VJ1WJW2O.VM7E4PD3DFYO@nvidia.com>
 <CANiq72=nGbziZCKt=AneE_vXw76i=+td0dSVfbOJ8kJ9eYHw9w@mail.gmail.com>
 <DCOVRI3TVJBN.3OGDSK8HW74LL@nvidia.com>
 <CANiq72n-q0vdzp=Tb=brue+BMoNYdCTKsqcMYUsvKgvu9ZqGoQ@mail.gmail.com>
 <DCP66O4WE3CE.3P5ZHC9P62LOZ@nvidia.com>
In-Reply-To: <DCP66O4WE3CE.3P5ZHC9P62LOZ@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 10 Sep 2025 22:57:51 +0200
X-Gm-Features: AS18NWDK5sDVUBXgL53C4CuHgNvckurg2KJki-Oyxxcp6gSr_EFeu2funPREjNc
Message-ID: <CANiq72=2VhHBZbTL7mdF9C+eBabft8rpP0_8FjxKi2d_2ZMbCQ@mail.gmail.com>
Subject: Re: Implicit panics (was: [PATCH v2 2/8] gpu: nova-core: firmware:
 add support for common firmware header)
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, Sep 10, 2025 at 3:55=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> The only two options are either allowing user-space to crash the kernel
> through a module with a missing bound check, or letting it tamper with

So we are definitely not aiming to allow that on purpose, i.e. I know
you said "missing", but just to clarify: they would of course be
considered a bug, just like hitting similar facilities in C code.

(In general, if we get into the situation where we can actually crash
the kernel from userspace, that is a CVE with the current rules
(modulo exceptional cases, e.g. the recent discussion about debugging
tools, for instance), regardless of whether it was due to a Rust panic
or not.)

The Rust panic is, as you say, the last line of defense, attempting to
limit the damage. I think that is worth it for at least some users
that want it (like cloud providers) and some parts of the kernel.
Sometimes it can be worse, though, i.e. perhaps the OOB or the
overflow was not actually a "big issue" "in practice" for a particular
case.

I think it will likely depend on the kind of code we are talking about
-- not all panics are the same, and not all code is the same. For
random modules, for instance, yes, we should definitely prevent
developers from writing panics as much as possible (or not at all);
the same way we try to prevent them from writing unsafe code -- after
all, panicking operations and unsafe code are both an statement that
we are sure "something cannot happen".

So the more we prevent APIs that do not need to rely on panicking (nor
unsafe code) on drivers etc., the better.

I also think forcing to have no panics at all (i.e. globally) would
force us to handle way more truly impossible cases than C does
(unsafely so), which isn't great and has downsides too (increased
complexity, for one, which can also lead to more bugs). And we don't
want to go memory unsafe for all those either (I mean, it could be an
option, but I wouldn't recommend it, and it would still be a bug if
hit). So for certain cases panicking may be a reasonable option in
practice -- that is where I wanted us to get more experience to know
how we fare vs. C here and thus the data request.

It will also depend on what upstream Rust can give us (more on that
below). For instance, having an enforced way with carve-outs that need
to be annotated would at least make it stand out to reviewers and make
developers think thrice.

> Thanks, these are great directions to explore. I see that some thinking
> has already been done on this, do we have a bug or tracking issue so I
> can catch up with the discussions that have already taken place?

In general, I do my best to track this kind of thing in the issues
linked from issue #2 ("Rust features" in this case:
https://github.com/Rust-for-Linux/linux/issues/354), and you can see
some pointers for the overflow part. For no panics there is also an
entry for a long time, but I don't think there has been any "deep"
discussion on it -- I mean between Rust and the kernel (there are of
course discussions in upstream Rust, and there also have been in our
side in the mailing list). I just added a couple recent pointers, I
can look for more.

In that meeting I mentioned with them, I raised this a month or two
ago, and I did so today too, and mentioned that you wanted to discuss
it in LPC. If you (or e.g. someone from NVIDIA) have time to work on
this, including in upstream Rust (e.g. writing an RFC, implementing an
experiment...), then please let me know. They are open to the
possibility of having a Rust project goal for the next round on no
panics (2026H1), so it is a good chance to move things forward. We had
today a discussion on potential forms it could take (an attribute on a
function, guaranteed or not, escape hatches or not, lints, an enforced
comment, Klint, the report-and-continue feature...) and related
ongoing efforts (having a `nopanic` effect, `target_feature(enable
=3D`...).

I hope that helps, and thanks!

Cheers,
Miguel
