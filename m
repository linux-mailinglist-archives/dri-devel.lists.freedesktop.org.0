Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D682A96F3D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 16:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F15310E5C4;
	Tue, 22 Apr 2025 14:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pdO2A0wN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36D3D10E273;
 Tue, 22 Apr 2025 14:46:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 94B6B4A901;
 Tue, 22 Apr 2025 14:46:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32060C4CEE9;
 Tue, 22 Apr 2025 14:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745333193;
 bh=JgGqmEvB2i0l21vTcFZrdqY+M7OFwFjriQNygbR07Vo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pdO2A0wN1ZV8jA9qx0DrlTiJxaOVS4zcZW4dGeGCosQ19JsMt7rtnaEjwiKCgeS7i
 vZ2eW3ddFv0JWSH+RZahh3K6EFnlEpQbzI8FJFrAXoLM9Bb86WuUUBGi2w+EpA6zkY
 QhVcXfdEz6r7kuzVWIqxmA6ECVrjGpWs7PpkS1tblZRgd2BMjM9IkfeJFcZS/ZyFd+
 n8TlTi4qGz8cuGZWZpIh204QCPbKlf91YWxvaNixQcDjQs6ytwI24ic/qhJFLvmHBm
 RxVgBc1efGnlG8ZFaM43Ad+E9ITsOcws6ErqccMuctgqdh/vUqvZqUb3ULL04347mM
 FCaZiVsM+Ex7w==
Date: Tue, 22 Apr 2025 16:46:26 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 12/16] gpu: nova-core: firmware: add ucode descriptor
 used by FWSEC-FRTS
Message-ID: <aAerwsnx5VRQr_bM@cassiopeiae>
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-12-ecd1cca23963@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420-nova-frts-v1-12-ecd1cca23963@nvidia.com>
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

On Sun, Apr 20, 2025 at 09:19:44PM +0900, Alexandre Courbot wrote:
> FWSEC-FRTS is the first firmware we need to run on the GSP falcon in
> order to initiate the GSP boot process. Introduce the structure that
> describes it.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware.rs | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
> index 9bad7a86382af7917b3dce7bf3087d0002bd5971..4ef5ba934b9d255635aa9a902e1d3a732d6e5568 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -43,6 +43,34 @@ pub(crate) fn new(
>      }
>  }
>  
> +/// Structure used to describe some firmwares, notable fwsec-frts.
> +#[allow(dead_code)]

Please use 'expect'.

> +#[repr(C)]
> +#[derive(Debug, Clone)]
> +pub(crate) struct FalconUCodeDescV3 {

Can we get some more documentation on the fields please? :)

> +    pub(crate) hdr: u32,
> +    pub(crate) stored_size: u32,
> +    pub(crate) pkc_data_offset: u32,
> +    pub(crate) interface_offset: u32,
> +    pub(crate) imem_phys_base: u32,
> +    pub(crate) imem_load_size: u32,
> +    pub(crate) imem_virt_base: u32,
> +    pub(crate) dmem_phys_base: u32,
> +    pub(crate) dmem_load_size: u32,
> +    pub(crate) engine_id_mask: u16,
> +    pub(crate) ucode_id: u8,
> +    pub(crate) signature_count: u8,
> +    pub(crate) signature_versions: u16,
> +    _reserved: u16,
> +}
> +
> +#[allow(dead_code)]
> +impl FalconUCodeDescV3 {
> +    pub(crate) fn size(&self) -> usize {
> +        ((self.hdr & 0xffff0000) >> 16) as usize

What's this magic number?

> +    }
> +}
> +
>  pub(crate) struct ModInfoBuilder<const N: usize>(firmware::ModInfoBuilder<N>);
>  
>  impl<const N: usize> ModInfoBuilder<N> {
> 
> -- 
> 2.49.0
> 
