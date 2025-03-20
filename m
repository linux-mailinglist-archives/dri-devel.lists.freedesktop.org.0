Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48506A6B00E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 22:43:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43BAA10E6D3;
	Thu, 20 Mar 2025 21:43:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=faith.ekstrand@collabora.com header.b="TO/aVex5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799B310E69B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 21:43:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742506979; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=l31UTGEK02odbRRsC0r/P2RXiGAPc02OuRFaLXQ4J4/x2s9o/99derN5b4zE+dz95jU31wCzR6XnnyBXkNE3vIo08P/HuGxRYP7FGQd9MWBHpzBhTj0OuSTKbF4VO7T356xJ5mwRuHZ5lH9lIC0kkYOLO/8/hayCsq9xZ9CI2+I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742506979;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ASON6OAwbDNGAjfaTRUk60d+6NarHIbWNJiV2Y8eipg=; 
 b=nsxJTe88OkHNWuZk6HyqDDzs9Cyl1fu+kY02cXt+p0bQNDhKbGGasEGYXBdpNFWZn51SiGY8LlDQHEoxx6dxknSIu85tPvKjs4pRJ1mE+5qxWQTtKhZG3jg49B8csn3zsRMS6m0ZtF8TYdhBxAtg4oVpUZFfyosbXuxhqxj0/+E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=faith.ekstrand@collabora.com;
 dmarc=pass header.from=<faith.ekstrand@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742506979; 
 s=zohomail; d=collabora.com; i=faith.ekstrand@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=ASON6OAwbDNGAjfaTRUk60d+6NarHIbWNJiV2Y8eipg=;
 b=TO/aVex5LkowIzqt7OhQv5ZRHntFeeM19nD5NzYqgSHJM0ZxnCP6aDn7nD5Svi/x
 UojVzYX1zHzUyB+mM4VY1L+2rGEz9SNmE78OUh0AJ+J9kT05jIOItQtVq33sBkgXJfA
 IBhDw0rkmN9QUfOrYU2BSe/3j8pL9nlrt8OJGq7Y=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1742506977365876.83249548266;
 Thu, 20 Mar 2025 14:42:57 -0700 (PDT)
Date: Thu, 20 Mar 2025 16:42:57 -0500
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
 "linux-doc" <linux-doc@vger.kernel.org>, "Asahi Lina" <lina@asahilina.net>
Message-ID: <195b582682b.121ba4d5e219032.3109114844776468245@collabora.com>
In-Reply-To: <195b507d4b3.b25d0dad175771.7566427576910952468@collabora.com>
References: <20250314-agx-uapi-v3-1-3abf7e74ea2f@rosenzweig.io>
 <195b507d4b3.b25d0dad175771.7566427576910952468@collabora.com>
Subject: Re: [PATCH v3] drm: Add UAPI for the Asahi driver
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

---- On Thu, 20 Mar 2025 14:29:04 -0500 Faith Ekstrand  wrote ---

 > ---- On Fri, 14 Mar 2025 18:23:16 -0500 Alyssa Rosenzweig  wrote ---=20
 > =20
 >  > This adds the UAPI for the Asahi driver targeting the GPU in the Appl=
e=20
 >  > M1 and M2 series systems on chip. The UAPI design is based on other=
=20
 >  > modern Vulkan-capable drivers, including Xe and Panthor. Memory=20
 >  > management is based on explicit VM management. Synchronization is=20
 >  > exclusively explicit sync.=20
 >  >=20
 >  > This UAPI is validated against our open source Mesa stack, which is=
=20
 >  > fully conformant to the OpenGL 4.6, OpenGL ES 3.2, OpenCL 3.0, and=20
 >  > Vulkan 1.4 standards. The Vulkan driver supports sparse, exercising t=
he=20
 >  > VM_BIND mechanism.=20
 >  >=20
 >  > This patch adds the standalone UAPI header. It is implemented by an o=
pen=20
 >  > source DRM driver written in Rust. We fully intend to upstream this=
=20
 >  > driver when possible. However, as a production graphics driver, it=20
 >  > depends on a significant number of Rust abstractions that will take a=
=20
 >  > long time to upstream. In the mean time, our userspace is upstream in=
=20
 >  > Mesa but is not allowed to probe with upstream Mesa as the UAPI is no=
t=20
 >  > yet reviewed and merged in the upstream kernel. Although we ship a=20
 >  > patched Mesa in Fedora Asahi Remix, any containers shipping upstream=
=20
 >  > Mesa builds are broken for our users, including upstream Flatpak and=
=20
 >  > Waydroid runtimes. Additionally, it forces us to maintain forks of Me=
sa=20
 >  > and virglrenderer, which complicates bisects.=20
 >  >=20
 >  > The intention in sending out this patch is for this UAPI to be=20
 >  > thoroughly reviewed. Once we as the DRM community are satisfied with =
the=20
 >  > UAPI, this header lands signifying that the UAPI is stable and must o=
nly=20
 >  > be evolved in backwards-compatible ways; it will be the UAPI implemen=
ted=20
 >  > in the DRM driver that eventually lands upstream. That promise lets u=
s=20
 >  > enable upstream Mesa, solving all these issues while the upstream Rus=
t=20
 >  > abstractions are developed.=20
 > =20
 > I'm good with this. There's a slim possibility that upstream may evolve =
in ways that make the current UAPI tricky to implement. However, given that=
 it's based on prior art from the nouveau, Intel, and panfrost teams and th=
at you've been shipping it in production for a while, I think that possibil=
ity is pretty remote.=20
 > =20
 >  > https://github.com/alyssarosenzweig/linux/commits/agx-uapi-v3 contain=
s=20
 >  > the DRM driver implementing this proposed UAPI.=20
 >  >=20
 >  > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33984 conta=
ins=20
 >  > the Mesa patches to implement this proposed UAPI. It is mirrored at=
=20
 >  > https://github.com/alyssarosenzweig/mesa/tree/agx-uapi-v3 to allow=20
 >  > continued review during upcoming gitlab.freedesktop.org downtime.=20
 >  >=20
 >  > That Linux and Mesa branch together give a complete graphics/compute=
=20
 >  > stack on top of this UAPI.=20
 >  >=20
 >  > Co-developed-by: Asahi Lina lina@asahilina.net>=20
 >  > Signed-off-by: Asahi Lina lina@asahilina.net>=20
 >  > Signed-off-by: Alyssa Rosenzweig alyssa@rosenzweig.io>=20
 >  > ---=20
 >  > Changes in v3:=20
 >  > - Merge load/store/partial fields for depth/stencil as discussed with=
=20
 >  >  Faith. This shrinks the submit a lot with little loss of=20
 >  >  functionality. There's maaaybe a use case for splitting out depth lo=
ad=20
 >  >  base (only) later. But it's easier to add uAPI than remove it!=20
 >  > - Make usc_exec_base per-queue instead of per-command. No use case fo=
r=20
 >  >  doing it finer grained, and this shrinks the submits and simplifies=
=20
 >  >  userspace handling.=20
 >  > - Improve descriptions.=20
 >  > - Reorder/shrink fields to remove padding.=20
 >  > - Use full names for vdm/cdm_ctrl_stream_base=20
 >  > - Link to v2: https://lore.kernel.org/r/20250313-agx-uapi-v2-1-59cc53=
