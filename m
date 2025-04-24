Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA29A9B8EF
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 22:18:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B75610E859;
	Thu, 24 Apr 2025 20:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GgICv8TH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5737210E10C;
 Thu, 24 Apr 2025 20:18:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 08D38A42CDE;
 Thu, 24 Apr 2025 20:12:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A069C4CEE3;
 Thu, 24 Apr 2025 20:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745525880;
 bh=PvlSRg3PqK0Na1wxmJYNIAcgxcwAC/5M4UG3B2S6iEU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GgICv8THuxD1y4opGFDVixTPJ+MSLa06ftDHBZ/uL3bpcEba8Ax9CNjX/CrAjNnK+
 VrdftMj6rt/y0nYHggbE+/+ZdTDGCYLXRT7mOcGvwC7bCSE83+DbVxzPf3cC4DYWSm
 PMucd4/daNGVL1ky8SzTBOZzENHyxiZRg0M27zV0V9ZeTRNC52CdGfmktWVZXB+hWw
 G/KOn/rUFQY8/JYZBDntShkyosVq6rYRqn54LEEu0diJlmzt+/UBG/amyHDHtox3qq
 llxjUhKWpgKb3CWbVNBUYbOl0seYyxZsGbey/k6z4f59Tqb6lBJHo6xV9z3mo+gMsQ
 7NM2GTjTihpjw==
Date: Thu, 24 Apr 2025 22:17:53 +0200
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
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 13/16] gpu: nova-core: Add support for VBIOS ucode
 extraction for boot
Message-ID: <aAqccVvLIEZw-zrU@pollux>
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-13-ecd1cca23963@nvidia.com>
 <aAjz2CYTsAhidiEU@pollux>
 <88937e2b-6950-4c9d-8f02-50f9b12c7376@nvidia.com>
 <aAkBIvfTkKVNbdnm@pollux> <20250424195448.GA182914@joelnvbox>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424195448.GA182914@joelnvbox>
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

On Thu, Apr 24, 2025 at 03:54:48PM -0400, Joel Fernandes wrote:
> On Wed, Apr 23, 2025 at 05:02:58PM +0200, Danilo Krummrich wrote:
> > On Wed, Apr 23, 2025 at 10:52:42AM -0400, Joel Fernandes wrote:
> > > Hello, Danilo,
> > > Thanks for all the feedback. Due to the volume of feedback, I will respond
> > > incrementally in multiple emails so we can discuss as we go - hope that's Ok but
> > > let me know if that is annoying.
> > 
> > That's perfectly fine, whatever works best for you. :)
> > 
> > > On 4/23/2025 10:06 AM, Danilo Krummrich wrote:
> > > 
> > > >> +impl Vbios {
> > > >> +    /// Read bytes from the ROM at the current end of the data vector
> > > >> +    fn read_more(bar0: &Devres<Bar0>, data: &mut KVec<u8>, len: usize) -> Result {
> > > >> +        let current_len = data.len();
> > > >> +        let start = ROM_OFFSET + current_len;
> > > >> +
> > > >> +        // Ensure length is a multiple of 4 for 32-bit reads
> > > >> +        if len % core::mem::size_of::<u32>() != 0 {
> > > >> +            pr_err!("VBIOS read length {} is not a multiple of 4\n", len);
> > > > 
> > > > Please don't use any of the pr_*() print macros within a driver, use the dev_*()
> > > > ones instead.
> > > 
> > > Ok I'll switch to this. One slight complication is I've to retrieve the 'dev'
> > > from the Bar0 and pass that along, but that should be doable.
> > 
> > You can also pass the pci::Device reference to VBios::probe() directly.
> 
> 
> This turns out to be rather difficult to do in the whole vbios.rs because
> we'd have to them propogate pdev to various class methods which may print
> errors

Note that you can always create an ARef<pci::Device> instance from a
&pci::Device, which you can store temporarily if needed. Though I don't think
it's needed here.

> (some of which don't make sense to pass pdev to, like try_from()).

Yeah, it's indeed difficult with a TryFrom or From impl. I guess you're
referring to things like

	impl TryFrom<&[u8]> for PcirStruct

and I actually think that's a bit of an abuse of the TryFrom trait. A &[u8]
isn't really something that is "natural" to convert to a PcirStruct.

Instead you should just move this code into a normal constructor, i.e.
PcirStruct::new(). Here you can then also pass a device reference to print
errors.

We should really stick to dev_*() print macros from within driver code.
