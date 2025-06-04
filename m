Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED38FACDC0C
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 12:42:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3571B10E734;
	Wed,  4 Jun 2025 10:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cuZf38GB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DACEB10E734;
 Wed,  4 Jun 2025 10:42:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E03274A776;
 Wed,  4 Jun 2025 10:42:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D6A9C4CEE7;
 Wed,  4 Jun 2025 10:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749033736;
 bh=qNDOUiF7KGRFDOUnrBkneiuinvRIhfXa2gk0djElLEg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cuZf38GBKdmBQUia1rTRrpxrwZm0dilfnmqqBlXyp4nZz8oM1MMSWTNcr/kClFbvr
 ew94dmBplR3Dbvd7xH7kY/HTHVWIRDfpNAZJq6BfC2g0shGYB4HgMregASavszwCam
 O4jUhn55Hj7unRUdfYY5/cp+zgU/nSshPK1fu0gsEulAK2RaJVHHBLqhoUtow1P/Mm
 n2EdVMsYHUQ+9Rbvy3Crj/xNO33Fmb7SiOvfAQHGNB3vq7TlsJpMA9xQPonJidkxEv
 poTasdllJ8rpBDayF2IhUXn61Wc5nHP1MYbYIV+hsPVVQ+dDvGuq+ZwX050wxiptnq
 zp1PBIbJ5LriA==
Date: Wed, 4 Jun 2025 12:42:09 +0200
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
Subject: Re: [PATCH v4 19/20] gpu: nova-core: extract FWSEC from BIOS and
 patch it to run FWSEC-FRTS
Message-ID: <aEAjASkf9t4s4RsY@cassiopeiae>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-19-05dfd4f39479@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521-nova-frts-v4-19-05dfd4f39479@nvidia.com>
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

On Wed, May 21, 2025 at 03:45:14PM +0900, Alexandre Courbot wrote:
> +impl FirmwareDmaObject<FwsecFirmware> {
> +    /// Patch the Fwsec firmware image in `fw` to run the command `cmd`.
> +    fn patch_command(&mut self, v3_desc: &FalconUCodeDescV3, cmd: FwsecCommand) -> Result<()> {

Same comment as on the previous patch regarding patch_signature().

<snip>

> +    fn dmem_load_params(&self) -> FalconLoadTarget {
> +        FalconLoadTarget {
> +            src_start: self.desc.imem_load_size,
> +            dst_start: self.desc.dmem_phys_base,
> +            len: Layout::from_size_align(self.desc.dmem_load_size as usize, 256)
> +                // Cannot panic, as 256 is non-zero and a power of 2.
> +                .unwrap()

There is also Layout::from_size_align_unchecked(), which I prefer over unwrap().
I think we should never use unwrap() and rather the unsafe variant, which at least
forces us to document things properly, if there's no other option.

In this case, however, I don't see why we can't just propage the error? This
method is used from Falcon::dma_load(), which returns a Result anyways, so let's
just propagate it.

In general, we should *never* potentially panic the whole kernel just because
of a wrong size calculation in a driver.
