Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKRcB2mTg2lrpgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 19:43:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 427E7EBBC4
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 19:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A5010E73A;
	Wed,  4 Feb 2026 18:43:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="eq8gm3g7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D197110E73A;
 Wed,  4 Feb 2026 18:43:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770229718; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=RrnnWNFovVAA7axgHvvJbMU76dInNA2OcXPTGMkvH7c2QCNdmQpR43RKqUs+mNc2k3z7YJJDpgk+Ci+lyeFnwZ3haSJ7u3JiLw4RJpm2SXHCws/sXZYxzCZHMf0X2jVyZKlxsQWhLmWAh64GYGi1oK4tVIPxBE8GqarXuX/RXcE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770229718;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=eHsWAvz2hep0KdnzuN8UWmsGB1m6+dJ9OA8gLUPXydU=; 
 b=kJXGKGVIZkLtnSkxO/gGoLDQCwfGAY4j9zorW0DOz5Cwe/u/bwah82/dPsfdLPKK0DXe43K7jnW1pCSiLGRKwB1Vrjyh7wr1uBLMeXcHjeEehW8XN+AwBvz8rujxSGhWPUirNDwe6VClVaO3m/351zDz3u3w1k0hKbLDuxjhwNw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770229718; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=eHsWAvz2hep0KdnzuN8UWmsGB1m6+dJ9OA8gLUPXydU=;
 b=eq8gm3g7JtCOAvJFXHaZgS6PYgHQ/r/fqwf8NZRu14T9UoZDZouJUqW4jmo7S2xs
 k+HApZ9/f32PdqhLMZdGrdCpocsOC5c+cRN4V5ED232E7gvKPwOTBUUkgpCIfDUA2p+
 4z75gOqC25a+L7t28m6nT9G6dXdOlicTQ0NT9L/g=
Received: by mx.zohomail.com with SMTPS id 1770229717476464.77123307000454;
 Wed, 4 Feb 2026 10:28:37 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v5 2/4] rust/drm: Don't setup private driver data until
 registration
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260131001602.2095470-3-lyude@redhat.com>
Date: Wed, 4 Feb 2026 15:28:20 -0300
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 nouveau@lists.freedesktop.org, Miguel Ojeda <ojeda@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Alice Ryhl <aliceryhl@google.com>,
 Shankari Anand <shankari.ak0208@gmail.com>,
 David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>,
 Asahi Lina <lina+kernel@asahilina.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <95623012-BAA8-4AA5-9D34-42FAE44B0FFD@collabora.com>
