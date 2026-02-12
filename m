Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wdtIH8KhjWlh5gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 10:47:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA92112BFE9
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 10:47:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B14110E181;
	Thu, 12 Feb 2026 09:47:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.b="RcrEUovY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 410 seconds by postgrey-1.36 at gabe;
 Thu, 12 Feb 2026 02:11:16 UTC
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A4810E115
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 02:11:16 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 546DE240101
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 03:04:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
 t=1770861864; bh=sYcIeMw3E5vaN3wWVxSfiBAIhzlybUT7l4VnyZvDrUU=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding:From;
 b=RcrEUovY+ut0vGsklm1eC9HU+B+odryKECFTTdW1Cfte9Zm0eEjajk3TmHzayLhkV
 2HkHXrtKirh3tn60fHQQnUys4qJdkEKi1OsJRTbfd6mRwlxKSmtq/urlBRfPKOgVNt
 k5fXglHeVgFI/2vqG3CpHlAZDq9pGdoj0ZZdeQYyU3+VNgC3lqJHZuw6a5/O5bwzC4
 GMMXZcgTUZz6K3J7CKF0Q+zOsfYQoyGK+xeoZeEHdYZNGkRfZGbWd+rUnVGwIbMGEp
 CqxVzFKC1aHNUBixmKq7nqLm2QvrROqwxE0YD77P2V2StFqMdAIN29lril3zVaYGEh
 B7kdHZ4B5j3nA==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4fBJWn6Gl1z6tsb;
 Thu, 12 Feb 2026 03:04:21 +0100 (CET)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: Onur =?utf-8?Q?=C3=96zkan?= <work@onurozkan.dev>
Cc: daniel.almeida@collabora.com,  aliceryhl@google.com,  dakr@kernel.org,
 airlied@gmail.com,  simona@ffwll.ch,  dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,  lgirdwood@gmail.com,  broonie@kernel.org,
 ojeda@kernel.org,  rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v1] drm/tyr: make SRAM supply optional like panthor
