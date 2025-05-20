Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 349B7ABDF3B
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 17:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DD1310E4D2;
	Tue, 20 May 2025 15:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WHAMTePx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E816A10E4D2;
 Tue, 20 May 2025 15:36:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E08EEA4EB2A;
 Tue, 20 May 2025 15:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96CC0C4CEE9;
 Tue, 20 May 2025 15:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747755418;
 bh=sfLD6pz/hgOykoSuAIvLsAQl1i68ILiyfvdiHoUOzY8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WHAMTePx+VNs9+XHL7M+pKyOf7aHJYN/Kt52QHUVcEhUyofo1k4h8eVx6Egn2MA2P
 5iv9QWjj7oFEEmkf1VZPnwO3GdbYnSbQJtMHCv4voN7sokTl2klVbZ9xE4ODOauTKn
 i3oAfp1Rmub/EvJzv8aCO2lRG+jcezoyAFMBSVYouQNnKr2RDBjuBGAdJZNWfby6Dg
 jb2Xa1OzIE3jgZ3vYoA7lK+LC/La0Cjm+5G+ZkkNCi+Idpn6YSn9Y8ELKnWoxF6RoU
 tQ5BTnhfFbRKLRrIh5jNoB/x+sHv52d/LJrXE+L1MQys6ellI7rYN9AC/Bt/6Trpgk
 6fvWCdFGSGDxw==
Date: Tue, 20 May 2025 17:36:50 +0200
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
Message-ID: <aCyhkiBTXV86P_GF@cassiopeiae>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
 <20250507-nova-frts-v3-16-fcb02749754d@nvidia.com>
 <aCN_PIYEEzs73AqT@pollux>
 <4fee85be-a8c5-4a99-8397-c93e79d72d15@nvidia.com>
 <aCxLyxcERNHKzfvI@cassiopeiae>
 <3cfb7a8c-467e-44d0-9874-361f719748b8@nvidia.com>
 <aCyZPUaPSks_DhTn@cassiopeiae>
 <bdb290d4-b369-4b8e-b78d-8c8d3cc07057@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdb290d4-b369-4b8e-b78d-8c8d3cc07057@nvidia.com>
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

On Tue, May 20, 2025 at 11:11:12AM -0400, Joel Fernandes wrote:
> On 5/20/2025 11:01 AM, Danilo Krummrich wrote:
> 
> I made this change and it LGTM. Thanks! I did not do the '.0' though since I
> want to keep the readability, lets see in the next revision if that looks good.

I think readability, is just as good with `.0`, but I'm fine with either.

> >>> In general, I feel like a lot of those Option come from a programming pattern
> >>> that is very common in C, i.e. allocate a structure (stack or heap) and then
> >>> initialize its fields.
> >>>
> >>> In Rust you should aim to initialize all the fields of a structure when you
> >>> create the instance. Option as a return type of a function is common, but it's
> >>> always a bit suspicious when there is an Option field in a struct.
> >>
> >> I looked into it, I could not git rid of those ones because we need to
> >> initialize in the "impl TryFrom<BiosImageBase> for BiosImage {"
> >>
> >>             0xE0 => Ok(BiosImage::FwSec(FwSecBiosImage {
> >>                 base,
> >>                 falcon_data_offset: None,
> >>                 pmu_lookup_table: None,
> >>                 falcon_ucode_offset: None,
> >>             })),
> >>
> >> And these fields will not be determined until much later, because as is the case
> >> with the earlier example, these fields cannot be determined until all the images
> >> are parsed.
> > 
> > You should not use TryFrom, but instead use a normal constructor, such as
> > 
> > 	BiosImage::new(base_bios_image)
> > 
> > and do the parsing within this constructor.
> > 
> > If you want a helper type with Options while parsing that's totally fine, but
> > the final result can clearly be without Options. For instance:
> > 
> > 	struct Data {
> > 	   image: KVec<u8>,
> > 	}
> > 
> > 	impl Data {
> > 	   fn new() -> Result<Self> {
> > 	      let parser = DataParser::new();
> > 
> > 	      Self { image: parser.parse()? }
> > 	   }
> > 
> > 	   fn load_image(&self) {
> > 	      ...
> > 	   }
> > 	}
> > 
> > 	struct DataParser {
> > 	   // Only some images have a checksum.
> > 	   checksum: Option<u64>,
> > 	   // Some images have an extra offset.
> > 	   offset: Option<u64>,
> > 	   // Some images need to be patched.
> > 	   patch: Option<KVec<u8>>,
> > 	   image: KVec<u8>,
> > 	}
> > 
> > 	impl DataParser {
> > 	   fn new() -> Self {
> > 	      Self {
> > 	         checksum: None,
> > 	         offset: None,
> > 	         patch: None,
> > 	         bytes: KVec::new(),
> > 	      }
> > 	   }
> > 
> > 	   fn parse(self) -> Result<KVec<u8>> {
> > 	      // Fetch all the required data.
> > 	      self.fetch_checksum()?;
> > 	      self.fetch_offset()?;
> > 	      self.fetch_patch()?;
> > 	      self.fetch_byes()?;
> > 
> > 	      // Doesn't do anything if `checksum == None`.
> > 	      self.validate_checksum()?;
> > 
> > 	      // Doesn't do anything if `offset == None`.
> > 	      self.apply_offset()?;
> > 
> > 	      // Doesn't do anything if `patch == None`.
> > 	      self.apply_patch()?;
> > 
> > 	      // Return the final image.
> > 	      self.image
> > 	   }
> > 	}
> > 
> > I think the pattern here is the same, but in this example you keep working with
> > the DataParser, instead of a new instance of Data.
> 
> I think this would be a fundamental rewrite of the patch. I am Ok with looking
> into it as a future item, but right now I am not sure if it justifies not using
> Option for these few. There's a lot of immediate work we have to do for boot,
> lets please not block the patch on just this if that's Ok with you. If you want,
> I could add a TODO here.

Honestly, I don't think it'd be too bad to fix this up. It's "just" a bit of
juggling fields and moving code around. The actual code should not change much.

Having Option<T> where the corresponding value T isn't actually optional is
extremely confusing and makes it hard for everyone, but especially new
contributors, to understand the code and can easily trick people into taking
wrong assumptions.

Making the code reasonably accessible for (new) contributors is one of the
objectives of nova and one of the learnings from nouveau.

Hence, let's get this right from the get-go please.
