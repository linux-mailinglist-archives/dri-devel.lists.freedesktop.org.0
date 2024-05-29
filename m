Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3AC8D3F38
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 21:57:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 729CC11A396;
	Wed, 29 May 2024 19:57:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Xteq5x4m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D30111A3A6;
 Wed, 29 May 2024 19:57:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BA1A1CE18DD;
 Wed, 29 May 2024 19:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A4ECC113CC;
 Wed, 29 May 2024 19:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1717012619;
 bh=k2uvzl1ySiRTYch80BPtVMWBS3m3dVqKAojmf+wUH3Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xteq5x4m2lFebI5Q/FTTMOq5xksLCqX+2MirHUxJCkBcoqR1jXcio9h786yY9OVli
 om67P/IDRVCv5oGVTz38vDjz3riFgQfhXKRdJiqvPvU/Ql7UxTvrC4Og7tL0JRW1pZ
 bld+tKJ1oWnKFBlF5VT/VaIV/tBezGKTyWZhnYdU=
Date: Wed, 29 May 2024 21:57:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: dakr@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, lina@asahilina.net, pstanner@redhat.com,
 ajanulgu@redhat.com, lyude@redhat.com,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, mcgrof@kernel.org, russ.weight@linux.dev
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Message-ID: <2024052950-purely-sandstone-36c7@gregkh>
References: <20240528.200126.99248529380429957.fujita.tomonori@gmail.com>
 <ZlXLzCYiwdMxic3X@pollux>
 <2024052816-makeshift-irrigate-cef5@gregkh>
 <20240529.092821.1593412345609718860.fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529.092821.1593412345609718860.fujita.tomonori@gmail.com>
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

On Wed, May 29, 2024 at 09:28:21AM +0900, FUJITA Tomonori wrote:
> Hi,
> 
> On Tue, 28 May 2024 14:45:02 +0200
> Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> > On Tue, May 28, 2024 at 02:19:24PM +0200, Danilo Krummrich wrote:
> >> However, if you have a driver that needs the firmware abstractions, I would be
> >> surprised if there were any hesitations to already merge the minimum device
> >> abstractions [1] and this one (once reviewed) without the rest. At least there
> >> aren't any from my side.
> >> 
> >> [1] https://lore.kernel.org/rust-for-linux/20240520172554.182094-2-dakr@redhat.com/
> > 
> > No, the device abstractions are NOT ready for merging just yet, sorry,
> > if for no other reason than a non-RFC has never been posted :)
> 
> Indeed, I understand that you aren't convinced.
> 
> We can start with much simpler device abstractions than the above
> minimum for the firmware abstractions.
> 
> All the firmware abstractions need is wrapping C's pointer to a device
> object with Rust struct only during a caller knows the pointer is
> valid. No play with the reference count of a struct device.

Makes sense, but note that almost no one should be dealing with "raw"
struct device pointers :)

> For a Rust PHY driver, you know that you have a valid pointer to C's
> device object of C's PHY device during the probe callback. The driver
> creates a Rust device object to wrap the C pointer to the C's device
> object and passes it to the firmware abstractions. The firmware
> abstractions gets the C's pointer from the Rust object and calls C's
> function to load firmware, returns the result.
> 
> You have concerns about the simple code like the following?
> 
> 
> diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> new file mode 100644
> index 000000000000..6144437984a9
> --- /dev/null
> +++ b/rust/kernel/device.rs
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Generic devices that are part of the kernel's driver model.
> +//!
> +//! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
> +
> +use crate::types::Opaque;
> +
> +#[repr(transparent)]
> +pub struct Device(Opaque<bindings::device>);
> +
> +impl Device {
> +    /// Creates a new [`Device`] instance from a raw pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// For the duration of 'a, the pointer must point at a valid `device`.

If the following rust code does what this comment says, then sure, I'm
ok with it for now if it helps you all out with stuff like the firmware
interface for the phy rust code.

thanks,

greg k-h
