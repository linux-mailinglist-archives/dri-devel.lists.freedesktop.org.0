Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24830AD9147
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 17:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B40C10E9ED;
	Fri, 13 Jun 2025 15:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UPNOYMbp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 602D210E9ED
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 15:28:23 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-451dbe494d6so29504385e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 08:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749828502; x=1750433302; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QIY5ZZH8f4Pw2TQ2BAX5wvh7jRG51MX0LIrqrakLVAM=;
 b=UPNOYMbpc+DgjGKVTfIiyHedsABupdtpA7hdPj6PtJ2uRtxVMsGqcqJQISP+aerogI
 586oMeCyJAPZbcWCJ/Aek6GmjzUtVc2tgNabajCknF0P13GrQ2/r2lFNyssWqaaDqOqU
 7ytUpZvcKpLwU0/xSRXxzApkxPlhn4KR1vl374lzyP33HA4k3uxll3LcJWjy+3+UxOhh
 stDxG8AWlD41BsTdmqR+YOE8IRN4jaGbgE5zcLF1KPfLj5JIA4Qjx/RgPLSfV9D7a8VH
 msRpX43++lLtSU/fs+XayKgeBm1CGMMm8gynKkW/0T8lysdbJyDPAW0udiXkLnc8EY3X
 NrLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749828502; x=1750433302;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QIY5ZZH8f4Pw2TQ2BAX5wvh7jRG51MX0LIrqrakLVAM=;
 b=EGQcLxDCxauG5l8vaKD+z4H5TOCuS/9MrsUjQHD4SAhldonjAWBYldVFU4OTjxrhBX
 /Ui8dye51kwePs0IgrH3VJ7s9j+lpiY2qFHFXcf/j0JQNN5ByeQz2L9GYavYTShQOinl
 jJxZQo562T7jpW4eId1brtBK0MbMnk7dNduOYnXVYAZJa77iMMu+8sE+iHFXQMWstIJt
 Vs2OXI12vMfDnOijdbe4RdOWZ7DAi1WHYqlm28Xwa3GJMD6fXS5+qKkkiOVy3XyCAlG+
 QrZ6MZG2AOXMQKG+dUxCaY6xf/NIuzVtksq6spKGpbABh2lFwsxh3aUmMCEgSRkskJbK
 3l9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVR7cH1f7ZQ8omO3p4mPUDm8u2/StP3+Ui/2rMcc120RbwNsHIAYQ5b8J6R4jJSWfucND2z+8W4SJo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVbIflwd5vHIX8JisekbBE41R17CcGc4+DeAImJb6niIBePuJ7
 PqIfROr24qhauGaVh3X0Snm1fHWnm8YcOBMDFTZiVGL4dgPxIc64po1n
X-Gm-Gg: ASbGncswT1hKr790dKjMoEKD5Fbj3GbDYuPcW81yNjvPS6QI9fOY2/jjfnYMAvhI7jG
 5sXLLktZzBxza5La/2bvhKjB1c/en7oYfv0BBOuwwuYWMsiO9r9XyXcJTIBZTJx1wSGY8AA5+rE
 JNhpRB5i6RwiW+uS/hvS19liUk9Pq8Ll6GnL2VrJ73xySpKn+yO2eX48mRn6XE9Rd85AFzHGx/n
 4+/+0jtnhRUfcPjUlMsgDKx0mol+OVc+z13DXwIkDe060CTfHi/yMjXNzOX9jTrn4fRcagTwM50
 9TpGGs4VMuq8YcZqaw1sqZmb6UXPjezoVMJgywS4Soh8ex2JtGYzAp/VUmg=
X-Google-Smtp-Source: AGHT+IF/OYw83P3k+p0SjB9NOmOrQi4fZhrBv8GcdEZcOhD6E1LoNdM+CuC61YjcrD9G2Bg47UjzHw==
X-Received: by 2002:a05:600d:a:b0:441:b698:3431 with SMTP id
 5b1f17b1804b1-45334f4cb8emr26697065e9.28.1749828501647; 
 Fri, 13 Jun 2025 08:28:21 -0700 (PDT)
