Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FD9B53054
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 13:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD1310EAAA;
	Thu, 11 Sep 2025 11:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X6s6oloT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F8510E0E8;
 Thu, 11 Sep 2025 11:27:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D446140C54;
 Thu, 11 Sep 2025 11:27:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26B95C4CEF0;
 Thu, 11 Sep 2025 11:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757590041;
 bh=7x9RX4R0yGFt9SaAULfJv4ZUVpGgjrzTlX6Xxo5HDj0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=X6s6oloTndlDJx3ztDIKJjVQuau4BdMbUCgEE2426w1z25y0vF/BBN4xZaip6KGkx
 Opk7ATGu2XKrpJiQjZmtwwmJqERYR/ZmF+T+7ZtJ4vJzx6Cjb0pWZ0fJk5dXwGB5Wh
 YkTTscOP670GDAdp4tLEnZd/xcXO7gYwRFwtvnoslqOFmbSRTw1i89WUO44Zmj73A5
 qLrUzSiIObVzcYGloBs9mWNce92zUE1eYdaahTOZqasQkwN9BK0NtoDiNEq6xtjGkv
 AX01MzpcTWjejjKSq6lyGTplwojxksvOtjWDTOAWy9K/uAhhjgGu/7kMlLV+9w071p
 EWe788vRpfbzg==
Message-ID: <9c1a7902-4e14-4b25-ba32-57a475a0bccc@kernel.org>
Date: Thu, 11 Sep 2025 13:27:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/12] gpu: nova-core: firmware: process and prepare
 the GSP firmware
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
 <20250911-nova_firmware-v5-8-5a8a33bddca1@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250911-nova_firmware-v5-8-5a8a33bddca1@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 9/11/25 1:04 PM, Alexandre Courbot wrote:
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 06a7ee8f4195759fb55ad483852724bb1ab46793..8505ee81c43e7628d1f099aff285244f8908c633 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -8,6 +8,7 @@
>  use crate::fb::SysmemFlush;
>  use crate::firmware::booter::{BooterFirmware, BooterKind};
>  use crate::firmware::fwsec::{FwsecCommand, FwsecFirmware};
> +use crate::firmware::gsp::GspFirmware;
>  use crate::firmware::{Firmware, FIRMWARE_VERSION};
>  use crate::gfw;
>  use crate::regs;
> @@ -285,6 +286,11 @@ pub(crate) fn start_gsp(
>  
>          let bios = Vbios::new(dev, bar)?;
>  
> +        let _gsp_fw = KBox::pin_init(
> +            GspFirmware::new(dev, chipset, FIRMWARE_VERSION)?,
> +            GFP_KERNEL,
> +        )?;

Since we now have the infrastructure in place and the change is trival, I'd
prefer to make this a member of struct Gsp and make it part of the Gpu structure
directly (without separate allocation).

Should we need dynamic dispatch in the future, it's also trivial to make it its
own allocation again, but maybe we also get around the dyn dispatch. :)
