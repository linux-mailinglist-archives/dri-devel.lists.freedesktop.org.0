Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4B2ADF797
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 22:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13E210E945;
	Wed, 18 Jun 2025 20:23:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E5KYkur7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E457810E945;
 Wed, 18 Jun 2025 20:23:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0A49061F1F;
 Wed, 18 Jun 2025 20:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9CC1C4CEED;
 Wed, 18 Jun 2025 20:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750278195;
 bh=vBlU29f0lKXjTb1IjXg9xDRSuF39bMysiXLwUIkTQDs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E5KYkur7Z9XHzLxHKvdtEitEsqV4o0QoO+ZU5JYz09QH0vme4eCKwixtLqhf7LS99
 +LKUE3fQNDVJJ0Ws58vgnfpkYMWTpiGqkR4XBOw3Ed0CBhVcXMNBClRGXxmvawSv1P
 aaYX2WvhKVwoyJZrpNcVCR7I+VXknqx4SnvB5hDXCbsIcKX+Tv2h/lPluDQjuaoYwx
 mABuKLJGA8LVBEkoeC0ON7zO3NtShR6l6ptOQLJIcdcEymfG0XzStwul4LjK564/Lm
 PJarGR1GwlAOU2mPDECrp44oLmFQXtSDH6M+bSew2MdLBhA/MGgfcMP/mORGJ80mS/
 vsuSETTm/1kkg==
Date: Wed, 18 Jun 2025 22:23:08 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Benno Lossin <lossin@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v5 23/23] gpu: nova-core: load and run FWSEC-FRTS
Message-ID: <aFMgLDfNKWPsSoD1@cassiopeiae>
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-23-14ba7eaf166b@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-nova-frts-v5-23-14ba7eaf166b@nvidia.com>
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

On Thu, Jun 12, 2025 at 11:01:51PM +0900, Alexandre Courbot wrote:
> @@ -237,6 +237,67 @@ pub(crate) fn new(
>              },
>          )?;
>  
> +        // Check that the WPR2 region does not already exists - if it does, the GPU needs to be
> +        // reset.
> +        if regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI::read(bar).hi_val() != 0 {
> +            dev_err!(
> +                pdev.as_ref(),
> +                "WPR2 region already exists - GPU needs to be reset to proceed\n"
> +            );
> +            return Err(EBUSY);
> +        }
> +
> +        // Reset falcon, load FWSEC-FRTS, and run it.
> +        gsp_falcon
> +            .reset(bar)
> +            .inspect_err(|e| dev_err!(pdev.as_ref(), "Failed to reset GSP falcon: {:?}\n", e))?;
> +        gsp_falcon
> +            .dma_load(bar, &fwsec_frts)
> +            .inspect_err(|e| dev_err!(pdev.as_ref(), "Failed to load FWSEC-FRTS: {:?}\n", e))?;
> +        let (mbox0, _) = gsp_falcon
> +            .boot(bar, Some(0), None)
> +            .inspect_err(|e| dev_err!(pdev.as_ref(), "Failed to boot FWSEC-FRTS: {:?}\n", e))?;
> +        if mbox0 != 0 {
> +            dev_err!(pdev.as_ref(), "FWSEC firmware returned error {}\n", mbox0);
> +            return Err(EIO);
> +        }
> +
> +        // SCRATCH_E contains FWSEC-FRTS' error code, if any.
> +        let frts_status = regs::NV_PBUS_SW_SCRATCH_0E::read(bar).frts_err_code();
> +        if frts_status != 0 {
> +            dev_err!(
> +                pdev.as_ref(),
> +                "FWSEC-FRTS returned with error code {:#x}",
> +                frts_status
> +            );
> +            return Err(EIO);
> +        }
> +
> +        // Check the WPR2 has been created as we requested.
> +        let (wpr2_lo, wpr2_hi) = (
> +            (regs::NV_PFB_PRI_MMU_WPR2_ADDR_LO::read(bar).lo_val() as u64) << 12,
> +            (regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI::read(bar).hi_val() as u64) << 12,
> +        );
> +        if wpr2_hi == 0 {
> +            dev_err!(
> +                pdev.as_ref(),
> +                "WPR2 region not created after running FWSEC-FRTS\n"
> +            );
> +
> +            return Err(EIO);
> +        } else if wpr2_lo != fb_layout.frts.start {
> +            dev_err!(
> +                pdev.as_ref(),
> +                "WPR2 region created at unexpected address {:#x}; expected {:#x}\n",
> +                wpr2_lo,
> +                fb_layout.frts.start,
> +            );
> +            return Err(EIO);
> +        }
> +
> +        dev_dbg!(pdev.as_ref(), "WPR2: {:#x}-{:#x}\n", wpr2_lo, wpr2_hi);
> +        dev_dbg!(pdev.as_ref(), "GPU instance built\n");
> +

This makes Gpu::new() quite messy, can we move this to a separate function
please?
