Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66190ABD362
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 11:31:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1CC310E44B;
	Tue, 20 May 2025 09:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IXBc2pGq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C55410E44B;
 Tue, 20 May 2025 09:31:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 931D4A4C865;
 Tue, 20 May 2025 09:30:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68E36C4CEE9;
 Tue, 20 May 2025 09:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747733459;
 bh=jcb4aPAbKPsWRg6KidM3qub1Bb9HpbBNOe12kNEXwSU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IXBc2pGqp+VVik11Y7jfvML+CkrotItGRoxjZZGTMo5og35cO210IyMChrOKrfY7c
 dysWNOqI39ZDurXZ9RHWc/LOhAm3EQIcmorx05+Z6zWEDRKFwFMiK7xRvH8kCgDwJU
 X9x/X4UVhK9JqYuFF1ed3w4IAtuMM+T9wwNcKCIFkg5UcK/qsYlBkDLUBnoCKHaFj6
 FGxxEPzdpyH2O4HYQXhq/Fn5b50S297R9OaR7SkYtCeEpdio2q16uw3/ooM1QLkAVi
 ONhWUU9/6Lnup0BcTlsA4fIbqCTRj4QQZQSxFVA+8itV+AZbiTGzB47zWPXnk7qLMh
 UwdOgr9LG2HeA==
Date: Tue, 20 May 2025 11:30:51 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
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
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Shirish Baskaran <sbaskaran@nvidia.com>
Subject: Re: [PATCH v3 16/19] nova-core: Add support for VBIOS ucode
 extraction for boot
Message-ID: <aCxLyxcERNHKzfvI@cassiopeiae>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
 <20250507-nova-frts-v3-16-fcb02749754d@nvidia.com>
 <aCN_PIYEEzs73AqT@pollux>
 <4fee85be-a8c5-4a99-8397-c93e79d72d15@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fee85be-a8c5-4a99-8397-c93e79d72d15@nvidia.com>
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

On Tue, May 20, 2025 at 03:55:06AM -0400, Joel Fernandes wrote:
> On 5/13/2025 1:19 PM, Danilo Krummrich wrote:
> > On Wed, May 07, 2025 at 10:52:43PM +0900, Alexandre Courbot wrote:
> >> @@ -238,6 +239,8 @@ pub(crate) fn new(
> >>  
> >>          let _sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, bar, true)?;
> >>  
> >> +        let _bios = Vbios::new(pdev, bar)?;
> > 
> > Please add a comment why, even though unused, it is important to create this
> > instance.
> > 
> > Also, please use `_` if it's not intended to ever be used.
> 
> If I add a comment, it will simply be removed by the next patch. I can add that
> though so it makes it more clear.

I recommend to add such comments, because then reviewers don't stumble over it.
:-)

