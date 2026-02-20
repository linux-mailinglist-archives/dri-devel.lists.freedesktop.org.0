Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBJbEP5umGkoIgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 15:26:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B8B168538
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 15:26:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CECD10E045;
	Fri, 20 Feb 2026 14:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="NCOGVIQL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DACBC10E045
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 14:26:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1771597558; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=EFsKcoG9vuCoCYgPXD9cVTI/b1rKKjqDejr/k/6BfnveP2KB3wFnnxAn30Ld8GHIsjhn41E+3TZKIZh0xKLrX01s4jaHJtLw4UklHMJO8DWQASt07M2Su+GPbTR5TLK4RmjF1ih8ZlcRhsc9EKlGz+frLAlw3XXQhKcrUuWLog4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1771597558;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=SgCizO3HkZx+yUOO1qIsj6L6sYpshRY4y+E+T2xDKsk=; 
 b=dffgqto31AF7W22+DpwIWE6eFEDeCWdz7kLNzEnIJ1SKtY6Ia9UhkiqQnEkDdC5Bip9d0ZbSY63UhICyA9ErXXMjHvpZ+2Pr74v86yCZ3F47DVK9yn/Qh2PQiDvT3lUFMyab4sClOqGlLTznw4izATAmvG+QAq4675sCso4fVAQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771597558; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=SgCizO3HkZx+yUOO1qIsj6L6sYpshRY4y+E+T2xDKsk=;
 b=NCOGVIQLYAZCSWEZewbfmW5zF0IL5Zg9bxjmNB6B3+88IlJXnj00m42QegbIRK8+
 yRrW7bhr3NcyjKycqRUzZwaN6jt/cRkDrWdekUTF9rSOJbk4hjMFTbkdWOxfpqG29K8
 zUg2g8xNoFrNaHRMArtU6YIp8io7pJj/MxU8XIlo=
Received: by mx.zohomail.com with SMTPS id 1771597557804534.7027052118756;
 Fri, 20 Feb 2026 06:25:57 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 06/12] drm/tyr: add shmem backing for GEM objects
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260212013713.304343-7-deborah.brouwer@collabora.com>
Date: Fri, 20 Feb 2026 11:25:47 -0300
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 aliceryhl@google.com, boris.brezillon@collabora.com,
 beata.michalska@arm.com, lyude@redhat.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <A849CDE2-C257-42D7-9FD2-E9442A540264@collabora.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-7-deborah.brouwer@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[collabora.com:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[dri-devel];
	APPLE_MAILER_COMMON(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:mid,collabora.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: A1B8B168538
X-Rspamd-Action: no action



> On 11 Feb 2026, at 22:37, Deborah Brouwer =
<deborah.brouwer@collabora.com> wrote:
>=20
> Add support for GEM buffer objects backed by shared memory.
>=20
> This introduces the BoCreateArgs structure for passing creation =
parameters
> including flags, and adds a flags field to BoData. A =
new_dummy_object()
> helper is provided to create a dummy GEM object for use as a GPUVM =
root.
>=20
> The Bo type alias is added to simplify working with Tyr's shmem-backed
> GEM objects throughout the driver.
>=20
> Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
> drivers/gpu/drm/tyr/gem.rs | 52 ++++++++++++++++++++++++++++++++------
> 1 file changed, 44 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
> index c1208d332dea..6a58f2da88d3 100644
> --- a/drivers/gpu/drm/tyr/gem.rs
> +++ b/drivers/gpu/drm/tyr/gem.rs
> @@ -1,28 +1,64 @@
> // SPDX-License-Identifier: GPL-2.0 or MIT
> +//! GEM buffer object management for the Tyr driver.
> +//!
> +//! This module provides buffer object (BO) management functionality =
using
> +//! DRM's GEM subsystem with shmem backing.
>=20
> use kernel::{
>     drm::{
>         gem,
> +        gem::shmem,
>         DeviceContext, //
>     },
> -    prelude::*, //
> +    prelude::*,
> +    sync::aref::ARef, //
> };
>=20
> -use crate::driver::TyrDrmDriver;
> +use crate::driver::{
> +    TyrDrmDevice,
> +    TyrDrmDriver, //
> +};
>=20
> -/// GEM Object inner driver data
> +/// Tyr's DriverObject type for GEM objects.
> #[pin_data]
> -pub(crate) struct BoData {}
> +pub(crate) struct BoData {
> +    flags: u32,
> +}
> +
> +/// Provides a way to pass arguments when creating BoData
> +/// as required by the gem::DriverObject trait.
> +pub(crate) struct BoCreateArgs {
> +    flags: u32,
> +}
>=20
> impl gem::DriverObject for BoData {
>     type Driver =3D TyrDrmDriver;
> -    type Args =3D ();
> +    type Args =3D BoCreateArgs;
>=20
>     fn new<Ctx: DeviceContext>(
> -        _dev: &kernel::drm::Device<TyrDrmDriver, Ctx>,
> +        _dev: &TyrDrmDevice<Ctx>,

Unrelated change?

>         _size: usize,
> -        _args: (),
> +        args: BoCreateArgs,
>     ) -> impl PinInit<Self, Error> {
> -        try_pin_init!(BoData {})
> +        try_pin_init!(Self { flags: args.flags })
>     }
> }
> +
> +/// Type alias for Tyr GEM buffer objects.
> +pub(crate) type Bo =3D gem::shmem::Object<BoData>;
> +
> +/// Creates a dummy GEM object to serve as the root of a GPUVM.
> +#[expect(dead_code)]
> +pub(crate) fn new_dummy_object<Ctx: DeviceContext>(ddev: =
&TyrDrmDevice<Ctx>) -> Result<ARef<Bo>> {
> +    let bo =3D gem::shmem::Object::<BoData>::new(
> +        ddev,
> +        4096,
> +        shmem::ObjectConfig {
> +            map_wc: true,
> +            parent_resv_obj: None,
> +        },
> +        BoCreateArgs { flags: 0 },
> +    )?;
> +
> +    Ok(bo)
> +}
> --=20
> 2.52.0
>=20
>=20

