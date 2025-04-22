Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F78A96208
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 10:40:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F5010E541;
	Tue, 22 Apr 2025 08:40:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lM1KxEWd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A516010E540;
 Tue, 22 Apr 2025 08:40:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BD1374A403;
 Tue, 22 Apr 2025 08:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696FAC4CEE9;
 Tue, 22 Apr 2025 08:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745311210;
 bh=kLcjk51wJsUljQyaecq5AfgQxJN4wExk8HuiqyuZwB0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lM1KxEWd3Mhzqs2MwJIafILlZcmHtY4/Ke7piXoF4c/neIOLTXiPqvj//89720ycE
 /8cRkI6cuxy5k1rSSHdfWtT9UJnNkY8DC3RNDfgqoldOH6KsnVMVBWpUzQ7uDFwJXA
 4lE9+LweWkcfNtHZLuYjidL/+URI81ZM212K5x3SoCcWhyh1KlfCqePQ0l8+fZ58mF
 j+Jb86UV69UUdDoBoq831O2YctFnUXIJuhvL6GkRAuXHrr7hDkz63mEZ3+YlrdrtM9
 LYQxwk4T4wpCntokwbT0WJY7rdEeI0tUJpt9JFYs7rJumyqrv4jwfuDpwuYaWx+dEk
 O8h01K4oUSS2A==
Date: Tue, 22 Apr 2025 10:40:02 +0200
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
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Sergio =?iso-8859-1?Q?Gonz=E1lez?= Collado <sergio.collado@gmail.com>
Subject: Re: [PATCH 00/16] nova-core: run FWSEC-FRTS to perform first stage
 of GSP initialization
Message-ID: <aAdV4kkCzkSeMNXy@cassiopeiae>
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
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

On Sun, Apr 20, 2025 at 09:19:32PM +0900, Alexandre Courbot wrote:
> Hi everyone,
> 
> This series is a continuation of my previous RFCs [1] to complete the
> first step of GSP booting (running the FWSEC-FRTS firmware extracted
> from the BIOS) on Ampere devices. While it is still far from bringing
> the GPU into a state where it can do anything useful, it sets up the
> basic layout of the driver upon which we can build in order to continue
> with the next steps of GSP booting, as well as supporting more chipsets.
> 
> Upon successful probe, the driver will display the range of the WPR2
> region constructed by FWSEC-FRTS:
> 
>   [   95.436000] NovaCore 0000:01:00.0: WPR2: 0xffc00000-0xffce0000
>   [   95.436002] NovaCore 0000:01:00.0: GPU instance built
> 
> This code is based on nova-next with the try_access_with patch [2].

Please make sure to compile with CLIPPY=1, the series has quite some clippy
warnings.

I also noticed that there are a lot of compiler warnings about unreachable pub
fields with rustc 1.78, whereas with the latest stable compiler there are none.

I'm not exactly sure why that is (and I haven't looked further), but the
corresponding fields indeed seem to have unnecessary pub visibility.

> There is still a bit of unsafe code where it is not desired, notably to
> transmute byte slices into types that implement FromBytes - this is
> because support for doing such transmute operations safely are not in
> the kernel crate yet.

I assume you refer to [3]? As long as we put a TODO and follow up once the
series lands, that's fine for me.

> 
> [1] https://lore.kernel.org/rust-for-linux/20250320-nova_timer-v3-0-79aa2ad25a79@nvidia.com/
> [2] https://lore.kernel.org/rust-for-linux/20250411-try_with-v4-0-f470ac79e2e2@nvidia.com/
[3] https://lore.kernel.org/lkml/20250330234039.29814-1-christiansantoslima21@gmail.com/