a59ea3@rosenzweig.io=20
 >  >=20
 >  > Changes in v2:=20
 >  > - Flatten submits. Previously, the submit ioctl pointed to an array o=
f=20
 >  >  command structures, which each pointed to separate payload structure=
s,=20
 >  >  which pointed to attachment structures. This is a lot of indirection=
,=20
 >  >  which complicates greatly virtgpu. In the new approach, the submit=
=20
 >  >  ioctl points to a single contiguous blob of plain-old-data, no CPU=
=20
 >  >  pointers, copied from userspace in one go and suitable as virtgpu wi=
re=20
 >  >  protocol.=20
 >  > - Remove vm_page_size, userspace has to hardcode it anyway.=20
 >  > - Turn random #defines into enums for better kernel doc, etc.=20
 >  > - Improve comments, particularly around barriers[].=20
 >  > - Rename various flags/fields to better match canonical names when kn=
own=20
 >  >  (a lot of the names are pulled from the drivers/gpu/drm/imagination,=
=20
 >  >  naturally).=20
 >  > - Drop unnecessary encoder_id, cmd_id handles.=20
 >  > - Fix padding in submit ioctl (thanks Ryan).=20
 >  > - Link to v1: https://lore.kernel.org/r/20250310-agx-uapi-v1-1-86c809=
05004e@rosenzweig.io=20
 >  > ---=20
 >  >  Documentation/gpu/driver-uapi.rst |    5 +=20
 >  >  MAINTAINERS                       |    1 +=20
 >  >  include/uapi/drm/asahi_drm.h      | 1123 +++++++++++++++++++++++++++=
++++++++++=20
 >  >  3 files changed, 1129 insertions(+)=20
 >  >=20
 >  > diff --git a/Documentation/gpu/driver-uapi.rst b/Documentation/gpu/dr=
iver-uapi.rst=20
 >  > index 971cdb4816fc98d80a64d93637481d10c2e79718..1f15a8ca126516c23bd73=
74cc4aead0dfbbccf67 100644=20
 >  > --- a/Documentation/gpu/driver-uapi.rst=20
 >  > +++ b/Documentation/gpu/driver-uapi.rst=20
 >  > @@ -27,3 +27,8 @@ drm/xe uAPI=20
 >  >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=20
 >  >=20
 >  >  .. kernel-doc:: include/uapi/drm/xe_drm.h=20
 >  > +=20
 >  > +drm/asahi uAPI=20
 >  > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=20
 >  > +=20
 >  > +.. kernel-doc:: include/uapi/drm/asahi_drm.h=20
 >  > diff --git a/MAINTAINERS b/MAINTAINERS=20
 >  > index d1050702f681fbd0e4e2d0457b2ba569a64070d9..7f692a935808d4ec82ee7=
41324f8043302dae491 100644=20
 >  > --- a/MAINTAINERS=20
 >  > +++ b/MAINTAINERS=20
 >  > @@ -2256,6 +2256,7 @@ F:=C2=A0=C2=A0=C2=A0=C2=A0drivers/watchdog/appl=
e_wdt.c=20
 >  >  F:=C2=A0=C2=A0=C2=A0=C2=A0include/dt-bindings/interrupt-controller/a=
