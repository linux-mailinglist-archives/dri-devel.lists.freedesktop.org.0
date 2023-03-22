Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB516C794E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 09:03:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0CE510EB80;
	Fri, 24 Mar 2023 08:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0A110E1FF
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 19:45:46 +0000 (UTC)
Date: Wed, 22 Mar 2023 19:45:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1679514343; x=1679773543;
 bh=/v9oDE916vQI/IBBeEPmllUZ4S7M1LCi5CtPdEJwk9c=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=Iy/Z9x2RKCW3uFBwqlb6XCBDufnSgpVe2ku0e4B8/jlgOnocF9rSWiFWB7hk2F8xu
 dAZFFtFk97ts3oIquYDFeiSiuhOxkJ9Cq4TeDkVBb5hqJUPPpFznQQKwHK+P/js0OY
 y3FUwpGU6KFnOxri5s/c5RBYcmAAwkyRy2Buf9OS2kTb+fq8n+fCXNQKvVm+MI+cDH
 ed1D3ba7SH1l8O9c/eB0tQElFqyy7cvbenM7qlSw6dBKp/xw/ho1znGfDfyF9GDmg9
 Tq8VnUSgg5jcZmqjWEgL9szCjTu7bfpYrEvULLGrmfkzn/mUUE/kmq3wfAvKyA2KCk
 inzzGCew1cF4g==
To: =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
From: =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
Subject: Re: [RFC PATCH 2/9] rust: drm: gem: add method to return DmaResv from
 GEMObject
Message-ID: <kUn0Ms6i7sC5-okmT2pJ5OPhQ8bwDPmuTB8UfKJQBTZUN2veEF3w0awEwLF1Z4-XtoiT7qJTMiTMF6uXBqAxvHHd4BH6q3ty2bh12ci23Vs=@protonmail.com>
In-Reply-To: <20230317121213.93991-3-mcanal@igalia.com>
References: <20230317121213.93991-1-mcanal@igalia.com>
 <20230317121213.93991-3-mcanal@igalia.com>
Feedback-ID: 27884398:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 24 Mar 2023 08:03:32 +0000
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
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Gary Guo <gary@garyguo.net>,
 Alex Gaynor <alex.gaynor@gmail.com>, Asahi Lina <lina@asahilina.net>,
 Boqun Feng <boqun.feng@gmail.com>, Melissa Wen <mwen@igalia.com>,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Miguel Ojeda <ojeda@kernel.org>, Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, March 17th, 2023 at 13:12, Ma=C3=ADra Canal <mcanal@igalia.com> =
wrote:

> A GEMObject, related to struct drm_gem_object, holds a pointer
> to reservation object associated with the this GEM object. Therefore,
> expose this reservation object through the DmaResv safe abstraction.
>=20
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
>  rust/kernel/drm/gem/mod.rs | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index c4a42bb2f718..dae95e5748a7 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -11,6 +11,7 @@ use alloc::boxed::Box;
>=20
>  use crate::{
>      bindings,
> +    dma_resv::DmaResv,
>      drm::{device, drv, file},
>      error::{to_result, Result},
>      prelude::*,
> @@ -136,6 +137,12 @@ pub trait BaseObject: IntoGEMObject {
>          self.gem_obj().size
>      }
>=20
> +    /// Returns the pointer to reservation object associated with this G=
EM object.
> +    fn resv(&self) -> DmaResv {
> +        // SAFETY: Every GEM object holds a reference to a reservation o=
bject
> +        unsafe { DmaResv::from_raw(self.gem_obj().resv) }
> +    }

There is nothing ensuring that DmaResv doesn't outlive self and thus may ha=
ve been deallocated. You could change DmaResv to be a newtype around Unsafe=
Cell<dma_resv> and then return an &DmaResv here. This way &DmaResv can't ou=
tlive &self.

> +
>      /// Sets the exportable flag, which controls whether the object can =
be exported via PRIME.
>      fn set_exportable(&mut self, exportable: bool) {
>          self.mut_gem_obj().exportable =3D exportable;
> --
> 2.39.2

Cheers,
Bjorn
