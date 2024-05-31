Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E66F8D5F24
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 12:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0A510E690;
	Fri, 31 May 2024 10:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Ky/jciqU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9792010E690
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 10:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717149599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z2ekAT+HdylEYfyDggX/JisTQjbKg/RFJZ73WI20cAQ=;
 b=Ky/jciqUDYXnNl+8ll59u08xbRwLf1jhC997LvHKjs2sRIIZU6rugGG2hyY7iM/qWlaATp
 eDJtBfTAP0kxHdudHp89FLANxlFBSJmRaPVP3N888H/Vsm61GHt5MW/A60DUX38jniI5/w
 vk/KPu3VU+h935UZ9aEq8qbBBoYOMl8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-88bowsg5OAajtR1aDbi_8g-1; Fri, 31 May 2024 05:59:58 -0400
X-MC-Unique: 88bowsg5OAajtR1aDbi_8g-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4212a921370so9001205e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 02:59:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717149592; x=1717754392;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z2ekAT+HdylEYfyDggX/JisTQjbKg/RFJZ73WI20cAQ=;
 b=GnzYuZmkIP0TrLZOg1uImTBuraIMwb/24v2qnsfD/ruCOf6qJGfm1DF6edeVW0NOWO
 //J45ehC4jA6RXAiyNOXI6Rl0gyoN3xJbdZ/98UPxwYLqvynfZlnkbGEcJ+9+bq3S3Xe
 N1pFHMerNg9CQ98JVkIMih61rDGxmK4bkZE5hKDxQbzxLD530qlmLaLSX0YwDyOTWizu
 xnQdjeKDS7qyRpN9ICvhwpIpcND+EdSXo+jFAV6oPdd8qR1fycoLHAc/nEJ41POPhhwB
 5t6NUynseLwN9r+K00vv0J11925eHP8ZwHtt/qNkOfI0MeDjieSAUqvyX88KW4X+Wq/Y
 4ikA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0bSD3K2eKTxI2sHrULATlv0j+Y7dcVq10AiTCsbEOdy3a8wAXrtdWUV4mUR7bQAydlmbUXiv+TccVPO+Nge2/sQWwkwLe3UqHpJNg0m1y
X-Gm-Message-State: AOJu0YwVORjB0dYfDJ+bjZE1fQDxKByGPUvUYJ+X41ZHU+vL7T7wI1+r
 ciQij7xO6i0oxeRmvLZV5CQoS7IHzU0Ou/NrlD88tjb1gCgg+jdfKOqOmTL0PmsaS7FvR3Bqy8M
 Mx5RJk4rPzT4Oj8dechtj1aIojPREOiZBtMUCpGUovliRbZu6j+re5cqnaTn4LaOauA==
X-Received: by 2002:a7b:cb4d:0:b0:41b:fa34:9e48 with SMTP id
 5b1f17b1804b1-4212e0a52eamr14260285e9.30.1717149592510; 
 Fri, 31 May 2024 02:59:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJi89QlpGP04dDoDisBplmOCCPtu2L69G8FLPbczN6kiL/eF0OWVOpZe0h/PK7zHDrNb/nyA==
X-Received: by 2002:a7b:cb4d:0:b0:41b:fa34:9e48 with SMTP id
 5b1f17b1804b1-4212e0a52eamr14259805e9.30.1717149591851; 
 Fri, 31 May 2024 02:59:51 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42132d5308csm4535325e9.35.2024.05.31.02.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 02:59:50 -0700 (PDT)
Date: Fri, 31 May 2024 11:59:47 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: gregkh@linuxfoundation.org, wedsonaf@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, lina@asahilina.net,
 pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, mcgrof@kernel.org, russ.weight@linux.dev
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Message-ID: <Zlmfkws-QjNmFxfr@pollux>
References: <ZlfeA7MEZRv404MO@pollux.localdomain>
 <20240530.132433.2195707766186347550.fujita.tomonori@gmail.com>
 <Zlgg_Q5y3Q99Ts1s@pollux>
 <20240531.165032.1895479176481879387.fujita.tomonori@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20240531.165032.1895479176481879387.fujita.tomonori@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

