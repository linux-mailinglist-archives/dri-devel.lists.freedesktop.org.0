Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F748D432B
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 03:49:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A2010E068;
	Thu, 30 May 2024 01:49:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="mCVpqDCw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E8410E068
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 01:49:50 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a6269885572so100996966b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 18:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717033788; x=1717638588;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Hg2wNLpo4usvaia/83QPwruqFlNldQw8w8hykHFpRXU=;
 b=mCVpqDCw4Sua9bojxfN0K/SpNRXXRYdqCoAQObcVpGYhA/p/yD/99aMhjYrT9os7x6
 2SGhzxHkFAaaf/AJVx6M0FDn/NHn8StHR/v2pOtwirYJkyZwpX4BHV1s9+3GKLxsaqNC
 ZooQ9GDWbpTF+po+98d/7l4X/TWa2/7irUXxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717033788; x=1717638588;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hg2wNLpo4usvaia/83QPwruqFlNldQw8w8hykHFpRXU=;
 b=hK9FUxzFVnFeEzQaPFjz/KyBGr/nxRhC6AiVc2oYAKXcNgaoOQ9KCvTznonyBGb6n3
 Cgs/JFNA24u1P5KSglfHJJ8nUIR2lJBM7VUl61gastXsUB+sDZ6lftkQqDb7zqWVn0Yq
 55Obz+6Pqe9NHkISDD7i/wUXYEH6I3f9Hw0zt3YC+oL8mJwgE0mJowHfj/0qtxKgoBBV
 8Epzzzo+qpliLvvdHQ4/z4hp+Xak8jdrHVD70m82HbAjvCzTUxgmY3G22FykwASELRWD
 c2jPSY/PEELz7qcKeT5TsuzJmkB64Vl6hv4d3A6xXqdjEmZvlTpddrLbrc61CAFIwf9D
 rGSQ==
X-Gm-Message-State: AOJu0YxfQI3chldRC4yuKsGCM0U9ip5eXkSN5dYxuCL5PFr1/eyCkCW6
 FpIXvVcMyTNzu+arTkmcJXW11fR0EHv/xb65F+WvCjk19Xxe30c2aKceKSMefso/t+ZHUHNiMYQ
 A6g==
X-Google-Smtp-Source: AGHT+IE9l3marY7XwUZO550ZhWYe+7MJMt0etDyoBOu9eHcS+f7HW1jWhMWuCwVoZS8ENJGKru4XmQ==
X-Received: by 2002:a17:906:1e49:b0:a59:a979:2b03 with SMTP id
 a640c23a62f3a-a65f0a6c2d6mr36573266b.23.1717033787827; 
 Wed, 29 May 2024 18:49:47 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com.
 [209.85.208.46]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cc8e2b2sm778175566b.171.2024.05.29.18.49.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 May 2024 18:49:47 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5750a8737e5so8072a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 18:49:46 -0700 (PDT)
X-Received: by 2002:a05:6402:18f:b0:579:c2f3:f826 with SMTP id
 4fb4d7f45d1cf-57a16ad29eemr96278a12.4.1717033786412; Wed, 29 May 2024
 18:49:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240328083615.2662516-1-vivek.kasireddy@intel.com>
 <CAAfnVBkqvQCvDWH7_uCbRUbC6_hM-JG1Dna0kOqdYbs+YwwoWA@mail.gmail.com>
 <IA0PR11MB7185C791BBD82291F56BF178F8F52@IA0PR11MB7185.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB7185C791BBD82291F56BF178F8F52@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Wed, 29 May 2024 18:49:33 -0700
X-Gmail-Original-Message-ID: <CAAfnVB=ufxDVN4uw-4V-_PUMNT5u=5NLuW85Edhqof_TNnfthA@mail.gmail.com>
Message-ID: <CAAfnVB=ufxDVN4uw-4V-_PUMNT5u=5NLuW85Edhqof_TNnfthA@mail.gmail.com>
Subject: Re: [RFC 0/7] drm/virtio: Import scanout buffers from other devices
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, 
 "Kim, Dongwon" <dongwon.kim@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Christian Koenig <christian.koenig@amd.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Rob Clark <robdclark@chromium.org>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Oded Gabbay <ogabbay@kernel.org>, "Wajdeczko,
 Michal" <Michal.Wajdeczko@intel.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, Dominik Behr <dbehr@google.com>
