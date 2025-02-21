Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC374A3F45A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 13:31:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EFA910E2D5;
	Fri, 21 Feb 2025 12:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TyleH0/G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08BD410E2D5;
 Fri, 21 Feb 2025 12:31:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DB9BB6128A;
 Fri, 21 Feb 2025 12:31:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6271BC4CED6;
 Fri, 21 Feb 2025 12:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740141103;
 bh=q8WccUvMCEjEq8D445PcgFQTfSEcnZeGJELN1WQnJpM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TyleH0/GM5J84z9onnQrMroU9wvXKOptL1fakQv4PcmqK7ukY1tfLzxO0Y2HrOREJ
 LmwH48qpkhDBzGHgcKREumi0uVK39mfYYiUTbfeqhX7+FiI9Hdi9rcaUldEeITPuDt
 GzH0OIGc3OQxBQTzYc7yhI6cIHL5XfseEm2jn9ihiyup/43v5DeMtg3+5t3kMVUv5X
 msW72GqQ4gywSELxcAx6InTB5uoHXAPsolLgGSmp+tyYATQ7gWAe1MnEcOvlwRZyA1
 +ai0Pu0D9sf6ZLcKZQgXGD64UT2LIeHdX993FSvAzxpRAe4IBwarUfBw1fUvlxd6VZ
 bBZztWPKcn0fw==
Date: Fri, 21 Feb 2025 13:31:38 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Dave Airlie <airlied@gmail.com>, Timur Tabi <ttabi@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@nvidia.com>,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH RFC 1/3] rust: add useful ops for u64
Message-ID: <Z7hyKm1jcRtdrmh9@pollux>
References: <D7VLMD31YB0V.OKHDSVUPAZTE@nvidia.com>
 <1b8921d46f7d70c7467ea0940d60220f05cccc5d.camel@nvidia.com>
 <D7W119MHCCWH.IS600FTIOV8O@nvidia.com>
 <e6322f90-08bd-4e86-8dad-2ddbd7e5cece@nvidia.com>
 <D7WFP99SMV3H.26AJWK17S0UPX@nvidia.com>
 <fd920faf-a707-4c6d-8c0b-3d59c010da1d@nvidia.com>
 <CAPM=9txmQWO+SHnZhr8zXHCZ=S8CNY=PryRVkWWuHyor-ajU6A@mail.gmail.com>
 <1597EDB7-D91B-4660-ADDC-D2252B26CB22@collabora.com>
 <41cf1c79-f61c-47e7-a0ed-afb8e82d50e6@nvidia.com>
 <D7Y3CO9OMZBQ.1QGFV73NZBBIF@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D7Y3CO9OMZBQ.1QGFV73NZBBIF@nvidia.com>
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

On Fri, Feb 21, 2025 at 08:35:54PM +0900, Alexandre Courbot wrote:
> On Thu Feb 20, 2025 at 9:14 AM JST, John Hubbard wrote:
> > On 2/19/25 3:13 PM, Daniel Almeida wrote:
> >>> On 19 Feb 2025, at 17:23, Dave Airlie <airlied@gmail.com> wrote:
> >>> On Thu, 20 Feb 2025 at 06:22, John Hubbard <jhubbard@nvidia.com> wrote:
> >>>> On 2/19/25 4:51 AM, Alexandre Courbot wrote:
> >>>>> Yes, that looks like the optimal way to do this actually. It also
> >>>>> doesn't introduce any overhead as the destructuring was doing both
> >>>>> high_half() and low_half() in sequence, so in some cases it might
> >>>>> even be more efficient.
> >>>>>
> >>>>> I'd just like to find a better naming. high() and low() might be enough?
> >>>>> Or are there other suggestions?
> >>>>>
> >>>>
> >>>> Maybe use "32" instead of "half":
> >>>>
> >>>>      .high_32()  / .low_32()
> >>>>      .upper_32() / .lower_32()
> >>>>
> >>>
> >>> The C code currently does upper_32_bits and lower_32_bits, do we want
> >>> to align or diverge here?
> >
> > This sounds like a trick question, so I'm going to go with..."align". haha :)
> >
> >>>
> >>> Dave.
> >> 
> >> 
> >> My humble suggestion here is to use the same nomenclature. `upper_32_bits` and
> >> `lower_32_bits` immediately and succinctly informs the reader of what is going on.
> >> 
> >
> > Yes. I missed the pre-existing naming in C, but since we have it and it's
> > well-named as well, definitely this is the way to go.
> 
> Agreed, I wasn't aware of the C equivalents either, but since they exist
> we should definitely use the same naming scheme.

IIUC, we're still talking about extending the u64 primitive type.

Hence, I think there is no necessity to do align with the corresponding C
nameing scheme. I think this would only be the case if we'd write an abstraction
for the C API.

In this case though we extend an existing Rust type, so we should do something
that aligns with the corresponding Rust type.

In this specific case I think it goes hand in hand though.

- Danilo
