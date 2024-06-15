Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F643909500
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2024 02:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A1BB10E2D3;
	Sat, 15 Jun 2024 00:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="jjpNuK67";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1466210E2D3
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 00:19:57 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a6f0c3d0792so335125566b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 17:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718410794; x=1719015594;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=j5fi9VLn/EhWN5eFqrIA+Ho6DWhGdhQB4lw9eh24rTo=;
 b=jjpNuK67SAL/SJ8um2M7RpzzC4lf4IFN3eCdGS535vqsnG9VI8yZKbafJSbLT1Xx5E
 ATwQEMwu8nC1bfBe6whmVS/i9BdASLwKTdc4dvpgPrFt7PgTVLvWjhaUrHA3igVyRgL6
 Pr2wXC0dx6T6CLb4dSXY6SihI6frfdOD/Rfyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718410794; x=1719015594;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j5fi9VLn/EhWN5eFqrIA+Ho6DWhGdhQB4lw9eh24rTo=;
 b=FEE74KH1T9o/g4eUTdkpXaBWjRL3MAT/i/hxkQFBqm/ugyEPM3g+DmiakRWj1drVn+
 6VeoOllHEYpaEb6intXsuLo3RgAktWKlTexU4RMvZRHErOJXqomWzs+n2wJ9YGNKljJY
 msIyj2an8Mf9SE2ZU1aCJR5mO9mavTCwKIlKg3tjwG6oryxkJeOS0z4d9FNnyabTSdkj
 ZXD0Q+QdELbDTXMydnJdE1dJbSOyWoyYPIOmJgzKQygJJhBOC1DV70M4R52H6OgTHoTM
 kctiQwr64dCwgEjO3bqSWjJLr91Iyet/erM1ZRHLBXEE78EVaHR2/QY7VCJCrKN0IuEB
 r69A==
X-Gm-Message-State: AOJu0YwWQq4qXIOwDe/Rlkzii2bjJka/iH6QuAHTU9jn5zuH6xG4NHqc
 XgAjkjgcG09hDLbPvH00xhJ5YzkQqx7srLPTMt5o7Mcp6PR6bLWq6a+Az+evm0PW0O4xK2oIrnL
 +hzlC
X-Google-Smtp-Source: AGHT+IFzAGMlIxuarf14KCBw/LQVYmKaVjwmeoJrLJDiJBeVNdgqEU+LjK+8tEvge8qorIcHWJxvzg==
X-Received: by 2002:a17:906:a897:b0:a6f:e36:abae with SMTP id
 a640c23a62f3a-a6f60d41741mr236836666b.42.1718410794093; 
 Fri, 14 Jun 2024 17:19:54 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com.
 [209.85.128.43]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56da3f41sm237476966b.33.2024.06.14.17.19.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jun 2024 17:19:53 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-422954bbe29so13225e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 17:19:52 -0700 (PDT)
X-Received: by 2002:a05:600c:1f15:b0:423:798:38e3 with SMTP id
 5b1f17b1804b1-423b6691387mr381005e9.5.1718410792464; Fri, 14 Jun 2024
 17:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240328083615.2662516-1-vivek.kasireddy@intel.com>
 <CAAfnVBkqvQCvDWH7_uCbRUbC6_hM-JG1Dna0kOqdYbs+YwwoWA@mail.gmail.com>
 <IA0PR11MB7185C791BBD82291F56BF178F8F52@IA0PR11MB7185.namprd11.prod.outlook.com>
 <CAAfnVB=ufxDVN4uw-4V-_PUMNT5u=5NLuW85Edhqof_TNnfthA@mail.gmail.com>
 <IA0PR11MB7185B7AE4423B860B124D701F8F32@IA0PR11MB7185.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB7185B7AE4423B860B124D701F8F32@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Fri, 14 Jun 2024 17:19:39 -0700
X-Gmail-Original-Message-ID: <CAAfnVB=ZbiOtvpwJDnsawz3JmPf_G2KqpfGKOwTHvGZ-t00VyA@mail.gmail.com>
Message-ID: <CAAfnVB=ZbiOtvpwJDnsawz3JmPf_G2KqpfGKOwTHvGZ-t00VyA@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="000000000000dd92c0061ae2b0e6"
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

--000000000000dd92c0061ae2b0e6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2024 at 12:21=E2=80=AFAM Kasireddy, Vivek <vivek.kasireddy@=
intel.com>
wrote:

> Hi Gurchetan,
>
> >
> > On Fri, May 24, 2024 at 11:33=E2=80=AFAM Kasireddy, Vivek
> > <vivek.kasireddy@intel.com <mailto:vivek.kasireddy@intel.com> > wrote:
> >
> >
> >       Hi,
> >
> >       Sorry, my previous reply got messed up as a result of HTML
> > formatting. This is
> >       a plain text version of the same reply.
> >
> >       >
> >       >
> >       >       Having virtio-gpu import scanout buffers (via prime) from
> other
> >       >       devices means that we'd be adding a head to headless GPUs
> > assigned
> >       >       to a Guest VM or additional heads to regular GPU devices
> that
> > are
> >       >       passthrough'd to the Guest. In these cases, the Guest
> > compositor
> >       >       can render into the scanout buffer using a primary GPU an=
d
> has
> > the
> >       >       secondary GPU (virtio-gpu) import it for display purposes=
.
> >       >
> >       >       The main advantage with this is that the imported scanout
> > buffer can
> >       >       either be displayed locally on the Host (e.g, using Qemu =
+
> GTK
> > UI)
> >       >       or encoded and streamed to a remote client (e.g, Qemu +
> Spice
> > UI).
> >       >       Note that since Qemu uses udmabuf driver, there would be =
no
> >       > copies
> >       >       made of the scanout buffer as it is displayed. This shoul=
d
> be
> >       >       possible even when it might reside in device memory such
> has
> >       > VRAM.
> >       >
> >       >       The specific use-case that can be supported with this
> series is
> > when
> >       >       running Weston or other guest compositors with "additiona=
l-
> > devices"
> >       >       feature (./weston --drm-device=3Dcard1 --additional-
> > devices=3Dcard0).
> >       >       More info about this feature can be found at:
> >       >       https://gitlab.freedesktop.org/wayland/weston/-
> >       > /merge_requests/736
> >       >
> >       >       In the above scenario, card1 could be a dGPU or an iGPU a=
nd
> > card0
> >       >       would be virtio-gpu in KMS only mode. However, the case
> > where this
> >       >       patch series could be particularly useful is when card1 i=
s
> a GPU
> > VF
> >       >       that needs to share its scanout buffer (in a zero-copy
> way) with
> > the
> >       >       GPU PF on the Host. Or, it can also be useful when the
> scanout
> > buffer
> >       >       needs to be shared between any two GPU devices (assuming
> > one of
> >       > them
> >       >       is assigned to a Guest VM) as long as they are P2P DMA
> > compatible.
> >       >
> >       >
> >       >
> >       > Is passthrough iGPU-only or passthrough dGPU-only something you
> > intend to
> >       > use?
> >       Our main use-case involves passthrough=E2=80=99g a headless dGPU =
VF device
> > and sharing
> >       the Guest compositor=E2=80=99s scanout buffer with dGPU PF device=
 on the
