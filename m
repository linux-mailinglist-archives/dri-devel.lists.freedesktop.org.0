Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AE49003E0
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 14:44:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96CF310E138;
	Fri,  7 Jun 2024 12:44:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="T0r2kuE2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B627B10E138
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 12:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717764241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Tb3rOmJ6oEqF5Uwef9MP4Ly8/Pa0dGQ6OkYbp+Jl7o4=;
 b=T0r2kuE2YNaQ3uro03sEFyxXahuRvYxKByPVqtKbYFBgLWC7SzTHZsmbuJGaex3fjDWKGp
 Pougv58IJHZBKeFRuOFsEY4L1Dwy/1bU8Su/4aR/jn9T9lwYHkrxjZ9coRQlXbWK/K52Ze
 bexpEpzYgfwfucsdN9V2c+8ILtq9EpY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-IpE413dIP6qtGAdyES0Nog-1; Fri, 07 Jun 2024 08:44:00 -0400
X-MC-Unique: IpE413dIP6qtGAdyES0Nog-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-35858762c31so1227267f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2024 05:44:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717764236; x=1718369036;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tb3rOmJ6oEqF5Uwef9MP4Ly8/Pa0dGQ6OkYbp+Jl7o4=;
 b=V3PrjnBJT3Tb6H00f7bJSH66UYklX5sm9RvC6uuyGRYY3ryfPMH3mfv3Mh4OcUWtwU
 IPmxuHRDK5tXzUurfyxYo3gHxZiXu0+J7dw3GgaAQudKiVBOp9gTUfm788e3cGEdYWMA
 Eoqr+E2p8E7q50A6y3zwlMuIqrpDlApRiyBo9qcOGYEXD3C3RJ3gfwlBQN1NJ8qt0Blg
 SLNzyzjn6v1XsoLIHUgYES5KnZFNkvUvDTpjgKiWtS25rKlJ3iKeQ8qHtawBP7E2fBcQ
 FcyzYNAxuVelHAAiUEsOOrp1zHtnAtpmtUNcxjzgEBnj5NiZq1DKSEE64QIopbGhrzjr
 61LQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLWx+VLMTOOyDvqf2JPA3ZdA/3vO49Ofnj80QZSGymIui90UubTy3sEzgYuJgDOrDCTXrxh8v/mH3fOl8cukBkbT1QWpg3N4jZF72Hl9XR
X-Gm-Message-State: AOJu0Yy2O/CstXKSswUklcZWhW/GBnPtK2s5Purl/E5EsZok2jjh/3Yc
 yj0uQ4Jsl/GAxTjWr2PYevXX0wMHFmMkGEjwXLQ3/bAXhsvLhWswf4HRSOhlYM2SnDaxqOi0Abe
 roMGC06/P2dWRPr8+6dWR8ProKSXV4XmyU0ECksIDPWnaZOBH70v/psLV8UH48XLb/A==
X-Received: by 2002:a05:6000:50b:b0:34d:7bbb:8d73 with SMTP id
 ffacd0b85a97d-35efea08efemr2495420f8f.2.1717764235736; 
 Fri, 07 Jun 2024 05:43:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUc1KIqrofCBS1MN1OEjf35mtI9LJFI6Ldjmp+08p+uRE8roaxEz0Og7GKeek4wr5kdXYoxg==
X-Received: by 2002:a05:6000:50b:b0:34d:7bbb:8d73 with SMTP id
 ffacd0b85a97d-35efea08efemr2495378f8f.2.1717764235283; 
 Fri, 07 Jun 2024 05:43:55 -0700 (PDT)
Received: from cassiopeiae ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5e983e3sm3944214f8f.83.2024.06.07.05.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 05:43:54 -0700 (PDT)
Date: Fri, 7 Jun 2024 14:43:52 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: gregkh@linuxfoundation.org, wedsonaf@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, lina@asahilina.net,
 pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, mcgrof@kernel.org, russ.weight@linux.dev
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Message-ID: <ZmMAiIr73z0FdMzl@cassiopeiae>
References: <Zlgg_Q5y3Q99Ts1s@pollux>
 <20240531.165032.1895479176481879387.fujita.tomonori@gmail.com>
 <Zlmfkws-QjNmFxfr@pollux>
 <20240607.211132.1411950625632247437.fujita.tomonori@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20240607.211132.1411950625632247437.fujita.tomonori@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

