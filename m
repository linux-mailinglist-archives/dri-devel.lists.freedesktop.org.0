Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE693228AF
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 11:14:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB9EA6E81B;
	Tue, 23 Feb 2021 10:14:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCAA36E81F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 10:14:16 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id u14so21987877wri.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 02:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=7nO5RcnaL0QB7r+vkW2UlXUyfh+yHbsK4w9NHIxeCJo=;
 b=aNmyH1bj/gWDljY1/ziy4MNlpBvE1ohciBtK+CGR8L4iLCUNge3kAFNPZNyojLotWS
 Z4cJPwGrA/Io+q0F9cLsZMDxRhDeVa6d7IF43+no0HmfmZ/aPzW2XJlP0BDDsFCIs54a
 K3PdTyW5+PAep7QFY+kULAAv1mhpDVttExGsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7nO5RcnaL0QB7r+vkW2UlXUyfh+yHbsK4w9NHIxeCJo=;
 b=DoTVZOu4Etnv9uUEMfqzRQGKPJjW6so3RRhDm2uTtruBA2yb+GbWKAID0Hb6uc4U4a
 RK/uMsHKKB85w5rEU9Fo5RzugrRbsHfOCMd/WdBjmvOOkahrh+jsnmLryTol8zThZISS
 UWr6tsxiknFQgg8lNSeyzgBrb6v3O2QIeoHKCQ18FMDiezrol9HlxAeEynjsbNsaafbs
 cs310flHC5dUHdAs70+w1s6QBloERZg1tVZmfOKdJkwpsNOtvda+jzxDm6nAGwFFtVgp
 qtYj+V/vz1YjspNjGh6JCmxnU6XvFNqRpeVlN5JfKSFKIme5mal0O/EIgIM4ttTnyeeB
 Mdtw==
X-Gm-Message-State: AOAM532y7hET38UW0zbVr3zyzK99SpcRcqZ/IVHfwEkSwq8e7bc+O6aI
 FoEeIrBUwD1WaY4iT18AZJ1mNQ==
X-Google-Smtp-Source: ABdhPJzEsswhtaCrpGJgsRbny8g4L3moudGUal7ONLrdkn1toHphGfsnApkB5NN430TmlATXf01MEA==
X-Received: by 2002:adf:92c4:: with SMTP id 62mr25817282wrn.245.1614075255404; 
 Tue, 23 Feb 2021 02:14:15 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b15sm2157510wmb.11.2021.02.23.02.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 02:14:14 -0800 (PST)
Date: Tue, 23 Feb 2021 11:14:12 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH] drm/prime: Only call dma_map_sgtable() for devices with
 DMA support
Message-ID: <YDTVdKIG1BfKhH8g@phenom.ffwll.local>
References: <20210219134014.7775-1-tzimmermann@suse.de>
 <79e272cb-b010-cb8d-57d3-71999164291a@tronnes.org>
 <823e5782-7dd0-d864-02b5-4c1e6edd0528@suse.de>
 <968e2131-18f3-e829-d098-89a98d3e73ea@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <968e2131-18f3-e829-d098-89a98d3e73ea@tronnes.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Felipe Balbi <balbi@kernel.org>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 gregkh@linuxfoundation.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Oliver Neukum <oneukum@suse.com>, Johan Hovold <johan@kernel.org>,
 christian.koenig@amd.com, Alan Stern <stern@rowland.harvard.edu>,
 dri-devel@lists.freedesktop.org, "Ahmed S. Darwish" <a.darwish@linutronix.de>,
 stable@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 22, 2021 at 06:30:35PM +0100, Noralf Tr=F8nnes wrote:
> =

> =

> Den 22.02.2021 08.54, skrev Thomas Zimmermann:
> > Hi
> > =