Content-Type: multipart/alternative; boundary="000000000000e868f70619a214a5"
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

--000000000000e868f70619a214a5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2024 at 11:33=E2=80=AFAM Kasireddy, Vivek <vivek.kasireddy@=
intel.com>
wrote:

> Hi,
>
> Sorry, my previous reply got messed up as a result of HTML formatting.
> This is
> a plain text version of the same reply.
>
> >
> >
> >       Having virtio-gpu import scanout buffers (via prime) from other
> >       devices means that we'd be adding a head to headless GPUs assigne=
d
> >       to a Guest VM or additional heads to regular GPU devices that are
> >       passthrough'd to the Guest. In these cases, the Guest compositor
> >       can render into the scanout buffer using a primary GPU and has th=
e
> >       secondary GPU (virtio-gpu) import it for display purposes.
> >
> >       The main advantage with this is that the imported scanout buffer
> can
> >       either be displayed locally on the Host (e.g, using Qemu + GTK UI=
)
> >       or encoded and streamed to a remote client (e.g, Qemu + Spice UI)=
.
> >       Note that since Qemu uses udmabuf driver, there would be no
> > copies
> >       made of the scanout buffer as it is displayed. This should be
> >       possible even when it might reside in device memory such has
> > VRAM.
> >
> >       The specific use-case that can be supported with this series is
> when
> >       running Weston or other guest compositors with "additional-device=
s"
> >       feature (./weston --drm-device=3Dcard1 --additional-devices=3Dcar=
d0).
> >       More info about this feature can be found at:
> >       https://gitlab.freedesktop.org/wayland/weston/-
> > /merge_requests/736
> >
> >       In the above scenario, card1 could be a dGPU or an iGPU and card0
> >       would be virtio-gpu in KMS only mode. However, the case where thi=
s
> >       patch series could be particularly useful is when card1 is a GPU =
VF
> >       that needs to share its scanout buffer (in a zero-copy way) with
> the
> >       GPU PF on the Host. Or, it can also be useful when the scanout
> buffer
> >       needs to be shared between any two GPU devices (assuming one of
> > them
> >       is assigned to a Guest VM) as long as they are P2P DMA compatible=
.
> >
> >
> >
> > Is passthrough iGPU-only or passthrough dGPU-only something you intend =
to
> > use?
> Our main use-case involves passthrough=E2=80=99g a headless dGPU VF devic=
e and
> sharing
> the Guest compositor=E2=80=99s scanout buffer with dGPU PF device on the =
Host.
> Same goal for
> headless iGPU VF to iGPU PF device as well.
>

Just to check my understanding: the same physical {i, d}GPU is partitioned
into the VF and PF, but the PF handles host-side display integration and
rendering?


> However, using a combination of iGPU and dGPU where either of them can be
> passthrough=E2=80=99d
> to the Guest is something I think can be supported with this patch series
> as well.
>
> >
> > If it's a dGPU + iGPU setup, then the way other people seem to do it is=
 a
> > "virtualized" iGPU (via virgl/gfxstream/take your pick) and pass-throug=
h
> the
> > dGPU.
> >
> > For example, AMD seems to use virgl to allocate and import into the dGP=
U.
> >
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23896
> >
> > https://lore.kernel.org/all/20231221100016.4022353-1-
> > julia.zhang@amd.com/
> >
> >
> > ChromeOS also uses that method (see crrev.com/c/3764931
> > <http://crrev.com/c/3764931> ) [cc: dGPU architect +Dominik Behr
> > <mailto:dbehr@google.com> ]
> >
> > So if iGPU + dGPU is the primary use case, you should be able to use
> these
> > methods as well.  The model would "virtualized iGPU" + passthrough dGPU=
,
> > not split SoCs.
> In our use-case, the goal is to have only one primary GPU (passthrough=E2=
=80=99d
> iGPU/dGPU)
> do all the rendering (using native DRI drivers) for clients/compositor an=
d
> all the outputs
> and share the scanout buffers with the secondary GPU (virtio-gpu). Since
> this is mostly
> how Mutter (and also Weston) work in a multi-GPU setup, I am not sure if
> virgl is needed.
>

I think you can probably use virgl with the PF and others probably will,
but supporting multiple methods in Linux is not unheard of.

Does your patchset need the Mesa kmsro patchset to function correctly?

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/9592