> >> +impl Vbios {
> >> +    /// Probe for VBIOS extraction
> >> +    /// Once the VBIOS object is built, bar0 is not read for vbios purposes anymore.
> >> +    pub(crate) fn new(pdev: &pci::Device, bar0: &Bar0) -> Result<Vbios> {
> >> +        // Images to extract from iteration
> >> +        let mut pci_at_image: Option<PciAtBiosImage> = None;
> >> +        let mut first_fwsec_image: Option<FwSecBiosImage> = None;
> >> +        let mut second_fwsec_image: Option<FwSecBiosImage> = None;
> >> +
> >> +        // Parse all VBIOS images in the ROM
> >> +        for image_result in VbiosIterator::new(pdev, bar0)? {
> >> +            let full_image = image_result?;
> >> +
> >> +            dev_info!(
> > 
> > Let's use dev_dbg!() instaed.
> 
> Done.
> 
> > 
> >> +                pdev.as_ref(),
> >> +                "Found BIOS image: size: {:#x}, type: {}, last: {}\n",
> >> +                full_image.image_size_bytes()?,
> >> +                full_image.image_type_str(),
> >> +                full_image.is_last()
> >> +            );
> >> +
> >> +            // Get references to images we will need after the loop, in order to
> >> +            // setup the falcon data offset.
> >> +            match full_image {
> >> +                BiosImage::PciAt(image) => {
> >> +                    pci_at_image = Some(image);
> >> +                }
> >> +                BiosImage::FwSec(image) => {
> >> +                    if first_fwsec_image.is_none() {
> >> +                        first_fwsec_image = Some(image);
> >> +                    } else {
> >> +                        second_fwsec_image = Some(image);
> >> +                    }
> >> +                }
> >> +                // For now we don't need to handle these
> >> +                BiosImage::Efi(_image) => {}
> >> +                BiosImage::Nbsi(_image) => {}
> >> +            }
> >> +        }
> >> +
> >> +        // Using all the images, setup the falcon data pointer in Fwsec.
> >> +        // We need mutable access here, so we handle the Option manually.
> >> +        let final_fwsec_image = {
> >> +            let mut second = second_fwsec_image; // Take ownership of the option
> >> +
> >> +            if let (Some(second), Some(first), Some(pci_at)) =
> >> +                (second.as_mut(), first_fwsec_image, pci_at_image)
> >> +            {
> >> +                second
> >> +                    .setup_falcon_data(pdev, &pci_at, &first)
> >> +                    .inspect_err(|e| {
> >> +                        dev_err!(pdev.as_ref(), "Falcon data setup failed: {:?}\n", e)
> >> +                    })?;
> >> +            } else {
> >> +                dev_err!(
> >> +                    pdev.as_ref(),
> >> +                    "Missing required images for falcon data setup, skipping\n"
> >> +                );
> >> +                return Err(EINVAL);
> > 
> > This means that if second == None we fail, which makes sense, so why store an
> > Option in Vbios? All methods of Vbios fail if fwsec_image == None.
> > 
> 
> Well, if first and pci_at are None, we will fail as well. Not just second. But
> we don't know until we finish parsing all the images in the prior loop, if we
> found all the images. So we store it as Option during the prior loop, and check
> it later. Right?

My point is not that second is an option within this function -- that's fine. I
don't want the Vbios type to store an Option, because that doesn't make sense.
I.e. it should be

	struct Vbios {
	   fwsec_image: FwSecBiosImage,
	}

or just

	struct Vbios(FwSecBiosImage);

which is the same, rather than

	struct Vbios {
	   fwsec_image: Option<FwSecBiosImage>,
	}

because Vbios::new() fails anyways if any of the images is None, i.e.
vbios.fwsec_image can't ever be None.

The code below does that for you, i.e. it returns an instance of Vbios without
the inner Option.

> >> +            }
> >> +            second
> >> +        };
> > 
> > I think this should be:
> > 
> > 	let mut second = second_fwsec_image;
> > 	
> > 	if let (Some(second), Some(first), Some(pci_at)) =
> > 	    (second.as_mut(), first_fwsec_image, pci_at_image)
> > 	{
> > 	    second
> > 	        .setup_falcon_data(pdev, &pci_at, &first)
> > 	        .inspect_err(|e| {
> > 	            dev_err!(pdev.as_ref(), "Falcon data setup failed: {:?}\n", e)
> > 	        })?;
> > 	
> > 	    Ok(Vbios(second)
> > 	} else {
> > 	    dev_err!(
> > 	        pdev.as_ref(),
> > 	        "Missing required images for falcon data setup, skipping\n"
> > 	    );
> > 	
> > 	    Err(EINVAL)
> > 	}
> > 
> > where Vbios can just be
> > 
> > 	pub(crate) struct Vbios(FwSecBiosImage);
> 
> But your suggestion here still considers second as an Option? That's why you
> wrote 'Some(second)' ?

Yes, that's fine, see above. The difference is that the code returns you an
instance of

	struct Vbios(FwSecBiosImage);

rather than

	struct Vbios {
	   fwsec_image: Option<FwSecBiosImage>,
	}

which is unnecessary.

> 
> > 
> >> +
> >> +        Ok(Vbios {
> >> +            fwsec_image: final_fwsec_image,
> >> +        })
> >> +    }
> >> +
> >> +    pub(crate) fn fwsec_header(&self, pdev: &device::Device) -> Result<&FalconUCodeDescV3> {
> >> +        let image = self.fwsec_image.as_ref().ok_or(EINVAL)?;
> >> +        image.fwsec_header(pdev)
> >> +    }
> >> +
> >> +    pub(crate) fn fwsec_ucode(&self, pdev: &device::Device) -> Result<&[u8]> {
> >> +        let image = self.fwsec_image.as_ref().ok_or(EINVAL)?;
> >> +        image.fwsec_ucode(pdev, image.fwsec_header(pdev)?)
> >> +    }
> >> +
> >> +    pub(crate) fn fwsec_sigs(&self, pdev: &device::Device) -> Result<&[u8]> {
> >> +        let image = self.fwsec_image.as_ref().ok_or(EINVAL)?;
> >> +        image.fwsec_sigs(pdev, image.fwsec_header(pdev)?)
> >> +    }
> > 
> > Those then become infallible, e.g.
> > 
> > 	pub(crate) fn fwsec_sigs(&self, pdev: &device::Device) -> &[u8] {
> > 	    self.0.fwsec_sigs(pdev, self.fwsec_header(pdev))
> > 	}
> > 
> 
> Nope, I think you are wrong there. fwsec_sigs() of the underlying .0 returns a
> Result.

That's true, I confused self.fwsec_sigs() with self.0.fwsec_sigs(). It seems
that you may want to implement Deref for Vbios.

Also, can you please double check the Options in FwSecBiosImage (in case we
didn't talk about them yet)? They look quite suspicious too.

In general, I feel like a lot of those Option come from a programming pattern
that is very common in C, i.e. allocate a structure (stack or heap) and then
initialize its fields.

In Rust you should aim to initialize all the fields of a structure when you
create the instance. Option as a return type of a function is common, but it's
always a bit suspicious when there is an Option field in a struct.

I understand that there are cases where we can't omit it, and for obvious
reasons the Vbios code is probably a perfect example for that.

However, I recommend looking at this from top to bottom: Do the "final"
structures that we expose to the driver from the Vbios module have fields that
are *really* optional? Or is the Option type just a result from the parsing
process?

If it's the latter, we should get rid of it and work with a different type
during the parsing process and then create the final instance that is exposed to
the driver at the end.

For instance FwSecBiosImage is defined as:

	pub(crate) struct FwSecBiosImage {
	    base: BiosImageBase,
	    falcon_data_offset: Option<usize>,
	    pmu_lookup_table: Option<PmuLookupTable>,
	    falcon_ucode_offset: Option<usize>,
	}

Do only *some* FwSecBiosImage instances have a falcon_ucode_offset?

If the answer is 'no' then it shouldn't be an Option. If the answer is 'yes',
then this indicates that FwSecBiosImage is probably too generic and should be
split into more specific types of a FwSecBiosImage which instead share a common
trait in order to treat the different types generically.

> Also in Vbios::new(), I extract the Option when returning:
> 
>         Ok(Vbios {
>             fwsec_image: final_fwsec_image.ok_or(EINVAL)?,
>         })

Maybe you do so in your tree? v3 of the patch series has:

	pub(crate) struct Vbios {
	   pub fwsec_image: Option<FwSecBiosImage>,
	}

and

	Ok(Vbios {
	   fwsec_image: final_fwsec_image,
	})
