Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3EB6C794C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 09:03:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD4710EA82;
	Fri, 24 Mar 2023 08:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27C410E108
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 19:58:07 +0000 (UTC)
Date: Wed, 22 Mar 2023 19:57:52 +0000
Authentication-Results: mail-4321.protonmail.ch;
 dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="ABEn4U7/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1679515081; x=1679774281;
 bh=UVSIlOSQs/wWnbHXrGuJbwOcIORwLRycLFl1rX3zhy0=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=ABEn4U7/bhUYzi02ef4auAdWZ2mvcGdU1Sj7D+ITYTJ1sKhG80qv/5/ZFlrE5uR/7
 PB1McPDE4nhBM4VEnZWK/YUUFFjs5tI3ZwTA+a0++MFXC0Wi2zYtIZkMZqUA2Qm8Ka
 boB8mYGm0EXUj2nCwK8mvVPIrTQgB2szLnaVhVICFUzocxyfvkfOphzpVcRchn2XJX
 L91yqk5h+ZsuK/mtBUgJZszEwrSscAcZS6MsbBXZId53FlrURvzWR8gpOjs9Yxw/ij
 xMmWhxqcTxQdZj4v/sz6h2sJGNRjpBLlm1tji3MTQhi42C6LTS4cHDetYXDM39KyYm
 8prhrmVMEW/6w==
To: =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
From: =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
Subject: Re: [RFC PATCH 2/9] rust: drm: gem: add method to return DmaResv from
 GEMObject
Message-ID: <WENj4NV4lBApL7fmZeHMIenxaW7Lq7Y6ksqnxHMOI8Sm2p-JrJgpccljUEIDTDhRUiWf39U5lr0pX6szVchMNQZVyLNW-E1tV1lVrLKWIkg=@protonmail.com>
In-Reply-To: <kUn0Ms6i7sC5-okmT2pJ5OPhQ8bwDPmuTB8UfKJQBTZUN2veEF3w0awEwLF1Z4-XtoiT7qJTMiTMF6uXBqAxvHHd4BH6q3ty2bh12ci23Vs=@protonmail.com>
References: <20230317121213.93991-1-mcanal@igalia.com>
 <20230317121213.93991-3-mcanal@igalia.com>
 <kUn0Ms6i7sC5-okmT2pJ5OPhQ8bwDPmuTB8UfKJQBTZUN2veEF3w0awEwLF1Z4-XtoiT7qJTMiTMF6uXBqAxvHHd4BH6q3ty2bh12ci23Vs=@protonmail.com>
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
 Boqun Feng <boqun.feng@gmail.com>,
 =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Miguel Ojeda <ojeda@kernel.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, March 22nd, 2023 at 20:45, Bj=C3=B6rn Roy Baron <bjorn3_gh@pr=
otonmail.com> wrote:

> On Friday, March 17th, 2023 at 13:12, Ma=C3=ADra Canal <mcanal@igalia.com=
> wrote:
>=20
> > A GEMObject, related to struct drm_gem_object, holds a pointer
> > to reservation object associated with the this GEM object. Therefore,
> > expose this reservation object through the DmaResv safe abstraction.
> >
> > Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> > ---
> >  rust/kernel/drm/gem/mod.rs | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> > index c4a42bb2f718..dae95e5748a7 100644
> > --- a/rust/kernel/drm/gem/mod.rs
> > +++ b/rust/kernel/drm/gem/mod.rs
> > @@ -11,6 +11,7 @@ use alloc::boxed::Box;
> >
> >  use crate::{
> >      bindings,
> > +    dma_resv::DmaResv,
> >      drm::{device, drv, file},
> >      error::{to_result, Result},
> >      prelude::*,
> > @@ -136,6 +137,12 @@ pub trait BaseObject: IntoGEMObject {
> >          self.gem_obj().size
> >      }
> >
> > +    /// Returns the pointer to reservation object associated with this=
 GEM object.
> > +    fn resv(&self) -> DmaResv {
> > +        // SAFETY: Every GEM object holds a reference to a reservation=
 object
> > +        unsafe { DmaResv::from_raw(self.gem_obj().resv) }
> > +    }
>=20
> There is nothing ensuring that DmaResv doesn't outlive self and thus may =
have been deallocated. You could change DmaResv to be a newtype around Unsa=
feCell<dma_resv> and then return an &DmaResv here. This way &DmaResv can't =
outlive &self.

Actually Opaque<dma_resv> may be better as no fields of dma_resv are used o=
n the rust side.

>=20
> > +
> >      /// Sets the exportable flag, which controls whether the object ca=
n be exported via PRIME.
> >      fn set_exportable(&mut self, exportable: bool) {
> >          self.mut_gem_obj().exportable =3D exportable;
> > --
> > 2.39.2
>=20
> Cheers,
> Bjorn

Cheers,
Bjorn
