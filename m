Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C1CB1233C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 19:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 549C510E9FB;
	Fri, 25 Jul 2025 17:49:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="WfkPD5PH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D5A10E383;
 Fri, 25 Jul 2025 17:49:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1753465764; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=kvYg6N2ZoJIXxduKMoPHwdjd1xqRAN62MLvcUVzavG+mvwbt2xGvavJGx0iTsrwpkCHfCvFWeVf7vhlHkF4YOtHWSEhxii67hURhbann3esN40vyQ+As7iLfNpmnz1aFWsG5rt0coLeU98jqdBcVq6Tt0qe0O34O7shrcs6b2H0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1753465764;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=2Xwr8x+BKUfSlLKO3O+ng3v4MJ3vSU0Ctp+7wpnQ0qs=; 
 b=k2Z14keX7UvYBb8mwJzAUzxqWE5NHR99CN8NZ44Ut7UuJcVfeWmIIRQODzsVE8qslv3nvWr6BFNeb4+T2VvaJQ+9CZylFM29ngdj3NcPBLFfsZx1Thn6H+AFZFAhINAznfpAJYZePocD7cXnP5DT8BzZwBxaOGpMpij51undEhI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753465764; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=2Xwr8x+BKUfSlLKO3O+ng3v4MJ3vSU0Ctp+7wpnQ0qs=;
 b=WfkPD5PHmKFfD+wGtklw8Rz+QGPx9vifm3NRfHVBB9cRUwhMSR5MQY8utpSCYXz2
 HatZ3AN6Z2/wUdmw6rGz23/MLkVu1KlclPjTlDdToJasGsi+KbgHT0zuZTAG9oRXXpV
 rHzRCZvvN36hxXB1J3jdnu1vNYPGPwpju6m9x+EQ=
Received: by mx.zohomail.com with SMTPS id 1753465762422919.5367130253645;
 Fri, 25 Jul 2025 10:49:22 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v2 11/19] gpu: nova-core: register: improve `Debug`
 implementation
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250718-nova-regs-v2-11-7b6a762aa1cd@nvidia.com>
Date: Fri, 25 Jul 2025 14:49:08 -0300
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <4E14EE9C-727F-49D4-AE01-96CB101705C5@collabora.com>
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
 <20250718-nova-regs-v2-11-7b6a762aa1cd@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
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



> On 18 Jul 2025, at 04:26, Alexandre Courbot <acourbot@nvidia.com> =
wrote:
>=20
> Now that we have an internal rule to dispatch field information where
> needed, use it to generate a better `Debug` implementation where the =
raw
> hexadecimal value of the register is displayed, as well as the `Debug`
> values of its individual fields.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> drivers/gpu/nova-core/regs/macros.rs | 25 +++++++++++++++----------
> 1 file changed, 15 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/nova-core/regs/macros.rs =
b/drivers/gpu/nova-core/regs/macros.rs
> index =
8b081242595de620cbf94b405838a2dac67b8e83..485cac806e4a6578059c657f3b31f15e=
361becbd 100644
> --- a/drivers/gpu/nova-core/regs/macros.rs
> +++ b/drivers/gpu/nova-core/regs/macros.rs
> @@ -122,16 +122,6 @@ macro_rules! register {
>         #[derive(Clone, Copy, Default)]
>         pub(crate) struct $name(u32);
>=20
> -        // TODO[REGA]: display the raw hex value, then the value of =
all the fields. This requires
> -        // matching the fields, which will complexify the syntax =
considerably...
> -        impl ::core::fmt::Debug for $name {
> -            fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> =
::core::fmt::Result {
> -                f.debug_tuple(stringify!($name))
> -                    .field(&format_args!("0x{0:x}", &self.0))
> -                    .finish()
> -            }
> -        }
> -
>         impl ::core::ops::BitOr for $name {
>             type Output =3D Self;
>=20
> @@ -171,6 +161,7 @@ fn from(reg: $name) -> u32 {
>             ;
>             )*
>         });
> +        register!(@debug $name { $($field;)* });
>     };
>=20
>     // Defines all the field getter/methods methods for `$name`.
> @@ -316,6 +307,20 @@ pub(crate) fn [<set_ $field>](mut self, value: =
$to_type) -> Self {
>         );
>     };
>=20
> +    // Generates the `Debug` implementation for `$name`.
> +    (@debug $name:ident { $($field:ident;)* }) =3D> {
> +        impl ::core::fmt::Debug for $name {
> +            fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> =
::core::fmt::Result {
> +                f.debug_struct(stringify!($name))
> +                    .field("<raw>", &format_args!("{:#x}", &self.0))
> +                $(
> +                    .field(stringify!($field), &self.$field())
> +                )*
> +                    .finish()
> +            }
> +        }
> +    };
> +
>     // Generates the IO accessors for a fixed offset register.
>     (@io $name:ident @ $offset:expr) =3D> {
>         #[allow(dead_code)]
>=20
> --=20
> 2.50.1
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