> > Am 20.02.21 um 14:02 schrieb Noralf Tr=F8nnes:
> >>
> >>
> >> Den 19.02.2021 14.40, skrev Thomas Zimmermann:
> >>> Fixes a regression for udl and probably other USB-based drivers where
> >>> joining and mirroring displays fails.
> >>>
> >>> Joining displays requires importing a dma_buf from another DRM driver.
> >>> These devices don't support DMA and therefore have no DMA mask. Trying
> >>> to map imported buffers from a DMA-able memory zone fails with an err=
or.
> >>> An example is shown below.
> >>>
> >>> [=A0=A0 60.050199] ------------[ cut here ]------------
> >>> [=A0=A0 60.055092] WARNING: CPU: 0 PID: 1403 at kernel/dma/mapping.c:=
190
> >>> dma_map_sg_attrs+0x8f/0xc0
> >>> [=A0=A0 60.064331] Modules linked in: af_packet(E) rfkill(E) dmi_sysf=
s(E)
> >>> intel_rapl_msr(E) intel_rapl_common(E) snd_hda_codec_realtek(E)
> >>> snd_hda_codec_generic(E) ledtrig_audio(E) snd_hda_codec_hdmi(E)
> >>> x86_pkg_temp_thermal(E) intel_powerclam)
> >>> [=A0=A0 60.064801]=A0 wmi(E) video(E) btrfs(E) blake2b_generic(E)
> >>> libcrc32c(E) crc32c_intel(E) xor(E) raid6_pq(E) sg(E) dm_multipath(E)
> >>> dm_mod(E) scsi_dh_rdac(E) scsi_dh_emc(E) scsi_dh_alua(E) msr(E)
> >>> efivarfs(E)
> >>> [=A0=A0 60.170778] CPU: 0 PID: 1403 Comm: Xorg.bin Tainted: G=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0
> >>> E=A0=A0=A0 5.11.0-rc5-1-default+ #747
> >>> [=A0=A0 60.179841] Hardware name: Dell Inc. OptiPlex 9020/0N4YC8, BIOS
> >>> A24 10/24/2018
> >>> [=A0=A0 60.187145] RIP: 0010:dma_map_sg_attrs+0x8f/0xc0
> >>> [=A0=A0 60.191822] Code: 4d 85 ff 75 2b 49 89 d8 44 89 e1 44 89 f2 4c=
 89
