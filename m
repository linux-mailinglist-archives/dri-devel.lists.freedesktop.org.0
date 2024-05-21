Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CC48CB560
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 23:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA55110EDC7;
	Tue, 21 May 2024 21:23:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dDTuSpQf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B573510ED57;
 Tue, 21 May 2024 21:23:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 373DDCE10A8;
 Tue, 21 May 2024 21:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FB84C4AF0A;
 Tue, 21 May 2024 21:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716326614;
 bh=EwH7o/8VRcfULQqTnFwqENvFz01TWQq0KwA7ytZTut0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dDTuSpQfyKkPJD32FZ3kt1ZsFwCbSfPKNjJoS1pcBupAMMd10PiNVqVXSDfbO8n7Z
 wGqkQqUnzFGBdpU+9cRSRfsNIljeZhJU0LNbNUhyBwn2Ylie6FUVGjVYcsCU8qVlqP
 rDbeYag8z0T/y4K3kHh+mM05EZrRbDI1Ap3pGWv3ktAWuPXXxPt6ziB8dVgMqOkwnA
 Tce8oo8lGyDxrv35MBXP22Crk3bTeRzEHBFgGLOagZF6eo3ihotybFA/f5eXdvCIoN
 PXslTBQmJri+24FI7BvuZPtHBL0omoZ1p7NYHdnvF1D0OTMchSJ94ZDUNwSIANwYJh
 Oic9naCnYk6bQ==
Date: Tue, 21 May 2024 16:23:33 -0500
From: Rob Herring <robh@kernel.org>
To: Danilo Krummrich <dakr@redhat.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, fujita.tomonori@gmail.com, lina@asahilina.net,
 pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
 gregkh@linuxfoundation.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: Re: [RFC PATCH 3/8] rust: drm: Add Device and Driver abstractions
Message-ID: <20240521212333.GA731457-robh@kernel.org>
References: <20240520172059.181256-1-dakr@redhat.com>
 <20240520172059.181256-4-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240520172059.181256-4-dakr@redhat.com>
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

On Mon, May 20, 2024 at 07:20:50PM +0200, Danilo Krummrich wrote:
> From: Asahi Lina <lina@asahilina.net>
> 
> Add abstractions for DRM drivers and devices. These go together in one
> commit since both are fairly tightly coupled types.
> 
> A few things have been stubbed out, to be implemented as further bits of
> the DRM subsystem are introduced.
> 
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Co-developed-by: Danilo Krummrich <dakr@redhat.com>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  rust/bindings/bindings_helper.h |   2 +
>  rust/kernel/drm/device.rs       |  87 +++++++++
>  rust/kernel/drm/drv.rs          | 318 ++++++++++++++++++++++++++++++++
>  rust/kernel/drm/mod.rs          |   2 +
>  4 files changed, 409 insertions(+)
>  create mode 100644 rust/kernel/drm/device.rs
>  create mode 100644 rust/kernel/drm/drv.rs

[...]

> diff --git a/rust/kernel/drm/drv.rs b/rust/kernel/drm/drv.rs
> new file mode 100644
> index 000000000000..5dd8f3f8df7c
> --- /dev/null
> +++ b/rust/kernel/drm/drv.rs
> @@ -0,0 +1,318 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +
> +//! DRM driver core.
> +//!
> +//! C header: [`include/linux/drm/drm_drv.h`](../../../../include/linux/drm/drm_drv.h)
> +
> +use crate::{
> +    alloc::flags::*,
> +    bindings, device, drm,
> +    error::code::*,
> +    error::{Error, Result},
> +    prelude::*,
> +    private::Sealed,
> +    str::CStr,
> +    types::{ARef, ForeignOwnable},
> +    ThisModule,
> +};
> +use core::{
> +    marker::{PhantomData, PhantomPinned},
> +    pin::Pin,
> +};
> +use macros::vtable;
> +
> +/// Driver use the GEM memory manager. This should be set for all modern drivers.
> +pub const FEAT_GEM: u32 = bindings::drm_driver_feature_DRIVER_GEM;
> +/// Driver supports mode setting interfaces (KMS).
> +pub const FEAT_MODESET: u32 = bindings::drm_driver_feature_DRIVER_MODESET;
> +/// Driver supports dedicated render nodes.
> +pub const FEAT_RENDER: u32 = bindings::drm_driver_feature_DRIVER_RENDER;
> +/// Driver supports the full atomic modesetting userspace API.
> +///
> +/// Drivers which only use atomic internally, but do not support the full userspace API (e.g. not
> +/// all properties converted to atomic, or multi-plane updates are not guaranteed to be tear-free)
> +/// should not set this flag.
> +pub const FEAT_ATOMIC: u32 = bindings::drm_driver_feature_DRIVER_ATOMIC;
> +/// Driver supports DRM sync objects for explicit synchronization of command submission.
> +pub const FEAT_SYNCOBJ: u32 = bindings::drm_driver_feature_DRIVER_SYNCOBJ;
> +/// Driver supports the timeline flavor of DRM sync objects for explicit synchronization of command
> +/// submission.
> +pub const FEAT_SYNCOBJ_TIMELINE: u32 = bindings::drm_driver_feature_DRIVER_SYNCOBJ_TIMELINE;

This is missing an entry for DRIVER_GEM_GPUVA. And some others perhaps. 
I suppose some are legacy which won't be needed any time soon if ever. 
Not sure if you intend for this to be complete, or you are just adding 
what you are using? Only FEAT_GEM is used by nova ATM.

Rob
