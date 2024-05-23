Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D638CDC26
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 23:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4574910EE96;
	Thu, 23 May 2024 21:34:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="K9AYo0Yd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383D010EE96
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 21:34:17 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a5a5cce2ce6so1074851766b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 14:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716500054; x=1717104854;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ko0jfOu97d2mmlgqllpiZWRABpSRQEy/2g3sYFnqXmY=;
 b=K9AYo0Yd0Ub/JJwmU1r4kAj0Zo0/emhtPH8tLKsy9q492K45QEfGSC03Z0Io7l3q4p
 qFR2MK5oLUaeP5rKKkN8QSdVgU7NKtKHGyK42Di1+zDlONIJ8HtHSdf0WF78PXLqXV52
 L8XFRcSj8RNTZBBB/+qWAHQjZ41Qrs0UR8fxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716500054; x=1717104854;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ko0jfOu97d2mmlgqllpiZWRABpSRQEy/2g3sYFnqXmY=;
 b=vDkQFcSG2d9p03NWewOUnq10e85tUG3Q5c6iHhb4JcnW5RitQov9ptZoHRfMS+3ahg
 inRnQO/Dq8NIukMpDUj3ZQWxAJu0Ev9eJcnLcVXOjPHPFBn07Pi7qIdY0jkiC8NLhMCk
 wmv8FhAArjXOrLG30FMv7uH3U01vbZT6MhQOOKjDYBA8V45tpyLot/Z6V4N/QfvpxU0H
 T0gEAc5QhK/1yCAQZeB9N9a/P2ihqemqP3Ysf5ipfSvsHlZHla6gbLuZstr25vXpV/wo
 j2Q3utfk1qGjdDzIAqvXBqPmvUcHenAQOatlJzZ1VBMgGX4TR0u33YBHPjnW+1/7d9NS
 dTkg==
X-Gm-Message-State: AOJu0YxwuqjL3FH2a35P08hITq61yXBx3qiockweOQeyJpYKUs0i9rYb
 iExtSUUu5lDIgEJPnWq4TdThaGUypcwPTRFUHu956XFodGeb1duRuXD3stUhh0n2fMnbBXLQime
 oUQ==
X-Google-Smtp-Source: AGHT+IHLeNc+9MRABgQwAxxBFMfvz+A5C5uV14xG7I9dwih0Gg0aIwD5ITqW3DbTIIQuJfMi/0bnNQ==
X-Received: by 2002:a17:906:8303:b0:a59:9e55:7489 with SMTP id
 a640c23a62f3a-a62642dab54mr26560566b.25.1716500054403; 
 Thu, 23 May 2024 14:34:14 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com.
 [209.85.208.43]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c9351d2sm14208066b.48.2024.05.23.14.34.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 May 2024 14:34:13 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5724736770cso1464a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 14:34:12 -0700 (PDT)
X-Received: by 2002:a05:6402:318b:b0:572:e6fb:ab07 with SMTP id
 4fb4d7f45d1cf-57855387ea6mr12782a12.7.1716500052157; Thu, 23 May 2024
 14:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240328083615.2662516-1-vivek.kasireddy@intel.com>
In-Reply-To: <20240328083615.2662516-1-vivek.kasireddy@intel.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Thu, 23 May 2024 14:33:59 -0700
X-Gmail-Original-Message-ID: <CAAfnVBkqvQCvDWH7_uCbRUbC6_hM-JG1Dna0kOqdYbs+YwwoWA@mail.gmail.com>
Message-ID: <CAAfnVBkqvQCvDWH7_uCbRUbC6_hM-JG1Dna0kOqdYbs+YwwoWA@mail.gmail.com>
Subject: Re: [RFC 0/7] drm/virtio: Import scanout buffers from other devices
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, 
 Dongwon Kim <dongwon.kim@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Christian Koenig <christian.koenig@amd.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Rob Clark <robdclark@chromium.org>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Oded Gabbay <ogabbay@kernel.org>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Michael Tretter <m.tretter@pengutronix.de>, Dominik Behr <dbehr@google.com>
Content-Type: multipart/alternative; boundary="000000000000de4306061925cfbd"
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

--000000000000de4306061925cfbd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 2:01=E2=80=AFAM Vivek Kasireddy <vivek.kasireddy@in=
tel.com>
wrote:

> Having virtio-gpu import scanout buffers (via prime) from other
> devices means that we'd be adding a head to headless GPUs assigned
> to a Guest VM or additional heads to regular GPU devices that are
> passthrough'd to the Guest. In these cases, the Guest compositor
> can render into the scanout buffer using a primary GPU and has the
> secondary GPU (virtio-gpu) import it for display purposes.
>
> The main advantage with this is that the imported scanout buffer can
> either be displayed locally on the Host (e.g, using Qemu + GTK UI)
> or encoded and streamed to a remote client (e.g, Qemu + Spice UI).
> Note that since Qemu uses udmabuf driver, there would be no copies
> made of the scanout buffer as it is displayed. This should be
> possible even when it might reside in device memory such has VRAM.
>
> The specific use-case that can be supported with this series is when
> running Weston or other guest compositors with "additional-devices"
> feature (./weston --drm-device=3Dcard1 --additional-devices=3Dcard0).
> More info about this feature can be found at:
> https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/736
>
> In the above scenario, card1 could be a dGPU or an iGPU and card0
> would be virtio-gpu in KMS only mode. However, the case where this
> patch series could be particularly useful is when card1 is a GPU VF
> that needs to share its scanout buffer (in a zero-copy way) with the
> GPU PF on the Host. Or, it can also be useful when the scanout buffer
> needs to be shared between any two GPU devices (assuming one of them
> is assigned to a Guest VM) as long as they are P2P DMA compatible.
>

Is passthrough iGPU-only or passthrough dGPU-only something you intend to
use?

If it's a dGPU + iGPU setup, then the way other people seem to do it is a
"virtualized" iGPU (via virgl/gfxstream/take your pick) and pass-through
the dGPU.

For example, AMD seems to use virgl to allocate and import into the dGPU.

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23896
https://lore.kernel.org/all/20231221100016.4022353-1-julia.zhang@amd.com/

ChromeOS also uses that method (see crrev.com/c/3764931) [cc: dGPU
architect +Dominik Behr <dbehr@google.com>]

So if iGPU + dGPU is the primary use case, you should be able to use these
methods as well.  The model would "virtualized iGPU" + passthrough dGPU,
not split SoCs.


> As part of the import, the virtio-gpu driver shares the dma
> addresses and lengths with Qemu which then determines whether the
> memory region they belong to is owned by a PCI device or whether it
> is part of the Guest's system ram. If it is the former, it identifies
> the devid (or bdf) and bar and provides this info (along with offsets
> and sizes) to the udmabuf driver. In the latter case, instead of the
> the devid and bar it provides the memfd. The udmabuf driver then
> creates a dmabuf using this info that Qemu shares with Spice for
> encode via Gstreamer.
>
> Note that the virtio-gpu driver registers a move_notify() callback
> to track location changes associated with the scanout buffer and
> sends attach/detach backing cmds to Qemu when appropriate. And,
> synchronization (that is, ensuring that Guest and Host are not
> using the scanout buffer at the same time) is ensured by pinning/
> unpinning the dmabuf as part of plane update and using a fence
> in resource_flush cmd.


I'm not sure how QEMU's display paths work, but with crosvm if you share
the guest-created dmabuf with the display, and the guest moves the backing
pages, the only recourse is the destroy the surface and show a black screen
to the user: not the best thing experience wise.

Only amdgpu calls dma_buf_move_notfiy(..), and you're probably testing on
Intel only, so you may not be hitting that code path anyways.  I forgot the
exact reason, but apparently udmabuf may not work with amdgpu displays and
it seems the virtualized iGPU + dGPU is the way to go for amdgpu anyways.
So I recommend just pinning the buffer for the lifetime of the import for
simplicity and correctness.