> > Host. Same goal for
> >       headless iGPU VF to iGPU PF device as well.
> >
> >
> >
> > Just to check my understanding: the same physical {i, d}GPU is
> partitioned
> > into the VF and PF, but the PF handles host-side display integration an=
d
> > rendering?
> Yes, that is mostly right. In a nutshell, the same physical GPU is
> partitioned
> into one PF device and multiple VF devices. Only the PF device has access
> to
> the display hardware and can do KMS (on the Host). The VF devices are
> headless with no access to display hardware (cannot do KMS but can do
> render/
> encode/decode) and are generally assigned (or passthrough'd) to the Guest
> VMs.
> Some more details about this model can be found here:
>
> https://lore.kernel.org/dri-devel/20231110182231.1730-1-michal.wajdeczko@=
intel.com/
>
> >
> >
> >       However, using a combination of iGPU and dGPU where either of
> > them can be passthrough=E2=80=99d
> >       to the Guest is something I think can be supported with this patc=
h
> > series as well.
> >
> >       >
> >       > If it's a dGPU + iGPU setup, then the way other people seem to
> do it
> > is a
> >       > "virtualized" iGPU (via virgl/gfxstream/take your pick) and pas=
s-
> > through the
> >       > dGPU.
> >       >
> >       > For example, AMD seems to use virgl to allocate and import into
> > the dGPU.
> >       >
> >       > https://gitlab.freedesktop.org/mesa/mesa/-
> > /merge_requests/23896
> >       >
> >       > https://lore.kernel.org/all/20231221100016.4022353-1-
> >       > julia.zhang@amd.com/ <http://julia.zhang@amd.com/>
> >       >
> >       >
> >       > ChromeOS also uses that method (see crrev.com/c/3764931
> > <http://crrev.com/c/3764931>
> >       > <http://crrev.com/c/3764931> ) [cc: dGPU architect +Dominik Beh=
r
> >       > <mailto:dbehr@google.com <mailto:dbehr@google.com> > ]
> >       >
> >       > So if iGPU + dGPU is the primary use case, you should be able t=
o
> > use these
> >       > methods as well.  The model would "virtualized iGPU" +
> > passthrough dGPU,
> >       > not split SoCs.
> >       In our use-case, the goal is to have only one primary GPU
> > (passthrough=E2=80=99d iGPU/dGPU)
> >       do all the rendering (using native DRI drivers) for
> clients/compositor
> > and all the outputs
> >       and share the scanout buffers with the secondary GPU (virtio-gpu)=
.
> > Since this is mostly
> >       how Mutter (and also Weston) work in a multi-GPU setup, I am not
> > sure if virgl is needed.
> >
> >
> >
> > I think you can probably use virgl with the PF and others probably will=
,
> but
> > supporting multiple methods in Linux is not unheard of.
> In our case, we have an alternative SR-IOV based GPU
> virtualization/partitioning
> model (as described above) where a Guest VM will have access to a
> hardware-accelerated
> GPU VF device for its rendering/encode/decode needs. So, in this
> situation, using
> virgl will become redundant and unnecessary.
>
> And, in this model, we intend to use virtio-gpu for KMS in the Guest VM
> (since the
> GPU VF device cannot do KMS) with the addition of this patchset. However,
> note that,
> since not all GPU SKUs/versions have the SRIOV capability, we plan on
> using virgl in
> those cases where it becomes necessary.
>
> >
> > Does your patchset need the Mesa kmsro patchset to function correctly?
> >
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/9592
> This patchset is an alternative proposal. So, KMSRO would not be needed.
> AFAICS, the above MR is mainly stalled because KMSRO uses dumb buffers
> which are not suitable for hardware-based rendering in all cases. And,
> KMSRO
> is not really helpful performance-wise with dGPUs, as it forces most
> buffers to
> be allocated from system memory.
>

Previously, it was recommended when exploring VDMABUF: "the /important/
thing is that the driver which exports the dma-buf (and thus handles the
mappings) must be aware of the virtualization so it can properly coordinate
things with the host side."

https://patchwork.kernel.org/project/linux-media/patch/20210203073517.19088=
82-3-vivek.kasireddy@intel.com/#23975915


So that's why the KMSRO approach was tried  (virtio-gpu dumb allocations,
not i915).  But as you point out, nobody uses dumb buffers for
hardware-based rendering.

So, if you are going with i915 allocates + virtio-gpu imports,  it should
be fine if you fixed all the issues with i915 allocates + VDMABUF imports.
It seems your fixes add complexity in VFIO and other places, but having
virtio-gpu 3d + virgl allocate adds complexity to Mesa-based allocation
paths (i915, amdgpu would all have to open virtio-gpu render node, and pick
a context type etc.).

I would just do virtio-gpu allocates, since it only requires user-space
patches and no extra ioctls, but that reflects my preferences.  If the
mm/VFIO/QEMU people are fine with your approach, I see nothing wrong with
merging it.

The one caveat is if someone uses a non-GTK/EGL host path, we'll have to
pin memory for the lifetime of the import, since knowing RESOURCE_FLUSH is
done is not sufficient.  But if you're only using it, it shouldn't be an
issue right now.