Received: from fedora ([94.73.34.56]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532e156e8dsm57319925e9.31.2025.06.13.08.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 08:28:21 -0700 (PDT)
Date: Fri, 13 Jun 2025 17:28:19 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Greg KH <gregkh@linuxfoundation.org>, Jonathan.Cameron@huawei.com,
 airlied@gmail.com, aleksander.lobakin@intel.com,
 andriy.shevchenko@linux.intel.com, bhelgaas@google.com,
 broonie@kernel.org, dakr@kernel.org,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, louis.chauvet@bootlin.com,
 lukas@wunner.de, lyude@redhat.com,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 melissa.srw@gmail.com, mripard@kernel.org, quic_zijuhu@quicinc.com,
 rafael@kernel.org, robin.murphy@arm.com,
 rust-for-linux@vger.kernel.org, simona@ffwll.ch
Subject: Re: [PATCH v4 9/9] drm/vkms: convert to use faux_device
Message-ID: <aExDk-v80EZ3zlyr@fedora>
References: <2025022643-scouting-petticoat-492b@gregkh>
 <20250311172054.2903-1-jose.exposito89@gmail.com>
 <2025031218-oxidize-backing-e278@gregkh>
 <Z9LqHcj4n7Dd8A-H@phenom.ffwll.local> <Z9MT23hgX2c21xNA@fedora>
 <fa5f9e9c-09f6-4f92-8f6d-4e057f9fc5a9@suse.de>
 <aEwRqrqn4M32ScxN@fedora>
 <1a1cf578-2d27-486d-8418-737a99c9ebca@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a1cf578-2d27-486d-8418-737a99c9ebca@suse.de>
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

Hi,

On Fri, Jun 13, 2025 at 02:33:36PM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 13.06.25 um 13:55 schrieb José Expósito:
> > Hi Thomas,
> > 
> > Thanks for the heads up, this issue fall through the cracks.
> > 
> > On Fri, Jun 13, 2025 at 10:15:05AM +0200, Thomas Zimmermann wrote:
> > > Hi
> > > 
> > > Am 13.03.25 um 18:20 schrieb José Expósito:
> > > > On Thu, Mar 13, 2025 at 03:22:21PM +0100, Simona Vetter wrote:
> > > > > On Wed, Mar 12, 2025 at 07:22:07AM +0100, Greg KH wrote:
> > > > > > On Tue, Mar 11, 2025 at 06:20:53PM +0100, José Expósito wrote:
> > > > > > > Hi everyone,
> > > > > > > 
> > > > > > > > On Tue, Feb 25, 2025 at 02:51:40PM +0100, Louis Chauvet wrote:
> > > > > > > > > Le 25/02/2025 à 12:41, Thomas Zimmermann a écrit :
> > > > > > > > > > Hi
> > > > > > > > > > 
> > > > > > > > > > Am 10.02.25 um 15:37 schrieb Louis Chauvet:
> > > > > > > > > > > On 10/02/25 - 13:30, Greg Kroah-Hartman wrote:
> > > > > > > > > > > > The vkms driver does not need to create a platform device, as there is
> > > > > > > > > > > > no real platform resources associated it,  it only did so because it was
> > > > > > > > > > > > simple to do that in order to get a device to use for resource
> > > > > > > > > > > > management of drm resources.  Change the driver to use the faux device
> > > > > > > > > > > > instead as this is NOT a real platform device.
> > > > > > > > > > > > 
> > > > > > > > > > > > Cc: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > > > > > > > > > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > > > > > > > > > > > Cc: Simona Vetter <simona@ffwll.ch>
> > > > > > > > > > > > Cc: Melissa Wen <melissa.srw@gmail.com>
> > > > > > > > > > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > > > > > > > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > > > > > > > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > > > > > > > > > Cc: David Airlie <airlied@gmail.com>
> > > > > > > > > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > > > > > > > > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > > > > > > > > > > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > > > > > > > Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > > > > > > > > 
> > > > > > > > > > > Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > > > > > > > > Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > > > > > > > > 
> > > > > > > > > > > Thanks for the modification, it seems to work.
> > > > > > > > > > Should this patch be merged through DRM trees? drm-misc-next is at
> > > > > > > > > > v6.14-rc4 and has struct faux_device.
> > > > > > > > > Hi,
> > > > > > > > > 
> > > > > > > > > I was not aware the faux-device was merged, as it is a new feature, I
> > > > > > > > > expected it to reach drm-misc-next on 6.15-rc1.
> > > > > > > > I added it to Linus's tree just so that DRM could get these changes into
> > > > > > > > their tree now :)
> > > > > > > > 
> > > > > > > > > I plan to merge [1] today/tomorrow (well tested with platform_device), and
> > > > > > > > > then I will submit an updated version of this patch (only trivial conflicts,
> > > > > > > > > but never tested with multiple VKMS devices).
> > > > > > > > > 
> > > > > > > > > [1]:https://lore.kernel.org/all/20250218101214.5790-1-jose.exposito89@gmail.com/
> > > > > > > > Great, thanks!
> > > > > > > > 
> > > > > > > > greg k-h
> > > > > > > Testing this patch again as part of some IGT tests I'm working on,
> > > > > > > I noticed that, applying this patch on top of the latest drm-misc-next
> > > > > > > triggers a warning at drivers/gpu/drm/drm_gem.c:571, in
> > > > > > > drm_gem_get_pages():
> > > > > > > 
> > > > > > >       if (WARN_ON(!obj->filp))
> > > > > > >               return ERR_PTR(-EINVAL);
> > > > > > I don't see how the faux bus change would have anything to do with a
> > > > > > filp as that's not related as far as I can tell.  But I don't know the
> > > > > > drm layer at all, where does that filp come from?
> > > > > Yeah that filp is the shmem file that backs gem bo. That's very far away
> > > > > from anything device/driver related datastrctures. If this is a new
> > > > > failure due to the aux bux conversion then it would be really surprising.
> > > > Agreed, I find it surprising, but reverting the patch removes the warning.
> > > > 
> > > > It's most likely an issue on my side, but I decided to double check just
> > > > in case someone else is also seeing this warning.
> > > Any news on this issue?
> > I tested again with drm-misc-next. At the moment of writing this, the last
> > commit is 6bd90e700b42 ("drm/xe: Make dma-fences compliant with the safe
> > access rules") and I still see a similar warning. The stack trace changed,
> > but the warning is still present.
> > 
> > I'm going to detail the exact steps I followed. Let's see if someone else is
> > able to reproduce the issue:
> > 
> > I started by applying the patches from this series that are not already merged:
> > 
> >   - [PATCH v4 4/9] x86/microcode: move away from using a fake platform
> >   - [PATCH v4 5/9] wifi: cfg80211: move away from using a fake
> >   - [PATCH v4 8/9] drm/vgem/vgem_drv convert to use faux_device
> >   - [PATCH v4 9/9] drm/vkms: convert to use faux_device
> > 
> > The last patch has small conflict in vkms_drv.h that I solved like this:
> > 
> > 	struct vkms_device {
> > 		struct drm_device drm;
> > 		struct faux_device *faux_dev;
> > 		const struct vkms_config *config;
> > 	};
> > 
> > And in vkms_drv.c:
> > 
> > 	static int vkms_create(struct vkms_config *config)
> > 	{
> > 		int ret;
> > 		struct faux_device *fdev;
> > 		struct vkms_device *vkms_device;
> > 		const char *dev_name;
> > 
> > 		dev_name = vkms_config_get_device_name(config);
> > 		fdev = faux_device_create(dev_name, NULL, NULL);
> > 		if (!fdev)
> > 			return -ENODEV;
> > 
> > Next, I installed the new kernel in a QEMU virtual machine running Fedora 41.
> > There is nothing special about my Fedora, it is the regular desktop version.
> > 
> > After a reboot, "sudo modprobe vkms" shows a similar warning in dmesg.
> > For reference, the warning is at the end of my email.
> > 
> > Am I the only one sawing this warning?
> > 
> > Jose
> > 
> > ---
> > 
> > [   69.417850] [drm] Initialized vkms 1.0.0 for vkms on minor 1
> > [   69.419446] faux_driver vkms: [drm] fb1: vkmsdrmfb frame buffer device
> > [   69.520944] ------------[ cut here ]------------
> > [   69.520954] WARNING: CPU: 2 PID: 1015 at drivers/dma-buf/dma-buf.c:1518 dma_buf_vmap+0x212/0x540
> > [   69.520992] Modules linked in: vkms snd_seq_dummy snd_hrtimer snd_seq snd_seq_device snd_timer snd soundcore nf_conntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables rfkill qrtr sunrpc binfmt_misc ppdev pktcdvd parport_pc parport pcspkr i2c_piix4 e1000 i2c_smbus joydev loop nfnetlink vsock_loopback zram vmw_vsock_virtio_transport_common vmw_vsock_vmci_transport vmw_vmci vsock bochs serio_raw ata_generic pata_acpi fuse qemu_fw_cfg
> > [   69.521082] CPU: 2 UID: 42 PID: 1015 Comm: KMS thread Not tainted 6.16.0-rc1+ #3 PREEMPT(voluntary)
> > [   69.521092] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-4.fc42 04/01/2014
> > [   69.521095] RIP: 0010:dma_buf_vmap+0x212/0x540
> 
> That's dmabuf. could be related to the fact that there's no real DMA
> possible with the faux_device. We now have support for dmabuf-without-DMA,
> sort of. Could you please replace DRM_GEM_SHMEM_DRIVER_OPS with the new
> DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT at [1]. That would avoid any actual
> hardware-DMA functionality.

I don't see the warning anymore :) However, could this change introduce
unexpected side-effects?

Since Louis and Greg didn't see this warning, I'm a bit worried that it
is caused by something unrelated in my dev environment.
If the change can cause other issues, I'd prefer to avoid it. It is weird
that I'm the only one seeing it.

Jose

> [1] https://elixir.bootlin.com/linux/v6.15.1/source/drivers/gpu/drm/vkms/vkms_drv.c#L104
> 
> Best regards
> Thomas
> 
> 
> > [   69.521105] Code: 7c 41 ff 03 0f 85 0a 02 00 00 c9 e9 c8 47 0c 01 80 3c 06 00 0f 85 c4 01 00 00 48 c7 01 00 00 00 00 48 85 d2 0f 85 bd fe ff ff <0f> 0b b8 ea ff ff ff eb af 48 85 f6 0f 85 cf 01 00 00 48 89 4c 24
> > [   69.521112] RSP: 0018:ffffc90006a5f690 EFLAGS: 00010246
> > [   69.521125] RAX: dffffc0000000000 RBX: 1ffff92000d4beea RCX: ffff88811467dcc8
> > [   69.521128] RDX: 0000000000000000 RSI: 1ffff110228cfb99 RDI: ffff88811467dcd0
> > [   69.521131] RBP: ffffc90006a5f728 R08: 1ffff92000d4bed9 R09: fffff52000d4bef1
> > [   69.521162] R10: fffff52000d4bef2 R11: ffff8881017f4e28 R12: ffff8881149594f0
> > [   69.521165] R13: ffff888114959400 R14: 1ffff11023146b29 R15: ffff88811467dcc8
> > [   69.521168] FS:  00007fbbdd1ff6c0(0000) GS:ffff888417580000(0000) knlGS:0000000000000000
> > [   69.521172] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [   69.521174] CR2: 00007fbbcc0345c8 CR3: 000000011ec5a000 CR4: 00000000000006f0
> > [   69.521179] Call Trace:
> > [   69.521182]  <TASK>
> > [   69.521185]  ? __pfx_dma_buf_vmap+0x10/0x10
> > [   69.521193]  ? dma_resv_get_singleton+0x9a/0x2a0
> > [   69.521197]  drm_gem_shmem_vmap_locked+0xc2/0x5f0
> > [   69.521208]  ? __pfx_drm_gem_shmem_vmap_locked+0x10/0x10
> > [   69.521212]  ? __pfx_ww_mutex_lock+0x10/0x10
> > [   69.521225]  ? sched_clock_noinstr+0xd/0x20
> > [   69.521230]  ? local_clock_noinstr+0x13/0xf0
> > [   69.521233]  drm_gem_shmem_object_vmap+0xd/0x20
> > [   69.521237]  drm_gem_vmap_locked+0x70/0xf0
> > [   69.521247]  drm_gem_vmap+0x4c/0xa0
> > [   69.521250]  drm_gem_fb_vmap+0xb2/0x3b0
> > [   69.521255]  vkms_prepare_fb+0x6f/0x90 [vkms]
> > [   69.521264]  ? drm_atomic_helper_setup_commit+0xb7b/0x1320
> > [   69.521268]  drm_atomic_helper_prepare_planes+0x19f/0xb90
> > [   69.521272]  ? __pfx_drm_atomic_helper_commit+0x10/0x10
> > [   69.521276]  drm_atomic_helper_commit+0x126/0x2d0
> > [   69.521279]  ? __pfx_drm_atomic_helper_commit+0x10/0x10
> > [   69.521282]  drm_atomic_commit+0x205/0x2d0
> > [   69.521290]  ? _raw_spin_lock_irqsave+0x97/0xf0
> > [   69.521295]  ? __pfx_drm_atomic_commit+0x10/0x10
> > [   69.521299]  ? __pfx___drm_printfn_info+0x10/0x10
> > [   69.521313]  ? drm_event_reserve_init+0x1cd/0x260
> > [   69.521318]  drm_mode_atomic_ioctl+0x1c79/0x2d30
> > [   69.521323]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
> > [   69.521326]  ? __kasan_check_write+0x18/0x20
> > [   69.521339]  drm_ioctl_kernel+0x17b/0x2f0
> > [   69.521343]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
> > [   69.521349]  ? __pfx_drm_ioctl_kernel+0x10/0x10
> > [   69.521353]  ? __pfx_do_vfs_ioctl+0x10/0x10
> > [   69.521361]  ? __kasan_check_write+0x18/0x20
> > [   69.521365]  drm_ioctl+0x51b/0xbd0
> > [   69.521369]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
> > [   69.521373]  ? __pfx_drm_ioctl+0x10/0x10
> > [   69.521378]  ? selinux_file_ioctl+0xfc/0x260
> > [   69.521390]  __x64_sys_ioctl+0x143/0x1d0
> > [   69.521394]  x64_sys_call+0xf4b/0x1d70
> > [   69.521404]  do_syscall_64+0x82/0x2a0
> > [   69.521408]  ? __kasan_check_write+0x18/0x20
> > [   69.521411]  ? do_user_addr_fault+0x491/0xa60
> > [   69.521420]  ? irqentry_exit+0x3f/0x50
> > [   69.521423]  ? exc_page_fault+0x8b/0xe0
> > [   69.521426]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > [   69.521430] RIP: 0033:0x7fbc078fd8ed
> > [   69.521441] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
> > [   69.521444] RSP: 002b:00007fbbdd1fd9b0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> > [   69.521449] RAX: ffffffffffffffda RBX: 00007fbbcc02af60 RCX: 00007fbc078fd8ed
> > [   69.521452] RDX: 00007fbbdd1fda50 RSI: 00000000c03864bc RDI: 0000000000000035
> > [   69.521455] RBP: 00007fbbdd1fda00 R08: 00000000000000e0 R09: 0000000000000001
> > [   69.521457] R10: 0000000000000003 R11: 0000000000000246 R12: 00007fbbdd1fda50
> > [   69.521459] R13: 00000000c03864bc R14: 0000000000000035 R15: 00007fbbcc02acf0
> > [   69.521464]  </TASK>
> > [   69.521466] ---[ end trace 0000000000000000 ]---
> > 
> > 
> > 
> > > Best regards
> > > Thomas
> > > 
> > > > Jose
> > > > 
> > > > > -Sima
> > > > > 
> > > > > -- 
> > > > > Simona Vetter
> > > > > Software Engineer, Intel Corporation
> > > > > http://blog.ffwll.ch
> > > -- 
> > > --
> > > Thomas Zimmermann
> > > Graphics Driver Developer
> > > SUSE Software Solutions Germany GmbH
> > > Frankenstrasse 146, 90461 Nuernberg, Germany
> > > GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> > > HRB 36809 (AG Nuernberg)
> > > 
> 
> -- 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
> 