pple-aic.h=20
 >  >  F:=C2=A0=C2=A0=C2=A0=C2=A0include/dt-bindings/pinctrl/apple.h=20
 >  >  F:=C2=A0=C2=A0=C2=A0=C2=A0include/linux/soc/apple/*=20
 >  > +F:=C2=A0=C2=A0=C2=A0=C2=A0include/uapi/drm/asahi_drm.h=20
 >  >=20
 >  >  ARM/ARTPEC MACHINE SUPPORT=20
 >  >  M:=C2=A0=C2=A0=C2=A0=C2=A0Jesper Nilsson jesper.nilsson@axis.com>=20
 >  > diff --git a/include/uapi/drm/asahi_drm.h b/include/uapi/drm/asahi_dr=
m.h=20
 >  > new file mode 100644=20
 >  > index 0000000000000000000000000000000000000000..8954e71f0592c09c84da1=
b0783d973e0637b5559=20
 >  > --- /dev/null=20
 >  > +++ b/include/uapi/drm/asahi_drm.h=20
 >  > @@ -0,0 +1,1123 @@=20
 >  > +/* SPDX-License-Identifier: MIT */=20
 >  > +/*=20
 >  > + * Copyright (C) The Asahi Linux Contributors=20
 >  > + * Copyright (C) 2018-2023 Collabora Ltd.=20
 >  > + * Copyright (C) 2014-2018 Broadcom=20
 >  > + */=20
 >  > +#ifndef _ASAHI_DRM_H_=20
 >  > +#define _ASAHI_DRM_H_=20
 >  > +=20
 >  > +#include "drm.h"=20
 >  > +=20
 >  > +#if defined(__cplusplus)=20
 >  > +extern "C" {=20
 >  > +#endif=20
 >  > +=20
 >  > +/**=20
 >  > + * DOC: Introduction to the Asahi UAPI=20
 >  > + *=20
 >  > + * This documentation describes the Asahi IOCTLs.=20
 >  > + *=20
 >  > + * Just a few generic rules about the data passed to the Asahi IOCTL=
s (cribbed=20
 >  > + * from Panthor):=20
 >  > + *=20
 >  > + * - Structures must be aligned on 64-bit/8-byte. If the object is n=
ot=20
 >  > + *   naturally aligned, a padding field must be added.=20
 >  > + * - Fields must be explicitly aligned to their natural type alignme=
nt with=20
 >  > + *   pad[0..N] fields.=20
 >  > + * - All padding fields will be checked by the driver to make sure t=
hey are=20
 >  > + *   zeroed.=20
 >  > + * - Flags can be added, but not removed/replaced.=20
 >  > + * - New fields can be added to the main structures (the structures=
=20
 >  > + *   directly passed to the ioctl). Those fields can be added at the=
 end of=20
 >  > + *   the structure, or replace existing padding fields. Any new fiel=
d being=20
 >  > + *   added must preserve the behavior that existed before those fiel=
ds were=20
 >  > + *   added when a value of zero is passed.=20
 >  > + * - New fields can be added to indirect objects (objects pointed by=
 the=20
 >  > + *   main structure), iff those objects are passed a size to reflect=
 the=20
 >  > + *   size known by the userspace driver (see=20
 >  > + *   drm_asahi_command::cmd_buffer_size).=20
 >  > + * - If the kernel driver is too old to know some fields, those will=
 be=20
 >  > + *   ignored if zero, and otherwise rejected (and so will be zero on=
 output).=20
 >  > + * - If userspace is too old to know some fields, those will be zero=
ed=20
 >  > + *   (input) before the structure is parsed by the kernel driver.=20
 >  > + * - Each new flag/field addition must come with a driver version up=
date so=20
 >  > + *   the userspace driver doesn't have to trial and error to know wh=
ich=20
 >  > + *   flags are supported.=20
 >  > + * - Structures should not contain unions, as this would defeat the=
=20
 >  > + *   extensibility of such structures.=20
 >  > + * - IOCTLs can't be removed or replaced. New IOCTL IDs should be pl=
aced=20
 >  > + *   at the end of the drm_asahi_ioctl_id enum.=20
 >  > + */=20
 >  > +=20
 >  > +/**=20
 >  > + * enum drm_asahi_ioctl_id - IOCTL IDs=20
 >  > + *=20
 >  > + * Place new ioctls at the end, don't re-order, don't replace or rem=
ove entries.=20
 >  > + *=20
 >  > + * These IDs are not meant to be used directly. Use the DRM_IOCTL_AS=
AHI_xxx=20
 >  > + * definitions instead.=20
 >  > + */=20
 >  > +enum drm_asahi_ioctl_id {=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_GET_PARAMS: Query device prop=
erties. */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_GET_PARAMS =3D 0,=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_VM_CREATE: Create a GPU VM ad=
dress space. */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_VM_CREATE,=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_VM_DESTROY: Destroy a VM. */=
=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_VM_DESTROY,=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_GEM_CREATE: Create a buffer o=
bject. */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_GEM_CREATE,=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_ASAHI_GEM_MMAP_OFFSET: Get offset to=
 pass to mmap() to map a=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * given GEM handle.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_GEM_MMAP_OFFSET,=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_GEM_BIND: Bind/unbind memory =
to a VM. */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_GEM_BIND,=20
 > =20
 > I was about to complain about the GEM_BIND name but I actually prefer it=
. Given that it binds a single GEM object to a given range in a given VM, I=
 think it makes sense to have it be an option on the GEM object. If and whe=
n you implement a bind queue, you can use VM_BIND for the new multi-bind io=
ctl and that will be an operation on the VM that says "bind all this stuff,=
 here's some fences to know when."=20
 > =20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_QUEUE_CREATE: Create a schedu=
ling queue. */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_QUEUE_CREATE,=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_QUEUE_DESTROY: Destroy a sche=
duling queue. */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_QUEUE_DESTROY,=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_SUBMIT: Submit commands to a =
queue. */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_SUBMIT,=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_GET_TIME: Query device time. =
*/=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_GET_TIME,=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_GEM_BIND_OBJECT: Bind memory =
as a special object */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_GEM_BIND_OBJECT,=20
 >  > +};=20
 >  > +=20
 >  > +#define DRM_ASAHI_MAX_CLUSTERS=C2=A0=C2=A0=C2=A0=C2=A064=20
 >  > +=20
 >  > +/**=20
 >  > + * struct drm_asahi_params_global - Global parameters.=20
 >  > + *=20
 >  > + * This struct may be queried by drm_asahi_get_params.=20
 >  > + */=20
 >  > +struct drm_asahi_params_global {=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @features: Feature bits from drm_asahi_f=
eature */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 features;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @gpu_generation: GPU generation, e.g. 13=
 for G13G */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 gpu_generation;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @gpu_variant: GPU variant as a character=
, e.g. 'G' for G13G */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 gpu_variant;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @gpu_revision: GPU revision in BCD, e.g. =
0x00 for 'A0' or=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * 0x21 for 'C1'=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 gpu_revision;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @chip_id: Chip ID in BCD, e.g. 0x8103 fo=
r T8103 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 chip_id;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @num_dies: Number of dies in the SoC */=
=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 num_dies;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @num_clusters_total: Number of GPU clust=
ers (across all dies) */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 num_clusters_total;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @num_cores_per_cluster: Number of logical=
 cores per cluster=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * (including inactive/nonexistent)=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 num_cores_per_cluster;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @num_frags_per_cluster: Number of frags =
per cluster */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 num_frags_per_cluster;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @num_gps_per_cluster: Number of GPs per =
cluster */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 num_gps_per_cluster;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @max_power_mw: Maximum GPU power consump=
tion */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 max_power_mw;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @core_masks: Bitmask of present/enabled =
cores per cluster */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 core_masks[DRM_ASAHI_MAX_CLUSTERS];=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @timer_frequency_hz: Clock frequency for=
 timestamps */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 timer_frequency_hz;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @min_frequency_khz: Minimum GPU core clo=
ck frequency */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 min_frequency_khz;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @max_frequency_khz: Maximum GPU core clo=
ck frequency */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 max_frequency_khz;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @vm_user_start: VM user range start VMA =
*/=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 vm_user_start;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @vm_user_end: VM user range end VMA */=
=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 vm_user_end;=20
 > =20
 > Does this have to be chosen by the kernel? Are there fixed addresses cho=
sen by the firmware which need to be respected? Or is this just the range o=
f valid GPU addresses? I also see kernel start/end being passed in at VM cr=
eation. I'm confused. At the very least, this needs a much better comment t=
han the one above.=20
 > =20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @vm_kernel_min_size: Minimum kernel VMA w=
indow size within user=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * range=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 vm_kernel_min_size;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @max_commands_per_submission: Maximum num=
ber of supported commands=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * per submission=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 max_commands_per_submission;=20
 > =20
 > Pain. But we have this in nouveau as well, so...=20
 > =20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @max_attachments: Maximum number of drm_a=
sahi_attachment's per=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * command=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 max_attachments;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @firmware_version: GPU firmware version, =
as 4 integers=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 firmware_version[4];=20
 > =20
 > There's a part of me that's like "This should never matter. You shouldn'=
t expose that detail to userspace!" but let's be real...=20
 > =20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @user_timestamp_frequency_hz: Timebase fr=
equency for user timestamps=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 user_timestamp_frequency_hz;=20
 > =20
 > Why is this different? What are user timestamps and how are they differe=
nt from GPU timestamps?=20
 > =20
 >  > +};=20
 >  > +=20
 >  > +/**=20
 >  > + * enum drm_asahi_feature - Feature bits=20
 >  > + *=20
 >  > + * This covers only features that userspace cannot infer from the ar=
chitecture=20
 >  > + * version. Most features don't need to be here.=20
 >  > + */=20
 >  > +enum drm_asahi_feature {=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_ASAHI_FEATURE_SOFT_FAULTS: GPU has "=
soft fault" enabled. Shader=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * loads of unmapped memory will return zero=
. Shader stores to unmapped=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * memory will be silently discarded. Note t=
hat only shader load/store=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * is affected. Other hardware units are not=
 affected, notably including=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * texture sampling.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_FEATURE_SOFT_FAULTS =3D (1UL) << 0=
,=20
 >  > +};=20
 > =20
 > This makes me a little nervous. Why isn't this a bit you can set on VM c=
reation? If it's something that's chosen by the kernel and which userspace =
can query but not change, that seems problematic from a backwards compatibl=
ity PoV.=20
 > =20
 > Need to stop here for now.  I'll be back with more comments later.=20
 > =20
 > ~Faith=20
 > =20
 > =20
 >  > +=20
 >  > +/**=20
 >  > + * struct drm_asahi_get_params - Arguments passed to DRM_IOCTL_ASAHI=
_GET_PARAMS=20
 >  > + */=20
 >  > +struct drm_asahi_get_params {=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @param_group: Parameter group to fetch (=
MBZ) */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 param_group;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @pad: MBZ */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 pad;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @pointer: User pointer to write paramete=
r struct */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 pointer;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @size: Size of user buffer, max size sup=
ported on return */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 size;=20
 >  > +};=20
 >  > +=20
 >  > +/**=20
 >  > + * struct drm_asahi_vm_create - Arguments passed to DRM_IOCTL_ASAHI_=
VM_CREATE=20
 >  > + */=20
 >  > +struct drm_asahi_vm_create {=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @kernel_start: Start of the kernel-reser=
ved address range */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 kernel_start;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @kernel_end: End of the kernel-reserved =
address range */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 kernel_end;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @vm_id: Returned VM ID */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 vm_id;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @pad: MBZ */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 pad;=20
 >  > +};=20
 >  > +=20
 >  > +/**=20
 >  > + * struct drm_asahi_vm_destroy - Arguments passed to DRM_IOCTL_ASAHI=
_VM_DESTROY=20
 >  > + */=20
 >  > +struct drm_asahi_vm_destroy {=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @vm_id: VM ID to be destroyed */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 vm_id;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @pad: MBZ */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 pad;=20
 >  > +};=20
 >  > +=20
 >  > +/**=20
 >  > + * enum drm_asahi_gem_flags - Flags for GEM creation=20
 >  > + */=20
 >  > +enum drm_asahi_gem_flags {=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_ASAHI_GEM_WRITEBACK: BO should be CP=
U-mapped as writeback.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * Map as writeback instead of write-combine=
. This optimizes for CPU=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * reads.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_GEM_WRITEBACK =3D (1L << 0),=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_ASAHI_GEM_VM_PRIVATE: BO is private =
to this GPU VM (no exports).=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_GEM_VM_PRIVATE =3D (1L << 1),=20
 >  > +};=20
 >  > +=20
 >  > +/**=20
 >  > + * struct drm_asahi_gem_create - Arguments passed to DRM_IOCTL_ASAHI=
_GEM_CREATE=20
 >  > + */=20
 >  > +struct drm_asahi_gem_create {=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @size: Size of the BO */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 size;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @flags: Combination of drm_asahi_gem_fla=
gs flags. */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 flags;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @vm_id: VM ID to assign to the BO, if DRM=
_ASAHI_GEM_VM_PRIVATE is set=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 vm_id;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @handle: Returned GEM handle for the BO =
*/=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 handle;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @pad: MBZ */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 pad;=20
 >  > +};=20
 >  > +=20
 >  > +/**=20
 >  > + * struct drm_asahi_gem_mmap_offset - Arguments passed to=20
 >  > + * DRM_IOCTL_ASAHI_GEM_MMAP_OFFSET=20
 >  > + */=20
 >  > +struct drm_asahi_gem_mmap_offset {=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @handle: Handle for the object being map=
ped. */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 handle;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @flags: Must be zero */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 flags;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @offset: The fake offset to use for subs=
equent mmap call */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 offset;=20
 >  > +};=20
 >  > +=20
 >  > +/**=20
 >  > + * enum drm_asahi_bind_op - Bind operation=20
 >  > + */=20
 >  > +enum drm_asahi_bind_op {=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_BIND_OP_BIND: Bind a BO to a =
GPU VMA range */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_BIND_OP_BIND =3D 0,=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_BIND_OP_UNBIND: Unbind a GPU =
VMA range */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_BIND_OP_UNBIND =3D 1,=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_BIND_OP_UNBIND_ALL: Unbind al=
l mappings of a given BO */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_BIND_OP_UNBIND_ALL =3D 2,=20

Do you use this? We don't have it in nouveau and NVK gets by fine. Or does =
the asahi kernel do something where it expects you to unbind everything bef=
ore the buffer is really destroyed? I think I remember talking to Lina abou=
t this a while ago but I don't remember the details.

 >  > +};=20
 >  > +=20
 >  > +/**=20
 >  > + * enum drm_asahi_bind_flags - Flags for GEM binding=20
 >  > + */=20
 >  > +enum drm_asahi_bind_flags {=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_BIND_READ: Map BO with GPU re=
ad permission */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_BIND_READ =3D (1L << 0),=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_BIND_WRITE: Map BO with GPU w=
rite permission */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_BIND_WRITE =3D (1L << 1),=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_ASAHI_BIND_SINGLE_PAGE: Map a single=
 page of the BO repeatedly=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * across the VA range.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * This is useful to fill a VA range with sc=
ratch pages or zero pages.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * It is intended as a mechanism to accelera=
te sparse.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_BIND_SINGLE_PAGE =3D (1L << 2),=20

Does this require the BO to be a single page? If so, does it require offset=
=3D=3D0? Or does it just take whatever page is at the specified offset?

 >  > +};=20
 >  > +=20
 >  > +/**=20
 >  > + * struct drm_asahi_gem_bind - Arguments passed to=20
 >  > + * DRM_IOCTL_ASAHI_GEM_BIND=20
 >  > + */=20
 >  > +struct drm_asahi_gem_bind {=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @op: Bind operation (enum drm_asahi_bind=
_op) */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 op;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @flags: Combination of drm_asahi_bind_fl=
ags flags. */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 flags;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @handle: GEM object to bind/unbind (BIND=
 or UNBIND_ALL) */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 handle;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @vm_id: The ID of the VM to operate on *=
/=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 vm_id;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @offset: Offset into the object (BIND on=
ly) */=20

I guess this makes it look like SINGLE_PAGE requires offset=3D=3D0?

 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 offset;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @range: Number of bytes to bind/unbind to=
 addr (BIND or UNBIND only)=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 range;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @addr: Address to bind to (BIND or UNBIN=
D only) */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 addr;=20
 >  > +};=20
 >  > +=20
 >  > +/**=20
 >  > + * enum drm_asahi_bind_object_op - Special object bind operation=20
 >  > + */=20
 >  > +enum drm_asahi_bind_object_op {=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_BIND_OBJECT_OP_BIND: Bind a B=
O as a special GPU object */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_BIND_OBJECT_OP_BIND =3D 0,=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_BIND_OBJECT_OP_UNBIND: Unbind=
 a special GPU object */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_BIND_OBJECT_OP_UNBIND =3D 1,=20
 >  > +};=20
 >  > +=20
 >  > +/**=20
 >  > + * enum drm_asahi_bind_object_flags - Special object bind flags=20
 >  > + */=20
 >  > +enum drm_asahi_bind_object_flags {=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_ASAHI_BIND_OBJECT_USAGE_TIMESTAMPS: =
Map a BO as a timestamp=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * buffer.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_BIND_OBJECT_USAGE_TIMESTAMPS =3D (=
1L << 0),=20

Thanks. I hate it. But I guess NVIDIA has special pages, too.=20

 >  > +};=20
 >  > +=20
 >  > +/**=20
 >  > + * struct drm_asahi_gem_bind_object - Arguments passed to=20
 >  > + * DRM_IOCTL_ASAHI_GEM_BIND_OBJECT=20
 >  > + */=20
 >  > +struct drm_asahi_gem_bind_object {=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @op: Bind operation (enum drm_asahi_bind=
_object_op) */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 op;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @flags: Combination of drm_asahi_bind_ob=
ject_flags flags. */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 flags;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @handle: GEM object to bind/unbind (BIND=
) */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 handle;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @vm_id: The ID of the VM to operate on (=
MBZ currently) */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 vm_id;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @offset: Offset into the object (BIND on=
ly) */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 offset;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @range: Number of bytes to bind/unbind (=
BIND only) */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 range;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @object_handle: Object handle (out for B=
IND, in for UNBIND) */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 object_handle;=20

How is this different from the GEM handle? I mean, I know it's different, b=
ut What is this handle for? Just a thing we can pass in later?

 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @pad: MBZ */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 pad;=20
 >  > +};=20
 >  > +=20
 >  > +/**=20
 >  > + * enum drm_asahi_cmd_type - Command type=20
 >  > + */=20
 >  > +enum drm_asahi_cmd_type {=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_ASAHI_CMD_RENDER: Render command, ex=
ecuting on the render=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * subqueue. Combined vertex and fragment op=
eration.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * Followed by a @drm_asahi_cmd_render paylo=
ad.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_CMD_RENDER =3D 0,=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_ASAHI_CMD_COMPUTE: Compute command o=
n the compute subqueue.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * Followed by a @drm_asahi_cmd_compute payl=
oad.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_CMD_COMPUTE =3D 1,=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_ASAHI_SET_VERTEX_ATTACHMENTS: Softwa=
re command to set=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * attachments for subsequent vertex shaders=
 in the same submit.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * Followed by (possibly multiple) @drm_asah=
i_attachment payloads.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_SET_VERTEX_ATTACHMENTS =3D 2,=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_ASAHI_SET_FRAGMENT_ATTACHMENTS: Soft=
ware command to set=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * attachments for subsequent fragment shade=
rs in the same submit.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * Followed by (possibly multiple) @drm_asah=
i_attachment payloads.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_SET_FRAGMENT_ATTACHMENTS =3D 3,=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_ASAHI_SET_COMPUTE_ATTACHMENTS: Softw=
are command to set=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * attachments for subsequent compute shader=
s in the same submit.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * Followed by (possibly multiple) @drm_asah=
i_attachment payloads.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_SET_COMPUTE_ATTACHMENTS =3D 4,=20
 >  > +};=20
 >  > +=20
 >  > +/**=20
 >  > + * enum drm_asahi_queue_cap - Queue capabilities=20
 >  > + */=20
 >  > +enum drm_asahi_queue_cap {=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_QUEUE_CAP_RENDER: Supports re=
nder commands */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_QUEUE_CAP_RENDER=C2=A0=C2=A0=C2=A0=
=C2=A0=3D (1UL << DRM_ASAHI_CMD_RENDER),=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_QUEUE_CAP_COMPUTE: Supports c=
ompute commands */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_QUEUE_CAP_COMPUTE=C2=A0=C2=A0=C2=
=A0=C2=A0=3D (1UL << DRM_ASAHI_CMD_COMPUTE),=20
 >  > +};=20
 >  > +=20
 >  > +/**=20
 >  > + * struct drm_asahi_queue_create - Arguments passed to=20
 >  > + * DRM_IOCTL_ASAHI_QUEUE_CREATE=20
 >  > + */=20
 >  > +struct drm_asahi_queue_create {=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @flags: MBZ */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 flags;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @vm_id: The ID of the VM this queue is b=
ound to */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 vm_id;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @queue_caps: Bitmask of DRM_ASAHI_QUEUE_=
CAP_* */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 queue_caps;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @priority: Queue priority, 0-3 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 priority;=20

Is one of these priorities REALTIME and only usable by privileged apps? If =
so, maybe document that and/or have an enum?

 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @queue_id: The returned queue ID */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 queue_id;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @pad: MBZ */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 pad;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @usc_exec_base: GPU base address for all =
USC binaries (shaders) on=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * this queue. USC addresses are 32-bit rela=
tive to this 64-bit base.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * This sets the following registers on all =
queue commands:=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0USC_EXEC_BASE_TA  =
(vertex)=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0USC_EXEC_BASE_ISP =
(fragment)=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0USC_EXEC_BASE_CP  =
(compute)=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * While the hardware lets us configure thes=
e independently per command,=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * we do not have a use case for this. Inste=
ad, we expect userspace to=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * fix a 4GiB VA carveout for USC memory and=
 pass its base address here.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 usc_exec_base;=20

I mean, you could have a command for this or or something but meh. That can=
 be an extension on top of the current UAPI later if it's ever needed.

 >  > +};=20
 >  > +=20
 >  > +/**=20
 >  > + * struct drm_asahi_queue_destroy - Arguments passed to=20
 >  > + * DRM_IOCTL_ASAHI_QUEUE_DESTROY=20
 >  > + */=20
 >  > +struct drm_asahi_queue_destroy {=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @queue_id: The queue ID to be destroyed =
*/=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 queue_id;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @pad: MBZ */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 pad;=20
 >  > +};=20
 >  > +=20
 >  > +/**=20
 >  > + * enum drm_asahi_sync_type - Sync item type=20
 >  > + */=20
 >  > +enum drm_asahi_sync_type {=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_SYNC_SYNCOBJ: Binary sync obj=
ect */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_SYNC_SYNCOBJ =3D 0,=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_SYNC_TIMELINE_SYNCOBJ: Timeli=
ne sync object */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_SYNC_TIMELINE_SYNCOBJ =3D 1,=20
 >  > +};=20
 >  > +=20
 >  > +/**=20
 >  > + * struct drm_asahi_sync - Sync item=20
 >  > + */=20
 >  > +struct drm_asahi_sync {=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @sync_type: One of drm_asahi_sync_type *=
/=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 sync_type;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @handle: The sync object handle */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 handle;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @timeline_value: Timeline value for time=
line sync objects */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 timeline_value;=20
 >  > +};=20
 >  > +=20
 >  > +/**=20
 >  > + * enum drm_asahi_subqueue - Subqueue within a queue=20
 >  > + */=20
 >  > +enum drm_asahi_subqueue {=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_SUBQUEUE_RENDER: Render subqu=
eue */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_SUBQUEUE_RENDER =3D 0,=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @DRM_ASAHI_SUBQUEUE_COMPUTE: Compute sub=
queue */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_SUBQUEUE_COMPUTE =3D 1,=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_ASAHI_SUBQUEUE_COUNT: Queue count, m=
ust remain multiple of 2=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * for struct alignment=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_SUBQUEUE_COUNT =3D 2,=20
 >  > +};=20
 >  > +=20
 >  > +/**=20
 >  > + * define DRM_ASAHI_BARRIER_NONE - Command index for no barrier=20
 >  > + *=20
 >  > + * This special value may be passed in to drm_asahi_command::barrier=
s[] to=20
 >  > + * indicate that the respective subqueue should not wait on any prev=
ious work.=20
 >  > + */=20
 >  > +#define DRM_ASAHI_BARRIER_NONE (0xFFFFu)=20
 >  > +=20
 >  > +/**=20
 >  > + * struct drm_asahi_cmd_header - Top level command structure=20
 >  > + */=20
 >  > +struct drm_asahi_cmd_header {=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @cmd_type: One of drm_asahi_cmd_type */=
=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u16 cmd_type;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @size: Size of this command, not includin=
g this header.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * For hardware commands, this enables exten=
sibility of commands without=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * requiring extra command types.  Passing a=
 command that is shorter=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * than expected is explicitly allowed for b=
ackwards-compatability.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * Truncated fields will be zeroed.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * For the synthetic attachment setting comm=
ands, this implicitly=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * encodes the number of attachments. These =
commands take multiple=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * fixed-size @drm_asahi_attachment structur=
es as their payload, so size=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * equals number of attachments * sizeof(str=
uct drm_asahi_attachment).=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u16 size;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @barriers: Array of command indices per s=
ubqueue to wait on.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * Barriers are indices relative to the begi=
nning of a given submit. A=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * barrier of 0 waits on commands submitted =
to the subqueue in previous=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * submit ioctls. A barrier of N waits on N =
previous commands on the=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * subqueue within the current submit ioctl.=
 As a special case, passing=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_ASAHI_BARRIER_NONE avoids waiting on=
 any commands in the=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * subqueue.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * Examples:=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 *   (0, 0): This waits on all previous work=
.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 *   (NONE, 0): This waits on previously sub=
mitted compute commands but=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 *   does not wait on any render commands.=
=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 *   (1, NONE): This waits on the first rend=
er command in the submit.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 *   This only makes sense if there are mult=
iple render commands in the=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 *   same submit.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * Barriers only make sense for hardware com=
mands. Synthetic software=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * commands to set attachments must pass (NO=
NE, NONE) here.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u16 barriers[DRM_ASAHI_SUBQUEUE_COUNT];=20

I'm not sure how good of an idea this is. You said in the comment above tha=
t SUBQUEUE_COUNT must be a power of 2. However, once you use it to size an =
array in the command header, it can never change ever. I'm not sure what to=
 do about that. The command header being 8B is kinda nice... But also, will=
 we ever need more than 2? I'd hate to have to change the size of the heade=
r.

Another option would be to potentially have a barrier command which would t=
hen be extensible but that sounds kinda annoying.

 >  > +};=20
 >  > +=20
 >  > +/**=20
 >  > + * struct drm_asahi_submit - Arguments passed to DRM_IOCTL_ASAHI_SUB=
MIT=20
 >  > + */=20
 >  > +struct drm_asahi_submit {=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @in_syncs: An optional array of drm_asahi=
_sync to wait on before=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * starting this job.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 in_syncs;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @out_syncs: An optional array of drm_asah=
i_sync objects to signal=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * upon completion.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 out_syncs;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @cmdbuf: Pointer to the command buffer to=
 submit.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * This is a flat command buffer. By design,=
 it contains no CPU=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * pointers, which makes it suitable for a v=
irtgpu wire protocol without=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * requiring any serializing/deserializing s=
tep.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * It consists of a series of commands. Each=
 command begins with a=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * fixed-size @drm_asahi_cmd_header and is f=
ollowed by a variable-length=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * payload according to the type and size in=
 the header.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 cmdbuf;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @flags: Flags for command submission (MB=
Z) */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 flags;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @queue_id: The queue ID to be submitted =
to */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 queue_id;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @in_sync_count: Number of sync objects to=
 wait on before starting=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * this job.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 in_sync_count;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @out_sync_count: Number of sync objects t=
o signal upon completion of=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * this job.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 out_sync_count;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @cmdbuf_size: Command buffer size in byt=
es */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 cmdbuf_size;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @pad: MBZ */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 pad;=20
 >  > +};=20
 >  > +=20
 >  > +/**=20
 >  > + * struct drm_asahi_attachment - Describe an "attachment".=20
 >  > + *=20
 >  > + * Attachments are any memory written by shaders, notably including =
render=20
 >  > + * target attachments written by the end-of-tile program. This is pu=
rely a hint=20
 >  > + * about the accessed memory regions. It is optional to specify, whi=
ch is=20
 >  > + * fortunate as it cannot be specified precisely with bindless acces=
s anyway.=20
 >  > + * But where possible, it's probably a good idea for userspace to in=
clude these=20
 >  > + * hints, forwarded to the firmware.=20
 >  > + */=20
 >  > +struct drm_asahi_attachment {=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @pointer: Base address of the attachment=
 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 pointer;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @size: Size of the attachment in bytes *=
/=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 size;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @pad: MBZ */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 pad;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @flags: MBZ */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 flags;=20
 >  > +};=20
 >  > +=20
 >  > +enum drm_asahi_render_flags {=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_ASAHI_RENDER_VERTEX_SCRATCH: A verte=
x stage shader uses scratch=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * memory.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_RENDER_VERTEX_SCRATCH =3D (1U << 0=
),=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_ASAHI_RENDER_PROCESS_EMPTY_TILES: Pr=
ocess even empty tiles.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * This must be set when clearing render tar=
gets.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_RENDER_PROCESS_EMPTY_TILES =3D (1U=
 << 1),=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_ASAHI_RENDER_NO_VERTEX_CLUSTERING: R=
un vertex stage on a single=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * cluster (on multicluster GPUs)=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * This harms performance but can workaround=
 certain sync/coherency=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * bugs, and therefore is useful for debuggi=
ng.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_RENDER_NO_VERTEX_CLUSTERING =3D (1=
U << 2),=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_ASAHI_RENDER_DBIAS_IS_INT: Use integ=
er depth bias formula.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * Graphics specifications contain two alter=
nate formulas for depth=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * bias, a float formula used with floating-=
point depth buffers and an=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * integer formula using with unorm depth bu=
ffers. This flag specifies=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * that the integer formula should be used. =
If omitted, the float=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * formula is used instead.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * This corresponds to bit 18 of the relevan=
t hardware control register,=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * so we match that here for efficiency.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_ASAHI_RENDER_DBIAS_IS_INT =3D (1U << 18)=
,=20
 >  > +};=20
 >  > +=20
 >  > +/**=20
 >  > + * struct drm_asahi_zls_buffer - Describe a depth or stencil buffer.=
=20
 >  > + *=20
 >  > + * These fields correspond to hardware registers in the ZLS (Z Load/=
Store) unit.=20
 >  > + * There are three hardware registers for each field respectively fo=
r loads,=20
 >  > + * stores, and partial renders. In practice, it makes sense to set a=
ll to the=20
 >  > + * same values, except in exceptional cases not yet implemented in u=
serspace, so=20
 >  > + * we do not duplicate here for simplicity/efficiency.=20
 >  > + */=20
 >  > +struct drm_asahi_zls_buffer {=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @base: Base address of the buffer */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 base;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @comp_base: If the load buffer is compres=
sed, address of the=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * compression metadata section.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 comp_base;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @stride: If layered rendering is enabled,=
 the number of bytes=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * between each layer of the buffer.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 stride;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @comp_stride: If layered rendering is ena=
bled, the number of bytes=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * between each layer of the compression met=
adata.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 comp_stride;=20
 >  > +};=20
 >  > +=20
 >  > +/**=20
 >  > + * struct drm_asahi_timestamp - Describe a timestamp write.=20
 >  > + *=20
 >  > + * The firmware can optionally write the GPU timestamp at render pas=
s=20
 >  > + * granularities, but it needs to be mapped specially via=20
 >  > + * DRM_IOCTL_ASAHI_GEM_BIND_OBJECT. This structure therefore describ=
es where to=20
 >  > + * write as a handle-offset pair, rather than a GPU address like nor=
mal.=20

Given that this struct is embedded in other structs, it might be worth a co=
mment saying it can never be extended without breaking those structs.

 >  > + */=20
 >  > +struct drm_asahi_timestamp {=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @handle: Handle of the timestamp buffer, =
or 0 to skip this=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * timestamp. If nonzero, this must equal th=
e value returned in=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * drm_asahi_gem_bind_object::object_handle.=
=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 handle;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @offset: Offset to write into the timest=
amp buffer */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 offset;=20
 >  > +};=20
 >  > +=20
 >  > +/**=20
 >  > + * struct drm_asahi_timestamps - Describe timestamp writes.=20
 >  > + *=20
 >  > + * Each operation that can be timestamped, can be timestamped at the=
 start and=20
 >  > + * end. Therefore, drm_asahi_timestamp structs always come in pairs,=
 bundled=20
 >  > + * together into drm_asahi_timestamps.=20

Same comment here. This struct is not extensible.

 >  > + */=20
 >  > +struct drm_asahi_timestamps {=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @start: Timestamp recorded at the start =
of the operation */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0struct drm_asahi_timestamp start;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @end: Timestamp recorded at the end of t=
he operation */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0struct drm_asahi_timestamp end;=20
 >  > +};=20
 >  > +=20
 >  > +/**=20
 >  > + * struct drm_asahi_helper_program - Describe helper program configu=
ration.=20
 >  > + *=20
 >  > + * The helper program is a compute-like kernel required for various =
hardware=20
 >  > + * functionality. Its most important role is dynamically allocating=
=20
 >  > + * scratch/stack memory for individual subgroups, by partitioning a =
static=20
 >  > + * allocation shared for the whole device. It is supplied by userspa=
ce via=20
 >  > + * drm_asahi_helper_program and internally dispatched by the hardwar=
e as needed.=20

Same comment here. This struct is not extensible.

 >  > + */=20
 >  > +struct drm_asahi_helper_program {=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @binary: USC address to the helper progra=
m binary. This is a tagged=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * pointer with configuration in the bottom =
bits.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 binary;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @cfg: Configuration bits for the helper =
program. */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 cfg;=20

There's configuratin bits here and in the binary pointer abov?

 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @data: Data passed to the helper program.=
 This value is not=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * interpreted by the kernel, firmware, or h=
ardware in any way. It is=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * simply a sideband for userspace, set with=
 the submit ioctl and read=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * via special registers inside the helper p=
rogram.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * In practice, userspace will pass a 64-bit=
 GPU VA here pointing to the=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * actual arguments, which presumably don't =
fit in 64-bits.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 data;=20
 >  > +};=20
 >  > +=20
 >  > +/**=20
 >  > + * struct drm_asahi_bg_eot - Describe a background or end-of-tile pr=
ogram.=20
 >  > + *=20
 >  > + * The background and end-of-tile programs are dispatched by the har=
dware at the=20
 >  > + * beginning and end of rendering. As the hardware "tilebuffer" is s=
imply local=20
 >  > + * memory, these programs are necessary to implement API-level rende=
r targets.=20
 >  > + * The fragment-like background program is responsible for loading e=
ither the=20
 >  > + * clear colour or the existing render target contents, while the co=
mpute-like=20
 >  > + * end-of-tile program stores the tilebuffer contents to memory.=20

Same comment here. This struct is not extensible.

 >  > + */=20
 >  > +struct drm_asahi_bg_eot {=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @usc: USC address of the hardware USC wor=
ds binding resources=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * (including images and uniforms) and the p=
rogram itself. Note this is=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * an additional layer of indirection compar=
ed to the helper program,=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * avoiding the need for a sideband for data=
. This is a tagged pointer=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * with additional configuration in the bott=
om bits.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 usc;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @rsrc_spec: Resource specifier for the pr=
ogram. This is a packed=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * hardware data structure describing the re=
quired number of registers,=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * uniforms, bound textures, and bound sampl=
ers.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 rsrc_spec;=20
 >  > +};=20
 >  > +=20
 >  > +/**=20
 >  > + * struct drm_asahi_cmd_render - Command to submit 3D=20
 >  > + *=20
 >  > + * This command submits a single render pass. The hardware control s=
tream may=20
 >  > + * include many draws and subpasses, but within the command, the fra=
mebuffer=20
 >  > + * dimensions and attachments are fixed.=20
 >  > + *=20
 >  > + * The hardware requires the firmware to set a large number of Contr=
ol Registers=20
 >  > + * setting up state at render pass granularity before each command r=
endering 3D.=20
 >  > + * The firmware bundles this state into data structures. Unfortunate=
ly, we=20
 >  > + * cannot expose either any of that directly to userspace, because t=
he=20
 >  > + * kernel-firmware ABI is not stable. Although we can guarantee the =
firmware=20
 >  > + * updates in tandem with the kernel, we cannot break old userspace =
when=20
 >  > + * upgrading the firmware and kernel. Therefore, we need to abstract=
 well the=20
 >  > + * data structures to avoid tying our hands with future firmwares.=
=20
 >  > + *=20
 >  > + * The bulk of drm_asahi_cmd_render therefore consists of values of =
hardware=20
 >  > + * control registers, marshalled via the firmware interface.=20
 >  > + *=20
 >  > + * The framebuffer/tilebuffer dimensions are also specified here. In=
 addition to=20
 >  > + * being passed to the firmware/hardware, the kernel requires these =
dimensions=20
 >  > + * to calculate various essential tiling-related data structures. It=
 is=20
 >  > + * unfortunate that our submits are heavier than on vendors with san=
er=20
 >  > + * hardware-software interfaces. The upshot is all of this informati=
on is=20
 >  > + * readily available to userspace with all current APIs.=20
 >  > + *=20
 >  > + * It looks odd - but it's not overly burdensome and it ensures we c=
an remain=20
 >  > + * compatible with old userspace.=20
 >  > + */=20
 >  > +struct drm_asahi_cmd_render {=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @flags: Combination of drm_asahi_render_=
flags flags. */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 flags;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @isp_zls_pixels: ISP_ZLS_PIXELS register =
value. This contains the=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * depth/stencil width/height, which may dif=
fer from the framebuffer=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * width/height.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 isp_zls_pixels;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @vdm_ctrl_stream_base: VDM_CTRL_STREAM_BA=
SE register value. GPU=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * address to the beginning of the VDM contr=
ol stream.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 vdm_ctrl_stream_base;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @vertex_helper: Helper program used for =
the vertex shader */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0struct drm_asahi_helper_program vertex_helpe=
r;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @fragment_helper: Helper program used fo=
r the fragment shader */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0struct drm_asahi_helper_program fragment_hel=
per;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @isp_scissor_base: ISP_SCISSOR_BASE regis=
ter value. GPU address of an=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * array of scissor descriptors indexed in t=
he render pass.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 isp_scissor_base;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @isp_dbias_base: ISP_DBIAS_BASE register =
value. GPU address of an=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * array of depth bias values indexed in the=
 render pass.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 isp_dbias_base;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @isp_oclqry_base: ISP_OCLQRY_BASE registe=
r value. GPU address of an=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * array of occlusion query results written =
by the render pass.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 isp_oclqry_base;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @depth: Depth buffer */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0struct drm_asahi_zls_buffer depth;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @stencil: Stencil buffer */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0struct drm_asahi_zls_buffer stencil;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @zls_ctrl: ZLS_CTRL register value */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 zls_ctrl;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @ppp_multisamplectl: PPP_MULTISAMPLECTL =
register value */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 ppp_multisamplectl;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @sampler_heap: Base address of the sample=
r heap. This heap is used=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * for both vertex shaders and fragment shad=
ers. The registers are=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * per-stage, but there is no known use case=
 for separate heaps.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 sampler_heap;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @ppp_ctrl: PPP_CTRL register value */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 ppp_ctrl;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @width_px: Framebuffer width in pixels *=
/=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u16 width_px;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @height_px: Framebuffer height in pixels=
 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u16 height_px;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @layers: Number of layers in the framebu=
ffer */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u16 layers;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @sampler_count: Number of samplers in th=
e sampler heap. */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u16 sampler_count;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @utile_width_px: Width of a logical tile=
buffer tile in pixels */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u8 utile_width_px;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @utile_height_px: Height of a logical ti=
lebuffer tile in pixels */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u8 utile_height_px;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @samples: # of samples in the framebuffe=
r. Must be 1, 2, or 4. */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u8 samples;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @sample_size_B: # of bytes in the tilebu=
ffer required per sample. */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u8 sample_size_B;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @isp_merge_upper_x: 32-bit float used in =
the hardware triangle=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * merging. Calculate as: tan(60 deg) * widt=
h.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 *=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * Making these values UAPI avoids requiring=
 floating-point calculations=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * in the kernel in the hot path.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 isp_merge_upper_x;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @isp_merge_upper_y: 32-bit float. Calcula=
te as: tan(60 deg) * height.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * See @isp_merge_upper_x.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 isp_merge_upper_y;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @bg: Background program run for each til=
e at the start */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0struct drm_asahi_bg_eot bg;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @eot: End-of-tile program ran for each t=
ile at the end */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0struct drm_asahi_bg_eot eot;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @partial_bg: Background program ran at th=
e start of each tile when=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * resuming the render pass during a partial=
 render.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0struct drm_asahi_bg_eot partial_bg;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @partial_eot: End-of-tile program ran at =
the end of each tile when=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * pausing the render pass during a partial =
render.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0struct drm_asahi_bg_eot partial_eot;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @isp_bgobjdepth: ISP_BGOBJDEPTH register =
value. This is the depth=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * buffer clear value, encoded in the depth =
buffer's format: either a=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * 32-bit float or a 16-bit unorm (with uppe=
r bits zeroed).=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 isp_bgobjdepth;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @isp_bgobjvals: ISP_BGOBJVALS register va=
lue. The bottom 8-bits=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * contain the stencil buffer clear value.=
=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 isp_bgobjvals;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @ts_vtx: Timestamps for the vertex porti=
on of the render */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0struct drm_asahi_timestamps ts_vtx;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @ts_frag: Timestamps for the fragment po=
rtion of the render */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0struct drm_asahi_timestamps ts_frag;=20
 >  > +};=20
 >  > +=20
 >  > +/**=20
 >  > + * struct drm_asahi_cmd_compute - Command to submit compute=20
 >  > + *=20
 >  > + * This command submits a control stream consisting of compute dispa=
tches. There=20
 >  > + * is essentially no limit on how many compute dispatches may be inc=
luded in a=20
 >  > + * single compute command, although timestamps are at command granul=
arity.=20
 >  > + */=20
 >  > +struct drm_asahi_cmd_compute {=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @flags: MBZ */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 flags;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @sampler_count: Number of samplers in th=
e sampler heap. */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u32 sampler_count;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @cdm_ctrl_stream_base: CDM_CTRL_STREAM_BA=
SE register value. GPU=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * address to the beginning of the CDM contr=
ol stream.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 cdm_ctrl_stream_base;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/**=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * @cdm_ctrl_stream_end: GPU base address to=
 the end of the hardware=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * control stream. Note this only considers =
the first contiguous segment=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 * of the control stream, as the stream migh=
t jump elsewhere.=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0 */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 cdm_ctrl_stream_end;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @sampler_heap: Base address of the sampl=
er heap. */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 sampler_heap;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @helper: Helper program used for this co=
mpute shader */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0struct drm_asahi_helper_program helper;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @ts: Timestamps for the compute command =
*/=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0struct drm_asahi_timestamps ts;=20
 >  > +};=20
 >  > +=20
 >  > +/**=20
 >  > + * struct drm_asahi_get_time - Arguments passed to DRM_IOCTL_ASAHI_G=
ET_TIME=20
 >  > + */=20
 >  > +struct drm_asahi_get_time {=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @flags: MBZ. */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 flags;=20
 >  > +=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0/** @gpu_timestamp: On return, the current G=
PU timestamp */=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0__u64 gpu_timestamp;=20
 >  > +};=20
 >  > +=20
 >  > +/**=20
 >  > + * DRM_IOCTL_ASAHI() - Build an Asahi IOCTL number=20
 >  > + * @__access: Access type. Must be R, W or RW.=20
 >  > + * @__id: One of the DRM_ASAHI_xxx id.=20
 >  > + * @__type: Suffix of the type being passed to the IOCTL.=20
 >  > + *=20
 >  > + * Don't use this macro directly, use the DRM_IOCTL_ASAHI_xxx=20
 >  > + * values instead.=20
 >  > + *=20
 >  > + * Return: An IOCTL number to be passed to ioctl() from userspace.=
=20
 >  > + */=20
 >  > +#define DRM_IOCTL_ASAHI(__access, __id, __type) \=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_IO ## __access(DRM_COMMAND_BASE + DRM_AS=
