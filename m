Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F8F969DD2
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 14:40:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C278E10E581;
	Tue,  3 Sep 2024 12:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="MWw6jy7t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A0A10E582
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 12:39:57 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4280ca0791bso45681195e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 05:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725367196; x=1725971996; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eS0iv/n7MbSe6dw0/hr9KhntehZWi/UAfId00tU1FBU=;
 b=MWw6jy7ty8vP7lhfVlUseJu5rbz896iWmgkjF4y1SsC454FkHpewl7IaNZEOyzAqrf
 pmIbtOqqLWrbdSsSpcoSwx9dVq7RBDZverYLwE5btxWLOE7fYR/L/MPgyc82hgJ1WaaQ
 LqLPOuutkd0q/Y8lvvbwDrj+HzLo/tOahsG+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725367196; x=1725971996;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eS0iv/n7MbSe6dw0/hr9KhntehZWi/UAfId00tU1FBU=;
 b=FrY4sUnW4eFOMTHQ7DzDByOZ1V4OJq9lahT+RX+Od7Grpz1cFyktNFeiEMbzCDr+nq
 iq+WdVAWeEHWF8+Y3hLHcUaNOAtre5+0PgnEiJV0J3BtZSDVbtaV4407jFMofW/s53fk
 PdMO/nnxebzXFNJ36LJEnD/ojlVXm4vhHkWT4lyA74N8QBH8XXlVr+iZFhSRAL7GlzPV
 tm45fXiUbgNnpELEhDQ4/I2G7GrDXzqLYu3Mx9jA1LfCgYSiYOdKaZmMbzUz+xeb4GYY
 azbIiwL0gzju2c+fk2zpTzQAZjkeDkxdaMKiqehZzKtBw7TFcW9OqK5+fS7C9skUXjtE
 xaOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVguZ/xlL5kfOUzPsvAUM2tAgPFMJhYX4kb8E6H8N6dMFXVhHdbuBE2RoZkN29ZnWBojFNTPVLFWu8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjQ5LwKDJa4SR7OQ8mxCDK7ZKc6eKnK8WPjc/TEbSzZl0tjnHH
 nIBXd2YQiL7e7kWw+QV74aMZ1Gtai8enO7pWT+qrBwH++fQd9r4lIalsKkNacBU=
X-Google-Smtp-Source: AGHT+IHNhD+r/CPo523w/8HFM2TuVsrQ7AuT5zWQJdKE4RvYIw+abb1WIkixGF9ybaxSUJ7T3j7prg==
X-Received: by 2002:a05:600c:3150:b0:426:6eae:6596 with SMTP id
 5b1f17b1804b1-42c8de9dd30mr4970165e9.25.1725367195774; 
 Tue, 03 Sep 2024 05:39:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ba63abea3sm208229195e9.28.2024.09.03.05.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:39:55 -0700 (PDT)
Date: Tue, 3 Sep 2024 14:39:52 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Danilo Krummrich <dakr@redhat.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, lina@asahilina.net, pstanner@redhat.com,
 ajanulgu@redhat.com, lyude@redhat.com, gregkh@linuxfoundation.org,
 robh@kernel.org, daniel.almeida@collabora.com,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 3/8] rust: drm: add driver abstractions
Message-ID: <ZtcDmPf9Zr9wPcjo@phenom.ffwll.local>
References: <20240618233324.14217-1-dakr@redhat.com>
 <20240618233324.14217-4-dakr@redhat.com>
 <ZtXn0hesji0s_45x@phenom.ffwll.local> <Ztbu-wUkH0l3nbUm@pollux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ztbu-wUkH0l3nbUm@pollux>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Tue, Sep 03, 2024 at 01:11:55PM +0200, Danilo Krummrich wrote:
> On Mon, Sep 02, 2024 at 06:29:06PM +0200, Daniel Vetter wrote:
> > On Wed, Jun 19, 2024 at 01:31:39AM +0200, Danilo Krummrich wrote:
> > > Implement the DRM driver abstractions.
> > > 
> > > The `Driver` trait provides the interface to the actual driver to fill
> > > in the driver specific data, such as the `DriverInfo`, driver features
> > > and IOCTLs.
> > > 
> > > Co-developed-by: Asahi Lina <lina@asahilina.net>
> > > Signed-off-by: Asahi Lina <lina@asahilina.net>
> > > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > > ---
> > >  rust/bindings/bindings_helper.h |   1 +
> > >  rust/kernel/drm/drv.rs          | 141 ++++++++++++++++++++++++++++++++
> > >  rust/kernel/drm/mod.rs          |   1 +
> > >  3 files changed, 143 insertions(+)
> > >  create mode 100644 rust/kernel/drm/drv.rs
> > > 
> > > diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> > > index ed25b686748e..dc19cb789536 100644
> > > --- a/rust/bindings/bindings_helper.h
> > > +++ b/rust/bindings/bindings_helper.h
> > > @@ -6,6 +6,7 @@
> > >   * Sorted alphabetically.
> > >   */
> > >  
> > > +#include <drm/drm_drv.h>
> > >  #include <drm/drm_ioctl.h>
> > >  #include <kunit/test.h>
> > >  #include <linux/errname.h>
> > > diff --git a/rust/kernel/drm/drv.rs b/rust/kernel/drm/drv.rs
> > > new file mode 100644
> > > index 000000000000..cd594a32f9e4
> > > --- /dev/null
> > > +++ b/rust/kernel/drm/drv.rs
> > > @@ -0,0 +1,141 @@
> > > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > > +
> > > +//! DRM driver core.
> > > +//!
> > > +//! C header: [`include/linux/drm/drm_drv.h`](srctree/include/linux/drm/drm_drv.h)
> > > +
> > > +use crate::{bindings, drm, private::Sealed, str::CStr, types::ForeignOwnable};
> > > +use macros::vtable;
> > > +
> > > +/// Driver use the GEM memory manager. This should be set for all modern drivers.
> > > +pub const FEAT_GEM: u32 = bindings::drm_driver_feature_DRIVER_GEM;
> > > +/// Driver supports mode setting interfaces (KMS).
> > > +pub const FEAT_MODESET: u32 = bindings::drm_driver_feature_DRIVER_MODESET;
> > > +/// Driver supports dedicated render nodes.
> > > +pub const FEAT_RENDER: u32 = bindings::drm_driver_feature_DRIVER_RENDER;
> > > +/// Driver supports the full atomic modesetting userspace API.
> > > +///
> > > +/// Drivers which only use atomic internally, but do not support the full userspace API (e.g. not
> > > +/// all properties converted to atomic, or multi-plane updates are not guaranteed to be tear-free)
> > > +/// should not set this flag.
> > > +pub const FEAT_ATOMIC: u32 = bindings::drm_driver_feature_DRIVER_ATOMIC;
> > > +/// Driver supports DRM sync objects for explicit synchronization of command submission.
> > > +pub const FEAT_SYNCOBJ: u32 = bindings::drm_driver_feature_DRIVER_SYNCOBJ;
> > > +/// Driver supports the timeline flavor of DRM sync objects for explicit synchronization of command
> > > +/// submission.
> > > +pub const FEAT_SYNCOBJ_TIMELINE: u32 = bindings::drm_driver_feature_DRIVER_SYNCOBJ_TIMELINE;
> > > +/// Driver supports compute acceleration devices. This flag is mutually exclusive with `FEAT_RENDER`
> > > +/// and `FEAT_MODESET`. Devices that support both graphics and compute acceleration should be
> > > +/// handled by two drivers that are connected using auxiliary bus.
> > > +pub const FEAT_COMPUTE_ACCEL: u32 = bindings::drm_driver_feature_DRIVER_COMPUTE_ACCEL;
> > > +/// Driver supports user defined GPU VA bindings for GEM objects.
> > > +pub const FEAT_GEM_GPUVA: u32 = bindings::drm_driver_feature_DRIVER_GEM_GPUVA;
> > > +/// Driver supports and requires cursor hotspot information in the cursor plane (e.g. cursor plane
> > > +/// has to actually track the mouse cursor and the clients are required to set hotspot in order for
> > > +/// the cursor planes to work correctly).
> > > +pub const FEAT_CURSOR_HOTSPOT: u32 = bindings::drm_driver_feature_DRIVER_CURSOR_HOTSPOT;
> > > +
> > > +/// Information data for a DRM Driver.
> > > +pub struct DriverInfo {
> > > +    /// Driver major version.
> > > +    pub major: i32,
> > > +    /// Driver minor version.
> > > +    pub minor: i32,
> > > +    /// Driver patchlevel version.
> > > +    pub patchlevel: i32,
> > > +    /// Driver name.
> > > +    pub name: &'static CStr,
> > > +    /// Driver description.
> > > +    pub desc: &'static CStr,
> > > +    /// Driver date.
> > > +    pub date: &'static CStr,
> > > +}
> > > +
> > > +/// Internal memory management operation set, normally created by memory managers (e.g. GEM).
> > > +///
> > > +/// See `kernel::drm::gem` and `kernel::drm::gem::shmem`.
> > > +pub struct AllocOps {
> > > +    pub(crate) gem_create_object: Option<
> > > +        unsafe extern "C" fn(
> > > +            dev: *mut bindings::drm_device,
> > > +            size: usize,
> > > +        ) -> *mut bindings::drm_gem_object,
> > > +    >,
> > > +    pub(crate) prime_handle_to_fd: Option<
> > > +        unsafe extern "C" fn(
> > > +            dev: *mut bindings::drm_device,
> > > +            file_priv: *mut bindings::drm_file,
> > > +            handle: u32,
> > > +            flags: u32,
> > > +            prime_fd: *mut core::ffi::c_int,
> > > +        ) -> core::ffi::c_int,
> > > +    >,
> > > +    pub(crate) prime_fd_to_handle: Option<
> > > +        unsafe extern "C" fn(
> > > +            dev: *mut bindings::drm_device,
> > > +            file_priv: *mut bindings::drm_file,
> > > +            prime_fd: core::ffi::c_int,
> > > +            handle: *mut u32,
> > > +        ) -> core::ffi::c_int,
> > > +    >,
> > > +    pub(crate) gem_prime_import: Option<
> > > +        unsafe extern "C" fn(
> > > +            dev: *mut bindings::drm_device,
> > > +            dma_buf: *mut bindings::dma_buf,
> > > +        ) -> *mut bindings::drm_gem_object,
> > > +    >,
> > > +    pub(crate) gem_prime_import_sg_table: Option<
> > > +        unsafe extern "C" fn(
> > > +            dev: *mut bindings::drm_device,
> > > +            attach: *mut bindings::dma_buf_attachment,
> > > +            sgt: *mut bindings::sg_table,
> > > +        ) -> *mut bindings::drm_gem_object,
> > > +    >,
> > > +    pub(crate) dumb_create: Option<
> > > +        unsafe extern "C" fn(
> > > +            file_priv: *mut bindings::drm_file,
> > > +            dev: *mut bindings::drm_device,
> > > +            args: *mut bindings::drm_mode_create_dumb,
> > > +        ) -> core::ffi::c_int,
> > > +    >,
> > > +    pub(crate) dumb_map_offset: Option<
> > > +        unsafe extern "C" fn(
> > > +            file_priv: *mut bindings::drm_file,
> > > +            dev: *mut bindings::drm_device,
> > > +            handle: u32,
> > > +            offset: *mut u64,
> > > +        ) -> core::ffi::c_int,
> > > +    >,
> > > +}
> > > +
> > > +/// Trait for memory manager implementations. Implemented internally.
> > > +pub trait AllocImpl: Sealed {
> > > +    /// The C callback operations for this memory manager.
> > > +    const ALLOC_OPS: AllocOps;
> > > +}
> > > +
> > > +/// The DRM `Driver` trait.
> > > +///
> > > +/// This trait must be implemented by drivers in order to create a `struct drm_device` and `struct
> > > +/// drm_driver` to be registered in the DRM subsystem.
> > > +#[vtable]
> > > +pub trait Driver {
> > > +    /// Context data associated with the DRM driver
> > > +    ///
> > > +    /// Determines the type of the context data passed to each of the methods of the trait.
> > > +    type Data: ForeignOwnable + Sync + Send;
> > > +
> > > +    /// The type used to manage memory for this driver.
> > > +    ///
> > > +    /// Should be either `drm::gem::Object<T>` or `drm::gem::shmem::Object<T>`.
> > > +    type Object: AllocImpl;
> > 
> > Bit similar comment to what I discussed at length with lyude, drivers
> > might have a need for different implementations. But I think from the kms
> > discussions we have solid solution for that, so I think we should be fine.
> > 
> > > +
> > > +    /// Driver metadata
> > > +    const INFO: DriverInfo;
> > > +
> > > +    /// Feature flags
> > > +    const FEATURES: u32;
> > 
> > I think there's a type safety issue here with allowing drivers to muck
> > with these directly. Example:
> > 
> > - If you don't set FEAT_GEM but try to use gem C functions, stuff blows up
> >   because the core doesn't call drm_gem_init() in that case.
> 
> Indeed. Ideally, we'd want the feature flags to be automatically set, when a
> corresponding implementation is provided by the driver.
> 
> For now, as you say, GEM can just be mandatory I think.
> 
> > 
> > - For modesetting it's more fun because there mandatory init functions are
> >   meant to be called by the driver, in the right sequence, interleaved
> >   with other driver setup code for all the right modeset objects. If you
> >   get it wrong you go boom.
> 
> My proposal was to just have another associated `Kms` type for `Driver` that
> provides the corresponding callbacks for initialization. KMS initialization
> functions could then be exposed only through those callbacks, such that they
> can't be called after registration.

Hm yeah I guess callbacks works too. No idea whether that's the rust way
or not though, at least on the C side callbacks for init are kinda
midlayer smell and tend to be in the way.
-Sima

> 
> > 
> > For the modeset side of things I've dumped a pile of comments on lyude's
> > patches already: Essentially during registration I think we need a special
> > drmKmsDriverInit object or phantom type or so, so that you can proof
> > you're registering kms objects at the right time, with the rust
> > abstraction calling all the other functions around that in the right
> > order.
> > 
> > For gem I think we should flat out not allow non-gem drivers in rust. At
> > least until someone comes up with a need for a non-gem driver.
> > 
> > For some of the values like hotspot cursor support we might need to change
> > the rust abstraction to compute these at runtime driver init, and then set
> > them somewhere in the runtime data structure instead of having them
> > statically sepcified in drm_driver->features.
> > 
> > In general these feature flag are midlayer design and that tends to be
> > bad, rust is just the messenger here.
> > 
> > Cheers, Sima
> > 
> > 
> > > +
> > > +    /// IOCTL list. See `kernel::drm::ioctl::declare_drm_ioctls!{}`.
> > > +    const IOCTLS: &'static [drm::ioctl::DrmIoctlDescriptor];
> > > +}
> > > diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
> > > index 9ec6d7cbcaf3..d987c56b3cec 100644
> > > --- a/rust/kernel/drm/mod.rs
> > > +++ b/rust/kernel/drm/mod.rs
> > > @@ -2,4 +2,5 @@
> > >  
> > >  //! DRM subsystem abstractions.
> > >  
> > > +pub mod drv;
> > >  pub mod ioctl;
> > > -- 
> > > 2.45.1
> > > 
> > 
> > -- 
> > Simona Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> > 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
