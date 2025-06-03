Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC85ACC855
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 15:50:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB20A10E62B;
	Tue,  3 Jun 2025 13:50:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="boN5joj4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B7810E61B;
 Tue,  3 Jun 2025 13:49:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4455E5C4B4F;
 Tue,  3 Jun 2025 13:47:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 170BBC4CEEF;
 Tue,  3 Jun 2025 13:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748958598;
 bh=U6g39ClQB+hk5GPvCuPP+9un1adxAxTlTy6EwW+tjrA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=boN5joj49PYGWo0gzBJX9Z4fLk/NDlwvoC+0Td17+T9qgc+Il0E7LuvK9sMl/G4+X
 94m9luK4AsFPfQHk/DPxNsvCT1YFSHR9HtPgNjCZ4uFukxc338IUpe+Z0mwKMuHqOv
 JRnyefbAM8+5ub9OsVv2TerLN2K4kOJ9xBE0tNAewRta3zM3tDifEmeaHnmJq2R/ee
 37TahppRi/kTwKRoQa0tqoCka33buLW51YU0wwdmxK/VT9SBr4DpZcViPvWKocCkw3
 tE8esBfYyrNZ8zcPAUn+VHY/k9MsDfdI1d5L7uQ7ZLOkhh2NV0J4QRmoLOSAdu2/UB
 dVjgLMUI7ULdw==
Message-ID: <11ff2b73-c77b-4142-a492-1e525d530aeb@kernel.org>
Date: Tue, 3 Jun 2025 15:49:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/20] nova-core: Add support for VBIOS ucode
 extraction for boot
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Shirish Baskaran <sbaskaran@nvidia.com>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-16-05dfd4f39479@nvidia.com> <aD2oROKpaU8Bmyj-@pollux>
 <20250602151506.GA779285@joelnvbox> <DACQW908WCLA.2JHRLQ3V18FPD@nvidia.com>
 <2f03e11d-3621-4314-a232-611a5fd9ffcb@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <2f03e11d-3621-4314-a232-611a5fd9ffcb@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 6/3/25 3:47 PM, Joel Fernandes wrote:
> On 6/3/2025 4:12 AM, Alexandre Courbot wrote:
>> Would it then make sense to make `FwSecBiosImage` public, add an `fn
>> fwsec_image(&self) -> &FwSecBiosImage` method and have the caller call
>> its methods directly (maybe renamed to `header`, `ucode` and `sigs`)?
> 
> Yeah, that seems better. Danilo, you're good with that idea too?

Thanks, that sounds good to me!
