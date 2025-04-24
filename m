Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D1FA9B8CF
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 22:09:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE49810E1A5;
	Thu, 24 Apr 2025 20:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ISS9edEF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF88310E08F;
 Thu, 24 Apr 2025 20:08:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 18E1361137;
 Thu, 24 Apr 2025 20:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20AA7C4CEE3;
 Thu, 24 Apr 2025 20:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745525338;
 bh=r/J+71axIcbcBnTDMTPbPhfWreusoyG9PFW3KMwW3d0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ISS9edEF3u5Xby+MOrLIfGta/xXgvj8DjuWHfzBXrFZ9ZBVbkAwIkoDv9x14/vlmd
 hzy7BUxXKcII6wkglUSqd21SGKks8ao2Mb/0m5uGpwG+WWvYJL4XwU43191f7cCpJX
 zy0BhwhgLd7MBL5szOCwB0f9KYZB+tcTH1/At/LklVOkX6MC3pKizBD69oeN3VTsMR
 ku0O6Rzq6WoT1dSlZeSQRjA10kpghiyV2qSGBzVH87+Dy5b1c41PQgsNkCSjCQUTeA
 j1gGwCwlYLhhucBavtvJ+AQVSrgVaTuEEAoJBlBgoftI+s7Reib0R0jbd5rHQcx3BT
 9fCHoitRYzsyA==
Date: Thu, 24 Apr 2025 22:08:51 +0200
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
Message-ID: <aAqaU-nX0YRKIGyl@pollux>
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-13-ecd1cca23963@nvidia.com>
 <aAjz2CYTsAhidiEU@pollux>
 <7f3aa4b3-a24a-41c6-b75e-61e0e6e11ee3@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f3aa4b3-a24a-41c6-b75e-61e0e6e11ee3@nvidia.com>
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

On Thu, Apr 24, 2025 at 02:54:42PM -0400, Joel Fernandes wrote:
> 
> 
> On 4/23/2025 10:06 AM, Danilo Krummrich wrote:
> [...]
> >> +
> >> +    /// Probe for VBIOS extraction
> >> +    /// Once the VBIOS object is built, bar0 is not read for vbios purposes anymore.
> >> +    pub(crate) fn probe(bar0: &Devres<Bar0>) -> Result<Self> {
> > 
> > Let's not call it probe(), what about VBios::parse(), or simply VBios::new()?
> > 
> 
> Yes, new() is better. I changed it.
> 
> >> +        // VBIOS data vector: As BIOS images are scanned, they are added to this vector
> >> +        // for reference or copying into other data structures. It is the entire
> >> +        // scanned contents of the VBIOS which progressively extends. It is used
> >> +        // so that we do not re-read any contents that are already read as we use
> >> +        // the cumulative length read so far, and re-read any gaps as we extend
> >> +        // the length
> >> +        let mut data = KVec::new();
> >> +
> >> +        // Loop through all the BiosImage and extract relevant ones and relevant data from them
> >> +        let mut cur_offset = 0;
> > 
> > I suggest to create a new type that contains data and offset and implement
> > read_bios_image_at_offset() and friends as methods of this type. I think this
> > would turn out much cleaner.
> I moved it into struct Vbios {} itself instead of introducing a new type. Is
> that Ok?
> 
> I agree it is cleaner. Please see below link for this particular refactor
> (moving data) and let me know if it looks Ok to you: http://bit.ly/4lHfDKZ

I still think a new type would be better, the Option<KVec<u8>> that is only used
for the construction of the actual type instance is a bit weird. It's basically
two types in one, which is also why you need two options -- better separate
them.