AHI_ ## __id, \=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0   struct drm_asahi_ ## __type)=20
 >  > +=20
 >  > +/* Note: this is an enum so that it can be resolved by Rust bindgen.=
 */=20
 >  > +enum {=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_IOCTL_ASAHI_GET_PARAMS       =3D DRM_IOC=
TL_ASAHI(WR, GET_PARAMS, get_params),=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_IOCTL_ASAHI_VM_CREATE        =3D DRM_IOC=
TL_ASAHI(WR, VM_CREATE, vm_create),=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_IOCTL_ASAHI_VM_DESTROY       =3D DRM_IOC=
TL_ASAHI(W, VM_DESTROY, vm_destroy),=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_IOCTL_ASAHI_GEM_CREATE       =3D DRM_IOC=
TL_ASAHI(WR, GEM_CREATE, gem_create),=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_IOCTL_ASAHI_GEM_MMAP_OFFSET  =3D DRM_IOC=
TL_ASAHI(WR, GEM_MMAP_OFFSET, gem_mmap_offset),=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_IOCTL_ASAHI_GEM_BIND         =3D DRM_IOC=
TL_ASAHI(W, GEM_BIND, gem_bind),=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_IOCTL_ASAHI_QUEUE_CREATE     =3D DRM_IOC=
TL_ASAHI(WR, QUEUE_CREATE, queue_create),=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_IOCTL_ASAHI_QUEUE_DESTROY    =3D DRM_IOC=
TL_ASAHI(W, QUEUE_DESTROY, queue_destroy),=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_IOCTL_ASAHI_SUBMIT           =3D DRM_IOC=
TL_ASAHI(W, SUBMIT, submit),=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_IOCTL_ASAHI_GET_TIME         =3D DRM_IOC=
TL_ASAHI(WR, GET_TIME, get_time),=20
 >  > +=C2=A0=C2=A0=C2=A0=C2=A0DRM_IOCTL_ASAHI_GEM_BIND_OBJECT  =3D DRM_IOC=
TL_ASAHI(WR, GEM_BIND_OBJECT, gem_bind_object),=20
 >  > +};=20

Woo! I made it to the end. I think that's all for now. I mostly asked a lot=
 of questions.

~Faith


 >  > +=20
 >  > +#if defined(__cplusplus)=20
 >  > +}=20
 >  > +#endif=20
 >  > +=20
 >  > +#endif /* _ASAHI_DRM_H_ */=20
 >  >=20
 >  > ---=20
 >  > base-commit: 0ed1356af8f629ae807963b7db4e501e3b580bc2=20
 >  > change-id: 20250307-agx-uapi-930579437f19=20
 >  >=20
 >  > Best regards,=20
 >  > --=20
 >  > Alyssa Rosenzweig alyssa@rosenzweig.io>=20
 >  >=20
 >  >=20
 > =20
 >=20

