Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E61BABDE13
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 17:01:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7405410E658;
	Tue, 20 May 2025 15:01:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oPyjeJGc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5B010E65F;
 Tue, 20 May 2025 15:01:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 37C72A4EBC2;
 Tue, 20 May 2025 15:01:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B931C4CEE9;
 Tue, 20 May 2025 15:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747753284;
 bh=JXYMAkvj/vNiCk438wP3usUMpigmdkQBoAWrzqqiPxo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oPyjeJGcL4wWmhLv9mYckwIt//FsPF0uVP927y59OhlFrG6w8DlDaTFA/0oEEKPex
 BpULEI41kTjn1Xvdk6JCqfB81lKme9hOYL5y1qmUqi/8JfGgVNGWDdfejU8mTammlY
 ygphQufAE1kUFtKHG/7Vj7eSp/GKSAxVP/0xTyT4Y+iCcGpeYEHL9O29bJ/pDMeN7T
 aNMknS2rzjZvu9BcB7C2g3wfJ8naFN2qREUgQ0H0M731NSH8H1HNsTkoKJzzpzmo6g
 wbbdSCKGWrQ1uQPYZ6kgpf6HAW5um6D5dbpFFkYQd5LhuAHPtSiYLSN3IgQ3duaECG
 FfFtCadsO2/1w==
Date: Tue, 20 May 2025 17:01:17 +0200
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
Message-ID: <aCyZPUaPSks_DhTn@cassiopeiae>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
 <20250507-nova-frts-v3-16-fcb02749754d@nvidia.com>
 <aCN_PIYEEzs73AqT@pollux>
 <4fee85be-a8c5-4a99-8397-c93e79d72d15@nvidia.com>
 <aCxLyxcERNHKzfvI@cassiopeiae>
 <3cfb7a8c-467e-44d0-9874-361f719748b8@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3cfb7a8c-467e-44d0-9874-361f719748b8@nvidia.com>
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

On Tue, May 20, 2025 at 09:43:42AM -0400, Joel Fernandes wrote:
> On 5/20/2025 5:30 AM, Danilo Krummrich wrote:
> > On Tue, May 20, 2025 at 03:55:06AM -0400, Joel Fernandes wrote:
> >> On 5/13/2025 1:19 PM, Danilo Krummrich wrote:
> >>> On Wed, May 07, 2025 at 10:52:43PM +0900, Alexandre Courbot wrote:
> 
> So the code here now looks like the below, definitely better, thanks! :
> 
>             if let (Some(second_ref), Some(first), Some(pci_at)) =
>                 (second.as_mut(), first_fwsec_image, pci_at_image)
>             {
>                 second_ref
>                     .setup_falcon_data(pdev, &pci_at, &first)
>                     .inspect_err(|e| {
>                         dev_err!(..)
>                     })?;
>                 Ok(Vbios { fwsec_image: second.take().ok_or(EINVAL)? })
>             } else {
>                 dev_err!(
>                     pdev.as_ref(),
>                     "Missing required images for falcon data setup, skipping\n"
>                 );
>                 Err(EINVAL)
>             }

Sorry, my code-snipped was incorrect indeed. Let me paste what I actually
intended (and this time properly compile checked) and should be even better:

	if let (Some(mut second), Some(first), Some(pci_at)) =
	    (second_fwsec_image, first_fwsec_image, pci_at_image)
	{
	    second
	        .setup_falcon_data(pdev, &pci_at, &first)
	        .inspect_err(|e| {
	            dev_err!(pdev.as_ref(), "Falcon data setup failed: {:?}\n", e)
	        })?;
	
	    Ok(Vbios(second))
	} else {
	    dev_err!(
	        pdev.as_ref(),
	        "Missing required images for falcon data setup, skipping\n"
	    );
	
	    Err(EINVAL)
	}

So, with this second is the actual value and not just a reference. :)

