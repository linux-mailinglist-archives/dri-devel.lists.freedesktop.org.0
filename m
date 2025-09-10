Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B03B3B5105F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 10:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E681710E897;
	Wed, 10 Sep 2025 08:01:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="O9hu+wut";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6209F10E891;
 Wed, 10 Sep 2025 08:01:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1AA05447F4;
 Wed, 10 Sep 2025 08:01:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E1DC4CEF5;
 Wed, 10 Sep 2025 08:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757491288;
 bh=W9AyICeigCjB4ZfW6Mn13qQroeZohBNvhnwa50EVj9s=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=O9hu+wutcuu/Q7972UJxuki8Y3HF4ragOWc7XGwFauq0XvJt5T/41JaU7f3ND83lO
 EVRVi9iOwSjLuwb6kX7NPM10qUQFLq0OnnSD35bMP+nXottJf4RDXgzxBESv7bUZgT
 AlwjvU4+dydveIghjt8smeGX8GqNRzYAUopY6BXbQhfZayr5d3hdU3NAFcOYyTvWXN
 xgIA1u/iIR0GClqtjHMuVTVU/y7N3th6G6/NoazYd+uoYfiOvKtQYu0xxxtCqQKtUP
 UoLc3sdaX9535hMlddg5lLAjLv8Z2XnGYx2dM73rzI8s74z9PjMVhTevClGKq8Lgcq
 VZ5K6xEMCyIrg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Sep 2025 10:01:22 +0200
Message-Id: <DCOYNWXYKBOK.XCRA4Z34RUXP@kernel.org>
Subject: Re: [PATCH v3 02/11] gpu: nova-core: move GSP boot code out of
 `Gpu` constructor
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
 <20250902-nova_firmware-v3-2-56854d9c5398@nvidia.com>
 <843554b1-f4c5-43f5-a23b-583339708bea@kernel.org>
 <DCIZ79KKSSF1.25NJT5ZWR3OOS@nvidia.com>
 <DCJ0UA7KM9AP.OGO7EJB4ORQP@kernel.org>
 <DCOBWF0EZLHF.3FFVAB16SJ3FW@nvidia.com>
 <DCOCL398HXDH.3QH9U6UGGIUP1@kernel.org>
 <DCOUK0Z4YV6M.2R0CFE57DY5CR@nvidia.com>
In-Reply-To: <DCOUK0Z4YV6M.2R0CFE57DY5CR@nvidia.com>
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

On Wed Sep 10, 2025 at 6:48 AM CEST, Alexandre Courbot wrote:
> On Tue Sep 9, 2025 at 11:43 PM JST, Danilo Krummrich wrote:
>> 	impl Gpu {
>> 	    pub(crate) fn new<'a>(
>> 	        dev: &'a Device<Bound>,
>> 	        bar: &'a Bar0
>> 	        devres_bar: Arc<Devres<Bar0>>,
>> 	    ) -> impl PinInit<Self, Error> + 'a {
>> 	        try_pin_init(Self {
>> 	            bar: devres_bar,
>> 	            spec: Spec::new(bar)?,
>> 	            gsp_falcon: Falcon::<Gsp>::new(dev, spec.chipset)?,
>> 	            sec2_falcon: Falcon::<Sec2>::new(dev, spec.chipset)?,
>> 	            sysmem_flush: SysmemFlush::register(dev, bar, spec.chipset)=
?
>> 	            gsp <- Gsp::new(gsp_falcon, sec2_falcon, sysmem_flush)?,
>> 	        })
>> 	    }
>> 	}
>
> It does work. The bizareness of passing the `bar` twice aside,

Yeah, but it really seems like a minor inconvinience. (Especially, since th=
is
will be the only occurance of this we'll ever have.)

> here is what it looks like when I got it to compile:

This looks great!

>     pub(crate) fn new<'a>(
>         pdev: &'a pci::Device<device::Bound>,
>         devres_bar: Arc<Devres<Bar0>>,
>         bar: &'a Bar0,
>     ) -> impl PinInit<Self, Error> + 'a {
>         try_pin_init!(Self {
>             spec: Spec::new(bar).inspect(|spec| {
>                 dev_info!(
>                     pdev.as_ref(),
>                     "NVIDIA (Chipset: {}, Architecture: {:?}, Revision: {=
})\n",
>                     spec.chipset,
>                     spec.chipset.arch(),
>                     spec.revision
>                 );
>             })?,

+             _: {
+                 gfw::wait_gfw_boot_completion(bar)
+                     .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot di=
d not complete"))?;
+             },
>
>             sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, spec.=
chipset)?,
>
>             gsp_falcon: Falcon::<Gsp>::new(
>                 pdev.as_ref(),
>                 spec.chipset,
>                 bar,
>                 spec.chipset > Chipset::GA100,
>             )
>             .inspect(|falcon| falcon.clear_swgen0_intr(bar))?,
>
>             sec2_falcon: Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset,=
 bar, true)?,
>
-             gsp: Self::start_gsp(pdev, bar, spec.chipset, gsp_falcon, sec=
2_falcon)?,
+             gsp <- Self::start_gsp(pdev, bar, spec.chipset, gsp_falcon, s=
ec2_falcon),
>
>             bar: devres_bar,
>         })
>     }
>
> The wait for GFW initialization had to be moved to `probe`, but that's
> fine IMO.

That's not necessary, you can keep it in Gpu::new() -- I don't see what's
preventing us from that. I inserted it in the code above.

> I do however find the code less readable in this form, less
> editable as well. And LSP seems lost, so I don't get any syntax
> highlighting in the `try_pin_init` block.

Benno is working on a syntax update, so automatic formatting etc. will prop=
erly
work.

Otherwise, I can't see how this is a downgrade. It represents the initializ=
ation
process in a much clearer way that the current implementation of Gsp::new()=
,
which is rather messy.

> Fundamentally, this changes the method from a fallible method returning
> a non-fallible initializer into a non-fallible method returning a
> fallible initializer.

Yeah, that's the best case when working with pin-init.

> I'm ok with that, and maybe this new form will
> encourage us to keep this method short, which is what we want, but other
> than that what benefit are we getting from this change?

The immediate benefit is that we don't need an extra allocation for the Gsp
structure.

The general benefit is that once we need to add more fields to
structures that require pinning (such as locks -- and we will need a lot of
them) we're prepared for it.

If we're not prepared for it, I'm pretty sure that everytime someone needs =
to
add e.g. a new lock for something, it will just result in a new Pin<KBox<T>=
>,
because the initial pin-init hierarchy just isn't there, and creating a new
allocation is more convinient than fixing the existing code.

This is exactly what pin-init was introduced for in the kernel, such that w=
e're
not doing worse than equivalent C code.

	struct Foo {
	   struct Bar bar;
	   void *data;
	   struct mutex data_lock;
	}

	struct Bar {
	   void *data;
	   struct mutex data_lock;
	}

In C you can just kmalloc(sizeof(Foo), GFP_KERNEL) and subsequently initial=
ize
all fields.

In Rust I don't want to fall back having to allocate for Bar *and* for Foo
separately.

If there are things to improve with pin-init, let's improve them, but let's=
 not
do worse than C code in this aspect.