On Fri, May 31, 2024 at 04:50:32PM +0900, FUJITA Tomonori wrote:
> On Thu, 30 May 2024 08:47:25 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
> >> >> >> For a Rust PHY driver, you know that you have a valid pointer to C's
> >> >> >> device object of C's PHY device during the probe callback. The driver
> >> >> >> creates a Rust device object to wrap the C pointer to the C's device
> >> >> >> object and passes it to the firmware abstractions. The firmware
> >> >> >> abstractions gets the C's pointer from the Rust object and calls C's
> >> >> >> function to load firmware, returns the result.
> >> >> >> 
> >> >> >> You have concerns about the simple code like the following?
> >> >> >> 
> >> >> >> 
> >> >> >> diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> >> >> >> new file mode 100644
> >> >> >> index 000000000000..6144437984a9
> >> >> >> --- /dev/null
> >> >> >> +++ b/rust/kernel/device.rs
> >> >> >> @@ -0,0 +1,30 @@
> >> >> >> +// SPDX-License-Identifier: GPL-2.0
> >> >> >> +
> >> >> >> +//! Generic devices that are part of the kernel's driver model.
> >> >> >> +//!
> >> >> >> +//! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
> >> >> >> +
> >> >> >> +use crate::types::Opaque;
> >> >> >> +
> >> >> >> +#[repr(transparent)]
> >> >> >> +pub struct Device(Opaque<bindings::device>);
> >> >> >> +
> >> >> >> +impl Device {
> >> >> >> +    /// Creates a new [`Device`] instance from a raw pointer.
> >> >> >> +    ///
> >> >> >> +    /// # Safety
> >> >> >> +    ///
> >> >> >> +    /// For the duration of 'a, the pointer must point at a valid `device`.
> >> >> > 
> >> >> > If the following rust code does what this comment says, then sure, I'm
> >> >> > ok with it for now if it helps you all out with stuff like the firmware
> >> >> > interface for the phy rust code.
> >> >> 
> >> >> Great, thanks a lot!
> >> >> 
> >> >> Danilo and Wedson, are there any concerns about pushing this patch [1]
> >> >> for the firmware abstractions?
> >> > 
> >> > Well, if everyone is fine with this one I don't see why we can't we go with [1]
> >> > directly? AFAICS, we'd only need the following fix:
> >> > 
> >> > -//! C header: [`include/linux/device.h`](../../../../include/linux/device.h)
> >> > +//! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
> >> > 
> >> > [1] https://lore.kernel.org/rust-for-linux/20240520172554.182094-2-dakr@redhat.com/
> >> 
> >> The difference is that your patch touches the reference count of a
> >> struct device. My patch doesn't.
> >> 
> >> The following part in your patch allows the rust code to freely play
> >> with the reference count of a struct device. Your Rust drm driver
> >> interact with the reference count in a different way than C's drm
> >> drivers if I understand correctly. I'm not sure that Greg will be
> >> convinenced with that approach.
> > 
> > I don't see how this is different than what we do in C. If you (for whatever
> > reason) want to keep a pointer to a struct device you should make sure to
> > increase the reference count of this device, such that it can't get freed for
> > the time being.
> > 
> > This is a 1:1 representation of that and conceptually identical.
> 
> A drm driver does such? If a drm driver allocates two types of
> driver-specific data and keep a pointer to the pci device, then the
> driver calls get_device() twice to increase the reference count of the
> pci's device?

Think about it more generically. If you store a pointer to a device in some
structure (driver private data, generic subsystem structure, etc.), can you
guarantee that without acquiring a reference that the device' reference count
doesn't drop to zero while your structure is alive?

