Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C176C318B1
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 15:35:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0980610E278;
	Tue,  4 Nov 2025 14:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BJdGB6yv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A3D10E278;
 Tue,  4 Nov 2025 14:35:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D6C20437A0;
 Tue,  4 Nov 2025 14:35:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C021C116B1;
 Tue,  4 Nov 2025 14:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1762266908;
 bh=780Lu7Vk+L7OEz1zpmgzeoNUJ51QqPpcyt599aDv/jI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BJdGB6yvX4Vbe5yrzv+YHesKh8NPm4vP2fWyWddFgPRpFv2veGF+wXvy9ddQU+/w8
 bGKPWhgvqOsa3dPrsKDHmV0iaV2Hqbs5+Aki/rDp/qxxaoNmGeUvMDFApLYIWoA7J9
 72XTUlA4u6wMB5MThXh4cHcxglNanfe93OVFbq5Y=
Date: Tue, 4 Nov 2025 23:35:03 +0900
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
 Danilo Krummrich <dakr@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] firmware_loader: make RUST_FW_LOADER_ABSTRACTIONS select
 FW_LOADER
Message-ID: <2025110407-scouting-unpiloted-39f4@gregkh>
References: <20251104-b4-select-rust-fw-v1-1-afea175dba22@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104-b4-select-rust-fw-v1-1-afea175dba22@nvidia.com>
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

On Tue, Nov 04, 2025 at 11:04:49PM +0900, Alexandre Courbot wrote:
> I have noticed that build will fail when doing the following:
> 
> - Start with the x86 defconfig,
> - Using nconfig, enable `CONFIG_RUST` and `CONFIG_DRM_NOVA`,
> - Start building.
> 
> The problem is that `CONFIG_RUST_FW_LOADER_ABSTRACTIONS` remains
> unselected, despite it being a dependency of `CONFIG_NOVA_CORE`. This
> seems to happen because `CONFIG_DRM_NOVA` selects `CONFIG_NOVA_CORE`.
> 
> Fix this by making `CONFIG_RUST_FW_LOADER_ABSTRACTIONS` select
> `CONFIG_FW_LOADER`, and by transition make all users of
> `CONFIG_RUST_FW_LOADER_ABSTRACTIONS` (so far, nova-core and net/phy)
> select it as well.
> 
> `CONFIG_FW_LOADER` is more often selected than depended on, so this
> seems to make sense generally speaking.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> I am not 100% percent confident that this is the proper fix, but the
> problem is undeniable. :) I guess the alternative would be to make nova-drm
> depend on nova-core instead of selecting it, but I suspect that the
> `select` behavior is correct in this case - after all, firmware loading
> does not make sense without any user.
> ---
>  drivers/base/firmware_loader/Kconfig | 2 +-
>  drivers/gpu/nova-core/Kconfig        | 2 +-
>  drivers/net/phy/Kconfig              | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/base/firmware_loader/Kconfig b/drivers/base/firmware_loader/Kconfig
> index 752b9a9bea03..15eff8a4b505 100644
> --- a/drivers/base/firmware_loader/Kconfig
> +++ b/drivers/base/firmware_loader/Kconfig
> @@ -38,7 +38,7 @@ config FW_LOADER_DEBUG
>  config RUST_FW_LOADER_ABSTRACTIONS
>  	bool "Rust Firmware Loader abstractions"
>  	depends on RUST
> -	depends on FW_LOADER=y
> +	select FW_LOADER

Please no, select should almost never be used, it causes hard-to-debug
issues.

As something is failing, perhaps another "depends" needs to be added
somewhere instead?


thanks,

greg k-h