If so, I would try to get that reviewed first to meet DRM requirements (
https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspac=
e-requirements).
You might explicitly call out the design decision you're making: ("We can
probably use virgl as the virtualized iGPU via PF, but that adds
unnecessary complexity b/c ______").

And, doing it this way means that no other userspace components need to be
> modified
> on both the Guest and the Host.
>
> >
> >
> >
> >       As part of the import, the virtio-gpu driver shares the dma
> >       addresses and lengths with Qemu which then determines whether
> > the
> >       memory region they belong to is owned by a PCI device or whether =
it
> >       is part of the Guest's system ram. If it is the former, it
> identifies
> >       the devid (or bdf) and bar and provides this info (along with
> offsets
> >       and sizes) to the udmabuf driver. In the latter case, instead of
> the
> >       the devid and bar it provides the memfd. The udmabuf driver then
> >       creates a dmabuf using this info that Qemu shares with Spice for
> >       encode via Gstreamer.
> >
> >       Note that the virtio-gpu driver registers a move_notify() callbac=
k
> >       to track location changes associated with the scanout buffer and
> >       sends attach/detach backing cmds to Qemu when appropriate. And,
> >       synchronization (that is, ensuring that Guest and Host are not
> >       using the scanout buffer at the same time) is ensured by pinning/
> >       unpinning the dmabuf as part of plane update and using a fence
> >       in resource_flush cmd.
> >
> >
> > I'm not sure how QEMU's display paths work, but with crosvm if you shar=
e
> > the guest-created dmabuf with the display, and the guest moves the
> backing
> > pages, the only recourse is the destroy the surface and show a black
> screen
> > to the user: not the best thing experience wise.
> Since Qemu GTK UI uses EGL, there is a blit done from the guest=E2=80=99s=
 scanout
> buffer onto an EGL
> backed buffer on the Host. So, this problem would not happen as of now.
>

The guest kernel doesn't know you're using the QEMU GTK UI + EGL
host-side.

If somebody wants to use the virtio-gpu import mechanism with lower-level
Wayland-based display integration, then the problem would occur.

Perhaps, do that just to be safe unless you have performance concerns.

>
> > Only amdgpu calls dma_buf_move_notfiy(..), and you're probably testing =
on
> > Intel only, so you may not be hitting that code path anyways.
> I have tested with the Xe driver in the Guest which also calls
> dma_buf_move_notfiy(). But
> note that for dGPUs, both Xe and amdgpu migrate the scanout buffer from
> vram to system
> memory as part of export, because virtio-gpu is not P2P compatible.
> However, I am hoping
> to relax this (p2p check against virtio-gpu) in Xe driver if it detects
> that it is running in
> VF mode once the following patch series is merged:
>
> https://lore.kernel.org/dri-devel/20240422063602.3690124-1-vivek.kasiredd=
y@intel.com/
>
> > I forgot the
> > exact reason, but apparently udmabuf may not work with amdgpu displays
> > and it seems the virtualized iGPU + dGPU is the way to go for amdgpu
> > anyways.
> I would really like to know why udmabuf would not work with amdgpu?
>

It's just a rumor I heard, but the idea is udmabuf would be imported into
AMDGPU_GEM_DOMAIN_CPU only.

https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/amd/amdgpu/a=
mdgpu_dma_buf.c#n333

"AMDGPU_GEM_DOMAIN_CPU: System memory that is not GPU accessible. Memory in
this pool could be swapped out to disk if there is pressure."

https://dri.freedesktop.org/docs/drm/gpu/amdgpu.html

Perhaps that limitation is artificial and unnecessary, and it may indeed
work.  I don't think anybody has tried...


