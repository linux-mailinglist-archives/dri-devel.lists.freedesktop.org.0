Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76193BB78ED
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 18:34:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C000F10E1DA;
	Fri,  3 Oct 2025 16:34:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ryh7Z5K0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8575910E1DA;
 Fri,  3 Oct 2025 16:34:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 325CA43C9A;
 Fri,  3 Oct 2025 16:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B803BC4CEF5;
 Fri,  3 Oct 2025 16:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759509259;
 bh=ozG5IP2yJLNMxQLolYxbuES4sVM7rtrK+UQzCETiaCs=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=Ryh7Z5K0/iw8iGFMMvEPGqI7LA/C+E7thDMQtF9lNLT47PZSMMukMxGOsDi862J3u
 5ZIM8kv6mMYYbz79NgtbyCb7HpVEF52XyEFBs39+wqM5S/gzNGPnElOn16aZoewC7O
 8d7CK8dFfFn5ZojeqstI7hSswtf2ayOoB9K+TWIX8QkIEvkpUHoaYlXwMi2SRiGHvM
 sIBx7uSI2KlKz1ViBiZv3bit4VDE79UoSFtEqXJwfa1PCQSF80czN7sJlyiDNml5vx
 u0Awg6y7xurEOLHW+IYPasjHpez1v0Jg2nCdL3PDRssCwZ5JlF82WVOPTewgAM/YCV
 QKkLqY9WaO3CQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Oct 2025 18:34:12 +0200
Message-Id: <DD8TZ3TU57L3.2958OTC9UP4VF@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v3 08/13] gpu: nova-core: Add bindings and accessors for
 GspSystemInfo
From: "Benno Lossin" <lossin@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20250930131648.411720-1-apopple@nvidia.com>
 <20250930131648.411720-9-apopple@nvidia.com>
 <DD7VU4239GS2.2MKVFPBFEY1R4@nvidia.com>
In-Reply-To: <DD7VU4239GS2.2MKVFPBFEY1R4@nvidia.com>
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

On Thu Oct 2, 2025 at 3:49 PM CEST, Alexandre Courbot wrote:
> Hi Alistair, (+Benno as this concerns the `init!` macros)
>
> On Tue Sep 30, 2025 at 10:16 PM JST, Alistair Popple wrote:
>> Adds bindings and an in-place initialiser for the GspSystemInfo struct.
>>
>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>>
>> ---
>>
>> It would be good to move to using the `init!` macros at some point, but
>> I couldn't figure out how to make that work to initialise an enum rather
>> than a struct as is required for the transparent representation.
>
> Indeed we have to jump through a few (minor) hoops.
>
> First the `init!` macros do not seem to support tuple structs. They
> match a `{` after the type name, which is not present in
> `GspSystemInfo`. By turning it into a regular struct with a single
> field, we can overcome this, and it doesn't affect the layout the
> `#[repr(transparent)]` can still be used.

Yeah that's the correct workaround at the moment. I'm tracking support
for tuple structs in [1]. Essentially the problem is that it requires
lots of effort to parse tuple structs using declarative macros. We will
get `syn` this cycle, which will enable me to support several things,
including tuple structs.

[1]: https://github.com/Rust-for-Linux/pin-init/issues/85

> Then, due to a limitation with declarative macros, `init!` interprets
> `::` as a separator for generic arguments, so `bindings::GspSystemInfo`
> also doesn't parse. Here the trick is to use a local type alias.

This one will also be solved when we switch to syn.

> After overcoming these two, I have been able to make
> `GspSystemInfo::init` return an in-place initializer. It is then a
> matter of changing `send_gsp_command` to accept it - please apply the
> following patch on top of your series for an illustration of how it can
> be done.
>
> Note that I have added a new generic argument for the error returned by
> the `Init` - this is to let us also use infallible initializers
> transparently. The cool thing is that callers don't need to specify any
> generic argument since they can be inferred automatically.
>
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index 5580eaf52f7b..0709153f9dc9 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -247,12 +247,20 @@ fn notify_gsp(bar: &Bar0) {
>          NV_PGSP_QUEUE_HEAD::default().set_address(0).write(bar);
>      }
>
> -    pub(crate) fn send_gsp_command<M: CommandToGsp>(
> +    pub(crate) fn send_gsp_command<M, E>(
>          &mut self,
>          bar: &Bar0,
>          payload_size: usize,
> -        init: impl FnOnce(&mut M, SBuffer<core::array::IntoIter<&mut [u8=
], 2>>) -> Result,
> -    ) -> Result {
> +        init: impl Init<M, E>,
> +        init_sbuffer: impl FnOnce(SBuffer<core::array::IntoIter<&mut [u8=
], 2>>) -> Result,
> +    ) -> Result
> +    where
> +        M: CommandToGsp,
> +        // This allows all error types, including `Infallible`, to be us=
ed with `init`. Without
> +        // this we cannot use regular stack objects as `init` since thei=
r `Init` implementation
> +        // does not return any error.
> +        Error: From<E>,
> +    {
>          // TODO: a method that extracts the regions for a given command?
>          // ... and another that reduces the region to a given number of =
bytes!
>          let driver_area =3D self.gsp_mem.driver_write_area();
> @@ -264,7 +272,7 @@ pub(crate) fn send_gsp_command<M: CommandToGsp>(
>              return Err(EAGAIN);
>          }
>
> -        let (msg_header, cmd, payload_1, payload_2) =3D {
> +        let (msg_header, cmd_ptr, payload_1, payload_2) =3D {
>              #[allow(clippy::incompatible_msrv)]
>              let (msg_header_slice, slice_1) =3D driver_area
>                  .0
> @@ -272,7 +280,6 @@ pub(crate) fn send_gsp_command<M: CommandToGsp>(
>                  .split_at_mut(size_of::<GspMsgElement>());
>              let msg_header =3D GspMsgElement::from_bytes_mut(msg_header_=
slice).ok_or(EINVAL)?;
>              let (cmd_slice, payload_1) =3D slice_1.split_at_mut(size_of:=
:<M>());
> -            let cmd =3D M::from_bytes_mut(cmd_slice).ok_or(EINVAL)?;
>              #[allow(clippy::incompatible_msrv)]
>              let payload_2 =3D driver_area.1.as_flattened_mut();
>              // TODO: Replace this workaround to cut the payload size.
> @@ -283,11 +290,22 @@ pub(crate) fn send_gsp_command<M: CommandToGsp>(
>                  None =3D> (&mut payload_1[..payload_size], payload_2),
>              };
>
> -            (msg_header, cmd, payload_1, payload_2)
> +            (
> +                msg_header,
> +                cmd_slice.as_mut_ptr().cast(),
> +                payload_1,
> +                payload_2,
> +            )
> +        };
> +
> +        let cmd =3D unsafe {
> +            init.__init(cmd_ptr)?;

This is missing a safety comment. I haven't looked at this locally, so I
don't know what is happening in the 10-20 lines that aren't shown, so I
don't know if this is correct (if you're only assuming its initialized
after this line completes then it's fine). The rest of the patch looks
normal.

Hope this helps!

---
Cheers,
Benno

> +            // Convert the pointer backto a reference for checksum.
> +            &mut *cmd_ptr
>          };
