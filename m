Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF90D3972C
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jan 2026 15:36:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54FA810E2CB;
	Sun, 18 Jan 2026 14:36:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dpXshR4h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9B510E2CB;
 Sun, 18 Jan 2026 14:36:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BCE3F43ABC;
 Sun, 18 Jan 2026 14:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53DDC116D0;
 Sun, 18 Jan 2026 14:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768746977;
 bh=33hSF7vZvBt9hpj11PH/qOK78BNtuiOFwFzHcWTHKGs=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=dpXshR4hP1Uedl3csIEZzc8pB6piBF2OUIe80AqEQbPSXr8U6nOJJTJgQo7q9J+oc
 txtdGHKW365ZRdZMsmTnCK1Wj4aDchYwxWWRgb2rc54N2Qd4tErlIX9LlR6xitKcN1
 eV8z8QL+tcVLJxRFQhwhLALUuRNTA+kk8StX9XCfAlTMDSchYUkYyScaIBt/KmnVIf
 W0bj0CVPVLbFlgT34tWVhYHnf+cm8FAcUfBVqq/ycGU9z7yUgJZKbx3PlpQqUhRHuN
 XbHpnt+Of98+DF1pBupltso1u/xqd8ZdqCIe0O5nr1dOyw1LtSZCVh03u30E2+8GT0
 /PbRrLBXvZJSg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 18 Jan 2026 15:36:13 +0100
Message-Id: <DFRSH2462TT2.RZBLN08KS0IW@kernel.org>
Subject: Re: [PATCH v2 2/3] rust/drm: Don't setup private driver data until
 registration
Cc: <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Alice Ryhl"
 <aliceryhl@google.com>, "Shankari Anand" <shankari.ak0208@gmail.com>,
 "David Airlie" <airlied@gmail.com>, "Benno Lossin" <lossin@kernel.org>,
 "Asahi Lina" <lina+kernel@asahilina.net>, "Atharv Dubey"
 <atharvd440@gmail.com>, "Daniel Almeida" <daniel.almeida@collabora.com>
To: "Lyude Paul" <lyude@redhat.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260116204728.725579-1-lyude@redhat.com>
 <20260116204728.725579-3-lyude@redhat.com>
In-Reply-To: <20260116204728.725579-3-lyude@redhat.com>
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

On Fri Jan 16, 2026 at 9:41 PM CET, Lyude Paul wrote:
> @@ -118,7 +120,7 @@ pub trait DeviceContext: Sealed + Send + Sync {}
>  ///
>  /// The device in `self.0` is guaranteed to be a newly created [`Device`=
] that has not yet been
>  /// registered with userspace until this type is dropped.
> -pub struct UnregisteredDevice<T: drm::Driver>(ARef<Device<T, Uninit>>, N=
otThreadSafe);
> +pub struct UnregisteredDevice<T: drm::Driver>(pub(crate) ARef<Device<T, =
Uninit>>, NotThreadSafe);
> =20
>  impl<T: drm::Driver> Deref for UnregisteredDevice<T> {
>      type Target =3D Device<T, Uninit>;
> @@ -165,7 +167,7 @@ impl<T: drm::Driver> UnregisteredDevice<T> {
>      /// Create a new `UnregisteredDevice` for a `drm::Driver`.
>      ///
>      /// This can be used to create a [`Registration`](kernel::drm::Regis=
tration).
> -    pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>)=
 -> Result<Self> {
> +    pub fn new(dev: &device::Device) -> Result<Self> {
>          // `__drm_dev_alloc` uses `kmalloc()` to allocate memory, hence =
ensure a `kmalloc()`
>          // compatible `Layout`.
>          let layout =3D Kmalloc::aligned_layout(Layout::new::<Self>());
> @@ -184,22 +186,6 @@ pub fn new(dev: &device::Device, data: impl PinInit<=
T::Data, Error>) -> Result<S
>          .cast();
>          let raw_drm =3D NonNull::new(from_err_ptr(raw_drm)?).ok_or(ENOME=
M)?;
> =20
> -        // SAFETY: `raw_drm` is a valid pointer to `Self`.
> -        let raw_data =3D unsafe { ptr::addr_of_mut!((*raw_drm.as_ptr()).=
data) };
> -
> -        // SAFETY:
> -        // - `raw_data` is a valid pointer to uninitialized memory.
> -        // - `raw_data` will not move until it is dropped.
> -        unsafe { data.__pinned_init(raw_data) }.inspect_err(|_| {
> -            // SAFETY: `raw_drm` is a valid pointer to `Self`, given tha=
t `__drm_dev_alloc` was
> -            // successful.
> -            let drm_dev =3D unsafe { Device::into_drm_device(raw_drm) };
> -
> -            // SAFETY: `__drm_dev_alloc()` was successful, hence `drm_de=
v` must be valid and the
> -            // refcount must be non-zero.
> -            unsafe { bindings::drm_dev_put(drm_dev) };
> -        })?;
> -
>          // SAFETY: The reference count is one, and now we take ownership=
 of that reference as a
>          // `drm::Device`.
>          // INVARIANT: We just created the device above, but have yet to =
call `drm_dev_register`.
> @@ -231,7 +217,15 @@ pub fn new(dev: &device::Device, data: impl PinInit<=
T::Data, Error>) -> Result<S
>  #[repr(C)]
>  pub struct Device<T: drm::Driver, C: DeviceContext =3D Registered> {
>      dev: Opaque<bindings::drm_device>,
> -    data: T::Data,
> +
> +    /// Keeps track of whether we've initialized the device data yet.
> +    pub(crate) data_is_init: AtomicBool,

Please use a kernel atomic, i.e. kernel::sync::atomic::Atomic<bool>. See al=
so [1].

[1] https://lore.kernel.org/all/20251230093718.1852322-1-fujita.tomonori@gm=
ail.com/

> +    /// The Driver's private data.
> +    ///
> +    /// This must only be written to from [`drm::Registration::new`].
> +    pub(crate) data: UnsafeCell<MaybeUninit<T::Data>>,

Why not just Opaque<T::Data>?

> +
>      _ctx: PhantomData<C>,
>  }
