Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC98ACF413
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 18:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BE510E8C5;
	Thu,  5 Jun 2025 16:22:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TxnIR4lv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A09810E30F;
 Thu,  5 Jun 2025 16:22:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 96518A508F2;
 Thu,  5 Jun 2025 16:22:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42DFBC4CEE7;
 Thu,  5 Jun 2025 16:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749140520;
 bh=Ea4g9neua+aixhvhWztzlvmnVM2cWQwkjqmF+C45424=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TxnIR4lvszyMTlqew7pjyEJDCEBF3LcQI5Y8ToauUR5vgQK96fdllN51/tD7zlBf4
 RAITpE3QPPWnaSkPFraCWcgdhRqtyZn3uIv5KlVrMPSv7TZDbHSP6cqLtPqEpwY626
 H/05C9jHaj5iFcQnuab7xnUW/K+k1sFGuad5TnvPw7X9pUzM73gRkIfwrgxyrQtpab
 4cmojpKcxH8/BfktyT76MZuX+QgCx/Sh0vhn0VGowjtgyIjR0kvekG//h715jqKv1/
 2OgDwnv78jSzrPaw2Go3SI0LjODNVWaJ/QsX4+Res65SIfx9DTkaLGDGiDkWDQT9BS
 KzAz9qF3fRBzA==
Date: Thu, 5 Jun 2025 18:21:52 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Lyude Paul <lyude@redhat.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
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
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Shirish Baskaran <sbaskaran@nvidia.com>
Subject: Re: [PATCH v4 16/20] nova-core: Add support for VBIOS ucode
 extraction for boot
Message-ID: <aEHEIId4Fp0cCWMH@pollux>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-16-05dfd4f39479@nvidia.com>
 <f528cd2d491f15404f30317dd093cc7af5a00fa7.camel@redhat.com>
 <9de086d3-e441-439f-9ff5-aa66a99643ba@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9de086d3-e441-439f-9ff5-aa66a99643ba@nvidia.com>
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

On Thu, Jun 05, 2025 at 12:09:46PM -0400, Joel Fernandes wrote:
> >> +impl PmuLookupTable {
> >> +    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
> >> +        if data.len() < 4 {
> >> +            return Err(EINVAL);
> >> +        }
> >> +
> >> +        let header_len = data[1] as usize;
> >> +        let entry_len = data[2] as usize;
> >> +        let entry_count = data[3] as usize;
> >> +
> >> +        let required_bytes = header_len + (entry_count * entry_len);
> >> +
> >> +        if data.len() < required_bytes {
> >> +            dev_err!(
> >> +                pdev.as_ref(),
> >> +                "PmuLookupTable data length less than required\n"
> >> +            );
> >> +            return Err(EINVAL);
> >> +        }
> >> +
> >> +        // Create a copy of only the table data
> >> +        let table_data = {
> >> +            let mut ret = KVec::new();
> >> +            ret.extend_from_slice(&data[header_len..required_bytes], GFP_KERNEL)?;
> >> +            ret
> >> +        };
> >> +
> >> +        // Debug logging of entries (dumps the table data to dmesg)
> >> +        if cfg!(debug_assertions) {
> >> +            for i in (header_len..required_bytes).step_by(entry_len) {
> >> +                dev_dbg!(
> >> +                    pdev.as_ref(),
> >> +                    "PMU entry: {:02x?}\n",
> >> +                    &data[i..][..entry_len]
> >> +                );
> >> +            }
> >> +        }
> > 
> > Not sure this makes sense - debug_assertions is supposed to be about
> > assertions, we probably shouldn't try to use it for other things (especially
> > since we've already got dev_dbg! here)
> 
> This was suggested by Danilo. I don't really feel strongly either way, IMO I am
> also Ok with running it in production.

When I suggested this, the code looked like this:

	// "last_entry_bytes" is a debugging aid.
	// let mut last_entry_bytes: Option<KVec<u8>> = Some(KVec::new());
	
	for &byte in &data[header_len..required_bytes] {
	    table_data.push(byte, GFP_KERNEL)?;
	    /*
	     * Uncomment for debugging (dumps the table data to dmesg):
	     * last_entry_bytes.as_mut().ok_or(EINVAL)?.push(byte, GFP_KERNEL)?;
	     *
	     * let last_entry_bytes_len = last_entry_bytes.as_ref().ok_or(EINVAL)?.len();
	     * if last_entry_bytes_len == entry_len {
	     *     pr_info!("Last entry bytes: {:02x?}\n", &last_entry_bytes.as_ref().ok_or(EINVAL)?[..]);
	     *     last_entry_bytes = Some(KVec::new());
	     * }
	     */
	}

Now the compiler probably optimizes the loop away, since dev_dbg!() turns into a
noop. So, now we can indeed probably remove it.
