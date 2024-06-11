Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5F8904067
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 17:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2ADF10E697;
	Tue, 11 Jun 2024 15:46:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VibAaU87";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C0B910E681;
 Tue, 11 Jun 2024 15:46:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4680160F00;
 Tue, 11 Jun 2024 15:46:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5B30C4AF53;
 Tue, 11 Jun 2024 15:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718120810;
 bh=7Q8EYfT2yYWno5JvwY7yHxi7BODOc8t+N4Cv0BJ3y1A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VibAaU877OJhw/xWEQarGFauNAaLoPTRm7kiONSpmK7Vwz81evoQ49TbMAcoVYWtm
 k93F2BSHQPO+kfOGitb6sWUHlwRryanMq229pYZycRSwAt6ImbbhNF3R56qotaBu5R
 JFQ9+74k7X7Wl4HoBJLsp/HE/iCfIyW6uLWZCgMxCH0wfe6GyJOMcKZm0sZr9Ilkgm
 juPzhGQTu6X4XGaiREouJveo/Ue0YZ+JiVx79ptJwlBWaNrNaxNKo5Xzms0HpbGx7w
 i/Yvbk5DqEt6bjvO08/BAzW235cjKD+JtRDQsoBht2eItJ7buvmF3kSk5ACYYfJJZU
 PWQtcbIpMRfZA==
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-52c819f6146so1600891e87.1; 
 Tue, 11 Jun 2024 08:46:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX9xy+232qV4vY8+0+qnUv1svGLvTiPGoyjagcaqXd9ltRzCdiJLRlv2cBbA5qEliGTsQkqGmzCGEDXdAnKsGp0C0VScO34gFYMlL/FVRZPV42+XwBh4DdPB6YeXzbaRGrCSes+5QsB+ZGDMNsrqg==
X-Gm-Message-State: AOJu0YzrR4SaLWl3iQ2sjm2T66jvroGVl2q8rA1s0Me/+qNKhQQkjvlR
 ya2z8hQQL/2drazCd9A7zs9zJtjoqOsAF/gmuIuhUdCTMYSFS4Q0GQh2tfzVJtWb8wj/9SfzIXt
 3dNWr61WLZ9Z7/obQwMjN37xGUg==
X-Google-Smtp-Source: AGHT+IFx3kwL+4lnpKgK+dz83tXodIju037np6QGjras/ITiUXQ5EcTtwkbuGjNnLsANd4GB8aIL9jlXqg1ID9iFlKE=
X-Received: by 2002:ac2:4bcd:0:b0:52c:78fa:453 with SMTP id
 2adb3069b0e04-52c78fa05a5mr7404319e87.19.1718120809006; Tue, 11 Jun 2024
 08:46:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240520172059.181256-1-dakr@redhat.com>
 <20240520172059.181256-4-dakr@redhat.com>
 <20240521212333.GA731457-robh@kernel.org>
 <641bda93-35f3-429e-b627-a9485505b6bf@asahilina.net>
In-Reply-To: <641bda93-35f3-429e-b627-a9485505b6bf@asahilina.net>
From: Rob Herring <robh@kernel.org>
Date: Tue, 11 Jun 2024 09:46:35 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLtGxyEymhuzb6HW85sunppYkKri9YsRpL31paVsB55zA@mail.gmail.com>
Message-ID: <CAL_JsqLtGxyEymhuzb6HW85sunppYkKri9YsRpL31paVsB55zA@mail.gmail.com>
Subject: Re: [RFC PATCH 3/8] rust: drm: Add Device and Driver abstractions
To: Asahi Lina <lina@asahilina.net>
Cc: Danilo Krummrich <dakr@redhat.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org, 
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com, 
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
 a.hindborg@samsung.com, aliceryhl@google.com, fujita.tomonori@gmail.com, 
 pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, 
 gregkh@linuxfoundation.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sat, Jun 8, 2024 at 11:16=E2=80=AFPM Asahi Lina <lina@asahilina.net> wro=