> >>> ee 48 89 ef e8 62 30 00 00 85 c0 78 36 5b 5d 41 5c 41 5d 41 5e 41 5f
> >>> c3 0f 0b <0f> 0b 31 c0 eb ed 49 8d 7f 50 e8 72 f5 2a 00 49 8b 47 50
> >>> 49 89 d8
> >>> [=A0=A0 60.210770] RSP: 0018:ffffc90001d6fc18 EFLAGS: 00010246
> >>> [=A0=A0 60.216062] RAX: 0000000000000000 RBX: 0000000000000020 RCX:
> >>> ffffffffb31e677b
> >>> [=A0=A0 60.223274] RDX: dffffc0000000000 RSI: ffff888212c10600 RDI:
> >>> ffff8881b08a9488
> >>> [=A0=A0 60.230501] RBP: ffff8881b08a9030 R08: 0000000000000020 R09:
> >>> ffff888212c10600
> >>> [=A0=A0 60.237710] R10: ffffed10425820df R11: 0000000000000001 R12:
> >>> 0000000000000000
> >>> [=A0=A0 60.244939] R13: ffff888212c10600 R14: 0000000000000008 R15:
> >>> 0000000000000000
> >>> [=A0=A0 60.252155] FS:=A0 00007f08ac2b2f00(0000) GS:ffff8887cbe00000(=
0000)
> >>> knlGS:0000000000000000
> >>> [=A0=A0 60.260333] CS:=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >>> [=A0=A0 60.266150] CR2: 000055831c899be8 CR3: 000000015372e006 CR4:
> >>> 00000000001706f0
> >>> [=A0=A0 60.273369] Call Trace:
> >>> [=A0=A0 60.275845]=A0 drm_gem_map_dma_buf+0xb4/0x120
> >>> [=A0=A0 60.280089]=A0 dma_buf_map_attachment+0x15d/0x1e0
> >>> [=A0=A0 60.284688]=A0 drm_gem_prime_import_dev.part.0+0x5d/0x140
> >>> [=A0=A0 60.289984]=A0 drm_gem_prime_fd_to_handle+0x213/0x280
> >>> [=A0=A0 60.294931]=A0 ? drm_prime_destroy_file_private+0x30/0x30
> >>> [=A0=A0 60.300224]=A0 drm_ioctl_kernel+0x131/0x180
> >>> [=A0=A0 60.304291]=A0 ? drm_setversion+0x230/0x230
> >>> [=A0=A0 60.308366]=A0 ? drm_prime_destroy_file_private+0x30/0x30
> >>> [=A0=A0 60.313659]=A0 drm_ioctl+0x2f1/0x500
> >>> [=A0=A0 60.317118]=A0 ? drm_version+0x150/0x150
> >>> [=A0=A0 60.320903]=A0 ? lock_downgrade+0xa0/0xa0
> >>> [=A0=A0 60.324806]=A0 ? do_vfs_ioctl+0x5f4/0x680
> >>> [=A0=A0 60.328694]=A0 ? __fget_files+0x13e/0x210
> >>> [=A0=A0 60.332591]=A0 ? ioctl_fiemap.isra.0+0x1a0/0x1a0
> >>> [=A0=A0 60.337102]=A0 ? __fget_files+0x15d/0x210
> >>> [=A0=A0 60.340990]=A0 __x64_sys_ioctl+0xb9/0xf0
> >>> [=A0=A0 60.344795]=A0 do_syscall_64+0x33/0x80
> >>> [=A0=A0 60.348427]=A0 entry_SYSCALL_64_after_hwframe+0x44/0xa9
> >>
> >> I'm working on a USB display driver and got the same splat (although
> >> from i915_gem_map_dma_buf) and silenced it using:
> >>
> >> =A0=A0=A0=A0ret =3D dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(64)=
);
> >>
> >> But I understand now that this is not the solution.
> >>
> >> Since the USB host controller can do DMA, would the following be an
> >> acceptable solution?
> > =

> > Not all controllers can do DMA AFAIK, so it's maybe not reliable. I'll
> > send out another patch to address the issue later today.
> > =

> =

> I looked at your other attempt at fixing this and the discussion about
> how much work it is to fix this properly.
> =

> For my use case I think I just won't support import on a USB controller
> without DMA:
> =

> 	if (!usb->bus->controller->dma_mask)
> 		return -ENOSYS;
> =

> A USB controller without DMA must be rare and I'll deal with that later
> should the need arise.
> =

> Thanks for bringing this issue to my attention.

Yeah I think that's a reasonable short-term fix. Not perfect, but good
enough for years most likely :-)
-Daniel

> =

> Noralf.
> =

> > Best regards
> > Thomas
> > =

> >>
> >> static struct drm_gem_object *gud_gem_prime_import(struct drm_device
> >> *drm, struct dma_buf *dma_buf)
> >> {
> >> =A0=A0=A0=A0struct usb_device *usb =3D gud_to_usb_device(to_gud_device=
(drm));
> >>
> >> =A0=A0=A0=A0drm_dbg_prime(drm, "usb->bus->controller=3D%s\n",
> >> dev_name(usb->bus->controller));
> >>
> >> =A0=A0=A0=A0return drm_gem_prime_import_dev(drm, dma_buf, usb->bus->co=
ntroller);
> >> }
> >>
> >> static const struct drm_driver gud_drm_driver =3D {
> >> =A0=A0=A0=A0.gem_prime_import=A0=A0=A0 =3D gud_gem_prime_import,
> >> };
> >>
> >>
> >> Noralf.
> >>
> >>> [=A0=A0 60.353542] RIP: 0033:0x7f08ac7b53cb
> >>> [=A0=A0 60.357168] Code: 89 d8 49 8d 3c 1c 48 f7 d8 49 39 c4 72 b5 e8=
 1c
