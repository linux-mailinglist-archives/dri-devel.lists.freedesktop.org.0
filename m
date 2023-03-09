Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEC26B3043
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 23:16:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D097D10E192;
	Thu,  9 Mar 2023 22:16:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677B610E192
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 22:16:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id DDF1D41F78;
 Thu,  9 Mar 2023 22:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1678400169;
 bh=D1LBihcahwMJoH7Mv24Wzh3mf7BDUXSsboyOvAfYaZk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=U5rPGqbILUs4xYVED2L7GdrO+8UP20HQL9gdc36q9Zw4lQhe0WTvNszEc8uxBL+uK
 Yq13WY5Gzi3Z0Qbw6qhzERIafjZ4EPaPIHEYT5LOqPxdOoUSa/mKSCksQRDWW9eH28
 q3G50GSmBZuajODKbXgwIH8GZr50QobhNGrz96dfcWKeS+kb6gFtan1f6CBsn2aCes
 dFSl4x03PUZHGOTH1E+YbW2Xc3Fs7TtEt9MxAtwjo+fhkr9xObiW+sxkHYggyeSk1H
 y6FtCSkfWUzczON4HYoFpJbiYP/fW8/xNX0iRt7JcRkQeHqKZj4jjewRbj8LG1JHJU
 8IY/Wq1OE68Mg==
Message-ID: <28fa3f97-4c7c-212e-2be2-fb1c05f7f576@asahilina.net>
Date: Fri, 10 Mar 2023 07:16:00 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH RFC 03/18] rust: drm: file: Add File abstraction
Content-Language: en-US
To: Faith Ekstrand <faith.ekstrand@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-3-917ff5bc80a8@asahilina.net>
 <9ba89e97155400fb379f5101ccb8960d0bcbc025.camel@collabora.com>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <9ba89e97155400fb379f5101ccb8960d0bcbc025.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mary <mary@mary.zone>, asahi@lists.linux.dev,
 linux-sgx@vger.kernel.org, Ella Stanforth <ella@iglunix.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/03/2023 06.16, Faith Ekstrand wrote:
> On Tue, 2023-03-07 at 23:25 +0900, Asahi Lina wrote:
>> A DRM File is the DRM counterpart to a kernel file structure,
>> representing an open DRM file descriptor. Add a Rust abstraction to
>> allow drivers to implement their own File types that implement the
>> DriverFile trait.
>>
>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>> ---
>>  rust/bindings/bindings_helper.h |   1 +
>>  rust/kernel/drm/drv.rs          |   7 ++-
>>  rust/kernel/drm/file.rs         | 113
>> ++++++++++++++++++++++++++++++++++++++++
>>  rust/kernel/drm/mod.rs          |   1 +
>>  4 files changed, 120 insertions(+), 2 deletions(-)
>>
>> diff --git a/rust/bindings/bindings_helper.h
>> b/rust/bindings/bindings_helper.h
>> index 2a999138c4ae..7d7828faf89c 100644
>> --- a/rust/bindings/bindings_helper.h
>> +++ b/rust/bindings/bindings_helper.h
>> @@ -8,6 +8,7 @@
>>  
>>  #include <drm/drm_device.h>
>>  #include <drm/drm_drv.h>
>> +#include <drm/drm_file.h>
>>  #include <drm/drm_ioctl.h>
>>  #include <linux/delay.h>
>>  #include <linux/device.h>
>> diff --git a/rust/kernel/drm/drv.rs b/rust/kernel/drm/drv.rs
>> index 29a465515dc9..1dcb651e1417 100644
>> --- a/rust/kernel/drm/drv.rs
>> +++ b/rust/kernel/drm/drv.rs
>> @@ -144,6 +144,9 @@ pub trait Driver {
>>      /// Should be either `drm::gem::Object<T>` or
>> `drm::gem::shmem::Object<T>`.
>>      type Object: AllocImpl;
>>  
>> +    /// The type used to represent a DRM File (client)
>> +    type File: drm::file::DriverFile;
>> +
>>      /// Driver metadata
>>      const INFO: DriverInfo;
>>  
>> @@ -213,8 +216,8 @@ macro_rules! drm_device_register {
>>  impl<T: Driver> Registration<T> {
>>      const VTABLE: bindings::drm_driver = drm_legacy_fields! {
>>          load: None,
>> -        open: None, // TODO: File abstraction
>> -        postclose: None, // TODO: File abstraction
>> +        open: Some(drm::file::open_callback::<T::File>),
>> +        postclose: Some(drm::file::postclose_callback::<T::File>),
>>          lastclose: None,
>>          unload: None,
>>          release: None,
>> diff --git a/rust/kernel/drm/file.rs b/rust/kernel/drm/file.rs
>> new file mode 100644
>> index 000000000000..48751e93c38a
>> --- /dev/null
>> +++ b/rust/kernel/drm/file.rs
>> @@ -0,0 +1,113 @@
>> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>> +
>> +//! DRM File objects.
>> +//!
>> +//! C header:
>> [`include/linux/drm/drm_file.h`](../../../../include/linux/drm/drm_fi
>> le.h)
>> +
>> +use crate::{bindings, drm, error::Result};
>> +use alloc::boxed::Box;
>> +use core::marker::PhantomData;
>> +use core::ops::Deref;
>> +
>> +/// Trait that must be implemented by DRM drivers to represent a DRM
>> File (a client instance).
>> +pub trait DriverFile {
>> +    /// The parent `Driver` implementation for this `DriverFile`.
>> +    type Driver: drm::drv::Driver;
>> +
>> +    /// Open a new file (called when a client opens the DRM device).
>> +    fn open(device: &drm::device::Device<Self::Driver>) ->
>> Result<Box<Self>>;
>> +}
>> +
>> +/// An open DRM File.
>> +///
>> +/// # Invariants
>> +/// `raw` is a valid pointer to a `drm_file` struct.
>> +#[repr(transparent)]
>> +pub struct File<T: DriverFile> {
>> +    raw: *mut bindings::drm_file,
>> +    _p: PhantomData<T>,
>> +}
>> +
>> +pub(super) unsafe extern "C" fn open_callback<T: DriverFile>(
>> +    raw_dev: *mut bindings::drm_device,
>> +    raw_file: *mut bindings::drm_file,
>> +) -> core::ffi::c_int {
>> +    let drm = core::mem::ManuallyDrop::new(unsafe {
>> drm::device::Device::from_raw(raw_dev) });
> 
> Maybe you can help educate me a bit here... This feels like a really
> sketchy pattern.  We're creating a Device from a pointer, an operation
> which inherently consumes a reference but then marking it ManuallyDrop
> so drm_device_put() never gets called.  It took me a while but I think
> I figured out what you're trying to do: Make it so all the Rust stuff
> works with Device, not drm_device but it still feels really wrong.  It
> works, it just feels like there's a lot of unsafe abstraction juggling
> happening here and I expect this operation is going to be pretty common
> in the Rust abstraction layer.

So I think this is going to be a pretty common pattern in this kind of
abstraction. The problem is that, of course, in C there is no
distinction between an owned reference and a borrowed one. Here we have
a borrowed reference to a struct drm_device, and we need to turn it into
a &Device (which is the Rust equivalent type). But for &Device to exist
we need a Device to exist in the first place, and Device normally
implies ownership of the underlying drm_device.

We could just acquire a reference here, but then we're needlessly
grabbing a ref only to drop it at the end of the function, which is
pointless when the caller is holding another reference for us while the
callback runs. And of course Rust likes to claim to offer zero-cost
abstractions, so it would be kind of sad to have to do that... ^^

Just doing drm::device::Device::from_raw(raw_dev) is a ticking time
bomb, because we haven't acquired a reference (which would normally be
required). If that Device ever gets dropped, we've messed up the
refcounting and stolen the caller's reference. We could try to ensure it
gets passed to core::mem::forget in all paths out, but that gets
error-prone very quickly when trying to cover error paths. So instead,
we put it into a ManuallyDrop. That takes care of neutering the ref
drop, so we don't have to worry about messing that up. Then the only
remaining safety requirement is that that the ManuallyDrop<Device> never
escape the callback function, and that's easy to ensure: we only pass a
&ref to the user (which via auto-deref ends up being a &Device), and
then nothing bad can happen. If the user wants an owned reference to the
device to keep around, they can call .clone() on it and that's when the
incref happens.

Basically, ManuallyDrop<T> where T is a reference counted type
represents a borrowed reference to a T coming from the C side. You can
see another use of this pattern in gem::Object, which contains a
ManuallyDrop<Device> that represents a borrowed reference to the device
that owns that object. The DRM core (as far as I know!) guarantees that
DRM devices outlive all of their GEM objects, so we can materialize a
borrowed reference and as long as it never leaves the GEM object, it
will be sound. Then we can take &Device references from it whenever we
want, and the usual Rust borrow checker rules ensure we can't do
something illegal.

~~ Lina