>
> >
> >
> > If so, I would try to get that reviewed first to meet DRM requirements
> > (https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-
> > userspace-requirements).  You might explicitly call out the design
> decision
> > you're making: ("We can probably use virgl as the virtualized iGPU via
> PF, but
> > that adds unnecessary complexity b/c ______").
> As I described above, what we have is an alternative GPU virtualization
> scheme
> where virgl is not necessary if SRIOV capability is available. And, as
> mentioned
> earlier, I have tested this series with Mutter/Gnome-shell (upstream
> master)
> (plus one small patch:
> https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3745)
> and no other changes to any other userspace components on Host and Guest.
>
> >
> >
> >       And, doing it this way means that no other userspace components
> > need to be modified
> >       on both the Guest and the Host.
> >
> >       >
> >       >
> >       >
> >       >       As part of the import, the virtio-gpu driver shares the d=
ma
> >       >       addresses and lengths with Qemu which then determines
> > whether
> >       > the
> >       >       memory region they belong to is owned by a PCI device or
> > whether it
> >       >       is part of the Guest's system ram. If it is the former, i=
t
> identifies
> >       >       the devid (or bdf) and bar and provides this info (along
> with
> > offsets
> >       >       and sizes) to the udmabuf driver. In the latter case,
> instead of
> > the
> >       >       the devid and bar it provides the memfd. The udmabuf driv=
er
> > then
> >       >       creates a dmabuf using this info that Qemu shares with
> Spice
> > for
> >       >       encode via Gstreamer.
> >       >
> >       >       Note that the virtio-gpu driver registers a move_notify()
> callback
> >       >       to track location changes associated with the scanout
> buffer and
> >       >       sends attach/detach backing cmds to Qemu when appropriate=
.
> > And,
> >       >       synchronization (that is, ensuring that Guest and Host ar=
e
> not
> >       >       using the scanout buffer at the same time) is ensured by
> > pinning/
> >       >       unpinning the dmabuf as part of plane update and using a
> fence
> >       >       in resource_flush cmd.
> >       >
> >       >
> >       > I'm not sure how QEMU's display paths work, but with crosvm if
> > you share
> >       > the guest-created dmabuf with the display, and the guest moves
> > the backing
> >       > pages, the only recourse is the destroy the surface and show a
> > black screen
> >       > to the user: not the best thing experience wise.
> >       Since Qemu GTK UI uses EGL, there is a blit done from the guest=
=E2=80=99s
> > scanout buffer onto an EGL
> >       backed buffer on the Host. So, this problem would not happen as o=
f
> > now.
> >
> >
> >
> > The guest kernel doesn't know you're using the QEMU GTK UI + EGL host-
> > side.
> So, with blob=3Dtrue, there is a dma fence in resource_flush() that gets
> associated
> with the Blit/Encode on the Host. This guest dma fence should eventually
> be signalled
> only when the Host is done using guest's scanout buffer.
>
> >
> > If somebody wants to use the virtio-gpu import mechanism with lower-lev=
el
> > Wayland-based display integration, then the problem would occur.
> Right, one way to address this issue is to prevent the Guest compositor
> from
> reusing the scanout buffer (until the Host is done) and forcing it to pic=
k
> a new
> buffer (since Mesa GBM allows 4 backbuffers).
> I have tried this experiment with KMSRO and Wayland-based Qemu UI
> previously
> on iGPUs (and Weston) and noticed that the Guest FPS was getting halved:
>
> https://lore.kernel.org/qemu-devel/20210913222036.3193732-1-vivek.kasired=
dy@intel.com/
>
> and also discussed and proposed a solution which did not go anywhere:
>
> https://lore.kernel.org/dri-devel/20210913233529.3194401-1-vivek.kasiredd=
y@intel.com/
>
> >
> > Perhaps, do that just to be safe unless you have performance concerns.
> If you meant pinning the imported scanout buffer in the Guest, then yes,
> that is something I am already doing in this patchset.
>
> >
> >
> >       >
> >       > Only amdgpu calls dma_buf_move_notfiy(..), and you're probably
> > testing on
> >       > Intel only, so you may not be hitting that code path anyways.
> >       I have tested with the Xe driver in the Guest which also calls
> > dma_buf_move_notfiy(). But
> >       note that for dGPUs, both Xe and amdgpu migrate the scanout buffe=
r
> > from vram to system
> >       memory as part of export, because virtio-gpu is not P2P compatibl=
e.
> > However, I am hoping
> >       to relax this (p2p check against virtio-gpu) in Xe driver if it
> detects
> > that it is running in
> >       VF mode once the following patch series is merged:
> >       https://lore.kernel.org/dri-devel/20240422063602.3690124-1-
> > vivek.kasireddy@intel.com/
> >
> >       > I forgot the
> >       > exact reason, but apparently udmabuf may not work with amdgpu
> > displays
> >       > and it seems the virtualized iGPU + dGPU is the way to go for
> > amdgpu
> >       > anyways.
> >       I would really like to know why udmabuf would not work with
> > amdgpu?
> >
> >
> >
> > It's just a rumor I heard, but the idea is udmabuf would be imported in=
to
> > AMDGPU_GEM_DOMAIN_CPU only.
> >
> > https://cgit.freedesktop.org/drm/drm-
> > misc/tree/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c#n333
> >
> > "AMDGPU_GEM_DOMAIN_CPU: System memory that is not GPU accessible.
> > Memory in this pool could be swapped out to disk if there is pressure."
> >
> > https://dri.freedesktop.org/docs/drm/gpu/amdgpu.html
> >
> >
> > Perhaps that limitation is artificial and unnecessary, and it may indee=
d
> work.
> > I don't think anybody has tried...
> Since udmabuf driver properly pins the backing pages (from memfd) for DMA=
,
> I don't see any reason why amdgpu would not be able to import.
>
> Thanks,
> Vivek
>
> >
> >
> >
> >
> >       > So I recommend just pinning the buffer for the lifetime of the
> >       > import for simplicity and correctness.
> >       Yeah, in this patch series, the dmabuf is indeed pinned, but only
> for a
> > short duration in the Guest =E2=80=93
> >       just until the Host is done using it (blit or encode).
> >
> >       Thanks,
> >       Vivek
> >
> >       >
> >       >
> >       >       This series is available at:
> >       >       https://gitlab.freedesktop.org/Vivek/drm-tip/-
> >       > /commits/virtgpu_import_rfc
> >       >
> >       >       along with additional patches for Qemu and Spice here:
> >       >       https://gitlab.freedesktop.org/Vivek/qemu/-
> >       > /commits/virtgpu_dmabuf_pcidev
> >       >       https://gitlab.freedesktop.org/Vivek/spice/-
> >       > /commits/encode_dmabuf_v4
> >       >
> >       >       Patchset overview:
> >       >
> >       >       Patch 1:   Implement
> >       > VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING cmd
> >       >       Patch 2-3: Helpers to initalize, import, free imported
> object
> >       >       Patch 4-5: Import and use buffers from other devices for
> > scanout
> >       >       Patch 6-7: Have udmabuf driver create dmabuf from PCI bar=
s
> > for P2P
> >       > DMA
> >       >
> >       >       This series is tested using the following method:
> >       >       - Run Qemu with the following relevant options:
> >       >         qemu-system-x86_64 -m 4096m ....
> >       >         -device vfio-pci,host=3D0000:03:00.0
> >       >         -device virtio-
> > vga,max_outputs=3D1,blob=3Dtrue,xres=3D1920,yres=3D1080
> >       >         -spice port=3D3001,gl=3Don,disable-ticketing=3Don,prefe=
rred-
> >       > codec=3Dgstreamer:h264
> >       >         -object memory-backend-memfd,id=3Dmem1,size=3D4096M
> >       >         -machine memory-backend=3Dmem1 ...
> >       >       - Run upstream Weston with the following options in the
> Guest
> > VM:
> >       >         ./weston --drm-device=3Dcard1 --additional-devices=3Dca=
rd0
> >       >
> >       >       where card1 is a DG2 dGPU (passthrough'd and using xe
> driver
> > in
> >       > Guest VM),
> >       >       card0 is virtio-gpu and the Host is using a RPL iGPU.
> >       >
> >       >       Cc: Gerd Hoffmann <kraxel@redhat.com
> > <mailto:kraxel@redhat.com>
> >       > <mailto:kraxel@redhat.com <mailto:kraxel@redhat.com> > >
> >       >       Cc: Dongwon Kim <dongwon.kim@intel.com
> > <mailto:dongwon.kim@intel.com>
> >       > <mailto:dongwon.kim@intel.com
> > <mailto:dongwon.kim@intel.com> > >
> >       >       Cc: Daniel Vetter <daniel.vetter@ffwll.ch
> > <mailto:daniel.vetter@ffwll.ch>
> >       > <mailto:daniel.vetter@ffwll.ch <mailto:daniel.vetter@ffwll.ch>
> > >
> >       >       Cc: Christian Koenig <christian.koenig@amd.com
> > <mailto:christian.koenig@amd.com>
> >       > <mailto:christian.koenig@amd.com
> > <mailto:christian.koenig@amd.com> > >
> >       >       Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com
> > <mailto:dmitry.osipenko@collabora.com>
> >       > <mailto:dmitry.osipenko@collabora.com
> > <mailto:dmitry.osipenko@collabora.com> > >
> >       >       Cc: Rob Clark <robdclark@chromium.org
> > <mailto:robdclark@chromium.org>
> >       > <mailto:robdclark@chromium.org
> > <mailto:robdclark@chromium.org> > >
> >       >       Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.c=
om
> > <mailto:thomas.hellstrom@linux.intel.com>
> >       > <mailto:thomas.hellstrom@linux.intel.com
> > <mailto:thomas.hellstrom@linux.intel.com> > >
> >       >       Cc: Oded Gabbay <ogabbay@kernel.org
> > <mailto:ogabbay@kernel.org>
> >       > <mailto:ogabbay@kernel.org <mailto:ogabbay@kernel.org> > >
> >       >       Cc: Michal Wajdeczko <michal.wajdeczko@intel.com
> > <mailto:michal.wajdeczko@intel.com>
> >       > <mailto:michal.wajdeczko@intel.com
> > <mailto:michal.wajdeczko@intel.com> > >
> >       >       Cc: Michael Tretter <m.tretter@pengutronix.de
> > <mailto:m.tretter@pengutronix.de>
> >       > <mailto:m.tretter@pengutronix.de
> > <mailto:m.tretter@pengutronix.de> > >
> >       >
> >       >       Vivek Kasireddy (7):
> >       >         drm/virtio: Implement
> >       > VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING cmd
> >       >         drm/virtio: Add a helper to map and note the dma addrs
> and
> >       > lengths
> >       >         drm/virtio: Add helpers to initialize and free the
> imported
> > object
> >       >         drm/virtio: Import prime buffers from other devices as
> guest
> > blobs
> >       >         drm/virtio: Ensure that bo's backing store is valid whi=
le
> > updating
> >       >           plane
> >       >         udmabuf/uapi: Add new ioctl to create a dmabuf from PCI
> bar
> >       > regions
> >       >         udmabuf: Implement UDMABUF_CREATE_LIST_FOR_PCIDEV
> > ioctl
> >       >
> >       >        drivers/dma-buf/udmabuf.c              | 122
> ++++++++++++++++--
> >       >        drivers/gpu/drm/virtio/virtgpu_drv.h   |   8 ++
> >       >        drivers/gpu/drm/virtio/virtgpu_plane.c |  56 ++++++++-
> >       >        drivers/gpu/drm/virtio/virtgpu_prime.c | 167
> >       > ++++++++++++++++++++++++-
> >       >        drivers/gpu/drm/virtio/virtgpu_vq.c    |  15 +++
> >       >        include/uapi/linux/udmabuf.h           |  11 +-
> >       >        6 files changed, 368 insertions(+), 11 deletions(-)
> >       >
> >       >       --
> >       >       2.43.0
> >       >
> >       >
> >
> >
>
>

