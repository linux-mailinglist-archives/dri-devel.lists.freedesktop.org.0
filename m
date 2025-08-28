Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E3BB39B7E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 13:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB73210E985;
	Thu, 28 Aug 2025 11:27:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Lzq6nP7h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B429D10E980;
 Thu, 28 Aug 2025 11:27:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 598AF44863;
 Thu, 28 Aug 2025 11:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C088EC4CEEB;
 Thu, 28 Aug 2025 11:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756380437;
 bh=NoSXtYeInTjqAmcJlUKiSeIj1PLVYhe4X1Ll4dxOdjw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Lzq6nP7h/kCxxTJ7r34ox7cP/Er3+4w5qi3toEthfFn+hIVFVeJXHHF0TYLcuf6Xl
 sxpK9xjpAW5lUvV5pDs11RcnZgHKCmUOBm+ST6S8mluBmvzj40HJj6Ps71wtyZNZK3
 212ajbXw0TlMbb1RGmBLuX+xkDijq76EKePHjI3XSq88kBzVRTQF+zTwlUGKzuq1zt
 tsuciTA+Hbs/kCoeHYNLlkohwA3quykV5ScTgJkbLL+vHlrBCAufIDZXrHLfdnJCiI
 eDx92dqrxzbpRnwCJfI0gxNIXfPJ81dimnvEuuvLAW6RURvOl712Np9HVhjW7TJWk/
 jmBqeteQ+VNzg==
Message-ID: <5338bd30-f3ed-42c7-af0e-77c3ef7d675d@kernel.org>
Date: Thu, 28 Aug 2025 13:27:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] gpu: nova-core: firmware: process and prepare the
 GSP firmware
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
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
 <20250826-nova_firmware-v2-5-93566252fe3a@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250826-nova_firmware-v2-5-93566252fe3a@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 8/26/25 6:07 AM, Alexandre Courbot wrote:
>   /// Structure encapsulating the firmware blobs required for the GPU to operate.
>   #[expect(dead_code)]
>   pub(crate) struct Firmware {
> @@ -36,7 +123,10 @@ pub(crate) struct Firmware {
>       booter_unloader: BooterFirmware,
>       /// GSP bootloader, verifies the GSP firmware before loading and running it.
>       gsp_bootloader: RiscvFirmware,
> -    gsp: firmware::Firmware,
> +    /// GSP firmware.
> +    gsp: Pin<KBox<GspFirmware>>,

Is there a reason why we don't just propagate it through struct Gpu, which uses 
pin-init already?

You can make Firmware pin_data too and then everything is within the single 
allocation of struct Gpu.
