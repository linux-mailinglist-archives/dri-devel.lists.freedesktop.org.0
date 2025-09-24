Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6D6B99938
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 13:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046E410E701;
	Wed, 24 Sep 2025 11:28:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y6kVCJUm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 017CD10E6CE;
 Wed, 24 Sep 2025 11:28:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A2CFA44746;
 Wed, 24 Sep 2025 11:28:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C7A0C4CEE7;
 Wed, 24 Sep 2025 11:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758713305;
 bh=g0mEPqrjAhRTXIvJsgGonBI+aYxFehEStiN+fbiF7lc=;
 h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
 b=Y6kVCJUmte+uXJqvJMhuy0MMwlx+jh+aqiYE/7C/Nr9Bja3JXDH2pFctlA8nfZY2V
 xutkQiANavxpQAvcIGUaGH+kisu8SyK9hTdERq30iuTQwmiIuyCOVax4/0vKfjTMmF
 CkzP47fLHp6kJ/PlmYxn7aHVz/9sg2WHny/s4URW+dqGBtmx5CtwvoVQmjTg5SVkJC
 jlOtMIzTQ3jw0C4tTgegc26N802DSVKj/bV597Futke0J6tOEW89WFFgBMKg0+lYiy
 MuiAmeQ34dKDkzOxcD9GZVC0uTJpfdagfeAizrQr3jfhIRs34eHn2dc8cIjAm7ZH/F
 HcW+WZLYSwdnA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Sep 2025 13:28:18 +0200
Message-Id: <DD0ZTZM8S84H.1YDWSY7DF14LM@kernel.org>
Cc: "Benno Lossin" <lossin@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <acourbot@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>, "Yury
 Norov" <yury.norov@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, <nouveau@lists.freedesktop.org>
To: "Greg KH" <gregkh@linuxfoundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 1/6] nova-core: bitfield: Move bitfield-specific code
 from register! into new macro
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-2-joelagnelf@nvidia.com>
 <2025092157-pauper-snap-aad1@gregkh>
 <DCYHCLM67KRZ.366VS9PDKLYKY@kernel.org>
 <2025092125-urban-muppet-1c2f@gregkh>
 <DCYIX8URVIWM.2ZK3GHH3J82XQ@kernel.org>
 <2025092432-entrust-citizen-0232@gregkh>
In-Reply-To: <2025092432-entrust-citizen-0232@gregkh>
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

On Wed Sep 24, 2025 at 12:52 PM CEST, Greg KH wrote:
> Ok, great, but right now it's not doing that from what I am seeing when
> reading the code.  Shouldn't IoMem::new() take that as an argument?

That's correct, neither IoMem nor pci::Bar do consider it yet; it's on the =
list
of things that still need to be done.

> But, that feels odd as our current iomem api in C doesn't care about
> endian issues at all because it "assumes" that the caller has already
> handle this properly and all that the caller "wants" is to write/read to
> some memory chunk and not twiddle bits.

Yet it seems to be the correct place to deal with it. As mentioned below, r=
egmap
could just become part of an I/O backend implementation to do exactly that.

>> (Actually, we could even implement an I/O backend that uses regmap.)
>
> That would probably be best to do eventually as most platform drivers
> use regmap today as it's the sanest api we have at the moment.

I agree it's what we should do eventually.

>> So, I think the register!() stuff is rather orthogonal.
>
> I think it's very relevant as people seem to just be "assuming" that all
> the world (hardware and cpus) are little-endian, while in reality, they
> are anything but.  As proof, the code that uses this register!() logic
> today totally ignores endian issues and just assumes that it is both
> running on a little-endian system, AND the hardware is little-endian.
>
> As a crazy example, look at the USB host controllers that at runtime,
> have to be queried to determine what endian they are running on and the
> kernel drivers have to handle this "on the fly".  Yes, one can argue
> that the hardware developers who came up with that should be forced to
> write the drivers as penance for such sins, but in the end, it's us that
> has to deal with it...
>
> So ignoring it will get us quite a ways forward with controlling sane
> hardware on sane systems, but when s390 finally realizes they can be
> writing their drivers in rust, we are going to have to have these
> conversations again :)

I think it's not really that anyone is ignoring it (intentionally). It's tw=
o
different things that should be addressed here; yet they are related:

  (1) Implementation of an abstract representation of a register that drive=
rs
      can interact with.

  (2) The I/O layer that lays out the raw data on the physcial bus.

The register!() macro intends to provide an abstract representation of a
register for drivers to interact with. Think of it as an abstract box, wher=
e the
memory layout does not matter at all -- could be anything.

Theoretically, this abstraction could even store every single field of a
register in its own u32 or u64, etc. Of course, that's a waste of memory, w=
hich
is why we're using this bitfield thing instead.

The only thing that matters is that there is a contract between the struct
representing a register (generated by the register!() macro) and the I/O ba=
ckend
layer that lays out the raw value on the bus.

This works attempts to address (1), whereas you are (rightfully) asking for=
 (2).
And I think the answer for (2) simply is, we still have to address it.