--000000000000dd92c0061ae2b0e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div dir=3D"lt=
r"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, May 30, 2024 at 12:21=E2=80=AFAM Kasireddy, Vivek &lt;<a hre=
f=3D"mailto:vivek.kasireddy@intel.com" target=3D"_blank">vivek.kasireddy@in=
tel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Hi Gurchetan,<br>
<br>
&gt; <br>
&gt; On Fri, May 24, 2024 at 11:33=E2=80=AFAM Kasireddy, Vivek<br>
&gt; &lt;<a href=3D"mailto:vivek.kasireddy@intel.com" target=3D"_blank">viv=
ek.kasireddy@intel.com</a> &lt;mailto:<a href=3D"mailto:vivek.kasireddy@int=
el.com" target=3D"_blank">vivek.kasireddy@intel.com</a>&gt; &gt; wrote:<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Hi,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Sorry, my previous reply got messed up as a =
result of HTML<br>
&gt; formatting. This is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0a plain text version of the same reply.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Having virtio=
-gpu import scanout buffers (via prime) from other<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0devices means=
 that we&#39;d be adding a head to headless GPUs<br>
&gt; assigned<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0to a Guest VM=
 or additional heads to regular GPU devices that<br>
&gt; are<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0passthrough&#=
39;d to the Guest. In these cases, the Guest<br>
&gt; compositor<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0can render in=
to the scanout buffer using a primary GPU and has<br>
&gt; the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0secondary GPU=
 (virtio-gpu) import it for display purposes.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0The main adva=
ntage with this is that the imported scanout<br>
&gt; buffer can<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0either be dis=
played locally on the Host (e.g, using Qemu + GTK<br>
&gt; UI)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0or encoded an=
d streamed to a remote client (e.g, Qemu + Spice<br>
&gt; UI).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Note that sin=
ce Qemu uses udmabuf driver, there would be no<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; copies<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0made of the s=
canout buffer as it is displayed. This should be<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0possible even=
 when it might reside in device memory such has<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; VRAM.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0The specific =