>
> > So I recommend just pinning the buffer for the lifetime of the
> > import for simplicity and correctness.
> Yeah, in this patch series, the dmabuf is indeed pinned, but only for a
> short duration in the Guest =E2=80=93
> just until the Host is done using it (blit or encode).
>
> Thanks,
> Vivek
>
> >
> >
> >       This series is available at:
> >       https://gitlab.freedesktop.org/Vivek/drm-tip/-
> > /commits/virtgpu_import_rfc
> >
> >       along with additional patches for Qemu and Spice here:
> >       https://gitlab.freedesktop.org/Vivek/qemu/-
> > /commits/virtgpu_dmabuf_pcidev
> >       https://gitlab.freedesktop.org/Vivek/spice/-
> > /commits/encode_dmabuf_v4
> >
> >       Patchset overview:
> >
> >       Patch 1:   Implement
> > VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING cmd
> >       Patch 2-3: Helpers to initalize, import, free imported object
> >       Patch 4-5: Import and use buffers from other devices for scanout
> >       Patch 6-7: Have udmabuf driver create dmabuf from PCI bars for P2=
P
> > DMA
> >
> >       This series is tested using the following method:
> >       - Run Qemu with the following relevant options:
> >         qemu-system-x86_64 -m 4096m ....
> >         -device vfio-pci,host=3D0000:03:00.0
> >         -device virtio-vga,max_outputs=3D1,blob=3Dtrue,xres=3D1920,yres=
=3D1080
> >         -spice port=3D3001,gl=3Don,disable-ticketing=3Don,preferred-
> > codec=3Dgstreamer:h264
> >         -object memory-backend-memfd,id=3Dmem1,size=3D4096M
> >         -machine memory-backend=3Dmem1 ...
> >       - Run upstream Weston with the following options in the Guest VM:
> >         ./weston --drm-device=3Dcard1 --additional-devices=3Dcard0
> >
> >       where card1 is a DG2 dGPU (passthrough'd and using xe driver in
> > Guest VM),
> >       card0 is virtio-gpu and the Host is using a RPL iGPU.
> >
> >       Cc: Gerd Hoffmann <kraxel@redhat.com
> > <mailto:kraxel@redhat.com> >
> >       Cc: Dongwon Kim <dongwon.kim@intel.com
> > <mailto:dongwon.kim@intel.com> >
> >       Cc: Daniel Vetter <daniel.vetter@ffwll.ch
> > <mailto:daniel.vetter@ffwll.ch> >
> >       Cc: Christian Koenig <christian.koenig@amd.com
> > <mailto:christian.koenig@amd.com> >
> >       Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com
> > <mailto:dmitry.osipenko@collabora.com> >
> >       Cc: Rob Clark <robdclark@chromium.org
> > <mailto:robdclark@chromium.org> >
> >       Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com
> > <mailto:thomas.hellstrom@linux.intel.com> >
> >       Cc: Oded Gabbay <ogabbay@kernel.org
> > <mailto:ogabbay@kernel.org> >
> >       Cc: Michal Wajdeczko <michal.wajdeczko@intel.com
> > <mailto:michal.wajdeczko@intel.com> >
> >       Cc: Michael Tretter <m.tretter@pengutronix.de
> > <mailto:m.tretter@pengutronix.de> >
> >
> >       Vivek Kasireddy (7):
> >         drm/virtio: Implement
> > VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING cmd
> >         drm/virtio: Add a helper to map and note the dma addrs and
> > lengths
> >         drm/virtio: Add helpers to initialize and free the imported
> object
> >         drm/virtio: Import prime buffers from other devices as guest
> blobs
> >         drm/virtio: Ensure that bo's backing store is valid while
> updating
> >           plane
> >         udmabuf/uapi: Add new ioctl to create a dmabuf from PCI bar
> > regions
> >         udmabuf: Implement UDMABUF_CREATE_LIST_FOR_PCIDEV ioctl
> >
> >        drivers/dma-buf/udmabuf.c              | 122 ++++++++++++++++--
> >        drivers/gpu/drm/virtio/virtgpu_drv.h   |   8 ++
> >        drivers/gpu/drm/virtio/virtgpu_plane.c |  56 ++++++++-
> >        drivers/gpu/drm/virtio/virtgpu_prime.c | 167
> > ++++++++++++++++++++++++-
> >        drivers/gpu/drm/virtio/virtgpu_vq.c    |  15 +++
> >        include/uapi/linux/udmabuf.h           |  11 +-
> >        6 files changed, 368 insertions(+), 11 deletions(-)
> >
> >       --
> >       2.43.0
> >
> >
>
>

--000000000000e868f70619a214a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 24, 2024 at 11:33=E2=80=
=AFAM Kasireddy, Vivek &lt;<a href=3D"mailto:vivek.kasireddy@intel.com" tar=
get=3D"_blank">vivek.kasireddy@intel.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
Sorry, my previous reply got messed up as a result of HTML formatting. This=
 is<br>
a plain text version of the same reply.<br>
<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Having virtio-gpu import scanout buffers (vi=
a prime) from other<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0devices means that we&#39;d be adding a head=
 to headless GPUs assigned<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0to a Guest VM or additional heads to regular=
 GPU devices that are<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0passthrough&#39;d to the Guest. In these cas=