> This series is available at:
> https://gitlab.freedesktop.org/Vivek/drm-tip/-/commits/virtgpu_import_rfc
>
> along with additional patches for Qemu and Spice here:
> https://gitlab.freedesktop.org/Vivek/qemu/-/commits/virtgpu_dmabuf_pcidev
> https://gitlab.freedesktop.org/Vivek/spice/-/commits/encode_dmabuf_v4
>
> Patchset overview:
>
> Patch 1:   Implement VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING cmd
> Patch 2-3: Helpers to initalize, import, free imported object
> Patch 4-5: Import and use buffers from other devices for scanout
> Patch 6-7: Have udmabuf driver create dmabuf from PCI bars for P2P DMA
>
> This series is tested using the following method:
> - Run Qemu with the following relevant options:
>   qemu-system-x86_64 -m 4096m ....
>   -device vfio-pci,host=3D0000:03:00.0
>   -device virtio-vga,max_outputs=3D1,blob=3Dtrue,xres=3D1920,yres=3D1080
>   -spice
> port=3D3001,gl=3Don,disable-ticketing=3Don,preferred-codec=3Dgstreamer:h2=
64
>   -object memory-backend-memfd,id=3Dmem1,size=3D4096M
>   -machine memory-backend=3Dmem1 ...
> - Run upstream Weston with the following options in the Guest VM:
>   ./weston --drm-device=3Dcard1 --additional-devices=3Dcard0
>
> where card1 is a DG2 dGPU (passthrough'd and using xe driver in Guest VM)=
,
> card0 is virtio-gpu and the Host is using a RPL iGPU.
>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Dongwon Kim <dongwon.kim@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michael Tretter <m.tretter@pengutronix.de>
>
> Vivek Kasireddy (7):
>   drm/virtio: Implement VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING cmd
>   drm/virtio: Add a helper to map and note the dma addrs and lengths
>   drm/virtio: Add helpers to initialize and free the imported object
>   drm/virtio: Import prime buffers from other devices as guest blobs
>   drm/virtio: Ensure that bo's backing store is valid while updating
>     plane
>   udmabuf/uapi: Add new ioctl to create a dmabuf from PCI bar regions
>   udmabuf: Implement UDMABUF_CREATE_LIST_FOR_PCIDEV ioctl
>
>  drivers/dma-buf/udmabuf.c              | 122 ++++++++++++++++--
>  drivers/gpu/drm/virtio/virtgpu_drv.h   |   8 ++
>  drivers/gpu/drm/virtio/virtgpu_plane.c |  56 ++++++++-
>  drivers/gpu/drm/virtio/virtgpu_prime.c | 167 ++++++++++++++++++++++++-
>  drivers/gpu/drm/virtio/virtgpu_vq.c    |  15 +++
>  include/uapi/linux/udmabuf.h           |  11 +-
>  6 files changed, 368 insertions(+), 11 deletions(-)
>
> --
> 2.43.0
>
>

--000000000000de4306061925cfbd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 28, 2024 at 2:01=E2=80=AF=
AM Vivek Kasireddy &lt;<a href=3D"mailto:vivek.kasireddy@intel.com" target=
=3D"_blank">vivek.kasireddy@intel.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Having virtio-gpu import scanout buffe=
rs (via prime) from other<br>
devices means that we&#39;d be adding a head to headless GPUs assigned<br>
to a Guest VM or additional heads to regular GPU devices that are<br>
passthrough&#39;d to the Guest. In these cases, the Guest compositor<br>
can render into the scanout buffer using a primary GPU and has the<br>
secondary GPU (virtio-gpu) import it for display purposes.<br>
<br>
The main advantage with this is that the imported scanout buffer can<br>
either be displayed locally on the Host (e.g, using Qemu + GTK UI)<br>
or encoded and streamed to a remote client (e.g, Qemu + Spice UI).<br>
Note that since Qemu uses udmabuf driver, there would be no copies<br>
made of the scanout buffer as it is displayed. This should be<br>
possible even when it might reside in device memory such has VRAM.<br>
<br>
The specific use-case that can be supported with this series is when<br>
running Weston or other guest compositors with &quot;additional-devices&quo=
t;<br>
feature (./weston --drm-device=3Dcard1 --additional-devices=3Dcard0).<br>
More info about this feature can be found at:<br>
<a href=3D"https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/7=
36" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/way=
land/weston/-/merge_requests/736</a><br>
<br>
In the above scenario, card1 could be a dGPU or an iGPU and card0<br>
would be virtio-gpu in KMS only mode. However, the case where this<br>
patch series could be particularly useful is when card1 is a GPU VF<br>
that needs to share its scanout buffer (in a zero-copy way) with the<br>
GPU PF on the Host. Or, it can also be useful when the scanout buffer<br>
needs to be shared between any two GPU devices (assuming one of them<br>
is assigned to a Guest VM) as long as they are P2P DMA compatible.<br></blo=
ckquote><div><br></div><div>Is passthrough iGPU-only=C2=A0or passthrough dG=
PU-only something you intend to use?=C2=A0=C2=A0</div><div><br></div><div>I=
f it&#39;s a dGPU=C2=A0+ iGPU setup, then the way other people seem to do i=
t is a &quot;virtualized&quot; iGPU (via virgl/gfxstream/take your pick) an=
d pass-through the dGPU.</div><div><br></div><div>For example, AMD seems to=
 use virgl to allocate and import into the dGPU.</div><div><br></div><div><=
a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23896" =
target=3D"_blank">https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests=
/23896</a><br></div><div><a href=3D"https://lore.kernel.org/all/20231221100=
016.4022353-1-julia.zhang@amd.com/" target=3D"_blank">https://lore.kernel.o=
rg/all/20231221100016.4022353-1-julia.zhang@amd.com/</a><br></div><div><br>=
</div><div>ChromeOS also uses that method (see <a href=3D"http://crrev.com/=
c/3764931">crrev.com/c/3764931</a>) [cc: dGPU architect=C2=A0<a class=3D"gm=
ail_plusreply" id=3D"plusReplyChip-5" href=3D"mailto:dbehr@google.com" tabi=
ndex=3D"-1">+Dominik Behr</a>]</div><div><br></div><div>So if iGPU=C2=A0+ d=
GPU is the primary use case, you should be able to use these methods as wel=
l.=C2=A0 The model would &quot;virtualized iGPU&quot;=C2=A0+ passthrough dG=
PU, not split SoCs.=C2=A0=C2=A0</div><div>=C2=A0<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
As part of the import, the virtio-gpu driver shares the dma<br>
addresses and lengths with Qemu which then determines whether the<br>
memory region they belong to is owned by a PCI device or whether it<br>
is part of the Guest&#39;s system ram. If it is the former, it identifies<b=
r>
the devid (or bdf) and bar and provides this info (along with offsets<br>
and sizes) to the udmabuf driver. In the latter case, instead of the<br>
the devid and bar it provides the memfd. The udmabuf driver then<br>
creates a dmabuf using this info that Qemu shares with Spice for<br>
encode via Gstreamer.<br>
<br>
Note that the virtio-gpu driver registers a move_notify() callback<br>
to track location changes associated with the scanout buffer and<br>
sends attach/detach backing cmds to Qemu when appropriate. And,<br>
synchronization (that is, ensuring that Guest and Host are not<br>
using the scanout buffer at the same time) is ensured by pinning/<br>
unpinning the dmabuf as part of plane update and using a fence<br>
in resource_flush cmd.</blockquote><div><br></div><div>I&#39;m not sure how=
 QEMU&#39;s=C2=A0display paths work, but with crosvm if you share the guest=
-created dmabuf with the display, and the guest moves the backing pages, th=
e only recourse is the destroy the surface and show a black screen to the u=
ser: not the best thing experience wise.</div><div><br></div><div>Only amdg=
pu calls dma_buf_move_notfiy(..), and you&#39;re probably testing on Intel =
only,=C2=A0so you may not be hitting that code path anyways.=C2=A0 I forgot=
 the exact reason, but apparently udmabuf may not work with amdgpu displays=
 and it seems the virtualized iGPU=C2=A0+ dGPU is the way to go for amdgpu =
anyways.=C2=A0 So I recommend just pinning the buffer for the lifetime of t=
he import for simplicity and correctness.=C2=A0=C2=A0</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
This series is available at:<br>
<a href=3D"https://gitlab.freedesktop.org/Vivek/drm-tip/-/commits/virtgpu_i=
mport_rfc" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.=
org/Vivek/drm-tip/-/commits/virtgpu_import_rfc</a><br>
<br>
along with additional patches for Qemu and Spice here:<br>
<a href=3D"https://gitlab.freedesktop.org/Vivek/qemu/-/commits/virtgpu_dmab=
uf_pcidev" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.=
org/Vivek/qemu/-/commits/virtgpu_dmabuf_pcidev</a><br>
<a href=3D"https://gitlab.freedesktop.org/Vivek/spice/-/commits/encode_dmab=
uf_v4" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/=
Vivek/spice/-/commits/encode_dmabuf_v4</a> <br>
<br>
Patchset overview:<br>
<br>
Patch 1:=C2=A0 =C2=A0Implement VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING cmd<b=
r>
Patch 2-3: Helpers to initalize, import, free imported object<br>
Patch 4-5: Import and use buffers from other devices for scanout<br>
Patch 6-7: Have udmabuf driver create dmabuf from PCI bars for P2P DMA<br>
<br>
This series is tested using the following method:<br>
- Run Qemu with the following relevant options:<br>
=C2=A0 qemu-system-x86_64 -m 4096m ....<br>
=C2=A0 -device vfio-pci,host=3D0000:03:00.0<br>
=C2=A0 -device virtio-vga,max_outputs=3D1,blob=3Dtrue,xres=3D1920,yres=3D10=
80<br>
=C2=A0 -spice port=3D3001,gl=3Don,disable-ticketing=3Don,preferred-codec=3D=
gstreamer:h264<br>
=C2=A0 -object memory-backend-memfd,id=3Dmem1,size=3D4096M<br>
=C2=A0 -machine memory-backend=3Dmem1 ...<br>
- Run upstream Weston with the following options in the Guest VM:<br>
=C2=A0 ./weston --drm-device=3Dcard1 --additional-devices=3Dcard0<br>
<br>
where card1 is a DG2 dGPU (passthrough&#39;d and using xe driver in Guest V=
M),<br>
card0 is virtio-gpu and the Host is using a RPL iGPU.<br>
<br>
Cc: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank=
">kraxel@redhat.com</a>&gt;<br>
Cc: Dongwon Kim &lt;<a href=3D"mailto:dongwon.kim@intel.com" target=3D"_bla=
nk">dongwon.kim@intel.com</a>&gt;<br>
Cc: Daniel Vetter &lt;<a href=3D"mailto:daniel.vetter@ffwll.ch" target=3D"_=
blank">daniel.vetter@ffwll.ch</a>&gt;<br>
Cc: Christian Koenig &lt;<a href=3D"mailto:christian.koenig@amd.com" target=
=3D"_blank">christian.koenig@amd.com</a>&gt;<br>
Cc: Dmitry Osipenko &lt;<a href=3D"mailto:dmitry.osipenko@collabora.com" ta=
rget=3D"_blank">dmitry.osipenko@collabora.com</a>&gt;<br>
Cc: Rob Clark &lt;<a href=3D"mailto:robdclark@chromium.org" target=3D"_blan=
k">robdclark@chromium.org</a>&gt;<br>
Cc: Thomas Hellstr=C3=B6m &lt;<a href=3D"mailto:thomas.hellstrom@linux.inte=
l.com" target=3D"_blank">thomas.hellstrom@linux.intel.com</a>&gt;<br>
Cc: Oded Gabbay &lt;<a href=3D"mailto:ogabbay@kernel.org" target=3D"_blank"=
>ogabbay@kernel.org</a>&gt;<br>
Cc: Michal Wajdeczko &lt;<a href=3D"mailto:michal.wajdeczko@intel.com" targ=
et=3D"_blank">michal.wajdeczko@intel.com</a>&gt;<br>
Cc: Michael Tretter &lt;<a href=3D"mailto:m.tretter@pengutronix.de" target=
=3D"_blank">m.tretter@pengutronix.de</a>&gt;<br>
<br>
Vivek Kasireddy (7):<br>
=C2=A0 drm/virtio: Implement VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING cmd<br>
=C2=A0 drm/virtio: Add a helper to map and note the dma addrs and lengths<b=
r>
=C2=A0 drm/virtio: Add helpers to initialize and free the imported object<b=
r>
=C2=A0 drm/virtio: Import prime buffers from other devices as guest blobs<b=
r>
=C2=A0 drm/virtio: Ensure that bo&#39;s backing store is valid while updati=
ng<br>
=C2=A0 =C2=A0 plane<br>
=C2=A0 udmabuf/uapi: Add new ioctl to create a dmabuf from PCI bar regions<=
br>
=C2=A0 udmabuf: Implement UDMABUF_CREATE_LIST_FOR_PCIDEV ioctl<br>
<br>
=C2=A0drivers/dma-buf/udmabuf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 122 ++++++++++++++++--<br>
=C2=A0drivers/gpu/drm/virtio/virtgpu_drv.h=C2=A0 =C2=A0|=C2=A0 =C2=A08 ++<b=
r>
=C2=A0drivers/gpu/drm/virtio/virtgpu_plane.c |=C2=A0 56 ++++++++-<br>
=C2=A0drivers/gpu/drm/virtio/virtgpu_prime.c | 167 ++++++++++++++++++++++++=
-<br>
=C2=A0drivers/gpu/drm/virtio/virtgpu_vq.c=C2=A0 =C2=A0 |=C2=A0 15 +++<br>
=C2=A0include/uapi/linux/udmabuf.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 11 +-<br>
=C2=A06 files changed, 368 insertions(+), 11 deletions(-)<br>
<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div></div>

--000000000000de4306061925cfbd--