use-case that can be supported with this series is<br>
&gt; when<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0running Westo=
n or other guest compositors with &quot;additional-<br>
&gt; devices&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0feature (./we=
ston --drm-device=3Dcard1 --additional-<br>
&gt; devices=3Dcard0).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0More info abo=
ut this feature can be found at:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"ht=
tps://gitlab.freedesktop.org/wayland/weston/-" rel=3D"noreferrer" target=3D=
"_blank">https://gitlab.freedesktop.org/wayland/weston/-</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; /merge_requests/736<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0In the above =
scenario, card1 could be a dGPU or an iGPU and<br>
&gt; card0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0would be virt=
io-gpu in KMS only mode. However, the case<br>
&gt; where this<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0patch series =
could be particularly useful is when card1 is a GPU<br>
&gt; VF<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0that needs to=
 share its scanout buffer (in a zero-copy way) with<br>
&gt; the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0GPU PF on the=
 Host. Or, it can also be useful when the scanout<br>
&gt; buffer<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0needs to be s=
hared between any two GPU devices (assuming<br>
&gt; one of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; them<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0is assigned t=
o a Guest VM) as long as they are P2P DMA<br>
&gt; compatible.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Is passthrough iGPU-only or passthrough=
 dGPU-only something you<br>
&gt; intend to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; use?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Our main use-case involves passthrough=E2=80=
=99g a headless dGPU VF device<br>
&gt; and sharing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0the Guest compositor=E2=80=99s scanout buffe=
r with dGPU PF device on the<br>
&gt; Host. Same goal for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0headless iGPU VF to iGPU PF device as well.<=
br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; Just to check my understanding: the same physical {i, d}GPU is partiti=
oned<br>
&gt; into the VF and PF, but the PF handles host-side display integration a=
nd<br>
&gt; rendering?<br>
Yes, that is mostly right. In a nutshell, the same physical GPU is partitio=
ned<br>
into one PF device and multiple VF devices. Only the PF device has access t=
o<br>
the display hardware and can do KMS (on the Host). The VF devices are<br>
headless with no access to display hardware (cannot do KMS but can do rende=
r/<br>
encode/decode) and are generally assigned (or passthrough&#39;d) to the Gue=
st VMs.<br>
Some more details about this model can be found here:<br>
<a href=3D"https://lore.kernel.org/dri-devel/20231110182231.1730-1-michal.w=
ajdeczko@intel.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.kern=
el.org/dri-devel/20231110182231.1730-1-michal.wajdeczko@intel.com/</a><br>
<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0However, using a combination of iGPU and dGP=
U where either of<br>
&gt; them can be passthrough=E2=80=99d<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0to the Guest is something I think can be sup=
ported with this patch<br>
&gt; series as well.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; If it&#39;s a dGPU + iGPU setup, then t=
he way other people seem to do it<br>
&gt; is a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &quot;virtualized&quot; iGPU (via virgl=
/gfxstream/take your pick) and pass-<br>
&gt; through the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; dGPU.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; For example, AMD seems to use virgl to =
allocate and import into<br>
&gt; the dGPU.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; <a href=3D"https://gitlab.freedesktop.o=
rg/mesa/mesa/-" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedes=
ktop.org/mesa/mesa/-</a><br>
&gt; /merge_requests/23896<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; <a href=3D"https://lore.kernel.org/all/=
20231221100016.4022353-1-" rel=3D"noreferrer" target=3D"_blank">https://lor=
e.kernel.org/all/20231221100016.4022353-1-</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; <a href=3D"http://julia.zhang@amd.com/"=
 rel=3D"noreferrer" target=3D"_blank">julia.zhang@amd.com/</a> &lt;<a href=
=3D"http://julia.zhang@amd.com/" rel=3D"noreferrer" target=3D"_blank">http:=
//julia.zhang@amd.com/</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; ChromeOS also uses that method (see <a =
href=3D"http://crrev.com/c/3764931" rel=3D"noreferrer" target=3D"_blank">cr=
rev.com/c/3764931</a><br>
&gt; &lt;<a href=3D"http://crrev.com/c/3764931" rel=3D"noreferrer" target=
=3D"_blank">http://crrev.com/c/3764931</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &lt;<a href=3D"http://crrev.com/c/37649=
31" rel=3D"noreferrer" target=3D"_blank">http://crrev.com/c/3764931</a>&gt;=
 ) [cc: dGPU architect +Dominik Behr<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &lt;mailto:<a href=3D"mailto:dbehr@goog=
le.com" target=3D"_blank">dbehr@google.com</a> &lt;mailto:<a href=3D"mailto=
:dbehr@google.com" target=3D"_blank">dbehr@google.com</a>&gt; &gt; ]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; So if iGPU + dGPU is the primary use ca=
se, you should be able to<br>
&gt; use these<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; methods as well.=C2=A0 The model would =
&quot;virtualized iGPU&quot; +<br>
&gt; passthrough dGPU,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; not split SoCs.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0In our use-case, the goal is to have only on=
e primary GPU<br>
&gt; (passthrough=E2=80=99d iGPU/dGPU)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0do all the rendering (using native DRI drive=
rs) for clients/compositor<br>
&gt; and all the outputs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0and share the scanout buffers with the secon=
dary GPU (virtio-gpu).<br>
&gt; Since this is mostly<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0how Mutter (and also Weston) work in a multi=
-GPU setup, I am not<br>
&gt; sure if virgl is needed.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; I think you can probably use virgl with the PF and others probably wil=
l, but<br>
&gt; supporting multiple methods in Linux is not unheard of.<br>
In our case, we have an alternative SR-IOV based GPU virtualization/partiti=
oning<br>
model (as described above) where a Guest VM will have access to a hardware-=
accelerated<br>
GPU VF device for its rendering/encode/decode needs. So, in this situation,=
 using<br>
virgl will become redundant and unnecessary.<br>
<br>
And, in this model, we intend to use virtio-gpu for KMS in the Guest VM (si=
nce the<br>
GPU VF device cannot do KMS) with the addition of this patchset. However, n=
ote that,<br>
since not all GPU SKUs/versions have the SRIOV capability, we plan on using=
 virgl in<br>
those cases where it becomes necessary.<br>
<br>
&gt; <br>
&gt; Does your patchset need the Mesa kmsro patchset to function correctly?=
<br>
&gt; <br>
&gt; <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/9=
592" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/me=
sa/mesa/-/merge_requests/9592</a><br>
This patchset is an alternative proposal. So, KMSRO would not be needed.<br=
>
AFAICS, the above MR is mainly stalled because KMSRO uses dumb buffers<br>
which are not suitable for hardware-based rendering in all cases. And, KMSR=
O<br>
is not really helpful performance-wise with dGPUs, as it forces most buffer=
s to<br>
be allocated from system memory.<br></blockquote><div><br></div><div>Previo=
usly, it was recommended when exploring VDMABUF: &quot;the /important/ thin=
g is that the driver which exports the dma-buf (and thus handles the mappin=
gs) must be aware of the virtualization so it can properly coordinate thing=
s with the host side.&quot;</div><div><br></div><div><a href=3D"https://pat=
chwork.kernel.org/project/linux-media/patch/20210203073517.1908882-3-vivek.=
kasireddy@intel.com/#23975915" target=3D"_blank">https://patchwork.kernel.o=
rg/project/linux-media/patch/20210203073517.1908882-3-vivek.kasireddy@intel=
.com/#23975915</a>=C2=A0=C2=A0</div><div><br></div><div>So that&#39;s why t=
he KMSRO approach was tried =C2=A0(virtio-gpu dumb allocations, not i915).=
=C2=A0 But as you point out, nobody uses dumb buffers for hardware-based re=
ndering.</div><div><br></div><div>So, if you are going with i915 allocates=
=C2=A0+ virtio-gpu imports,=C2=A0 it should be fine if you fixed all the is=
sues with i915 allocates=C2=A0+ VDMABUF=C2=A0imports.=C2=A0 It seems your f=
ixes add complexity in VFIO and other places, but having virtio-gpu 3d=C2=
=A0+ virgl allocate adds complexity to Mesa-based allocation paths (i915, a=
mdgpu would all have to open virtio-gpu render node, and pick a context typ=
e etc.).=C2=A0=C2=A0</div><div><br></div><div>I would just do virtio-gpu al=
locates, since it only requires user-space patches and no extra ioctls, but=
 that reflects my preferences.=C2=A0 If the mm/VFIO/QEMU people are fine wi=
th your approach, I see nothing wrong with merging it.=C2=A0=C2=A0</div><di=
v><br></div><div>The one caveat is if someone uses a non-GTK/EGL host path,=
 we&#39;ll have to pin memory for the lifetime of the import, since knowing=
 RESOURCE_FLUSH is done is not sufficient.=C2=A0 But if you&#39;re only usi=
ng it, it shouldn&#39;t be an issue right now.=C2=A0=C2=A0</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt; <br>
&gt; If so, I would try to get that reviewed first to meet DRM requirements=
<br>
&gt; (<a href=3D"https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#ope=
n-source-" rel=3D"noreferrer" target=3D"_blank">https://dri.freedesktop.org=
/docs/drm/gpu/drm-uapi.html#open-source-</a><br>
&gt; userspace-requirements).=C2=A0 You might explicitly call out the desig=
n decision<br>
&gt; you&#39;re making: (&quot;We can probably use virgl as the virtualized=
 iGPU via PF, but<br>
&gt; that adds unnecessary complexity b/c ______&quot;).<br>
As I described above, what we have is an alternative GPU virtualization sch=
eme<br>
where virgl is not necessary if SRIOV capability is available. And, as ment=
ioned<br>
earlier, I have tested this series with Mutter/Gnome-shell (upstream master=
)<br>
(plus one small patch: <a href=3D"https://gitlab.gnome.org/GNOME/mutter/-/m=
erge_requests/3745" rel=3D"noreferrer" target=3D"_blank">https://gitlab.gno=
me.org/GNOME/mutter/-/merge_requests/3745</a>)<br>
and no other changes to any other userspace components on Host and Guest.<b=
r>
<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0And, doing it this way means that no other u=
serspace components<br>
&gt; need to be modified<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0on both the Guest and the Host.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0As part of th=
e import, the virtio-gpu driver shares the dma<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0addresses and=
 lengths with Qemu which then determines<br>