In-Reply-To: <20260211195406.289634-1-work@onurozkan.dev>
References: <20260211195406.289634-1-work@onurozkan.dev>
Date: Thu, 12 Feb 2026 02:04:23 +0000
Message-ID: <87bjhu67kr.fsf@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 12 Feb 2026 09:47:42 +0000
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[posteo.net,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[posteo.net:s=2017];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:work@onurozkan.dev,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:ojeda@kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[charmitro@posteo.net,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[collabora.com,google.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[charmitro@posteo.net,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[posteo.net:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zulipchat.com:url,onurozkan.dev:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,posteo.net:mid,posteo.net:dkim]
X-Rspamd-Queue-Id: CA92112BFE9
X-Rspamd-Action: no action

Onur =C3=96zkan <work@onurozkan.dev> writes:

> On rk3588s, `dmesg | grep 'tyr'` logs:
>
>   tyr fb000000.gpu: supply SRAM not found, using dummy regulator
>
> This happens because Tyr calls Regulator<Enabled>::get() for SRAM,
> which goes through the non-optional regulator_get() path. If the
> device tree doesn't provide sram-supply, regulator core falls back
> to a dummy regulator and writes that log.
>
> Panthor handles SRAM as optional and tolerates missing sram-supply.
> This patch matches that behavior in Tyr by using optional regulator
> lookup and storing SRAM as Option<Regulator<Enabled>> which avoids
> dummy-regulator fallback/noise when SRAM is not described inside
> the device tree.
>
> Link: https://rust-for-linux.zulipchat.com/#narrow/stream/x/topic/x/near/=
573210018
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  drivers/gpu/drm/tyr/driver.rs |  5 +++--
>  rust/kernel/regulator.rs      | 40 +++++++++++++++++++++++++++++++++++
>  2 files changed, 43 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
> index 0389c558c036..e0856deb83ec 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -113,7 +113,8 @@ fn probe(
>          coregroup_clk.prepare_enable()?;
>=20=20
>          let mali_regulator =3D Regulator::<regulator::Enabled>::get(pdev=
.as_ref(), c_str!("mali"))?;
> -        let sram_regulator =3D Regulator::<regulator::Enabled>::get(pdev=
.as_ref(), c_str!("sram"))?;
> +        let sram_regulator =3D
> +            Regulator::<regulator::Enabled>::get_optional(pdev.as_ref(),=
 c_str!("sram"))?;
>=20=20
>          let request =3D pdev.io_request_by_index(0).ok_or(ENODEV)?;
>          let iomem =3D Arc::pin_init(request.iomap_sized::<SZ_2M>(), GFP_=
KERNEL)?;
> @@ -201,5 +202,5 @@ struct Clocks {
>  #[pin_data]
>  struct Regulators {
>      mali: Regulator<regulator::Enabled>,
> -    sram: Regulator<regulator::Enabled>,
> +    sram: Option<Regulator<regulator::Enabled>>,
>  }
> diff --git a/rust/kernel/regulator.rs b/rust/kernel/regulator.rs
> index 2c44827ad0b7..8d95e5e80051 100644
> --- a/rust/kernel/regulator.rs
> +++ b/rust/kernel/regulator.rs
> @@ -283,6 +283,29 @@ fn get_internal(dev: &Device, name: &CStr) -> Result=
<Regulator<T>> {
>          })
>      }
>=20=20
> +    fn get_optional_internal(dev: &Device, name: &CStr) -> Result<Option=
<Regulator<T>>> {
> +        // SAFETY: It is safe to call `regulator_get_optional()`, on a
> +        // device pointer received from the C code.
> +        let inner =3D from_err_ptr(unsafe {
> +            bindings::regulator_get_optional(dev.as_raw(), name.as_char_=
ptr())
> +        });

Hello,

When CONFIG_REGULATOR is disabled, regulator_get_optional() becomes a
static inline stub in consumer.h, and bindgen cannot export it as a
symbol. The other regulator functions all have C helpers for this but
regulator_get_optional() is missing one.

So it causes a E0425 with CONFIG_REGULATOR not set.

  error[E0425]: cannot find function `regulator_get_optional` in crate `bin=
dings`
      --> rust/kernel/regulator.rs:290:23
       |
   290 |             bindings::regulator_get_optional(dev.as_raw(), name.as=
_char_ptr())
       |                       ^^^^^^^^^^^^^^^^^^^^^^ help: a function with=
 a similar name exists: `regulator_get_voltage`

> +
> +        let inner =3D match inner {
> +            Ok(inner) =3D> inner,
> +            Err(ENODEV) =3D> return Ok(None),
> +            Err(err) =3D> return Err(err),
> +        };
> +
> +        // SAFETY: We can safely trust `inner` to be a pointer to a valid
> +        // regulator if `ERR_PTR` was not returned.
> +        let inner =3D unsafe { NonNull::new_unchecked(inner) };
> +
> +        Ok(Some(Self {
> +            inner,
> +            _phantom: PhantomData,
> +        }))
> +    }

The Regulator struct invariant currently says:

  /// - `inner` is a non-null wrapper over a pointer to a `struct
  ///   regulator` obtained from [`regulator_get()`].

Since get_optional_internal() creates a Regulator from
regulator_get_optional(), should we also update it to mention it?


Cheers,
C. Mitrodimas

> +
>      fn enable_internal(&self) -> Result {
>          // SAFETY: Safe as per the type invariants of `Regulator`.
>          to_result(unsafe { bindings::regulator_enable(self.inner.as_ptr(=
)) })
> @@ -300,6 +323,11 @@ pub fn get(dev: &Device, name: &CStr) -> Result<Self=
> {
>          Regulator::get_internal(dev, name)
>      }
>=20=20
> +    /// Obtains an optional [`Regulator`] instance from the system.
> +    pub fn get_optional(dev: &Device, name: &CStr) -> Result<Option<Self=
>> {
> +        Regulator::get_optional_internal(dev, name)
> +    }
> +
>      /// Attempts to convert the regulator to an enabled state.
>      pub fn try_into_enabled(self) -> Result<Regulator<Enabled>, Error<Di=
sabled>> {
>          // We will be transferring the ownership of our `regulator_get()=
` count to
> @@ -329,6 +357,18 @@ pub fn get(dev: &Device, name: &CStr) -> Result<Self=
> {
>              .map_err(|error| error.error)
>      }
>=20=20
> +    /// Obtains an optional [`Regulator`] instance from the system and e=
nables it.
> +    pub fn get_optional(dev: &Device, name: &CStr) -> Result<Option<Self=
>> {
> +        match Regulator::<Disabled>::get_optional_internal(dev, name)? {
> +            Some(regulator) =3D> {
> +                let enabled_regulator =3D
> +                    regulator.try_into_enabled().map_err(|error| error.e=
rror)?;
> +                Ok(Some(enabled_regulator))
> +            }
> +            None =3D> Ok(None),
> +        }
> +    }
> +
>      /// Attempts to convert the regulator to a disabled state.
>      pub fn try_into_disabled(self) -> Result<Regulator<Disabled>, Error<=
Enabled>> {
>          // We will be transferring the ownership of our `regulator_get()=
` count
