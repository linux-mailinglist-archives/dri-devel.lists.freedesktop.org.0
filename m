Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cG6HMEpQlGktCQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 12:26:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2603E14B554
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 12:26:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D157C10E217;
	Tue, 17 Feb 2026 11:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nwAYnkE4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D6A10E217;
 Tue, 17 Feb 2026 11:25:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1F00260128;
 Tue, 17 Feb 2026 11:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E32ECC4CEF7;
 Tue, 17 Feb 2026 11:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771327557;
 bh=rhJDnIDYzVy7Nc6zkFeLuiD/FS3qE8b5GNKN0t7ske8=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=nwAYnkE49RMSxo4ckBFYQgkSuFeY5+Ic/TTqMvZIKN65I1zSEqsOGfyDgXYt1ry42
 6+6IBq1ZYR6EC/TY5aEFM+92BxB5y9dE/BSeQSCRk18+onhJprXGEo0Bm2Pd9UESFJ
 4KBlRHZ8wH2k7ivOquqApb8kjew/mSwSKTcKrkjlS+6orsxvdTn+1dWPBzoFZxYKOy
 ryK1PzGoXiOMj7RiB3n5tMOdCk4Q7MyHmCrthybZralcIz91Cd+kKhgolehtvp10SB
 ILUE6S4SAfgq/gVLIEGPoOIuzRoHaItzsayjFV/NKUAYdcGXKOHpkDuiCWrbk95xZU
 dUnsdAQ5/+HIg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 12:25:53 +0100
Message-Id: <DGH77OGW8BFR.2NV0GJ1890DPF@kernel.org>
Subject: Re: [PATCH v3 7/8] gpu: nova-core: use core library's CStr instead
 of kernel one
Cc: "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Lyude
 Paul" <lyude@redhat.com>, "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260217-nova-misc-v3-0-b4e2d45eafbc@nvidia.com>
 <20260217-nova-misc-v3-7-b4e2d45eafbc@nvidia.com>
In-Reply-To: <20260217-nova-misc-v3-7-b4e2d45eafbc@nvidia.com>
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
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[google.com,gmail.com,ffwll.ch,nvidia.com,lists.freedesktop.org,vger.kernel.org,redhat.com,garyguo.net];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 2603E14B554
X-Rspamd-Action: no action

On Tue Feb 17, 2026 at 3:45 AM CET, Alexandre Courbot wrote:
> The kernel's own CStr type has been replaced by the one in the core
> library, and is now an alias to the latter. Change our imports to
> directly reference the actual type.
>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware.rs     | 2 +-
>  drivers/gpu/nova-core/firmware/gsp.rs | 6 +++++-
>  drivers/gpu/nova-core/nova_core.rs    | 2 +-
>  3 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/fi=
rmware.rs
> index 68779540aa28..2f7249383e51 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -424,7 +424,7 @@ const fn make_entry_chipset(self, chipset: &str) -> S=
elf {
>      }
> =20
>      pub(crate) const fn create(
> -        module_name: &'static kernel::str::CStr,
> +        module_name: &'static core::ffi::CStr,
>      ) -> firmware::ModInfoBuilder<N> {
>          let mut this =3D Self(firmware::ModInfoBuilder::new(module_name)=
);
>          let mut i =3D 0;
> diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-cor=
e/firmware/gsp.rs
> index 9488a626352f..ae3f6581c5b6 100644
> --- a/drivers/gpu/nova-core/firmware/gsp.rs
> +++ b/drivers/gpu/nova-core/firmware/gsp.rs
> @@ -32,9 +32,13 @@
>  /// that scheme before nova-core becomes stable, which means this module=
 will eventually be
>  /// removed.
>  mod elf {
> +    use core::{
> +        ffi::CStr,
> +        mem::size_of, //
> +    };
> +
>      use kernel::{
>          bindings,
> -        prelude::*,
>          transmute::FromBytes, //
>      };

What's the improvement in this change? Both of the ones factored out are al=
ready
correctly imported through prelude. Let's keep it as is.

> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/n=
ova_core.rs
> index c1121e7c64c5..b5caf1044697 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -18,7 +18,7 @@
>  mod sbuffer;
>  mod vbios;
> =20
> -pub(crate) const MODULE_NAME: &kernel::str::CStr =3D <LocalModule as ker=
nel::ModuleMetadata>::NAME;
> +pub(crate) const MODULE_NAME: &core::ffi::CStr =3D <LocalModule as kerne=
l::ModuleMetadata>::NAME;
> =20
>  kernel::module_pci_driver! {
>      type: driver::NovaCore,
>
> --=20
> 2.53.0