es, the Guest compositor<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0can render into the scanout buffer using a p=
rimary GPU and has the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0secondary GPU (virtio-gpu) import it for dis=
play purposes.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0The main advantage with this is that the imp=
orted scanout buffer can<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0either be displayed locally on the Host (e.g=
, using Qemu + GTK UI)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0or encoded and streamed to a remote client (=
e.g, Qemu + Spice UI).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Note that since Qemu uses udmabuf driver, th=
ere would be no<br>
&gt; copies<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0made of the scanout buffer as it is displaye=
d. This should be<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0possible even when it might reside in device=
 memory such has<br>
&gt; VRAM.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0The specific use-case that can be supported =
with this series is when<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0running Weston or other guest compositors wi=
th &quot;additional-devices&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0feature (./weston --drm-device=3Dcard1 --add=
itional-devices=3Dcard0).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0More info about this feature can be found at=
:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://gitlab.freedesktop.org/wa=
yland/weston/-" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedes=
ktop.org/wayland/weston/-</a><br>
&gt; /merge_requests/736<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0In the above scenario, card1 could be a dGPU=
 or an iGPU and card0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0would be virtio-gpu in KMS only mode. Howeve=
r, the case where this<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0patch series could be particularly useful is=
 when card1 is a GPU VF<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0that needs to share its scanout buffer (in a=
 zero-copy way) with the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0GPU PF on the Host. Or, it can also be usefu=
l when the scanout buffer<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0needs to be shared between any two GPU devic=
es (assuming one of<br>
&gt; them<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0is assigned to a Guest VM) as long as they a=
re P2P DMA compatible.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; Is passthrough iGPU-only or passthrough dGPU-only something you intend=
 to<br>
&gt; use?<br>
Our main use-case involves passthrough=E2=80=99g a headless dGPU VF device =
and sharing<br>
the Guest compositor=E2=80=99s scanout buffer with dGPU PF device on the Ho=
st. Same goal for<br>
headless iGPU VF to iGPU PF device as well.<br></blockquote><div><br></div>=
<div>Just to check my understanding: the same physical {i, d}GPU is partiti=
oned into the VF and PF, but the PF handles host-side display integration a=
nd rendering?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
However, using a combination of iGPU and dGPU where either of them can be p=
assthrough=E2=80=99d<br>
to the Guest is something I think can be supported with this patch series a=
s well.<br>
<br>
&gt; <br>
&gt; If it&#39;s a dGPU + iGPU setup, then the way other people seem to do =
it is a<br>
&gt; &quot;virtualized&quot; iGPU (via virgl/gfxstream/take your pick) and =
pass-through the<br>
&gt; dGPU.<br>
&gt; <br>
&gt; For example, AMD seems to use virgl to allocate and import into the dG=
PU.<br>
&gt; <br>
&gt; <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/2=
3896" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/m=
esa/mesa/-/merge_requests/23896</a><br>
&gt; <br>
&gt; <a href=3D"https://lore.kernel.org/all/20231221100016.4022353-1-" rel=
=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/all/2023122110001=
6.4022353-1-</a><br>
&gt; <a href=3D"http://julia.zhang@amd.com/" rel=3D"noreferrer" target=3D"_=
blank">julia.zhang@amd.com/</a><br>
&gt; <br>
&gt; <br>
&gt; ChromeOS also uses that method (see <a href=3D"http://crrev.com/c/3764=
931" rel=3D"noreferrer" target=3D"_blank">crrev.com/c/3764931</a><br>
&gt; &lt;<a href=3D"http://crrev.com/c/3764931" rel=3D"noreferrer" target=
=3D"_blank">http://crrev.com/c/3764931</a>&gt; ) [cc: dGPU architect +Domin=
ik Behr<br>
&gt; &lt;mailto:<a href=3D"mailto:dbehr@google.com" target=3D"_blank">dbehr=
@google.com</a>&gt; ]<br>
&gt; <br>
&gt; So if iGPU + dGPU is the primary use case, you should be able to use t=
hese<br>
&gt; methods as well.=C2=A0 The model would &quot;virtualized iGPU&quot; + =
passthrough dGPU,<br>
&gt; not split SoCs.<br>
In our use-case, the goal is to have only one primary GPU (passthrough=E2=
=80=99d iGPU/dGPU)<br>
do all the rendering (using native DRI drivers) for clients/compositor and =
all the outputs<br>
and share the scanout buffers with the secondary GPU (virtio-gpu). Since th=
is is mostly<br>
how Mutter (and also Weston) work in a multi-GPU setup, I am not sure if vi=
rgl is needed.<br></blockquote><div><br></div><div>I think you can probably=
 use virgl with the PF and others probably will, but supporting multiple me=
