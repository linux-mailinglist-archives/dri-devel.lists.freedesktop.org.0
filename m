Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3EBA81758
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 23:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E00E10E75C;
	Tue,  8 Apr 2025 21:01:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=faith.ekstrand@collabora.com header.b="G3J0Oex3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C52B810E754
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 21:01:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1744146062; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=EQks7Bv8d2UdrSawDt2dWOQyo8IoqBw7ojBFq+BgjhUZqKDUEV4ofWczycY5iHBgv/Rs04lIKCOTn079IbNABptU08ErzJ5/BsNagShDjCzbMoVhpK8wNWMZxd4tY6pXJx1S3YyBHCWFVfFCxvLap4PD/984+O6S/3VmtZ02clg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1744146062;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=SF967SzPpGB/OVACj9XanjxbF6BOKb5BX4J3U1yadEc=; 
 b=Ri+0qKp8pRJ6EO2sPY7LWwmzz7EZPs0V8R1cw4uIwz31d+NXzTULDFtV+ykYE+G3ZKr7y33DB+kQBLg0GYx6TOiY6UaLYUgb8tBssDOMFvN8kAB6+fiegRNl9H8woyVRyoLHkGu6k/L3G9LfgQQVvyuilH3NH+sHb1JXuLF303k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=faith.ekstrand@collabora.com;
 dmarc=pass header.from=<faith.ekstrand@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744146062; 
 s=zohomail; d=collabora.com; i=faith.ekstrand@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=SF967SzPpGB/OVACj9XanjxbF6BOKb5BX4J3U1yadEc=;
 b=G3J0Oex3ls4ugjB29rIeMkhxvMg/C1EtSpatumMUN5oqN84mImQvV1AGrszDaXaG
 kdT/xsaHGqzEugzqeW+GFVXq+/fT32GCBNXLoGZBC0dc4eOgiUKpLmCRkuP6Osrg3ri
 /wdnffXwhFLRsNgvSUIP6mjPFPtGFT+bVEBC08hc=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1744146061554443.774042461307;
 Tue, 8 Apr 2025 14:01:01 -0700 (PDT)
Date: Tue, 08 Apr 2025 16:01:01 -0500
From: Faith Ekstrand <faith.ekstrand@collabora.com>
To: "Alyssa Rosenzweig" <alyssa@rosenzweig.io>
Cc: "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?UTF-8?Q?=22Bj=C3=B6rn_Roy_Baron=22?= <bjorn3_gh@protonmail.com>,
 "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Janne Grunau" <j@jannau.net>,
 "Sven Peter" <sven@svenpeter.dev>, "Jonathan Corbet" <corbet@lwn.net>,
 "Sergio Lopez Pascual" <slp@sinrega.org>,
 "Ryan Houdek" <sonicadvance1@gmail.com>,
 "linux-kernel" <linux-kernel@vger.kernel.org>,
 "dri-devel" <dri-devel@lists.freedesktop.org>,
 "rust-for-linux" <rust-for-linux@vger.kernel.org>,
 "asahi" <asahi@lists.linux.dev>,
 "linux-arm-kernel" <linux-arm-kernel@lists.infradead.org>,
 "linux-doc" <linux-doc@vger.kernel.org>, "Asahi Lina" <lina@asahilina.net>,
 "Simona Vetter" <simona.vetter@ffwll.ch>, "Neal Gompa" <neal@gompa.dev>
Message-ID: <1961734d89c.c74897d6162218.3078455122191318746@collabora.com>
In-Reply-To: <20250408-agx-uapi-v7-1-ad122d4f7324@rosenzweig.io>
References: <20250408-agx-uapi-v7-1-ad122d4f7324@rosenzweig.io>
Subject: Re: [PATCH v7] drm: Add UAPI for the Asahi driver
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
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

---- On Tue, 08 Apr 2025 15:54:14 -0500 Alyssa Rosenzweig  wrote ---

 > This adds the UAPI for the Asahi driver targeting the GPU in the Apple=
=20
 > M1 and M2 series systems on chip. The UAPI design is based on other=20
 > modern Vulkan-capable drivers, including Xe and Panthor. Memory=20
 > management is based on explicit VM management. Synchronization is=20
 > exclusively explicit sync.=20
 > =20
 > This UAPI is validated against our open source Mesa stack, which is=20
 > fully conformant to the OpenGL 4.6, OpenGL ES 3.2, OpenCL 3.0, and=20
 > Vulkan 1.4 standards. The Vulkan driver supports sparse, exercising the=
=20
 > VM_BIND mechanism.=20
 > =20
 > This patch adds the standalone UAPI header. It is implemented by an open=
=20
 > source DRM driver written in Rust. We fully intend to upstream this=20
 > driver when possible. However, as a production graphics driver, it=20
 > depends on a significant number of Rust abstractions that will take a=20
 > long time to upstream. In the mean time, our userspace is upstream in=20
 > Mesa but is not allowed to probe with upstream Mesa as the UAPI is not=
=20
 > yet reviewed and merged in the upstream kernel. Although we ship a=20
 > patched Mesa in Fedora Asahi Remix, any containers shipping upstream=20
 > Mesa builds are broken for our users, including upstream Flatpak and=20
 > Waydroid runtimes. Additionally, it forces us to maintain forks of Mesa=
=20
 > and virglrenderer, which complicates bisects.=20
 > =20
 > The intention in sending out this patch is for this UAPI to be=20
 > thoroughly reviewed. Once we as the DRM community are satisfied with the=
=20
 > UAPI, this header lands signifying that the UAPI is stable and must only=
=20
 > be evolved in backwards-compatible ways; it will be the UAPI implemented=
=20
 > in the DRM driver that eventually lands upstream. That promise lets us=
=20
 > enable upstream Mesa, solving all these issues while the upstream Rust=
=20
 > abstractions are developed.=20
 > =20
 > https://github.com/alyssarosenzweig/linux/commits/agx-uapi-v7 contains=
=20
 > the DRM driver implementing this proposed UAPI.=20
 > =20
 > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33984 contains=
=20
 > the Mesa patches to implement this proposed UAPI.=20
 > =20
 > That Linux and Mesa branch together give a complete graphics/compute=20
 > stack on top of this UAPI.=20
 > =20
 > Co-developed-by: Asahi Lina lina@asahilina.net>=20
 > Signed-off-by: Asahi Lina lina@asahilina.net>=20
 > Acked-by: Simona Vetter simona.vetter@ffwll.ch>=20
 > Reviewed-by: Neal Gompa neal@gompa.dev>=20
 > Reviewed-by: Janne Grunau j@jannau.net>=20
 > Signed-off-by: Alyssa Rosenzweig alyssa@rosenzweig.io>=20

Reviewed-by: Faith Ekstrand <faith.ekstrand@collabora.com>

 > ---=20
 > Changes in v7:=20
 > - Drop non-arrayed binds. This simplifies both kernel and Mesa handling,=
=20
 >  at a trivial perf cost (Faith).=20
 > - Minor comment fixes.=20
 > - Link to v6: https://lore.kernel.org/r/20250327-agx-uapi-v6-1-df6b878a6=
1b2@rosenzweig.io=20
 > =20
 > Changes in v6:=20
 > - Rename vm_user_* to vm_* for clarity (Janne).=20
 > - Improve lots of comments.=20
 > - Drop a few unused global params that are unlikely to ever be used by=
