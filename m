Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9F2BE5988
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 23:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17BF810EAA6;
	Thu, 16 Oct 2025 21:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S3pgPtJ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC2910EAA6;
 Thu, 16 Oct 2025 21:48:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 715F0406E1;
 Thu, 16 Oct 2025 21:48:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CBCCC4CEF1;
 Thu, 16 Oct 2025 21:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760651312;
 bh=az2P0BtWOdbNV9GVnUGrbuYR+gFXF+qCpHSYxeMG9Y0=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=S3pgPtJ/dxSC0vCGR7QZtHL8vtSOJDzsapuk50mdbYa2Bzph4QxYTLe4mdrOb9VOS
 EPbPLvQvJ8E4OoEQDjLcCVqxfP/crT4q5rweC/WxdiUod3jm1woACovGDOkofs9ZfZ
 SIXHZQo+9gXCQtFPlTX4B43idgOIAFf8PsiQbkOnYM1CuIrRT3eT06BcTXsAqk7Y1R
 rcZYL1+MnGfTxb1NxkMV/Lno9/7/axlaD9bnhNDTbfrXdXtJak7x7pYpVwQ5Dgiqd5
 507EJO3k6eqIES5q9RdHzE+7koQyPPY0w7yIhd1yrXMbM6iflC8NPB6cPRnVI5E1nC
 9drphuLbHu6xw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Oct 2025 23:48:25 +0200
Message-Id: <DDK2SRUF7OG7.1HEZXR1V4ND8Z@kernel.org>
Cc: <viresh.kumar@linaro.org>, <acourbot@nvidia.com>, <ira.weiny@intel.com>,
 <leon@kernel.org>, <daniel.almeida@collabora.com>, <bhelgaas@google.com>,
 <kwilczynski@kernel.org>, <abdiel.janulgue@gmail.com>,
 <robin.murphy@arm.com>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: driver: let probe() return impl PinInit<Self, Error>
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>, <gregkh@linuxfoundation.org>,
 <rafael@kernel.org>
X-Mailer: aerc 0.21.0
References: <20251016125544.15559-1-dakr@kernel.org>
In-Reply-To: <20251016125544.15559-1-dakr@kernel.org>
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

On Thu Oct 16, 2025 at 2:55 PM CEST, Danilo Krummrich wrote:
> The driver model defines the lifetime of the private data stored in (and
> owned by) a bus device to be valid from when the driver is bound to a
> device (i.e. from successful probe()) until the driver is unbound from
> the device.
>
> This is already taken care of by the Rust implementation of the driver
> model. However, we still ask drivers to return a Result<Pin<KBox<Self>>>
> from probe().
>
> Unlike in C, where we do not have the concept of initializers, but
> rather deal with uninitialized memory, drivers can just return an
> impl PinInit<Self, Error> instead.
>
> This contributed to more clarity to the fact that a driver returns it's
> device private data in probe() and the Rust driver model owns the data,
> manages the lifetime and - considering the lifetime - provides (safe)
> accessors for the driver.
>
> Hence, let probe() functions return an impl PinInit<Self, Error> instead
> of Result<Pin<KBox<Self>>>.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
> Depends on a minor pin-init patch [1] (Benno will send it to the list
> soon). A branch with this patch and the pin-init dependency is available
> in [2].

I sent the patch to the list:

    https://lore.kernel.org/all/20251016210541.650056-1-lossin@kernel.org

---
Cheers,
Benno

>
> [1] https://github.com/Rust-for-Linux/pin-init/pull/86/commits
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?h=
=3Dprobe_return
> ---
>  drivers/cpufreq/rcpufreq_dt.rs        |  4 +-
>  drivers/gpu/drm/nova/driver.rs        |  4 +-
>  drivers/gpu/drm/tyr/driver.rs         |  4 +-
>  drivers/gpu/nova-core/driver.rs       | 34 +++++++----------
>  rust/kernel/auxiliary.rs              |  6 +--
>  rust/kernel/cpufreq.rs                |  4 +-
>  rust/kernel/device.rs                 |  9 ++++-
>  rust/kernel/driver.rs                 |  4 +-
>  rust/kernel/io/mem.rs                 |  8 ++--
>  rust/kernel/pci.rs                    |  8 ++--
>  rust/kernel/platform.rs               | 12 +++---
>  rust/kernel/usb.rs                    |  4 +-
>  samples/rust/rust_debugfs.rs          | 21 ++++++-----
>  samples/rust/rust_dma.rs              | 37 +++++++++----------
>  samples/rust/rust_driver_auxiliary.rs | 25 +++++--------
>  samples/rust/rust_driver_pci.rs       | 53 +++++++++++++--------------
>  samples/rust/rust_driver_platform.rs  |  6 +--
>  samples/rust/rust_driver_usb.rs       |  5 +--
>  18 files changed, 117 insertions(+), 131 deletions(-)