&gt; whether<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0memory region=
 they belong to is owned by a PCI device or<br>
&gt; whether it<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0is part of th=
e Guest&#39;s system ram. If it is the former, it identifies<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0the devid (or=
 bdf) and bar and provides this info (along with<br>
&gt; offsets<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0and sizes) to=
 the udmabuf driver. In the latter case, instead of<br>
&gt; the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0the devid and=
 bar it provides the memfd. The udmabuf driver<br>
&gt; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0creates a dma=
buf using this info that Qemu shares with Spice<br>
&gt; for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0encode via Gs=
treamer.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Note that the=
 virtio-gpu driver registers a move_notify() callback<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0to track loca=
tion changes associated with the scanout buffer and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sends attach/=
detach backing cmds to Qemu when appropriate.<br>
&gt; And,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0synchronizati=
on (that is, ensuring that Guest and Host are not<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0using the sca=
nout buffer at the same time) is ensured by<br>
&gt; pinning/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unpinning the=
 dmabuf as part of plane update and using a fence<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0in resource_f=
lush cmd.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I&#39;m not sure how QEMU&#39;s display=
 paths work, but with crosvm if<br>
&gt; you share<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; the guest-created dmabuf with the displ=
ay, and the guest moves<br>
&gt; the backing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; pages, the only recourse is the destroy=
 the surface and show a<br>
&gt; black screen<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; to the user: not the best thing experie=
nce wise.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Since Qemu GTK UI uses EGL, there is a blit =
done from the guest=E2=80=99s<br>
&gt; scanout buffer onto an EGL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0backed buffer on the Host. So, this problem =
would not happen as of<br>
&gt; now.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; The guest kernel doesn&#39;t know you&#39;re using the QEMU GTK UI + E=
GL host-<br>
&gt; side.<br>
So, with blob=3Dtrue, there is a dma fence in resource_flush() that gets as=
sociated<br>
with the Blit/Encode on the Host. This guest dma fence should eventually be=
 signalled<br>
only when the Host is done using guest&#39;s scanout buffer.<br>
<br>
&gt; <br>
&gt; If somebody wants to use the virtio-gpu import mechanism with lower-le=
vel<br>
&gt; Wayland-based display integration, then the problem would occur.<br>
Right, one way to address this issue is to prevent the Guest compositor fro=
m<br>
reusing the scanout buffer (until the Host is done) and forcing it to pick =
a new<br>
buffer (since Mesa GBM allows 4 backbuffers). <br>
I have tried this experiment with KMSRO and Wayland-based Qemu UI previousl=
y<br>
on iGPUs (and Weston) and noticed that the Guest FPS was getting halved:<br=
>
<a href=3D"https://lore.kernel.org/qemu-devel/20210913222036.3193732-1-vive=
k.kasireddy@intel.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.k=
ernel.org/qemu-devel/20210913222036.3193732-1-vivek.kasireddy@intel.com/</a=
><br>
<br>
and also discussed and proposed a solution which did not go anywhere:<br>
<a href=3D"https://lore.kernel.org/dri-devel/20210913233529.3194401-1-vivek=
.kasireddy@intel.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.ke=
rnel.org/dri-devel/20210913233529.3194401-1-vivek.kasireddy@intel.com/</a><=
br>
<br>
&gt; <br>
&gt; Perhaps, do that just to be safe unless you have performance concerns.=
<br>
If you meant pinning the imported scanout buffer in the Guest, then yes,<br=
>
that is something I am already doing in this patchset.<br>
<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Only amdgpu calls dma_buf_move_notfiy(.=
.), and you&#39;re probably<br>
&gt; testing on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Intel only, so you may not be hitting t=
hat code path anyways.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0I have tested with the Xe driver in the Gues=
t which also calls<br>
&gt; dma_buf_move_notfiy(). But<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0note that for dGPUs, both Xe and amdgpu migr=
ate the scanout buffer<br>
&gt; from vram to system<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0memory as part of export, because virtio-gpu=
 is not P2P compatible.<br>