On Fri, Jun 07, 2024 at 09:11:32PM +0900, FUJITA Tomonori wrote:
> Hi,
> 
> On Fri, 31 May 2024 11:59:47 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
> > Once we get to a conclusion I can send a series with only the device and firmare
> > abstractions such that we can get them in outside of the scope of the reset of
> > both series to get your driver going.
> 
> Since your discussion with Greg seems to continue for a while, let me
> include the following patch that Greg approved with the next version
> of the PHY driver patchset.

This all doesn't make a lot of sense. If that's the case, Greg approved
something the he keeps arguing about in the discussion of the original patch.
Please see the discussion about the NULL pointer check [1].

Besides that, I really don't think it's the correct approach to just (partially)
pick up a patch from the mailing list that is actively discussed and submit
versions that are slightly altered in the points that are actively discussed.

This really just complicates the situation and does not help getting to an
agreement.

> 
> You have the new version of the firmware patch? The unused functions
> will not be merged so only request_firmware() and release_firmware()
> can be included. If not, I can include my firmware patch that I wrote
> before.
> 

Please find the updated firmware patch in [2].

However, I propose to just send a new series with just the device abstraction
and this firmware patch and proceed from there.

[1] https://lore.kernel.org/rust-for-linux/Zl8_bXqK-T24y1kp@cassiopeiae/
[2] https://gitlab.freedesktop.org/drm/nova/-/commit/0683e186929c4922d565e5315525925aa2d8d686

NAK for the patch below, for the reasons above.

Please also see comments inline.

> =
> From: Danilo Krummrich <dakr@redhat.com>
> Date: Fri, 7 Jun 2024 20:14:59 +0900
> Subject: [PATCH] add abstraction for struct device
> 
> Add abstraction for struct device. This implements only the minimum
> necessary functions required for the abstractions of firmware API;
> that is, wrapping C's pointer to a device object with Rust struct only
> during a caller knows the pointer is valid (e.g., the probe callback).
> 
> Co-developed-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> Co-developed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  rust/kernel/device.rs | 31 +++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs    |  1 +
>  2 files changed, 32 insertions(+)
>  create mode 100644 rust/kernel/device.rs
> 
> diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> new file mode 100644
> index 000000000000..55ec4f364628
> --- /dev/null
> +++ b/rust/kernel/device.rs
> @@ -0,0 +1,31 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Generic devices that are part of the kernel's driver model.
> +//!
> +//! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
> +
> +use crate::types::Opaque;
> +
> +/// Wraps the kernel's `struct task_struct`.
> +#[repr(transparent)]
> +pub struct Device(Opaque<bindings::device>);
> +
> +impl Device {
> +    /// Creates a new [`Device`] instance from a raw pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// For the duration of 'a, the pointer must point at a valid `device`.

The original patch says: "Callers must ensure that `ptr` is valid, non-null, and
has a non-zero reference count for the entire duration when the returned
reference exists."

This is way more precise than just saying "For the duration of 'a, the pointer
must point at a valid `device`.", hence we should keep the original comment.

> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::device) -> &'a Self {
> +        // CAST: `Self` is a `repr(transparent)` wrapper around `bindings::device`.
> +        let ptr = ptr.cast::<Self>();
> +        // SAFETY: by the function requirements the pointer is valid and we have unique access for
> +        // the duration of `'a`.
> +        unsafe { &mut *ptr }

Why not just

+        // SAFETY: Guaranteed by the safety requirements of the function.
+        unsafe { &*ptr.cast() }

as in the original commit?

> +    }
> +
> +    /// Returns the raw pointer to the device.
> +    pub(crate) fn as_raw(&self) -> *mut bindings::device {
> +        self.0.get()
> +    }
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index fbd91a48ff8b..dd1207f1a873 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -28,6 +28,7 @@
>  
>  pub mod alloc;
>  mod build_assert;
> +pub mod device;
>  pub mod error;
>  pub mod init;
>  pub mod ioctl;
> -- 
> 2.34.1
> 

