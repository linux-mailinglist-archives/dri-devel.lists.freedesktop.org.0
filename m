Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1883B17F49
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 11:29:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 388D910E823;
	Fri,  1 Aug 2025 09:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="H5dG8ece";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 150A910E823
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 09:29:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 955A15C5B0A;
 Fri,  1 Aug 2025 09:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62323C4CEFA;
 Fri,  1 Aug 2025 09:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754040569;
 bh=HPm7wlapPqm5H7eBpBTDi4AZ0hBpZF6wkehy1TBMT/0=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=H5dG8eceEqM4wpngnPRkaRwPCutBjWFde5nGd0Fu0R3yXClBPlVge7Qsf+/x/hDdP
 NFp0N9kCV1YhJ5/CxughqloDBE6R/9cXrdA1YKx24Q5RCeY2Y+hN9DUpF9B8A1rgLI
 OkI4QXz6J2uw0MnU0pCKtBjol4x2eH8WByITbSIuJqtK8xjhu5r688nTUFwfsQmvCg
 LsdOz1oojv7oeDj0pTMR9SHPNsUqac86xa5Ohmcf67ESHi14DfP1qzpbEJVl/LHF21
 Jkoov4jdMg5mKI/mQjdATEMNcZufp0q1sZiTdX5cgnLc3/s7F3QeoJd4iij2cYMPCh
 X4XD/W/XvLurQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 Aug 2025 11:29:23 +0200
Message-Id: <DBQZHIS4VQBN.WSKBML2WYQE@kernel.org>
Subject: Re: [PATCH 2/4] rust: drm: ensure kmalloc() compatible Layout
Cc: <lorenzo.stoakes@oracle.com>, <vbabka@suse.cz>,
 <Liam.Howlett@oracle.com>, <urezki@gmail.com>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250731154919.4132-1-dakr@kernel.org>
 <20250731154919.4132-3-dakr@kernel.org> <aIyGdr8vKV4XE6Io@google.com>
In-Reply-To: <aIyGdr8vKV4XE6Io@google.com>
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

On Fri Aug 1, 2025 at 11:18 AM CEST, Alice Ryhl wrote:
> On Thu, Jul 31, 2025 at 05:48:07PM +0200, Danilo Krummrich wrote:
>> drm::Device is allocated through __drm_dev_alloc() (which uses
>> kmalloc()) and the driver private data, <T as drm::Driver>::Data, is
>> initialized in-place.
>>=20
>> Due to the order of fields in drm::Device
>>=20
>>   pub struct Device<T: drm::Driver> {
>>      dev: Opaque<bindings::drm_device>,
>>      data: T::Data,
>>   }
>
> I'm not convinced this patch is right.
>
> Imagine this scenario: T::Data has size and alignment both equal to 16,
> and lets say that drm_device has a size that is a multiple of 8 but not
> 16 such as 72. In that case, you will allocate 72+16=3D88 bytes for
> Device, but actually the size of Device is 96 because there is 8 bytes
> of padding between dev and data.

Are you saying that there is an issue with

  (1) the existing implementation with uses mem::size_of::<Self>() or

  (2) the proper one that uses Kmalloc::aligned_layout(Layout::new::<Self>(=
))?

I think neither has, because we're not allocating
size_of::<Opaque<bindings::drm_device>>() + size_of::<T::Data>() as you see=
m to
assume above, but size_of::<Device<T>>().

>> even with an arbitrary large alignment requirement of T::Data it can't
>> happen that the size of Device is smaller than its alignment requirement=
.
>>=20
>> However, let's not rely on this subtle circumstance and create a proper
>> kmalloc() compatible Layout.
>>=20
>> Fixes: 1e4b8896c0f3 ("rust: drm: add device abstraction")
>> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>> ---
>>  rust/kernel/drm/device.rs | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
>> index 3bb7c83966cf..d19410deaf6c 100644
>> --- a/rust/kernel/drm/device.rs
>> +++ b/rust/kernel/drm/device.rs
>> @@ -5,6 +5,7 @@
>>  //! C header: [`include/linux/drm/drm_device.h`](srctree/include/linux/=
drm/drm_device.h)
>> =20
>>  use crate::{
>> +    alloc::allocator::Kmalloc,
>>      bindings, device, drm,
>>      drm::driver::AllocImpl,
>>      error::from_err_ptr,
>> @@ -12,7 +13,7 @@
>>      prelude::*,
>>      types::{ARef, AlwaysRefCounted, Opaque},
>>  };
>> -use core::{mem, ops::Deref, ptr, ptr::NonNull};
>> +use core::{alloc::Layout, mem, ops::Deref, ptr, ptr::NonNull};
>> =20
>>  #[cfg(CONFIG_DRM_LEGACY)]
>>  macro_rules! drm_legacy_fields {
>> @@ -96,6 +97,10 @@ impl<T: drm::Driver> Device<T> {
>> =20
>>      /// Create a new `drm::Device` for a `drm::Driver`.
>>      pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>=
) -> Result<ARef<Self>> {
>> +        // `__drm_dev_alloc` uses `kmalloc()` to allocate memory, hence=
 ensure a `kmalloc()`
>> +        // compatible `Layout`.
>> +        let layout =3D Kmalloc::aligned_layout(Layout::new::<Self>());
>> +
>>          // SAFETY:
>>          // - `VTABLE`, as a `const` is pinned to the read-only section =
of the compilation,
>>          // - `dev` is valid by its type invarants,
>> @@ -103,7 +108,7 @@ pub fn new(dev: &device::Device, data: impl PinInit<=
T::Data, Error>) -> Result<A
>>              bindings::__drm_dev_alloc(
>>                  dev.as_raw(),
>>                  &Self::VTABLE,
>> -                mem::size_of::<Self>(),
>> +                layout.size(),
>>                  mem::offset_of!(Self, dev),
>>              )
>>          }
>> --=20
>> 2.50.0
>>=20