&gt; However, I am hoping<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0to relax this (p2p check against virtio-gpu)=
 in Xe driver if it detects<br>
&gt; that it is running in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0VF mode once the following patch series is m=
erged:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://lore.kernel.org/dri-devel=
/20240422063602.3690124-1-" rel=3D"noreferrer" target=3D"_blank">https://lo=
re.kernel.org/dri-devel/20240422063602.3690124-1-</a><br>
&gt; <a href=3D"http://vivek.kasireddy@intel.com/" rel=3D"noreferrer" targe=
t=3D"_blank">vivek.kasireddy@intel.com/</a><br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I forgot the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; exact reason, but apparently udmabuf ma=
y not work with amdgpu<br>
&gt; displays<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; and it seems the virtualized iGPU + dGP=
U is the way to go for<br>
&gt; amdgpu<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; anyways.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0I would really like to know why udmabuf woul=
d not work with<br>
&gt; amdgpu?<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; It&#39;s just a rumor I heard, but the idea is udmabuf would be import=
ed into<br>
&gt; AMDGPU_GEM_DOMAIN_CPU only.<br>
&gt; <br>
&gt; <a href=3D"https://cgit.freedesktop.org/drm/drm-" rel=3D"noreferrer" t=
arget=3D"_blank">https://cgit.freedesktop.org/drm/drm-</a><br>
&gt; misc/tree/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c#n333<br>
&gt; <br>
&gt; &quot;AMDGPU_GEM_DOMAIN_CPU: System memory that is not GPU accessible.=
<br>
&gt; Memory in this pool could be swapped out to disk if there is pressure.=
&quot;<br>
&gt; <br>
&gt; <a href=3D"https://dri.freedesktop.org/docs/drm/gpu/amdgpu.html" rel=
=3D"noreferrer" target=3D"_blank">https://dri.freedesktop.org/docs/drm/gpu/=
amdgpu.html</a><br>
&gt; <br>
&gt; <br>
&gt; Perhaps that limitation is artificial and unnecessary, and it may inde=
ed work.<br>
&gt; I don&#39;t think anybody has tried...<br>
Since udmabuf driver properly pins the backing pages (from memfd) for DMA,<=
br>
I don&#39;t see any reason why amdgpu would not be able to import.<br>
<br>
Thanks,<br>
Vivek<br>
<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; So I recommend just pinning the buffer =
for the lifetime of the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; import for simplicity and correctness.<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Yeah, in this patch series, the dmabuf is in=
deed pinned, but only for a<br>
&gt; short duration in the Guest =E2=80=93<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0just until the Host is done using it (blit o=
r encode).<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Thanks,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Vivek<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0This series i=
s available at:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"ht=
tps://gitlab.freedesktop.org/Vivek/drm-tip/-" rel=3D"noreferrer" target=3D"=
_blank">https://gitlab.freedesktop.org/Vivek/drm-tip/-</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; /commits/virtgpu_import_rfc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0along with ad=
ditional patches for Qemu and Spice here:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"ht=
tps://gitlab.freedesktop.org/Vivek/qemu/-" rel=3D"noreferrer" target=3D"_bl=
ank">https://gitlab.freedesktop.org/Vivek/qemu/-</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; /commits/virtgpu_dmabuf_pcidev<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"ht=
tps://gitlab.freedesktop.org/Vivek/spice/-" rel=3D"noreferrer" target=3D"_b=
lank">https://gitlab.freedesktop.org/Vivek/spice/-</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; /commits/encode_dmabuf_v4<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Patchset over=
view:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Patch 1:=C2=
=A0 =C2=A0Implement<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING =
cmd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Patch 2-3: He=
lpers to initalize, import, free imported object<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Patch 4-5: Im=
port and use buffers from other devices for<br>
&gt; scanout<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Patch 6-7: Ha=
ve udmabuf driver create dmabuf from PCI bars<br>
&gt; for P2P<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; DMA<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0This series i=
s tested using the following method:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- Run Qemu wi=
th the following relevant options:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu-s=
ystem-x86_64 -m 4096m ....<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-devic=
e vfio-pci,host=3D0000:03:00.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-devic=
e virtio-<br>
&gt; vga,max_outputs=3D1,blob=3Dtrue,xres=3D1920,yres=3D1080<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-spice=
 port=3D3001,gl=3Don,disable-ticketing=3Don,preferred-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; codec=3Dgstreamer:h264<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-objec=
t memory-backend-memfd,id=3Dmem1,size=3D4096M<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-machi=
ne memory-backend=3Dmem1 ...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- Run upstrea=
m Weston with the following options in the Guest<br>
&gt; VM:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0./west=
on --drm-device=3Dcard1 --additional-devices=3Dcard0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0where card1 i=
s a DG2 dGPU (passthrough&#39;d and using xe driver<br>
&gt; in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Guest VM),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0card0 is virt=
io-gpu and the Host is using a RPL iGPU.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Cc: Gerd Hoff=
mann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank">kraxel@redh=
at.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank">krax=
el@redhat.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &lt;mailto:<a href=3D"mailto:kraxel@red=
hat.com" target=3D"_blank">kraxel@redhat.com</a> &lt;mailto:<a href=3D"mail=
to:kraxel@redhat.com" target=3D"_blank">kraxel@redhat.com</a>&gt; &gt; &gt;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Cc: Dongwon K=
im &lt;<a href=3D"mailto:dongwon.kim@intel.com" target=3D"_blank">dongwon.k=
im@intel.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:dongwon.kim@intel.com" target=3D"_blank">=
dongwon.kim@intel.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &lt;mailto:<a href=3D"mailto:dongwon.ki=
m@intel.com" target=3D"_blank">dongwon.kim@intel.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:dongwon.kim@intel.com" target=3D"_blank">=
dongwon.kim@intel.com</a>&gt; &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Cc: Daniel Ve=
tter &lt;<a href=3D"mailto:daniel.vetter@ffwll.ch" target=3D"_blank">daniel=
.vetter@ffwll.ch</a><br>
&gt; &lt;mailto:<a href=3D"mailto:daniel.vetter@ffwll.ch" target=3D"_blank"=
>daniel.vetter@ffwll.ch</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &lt;mailto:<a href=3D"mailto:daniel.vet=
ter@ffwll.ch" target=3D"_blank">daniel.vetter@ffwll.ch</a> &lt;mailto:<a hr=
ef=3D"mailto:daniel.vetter@ffwll.ch" target=3D"_blank">daniel.vetter@ffwll.=
ch</a>&gt; &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Cc: Christian=
 Koenig &lt;<a href=3D"mailto:christian.koenig@amd.com" target=3D"_blank">c=
