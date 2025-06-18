Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A373ADF7A6
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 22:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 790B010E93D;
	Wed, 18 Jun 2025 20:24:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KIwO3bqb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0283010E93D;
 Wed, 18 Jun 2025 20:24:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 58428A52A67;
 Wed, 18 Jun 2025 20:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A218C4CEE7;
 Wed, 18 Jun 2025 20:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750278289;
 bh=4GCmh9V/BO2aKWAz9WhWrIZsBvlc1+u1r1T//FdrIng=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KIwO3bqbGcgVbQKaxSRNKuzTcyjApwJpMYcTlI+WLHICeh2mf6GniKw6iNX9jYPXg
 SiOOUHC9gbmAUPtLGwz5QS/WKxZp1JC1MzUq3DwLkoZ+QV8nxsdBwUvaopf/pKU42V
 +wqvQHffwVZkUKl0L3TsRrlKLDk2m8XX5gyMweIUGkXlhrtlgvljfkScNlH8I7h6et
 mS/sGwEuIfDn37HHBtCxsDcUO2fiKm9rNbJODI4ttuOBoxoTxAQeW6PLN+Giwye5CB
 n2rdBdeDLmKRcD/bNGGb/1g6Th/rQpsOy+1aPjYqG0EtBAHZ39DAVS1p/WTIG4TwD/
 fCKhKyg8Kyr2w==
Date: Wed, 18 Jun 2025 22:24:41 +0200
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
Message-ID: <aFMgiYzDXwHXVn8X@cassiopeiae>
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-23-14ba7eaf166b@nvidia.com>
 <aFMgLDfNKWPsSoD1@cassiopeiae>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFMgLDfNKWPsSoD1@cassiopeiae>
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

On Wed, Jun 18, 2025 at 10:23:15PM +0200, Danilo Krummrich wrote:
> On Thu, Jun 12, 2025 at 11:01:51PM +0900, Alexandre Courbot wrote:
> > @@ -237,6 +237,67 @@ pub(crate) fn new(
> >              },
> >          )?;
> >  
> > +        // Check that the WPR2 region does not already exists - if it does, the GPU needs to be
> > +        // reset.
> > +        if regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI::read(bar).hi_val() != 0 {
> > +            dev_err!(
> > +                pdev.as_ref(),
> > +                "WPR2 region already exists - GPU needs to be reset to proceed\n"
> > +            );
> > +            return Err(EBUSY);
> > +        }
> > +
> > +        // Reset falcon, load FWSEC-FRTS, and run it.
> > +        gsp_falcon
> > +            .reset(bar)
> > +            .inspect_err(|e| dev_err!(pdev.as_ref(), "Failed to reset GSP falcon: {:?}\n", e))?;
> > +        gsp_falcon
> > +            .dma_load(bar, &fwsec_frts)
> > +            .inspect_err(|e| dev_err!(pdev.as_ref(), "Failed to load FWSEC-FRTS: {:?}\n", e))?;
> > +        let (mbox0, _) = gsp_falcon
> > +            .boot(bar, Some(0), None)
> > +            .inspect_err(|e| dev_err!(pdev.as_ref(), "Failed to boot FWSEC-FRTS: {:?}\n", e))?;
> > +        if mbox0 != 0 {
> > +            dev_err!(pdev.as_ref(), "FWSEC firmware returned error {}\n", mbox0);
> > +            return Err(EIO);
> > +        }
> > +
> > +        // SCRATCH_E contains FWSEC-FRTS' error code, if any.
> > +        let frts_status = regs::NV_PBUS_SW_SCRATCH_0E::read(bar).frts_err_code();
> > +        if frts_status != 0 {
> > +            dev_err!(
> > +                pdev.as_ref(),
> > +                "FWSEC-FRTS returned with error code {:#x}",
> > +                frts_status
> > +            );
> > +            return Err(EIO);
> > +        }
> > +
> > +        // Check the WPR2 has been created as we requested.
> > +        let (wpr2_lo, wpr2_hi) = (
> > +            (regs::NV_PFB_PRI_MMU_WPR2_ADDR_LO::read(bar).lo_val() as u64) << 12,
> > +            (regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI::read(bar).hi_val() as u64) << 12,
> > +        );
> > +        if wpr2_hi == 0 {
> > +            dev_err!(
> > +                pdev.as_ref(),
> > +                "WPR2 region not created after running FWSEC-FRTS\n"
> > +            );
> > +
> > +            return Err(EIO);
> > +        } else if wpr2_lo != fb_layout.frts.start {
> > +            dev_err!(
> > +                pdev.as_ref(),
> > +                "WPR2 region created at unexpected address {:#x}; expected {:#x}\n",
> > +                wpr2_lo,
> > +                fb_layout.frts.start,
> > +            );
> > +            return Err(EIO);
> > +        }
> > +
> > +        dev_dbg!(pdev.as_ref(), "WPR2: {:#x}-{:#x}\n", wpr2_lo, wpr2_hi);
> > +        dev_dbg!(pdev.as_ref(), "GPU instance built\n");
> > +
> 
> This makes Gpu::new() quite messy, can we move this to a separate function
> please?

Actually, can't this just be a method of FwsecFirmware?