=20
 >  userspace. We can always add more params but we can never remove them.=
=20
 > - Make GET_PARAMS ioctl W instead of WR, to match the actual behaviour=
=20
 >  of the kernel driver. We don't need a special versioning mechanism=20
 >  here, I don't think.=20
 > - Link to v5: https://lore.kernel.org/r/20250326-agx-uapi-v5-1-04fccfc9e=
631@rosenzweig.io=20
 > =20
 > Changes in v5:=20
 > - Rename GEM_BIND to VM_BIND and make it take an array of bind ops. This=
=20
 >  significantly decreases the # of kerneluser roundtrips with Vulkan=20
 >  sparse binding. The uAPI here is lifted directly from Xe.=20
 > - Merge in_syncs and out_syncs arrays, but leave=20
 >  in_sync_count/out_sync_count alone, requiring waits to precede=20
 >  signals. This simplifies both kernel & userspace, compared to either=20
 >  fully merged or fully separate arrays, so it seems like a Good idea.=20
 > - Drop queue caps, make all caps render + compute. Even GLES2 uses=20
 >  compute to accelerate blits, and even compute workloads use render for=
=20
 >  a few fallback blits. This lets us drop a bunch of crud in both kernel=
=20
 >  & userspace and should slightly improve submit overhead.=20
 > - Reorder ioctl IDs to group a little more logically (bikeshed...).=20
 > - Improve some comments.=20
 > - Link to v4: https://lore.kernel.org/r/20250323-agx-uapi-v4-1-12ed2db96=
737@rosenzweig.io=20
 > =20
 > Changes in v4:=20
 > - get_time now returns time in nanoseconds, timer_frequency_hz dropped.=
=20
 >  This hides an extra time domain from userspace for no real downside.=20
 > - Added lots more comments answering questions Faith raised in v3=20
 >  review.=20
 > - Drop firmware_version per discussion.=20
 > - Drop UNBIND_ALL, it is unused.=20
 > - Switch priority to an enum per discussion.=20
 > - Drop drm_asahi_subqueue and instead make barriers separate fields to=
=20
 >  make obvious the extensability situation resolving discusison on v3.=20
 > =20
 > Changes in v3:=20
 > - Merge load/store/partial fields for depth/stencil as discussed with=20
 >  Faith. This shrinks the submit a lot with little loss of=20
 >  functionality. There's maaaybe a use case for splitting out depth load=
=20
 >  base (only) later. But it's easier to add uAPI than remove it!=20
 > - Make usc_exec_base per-queue instead of per-command. No use case for=
=20
 >  doing it finer grained, and this shrinks the submits and simplifies=20
 >  userspace handling.=20
 > - Improve descriptions.=20
 > - Reorder/shrink fields to remove padding.=20
 > - Use full names for vdm/cdm_ctrl_stream_base=20
 > - Link to v2: https://lore.kernel.org/r/20250313-agx-uapi-v2-1-59cc53a59=
ea3@rosenzweig.io=20
 > =20
 > Changes in v2:=20
 > - Flatten submits. Previously, the submit ioctl pointed to an array of=
=20
 >  command structures, which each pointed to separate payload structures,=
=20
 >  which pointed to attachment structures. This is a lot of indirection,=
=20
 >  which complicates greatly virtgpu. In the new approach, the submit=20
 >  ioctl points to a single contiguous blob of plain-old-data, no CPU=20
 >  pointers, copied from userspace in one go and suitable as virtgpu wire=
=20
 >  protocol.=20
 > - Remove vm_page_size, userspace has to hardcode it anyway.=20
 > - Turn random #defines into enums for better kernel doc, etc.=20
 > - Improve comments, particularly around barriers[].=20
 > - Rename various flags/fields to better match canonical names when known=
=20
 >  (a lot of the names are pulled from the drivers/gpu/drm/imagination,=20
 >  naturally).=20
 > - Drop unnecessary encoder_id, cmd_id handles.=20
 > - Fix padding in submit ioctl (thanks Ryan).=20
 > - Link to v1: https://lore.kernel.org/r/20250310-agx-uapi-v1-1-86c809050=
04e@rosenzweig.io=20
 > ---=20
 >  Documentation/gpu/driver-uapi.rst |    5 +=20
 >  MAINTAINERS                       |    1 +=20
 >  include/uapi/drm/asahi_drm.h      | 1194 ++++++++++++++++++++++++++++++=
+++++++=20
 >  3 files changed, 1200 insertions(+)=20
 > =20
 > diff --git a/Documentation/gpu/driver-uapi.rst b/Documentation/gpu/drive=
r-uapi.rst=20
 > index 971cdb4816fc98d80a64d93637481d10c2e79718..1f15a8ca126516c23bd7374c=
c4aead0dfbbccf67 100644=20
 > --- a/Documentation/gpu/driver-uapi.rst=20
 > +++ b/Documentation/gpu/driver-uapi.rst=20
 > @@ -27,3 +27,8 @@ drm/xe uAPI=20
 >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=20
 > =20
 >  .. kernel-doc:: include/uapi/drm/xe_drm.h=20
 > +=20
 > +drm/asahi uAPI=20
 > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=20
 > +=20
 > +.. kernel-doc:: include/uapi/drm/asahi_drm.h=20
 > diff --git a/MAINTAINERS b/MAINTAINERS=20
 > index d1050702f681fbd0e4e2d0457b2ba569a64070d9..7f692a935808d4ec82ee7413=
24f8043302dae491 100644=20
 > --- a/MAINTAINERS=20
 > +++ b/MAINTAINERS=20
 > @@ -2256,6 +2256,7 @@ F:=C2=A0=C2=A0=C2=A0=C2=A0drivers/watchdog/apple_w=
dt.c=20
 >  F:=C2=A0=C2=A0=C2=A0=C2=A0include/dt-bindings/interrupt-controller/appl=