te:
>
>
>
> On 5/22/24 6:23 AM, Rob Herring wrote:
> > On Mon, May 20, 2024 at 07:20:50PM +0200, Danilo Krummrich wrote:
> >> From: Asahi Lina <lina@asahilina.net>
> >>
> >> Add abstractions for DRM drivers and devices. These go together in one
> >> commit since both are fairly tightly coupled types.
> >>
> >> A few things have been stubbed out, to be implemented as further bits =
of
> >> the DRM subsystem are introduced.
> >>
> >> Signed-off-by: Asahi Lina <lina@asahilina.net>
> >> Co-developed-by: Danilo Krummrich <dakr@redhat.com>
> >> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> >> ---
> >>  rust/bindings/bindings_helper.h |   2 +
> >>  rust/kernel/drm/device.rs       |  87 +++++++++
> >>  rust/kernel/drm/drv.rs          | 318 +++++++++++++++++++++++++++++++=
+
> >>  rust/kernel/drm/mod.rs          |   2 +
> >>  4 files changed, 409 insertions(+)
> >>  create mode 100644 rust/kernel/drm/device.rs
> >>  create mode 100644 rust/kernel/drm/drv.rs
> >
> > [...]
> >
> >> diff --git a/rust/kernel/drm/drv.rs b/rust/kernel/drm/drv.rs
> >> new file mode 100644
> >> index 000000000000..5dd8f3f8df7c
> >> --- /dev/null
> >> +++ b/rust/kernel/drm/drv.rs
> >> @@ -0,0 +1,318 @@
> >> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> >> +
> >> +//! DRM driver core.
> >> +//!
> >> +//! C header: [`include/linux/drm/drm_drv.h`](../../../../include/lin=
ux/drm/drm_drv.h)
> >> +
> >> +use crate::{
> >> +    alloc::flags::*,
> >> +    bindings, device, drm,
> >> +    error::code::*,
> >> +    error::{Error, Result},
> >> +    prelude::*,
> >> +    private::Sealed,
> >> +    str::CStr,
> >> +    types::{ARef, ForeignOwnable},
> >> +    ThisModule,
> >> +};
> >> +use core::{
> >> +    marker::{PhantomData, PhantomPinned},
> >> +    pin::Pin,
> >> +};
> >> +use macros::vtable;
> >> +
> >> +/// Driver use the GEM memory manager. This should be set for all mod=
ern drivers.
> >> +pub const FEAT_GEM: u32 =3D bindings::drm_driver_feature_DRIVER_GEM;
> >> +/// Driver supports mode setting interfaces (KMS).
> >> +pub const FEAT_MODESET: u32 =3D bindings::drm_driver_feature_DRIVER_M=
ODESET;
> >> +/// Driver supports dedicated render nodes.
> >> +pub const FEAT_RENDER: u32 =3D bindings::drm_driver_feature_DRIVER_RE=
NDER;
> >> +/// Driver supports the full atomic modesetting userspace API.
> >> +///
> >> +/// Drivers which only use atomic internally, but do not support the =
full userspace API (e.g. not
> >> +/// all properties converted to atomic, or multi-plane updates are no=
t guaranteed to be tear-free)
> >> +/// should not set this flag.
> >> +pub const FEAT_ATOMIC: u32 =3D bindings::drm_driver_feature_DRIVER_AT=
OMIC;
> >> +/// Driver supports DRM sync objects for explicit synchronization of =
command submission.
> >> +pub const FEAT_SYNCOBJ: u32 =3D bindings::drm_driver_feature_DRIVER_S=
YNCOBJ;
> >> +/// Driver supports the timeline flavor of DRM sync objects for expli=
cit synchronization of command
> >> +/// submission.
> >> +pub const FEAT_SYNCOBJ_TIMELINE: u32 =3D bindings::drm_driver_feature=
_DRIVER_SYNCOBJ_TIMELINE;
> >
> > This is missing an entry for DRIVER_GEM_GPUVA. And some others perhaps.
> > I suppose some are legacy which won't be needed any time soon if ever.
> > Not sure if you intend for this to be complete, or you are just adding
> > what you are using? Only FEAT_GEM is used by nova ATM.
> >
>
> This was developed before DRIVER_GEM_GPUVA existed ^^
>
> I have this in my branch since I'm using the GPUVA manager now.

TBC, I'm using it as well, not just providing drive-by comments. I'm
starting to look at converting panthor to rust.

> Danilo,
> what tree are you using for this submission? It would be good to
> coordinate this and try to keep the WIP branches from diverging too much.=
..

Yes, please!

Besides asahi of course, there's several people[1][2][3] using the
platform and DT abstractions and we're all rebasing those. I'd
volunteer to maintain, but I don't know rust well enough yet to even
be dangerous... :)

Rob

[1] https://lore.kernel.org/all/cover.1717750631.git.viresh.kumar@linaro.or=
g/
[2] https://lore.kernel.org/all/20240322221305.1403600-1-lyude@redhat.com/
[3] https://lore.kernel.org/all/CAPFo5VLoYGq_OgC5dqcueTyymuSCsLpjasLZnKO1jp=
Y6gV7s2g@mail.gmail.com/