thods in Linux is not unheard=C2=A0of.=C2=A0=C2=A0</div><div><br></div><div=
>Does your patchset need the Mesa kmsro patchset to function correctly?=C2=
=A0</div><div><br></div><div><div><a href=3D"https://gitlab.freedesktop.org=
/mesa/mesa/-/merge_requests/9592" target=3D"_blank">https://gitlab.freedesk=
top.org/mesa/mesa/-/merge_requests/9592</a><br></div><div><br></div><div>If=
 so, I would try to get that reviewed first to meet DRM requirements (<a hr=
ef=3D"https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-us=
erspace-requirements" target=3D"_blank">https://dri.freedesktop.org/docs/dr=
m/gpu/drm-uapi.html#open-source-userspace-requirements</a>).=C2=A0 You migh=
t explicitly call out the design decision you&#39;re making: (&quot;We can =
probably use virgl as the virtualized iGPU via PF, but that adds unnecessar=
y complexity b/c ______&quot;).=C2=A0 =C2=A0</div></div><div><br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">And, doing it this way means =
that no other userspace components need to be modified<br>
on both the Guest and the Host.<br>
<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0As part of the import, the virtio-gpu driver=
 shares the dma<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0addresses and lengths with Qemu which then d=
etermines whether<br>
&gt; the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0memory region they belong to is owned by a P=
CI device or whether it<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0is part of the Guest&#39;s system ram. If it=
 is the former, it identifies<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0the devid (or bdf) and bar and provides this=
 info (along with offsets<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0and sizes) to the udmabuf driver. In the lat=
ter case, instead of the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0the devid and bar it provides the memfd. The=
 udmabuf driver then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0creates a dmabuf using this info that Qemu s=
hares with Spice for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0encode via Gstreamer.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Note that the virtio-gpu driver registers a =
move_notify() callback<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0to track location changes associated with th=
e scanout buffer and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sends attach/detach backing cmds to Qemu whe=
n appropriate. And,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0synchronization (that is, ensuring that Gues=
t and Host are not<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0using the scanout buffer at the same time) i=
s ensured by pinning/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unpinning the dmabuf as part of plane update=
 and using a fence<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0in resource_flush cmd.<br>
&gt; <br>
&gt; <br>
&gt; I&#39;m not sure how QEMU&#39;s display paths work, but with crosvm if=
 you share<br>
&gt; the guest-created dmabuf with the display, and the guest moves the bac=
king<br>
&gt; pages, the only recourse is the destroy the surface and show a black s=
creen<br>
&gt; to the user: not the best thing experience wise.<br>
Since Qemu GTK UI uses EGL, there is a blit done from the guest=E2=80=99s s=
canout buffer onto an EGL<br>
backed buffer on the Host. So, this problem would not happen as of now.<br>=
</blockquote><div><br></div><div>The guest kernel doesn&#39;t know you&#39;=
re using the QEMU GTK UI=C2=A0+ EGL host-side.=C2=A0=C2=A0</div><div><br></=
div><div>If somebody wants to use the virtio-gpu import mechanism with lowe=
r-level Wayland-based display integration, then the problem would occur.=C2=
=A0=C2=A0</div><div><br></div><div>Perhaps,=C2=A0do that just to be safe un=
less you have performance concerns.=C2=A0 =C2=A0 =C2=A0</div><div><br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; <br>
&gt; Only amdgpu calls dma_buf_move_notfiy(..), and you&#39;re probably tes=
ting on<br>
&gt; Intel only, so you may not be hitting that code path anyways.<br>
I have tested with the Xe driver in the Guest which also calls dma_buf_move=
_notfiy(). But<br>
note that for dGPUs, both Xe and amdgpu migrate the scanout buffer from vra=
m to system<br>
memory as part of export, because virtio-gpu is not P2P compatible. However=
, I am hoping<br>
to relax this (p2p check against virtio-gpu) in Xe driver if it detects tha=
t it is running in<br>
VF mode once the following patch series is merged:<br>
<a href=3D"https://lore.kernel.org/dri-devel/20240422063602.3690124-1-vivek=
.kasireddy@intel.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.ke=
rnel.org/dri-devel/20240422063602.3690124-1-vivek.kasireddy@intel.com/</a><=
br>
<br>
&gt; I forgot the<br>
&gt; exact reason, but apparently udmabuf may not work with amdgpu displays=
<br>
&gt; and it seems the virtualized iGPU + dGPU is the way to go for amdgpu<b=
r>
&gt; anyways. <br>
I would really like to know why udmabuf would not work with amdgpu?<br></bl=
ockquote><div><br></div><div>It&#39;s just a rumor I heard, but the idea is=
 udmabuf would be imported into AMDGPU_GEM_DOMAIN_CPU only.</div><br><div><=
