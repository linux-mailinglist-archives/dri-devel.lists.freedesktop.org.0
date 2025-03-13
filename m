Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB4FA5FBC2
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 17:32:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE7610E907;
	Thu, 13 Mar 2025 16:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pfUdbEav";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA36110E8F0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 16:32:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DA5365C61CC;
 Thu, 13 Mar 2025 16:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2901BC4CEEB;
 Thu, 13 Mar 2025 16:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741883519;
 bh=D1wJYQ4E1c6EX9Y7XAzWUJGTuFgvctcFIgyy0djnxcY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pfUdbEavUcaxItWtO14JhEGoMOStRWraM6Cg5fbkwenfkqVFwHwVSaAG7rwvG4c4I
 h1v/NqSIluz2CpaxKqgI1v8hl8/C8sucDxg8/g4ViLwNzYoB6tx06JVfQfZWQGbeDo
 rLDVY6dkNG46MKi5/Nf/oDuKgCFvLEiT67KGzZ6PEyxKLEm7lh2VWEFVTewNMqdvoN
 v3UISxZiz1yJF3+vEDqNXvJyNE2BrT1kFLiqIE6goUGS7lPwVYGcTW3uFrqW3yI/Dm
 nmexUvJE8NoHEznGvOdvTEFXz6tPZDOXaDq6QrA4gcD+o23kAWeXsatMvI+TAVhD3s
 vjSOLWhiNJL2Q==
Date: Thu, 13 Mar 2025 17:31:53 +0100
From: Benjamin Tissoires <bentiss@kernel.org>
To: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-input@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jiri Kosina <jikos@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH RFC 0/3] Initial work for Rust abstraction for HID device
 driver development
Message-ID: <f6rizzlygznuebh22psrdkzfki7jfjzfaamuolobvpbgxoxjoi@gfu2eyzrm5wl>
References: <20250313160220.6410-2-sergeantsagara@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313160220.6410-2-sergeantsagara@protonmail.com>
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

Hi,

[quick reply because I am completely under the water for the next 2
weeks]

On Mar 13 2025, Rahul Rameshbabu wrote:
> Hello,
> 
> I am a hobbyist developer who has been working on a project to create a new Rust
> HID device driver and the needed core abstractions for writing more HID device
> drivers in Rust. My goal is to support the USB Monitor Control Class needed for
> functionality such as backlight control for monitors like the Apple Studio
> Display and Apple Pro Display XDR. A new backlight API will be required to
> support multiple backlight instances and will be mapped per DRM connector. The
> current backlight API is designed around the assumption of only a single
> internal panel being present. I am currently working on making this new API for
> DRM in parallel to my work on the HID side of the stack for supporting these
> displays.

Thanks a lot for this work, though I wonder if your goal is not too big,
too far from the HID point of view. HID is simple, and there is only a
few bindings that you would need to be able to make "simple" HID
drivers.

My assumption would be to introduce the binding with a functional but
small driver (like one that just changes the report descriptor, or does
a sime raw event processing). Then we can look at integrating with the
DRM interface.

Though it's up to you to decide how you want to play ;)

> 
>   https://binary-eater.github.io/tags/usb-monitor-control/
> 
> Julius Zint had attempted to do so a year ago with a C HID driver but was gated
> by the lack of an appropriate backlight API for external displays. I asked him
> for permission to do the work need in Rust and plan to accredit him for the HID
> report handling for backlight in the USB Monitor Control Class standard.
> 
>   https://lore.kernel.org/lkml/f95da7ff-06dd-2c0e-d563-7e5ad61c3bcc@redhat.com/
> 
> I was hoping to get initial feedback on this work to make sure I am on the right
> path for making a Rust HID abstraction that would be acceptable upstream. The
> patches compile with WERROR being disabled. This is necessary since Rust treats
> missing documentation comments as warnings (which is a good thing). I also need
> to go in and add more SAFETY comments.

K, I'll give you my opinion in the patches as the HID co-maintainer. I
do have a very little rust experience, but this is my first in kernel,
so I hope the more experience rust people here will chime in as well.

Cheers,
Benjamin

> 
> Thanks,
> Rahul Rameshbabu
> 
> Rahul Rameshbabu (3):
>   rust: core abstractions for HID drivers
>   rust: hid: USB Monitor Control Class driver
>   rust: hid: demo the core abstractions for probe and remove
> 
>  drivers/hid/Kconfig                |  16 ++
>  drivers/hid/Makefile               |   1 +
>  drivers/hid/hid_monitor_control.rs |  42 +++++
>  rust/bindings/bindings_helper.h    |   1 +
>  rust/kernel/hid.rs                 | 245 +++++++++++++++++++++++++++++
>  rust/kernel/lib.rs                 |   2 +
>  6 files changed, 307 insertions(+)
>  create mode 100644 drivers/hid/hid_monitor_control.rs
>  create mode 100644 rust/kernel/hid.rs
> 
> -- 
> 2.47.2
> 
> 