References: <20260131001602.2095470-1-lyude@redhat.com>
 <20260131001602.2095470-3-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,kernel.org,ffwll.ch,google.com,gmail.com,asahilina.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	APPLE_MAILER_COMMON(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 427E7EBBC4
X-Rspamd-Action: no action

Hi Lyude,

> On 30 Jan 2026, at 21:13, Lyude Paul <lyude@redhat.com> wrote:
>=20
> Now that we have a DeviceContext that we can use to represent whether =
a
> Device is known to have been registered, we can make it so that =
drivers can
> create their Devices but wait until the registration phase to assign =
their
> private data to the Device. This is desirable as some drivers need to =
make
> use of the DRM device early on before finalizing their private driver =
data.
>=20
> As such, this change makes it so that the driver's private data can
> currently only be accessed through Device<T, Registered> types and not
> Device<T, Uninit>.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> V4:
> * Remove accidental double-aliasing &mut in Device::release()
> ---
> drivers/gpu/drm/nova/driver.rs |  4 +--
> drivers/gpu/drm/tyr/driver.rs  |  4 +--
> rust/kernel/drm/device.rs      | 64 +++++++++++++++++++++-------------
> rust/kernel/drm/driver.rs      | 19 ++++++++--
> 4 files changed, 59 insertions(+), 32 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nova/driver.rs =
b/drivers/gpu/drm/nova/driver.rs
> index 99d6841b69cbc..8cea5f68c3b04 100644
> --- a/drivers/gpu/drm/nova/driver.rs
> +++ b/drivers/gpu/drm/nova/driver.rs
> @@ -56,8 +56,8 @@ impl auxiliary::Driver for NovaDriver {
>     fn probe(adev: &auxiliary::Device<Core>, _info: &Self::IdInfo) -> =
impl PinInit<Self, Error> {
>         let data =3D try_pin_init!(NovaData { adev: adev.into() });
>=20
> -        let drm =3D =
drm::UnregisteredDevice::<Self>::new(adev.as_ref(), data)?;
> -        let drm =3D drm::Registration::new_foreign_owned(drm, =
adev.as_ref(), 0)?;
> +        let drm =3D =
drm::UnregisteredDevice::<Self>::new(adev.as_ref())?;
> +        let drm =3D drm::Registration::new_foreign_owned(drm, =
adev.as_ref(), data, 0)?;
>=20
>         Ok(Self { drm: drm.into() })
>     }
> diff --git a/drivers/gpu/drm/tyr/driver.rs =
b/drivers/gpu/drm/tyr/driver.rs
> index 0d479b5d7bd62..b574ee1c24587 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -133,8 +133,8 @@ fn probe(
>                 gpu_info,
>         });
>=20
> -        let tdev =3D =
drm::UnregisteredDevice::<Self>::new(pdev.as_ref(), data)?;
> -        let tdev =3D =
drm::driver::Registration::new_foreign_owned(tdev, pdev.as_ref(), 0)?;
> +        let tdev =3D =
drm::UnregisteredDevice::<Self>::new(pdev.as_ref())?;
> +        let tdev =3D =
drm::driver::Registration::new_foreign_owned(tdev, pdev.as_ref(), data, =
0)?;
>=20
>         let driver =3D TyrDriver {
>             _device: tdev.into(),
> diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
> index 8f1780b8f0196..a1d9b0e92f3fd 100644
> --- a/rust/kernel/drm/device.rs
> +++ b/rust/kernel/drm/device.rs
> @@ -26,13 +26,15 @@
> };
> use core::{
>     alloc::Layout,
> +    cell::UnsafeCell,
>     marker::PhantomData,
> -    mem,
> -    ops::Deref,
> -    ptr::{
> +    mem::{
>         self,
> -        NonNull, //
> +        MaybeUninit, //
>     },
> +    ops::Deref,
> +    ptr::NonNull,
> +    sync::atomic::*,
> };
>=20
> #[cfg(CONFIG_DRM_LEGACY)]
> @@ -141,7 +143,7 @@ impl DeviceContext for Uninit {}
> ///
> /// The device in `self.0` is guaranteed to be a newly created =
[`Device`] that has not yet been
> /// registered with userspace until this type is dropped.
> -pub struct UnregisteredDevice<T: drm::Driver>(ARef<Device<T, =
Uninit>>, NotThreadSafe);
> +pub struct UnregisteredDevice<T: drm::Driver>(pub(crate) =
ARef<Device<T, Uninit>>, NotThreadSafe);
>=20
> impl<T: drm::Driver> Deref for UnregisteredDevice<T> {
>     type Target =3D Device<T, Uninit>;
> @@ -188,7 +190,7 @@ impl<T: drm::Driver> UnregisteredDevice<T> {
>     /// Create a new `UnregisteredDevice` for a `drm::Driver`.
>     ///
>     /// This can be used to create a =
[`Registration`](kernel::drm::Registration).
> -    pub fn new(dev: &device::Device, data: impl PinInit<T::Data, =
Error>) -> Result<Self> {
> +    pub fn new(dev: &device::Device) -> Result<Self> {
>         // `__drm_dev_alloc` uses `kmalloc()` to allocate memory, =
hence ensure a `kmalloc()`
>         // compatible `Layout`.
>         let layout =3D Kmalloc::aligned_layout(Layout::new::<Self>());
> @@ -207,22 +209,6 @@ pub fn new(dev: &device::Device, data: impl =
PinInit<T::Data, Error>) -> Result<S
>         .cast();
>         let raw_drm =3D =
NonNull::new(from_err_ptr(raw_drm)?).ok_or(ENOMEM)?;
>=20
> -        // SAFETY: `raw_drm` is a valid pointer to `Self`.
> -        let raw_data =3D unsafe { =
ptr::addr_of_mut!((*raw_drm.as_ptr()).data) };
> -
> -        // SAFETY:
> -        // - `raw_data` is a valid pointer to uninitialized memory.
> -        // - `raw_data` will not move until it is dropped.
> -        unsafe { data.__pinned_init(raw_data) }.inspect_err(|_| {
> -            // SAFETY: `raw_drm` is a valid pointer to `Self`, given =
that `__drm_dev_alloc` was
> -            // successful.
> -            let drm_dev =3D unsafe { Device::into_drm_device(raw_drm) =
};
> -
> -            // SAFETY: `__drm_dev_alloc()` was successful, hence =
`drm_dev` must be valid and the
> -            // refcount must be non-zero.
> -            unsafe { bindings::drm_dev_put(drm_dev) };
> -        })?;
> -
>         // SAFETY: The reference count is one, and now we take =
ownership of that reference as a
>         // `drm::Device`.
>         // INVARIANT: We just created the device above, but have yet =
to call `drm_dev_register`.
> @@ -253,7 +239,15 @@ pub fn new(dev: &device::Device, data: impl =
PinInit<T::Data, Error>) -> Result<S
> #[repr(C)]
> pub struct Device<T: drm::Driver, C: DeviceContext =3D Registered> {
>     dev: Opaque<bindings::drm_device>,
> -    data: T::Data,
> +
> +    /// Keeps track of whether we've initialized the device data yet.
> +    pub(crate) data_is_init: AtomicBool,

What about this?

	/**
	 * @registered:
	 *
	 * Internally used by drm_dev_register() and =
drm_connector_register().
	 */
	bool registered;

Can=E2=80=99t we use this in lieu of this flag you=E2=80=99ve added?

> +
> +    /// The Driver's private data.
> +    ///
> +    /// This must only be written to from [`drm::Registration::new`].
> +    pub(crate) data: UnsafeCell<MaybeUninit<T::Data>>,
> +
>     _ctx: PhantomData<C>,
> }
>=20

=E2=80=94 Daniel

