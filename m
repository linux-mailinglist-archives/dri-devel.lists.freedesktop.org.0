Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 129408874C3
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 23:14:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B426C112824;
	Fri, 22 Mar 2024 22:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="X1BlscDM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD14112824
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 22:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711145684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZceXvUPFywnM9XOG18mYfgVHe3urtUNxPclIqQokvbY=;
 b=X1BlscDM8OsWNQHs4pf/VIpLn69BbCKVsqeYTqesfDw9MUDmWG+U88BcMWUM9BlrZ9mlwx
 Ny16CC5CJBYofD7uH7WZ2Kp7JSiiH5JMwX9kvX3MaKDCAzNOrk/rofTgHevEV+wS4AkKUD
 MzZqgT/6vS7U+x8gt0s7ow39yzOAXRg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-h2LJRQGpM-6hcydqIbXLZQ-1; Fri, 22 Mar 2024 18:14:38 -0400
X-MC-Unique: h2LJRQGpM-6hcydqIbXLZQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53F528007A3;
 Fri, 22 Mar 2024 22:14:38 +0000 (UTC)
Received: from emerald.redhat.com (unknown [10.22.8.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C68A98173;
 Fri, 22 Mar 2024 22:14:37 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Alice Ryhl <aliceryhl@google.com>,
 rust-for-linux@vger.kernel.org (open list:RUST:Keyword:\b(?i:rust)\b)
Subject: [RFC WIP 0/4] Rust bindings for KMS + RVKMS
Date: Fri, 22 Mar 2024 18:03:32 -0400
Message-ID: <20240322221305.1403600-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

Hi everyone! I mentioned a little while ago that I've been working on
porting vkms over to rust so that we could come up with a set of rust
KMS bindings for the nova driver to be able to have a modesetting driver
written in rust. This driver currently doesn't really do much, but it
does load and register a modesetting device!

I wanted to send this early on so that people could take a look and tell
me if there's anything I've overlooked so far. As well, I've written up
a high level overview of how the interface works - along with my
reasoning for a lot of the design choices here. I'm sure things will
change a bit as I figure out what we really need while porting rvkms,
but I'm hoping this is pretty close to what the final set of bindings
are going to look like.

Note: not all of the patches required for building this have been
included. I've just included the kms/rvkms bits here, but the full
branch can be found here:

https://gitlab.freedesktop.org/lyudess/linux/-/commits/rvkms-03222024

So, the overview!

# Modesetting objects and atomic states

A general overview of the interface: so far we have the following traits
for drivers to implement:

  * DriverConnector
  * DriverCrtc
  * DriverPlane
  * DriverEncoder

Each one of these modesetting objects also has a typed container that
can be used to refer to it by drivers: Connector<T>, Plane<T>, etc. Each
typed container has only two members (not counting phantoms). Using
Crtc<T> as an example:

/// A typed KMS CRTC with a specific driver.
#[repr(C)]
#[pin_data]
pub struct Crtc<T: DriverCrtc> {
    // The FFI drm_crtc object
    pub(super) crtc: Opaque<bindings::drm_crtc>,
    /// The driver's private inner data
    #[pin]
    inner: T,
    #[pin]
    _p: PhantomPinned,
}

The first member is an Opaque<> container containing the FFI struct for
the modesetting object, and the second `inner` contains the implementing
driver's private data for the modesetting object. Each modesetting
object container can be coerced (through Deref<>) into an immutable
reference to inner to make accessing driver-private data easy. This
allows subclassing of modesetting objects in a similar manner to what we
currently do in C.

The main difference is that modesetting objects are immutable to drivers
(as in, drivers can only get immutable references to these objects). The
reason for this is that while it's common for drivers to stick their own
private data in objects, pretty much all of this data falls into one of
these categories:

* Static driver data which is assigned during driver init. In our
  abstraction, this assignment will happen in each modesetting object's
  T::new() function - where the driver can use each modesetting object
  trait's Args type to specify a data type containing such data which
  will be passed to T::new(). This should always be available through
  immutable references.
* Modesetting state for drivers which needs to be kept track of
  independently of the atomic state. As the name entails, all data in
  this category is assumed to only be accessible within a modesetting
  context - which itself ensures synchronization. At some point we will
  implement a container type for this, which only provides a &mut
  reference once the caller provides proof that we're in an atomic
  modesetting context and thus - are the only ones who could possibly
  hold a mutable reference.
* Miscellaneous driver state, which may need to be accessed both inside
  and outside of the atomic modesetting context. We will provide no
  container type for this, and it will be up to the driver to provide an
  appropriate container that ensures synchronization and hands out
  mutable references as needed. A simple example of such a container
  would be Mutex<T>.

# Opaque modesetting objects

This is something I haven't written up code for yet because we haven't
run into any use for it, but presumably we will eventually. Basically:
since we have driver subclassing through types like Connector<T> which
the main DRM device trait doesn't need to know about - it is technically
possible for us to have multiple different implementations of a
modesetting object (for instance, a driver could have two
DriverConnector implementations for different types of display
connectors). At first I thought this might be too complicated, but I
don't think it is! To support this, we would use a similar solution to
what the GEM bindings currently do - by providing an opaque version of
each modesetting object which only can be used for operations common
across different implementations of that object. This Opaque struct
could then be fallibly converted to its more qualified type, and we can
ensure type safety here by simply using each implementation's vtable
pointer (all of which should be 'static) to tell whether an opaque
object matches the qualified type the driver is expecting. Here's some
example psuedocode to give you an idea:

```
let drm_dev: drm::device::Device<Driver>; /* initialized elsewhere */

type Plane = drm::kms::plane::Plane<DriverPlane>;

for plane in drm_dev.iter_planes().filter_map(Plane::from_opaque) {
  // ... do something
}
```

We'd only really need to use these opaque types in situations where we
can't guarantee type invariance, like iterating a list of multiple impls
of modesetting objects. So, that more or less just means "anywhere
outside of a DRM callback" (callbacks can ensure type invariance since
each type has its own vtable).

# Atomic states for modesetting objects

For objects with atomic states, these traits are also implemented by the
driver and allow subclassing as well - but with a few differences:

* ConnectorState
* CrtcState
* PlaneState

The main difference is that unlike with modesetting objects, atomic
states are initially* considered mutable objects. This is mainly since
contexts like atomic_check can satisfy rust's data aliasing rules, and
it's just a lot easier for drivers to be able to get &mut references to
these easily. It is likely that we may expose these objects later on
through Pin<&mut> - since we don't want to allow them to move as certain
drivers will do things like storing work structs in their states. I
haven't gotten this far in the code yet though!

# Helpers

VKMS does not actually use drm_plane_state! Instead, it actually uses a
GEM provided atomic state helper and the drm_shadow_plane_struct - which
contains a drm_plane_state. And this is only a single example of such a
helper, as a number of other ones which change the struct type a driver
uses exist. So, how do we actually handle this in our bindings? Well, by
shamelessly copying what the GEM bindings do!

For modesetting objects where we want to also support the use of a
helper that comes with it's own modesetting object/atomic state struct,
we can follow another trait pattern. Using PlaneState<T> and shadow
planes as an example: we can introduce a sealed trait named
IntoPlaneState. This trait will represent any object in rust which
contains a drm_plane_state - along with providing a set of functions
that can be implemented to tell rust how to translate the object into a
drm_plane_state, along with providing methods for invoking any other DRM
functions that might be different for a helper. In the patch series I've
posted, I've included some of the WIP code for handling shadow planes in
this manner.

# The initially* mutable global atomic state

I have some WIP code written up for this, but nothing very complete
quite yet as we haven't yet needed to manually instantiate an atomic
state yet. But in some of the code I wrote up, I noticed some funny
gotchas.

The main drm_atomic_state structure is refcounted - which means multiple
references to an atomic state can exist at once. This complicates things
just a bit - as rust's data aliasing rules only allow for one mutable
reference to an object to exist at a time. My current plan for handling
this is to extend the kernel's ARef<T> type to also include a
UniqueARef<T> type. This is basically the same as the kernel's
UniqueArc<T> type, but for already refcounted objects - which will allow
a caller mutable access to the underlying object so long as it's the
only one holding a ref to it. Sharing references to the atomic state
requires will require converting away from the UniqueARef. I think this
should be enough, since drivers shouldn't really be making any changes
to a state after the atomic check phase - so only having immutable
references after that point should be good enough to make everyone
happy.

# Modesetting object lifetimes, ModesetObject and StaticModesetObject

I think sima may have tried to warn me about this, because this was
definitely a strange bit to figure out. There are two main types of
modesetting objects in the kernel: refcounted modesetting objects, and
non-refcounted modesetting objects. Reference counted objects are easy:
we just implement the kernel's AlwaysRefCounted trait for them.
Non-refcounted modesetting objects are weirder, as they share the
lifetime of the device. This was one of the other big reasons we have to
always expose modesetting objects through immutable references giving
driver ownership over these structs would imply the driver could drop
them before the drm device has been dropped which would cause UB. I
originally considered having modesetting objects live in Arc<>
internally to workaround this, but decided against it as this would mean
we could make a non-refcounted modesetting object outlive it's device -
which could also cause UB if a driver tried to do a modesetting
operation with said object.

I'd _really_ love to figure out how to handle this with references and
lifetimes, as right now we currently tie the lifetime of a modesetting
object's reference to the lifetime of the reference to the DRM device
that created it - but this isn't currently enough to store those
references in a driver's private data as I can't figure out how to tell
the compiler "this reference is valid for as long as you hold an ARef
for the DRM device". Which brings us to ModesetObject and
StaticModesetObject. ModesetObject is a simple trait implemented by all
DRM modesetting objects, which provides access to functions common
across them (such as fetching the DRM device associated with a
modesetting object). StaticModesetObject is a supertrait of
ModesetObject which essentially marks a modesetting object as not having
a refcount. We then provide KmsRef<T> which can be used to retrieve a
"owned" reference to a modesetting object which can be stored in device
state. This owned reference is simply a pointer to the modesetting
object, along with an owned refcount for that object's parent device -
which should ensure that the modesetting object is initialized and valid
for as long as a KmsRef<> is held. I'm open for better ideas to solve
this though :).

# BFLs

Unfortunately KMS has a few BFLs. In particular,
drm_device.mode_config.mutex is one such BFL that protects anything
related to hotplugging state (and probably a few other things?). In
rust, data races are considered UB - so we need to be careful to ensure
that any safe bindings we expose take care to be thread safe. Since rust
usually represents locks as container types (e.g. Mutex<T>), but we have
to deal with a BFL, we need a different solution that we can use to
represent critical sections under this BFL. This brings us to
ModeConfigGuard and ConnectorGuard.

In rust, upon acquiring access to a mutex - you're given a "Guard"
object which will release its respective lock once its dropped, and
ModeConfigGuard is our version of this. ModeConfigGuards can either be
"owned" or "borrowed". "Owned" means the rust code acquired the lock
itself and thus - the lock must be dropped when the guard goes out of
scope. "Borrowed" guards can only be created using unsafe functions, and
are basically simply a promise that the mode config lock is held for the
entire scope in which the ModeConfigGuard is alive. Borrowed guards are
really only something that will be used on the FFI side of things for
callbacks like drm_connector.get_modes() - where we know that the
mode_config_lock was acquired prior to our get_modes() callback being
invoked by DRM.

ConnectorGuard is basically just a helpful extension of this that can be
instantiated cheaply from a ModeConfigGuard, and it basically just
provides access to methods for individual connectors that can only
happen under the mode_config lock. You can see an example of this in
rust/kernel/drm/kms/connector.rs and drivers/gpu/drm/rvkms/connector.rs.
Keep in mind we currently don't have an implementation of an owned
ModeConfigGuard, as no use for one has arisen in rvkms quite yet.

Note: I did (and still am) considering using the kernel's already-made
LockedBy<> type - however, this seems rather difficult to do considering
that the BFL and connector live in different structs - and those structs
are FFI structs. I shoud look a bit closer at some point soon though. As
well, I expect the semantics around how this type works might change
slightly - as I'd also like to see if we can represent the difference
between owned and borrowed guards such that no checks need to be done at
runtime.

# Actually registering a modesetting device

This part is still very much in flux I think, and it's worth explaining
why. Currently from the DRM bindings we inherited from Asahi, the
lifetime of a DRM device's registration is represented by
drm::drv::Registration<T>. Unsurprisingly, the purpose of this is that
once the Registration<T> object is dropped - the DRM device is
unregistered. There's some complications around this though.

The big one is that modesetting initialization is single threaded. This
should be fine, but, currently (following how Asahi's driver does this)
we ensure automatic reg/unreg by sticking the Registration<T> object in
our registration device data (see `device::Data<T, U, V>` for an
explanation of what this means). And that would also be fine, except for
the fact that said device data has to be thread safe. This means it
needs Send/Sync, which also means we basically have to treat the
registration as multi-threaded despite the fact it really should never
actually be happening in multiple threads. We also have a
RegistrationInfo struct i had to come up with, which provides access to
an atomic boolean that tracks whether or not we've actually registered
the device. This part was only needed because while DRM does have a
variable for tracking this in drm_device already, the Registration<T>
object is created before registration actually happens - so it needs a
thread-safe way of knowing whether or not it needs to unregister the
device upon being dropped.

The other thing I haven't been able to figure out: a way of safely
gating global modesetting device functions so that they only can be used
on DRM devices that support KMS (an example of one such function -
drm_mode_config_reset()). Since the callbacks for modesetting devices
and the rest of DRM live in the same struct, the same struct is used for
both cases - even though it's entirely possible to have a drm_device
without KMS support and thus without an initialized mode_config struct.
This would be very nice to figure out, because I assume there's likely
to be UB if a non-KMS device attempts to do KMS-like operations on
itself. Currently, a modesetting device indicates it has KMS in my
branch by doing two things:

* Setting FEAT_MODESET and FEAT_ATOMIC in drm::drv::Driver::FEATURES
* Passing a ModeConfigInfo struct to drm::drv::Registration::register(),
  containing various misc. information drivers usually populate in
  mode_config

Figuring out how to gate these to only KMS-supporting devices would
likely mean moving the global modesetting callbacks we need to support
into a different trait that's only implemented by KMS drivers - but I'm
not quite sure how to do that cleanly yet.

# Other issues/hacks

* Currently, a DRM driver's vtable and file operations table are not
  static. I totally think we can (and should) make this static by making
  drm::gem::create_fops() a const fn, and also turning DriverOps's
  constructors into const fns. The current blocker for this is that
  Default::default() is not const, along with mem::zeroed() - giving us
  no way of creating a zero-initialized struct at compile-time.
  Coincidentally, mem::zeroed() actually becomes const in rust 1.75 - so
  once the kernel updates its rust version we should be able to fix
  this.
* There is a leak somewhere? Unloading rvkms currently leaves behind a
  few DRI directories, I'm not totally sure why yet - but I think this
  may be an issue with the DRM bindings themselves.
* bindgen doesn't understand fourcc, and probably a number of other
  similar files. So we're going to need some nasty hacks to expose
  these.
* I'm sure there's bits of code that need cleaning up, but I figured it
  was more important to start getting feedback on all of this first :).

Lyude Paul (4):
  WIP: rust: Add basic KMS bindings
  WIP: drm: Introduce rvkms
  rust/drm/kms: Extract PlaneState<T> into IntoPlaneState
  WIP: rust/drm/kms: Add ShadowPlaneState<T>

 drivers/gpu/drm/Kconfig                  |   2 +
 drivers/gpu/drm/Makefile                 |   1 +
 drivers/gpu/drm/rvkms/Kconfig            |   3 +
 drivers/gpu/drm/rvkms/Makefile           |   1 +
 drivers/gpu/drm/rvkms/connector.rs       |  55 +++
 drivers/gpu/drm/rvkms/crtc.rs            |  40 +++
 drivers/gpu/drm/rvkms/encoder.rs         |  26 ++
 drivers/gpu/drm/rvkms/file.rs            |  22 ++
 drivers/gpu/drm/rvkms/gem.rs             |  32 ++
 drivers/gpu/drm/rvkms/output.rs          |  72 ++++
 drivers/gpu/drm/rvkms/plane.rs           |  42 +++
 drivers/gpu/drm/rvkms/rvkms.rs           | 146 ++++++++
 rust/bindings/bindings_helper.h          |   6 +
 rust/helpers.c                           |  17 +
 rust/kernel/drm/device.rs                |   2 +
 rust/kernel/drm/drv.rs                   | 115 ++++++-
 rust/kernel/drm/kms.rs                   | 147 +++++++++
 rust/kernel/drm/kms/connector.rs         | 404 +++++++++++++++++++++++
 rust/kernel/drm/kms/crtc.rs              | 300 +++++++++++++++++
 rust/kernel/drm/kms/encoder.rs           | 175 ++++++++++
 rust/kernel/drm/kms/gem_atomic_helper.rs |  48 +++
 rust/kernel/drm/kms/plane.rs             | 339 +++++++++++++++++++
 rust/kernel/drm/mod.rs                   |   1 +
 23 files changed, 1980 insertions(+), 16 deletions(-)
 create mode 100644 drivers/gpu/drm/rvkms/Kconfig
 create mode 100644 drivers/gpu/drm/rvkms/Makefile
 create mode 100644 drivers/gpu/drm/rvkms/connector.rs
 create mode 100644 drivers/gpu/drm/rvkms/crtc.rs
 create mode 100644 drivers/gpu/drm/rvkms/encoder.rs
 create mode 100644 drivers/gpu/drm/rvkms/file.rs
 create mode 100644 drivers/gpu/drm/rvkms/gem.rs
 create mode 100644 drivers/gpu/drm/rvkms/output.rs
 create mode 100644 drivers/gpu/drm/rvkms/plane.rs
 create mode 100644 drivers/gpu/drm/rvkms/rvkms.rs
 create mode 100644 rust/kernel/drm/kms.rs
 create mode 100644 rust/kernel/drm/kms/connector.rs
 create mode 100644 rust/kernel/drm/kms/crtc.rs
 create mode 100644 rust/kernel/drm/kms/encoder.rs
 create mode 100644 rust/kernel/drm/kms/gem_atomic_helper.rs
 create mode 100644 rust/kernel/drm/kms/plane.rs

-- 
2.43.0

