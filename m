Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE3AADF6C6
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 21:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F6110E285;
	Wed, 18 Jun 2025 19:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nnkT9RJz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A5510E285;
 Wed, 18 Jun 2025 19:24:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E48E3629CE;
 Wed, 18 Jun 2025 19:24:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DE6CC4CEEF;
 Wed, 18 Jun 2025 19:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750274654;
 bh=0B1AqIh7XaT96Qz7mgiF/9cixkNlDiA1iViFQK2gYs4=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=nnkT9RJza11P1108ZFZQQbR60kDdssVI6SRGhuBkp1onGLyJ+27ShAiQPWjyM5aHN
 BSIlZVu+gs57RAtjxyWwmB/velvo4q0R6H2FD8eaXQOUIRxEH15bNc0XBi26Dy80P5
 4vhf5pOHx82Fz37X0MboY5pV68Y/YI3EHj/GBtRujwU/wJ0LEsMEnCmSkzR3RwhoXj
 Ppa1DhWdv7ro07e5u8zdRyVeFmke3NumBy8EfdRlWnn4wrKXUlNdSNblMStJtEcGwv
 up3wnPlQp1GqCUy22Pco8yokKs7ThNq4ULn/0ZjWRhOHORk1ZXEPM3rGPMScr0NkRQ
 8NyIWaYc1K0mw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Jun 2025 21:24:08 +0200
Message-Id: <DAPWKX9V8T26.315LG5OZLLL2M@kernel.org>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 05/23] rust: num: add the `fls` operation
From: "Benno Lossin" <lossin@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>
X-Mailer: aerc 0.20.1
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-5-14ba7eaf166b@nvidia.com>
 <DAMHWN6ML8A1.2AUE4UWR58KR2@kernel.org>
 <DANR43CR8X87.1YWHJK7P75TPQ@nvidia.com>
In-Reply-To: <DANR43CR8X87.1YWHJK7P75TPQ@nvidia.com>
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

On Mon Jun 16, 2025 at 8:41 AM CEST, Alexandre Courbot wrote:
> On Sun Jun 15, 2025 at 4:16 AM JST, Benno Lossin wrote:
>> On Thu Jun 12, 2025 at 4:01 PM CEST, Alexandre Courbot wrote:
>>> +            #[inline(always)]
>>> +            pub const fn [<fls_ $t>](v: $t) -> u32 {
>>
>> Can we name this `find_last_set_bit_ $t`? When the upstream function
>> lands, we should also rename this one.
>
> We can - but as for `align_up`/`next_multiple_of`, I am not sure which
> naming scheme (kernel-like or closer to Rust conventions) is favored in
> such cases, and so far it seems to come down to personal preference. I
> tend to think that staying close to kernel conventions make it easier to
> understand when a function is the equivalent of a C one, but whichever
> policy we adopt it would be nice to codify it somewhere (apologies if it
> is already and I missed it).

I don't think we have it written down anywhere. I don't think that we
should have a global rule for this. Certain things are more in the
purview of the kernel and others are more on the Rust side.

My opinion is that this, since it will hopefully be in `core` at some
point, should go with the Rust naming.

---
Cheers,
Benno
