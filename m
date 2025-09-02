Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD73B4109E
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 01:12:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFAE10E00A;
	Tue,  2 Sep 2025 23:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bDQTrL7u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176ED10E00A;
 Tue,  2 Sep 2025 23:12:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 990AA60224;
 Tue,  2 Sep 2025 23:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05DDEC4CEED;
 Tue,  2 Sep 2025 23:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756854739;
 bh=nGd6ubL9Tf/e1xXoHEq4QdDtCjYAfInQ7R9+GVfgkr0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bDQTrL7ukZTL5zgkIX5VBewQ0FdZgocbX6GbSmLy/+MdtvPcsEwaOnZStytUVCrML
 7Lrw5b1arUATJvNXgcR4Nvmms0kqYMACqF9yNduS4XCV4BcCj/JtJWZncuHwrIciTy
 oQUtcInfo4Wcf47DtuIMQmm3bDJzkXWhhzXS+vlwJvkhMjuaI3WEdiaF1FD6OByiN+
 hCHucubAA9r8rUX5zM+wfHcQ21+hmhMmtzwugJn9eyII0EA1k/rsjLAnuHuq5+1IIU
 7+Bp1ovO33f4F3vcGVs/36vNBtyowvZl/ZbuU/gEeFMqr5+rTBTb/CkdblfFanZHhJ
 JWofrD5m+pJRg==
Message-ID: <843554b1-f4c5-43f5-a23b-583339708bea@kernel.org>
Date: Wed, 3 Sep 2025 01:12:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/11] gpu: nova-core: move GSP boot code out of `Gpu`
 constructor
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
 <20250902-nova_firmware-v3-2-56854d9c5398@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250902-nova_firmware-v3-2-56854d9c5398@nvidia.com>
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

On 9/2/25 4:31 PM, Alexandre Courbot wrote:
>       pub(crate) fn new(
>           pdev: &pci::Device<device::Bound>,
>           devres_bar: Arc<Devres<Bar0>>,

The diff is hiding it, but with this patch we should also make sure that this 
returns impl PinInit<Self, Error> rather than Result<impl PinInit<Self>.

I think this should be possible now.

> @@ -293,20 +317,15 @@ pub(crate) fn new(
>           )?;
>           gsp_falcon.clear_swgen0_intr(bar);
>   
> -        let _sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, bar, true)?;
> -
> -        let fb_layout = FbLayout::new(spec.chipset, bar)?;
> -        dev_dbg!(pdev.as_ref(), "{:#x?}\n", fb_layout);
> -
> -        let bios = Vbios::new(pdev.as_ref(), bar)?;
> -
> -        Self::run_fwsec_frts(pdev.as_ref(), &gsp_falcon, bar, &bios, &fb_layout)?;
> +        let sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, bar, true)?;
>   
>           Ok(pin_init!(Self {
>               spec,
>               bar: devres_bar,
>               fw,
>               sysmem_flush,
> +            gsp_falcon,
> +            sec2_falcon,
>           }))
>       }
>   }
> 

