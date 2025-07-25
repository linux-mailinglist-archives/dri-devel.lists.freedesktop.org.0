Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F594B1236C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 19:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B5410EA04;
	Fri, 25 Jul 2025 17:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="A2b6XA90";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A7A10E22C;
 Fri, 25 Jul 2025 17:59:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1753466334; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=LEVbp08XDUjHJx6LqSj/JR6C0U4IOqrKt0NQUWCe3t0mGTC+F21+aKa0erdm9ikHqCH2GdiEZWsjogRGwzhA8luGaCga00jfsTtIsFRaixAmxya4vzuy1qSDct2iMz/GsiTSOEKUHSt3mZzAUUrP8ePQZEZxKS89NwZHwxvDAgA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1753466334;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=l31wQX4Qp56LM69Cz12Yc9TZ5vpJYHQo6jJk4RUyqRA=; 
 b=kMEUaXqFLHxTyuLNM8HXFDM0Jf1JRWzea07ZQmcjRxtAIuRaJsXGOoz4FTYEDBcBgprMgunHkdcR93strb78cIhPFffVF6vg7SeUTQQe3MZksmSZrzadS0Il4lCxvomeLsdCY6BtkmiQmdkm47sTkDMnTdh7lg+eRCpNLVOakQY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753466334; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=l31wQX4Qp56LM69Cz12Yc9TZ5vpJYHQo6jJk4RUyqRA=;
 b=A2b6XA90vN6vHst1GDSIhGSy5V41kO/+UiJkmaLT87srgn3dWIQRe/35S4H+Dx5l
 l2TKkAshs7DO8yExwrX/V5yqzfOGYn0/KEeH31aEfUyeftyE97C/yY83tZX0FCH/Gow
 KlyNuYQvsMx33ZyPhvs4XJJdbKRnDE9aP1Wm0HN0=
Received: by mx.zohomail.com with SMTPS id 1753466331952608.3524594357607;
 Fri, 25 Jul 2025 10:58:51 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v2 13/19] gpu: nova-core: register: split @io rule into
 fixed and relative versions
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250718-nova-regs-v2-13-7b6a762aa1cd@nvidia.com>
Date: Fri, 25 Jul 2025 14:58:37 -0300
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <45B18878-7472-4AFD-88FB-BDE80FAF5EE3@collabora.com>
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
 <20250718-nova-regs-v2-13-7b6a762aa1cd@nvidia.com>
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
> We used the same @io rule with different patterns to define both the
> fixed and relative I/O accessors. This can be confusing as the =
matching
> rules are very similar.
>=20
> Since all call sites know which version they want to call, split @io
> into @io_fixed and @io_relative to remove any ambiguity.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> drivers/gpu/nova-core/regs/macros.rs | 12 ++++++------
> 1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/nova-core/regs/macros.rs =
b/drivers/gpu/nova-core/regs/macros.rs
> index =
f0942dc29210f703fddd4d86b758173f75b3477a..bfa0220050d4ba03c9fcd75c9be1ed8d=
baa4f290 100644
> --- a/drivers/gpu/nova-core/regs/macros.rs
> +++ b/drivers/gpu/nova-core/regs/macros.rs
> @@ -89,25 +89,25 @@ macro_rules! register {
>     // Creates a register at a fixed offset of the MMIO space.
>     ($name:ident @ $offset:literal $(, $comment:literal)? { =
$($fields:tt)* } ) =3D> {
>         register!(@core $name $(, $comment)? { $($fields)* } );
> -        register!(@io $name @ $offset);
> +        register!(@io_fixed $name @ $offset);
>     };
>=20
>     // Creates an alias register of fixed offset register `alias` with =
its own fields.
>     ($name:ident =3D> $alias:ident $(, $comment:literal)? { =
$($fields:tt)* } ) =3D> {
>         register!(@core $name $(, $comment)? { $($fields)* } );
> -        register!(@io $name @ $alias::OFFSET);
> +        register!(@io_fixed $name @ $alias::OFFSET);
>     };
>=20
>     // Creates a register at a relative offset from a base address.
>     ($name:ident @ + $offset:literal $(, $comment:literal)? { =
$($fields:tt)* } ) =3D> {
>         register!(@core $name $(, $comment)? { $($fields)* } );
> -        register!(@io $name @ + $offset);
> +        register!(@io_relative $name @ + $offset);
>     };
>=20
>     // Creates an alias register of relative offset register `alias` =
with its own fields.
>     ($name:ident =3D> + $alias:ident $(, $comment:literal)? { =
$($fields:tt)* } ) =3D> {
>         register!(@core $name $(, $comment)? { $($fields)* } );
> -        register!(@io $name @ + $alias::OFFSET);
> +        register!(@io_relative $name @ + $alias::OFFSET);
>     };
>=20
>     // All rules below are helpers.
> @@ -342,7 +342,7 @@ fn default() -> Self {
>     };
>=20
>     // Generates the IO accessors for a fixed offset register.
> -    (@io $name:ident @ $offset:expr) =3D> {
> +    (@io_fixed $name:ident @ $offset:expr) =3D> {
>         #[allow(dead_code)]
>         impl $name {
>             pub(crate) const OFFSET: usize =3D $offset;
> @@ -380,7 +380,7 @@ pub(crate) fn alter<const SIZE: usize, T, F>(
>     };
>=20
>     // Generates the IO accessors for a relative offset register.
> -    (@io $name:ident @ + $offset:literal) =3D> {
> +    (@io_relative $name:ident @ + $offset:literal) =3D> {
>         #[allow(dead_code)]
>         impl $name {
>             pub(crate) const OFFSET: usize =3D $offset;
>=20
> --=20
> 2.50.1
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

