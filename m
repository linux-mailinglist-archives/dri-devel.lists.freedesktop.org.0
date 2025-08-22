Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 728F6B31889
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 14:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E00B10EB03;
	Fri, 22 Aug 2025 12:58:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ld4V7Snz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9254010EB01;
 Fri, 22 Aug 2025 12:58:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 65BB7A5532E;
 Fri, 22 Aug 2025 12:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5B36C4CEED;
 Fri, 22 Aug 2025 12:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755867482;
 bh=NthJul2t/ihkNQEDNJDxStrByPgsFY1WvD6qbeKO9zc=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=Ld4V7SnzrCinLkVqtfXR19IT/hb1L9Tyb7FRqml4IsQfef9ypJcEfou5A31TbgctY
 Dcqn+lvrg+NzS/GnUjmVgAH19bZvj4EIaMuzQjl6RKT5xx194NJQ0IzYL5+hg1WcaR
 9fAHCcQz3P1o4/Wrb7XKZiOeeWKqiJmdEGiDJAPbkIqwH//4fWylhFJ69/5CBrUOVT
 wb0az991RPI2g4veMLJceH7H92NkEmTLkt3VXz1Ng1u9iQXpyJWfxTyyUs2wa2Oeq9
 jsM+BypbyKe0rJEdESPC8EIz1V78M9PEIZtRyaUOub1E898ol9BSUazGmXujY2eZdC
 SDH2cEZipJjpA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 Aug 2025 14:57:55 +0200
Message-Id: <DC8Z2MLOJN7D.3IOSY6SJ7DPVD@kernel.org>
Subject: Re: [PATCH 5/5] gpu: nova-core: firmware: process and prepare the
 GSP firmware
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250822-nova_firmware-v1-0-ff5633679460@nvidia.com>
 <20250822-nova_firmware-v1-5-ff5633679460@nvidia.com>
In-Reply-To: <20250822-nova_firmware-v1-5-ff5633679460@nvidia.com>
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

Hi Alex,

not a full review yet, but a few ad-hoc comments from skimming over it.

On Fri Aug 22, 2025 at 2:47 PM CEST, Alexandre Courbot wrote:
> +/// A device-mapped firmware with a set of (also device-mapped) pages ta=
bles mapping the firmware
> +/// to the start of their own address space.
> +pub(crate) struct GspFirmware {
> +    /// The GSP firmware inside a [`VVec`], device-mapped via a SG table=
.
> +    #[expect(unused)]

Do we expect this to change? Otherwise, just prefix the field name with an
underscore.

> +    fw: Pin<KBox<SGTable<Owned<VVec<u8>>>>>,
> +    /// The level 2 page table, mapping [`Self::fw`] at its beginning.
> +    #[expect(unused)]
> +    lvl2: Pin<KBox<SGTable<Owned<VVec<u8>>>>>,
> +    /// The level 1 page table, mapping [`Self::lvl2`] at its beginning.
> +    #[expect(unused)]
> +    lvl1: Pin<KBox<SGTable<Owned<VVec<u8>>>>>,

Instead of creating three allocations, just make struct GspFirmware pin_dat=
a by
itself. This should even propagate down to struct Gpu, which is pin_data.

So everything can be in one single allocation.

> +    /// The level 0 page table, mapping [`Self::lvl1`] at its beginning.
> +    lvl0: DmaObject,
> +    /// Size in bytes of the firmware contained in [`Self::fw`].
> +    #[expect(unused)]
> +    pub size: usize,
> +}