hristian.koenig@amd.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:christian.koenig@amd.com" target=3D"_blan=
k">christian.koenig@amd.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &lt;mailto:<a href=3D"mailto:christian.=
koenig@amd.com" target=3D"_blank">christian.koenig@amd.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:christian.koenig@amd.com" target=3D"_blan=
k">christian.koenig@amd.com</a>&gt; &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Cc: Dmitry Os=
ipenko &lt;<a href=3D"mailto:dmitry.osipenko@collabora.com" target=3D"_blan=
k">dmitry.osipenko@collabora.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:dmitry.osipenko@collabora.com" target=3D"=
_blank">dmitry.osipenko@collabora.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &lt;mailto:<a href=3D"mailto:dmitry.osi=
penko@collabora.com" target=3D"_blank">dmitry.osipenko@collabora.com</a><br=
>
&gt; &lt;mailto:<a href=3D"mailto:dmitry.osipenko@collabora.com" target=3D"=
_blank">dmitry.osipenko@collabora.com</a>&gt; &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Cc: Rob Clark=
 &lt;<a href=3D"mailto:robdclark@chromium.org" target=3D"_blank">robdclark@=
chromium.org</a><br>
&gt; &lt;mailto:<a href=3D"mailto:robdclark@chromium.org" target=3D"_blank"=
>robdclark@chromium.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &lt;mailto:<a href=3D"mailto:robdclark@=
chromium.org" target=3D"_blank">robdclark@chromium.org</a><br>
&gt; &lt;mailto:<a href=3D"mailto:robdclark@chromium.org" target=3D"_blank"=
>robdclark@chromium.org</a>&gt; &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Cc: Thomas He=
llstr=C3=B6m &lt;<a href=3D"mailto:thomas.hellstrom@linux.intel.com" target=
=3D"_blank">thomas.hellstrom@linux.intel.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:thomas.hellstrom@linux.intel.com" target=
=3D"_blank">thomas.hellstrom@linux.intel.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &lt;mailto:<a href=3D"mailto:thomas.hel=
lstrom@linux.intel.com" target=3D"_blank">thomas.hellstrom@linux.intel.com<=
/a><br>
&gt; &lt;mailto:<a href=3D"mailto:thomas.hellstrom@linux.intel.com" target=
=3D"_blank">thomas.hellstrom@linux.intel.com</a>&gt; &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Cc: Oded Gabb=
ay &lt;<a href=3D"mailto:ogabbay@kernel.org" target=3D"_blank">ogabbay@kern=
el.org</a><br>
&gt; &lt;mailto:<a href=3D"mailto:ogabbay@kernel.org" target=3D"_blank">oga=
bbay@kernel.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &lt;mailto:<a href=3D"mailto:ogabbay@ke=
rnel.org" target=3D"_blank">ogabbay@kernel.org</a> &lt;mailto:<a href=3D"ma=
ilto:ogabbay@kernel.org" target=3D"_blank">ogabbay@kernel.org</a>&gt; &gt; =
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Cc: Michal Wa=
jdeczko &lt;<a href=3D"mailto:michal.wajdeczko@intel.com" target=3D"_blank"=
>michal.wajdeczko@intel.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:michal.wajdeczko@intel.com" target=3D"_bl=
ank">michal.wajdeczko@intel.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &lt;mailto:<a href=3D"mailto:michal.waj=
deczko@intel.com" target=3D"_blank">michal.wajdeczko@intel.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:michal.wajdeczko@intel.com" target=3D"_bl=
ank">michal.wajdeczko@intel.com</a>&gt; &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Cc: Michael T=
retter &lt;<a href=3D"mailto:m.tretter@pengutronix.de" target=3D"_blank">m.=
tretter@pengutronix.de</a><br>
&gt; &lt;mailto:<a href=3D"mailto:m.tretter@pengutronix.de" target=3D"_blan=
k">m.tretter@pengutronix.de</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &lt;mailto:<a href=3D"mailto:m.tretter@=
pengutronix.de" target=3D"_blank">m.tretter@pengutronix.de</a><br>
&gt; &lt;mailto:<a href=3D"mailto:m.tretter@pengutronix.de" target=3D"_blan=
k">m.tretter@pengutronix.de</a>&gt; &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Vivek Kasired=
dy (7):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm/vi=
rtio: Implement<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING =
cmd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm/vi=
rtio: Add a helper to map and note the dma addrs and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; lengths<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm/vi=
rtio: Add helpers to initialize and free the imported<br>
&gt; object<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm/vi=
rtio: Import prime buffers from other devices as guest<br>
&gt; blobs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm/vi=
rtio: Ensure that bo&#39;s backing store is valid while<br>
&gt; updating<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0plane<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0udmabu=
f/uapi: Add new ioctl to create a dmabuf from PCI bar<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; regions<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0udmabu=
f: Implement UDMABUF_CREATE_LIST_FOR_PCIDEV<br>
&gt; ioctl<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 drivers/dma-=
buf/udmabuf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 122 +++++++=
+++++++++--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 drivers/gpu/=
drm/virtio/virtgpu_drv.h=C2=A0 =C2=A0|=C2=A0 =C2=A08 ++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 drivers/gpu/=
drm/virtio/virtgpu_plane.c |=C2=A0 56 ++++++++-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 drivers/gpu/=
drm/virtio/virtgpu_prime.c | 167<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; ++++++++++++++++++++++++-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 drivers/gpu/=
drm/virtio/virtgpu_vq.c=C2=A0 =C2=A0 |=C2=A0 15 +++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 include/uapi=
/linux/udmabuf.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 11 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 6 files chan=
ged, 368 insertions(+), 11 deletions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A02.43.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <br>
&gt; <br>
<br>
</blockquote></div></div>
</div>

--000000000000dd92c0061ae2b0e6--