e-aic.h=20
 >  F:=C2=A0=C2=A0=C2=A0=C2=A0include/dt-bindings/pinctrl/apple.h=20
 >  F:=C2=A0=C2=A0=C2=A0=C2=A0include/linux/soc/apple/*=20
 > +F:=C2=A0=C2=A0=C2=A0=C2=A0include/uapi/drm/asahi_drm.h=20
 > =20
 >  ARM/ARTPEC MACHINE SUPPORT=20
 >  M:=C2=A0=C2=A0=C2=A0=C2=A0Jesper Nilsson jesper.nilsson@axis.com>=20
 > diff --git a/include/uapi/drm/asahi_drm.h b/include/uapi/drm/asahi_drm.h=
=20
 > new file mode 100644=20
 > index 0000000000000000000000000000000000000000..de67f1c603afd42753982c7e=
d593619f394df527=20
 > --- /dev/null=20
 > +++ b/include/uapi/drm/asahi_drm.h=20
 > @@ -0,0 +1,1194 @@=20
 > +/* SPDX-License-Identifier: MIT */=20
 > +/*=20
 > + * Copyright (C) The Asahi Linux Contributors=20
 > + * Copyright (C) 2018-2023 Collabora Ltd.=20
 > + * Copyright (C) 2014-2018 Broadcom=20
 > + */=20
 > +#ifndef _ASAHI_DRM_H_=20
 > +#define _ASAHI_DRM_H_=20
 > +=20
 > +#include "drm.h"=20
 > +=20
 > +#if defined(__cplusplus)=20
 > +extern "C" {=20
 > +#endif=20
 > +=20
 > +/**=20
 > + * DOC: Introduction to the Asahi UAPI=20
 > + *=20
 > + * This documentation describes the Asahi IOCTLs.=20
 > + *=20
 > + * Just a few generic rules about the data passed to the Asahi IOCTLs (=
cribbed=20
 > + * from Panthor):=20
 > + *=20
 > + * - Structures must be aligned on 64-bit/8-byte. If the object is not=
=20
 > + *   naturally aligned, a padding field must be added.=20
 > + * - Fields must be explicitly aligned to their natural type alignment =
with=20
 > + *   pad[0..N] fields.=20
 > + * - All padding fields will be checked by the driver to make sure they=
 are=20
 > + *   zeroed.=20
 > + * - Flags can be added, but not removed/replaced.=20
 > + * - New fields can be added to the main structures (the structures=20
 > + *   directly passed to the ioctl). Those fields can be added at the en=
d of=20
 > + *   the structure, or replace existing padding fields. Any new field b=
eing=20
 > + *   added must preserve the behavior that existed before those fields =
were=20
 > + *   added when a value of zero is passed.=20
 > + * - New fields can be added to indirect objects (objects pointed by th=
e=20
 > + *   main structure), iff those objects are passed a size to reflect th=
e=20
 > + *   size known by the userspace driver (see=20
 > + *   drm_asahi_cmd_header::size).=20
 > + * - If the kernel driver is too old to know some fields, those will be=
=20
 > + *   ignored if zero, and otherwise rejected (and so will be zero on ou=
tput).=20
 > + * - If userspace is too old to know some fields, those will be zeroed=
=20
 > + *   (input) before the structure is parsed by the kernel driver.=20
 > + * - Each new flag/field addition must come with a driver version updat=
e so=20
 > + *   the userspace driver doesn't have to guess which flags are support=
ed.=20
 > + * - Structures should not contain unions, as this would defeat the=20
 > + *   extensibility of such structures.=20
 > + * - IOCTLs can't be removed or replaced. New IOCTL IDs should be place=
d=20
 > + *   at the end of the drm_asahi_ioctl_id enum.=20
 > + */=20
 > +=20
 > +/**=20
 > + * enum drm_asahi_ioctl_id - IOCTL IDs=20
 > + *=20
 > + * Place new ioctls at the end, don't re-order, don't replace or remove=
 entries.=20
 > + *=20
 > + * These IDs are not meant to be used directly. Use the DRM_IOCTL_ASAHI=
_xxx=20
 > + * definitions instead.=20
 > + */=20
 > +enum drm_asahi_ioctl_id {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_GET_PARAMS: Query device propert=
ies. */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_GET_PARAMS =3D 0,=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_GET_TIME: Query device time. */=
=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_GET_TIME,=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_VM_CREATE: Create a GPU VM addre=
ss space. */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_VM_CREATE,=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_VM_DESTROY: Destroy a VM. */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_VM_DESTROY,=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_VM_BIND: Bind/unbind memory to a=
 VM. */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_VM_BIND,=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_GEM_CREATE: Create a buffer obje=
ct. */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_GEM_CREATE,=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_ASAHI_GEM_MMAP_OFFSET: Get offset to pa=
ss to mmap() to map a=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * given GEM handle.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_GEM_MMAP_OFFSET,=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_GEM_BIND_OBJECT: Bind memory as =
a special object */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_GEM_BIND_OBJECT,=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_QUEUE_CREATE: Create a schedulin=
g queue. */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_QUEUE_CREATE,=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_QUEUE_DESTROY: Destroy a schedul=
ing queue. */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_QUEUE_DESTROY,=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_SUBMIT: Submit commands to a que=
ue. */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_SUBMIT,=20
 > +};=20
 > +=20
 > +#define DRM_ASAHI_MAX_CLUSTERS=C2=A0=C2=A0=C2=A0=C2=A064=20
 > +=20
 > +/**=20
 > + * struct drm_asahi_params_global - Global parameters.=20
 > + *=20
 > + * This struct may be queried by drm_asahi_get_params.=20
 > + */=20
 > +struct drm_asahi_params_global {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @features: Feature bits from drm_asahi_feat=
ure */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 features;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @gpu_generation: GPU generation, e.g. 13 fo=
r G13G */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 gpu_generation;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @gpu_variant: GPU variant as a character, e=
.g. 'C' for G13C */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 gpu_variant;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @gpu_revision: GPU revision in BCD, e.g. 0x0=
0 for 'A0' or=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * 0x21 for 'C1'=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 gpu_revision;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @chip_id: Chip ID in BCD, e.g. 0x8103 for T=
8103 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 chip_id;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @num_dies: Number of dies in the SoC */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 num_dies;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @num_clusters_total: Number of GPU clusters=
 (across all dies) */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 num_clusters_total;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @num_cores_per_cluster: Number of logical co=
res per cluster=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * (including inactive/nonexistent)=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 num_cores_per_cluster;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @max_frequency_khz: Maximum GPU core clock =
frequency */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 max_frequency_khz;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @core_masks: Bitmask of present/enabled cor=
es per cluster */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 core_masks[DRM_ASAHI_MAX_CLUSTERS];=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @vm_start: VM range start VMA. Together with=
 @vm_end, this defines=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * the window of valid GPU VAs. Userspace is ex=
pected to subdivide VAs=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * out of this window.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * This window contains all virtual addresses t=
hat userspace needs to=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * know about. There may be kernel-internal GPU=
 VAs outside this range,=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * but that detail is not relevant here.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 vm_start;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @vm_end: VM range end VMA */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 vm_end;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @vm_kernel_min_size: Minimum kernel VMA wind=
ow size.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * When creating a VM, userspace is required to=
 carve out a section of=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * virtual addresses (within the range given by=
 @vm_start and=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @vm_end). The kernel will allocate various i=
nternal structures=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * within the specified VA range.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * Allowing userspace to choose the VA range fo=
r the kernel, rather than=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * the kernel reserving VAs and requiring users=
pace to cope, can assist=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * in implementing SVM.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 vm_kernel_min_size;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @max_commands_per_submission: Maximum number=
 of supported commands=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * per submission. This mirrors firmware limits=
. Userspace must split up=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * larger command buffers, which may require in=
serting additional=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * synchronization.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 max_commands_per_submission;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @max_attachments: Maximum number of drm_asah=
i_attachment's per=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * command=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 max_attachments;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @command_timestamp_frequency_hz: Timebase fr=
equency for timestamps=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * written during command execution, specified =
via drm_asahi_timestamp=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * structures. As this rate is controlled by th=
e firmware, it is a=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * queryable parameter.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * Userspace must divide by this frequency to c=
onvert timestamps to=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * seconds, rather than hardcoding a particular=
 firmware's rate.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 command_timestamp_frequency_hz;=20
 > +};=20
 > +=20
 > +/**=20
 > + * enum drm_asahi_feature - Feature bits=20
 > + *=20
 > + * This covers only features that userspace cannot infer from the archi=
tecture=20
 > + * version. Most features don't need to be here.=20
 > + */=20
 > +enum drm_asahi_feature {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_ASAHI_FEATURE_SOFT_FAULTS: GPU has "sof=
t fault" enabled. Shader=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * loads of unmapped memory will return zero. S=
hader stores to unmapped=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * memory will be silently discarded. Note that=
 only shader load/store=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * is affected. Other hardware units are not af=
fected, notably including=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * texture sampling.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * Soft fault is set when initializing the GPU =
and cannot be runtime=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * toggled. Therefore, it is exposed as a featu=
re bit and not a=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * userspace-settable flag on the VM. When soft=
 fault is enabled,=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * userspace can speculate memory accesses more=
 aggressively.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_FEATURE_SOFT_FAULTS =3D (1UL) << 0,=
=20
 > +};=20
 > +=20
 > +/**=20
 > + * struct drm_asahi_get_params - Arguments passed to DRM_IOCTL_ASAHI_GE=
T_PARAMS=20
 > + */=20
 > +struct drm_asahi_get_params {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @param_group: Parameter group to fetch (MBZ=
) */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 param_group;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @pad: MBZ */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 pad;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @pointer: User pointer to write parameter s=
truct */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 pointer;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @size: Size of the user buffer. In case of o=
lder userspace, this may=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * be less than sizeof(struct drm_asahi_params_=
global). The kernel will=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * not write past the length specified here, al=
lowing extensibility.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 size;=20
 > +};=20
 > +=20
 > +/**=20
 > + * struct drm_asahi_vm_create - Arguments passed to DRM_IOCTL_ASAHI_VM_=
CREATE=20
 > + */=20
 > +struct drm_asahi_vm_create {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @kernel_start: Start of the kernel-reserved =
address range. See=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * drm_asahi_params_global::vm_kernel_min_size.=
=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * Both @kernel_start and @kernel_end must be w=
ithin the range of=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * valid VAs given by drm_asahi_params_global::=
vm_start and=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * drm_asahi_params_global::vm_end. The size of=
 the kernel range=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * (@kernel_end - @kernel_start) must be at lea=
st=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * drm_asahi_params_global::vm_kernel_min_size.=
=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * Userspace must not bind any memory on this V=
M into this reserved=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * range, it is for kernel use only.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 kernel_start;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @kernel_end: End of the kernel-reserved addr=
ess range. See=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @kernel_start.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 kernel_end;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @vm_id: Returned VM ID */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 vm_id;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @pad: MBZ */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 pad;=20
 > +};=20
 > +=20
 > +/**=20
 > + * struct drm_asahi_vm_destroy - Arguments passed to DRM_IOCTL_ASAHI_VM=
_DESTROY=20
 > + */=20
 > +struct drm_asahi_vm_destroy {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @vm_id: VM ID to be destroyed */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 vm_id;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @pad: MBZ */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 pad;=20
 > +};=20
 > +=20
 > +/**=20
 > + * enum drm_asahi_gem_flags - Flags for GEM creation=20
 > + */=20
 > +enum drm_asahi_gem_flags {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_ASAHI_GEM_WRITEBACK: BO should be CPU-m=
apped as writeback.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * Map as writeback instead of write-combine. T=
his optimizes for CPU=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * reads.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_GEM_WRITEBACK =3D (1L << 0),=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_ASAHI_GEM_VM_PRIVATE: BO is private to =
this GPU VM (no exports).=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_GEM_VM_PRIVATE =3D (1L << 1),=20
 > +};=20
 > +=20
 > +/**=20
 > + * struct drm_asahi_gem_create - Arguments passed to DRM_IOCTL_ASAHI_GE=
M_CREATE=20
 > + */=20
 > +struct drm_asahi_gem_create {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @size: Size of the BO */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 size;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @flags: Combination of drm_asahi_gem_flags =
flags. */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 flags;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @vm_id: VM ID to assign to the BO, if DRM_AS=
AHI_GEM_VM_PRIVATE is set=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 vm_id;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @handle: Returned GEM handle for the BO */=
=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 handle;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @pad: MBZ */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 pad;=20
 > +};=20
 > +=20
 > +/**=20
 > + * struct drm_asahi_gem_mmap_offset - Arguments passed to=20
 > + * DRM_IOCTL_ASAHI_GEM_MMAP_OFFSET=20
 > + */=20
 > +struct drm_asahi_gem_mmap_offset {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @handle: Handle for the object being mapped=
. */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 handle;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @flags: Must be zero */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 flags;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @offset: The fake offset to use for subsequ=
ent mmap call */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 offset;=20
 > +};=20
 > +=20
 > +/**=20
 > + * enum drm_asahi_bind_flags - Flags for GEM binding=20
 > + */=20
 > +enum drm_asahi_bind_flags {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_ASAHI_BIND_UNBIND: Instead of binding a=
 GEM object to the range,=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * simply unbind the GPU VMA range.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_BIND_UNBIND =3D (1L << 0),=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_BIND_READ: Map BO with GPU read =
permission */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_BIND_READ =3D (1L << 1),=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_BIND_WRITE: Map BO with GPU writ=
e permission */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_BIND_WRITE =3D (1L << 2),=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_ASAHI_BIND_SINGLE_PAGE: Map a single pa=
ge of the BO repeatedly=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * across the VA range.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * This is useful to fill a VA range with scrat=
ch pages or zero pages.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * It is intended as a mechanism to accelerate =
sparse.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_BIND_SINGLE_PAGE =3D (1L << 3),=20
 > +};=20
 > +=20
 > +/**=20
 > + * struct drm_asahi_gem_bind_op - Description of a single GEM bind oper=
ation.=20
 > + */=20
 > +struct drm_asahi_gem_bind_op {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @flags: Combination of drm_asahi_bind_flags=
 flags. */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 flags;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @handle: GEM object to bind (except for UNB=
IND) */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 handle;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @offset: Offset into the object (except for =
UNBIND).=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * For a regular bind, this is the beginning of=
 the region of the GEM=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * object to bind.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * For a single-page bind, this is the offset t=
o the single page that=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * will be repeatedly bound.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * Must be page-size aligned.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 offset;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @range: Number of bytes to bind/unbind to @a=
ddr.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * Must be page-size aligned.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 range;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @addr: Address to bind to.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * Must be page-size aligned.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 addr;=20
 > +};=20
 > +=20
 > +/**=20
 > + * struct drm_asahi_vm_bind - Arguments passed to=20
 > + * DRM_IOCTL_ASAHI_VM_BIND=20
 > + */=20
 > +struct drm_asahi_vm_bind {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @vm_id: The ID of the VM to bind to */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 vm_id;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @num_binds: number of binds in this IOCTL. =
*/=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 num_binds;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @stride: Stride in bytes between consecutive=
 binds. This allows=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * extensibility of drm_asahi_gem_bind_op.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 stride;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @pad: MBZ */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 pad;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @userptr: User pointer to an array of @num_b=
inds structures of type=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @drm_asahi_gem_bind_op and size @stride byte=
s.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 userptr;=20
 > +};=20
 > +=20
 > +/**=20
 > + * enum drm_asahi_bind_object_op - Special object bind operation=20
 > + */=20
 > +enum drm_asahi_bind_object_op {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_BIND_OBJECT_OP_BIND: Bind a BO a=
s a special GPU object */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_BIND_OBJECT_OP_BIND =3D 0,=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_BIND_OBJECT_OP_UNBIND: Unbind a =
special GPU object */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_BIND_OBJECT_OP_UNBIND =3D 1,=20
 > +};=20
 > +=20
 > +/**=20
 > + * enum drm_asahi_bind_object_flags - Special object bind flags=20
 > + */=20
 > +enum drm_asahi_bind_object_flags {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_ASAHI_BIND_OBJECT_USAGE_TIMESTAMPS: Map=
 a BO as a timestamp=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * buffer.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_BIND_OBJECT_USAGE_TIMESTAMPS =3D (1L =
<< 0),=20
 > +};=20
 > +=20
 > +/**=20
 > + * struct drm_asahi_gem_bind_object - Arguments passed to=20
 > + * DRM_IOCTL_ASAHI_GEM_BIND_OBJECT=20
 > + */=20
 > +struct drm_asahi_gem_bind_object {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @op: Bind operation (enum drm_asahi_bind_ob=
ject_op) */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 op;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @flags: Combination of drm_asahi_bind_objec=
t_flags flags. */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 flags;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @handle: GEM object to bind/unbind (BIND) *=
/=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 handle;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @vm_id: The ID of the VM to operate on (MBZ=
 currently) */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 vm_id;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @offset: Offset into the object (BIND only)=
 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 offset;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @range: Number of bytes to bind/unbind (BIN=
D only) */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 range;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @object_handle: Object handle (out for BIND=
, in for UNBIND) */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 object_handle;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @pad: MBZ */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 pad;=20
 > +};=20
 > +=20
 > +/**=20
 > + * enum drm_asahi_cmd_type - Command type=20
 > + */=20
 > +enum drm_asahi_cmd_type {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_ASAHI_CMD_RENDER: Render command, execu=
ting on the render=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * subqueue. Combined vertex and fragment opera=
tion.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * Followed by a @drm_asahi_cmd_render payload.=
=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_CMD_RENDER =3D 0,=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_ASAHI_CMD_COMPUTE: Compute command on t=
he compute subqueue.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * Followed by a @drm_asahi_cmd_compute payload=
.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_CMD_COMPUTE =3D 1,=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_ASAHI_SET_VERTEX_ATTACHMENTS: Software =
command to set=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * attachments for subsequent vertex shaders in=
 the same submit.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * Followed by (possibly multiple) @drm_asahi_a=
ttachment payloads.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_SET_VERTEX_ATTACHMENTS =3D 2,=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_ASAHI_SET_FRAGMENT_ATTACHMENTS: Softwar=
e command to set=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * attachments for subsequent fragment shaders =
in the same submit.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * Followed by (possibly multiple) @drm_asahi_a=
ttachment payloads.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_SET_FRAGMENT_ATTACHMENTS =3D 3,=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_ASAHI_SET_COMPUTE_ATTACHMENTS: Software=
 command to set=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * attachments for subsequent compute shaders i=
n the same submit.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * Followed by (possibly multiple) @drm_asahi_a=
ttachment payloads.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_SET_COMPUTE_ATTACHMENTS =3D 4,=20
 > +};=20
 > +=20
 > +/**=20
 > + * enum drm_asahi_priority - Scheduling queue priority.=20
 > + *=20
 > + * These priorities are forwarded to the firmware to influence firmware=
=20
 > + * scheduling. The exact policy is ultimately decided by firmware, but=
=20
 > + * these enums allow userspace to communicate the intentions.=20
 > + */=20
 > +enum drm_asahi_priority {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_PRIORITY_LOW: Low priority queue=
. */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_PRIORITY_LOW =3D 0,=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_PRIORITY_MEDIUM: Medium priority=
 queue. */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_PRIORITY_MEDIUM =3D 1,=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_ASAHI_PRIORITY_HIGH: High priority queu=
e.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * Reserved for future extension.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_PRIORITY_HIGH =3D 2,=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_ASAHI_PRIORITY_REALTIME: Real-time prio=
rity queue.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * Reserved for future extension.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_PRIORITY_REALTIME =3D 3,=20
 > +};=20
 > +=20
 > +/**=20
 > + * struct drm_asahi_queue_create - Arguments passed to=20
 > + * DRM_IOCTL_ASAHI_QUEUE_CREATE=20
 > + */=20
 > +struct drm_asahi_queue_create {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @flags: MBZ */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 flags;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @vm_id: The ID of the VM this queue is boun=
d to */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 vm_id;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @priority: One of drm_asahi_priority */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 priority;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @queue_id: The returned queue ID */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 queue_id;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @usc_exec_base: GPU base address for all USC=
 binaries (shaders) on=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * this queue. USC addresses are 32-bit relativ=
e to this 64-bit base.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * This sets the following registers on all que=
ue commands:=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0USC_EXEC_BASE_TA  (ve=
rtex)=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0USC_EXEC_BASE_ISP (fr=
agment)=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0USC_EXEC_BASE_CP  (co=
mpute)=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * While the hardware lets us configure these i=
ndependently per command,=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * we do not have a use case for this. Instead,=
 we expect userspace to=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * fix a 4GiB VA carveout for USC memory and pa=
ss its base address here.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 usc_exec_base;=20
 > +};=20
 > +=20
 > +/**=20
 > + * struct drm_asahi_queue_destroy - Arguments passed to=20
 > + * DRM_IOCTL_ASAHI_QUEUE_DESTROY=20
 > + */=20
 > +struct drm_asahi_queue_destroy {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @queue_id: The queue ID to be destroyed */=
=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 queue_id;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @pad: MBZ */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 pad;=20
 > +};=20
 > +=20
 > +/**=20
 > + * enum drm_asahi_sync_type - Sync item type=20
 > + */=20
 > +enum drm_asahi_sync_type {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_SYNC_SYNCOBJ: Binary sync object=
 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_SYNC_SYNCOBJ =3D 0,=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_SYNC_TIMELINE_SYNCOBJ: Timeline =
sync object */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_SYNC_TIMELINE_SYNCOBJ =3D 1,=20
 > +};=20
 > +=20
 > +/**=20
 > + * struct drm_asahi_sync - Sync item=20
 > + */=20
 > +struct drm_asahi_sync {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @sync_type: One of drm_asahi_sync_type */=
=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 sync_type;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @handle: The sync object handle */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 handle;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @timeline_value: Timeline value for timelin=
e sync objects */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 timeline_value;=20
 > +};=20
 > +=20
 > +/**=20
 > + * define DRM_ASAHI_BARRIER_NONE - Command index for no barrier=20
 > + *=20
 > + * This special value may be passed in to drm_asahi_command::vdm_barrie=
r or=20
 > + * drm_asahi_command::cdm_barrier to indicate that the respective subqu=
eue=20
 > + * should not wait on any previous work.=20
 > + */=20
 > +#define DRM_ASAHI_BARRIER_NONE (0xFFFFu)=20
 > +=20
 > +/**=20
 > + * struct drm_asahi_cmd_header - Top level command structure=20
 > + *=20
 > + * This struct is core to the command buffer definition and therefore i=
s not=20
 > + * extensible.=20
 > + */=20
 > +struct drm_asahi_cmd_header {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @cmd_type: One of drm_asahi_cmd_type */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u16 cmd_type;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @size: Size of this command, not including t=
his header.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * For hardware commands, this enables extensib=
ility of commands without=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * requiring extra command types. Passing a com=
mand that is shorter=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * than expected is explicitly allowed for back=
wards-compatibility.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * Truncated fields will be zeroed.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * For the synthetic attachment setting command=
s, this implicitly=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * encodes the number of attachments. These com=
mands take multiple=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * fixed-size @drm_asahi_attachment structures =
as their payload, so size=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * equals number of attachments * sizeof(struct=
 drm_asahi_attachment).=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u16 size;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @vdm_barrier: VDM (render) command index to =
wait on.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * Barriers are indices relative to the beginni=
ng of a given submit. A=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * barrier of 0 waits on commands submitted to =
the respective subqueue=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * in previous submit ioctls. A barrier of N wa=
its on N previous=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * commands on the subqueue within the current =
submit ioctl. As a=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * special case, passing @DRM_ASAHI_BARRIER_NON=
E avoids waiting on any=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * commands in the subqueue.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * Examples:=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *   0: This waits on all previous work.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *   NONE: This does not wait for anything on t=
his subqueue.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *   1: This waits on the first render command =
in the submit.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *   This is valid only if there are multiple r=
ender commands in the=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *   same submit.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * Barriers are valid only for hardware command=
s. Synthetic software=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * commands to set attachments must pass NONE h=
ere.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u16 vdm_barrier;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @cdm_barrier: CDM (compute) command index to=
 wait on.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * See @vdm_barrier, and replace VDM/render wit=
h CDM/compute.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u16 cdm_barrier;=20
 > +};=20
 > +=20
 > +/**=20
 > + * struct drm_asahi_submit - Arguments passed to DRM_IOCTL_ASAHI_SUBMIT=
=20
 > + */=20
 > +struct drm_asahi_submit {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @syncs: An optional pointer to an array of d=
rm_asahi_sync. The first=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @in_sync_count elements are in-syncs, then t=
he remaining=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @out_sync_count elements are out-syncs. Usin=
g a single array with=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * explicit partitioning simplifies handling.=
=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 syncs;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @cmdbuf: Pointer to the command buffer to su=
bmit.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * This is a flat command buffer. By design, it=
 contains no CPU=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * pointers, which makes it suitable for a virt=
gpu wire protocol without=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * requiring any serializing/deserializing step=
.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * It consists of a series of commands. Each co=
mmand begins with a=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * fixed-size @drm_asahi_cmd_header header and =
is followed by a=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * variable-length payload according to the typ=
e and size in the header.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * The combined count of "real" hardware comman=
ds must be nonzero and at=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * most drm_asahi_params_global::max_commands_p=
er_submission.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 cmdbuf;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @flags: Flags for command submission (MBZ) =
*/=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 flags;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @queue_id: The queue ID to be submitted to =
*/=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 queue_id;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @in_sync_count: Number of sync objects to wa=
it on before starting=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * this job.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 in_sync_count;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @out_sync_count: Number of sync objects to s=
ignal upon completion of=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * this job.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 out_sync_count;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @cmdbuf_size: Command buffer size in bytes =
*/=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 cmdbuf_size;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @pad: MBZ */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 pad;=20
 > +};=20
 > +=20
 > +/**=20
 > + * struct drm_asahi_attachment - Describe an "attachment".=20
 > + *=20
 > + * Attachments are any memory written by shaders, notably including ren=
der=20
 > + * target attachments written by the end-of-tile program. This is purel=
y a hint=20
 > + * about the accessed memory regions. It is optional to specify, which =
is=20
 > + * fortunate as it cannot be specified precisely with bindless access a=
nyway.=20
 > + * But where possible, it's probably a good idea for userspace to inclu=
de these=20
 > + * hints, forwarded to the firmware.=20
 > + *=20
 > + * This struct is implicitly sized and therefore is not extensible.=20
 > + */=20
 > +struct drm_asahi_attachment {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @pointer: Base address of the attachment */=
=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 pointer;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @size: Size of the attachment in bytes */=
=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 size;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @pad: MBZ */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 pad;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @flags: MBZ */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 flags;=20
 > +};=20
 > +=20
 > +enum drm_asahi_render_flags {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_ASAHI_RENDER_VERTEX_SCRATCH: A vertex s=
tage shader uses scratch=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * memory.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_RENDER_VERTEX_SCRATCH =3D (1U << 0),=
=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_ASAHI_RENDER_PROCESS_EMPTY_TILES: Proce=
ss even empty tiles.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * This must be set when clearing render target=
s.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_RENDER_PROCESS_EMPTY_TILES =3D (1U <<=
 1),=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_ASAHI_RENDER_NO_VERTEX_CLUSTERING: Run =
vertex stage on a single=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * cluster (on multi-cluster GPUs)=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * This harms performance but can workaround ce=
rtain sync/coherency=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * bugs, and therefore is useful for debugging.=
=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_RENDER_NO_VERTEX_CLUSTERING =3D (1U <=
< 2),=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_ASAHI_RENDER_DBIAS_IS_INT: Use integer =
depth bias formula.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * Graphics specifications contain two alternat=
e formulas for depth=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * bias, a float formula used with floating-poi=
nt depth buffers and an=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * integer formula using with unorm depth buffe=
rs. This flag specifies=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * that the integer formula should be used. If =
omitted, the float=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * formula is used instead.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * This corresponds to bit 18 of the relevant h=
ardware control register,=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * so we match that here for efficiency.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_RENDER_DBIAS_IS_INT =3D (1U << 18),=
=20
 > +};=20
 > +=20
 > +/**=20
 > + * struct drm_asahi_zls_buffer - Describe a depth or stencil buffer.=20
 > + *=20
 > + * These fields correspond to hardware registers in the ZLS (Z Load/Sto=
re) unit.=20
 > + * There are three hardware registers for each field respectively for l=
oads,=20
 > + * stores, and partial renders. In practice, it makes sense to set all =
to the=20
 > + * same values, except in exceptional cases not yet implemented in user=
space, so=20
 > + * we do not duplicate here for simplicity/efficiency.=20
 > + *=20
 > + * This struct is embedded in other structs and therefore is not extens=
ible.=20
 > + */=20
 > +struct drm_asahi_zls_buffer {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @base: Base address of the buffer */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 base;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @comp_base: If the load buffer is compressed=
, address of the=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * compression metadata section.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 comp_base;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @stride: If layered rendering is enabled, th=
e number of bytes=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * between each layer of the buffer.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 stride;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @comp_stride: If layered rendering is enable=
d, the number of bytes=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * between each layer of the compression metada=
ta.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 comp_stride;=20
 > +};=20
 > +=20
 > +/**=20
 > + * struct drm_asahi_timestamp - Describe a timestamp write.=20
 > + *=20
 > + * The firmware can optionally write the GPU timestamp at render pass=
=20
 > + * granularities, but it needs to be mapped specially via=20
 > + * DRM_IOCTL_ASAHI_GEM_BIND_OBJECT. This structure therefore describes =
where to=20
 > + * write as a handle-offset pair, rather than a GPU address like normal=
.=20
 > + *=20
 > + * This struct is embedded in other structs and therefore is not extens=
ible.=20
 > + */=20
 > +struct drm_asahi_timestamp {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @handle: Handle of the timestamp buffer, or =
0 to skip this=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * timestamp. If nonzero, this must equal the v=
alue returned in=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * drm_asahi_gem_bind_object::object_handle.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 handle;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @offset: Offset to write into the timestamp=
 buffer */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 offset;=20
 > +};=20
 > +=20
 > +/**=20
 > + * struct drm_asahi_timestamps - Describe timestamp writes.=20
 > + *=20
 > + * Each operation that can be timestamped, can be timestamped at the st=
art and=20
 > + * end. Therefore, drm_asahi_timestamp structs always come in pairs, bu=
ndled=20
 > + * together into drm_asahi_timestamps.=20
 > + *=20
 > + * This struct is embedded in other structs and therefore is not extens=
ible.=20
 > + */=20
 > +struct drm_asahi_timestamps {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @start: Timestamp recorded at the start of =
the operation */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0struct drm_asahi_timestamp start;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @end: Timestamp recorded at the end of the =
operation */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0struct drm_asahi_timestamp end;=20
 > +};=20
 > +=20
 > +/**=20
 > + * struct drm_asahi_helper_program - Describe helper program configurat=
ion.=20
 > + *=20
 > + * The helper program is a compute-like kernel required for various har=
dware=20
 > + * functionality. Its most important role is dynamically allocating=20
 > + * scratch/stack memory for individual subgroups, by partitioning a sta=
tic=20
 > + * allocation shared for the whole device. It is supplied by userspace =
via=20
 > + * drm_asahi_helper_program and internally dispatched by the hardware a=
s needed.=20
 > + *=20
 > + * This struct is embedded in other structs and therefore is not extens=
ible.=20
 > + */=20
 > +struct drm_asahi_helper_program {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @binary: USC address to the helper program b=
inary. This is a tagged=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * pointer with configuration in the bottom bit=
s.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 binary;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @cfg: Additional configuration bits for the=
 helper program. */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 cfg;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @data: Data passed to the helper program. Th=
is value is not=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * interpreted by the kernel, firmware, or hard=
ware in any way. It is=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * simply a sideband for userspace, set with th=
e submit ioctl and read=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * via special registers inside the helper prog=
ram.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * In practice, userspace will pass a 64-bit GP=
U VA here pointing to the=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * actual arguments, which presumably don't fit=
 in 64-bits.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 data;=20
 > +};=20
 > +=20
 > +/**=20
 > + * struct drm_asahi_bg_eot - Describe a background or end-of-tile progr=
am.=20
 > + *=20
 > + * The background and end-of-tile programs are dispatched by the hardwa=
re at the=20
 > + * beginning and end of rendering. As the hardware "tilebuffer" is simp=
ly local=20
 > + * memory, these programs are necessary to implement API-level render t=
argets.=20
 > + * The fragment-like background program is responsible for loading eith=
er the=20
 > + * clear colour or the existing render target contents, while the compu=
te-like=20
 > + * end-of-tile program stores the tilebuffer contents to memory.=20
 > + *=20
 > + * This struct is embedded in other structs and therefore is not extens=
ible.=20
 > + */=20
 > +struct drm_asahi_bg_eot {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @usc: USC address of the hardware USC words =
binding resources=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * (including images and uniforms) and the prog=
ram itself. Note this is=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * an additional layer of indirection compared =
to the helper program,=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * avoiding the need for a sideband for data. T=
his is a tagged pointer=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * with additional configuration in the bottom =
bits.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 usc;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @rsrc_spec: Resource specifier for the progr=
am. This is a packed=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * hardware data structure describing the requi=
red number of registers,=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * uniforms, bound textures, and bound samplers=
.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 rsrc_spec;=20
 > +};=20
 > +=20
 > +/**=20
 > + * struct drm_asahi_cmd_render - Command to submit 3D=20
 > + *=20
 > + * This command submits a single render pass. The hardware control stre=
am may=20
 > + * include many draws and subpasses, but within the command, the frameb=
uffer=20
 > + * dimensions and attachments are fixed.=20
 > + *=20
 > + * The hardware requires the firmware to set a large number of Control =
Registers=20
 > + * setting up state at render pass granularity before each command rend=
ering 3D.=20
 > + * The firmware bundles this state into data structures. Unfortunately,=
 we=20
 > + * cannot expose either any of that directly to userspace, because the=
=20
 > + * kernel-firmware ABI is not stable. Although we can guarantee the fir=
mware=20
 > + * updates in tandem with the kernel, we cannot break old userspace whe=
n=20
 > + * upgrading the firmware and kernel. Therefore, we need to abstract we=
ll the=20
 > + * data structures to avoid tying our hands with future firmwares.=20
 > + *=20
 > + * The bulk of drm_asahi_cmd_render therefore consists of values of har=
dware=20
 > + * control registers, marshalled via the firmware interface.=20
 > + *=20
 > + * The framebuffer/tilebuffer dimensions are also specified here. In ad=
dition to=20
 > + * being passed to the firmware/hardware, the kernel requires these dim=
ensions=20
 > + * to calculate various essential tiling-related data structures. It is=
=20
 > + * unfortunate that our submits are heavier than on vendors with saner=
=20
 > + * hardware-software interfaces. The upshot is all of this information =
is=20
 > + * readily available to userspace with all current APIs.=20
 > + *=20
 > + * It looks odd - but it's not overly burdensome and it ensures we can =
remain=20
 > + * compatible with old userspace.=20
 > + */=20
 > +struct drm_asahi_cmd_render {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @flags: Combination of drm_asahi_render_fla=
gs flags. */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 flags;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @isp_zls_pixels: ISP_ZLS_PIXELS register val=
ue. This contains the=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * depth/stencil width/height, which may differ=
 from the framebuffer=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * width/height.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 isp_zls_pixels;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @vdm_ctrl_stream_base: VDM_CTRL_STREAM_BASE =
register value. GPU=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * address to the beginning of the VDM control =
stream.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 vdm_ctrl_stream_base;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @vertex_helper: Helper program used for the=
 vertex shader */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0struct drm_asahi_helper_program vertex_helper;=
=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @fragment_helper: Helper program used for t=
he fragment shader */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0struct drm_asahi_helper_program fragment_helper=
;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @isp_scissor_base: ISP_SCISSOR_BASE register=
 value. GPU address of an=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * array of scissor descriptors indexed in the =
render pass.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 isp_scissor_base;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @isp_dbias_base: ISP_DBIAS_BASE register val=
ue. GPU address of an=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * array of depth bias values indexed in the re=
nder pass.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 isp_dbias_base;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @isp_oclqry_base: ISP_OCLQRY_BASE register v=
alue. GPU address of an=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * array of occlusion query results written by =
the render pass.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 isp_oclqry_base;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @depth: Depth buffer */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0struct drm_asahi_zls_buffer depth;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @stencil: Stencil buffer */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0struct drm_asahi_zls_buffer stencil;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @zls_ctrl: ZLS_CTRL register value */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 zls_ctrl;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @ppp_multisamplectl: PPP_MULTISAMPLECTL reg=
ister value */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 ppp_multisamplectl;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @sampler_heap: Base address of the sampler h=
eap. This heap is used=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * for both vertex shaders and fragment shaders=
. The registers are=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * per-stage, but there is no known use case fo=
r separate heaps.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 sampler_heap;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @ppp_ctrl: PPP_CTRL register value */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 ppp_ctrl;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @width_px: Framebuffer width in pixels */=
=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u16 width_px;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @height_px: Framebuffer height in pixels */=
=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u16 height_px;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @layers: Number of layers in the framebuffe=
r */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u16 layers;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @sampler_count: Number of samplers in the s=
ampler heap. */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u16 sampler_count;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @utile_width_px: Width of a logical tilebuf=
fer tile in pixels */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u8 utile_width_px;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @utile_height_px: Height of a logical tileb=
uffer tile in pixels */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u8 utile_height_px;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @samples: # of samples in the framebuffer. =
Must be 1, 2, or 4. */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u8 samples;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @sample_size_B: # of bytes in the tilebuffe=
r required per sample. */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u8 sample_size_B;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @isp_merge_upper_x: 32-bit float used in the=
 hardware triangle=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * merging. Calculate as: tan(60 deg) * width.=
=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * Making these values UAPI avoids requiring fl=
oating-point calculations=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * in the kernel in the hot path.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 isp_merge_upper_x;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @isp_merge_upper_y: 32-bit float. Calculate =
as: tan(60 deg) * height.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * See @isp_merge_upper_x.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 isp_merge_upper_y;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @bg: Background program run for each tile a=
t the start */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0struct drm_asahi_bg_eot bg;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @eot: End-of-tile program ran for each tile=
 at the end */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0struct drm_asahi_bg_eot eot;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @partial_bg: Background program ran at the s=
tart of each tile when=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * resuming the render pass during a partial re=
nder.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0struct drm_asahi_bg_eot partial_bg;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @partial_eot: End-of-tile program ran at the=
 end of each tile when=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * pausing the render pass during a partial ren=
der.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0struct drm_asahi_bg_eot partial_eot;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @isp_bgobjdepth: ISP_BGOBJDEPTH register val=
ue. This is the depth=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * buffer clear value, encoded in the depth buf=
fer's format: either a=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * 32-bit float or a 16-bit unorm (with upper b=
its zeroed).=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 isp_bgobjdepth;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @isp_bgobjvals: ISP_BGOBJVALS register value=
. The bottom 8-bits=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * contain the stencil buffer clear value.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 isp_bgobjvals;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @ts_vtx: Timestamps for the vertex portion =
of the render */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0struct drm_asahi_timestamps ts_vtx;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @ts_frag: Timestamps for the fragment porti=
on of the render */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0struct drm_asahi_timestamps ts_frag;=20
 > +};=20
 > +=20
 > +/**=20
 > + * struct drm_asahi_cmd_compute - Command to submit compute=20
 > + *=20
 > + * This command submits a control stream consisting of compute dispatch=
es. There=20
 > + * is essentially no limit on how many compute dispatches may be includ=
ed in a=20
 > + * single compute command, although timestamps are at command granulari=
ty.=20
 > + */=20
 > +struct drm_asahi_cmd_compute {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @flags: MBZ */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 flags;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @sampler_count: Number of samplers in the s=
ampler heap. */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 sampler_count;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @cdm_ctrl_stream_base: CDM_CTRL_STREAM_BASE =
register value. GPU=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * address to the beginning of the CDM control =
stream.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 cdm_ctrl_stream_base;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * @cdm_ctrl_stream_end: GPU base address to th=
e end of the hardware=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * control stream. Note this only considers the=
 first contiguous segment=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 * of the control stream, as the stream might j=
ump elsewhere.=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 cdm_ctrl_stream_end;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @sampler_heap: Base address of the sampler =
heap. */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 sampler_heap;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @helper: Helper program used for this compu=
te command */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0struct drm_asahi_helper_program helper;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @ts: Timestamps for the compute command */=
=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0struct drm_asahi_timestamps ts;=20
 > +};=20
 > +=20
 > +/**=20
 > + * struct drm_asahi_get_time - Arguments passed to DRM_IOCTL_ASAHI_GET_=
TIME=20
 > + */=20
 > +struct drm_asahi_get_time {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @flags: MBZ. */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 flags;=20
 > +=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0/** @gpu_timestamp: On return, the GPU timestam=
p in nanoseconds. */=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 gpu_timestamp;=20
 > +};=20
 > +=20
 > +/**=20
 > + * DRM_IOCTL_ASAHI() - Build an Asahi IOCTL number=20
 > + * @__access: Access type. Must be R, W or RW.=20
 > + * @__id: One of the DRM_ASAHI_xxx id.=20
 > + * @__type: Suffix of the type being passed to the IOCTL.=20
 > + *=20
 > + * Don't use this macro directly, use the DRM_IOCTL_ASAHI_xxx=20
 > + * values instead.=20
 > + *=20
 > + * Return: An IOCTL number to be passed to ioctl() from userspace.=20
 > + */=20
 > +#define DRM_IOCTL_ASAHI(__access, __id, __type) \=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_IO ## __access(DRM_COMMAND_BASE + DRM_ASAHI=
