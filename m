Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4987DACDBF6
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 12:28:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E58EC10E15D;
	Wed,  4 Jun 2025 10:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qP9yIi1G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5312A10E092;
 Wed,  4 Jun 2025 10:28:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 31D86A5043F;
 Wed,  4 Jun 2025 10:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 401EFC4CEE7;
 Wed,  4 Jun 2025 10:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749032931;
 bh=JBl2S2HcUiHa7eTyy0mmRlKPLkijJl96CchvkFqMJNc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qP9yIi1GWziSK+VEJTpm1vEyrBxdG0uppVJAd6frmyrfEEZs2s5ba3u9NsSupTlTw
 DztOcoXc8EjQM0TDdtKR1jrVryh2iiC/To4hlWR9VuGAIFk2WrfJYI/YEApkELqkSN
 /oms3NVAgEpR2Hnr9jYOi5HUvxcJiaEPktU+qL/quWemrVQKOeMZExJhiCLHrmpqoK
 mtpwUXM2kpVPamsZ+tdNlIM7qIBYb/VI9J4j/uk7jZyr9C6ujVg6oM5MT3ThPMqn/7
 1yZ0kl9lccbciDhbRaTaw0sndq+0UyUJyHXf7mu7RTHxo32jxQv3ba2Poyru3o9bSt
 fMx2pRB0wAEbg==
Date: Wed, 4 Jun 2025 12:28:44 +0200
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 18/20] gpu: nova-core: add types for patching firmware
 binaries
Message-ID: <aEAf3GUUz5oxnuk9@cassiopeiae>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-18-05dfd4f39479@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521-nova-frts-v4-18-05dfd4f39479@nvidia.com>
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

On Wed, May 21, 2025 at 03:45:13PM +0900, Alexandre Courbot wrote:
> +/// A [`DmaObject`] containing a specific microcode ready to be loaded into a falcon.
> +///
> +/// This is module-local and meant for sub-modules to use internally.
> +struct FirmwareDmaObject<F: FalconFirmware>(DmaObject, PhantomData<F>);
> +
> +/// Trait for signatures to be patched directly into a given firmware.
> +///
> +/// This is module-local and meant for sub-modules to use internally.
> +trait FirmwareSignature<F: FalconFirmware>: AsRef<[u8]> {}
> +
> +#[expect(unused)]
> +impl<F: FalconFirmware> FirmwareDmaObject<F> {
> +    /// Creates a new `UcodeDmaObject` containing `data`.
> +    fn new(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self> {
> +        DmaObject::from_data(dev, data).map(|dmaobj| Self(dmaobj, PhantomData))
> +    }
> +
> +    /// Patches the firmware at offset `sig_base_img` with `signature`.
> +    fn patch_signature<S: FirmwareSignature<F>>(
> +        &mut self,
> +        signature: &S,
> +        sig_base_img: usize,
> +    ) -> Result<()> {
> +        let signature_bytes = signature.as_ref();
> +        if sig_base_img + signature_bytes.len() > self.0.size() {
> +            return Err(EINVAL);
> +        }
> +
> +        // SAFETY: we are the only user of this object, so there cannot be any race.
> +        let dst = unsafe { self.0.start_ptr_mut().add(sig_base_img) };
> +
> +        // SAFETY: `signature` and `dst` are valid, properly aligned, and do not overlap.
> +        unsafe {
> +            core::ptr::copy_nonoverlapping(signature_bytes.as_ptr(), dst, signature_bytes.len())
> +        };
> +
> +        Ok(())
> +    }
> +}

If we can't patch them when the object is created, i.e. in
FirmwareDmaObject::new(), I think we should take self by value in
FirmwareDmaObject::patch_signature() and return a SignedFirmwareDmaObject (which
can just be a transparent wrapper) instead in order to let the type system prove
that we did not forget to call patch_signature().