a href=3D"https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/am=
d/amdgpu/amdgpu_dma_buf.c#n333">https://cgit.freedesktop.org/drm/drm-misc/t=
ree/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c#n333</a></div><div><br></di=
v><div>&quot;AMDGPU_GEM_DOMAIN_CPU: System memory that is not GPU accessibl=
e. Memory in this pool could be swapped out to disk if there is pressure.&q=
uot;</div><div><br></div><div><a href=3D"https://dri.freedesktop.org/docs/d=
rm/gpu/amdgpu.html">https://dri.freedesktop.org/docs/drm/gpu/amdgpu.html</a=
><br></div><div><br></div><div>Perhaps that limitation is artificial and un=
necessary, and it may indeed work.=C2=A0 I don&#39;t think anybody has trie=
d...</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
&gt; So I recommend just pinning the buffer for the lifetime of the<br>
&gt; import for simplicity and correctness.<br>
Yeah, in this patch series, the dmabuf is indeed pinned, but only for a sho=
rt duration in the Guest =E2=80=93<br>
just until the Host is done using it (blit or encode).<br>
<br>
Thanks,<br>
Vivek<br>
<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0This series is available at:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://gitlab.freedesktop.org/Vi=
vek/drm-tip/-" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesk=
top.org/Vivek/drm-tip/-</a><br>
&gt; /commits/virtgpu_import_rfc<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0along with additional patches for Qemu and S=
pice here:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://gitlab.freedesktop.org/Vi=
vek/qemu/-" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop=
.org/Vivek/qemu/-</a><br>
&gt; /commits/virtgpu_dmabuf_pcidev<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://gitlab.freedesktop.org/Vi=
vek/spice/-" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedeskto=
p.org/Vivek/spice/-</a><br>
&gt; /commits/encode_dmabuf_v4<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Patchset overview:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Patch 1:=C2=A0 =C2=A0Implement<br>
&gt; VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING cmd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Patch 2-3: Helpers to initalize, import, fre=
e imported object<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Patch 4-5: Import and use buffers from other=
 devices for scanout<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Patch 6-7: Have udmabuf driver create dmabuf=
 from PCI bars for P2P<br>
