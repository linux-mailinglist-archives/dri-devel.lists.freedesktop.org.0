Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73543B53013
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 13:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9069210E316;
	Thu, 11 Sep 2025 11:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MTAJ8j9z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8230B10E316;
 Thu, 11 Sep 2025 11:22:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 598F9601B5;
 Thu, 11 Sep 2025 11:22:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D1D8C4CEF0;
 Thu, 11 Sep 2025 11:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757589745;
 bh=OwvNjx3MRUK1frkNA0c5zRPid8ek62rk22oqfoMLxHY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MTAJ8j9zIniFTiMbgJwfxoxWSqAeEuZQZvcZjkLuJgm4hwqQ+mriuqj2bEnCeKppv
 C+QPs1IAEMfGr92mBUxNlBatB3XQfH/2tKcQjvazLWSzXDk4YNbzA0H3TIq9C6SbEE
 jiTYVOtyQMlpwFZOyBlZIgWK1YY9P4w1tKKNgzHCITLNWqoVxkJP0Aqf1aUEPQDvTx
 r5/blIC3ocgnhDO/EikLhbEY1uI1Glp5Ve8DHACr0yiFIc4/S7r2Ashp+Tznke5WdI
 Iwl8QRMMKEonngJqTd3g4IJRFYramlK8b5mgJjb9pe/EFy/lNCl/FOY6tKBM6DekNu
 d6j2h/au4vXuQ==
Message-ID: <e1755470-587b-4a43-8171-3d031b7fb4f4@kernel.org>
Date: Thu, 11 Sep 2025 13:22:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/12] gpu: nova-core: move GSP boot code to a
 dedicated method
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
 <20250911-nova_firmware-v5-2-5a8a33bddca1@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250911-nova_firmware-v5-2-5a8a33bddca1@nvidia.com>
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
> +    /// Attempt to start the GSP.
> +    ///
> +    /// This is a GPU-dependent and complex procedure that involves loading firmware files from
> +    /// user-space, patching them with signatures, and building firmware-specific intricate data
> +    /// structures that the GSP will use at runtime.
> +    ///
> +    /// Upon return, the GSP is up and running, and its runtime object given as return value.
> +    pub(crate) fn start_gsp(
> +        pdev: &pci::Device<device::Bound>,
> +        bar: &Bar0,
> +        chipset: Chipset,
> +        gsp_falcon: &Falcon<Gsp>,
> +        _sec2_falcon: &Falcon<Sec2>,
> +    ) -> Result<()> {> +        let dev = pdev.as_ref();
> +
> +        let bios = Vbios::new(dev, bar)?;
> +
> +        let fb_layout = FbLayout::new(chipset, bar)?;
> +        dev_dbg!(dev, "{:#x?}\n", fb_layout);
> +
> +        Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
> +
> +        // Return an empty placeholder for now, to be replaced with the GSP runtime data.
> +        Ok(())
> +    }

I'd rather create the Gsp structure already, move the code to Gsp::new() and
return an impl PinInit<Self, Error>. If you don't want to store any of the
object instances you create above yet, you can just stuff all the code into an
initializer code block, as you do in the next patch with
gfw::wait_gfw_boot_completion().
