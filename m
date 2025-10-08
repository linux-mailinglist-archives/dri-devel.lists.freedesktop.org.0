Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A454BC46FC
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 12:50:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C8FB10E7CC;
	Wed,  8 Oct 2025 10:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MxXnHkfd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F156910E07C;
 Wed,  8 Oct 2025 10:50:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 17C9A612AE;
 Wed,  8 Oct 2025 10:50:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85B3FC4CEF4;
 Wed,  8 Oct 2025 10:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759920600;
 bh=2hOyFHWMo22nr714D5lkkesp5ykT8kzlR52ADooTRLI=;
 h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
 b=MxXnHkfdijkCLancjr2NuW9oYgF7BJAy6t1DAo+J/7OidoL4rrxyYrNVfSKxu43m8
 Pchq0UtjXyEXCUT979pTZrY+oZXbY2k/zS4HyP/voD4O5OedcL1lJRMX9ly60py9L+
 l5Am9TRppBVyuiu2jIZj+PTFIIPYoPz4rReX3YSmSwl9XcQ6mkf/1Np6f3vzwA3qE7
 2UiLI69Y5t34UsGq46JaUlzhWDiWpEOyIRVuHwXla88wRDzc3XibTAg/TagtStzJK2
 FW8bD5lAM1gIDPXy/PyShhj5jDF4r6tY8qUhJb0i5tP3eVwQnI1QkvdQrvyK6bxphl
 rkPuiI88LQT1A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Oct 2025 12:49:54 +0200
Message-Id: <DDCVS7HAHDSN.2X14HAKD13MZI@kernel.org>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Yury Norov" <yury.norov@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>, "Elle Rhumsaa"
 <elle@weathered-steel.dev>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Andrea Righi" <arighi@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
To: "Greg KH" <greg@kroah.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v6 0/5] Introduce bitfield and move register macro to
 rust/kernel/
References: <695CCDCE-A205-4557-AA15-6F102B8CCF0C@nvidia.com>
 <DDCV84IJHUML.126CB1CT0XMX5@kernel.org>
 <2025100808-unpadded-unsubtle-1053@gregkh>
In-Reply-To: <2025100808-unpadded-unsubtle-1053@gregkh>
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

On Wed Oct 8, 2025 at 12:47 PM CEST, Greg KH wrote:
> On Wed, Oct 08, 2025 at 12:23:40PM +0200, Danilo Krummrich wrote:
>> On Wed Oct 8, 2025 at 1:37 AM CEST, Joel Fernandes wrote:
>> > The Nvidia GPU architecture is little-endian (including MMU structures=
 in VRAM).
>>=20
>> Yes, I'm aware (and I'd assume that there is no reason to ever change th=
at).
>>=20
>> Just for the complete picture, there's also some endianness switch in th=
e
>> NV_PMC_BOOT_1 register I think?
>>=20
>> > All the CPU architectures our drivers support are expected to be littl=
e-endian.
>>=20
>> Technically, all Rust supported architectures are indeed little-endian.
>
> s390x is supported by rust as a tier2 output:
> 	https://doc.rust-lang.org/beta/rustc/platform-support/s390x-unknown-linu=
x-gnu.html
>
> so there really shouldn't be any reason why that platform couldn't add
> rust support today, right?

That's the one I also had in mind. :)
