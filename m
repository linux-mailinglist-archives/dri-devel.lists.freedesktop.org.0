Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BEE8C4E99
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 11:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B29610E1FB;
	Tue, 14 May 2024 09:20:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="kcIndD2q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A9E10E0A1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 09:20:01 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2e0a34b2899so81664851fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 02:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715678400; x=1716283200;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RivAlkjOqXc/pW2Qqga6qOl+AtvNBOXfDpmocTg5DSc=;
 b=kcIndD2qzbx8eoKEk0kJ7uqqQRiR/a7EKF8knsxCF4QXvcihjbPKChcU6vozfLfHee
 Q+7VCwHB6amDy6ZkV4IUkZSe2d+OZwplPtBZyirQ6rYQ3X/x8QJtINT9SVdM0WKB8D8p
 rureX1hlNsaAkf5amUYeYA7ZwYqNM2im+Ira4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715678400; x=1716283200;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RivAlkjOqXc/pW2Qqga6qOl+AtvNBOXfDpmocTg5DSc=;
 b=URYntbBsOs+Je9SH9XWxkY5lS52zv1nNI3mV2bTJHMm/FO13BWuikUGi96ggFMay90
 6T4Q2vS+KcV3qIEbo2HtFCne6X6ekqcFMD/ya3KzRpYOSR2kdbXb1G4y3XeRjW//gIE0
 eYEwFQO54M7LegtGIlcuavVy4XSpSGDYDSVnPr9CAxIUyNKxhrgYxoCJcHIkMNPzm/lo
 WiVBSDaEg808HvL5kRJVtkgH+8JWn6bySRLQUbLhKPvRWC5VbgTKIejZHwiPG/LS2HMz
 /D9LnVhtojvEMVvxM7TbDLv5zzNlH4IeWb15Bdg1JIAe5g32k7kzMkpM24z/RuoaXiAu
 AiVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPgfJZNm5VJ8SpCeFUe70oq/JqtnGmtdWfCZiyews8f5u/HEK+a0Q4QITLvL10k2ga7gSHoCuhGwralVtSVbklynCcot5ZdIZrqx2EeNzo
X-Gm-Message-State: AOJu0YyEZIDOtnVw9OX8Tkuh4kEd6StpA51/rLSeow91mNhUS6F1Ay3q
 BoohkBzuJc+roAfXE2N+bJo8jJxj6RseUT7+eUV+JF0lHSB9UiwJhum31PMdBgopx46FbvzRDdk
 oikvyWgg/J3/LSY2tyyooimvX/HVW7rIK152q
X-Google-Smtp-Source: AGHT+IGnn/2XJ1U2Ocve7a3WGXIKVewBQ4dH5U6v1OBcTXc4hVtr3c246DA9rcWlw7DMhvZsqiMaFZCDFq/O2rurG4w=
X-Received: by 2002:a2e:a685:0:b0:2e5:66b2:c5bf with SMTP id
 38308e7fff4ca-2e566b2c83bmr72508801fa.29.1715678399754; Tue, 14 May 2024
 02:19:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAGXv+5FEmMzv9N-=vH8mr9LYD7PjWGEZ1wS0dniFECV6PJzbyg@mail.gmail.com>
 <fbba316d-2152-4567-9f5e-b8489bf9456a@imgtec.com>
In-Reply-To: <fbba316d-2152-4567-9f5e-b8489bf9456a@imgtec.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 14 May 2024 17:19:48 +0800
Message-ID: <CAGXv+5H--BHRa4E2oRfw_9-3wKKkPtPVouBOPptLOhup_30+zw@mail.gmail.com>
Subject: Re: powervr lockdep warnings
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Frank Binns <Frank.Binns@imgtec.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
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

On Tue, May 14, 2024 at 4:54=E2=80=AFPM Matt Coster <Matt.Coster@imgtec.com=
> wrote:
>
> On 10/05/2024 09:43, Chen-Yu Tsai wrote:
> > Hi,
> >
> > I got the following lockdep warnings while trying to make the powervr
> > driver work on MT8173. This was observed while trying to run vkmark.
> > This was on the next-20240506 kernel running Debian Sid with the
> > Mesa 24.0.6 package rebuilt to include the powervr driver.
>
> Hi,
>
> Thanks for the report! I've got an elm chromebook set up with the same
> versions mentioned above, and spent yesterday trying to make it
> reproduce the issue without success.
>
> I don't really have time at the moment to keep working on this, but I've
> made a note to come back to it when I get a chance.
>
>  From the traces below, it doesn't *seem* like this should be a platform
> specific issue, so I'm definitely interested in getting it fixed.

