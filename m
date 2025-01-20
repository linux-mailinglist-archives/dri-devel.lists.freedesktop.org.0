Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF862A1747A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 23:03:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6F010E49C;
	Mon, 20 Jan 2025 22:03:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 33462 seconds by postgrey-1.36 at gabe;
 Mon, 20 Jan 2025 22:03:21 UTC
Received: from luna.linkmauve.fr (unknown
 [IPv6:2a01:e0a:828:c7c0:e2d5:5eff:fe2d:8e8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB4D10E49C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 22:03:21 +0000 (UTC)
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
 id E7082231D340; Mon, 20 Jan 2025 23:03:19 +0100 (CET)
Date: Mon, 20 Jan 2025 23:03:19 +0100
From: Link Mauve <linkmauve@linkmauve.fr>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH] drm/panic: fix compilation issue on ARM
Message-ID: <Z47IJ-2tPDIVzMA4@desktop>
References: <20250120124531.2581448-1-linkmauve@linkmauve.fr>
 <CANiq72n1YpUowTh3Hdjo5auOmTTUU1-8d2FTL3e=Oyu3Q=-BkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72n1YpUowTh3Hdjo5auOmTTUU1-8d2FTL3e=Oyu3Q=-BkQ@mail.gmail.com>
Jabber-ID: linkmauve@linkmauve.fr
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

On Mon, Jan 20, 2025 at 10:52:48PM +0100, Miguel Ojeda wrote:
> Hi Emmanuel,

Hi Miguel,

> 
> On Mon, Jan 20, 2025 at 1:45 PM Emmanuel Gil Peyrot
> <linkmauve@linkmauve.fr> wrote:
> >
> > In C, the char type is specified with “The implementation shall define char to
> > have the same range, representation, and behavior as either signed char or
> > unsigned char.”
> >
> > On x86 it defaults to signed char, and on ARM it defaults to unsigned char.
> > This carries over to Rust’s FFI, which aliases its c_char type to i8 on x86,
> > and to u8 on ARM.
> 
> In the kernel `-funsigned-char` is used, see commit 3bc753c06dd0
> ("kbuild: treat char as always unsigned").
> 
> In any case, the change is fine, because we want to use the proper
> type, but this is already in the Rust PR for this cycle, which should
> land in mainline in some days, see commit 27c7518e7f1c ("rust: finish
> using custom FFI integer types") in rust-next.

Oh I see, I hadn’t read that merge request before submitting this fix, I
just tried to build the current kernel and it failed and I identified it
as a common issue I’ve already experienced in userspace.

> 
> However, I am nevertheless confused, because in mainline
> `crate::ffi::c_char` is `core::ffi::c_char` which is `i8` in both
> arm64 and x86_64 and thus there is no build issue there.

That’s weird, I clearly see the error I mentioned in my first email,
when building with today’s nightly compiler (maybe that’s relevant?).

> 
> If by ARM you mean 32-bit, then we don't have support for it yet in
> mainline, so you shouldn't be able to see it there either.

I am building an AArch64 kernel from an amd64 build computer.

> 
> Could you please clarify? Are you using patches on top of mainline,
> e.g. the 32-bit arm support one?

Nope, I was building a 6.13.0 kernel straight from torvalds’s master
branch, so the issue will likely be present on the 6.13.y branch as
well.  Perhaps my patch can be applied to that branch only, if rust-next
will be merged soon.  Otherwise I guess we could also live without
drm_panic support on AArch64 for the 6.13 kernel.

> 
> Thanks!
> 
> Cheers,
> Miguel

-- 
Link Mauve