&gt; DMA<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0This series is tested using the following me=
thod:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- Run Qemu with the following relevant optio=
ns:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu-system-x86_64 -m 4096m ....<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-device vfio-pci,host=3D0000:03:00.0<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-device virtio-vga,max_outputs=3D1,bl=
ob=3Dtrue,xres=3D1920,yres=3D1080<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-spice port=3D3001,gl=3Don,disable-ti=
cketing=3Don,preferred-<br>
&gt; codec=3Dgstreamer:h264<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-object memory-backend-memfd,id=3Dmem=
1,size=3D4096M<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-machine memory-backend=3Dmem1 ...<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- Run upstream Weston with the following opt=
ions in the Guest VM:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0./weston --drm-device=3Dcard1 --addit=
ional-devices=3Dcard0<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0where card1 is a DG2 dGPU (passthrough&#39;d=
 and using xe driver in<br>
&gt; Guest VM),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0card0 is virtio-gpu and the Host is using a =
RPL iGPU.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Cc: Gerd Hoffmann &lt;<a href=3D"mailto:krax=
el@redhat.com" target=3D"_blank">kraxel@redhat.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank">krax=
el@redhat.com</a>&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Cc: Dongwon Kim &lt;<a href=3D"mailto:dongwo=
n.kim@intel.com" target=3D"_blank">dongwon.kim@intel.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:dongwon.kim@intel.com" target=3D"_blank">=
dongwon.kim@intel.com</a>&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Cc: Daniel Vetter &lt;<a href=3D"mailto:dani=
el.vetter@ffwll.ch" target=3D"_blank">daniel.vetter@ffwll.ch</a><br>
&gt; &lt;mailto:<a href=3D"mailto:daniel.vetter@ffwll.ch" target=3D"_blank"=
>daniel.vetter@ffwll.ch</a>&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Cc: Christian Koenig &lt;<a href=3D"mailto:c=
hristian.koenig@amd.com" target=3D"_blank">christian.koenig@amd.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:christian.koenig@amd.com" target=3D"_blan=
k">christian.koenig@amd.com</a>&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Cc: Dmitry Osipenko &lt;<a href=3D"mailto:dm=
itry.osipenko@collabora.com" target=3D"_blank">dmitry.osipenko@collabora.co=
m</a><br>
&gt; &lt;mailto:<a href=3D"mailto:dmitry.osipenko@collabora.com" target=3D"=
_blank">dmitry.osipenko@collabora.com</a>&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Cc: Rob Clark &lt;<a href=3D"mailto:robdclar=
k@chromium.org" target=3D"_blank">robdclark@chromium.org</a><br>
&gt; &lt;mailto:<a href=3D"mailto:robdclark@chromium.org" target=3D"_blank"=
>robdclark@chromium.org</a>&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Cc: Thomas Hellstr=C3=B6m &lt;<a href=3D"mai=
lto:thomas.hellstrom@linux.intel.com" target=3D"_blank">thomas.hellstrom@li=
nux.intel.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:thomas.hellstrom@linux.intel.com" target=
=3D"_blank">thomas.hellstrom@linux.intel.com</a>&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Cc: Oded Gabbay &lt;<a href=3D"mailto:ogabba=
y@kernel.org" target=3D"_blank">ogabbay@kernel.org</a><br>
&gt; &lt;mailto:<a href=3D"mailto:ogabbay@kernel.org" target=3D"_blank">oga=
bbay@kernel.org</a>&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Cc: Michal Wajdeczko &lt;<a href=3D"mailto:m=
ichal.wajdeczko@intel.com" target=3D"_blank">michal.wajdeczko@intel.com</a>=
<br>
&gt; &lt;mailto:<a href=3D"mailto:michal.wajdeczko@intel.com" target=3D"_bl=
ank">michal.wajdeczko@intel.com</a>&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Cc: Michael Tretter &lt;<a href=3D"mailto:m.=
tretter@pengutronix.de" target=3D"_blank">m.tretter@pengutronix.de</a><br>
&gt; &lt;mailto:<a href=3D"mailto:m.tretter@pengutronix.de" target=3D"_blan=
k">m.tretter@pengutronix.de</a>&gt; &gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Vivek Kasireddy (7):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm/virtio: Implement<br>
&gt; VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING cmd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm/virtio: Add a helper to map and n=
ote the dma addrs and<br>
&gt; lengths<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm/virtio: Add helpers to initialize=
 and free the imported object<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm/virtio: Import prime buffers from=
 other devices as guest blobs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm/virtio: Ensure that bo&#39;s back=
ing store is valid while updating<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0plane<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0udmabuf/uapi: Add new ioctl to create=
 a dmabuf from PCI bar<br>
&gt; regions<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0udmabuf: Implement UDMABUF_CREATE_LIS=
T_FOR_PCIDEV ioctl<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 drivers/dma-buf/udmabuf.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 122 ++++++++++++++++--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 drivers/gpu/drm/virtio/virtgpu_drv.h=C2=A0 =
=C2=A0|=C2=A0 =C2=A08 ++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 drivers/gpu/drm/virtio/virtgpu_plane.c |=C2=
=A0 56 ++++++++-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 drivers/gpu/drm/virtio/virtgpu_prime.c | 16=
7<br>
&gt; ++++++++++++++++++++++++-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 drivers/gpu/drm/virtio/virtgpu_vq.c=C2=A0 =
=C2=A0 |=C2=A0 15 +++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 include/uapi/linux/udmabuf.h=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 11 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 6 files changed, 368 insertions(+), 11 dele=
tions(-)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A02.43.0<br>
&gt; <br>
&gt; <br>
<br>
</blockquote></div></div>

--000000000000e868f70619a214a5--