And the methods can become:

	pub(crate) fn fwsec_header(&self, pdev: &device::Device) -> Result<&FalconUCodeDescV3> {
	    self.0.fwsec_header(pdev)
	}
	
	pub(crate) fn fwsec_ucode(&self, pdev: &device::Device) -> Result<&[u8]> {
	    self.0.fwsec_ucode(pdev, self.fwsec_header(pdev)?)
	}
	
	pub(crate) fn fwsec_sigs(&self, pdev: &device::Device) -> Result<&[u8]> {
	    self.0.fwsec_sigs(pdev, self.fwsec_header(pdev)?)
	}

However, I don't understand why they're not just implemented for FwSecBiosImage
itself this way. You can just implement Deref for Vbios then.

> > In general, I feel like a lot of those Option come from a programming pattern
> > that is very common in C, i.e. allocate a structure (stack or heap) and then
> > initialize its fields.
> > 
> > In Rust you should aim to initialize all the fields of a structure when you
> > create the instance. Option as a return type of a function is common, but it's
> > always a bit suspicious when there is an Option field in a struct.
> 
> I looked into it, I could not git rid of those ones because we need to
> initialize in the "impl TryFrom<BiosImageBase> for BiosImage {"
> 
>             0xE0 => Ok(BiosImage::FwSec(FwSecBiosImage {
>                 base,
>                 falcon_data_offset: None,
>                 pmu_lookup_table: None,
>                 falcon_ucode_offset: None,
>             })),
> 
> And these fields will not be determined until much later, because as is the case
> with the earlier example, these fields cannot be determined until all the images
> are parsed.

You should not use TryFrom, but instead use a normal constructor, such as

	BiosImage::new(base_bios_image)

and do the parsing within this constructor.

If you want a helper type with Options while parsing that's totally fine, but
the final result can clearly be without Options. For instance:

	struct Data {
	   image: KVec<u8>,
	}

	impl Data {
	   fn new() -> Result<Self> {
	      let parser = DataParser::new();

	      Self { image: parser.parse()? }
	   }

	   fn load_image(&self) {
	      ...
	   }
	}

	struct DataParser {
	   // Only some images have a checksum.
	   checksum: Option<u64>,
	   // Some images have an extra offset.
	   offset: Option<u64>,
	   // Some images need to be patched.
	   patch: Option<KVec<u8>>,
	   image: KVec<u8>,
	}

	impl DataParser {
	   fn new() -> Self {
	      Self {
	         checksum: None,
	         offset: None,
	         patch: None,
	         bytes: KVec::new(),
	      }
	   }

	   fn parse(self) -> Result<KVec<u8>> {
	      // Fetch all the required data.
	      self.fetch_checksum()?;
	      self.fetch_offset()?;
	      self.fetch_patch()?;
	      self.fetch_byes()?;

	      // Doesn't do anything if `checksum == None`.
	      self.validate_checksum()?;

	      // Doesn't do anything if `offset == None`.
	      self.apply_offset()?;

	      // Doesn't do anything if `patch == None`.
	      self.apply_patch()?;

	      // Return the final image.
	      self.image
	   }
	}

I think the pattern here is the same, but in this example you keep working with
the DataParser, instead of a new instance of Data.

> > I understand that there are cases where we can't omit it, and for obvious
> > reasons the Vbios code is probably a perfect example for that.
> > 
> > However, I recommend looking at this from top to bottom: Do the "final"
> > structures that we expose to the driver from the Vbios module have fields that
> > are *really* optional? Or is the Option type just a result from the parsing
> > process?
> > 
> > If it's the latter, we should get rid of it and work with a different type
> > during the parsing process and then create the final instance that is exposed to
> > the driver at the end.
> > 
> > For instance FwSecBiosImage is defined as:
> > 
> > 	pub(crate) struct FwSecBiosImage {
> > 	    base: BiosImageBase,
> > 	    falcon_data_offset: Option<usize>,
> > 	    pmu_lookup_table: Option<PmuLookupTable>,
> > 	    falcon_ucode_offset: Option<usize>,
> > 	}
> > 
> > Do only *some* FwSecBiosImage instances have a falcon_ucode_offset?
> > 
> > If the answer is 'no' then it shouldn't be an Option. If the answer is 'yes',
> > then this indicates that FwSecBiosImage is probably too generic and should be
> > split into more specific types of a FwSecBiosImage which instead share a common
> > trait in order to treat the different types generically.
> 
> Understood, thanks.