There are cases where you can't, e.g. with Arc<device::Data>. How do you
guarantee (generically for every driver) the last reference of your device data
is dropped with the driver's remove callback? If we make it the driver's
responsibility to care about this the whole thing is unsafe as in C.

In some cases you can, mostly the ones where you free a structure in the
driver's remove callback. But again, then there is no advantage over what we do
in C. What if you change the lifetime of your structure later on, then you may
introduce a bug.

> 
> At the very least, network device drivers don't. a driver doesn't play
> with the reference count. The network subsystem does. And, the network

A quick 'grep' shows 23 occurrences of get_device() in network drivers.

> subsystem doesn't care about how many pointers to a pci device a
> driver keeps.

If none of the drivers has structures storing a pointer to a pci device that out
live the driver's remove callback that's fine.

> 
> With the patch [1], a driver plays with the reference count of a
> device and directly calls get/put_device. It's a different than C
> drivers for me (not sure about drm subsystem though).

It's not different. Again, when a C driver stores a device pointer in a
structure whose lifetime is not bound a special boundary, like the device remove
callback, it must increase the reference count.

It's just that most of the time we are moving within this boundary and in C we
just rely on that. In Rust we can only get this safe by taking a reference for
every pointer we store. And making it safe to use seems to be the goal.

Generally, the whole point of a reference count is that everyone who owns a
pointer to this shared structure increases / decreases the reference count
accordingly.

> 
> But I might be misunderstanding that Greg isn't convinced with this
> reference count thing. We need to wait for his response.
> 
> 
> >> +// SAFETY: Instances of `Device` are always ref-counted.
> >> +unsafe impl crate::types::AlwaysRefCounted for Device {
> >> +    fn inc_ref(&self) {
> >> +        // SAFETY: The existence of a shared reference guarantees that the refcount is nonzero.
> >> +        unsafe { bindings::get_device(self.as_raw()) };
> >> +    }
> >> +
> >> +    unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
> >> +        // SAFETY: The safety requirements guarantee that the refcount is nonzero.
> >> +        unsafe { bindings::put_device(obj.cast().as_ptr()) }
> >> +    }
> >> +}
> >> 
> >> The following comments give the impression that Rust abstractions
> >> wrongly interact with the reference count; callers check out the
> >> reference counter. Nobody should do that.
> > 
> > No, saying that the caller must ensure that the device "has a non-zero reference
> > count" is a perfectly valid requirement.
> > 
> > It doensn't mean that the calling code has to peek the actual reference count,
> > but it means that it must be ensured that while we try to increase the reference
> > count it can't drop to zero unexpectedly.
> 
> Yeah, the same requirements but expressed differently.

Well, instead of

"ensure that `ptr` is valid, non-null, and has a non-zero reference count"

you propose

"the pointer must point at a valid `device`".

When I ask you to specify what "pointer to valid device" means, what would be
the answer?

Since we're still discussing this in the thread of the firmware abstraction, if
you have any further concerns, let's discuss them in the thread for the
corresponding patch.

Once we get to a conclusion I can send a series with only the device and firmare
abstractions such that we can get them in outside of the scope of the reset of
both series to get your driver going.

- Danilo

> 
> But again, I might be misunderstanding. Greg might have a different reason.
> 
> > Your patch, as a subset of this one, has the same requirements as listed below.
> > 
> >> 
> >> +    /// Callers must ensure that `ptr` is valid, non-null, and has a non-zero reference count.
> >> +    pub unsafe fn from_raw(ptr: *mut bindings::device) -> ARef<Self> {
> >> 
> >> +    /// Callers must ensure that `ptr` is valid, non-null, and has a non-zero reference count for
> >> +    /// the entire duration when the returned reference exists.
> >> +    pub unsafe fn as_ref<'a>(ptr: *mut bindings::device) -> &'a Self {
> >> +        // SAFETY: Guaranteed by the safety requirements of the function.
> >> +        unsafe { &*ptr.cast() }
> >> +    }
> >> 
> > 
> > 
> 