> >>> ff ff ff 85 c0 78 ba 4c 89 e0 5b 5d 41 5c c3 f3 0f 1e fa b8 10 00 00
> >>> 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 75 ba 0c 00 f7 d8 64
> >>> 89 01 48
> >>> [=A0=A0 60.376108] RSP: 002b:00007ffeabc89fc8 EFLAGS: 00000246 ORIG_R=
AX:
> >>> 0000000000000010
> >>> [=A0=A0 60.383758] RAX: ffffffffffffffda RBX: 00007ffeabc8a00c RCX:
> >>> 00007f08ac7b53cb
> >>> [=A0=A0 60.390970] RDX: 00007ffeabc8a00c RSI: 00000000c00c642e RDI:
> >>> 000000000000000d
> >>> [=A0=A0 60.398221] RBP: 00000000c00c642e R08: 000055831c691d00 R09:
> >>> 000055831b2ec010
> >>> [=A0=A0 60.405446] R10: 00007f08acf6ada0 R11: 0000000000000246 R12:
> >>> 000055831c691d00
> >>> [=A0=A0 60.412667] R13: 000000000000000d R14: 00000000007e9000 R15:
> >>> 0000000000000000
> >>> [=A0=A0 60.419903] irq event stamp: 672893
> >>> [=A0=A0 60.423441] hardirqs last=A0 enabled at (672913):
> >>> [<ffffffffb31b796d>] console_unlock+0x44d/0x500
> >>> [=A0=A0 60.432230] hardirqs last disabled at (672922):
> >>> [<ffffffffb31b7963>] console_unlock+0x443/0x500
> >>> [=A0=A0 60.441021] softirqs last=A0 enabled at (672940):
> >>> [<ffffffffb46003dd>] __do_softirq+0x3dd/0x554
> >>> [=A0=A0 60.449634] softirqs last disabled at (672931):
> >>> [<ffffffffb44010f2>] asm_call_irq_on_stack+0x12/0x20
> >>> [=A0=A0 60.458871] ---[ end trace f2f88696eb17806c ]---
> >>>
> >>> For the fix, we don't call dma_map_sgtable() for devices without the
> >>> DMA mask. Drivers for such devices have to map the imported buffer in=
to
> >>> kernel address space and perfom the copy operation in software.
> >>>
> >>> Tested by joining/mirroring displays of udl and radeon un der Gnome/X=
11.
> >>>
> >>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>> Fixes: 6eb0233ec2d0 ("usb: don't inherity DMA properties for USB
> >>> devices")
> >>> Cc: Christoph Hellwig <hch@lst.de>
> >>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >>> Cc: Alan Stern <stern@rowland.harvard.edu>
> >>> Cc: Johan Hovold <johan@kernel.org>
> >>> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >>> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> >>> Cc: "Ahmed S. Darwish" <a.darwish@linutronix.de>
> >>> Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> >>> Cc: Oliver Neukum <oneukum@suse.com>
> >>> Cc: Felipe Balbi <balbi@kernel.org>
> >>> Cc: Thomas Gleixner <tglx@linutronix.de>
> >>> Cc: <stable@vger.kernel.org> # v5.10+
> >>> ---
> >>> =A0 drivers/gpu/drm/drm_prime.c | 27 ++++++++++++++++++---------
> >>> =A0 1 file changed, 18 insertions(+), 9 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> >>> index 2a54f86856af..d5a39fe76b78 100644
> >>> --- a/drivers/gpu/drm/drm_prime.c
> >>> +++ b/drivers/gpu/drm/drm_prime.c
> >>> @@ -603,10 +603,15 @@ EXPORT_SYMBOL(drm_gem_map_detach);
> >>> =A0=A0 * @attach: attachment whose scatterlist is to be returned
> >>> =A0=A0 * @dir: direction of DMA transfer
> >>> =A0=A0 *
> >>> - * Calls &drm_gem_object_funcs.get_sg_table and then maps the
> >>> scatterlist. This
> >>> - * can be used as the &dma_buf_ops.map_dma_buf callback. Should be
> >>> used together
> >>> + * Calls &drm_gem_object_funcs.get_sg_table and, if possible, maps
> >>> the scatterlist.
> >>> + * This can be used as the &dma_buf_ops.map_dma_buf callback. Should
> >>> be used together
> >>> =A0=A0 * with drm_gem_unmap_dma_buf().
> >>> =A0=A0 *
> >>> + * Devices on some peripheral busses, such as USB, cannot use DMA.
> >>> In this case,
> >>> + * pages in the scatterlist remain unmapped. Drivers for such
> >>> devices should acquire
> >>> + * a mapping with dma_buf_vmap() and implement copy operation via
> >>> bus-specific
> >>> + * interfaces.
> >>> + *
> >>> =A0=A0 * Returns:sg_table containing the scatterlist to be returned;
> >>> returns ERR_PTR
> >>> =A0=A0 * on error. May return -EINTR if it is interrupted by a signal.
> >>> =A0=A0 */
> >>> @@ -627,12 +632,14 @@ struct sg_table *drm_gem_map_dma_buf(struct
> >>> dma_buf_attachment *attach,
> >>> =A0=A0=A0=A0=A0 if (IS_ERR(sgt))
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 return sgt;
> >>>
> >>> -=A0=A0=A0 ret =3D dma_map_sgtable(attach->dev, sgt, dir,
> >>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 DMA_ATTR_SKIP_CP=
U_SYNC);
> >>> -=A0=A0=A0 if (ret) {
> >>> -=A0=A0=A0=A0=A0=A0=A0 sg_free_table(sgt);
> >>> -=A0=A0=A0=A0=A0=A0=A0 kfree(sgt);
> >>> -=A0=A0=A0=A0=A0=A0=A0 sgt =3D ERR_PTR(ret);
> >>> +=A0=A0=A0 if (attach->dev->dma_mask) {
> >>> +=A0=A0=A0=A0=A0=A0=A0 ret =3D dma_map_sgtable(attach->dev, sgt, dir,
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 DMA_=
ATTR_SKIP_CPU_SYNC);
> >>> +=A0=A0=A0=A0=A0=A0=A0 if (ret) {
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sg_free_table(sgt);
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 kfree(sgt);
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sgt =3D ERR_PTR(ret);
> >>> +=A0=A0=A0=A0=A0=A0=A0 }
> >>> =A0=A0=A0=A0=A0 }
> >>>
> >>> =A0=A0=A0=A0=A0 return sgt;
> >>> @@ -654,7 +661,9 @@ void drm_gem_unmap_dma_buf(struct
> >>> dma_buf_attachment *attach,
> >>> =A0=A0=A0=A0=A0 if (!sgt)
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 return;
> >>>
> >>> -=A0=A0=A0 dma_unmap_sgtable(attach->dev, sgt, dir, DMA_ATTR_SKIP_CPU=
_SYNC);
> >>> +=A0=A0=A0 if (attach->dev->dma_mask)
> >>> +=A0=A0=A0=A0=A0=A0=A0 dma_unmap_sgtable(attach->dev, sgt, dir,
> >>> DMA_ATTR_SKIP_CPU_SYNC);
> >>> +
> >>> =A0=A0=A0=A0=A0 sg_free_table(sgt);
> >>> =A0=A0=A0=A0=A0 kfree(sgt);
> >>> =A0 }
> >>> -- =

> >>> 2.30.0
> >>>
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >>
> > =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
