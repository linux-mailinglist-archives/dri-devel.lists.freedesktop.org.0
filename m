Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D757EBC5F7A
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 18:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB22F10E855;
	Wed,  8 Oct 2025 16:11:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="asIk0kiQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F39610E1F3;
 Wed,  8 Oct 2025 16:11:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D91A5439DC;
 Wed,  8 Oct 2025 16:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C224C4CEF4;
 Wed,  8 Oct 2025 16:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759939897;
 bh=ACz4ZOOMhZbxhmAt8VTRP3ni7TyEiwNE94dkxqZtfaA=;
 h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
 b=asIk0kiQJvkkBiX8hWXJHC1Uhs1I9jwaUKwIZvJ2k2vJTOVtrUuVbwhJLeePftHVv
 m9Am6uqpxr2WRN4j1Y0EgSQGFLrLmk+5G2B+D0ZIR+hj9Z5PVb0bgXv0G48CDa4Qha
 0QKGYb6fvUpbcbFYs9crZoU2UjhogVKko0uZZdTWj6Z1BSAhJQ2cIWjMEFTmklmufF
 5oDzKrOIUWV1HSyVQAGkz9gzQ4c/V7h1WSw7GAmf7U5wxmNtM7CZA3Uz8aZhQpEocy
 dmyMsgAMt8OMFLnLDsJFUeXbLabz4etiyk48XEW82i7fvdqPUy1XzD0UPwNc3to2pU
 gmIvst6nCBlDw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Oct 2025 18:11:31 +0200
Message-Id: <DDD2MGRNMEWB.1ZSVQ2HW7V4BY@kernel.org>
To: "Alistair Popple" <apopple@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 03/13] gpu: nova-core: gsp: Create wpr metadata
Cc: <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <acourbot@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
References: <20251008001253.437911-1-apopple@nvidia.com>
 <20251008001253.437911-4-apopple@nvidia.com>
In-Reply-To: <20251008001253.437911-4-apopple@nvidia.com>
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

On Wed Oct 8, 2025 at 2:12 AM CEST, Alistair Popple wrote:
> --- a/drivers/gpu/nova-core/firmware/gsp.rs
> +++ b/drivers/gpu/nova-core/firmware/gsp.rs
> @@ -131,7 +131,7 @@ pub(crate) struct GspFirmware {
>      /// Size in bytes of the firmware contained in [`Self::fw`].
>      pub size: usize,
>      /// Device-mapped GSP signatures matching the GPU's [`Chipset`].
> -    signatures: DmaObject,
> +    pub signatures: DmaObject,
>      /// GSP bootloader, verifies the GSP firmware before loading and run=
ning it.
>      pub bootloader: RiscvFirmware,
>  }
> @@ -216,7 +216,6 @@ pub(crate) fn new<'a, 'b>(
>          }))
>      }
> =20
> -    #[expect(unused)]
>      /// Returns the DMA handle of the radix3 level 0 page table.
>      pub(crate) fn radix3_dma_handle(&self) -> DmaAddress {
>          self.level0.dma_handle()
> diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-c=
ore/firmware/riscv.rs
> index 04f1283abb72..76d0d36fee3e 100644
> --- a/drivers/gpu/nova-core/firmware/riscv.rs
> +++ b/drivers/gpu/nova-core/firmware/riscv.rs
> @@ -55,11 +55,11 @@ fn new(bin_fw: &BinFirmware<'_>) -> Result<Self> {
>  #[expect(unused)]
>  pub(crate) struct RiscvFirmware {
>      /// Offset at which the code starts in the firmware image.
> -    code_offset: u32,
> +    pub code_offset: u32,
>      /// Offset at which the data starts in the firmware image.
> -    data_offset: u32,
> +    pub data_offset: u32,
>      /// Offset at which the manifest starts in the firmware image.
> -    manifest_offset: u32,
> +    pub manifest_offset: u32,
>      /// Application version.
>      app_version: u32,
>      /// Device-mapped firmware image.

As mentioned in a previous patch, the member visibility should at most matc=
h the
stuct visibility.

Otherwise, LGTM!