I broke out the BeaglePlay I got at ELC, grabbed a new image from
beagleboard.org and upgraded the kernel to their v6.9 package, and
used the same packages from my MT8173 run. It seemed to run OK, but
it's possible the kernel doesn't have CONFIG_LOCKDEP enabled.

I'll do some more tests on MT8173 with a release kernel and fewer
stuff on top.


Thanks
ChenYu

> Cheers,
> Matt
>
> > [73602.438144] ------------[ cut here ]------------
> > [73602.450563] WARNING: CPU: 3 PID: 2244 at
> > drivers/gpu/drm/drm_gpuvm.c:1874 drm_gpuva_unlink+0xec/0x140
> > [drm_gpuvm]
> > [73602.468778] Modules linked in: mtk_vcodec_dec mtk_vcodec_enc
> > v4l2_vp9 v4l2_h264 cdc_ether mtk_vcodec_dbgfs usbnet mtk_vcodec_common
> > mtk_jpeg uvcvideo mtk_scp powervr mtk_jpeg_enc_hw mtk_rpmsg mtk_mdp
> > rpmsg_core cros_ec_sensors mtk_jpeg_dec_hw mtk_scp_ipi
> > cros_ec_sensors_core videobuf2_vmalloc v4l2_mem2mem r8152 uvc
> > videobuf2_dma_contig videobuf2_v4l2 drm_gpuvm videobuf2_memops sha1_ce
> > videobuf2_common mii drm_exec cros_ec_sensorhub mtk_vpu joydev fuse
> > [73602.526113] CPU: 3 PID: 2244 Comm: vkmark Tainted: G        W
> >     6.9.0-rc7-next-20240506-11489-g2585d27380e4-dirty #217
> > b57080d80a375eadc1b59c661ce880f5be496816
> > [73602.549750] Hardware name: Google Elm (DT)
> > [73602.562503] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BT=
YPE=3D--)
> > [73602.578257] pc : drm_gpuva_unlink+0xec/0x140 [drm_gpuvm]
> > [73602.592391] lr : drm_gpuva_unlink+0x12c/0x140 [drm_gpuvm]
> > [73602.606597] sp : ffffffc086aa7590
> > [73602.618660] x29: ffffffc086aa7590 x28: 0000008000000000 x27: ffffffc=
07ca59b98
> > [73602.634725] x26: ffffffc086aa7900 x25: 0000000000000000 x24: ffffff8=
0c14c5980
> > [73602.650776] x23: ffffff80054cee08 x22: ffffff80c14c5d00 x21: ffffffc=
082f8a000
> > [73602.666878] x20: ffffff80d1c3a000 x19: ffffff80054cee00 x18: 0000000=
000000000
> > [73602.682898] x17: 0000000000000000 x16: 0000000000000000 x15: 0000007=
fc6e28c90
> > [73602.698907] x14: 1ffffff810d54ea4 x13: 0000000041b58ab3 x12: ffffffb=
019c8f00c
> > [73602.714919] x11: 1ffffff019c8f00b x10: ffffffb019c8f00b x9 : ffffffc=
07ca1dff8
> > [73602.730964] x8 : 0000004fe6370ff5 x7 : ffffff80ce47805b x6 : 0000000=
000000001
> > [73602.746942] x5 : ffffff80ce478058 x4 : ffffff80ce478058 x3 : 0000000=
000000000
> > [73602.762920] x2 : 0000000000000000 x1 : ffffff80d1c3a1a0 x0 : 0000000=
000000000
> > [73602.778793] Call trace:
> > [73602.789746]  drm_gpuva_unlink+0xec/0x140 [drm_gpuvm
> > bbf6d948c0b434a2936abb76cd7734fb954b4801]
> > [73602.807036]  pvr_vm_gpuva_unmap+0x88/0xb0 [powervr
> > 3ad437ff1d69ca6bbe76c29aac5b59cf4d3e54e4]
> > [73602.824299]  op_unmap_cb.isra.0+0xbc/0x108 [drm_gpuvm
> > bbf6d948c0b434a2936abb76cd7734fb954b4801]
> > [73602.841559]  __drm_gpuvm_sm_unmap+0x288/0x2c0 [drm_gpuvm
> > bbf6d948c0b434a2936abb76cd7734fb954b4801]
> > [73602.858863]  drm_gpuvm_sm_unmap+0x78/0xb8 [drm_gpuvm
> > bbf6d948c0b434a2936abb76cd7734fb954b4801]
> > [73602.875693]  pvr_vm_bind_op_exec+0x6c/0x118 [powervr
> > 3ad437ff1d69ca6bbe76c29aac5b59cf4d3e54e4]
> > [73602.892483]  pvr_vm_unmap+0x1f8/0x238 [powervr
> > 3ad437ff1d69ca6bbe76c29aac5b59cf4d3e54e4]
> > [73602.908746]  pvr_ioctl_vm_unmap+0x80/0xb8 [powervr
> > 3ad437ff1d69ca6bbe76c29aac5b59cf4d3e54e4]
> > [73602.925386]  drm_ioctl_kernel+0x140/0x1d0
> > [73602.937503]  drm_ioctl+0x3e8/0x7e0
> > [73602.948949]  __arm64_sys_ioctl+0xec/0x118
> > [73602.960993]  invoke_syscall+0x68/0x198
> > [73602.972749]  el0_svc_common.constprop.0+0x80/0x150
> > [73602.985561]  do_el0_svc+0x38/0x50
> > [73602.996856]  el0_svc+0x4c/0xc0
> > [73603.007821]  el0t_64_sync_handler+0x120/0x130
> > [73603.020096]  el0t_64_sync+0x1a8/0x1b0
> > [73603.031606] irq event stamp: 153208
> > [73603.042881] hardirqs last  enabled at (153207):
> > [<ffffffc081475b30>] _raw_spin_unlock_irqrestore+0x98/0xa8
> > [73603.060595] hardirqs last disabled at (153208):
> > [<ffffffc081461a00>] el1_dbg+0x28/0x90
> > [73603.076534] softirqs last  enabled at (153032):
> > [<ffffffc08001a714>] fpsimd_restore_current_state+0x4c/0xf8
> > [73603.094345] softirqs last disabled at (153030):
> > [<ffffffc08001a6e4>] fpsimd_restore_current_state+0x1c/0xf8
> > [73603.112041] ---[ end trace 0000000000000000 ]---
> > [73603.125721] ------------[ cut here ]------------
> > [73603.165947] WARNING: CPU: 0 PID: 2244 at
> > drivers/gpu/drm/drm_gpuvm.c:1514 drm_gpuvm_bo_put.part.0+0x1c0/0x4d0
> > [drm_gpuvm]
> > [73603.213280] Modules linked in: mtk_vcodec_dec mtk_vcodec_enc
> > v4l2_vp9 v4l2_h264 cdc_ether mtk_vcodec_dbgfs usbnet mtk_vcodec_common
> > mtk_jpeg uvcvideo mtk_scp powervr mtk_jpeg_enc_hw mtk_rpmsg mtk_mdp
> > rpmsg_core cros_ec_sensors mtk_jpeg_dec_hw mtk_scp_ipi
> > cros_ec_sensors_core videobuf2_vmalloc v4l2_mem2mem r8152 uvc
> > videobuf2_dma_contig videobuf2_v4l2 drm_gpuvm videobuf2_memops sha1_ce
> > videobuf2_common mii drm_exec cros_ec_sensorhub mtk_vpu joydev fuse
> > [73603.332160] CPU: 0 PID: 2244 Comm: vkmark Tainted: G        W
> >     6.9.0-rc7-next-20240506-11489-g2585d27380e4-dirty #217
> > b57080d80a375eadc1b59c661ce880f5be496816
> > [73603.386774] Hardware name: Google Elm (DT)
> > [73603.429641] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BT=
YPE=3D--)
> > [73603.475694] pc : drm_gpuvm_bo_put.part.0+0x1c0/0x4d0 [drm_gpuvm]
> > [73603.520680] lr : drm_gpuvm_bo_put.part.0+0x49c/0x4d0 [drm_gpuvm]
> > [73603.565596] sp : ffffffc086aa7540
> > [73603.607495] x29: ffffffc086aa7540 x28: 0000008000000000 x27: ffffffc=
07ca59b98
> > [73603.653971] x26: ffffffc082f8ae24 x25: ffffff80c14c59c8 x24: ffffffc=
07ca59b60
> > [73603.700424] x23: ffffff80c14c59c8 x22: ffffffc082f8a000 x21: ffffff8=
0d1c3a000
> > [73603.746907] x20: ffffff80ce478010 x19: ffffff80c14c5980 x18: 0000000=
000000000
> > [73603.793539] x17: 0000000000000000 x16: 0000000000000000 x15: 0000007=
fc6e28c90
> > [73603.840321] x14: 1ffffff810d54e60 x13: 0000000041b58ab3 x12: ffffffb=
019c8f02c
> > [73603.887322] x11: 1ffffff019c8f02b x10: ffffffb019c8f02b x9 : dfffffc=
000000000
> > [73603.934480] x8 : 0000004fe6370fd5 x7 : ffffff80ce478158 x6 : 0000000=
000000001
> > [73603.981343] x5 : ffffff80ce478158 x4 : ffffffb019c8f02c x3 : 0000000=
000000000
> > [73604.028173] x2 : 0000000000000000 x1 : ffffff80d1c3a1a0 x0 : 0000000=
000000000
> > [73604.074920] Call trace:
> > [73604.116427]  drm_gpuvm_bo_put.part.0+0x1c0/0x4d0 [drm_gpuvm
> > bbf6d948c0b434a2936abb76cd7734fb954b4801]
> > [73604.165828]  drm_gpuva_unlink+0xfc/0x140 [drm_gpuvm
> > bbf6d948c0b434a2936abb76cd7734fb954b4801]
> > [73604.214815]  pvr_vm_gpuva_unmap+0x88/0xb0 [powervr
> > 3ad437ff1d69ca6bbe76c29aac5b59cf4d3e54e4]
> > [73604.263747]  op_unmap_cb.isra.0+0xbc/0x108 [drm_gpuvm
> > bbf6d948c0b434a2936abb76cd7734fb954b4801]
> > [73604.311722]  __drm_gpuvm_sm_unmap+0x288/0x2c0 [drm_gpuvm
> > bbf6d948c0b434a2936abb76cd7734fb954b4801]
> > [73604.358926]  drm_gpuvm_sm_unmap+0x78/0xb8 [drm_gpuvm
> > bbf6d948c0b434a2936abb76cd7734fb954b4801]
> > [73604.404827]  pvr_vm_bind_op_exec+0x6c/0x118 [powervr
> > 3ad437ff1d69ca6bbe76c29aac5b59cf4d3e54e4]
> > [73604.450483]  pvr_vm_unmap+0x1f8/0x238 [powervr
> > 3ad437ff1d69ca6bbe76c29aac5b59cf4d3e54e4]
> > [73604.495629]  pvr_ioctl_vm_unmap+0x80/0xb8 [powervr
> > 3ad437ff1d69ca6bbe76c29aac5b59cf4d3e54e4]
> > [73604.541253]  drm_ioctl_kernel+0x140/0x1d0
> > [73604.581936]  drm_ioctl+0x3e8/0x7e0
> > [73604.621751]  __arm64_sys_ioctl+0xec/0x118
> > [73604.662115]  invoke_syscall+0x68/0x198
> > [73604.702215]  el0_svc_common.constprop.0+0x80/0x150
> > [73604.743445]  do_el0_svc+0x38/0x50
> > [73604.782981]  el0_svc+0x4c/0xc0
> > [73604.822048]  el0t_64_sync_handler+0x120/0x130
> > [73604.862456]  el0t_64_sync+0x1a8/0x1b0
> > [73604.901872] irq event stamp: 153240
> > [73604.940864] hardirqs last  enabled at (153239):
> > [<ffffffc081461818>] exit_to_kernel_mode+0x40/0x128
> > [73604.986615] hardirqs last disabled at (153240):
> > [<ffffffc081461a00>] el1_dbg+0x28/0x90
> > [73605.031143] softirqs last  enabled at (153232):
> > [<ffffffc0800f7308>] handle_softirqs+0x6d8/0x708
> > [73605.076567] softirqs last disabled at (153211):
> > [<ffffffc080010484>] __do_softirq+0x1c/0x28
> > [73605.121199] ---[ end trace 0000000000000000 ]---