_ ## __id, \=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0   struct drm_asahi_ ## __type)=20
 > +=20
 > +/* Note: this is an enum so that it can be resolved by Rust bindgen. */=
=20
 > +enum {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_IOCTL_ASAHI_GET_PARAMS       =3D DRM_IOCTL_=
ASAHI(W, GET_PARAMS, get_params),=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_IOCTL_ASAHI_GET_TIME         =3D DRM_IOCTL_=
ASAHI(WR, GET_TIME, get_time),=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_IOCTL_ASAHI_VM_CREATE        =3D DRM_IOCTL_=
ASAHI(WR, VM_CREATE, vm_create),=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_IOCTL_ASAHI_VM_DESTROY       =3D DRM_IOCTL_=
ASAHI(W, VM_DESTROY, vm_destroy),=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_IOCTL_ASAHI_VM_BIND          =3D DRM_IOCTL_=
ASAHI(W, VM_BIND, vm_bind),=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_IOCTL_ASAHI_GEM_CREATE       =3D DRM_IOCTL_=
ASAHI(WR, GEM_CREATE, gem_create),=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_IOCTL_ASAHI_GEM_MMAP_OFFSET  =3D DRM_IOCTL_=
ASAHI(WR, GEM_MMAP_OFFSET, gem_mmap_offset),=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_IOCTL_ASAHI_GEM_BIND_OBJECT  =3D DRM_IOCTL_=
ASAHI(WR, GEM_BIND_OBJECT, gem_bind_object),=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_IOCTL_ASAHI_QUEUE_CREATE     =3D DRM_IOCTL_=
ASAHI(WR, QUEUE_CREATE, queue_create),=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_IOCTL_ASAHI_QUEUE_DESTROY    =3D DRM_IOCTL_=
ASAHI(W, QUEUE_DESTROY, queue_destroy),=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_IOCTL_ASAHI_SUBMIT           =3D DRM_IOCTL_=
ASAHI(W, SUBMIT, submit),=20
 > +};=20
 > +=20
 > +#if defined(__cplusplus)=20
 > +}=20
 > +#endif=20
 > +=20
 > +#endif /* _ASAHI_DRM_H_ */=20
 > =20
 > ---=20
 > base-commit: 0ed1356af8f629ae807963b7db4e501e3b580bc2=20
 > change-id: 20250307-agx-uapi-930579437f19=20
 > =20
 > Best regards,=20
 > --=20
 > Alyssa Rosenzweig alyssa@rosenzweig.io>=20
 > =20
 >=20

