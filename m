Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B038C1FFB
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 10:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2145510E272;
	Fri, 10 May 2024 08:43:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ODzf6XW/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78C910E272
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 08:43:27 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-51f72a29f13so2206978e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 01:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715330605; x=1715935405;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=6LCSeFj/Si+muKPQqhVh9ojKhSVst2hfo+h15HpEYh4=;
 b=ODzf6XW/gfzJJE7Lb4RqBGwZWpvntd6SFnL+f4Dx/tj/ahicCx3IY+YbCC8RxF3S2V
 3R0EAtBUwz0CbrTroGTHi7OxYeXVnIMTnO4p1O6b4ma6oTPH5IEauAoYpZWAAKx3FuZr
 ndnW7iZpryCeNgz8w3Lu94ZyJkXsXK2wYl6ys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715330605; x=1715935405;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6LCSeFj/Si+muKPQqhVh9ojKhSVst2hfo+h15HpEYh4=;
 b=F3zvXPuWfIitCdbV4zMoxW1e5WReitOck+7F98MF6arMomdqb4iCJ6YZUPYdpcwgrk
 3K0zpcTBSYSAJ/0tKV1GqlffJoFm7eaF+lHEC0Pq8Z5DBzNUJfUHow2nzRNiu1Su/+mW
 0YU0iXsDDOKDsrECWWOa0XB911Su08Fk08KplFvao2VKGnbRPtDvXQDycFjc0/gxiIai
 rUruufzcWZPFDAS5vBbJIoZEPV6jC2cEpKQr/Mq9aOLuAtwnHZTsbPopOUe++xYVHab9
 NJjiKftaXeA+32gOvQKWQneSCqX+Lyz27eXSqyTGObiipg7yICoP98dm9VJ5huMuUfFc
 Bc8g==
X-Gm-Message-State: AOJu0Yz2JdvFfBcLyOGa+u/OfC2KdvtmyqDpJofQdVxLGG856jTyDonw
 BhbUAAL54Vk1poMsiZXkcuAvHQT9qzTNpZaruM8fpZbtrZzLxkSMuUbG/Wn/RYCoFT0iIXcgeSs
 ANQgN9dxWrWkthnOXi5ofK/H2zIp5I+7Yfran
X-Google-Smtp-Source: AGHT+IHFNzCylZto0QRvVj4xAeg74RSGfX79HMB+Rcg1RK3SATs8rjPN4X0T5+ZekNO6Ngh0wS6t1iUdEZOs+fHVHj8=
X-Received: by 2002:ac2:4209:0:b0:51f:567b:c398 with SMTP id
 2adb3069b0e04-5221006fe6fmr1081341e87.28.1715330605196; Fri, 10 May 2024
 01:43:25 -0700 (PDT)
MIME-Version: 1.0
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 10 May 2024 16:43:14 +0800
Message-ID: <CAGXv+5FEmMzv9N-=vH8mr9LYD7PjWGEZ1wS0dniFECV6PJzbyg@mail.gmail.com>
Subject: powervr lockdep warnings
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
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

I got the following lockdep warnings while trying to make the powervr
driver work on MT8173. This was observed while trying to run vkmark.
This was on the next-20240506 kernel running Debian Sid with the
Mesa 24.0.6 package rebuilt to include the powervr driver.


[73602.438144] ------------[ cut here ]------------
[73602.450563] WARNING: CPU: 3 PID: 2244 at
drivers/gpu/drm/drm_gpuvm.c:1874 drm_gpuva_unlink+0xec/0x140
[drm_gpuvm]
[73602.468778] Modules linked in: mtk_vcodec_dec mtk_vcodec_enc
v4l2_vp9 v4l2_h264 cdc_ether mtk_vcodec_dbgfs usbnet mtk_vcodec_common
mtk_jpeg uvcvideo mtk_scp powervr mtk_jpeg_enc_hw mtk_rpmsg mtk_mdp
rpmsg_core cros_ec_sensors mtk_jpeg_dec_hw mtk_scp_ipi
cros_ec_sensors_core videobuf2_vmalloc v4l2_mem2mem r8152 uvc
videobuf2_dma_contig videobuf2_v4l2 drm_gpuvm videobuf2_memops sha1_ce
videobuf2_common mii drm_exec cros_ec_sensorhub mtk_vpu joydev fuse
[73602.526113] CPU: 3 PID: 2244 Comm: vkmark Tainted: G        W
   6.9.0-rc7-next-20240506-11489-g2585d27380e4-dirty #217
b57080d80a375eadc1b59c661ce880f5be496816
[73602.549750] Hardware name: Google Elm (DT)
[73602.562503] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[73602.578257] pc : drm_gpuva_unlink+0xec/0x140 [drm_gpuvm]
[73602.592391] lr : drm_gpuva_unlink+0x12c/0x140 [drm_gpuvm]
[73602.606597] sp : ffffffc086aa7590
[73602.618660] x29: ffffffc086aa7590 x28: 0000008000000000 x27: ffffffc07ca59b98
[73602.634725] x26: ffffffc086aa7900 x25: 0000000000000000 x24: ffffff80c14c5980
[73602.650776] x23: ffffff80054cee08 x22: ffffff80c14c5d00 x21: ffffffc082f8a000
[73602.666878] x20: ffffff80d1c3a000 x19: ffffff80054cee00 x18: 0000000000000000
[73602.682898] x17: 0000000000000000 x16: 0000000000000000 x15: 0000007fc6e28c90
[73602.698907] x14: 1ffffff810d54ea4 x13: 0000000041b58ab3 x12: ffffffb019c8f00c
[73602.714919] x11: 1ffffff019c8f00b x10: ffffffb019c8f00b x9 : ffffffc07ca1dff8
[73602.730964] x8 : 0000004fe6370ff5 x7 : ffffff80ce47805b x6 : 0000000000000001
[73602.746942] x5 : ffffff80ce478058 x4 : ffffff80ce478058 x3 : 0000000000000000
[73602.762920] x2 : 0000000000000000 x1 : ffffff80d1c3a1a0 x0 : 0000000000000000
[73602.778793] Call trace:
[73602.789746]  drm_gpuva_unlink+0xec/0x140 [drm_gpuvm
bbf6d948c0b434a2936abb76cd7734fb954b4801]
[73602.807036]  pvr_vm_gpuva_unmap+0x88/0xb0 [powervr
3ad437ff1d69ca6bbe76c29aac5b59cf4d3e54e4]
[73602.824299]  op_unmap_cb.isra.0+0xbc/0x108 [drm_gpuvm
bbf6d948c0b434a2936abb76cd7734fb954b4801]
[73602.841559]  __drm_gpuvm_sm_unmap+0x288/0x2c0 [drm_gpuvm
bbf6d948c0b434a2936abb76cd7734fb954b4801]
[73602.858863]  drm_gpuvm_sm_unmap+0x78/0xb8 [drm_gpuvm
bbf6d948c0b434a2936abb76cd7734fb954b4801]
[73602.875693]  pvr_vm_bind_op_exec+0x6c/0x118 [powervr
3ad437ff1d69ca6bbe76c29aac5b59cf4d3e54e4]
[73602.892483]  pvr_vm_unmap+0x1f8/0x238 [powervr
3ad437ff1d69ca6bbe76c29aac5b59cf4d3e54e4]
[73602.908746]  pvr_ioctl_vm_unmap+0x80/0xb8 [powervr
3ad437ff1d69ca6bbe76c29aac5b59cf4d3e54e4]
[73602.925386]  drm_ioctl_kernel+0x140/0x1d0
[73602.937503]  drm_ioctl+0x3e8/0x7e0
[73602.948949]  __arm64_sys_ioctl+0xec/0x118
[73602.960993]  invoke_syscall+0x68/0x198
[73602.972749]  el0_svc_common.constprop.0+0x80/0x150
[73602.985561]  do_el0_svc+0x38/0x50
[73602.996856]  el0_svc+0x4c/0xc0
[73603.007821]  el0t_64_sync_handler+0x120/0x130
[73603.020096]  el0t_64_sync+0x1a8/0x1b0
[73603.031606] irq event stamp: 153208
[73603.042881] hardirqs last  enabled at (153207):
[<ffffffc081475b30>] _raw_spin_unlock_irqrestore+0x98/0xa8
[73603.060595] hardirqs last disabled at (153208):
[<ffffffc081461a00>] el1_dbg+0x28/0x90
[73603.076534] softirqs last  enabled at (153032):
[<ffffffc08001a714>] fpsimd_restore_current_state+0x4c/0xf8
[73603.094345] softirqs last disabled at (153030):
[<ffffffc08001a6e4>] fpsimd_restore_current_state+0x1c/0xf8
[73603.112041] ---[ end trace 0000000000000000 ]---
[73603.125721] ------------[ cut here ]------------
[73603.165947] WARNING: CPU: 0 PID: 2244 at
drivers/gpu/drm/drm_gpuvm.c:1514 drm_gpuvm_bo_put.part.0+0x1c0/0x4d0
[drm_gpuvm]
[73603.213280] Modules linked in: mtk_vcodec_dec mtk_vcodec_enc
v4l2_vp9 v4l2_h264 cdc_ether mtk_vcodec_dbgfs usbnet mtk_vcodec_common
mtk_jpeg uvcvideo mtk_scp powervr mtk_jpeg_enc_hw mtk_rpmsg mtk_mdp
rpmsg_core cros_ec_sensors mtk_jpeg_dec_hw mtk_scp_ipi
cros_ec_sensors_core videobuf2_vmalloc v4l2_mem2mem r8152 uvc
videobuf2_dma_contig videobuf2_v4l2 drm_gpuvm videobuf2_memops sha1_ce
videobuf2_common mii drm_exec cros_ec_sensorhub mtk_vpu joydev fuse
[73603.332160] CPU: 0 PID: 2244 Comm: vkmark Tainted: G        W
   6.9.0-rc7-next-20240506-11489-g2585d27380e4-dirty #217
b57080d80a375eadc1b59c661ce880f5be496816
[73603.386774] Hardware name: Google Elm (DT)
[73603.429641] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[73603.475694] pc : drm_gpuvm_bo_put.part.0+0x1c0/0x4d0 [drm_gpuvm]
[73603.520680] lr : drm_gpuvm_bo_put.part.0+0x49c/0x4d0 [drm_gpuvm]
[73603.565596] sp : ffffffc086aa7540
[73603.607495] x29: ffffffc086aa7540 x28: 0000008000000000 x27: ffffffc07ca59b98
[73603.653971] x26: ffffffc082f8ae24 x25: ffffff80c14c59c8 x24: ffffffc07ca59b60
[73603.700424] x23: ffffff80c14c59c8 x22: ffffffc082f8a000 x21: ffffff80d1c3a000
[73603.746907] x20: ffffff80ce478010 x19: ffffff80c14c5980 x18: 0000000000000000
[73603.793539] x17: 0000000000000000 x16: 0000000000000000 x15: 0000007fc6e28c90
[73603.840321] x14: 1ffffff810d54e60 x13: 0000000041b58ab3 x12: ffffffb019c8f02c
[73603.887322] x11: 1ffffff019c8f02b x10: ffffffb019c8f02b x9 : dfffffc000000000
[73603.934480] x8 : 0000004fe6370fd5 x7 : ffffff80ce478158 x6 : 0000000000000001
[73603.981343] x5 : ffffff80ce478158 x4 : ffffffb019c8f02c x3 : 0000000000000000
[73604.028173] x2 : 0000000000000000 x1 : ffffff80d1c3a1a0 x0 : 0000000000000000
[73604.074920] Call trace:
[73604.116427]  drm_gpuvm_bo_put.part.0+0x1c0/0x4d0 [drm_gpuvm
bbf6d948c0b434a2936abb76cd7734fb954b4801]
[73604.165828]  drm_gpuva_unlink+0xfc/0x140 [drm_gpuvm
bbf6d948c0b434a2936abb76cd7734fb954b4801]
[73604.214815]  pvr_vm_gpuva_unmap+0x88/0xb0 [powervr
3ad437ff1d69ca6bbe76c29aac5b59cf4d3e54e4]
[73604.263747]  op_unmap_cb.isra.0+0xbc/0x108 [drm_gpuvm
bbf6d948c0b434a2936abb76cd7734fb954b4801]
[73604.311722]  __drm_gpuvm_sm_unmap+0x288/0x2c0 [drm_gpuvm
bbf6d948c0b434a2936abb76cd7734fb954b4801]
[73604.358926]  drm_gpuvm_sm_unmap+0x78/0xb8 [drm_gpuvm
bbf6d948c0b434a2936abb76cd7734fb954b4801]
[73604.404827]  pvr_vm_bind_op_exec+0x6c/0x118 [powervr
3ad437ff1d69ca6bbe76c29aac5b59cf4d3e54e4]
[73604.450483]  pvr_vm_unmap+0x1f8/0x238 [powervr
3ad437ff1d69ca6bbe76c29aac5b59cf4d3e54e4]
[73604.495629]  pvr_ioctl_vm_unmap+0x80/0xb8 [powervr
3ad437ff1d69ca6bbe76c29aac5b59cf4d3e54e4]
[73604.541253]  drm_ioctl_kernel+0x140/0x1d0
[73604.581936]  drm_ioctl+0x3e8/0x7e0
[73604.621751]  __arm64_sys_ioctl+0xec/0x118
[73604.662115]  invoke_syscall+0x68/0x198
[73604.702215]  el0_svc_common.constprop.0+0x80/0x150
[73604.743445]  do_el0_svc+0x38/0x50
[73604.782981]  el0_svc+0x4c/0xc0
[73604.822048]  el0t_64_sync_handler+0x120/0x130
[73604.862456]  el0t_64_sync+0x1a8/0x1b0
[73604.901872] irq event stamp: 153240
[73604.940864] hardirqs last  enabled at (153239):
[<ffffffc081461818>] exit_to_kernel_mode+0x40/0x128
[73604.986615] hardirqs last disabled at (153240):
[<ffffffc081461a00>] el1_dbg+0x28/0x90
[73605.031143] softirqs last  enabled at (153232):
[<ffffffc0800f7308>] handle_softirqs+0x6d8/0x708
[73605.076567] softirqs last disabled at (153211):
[<ffffffc080010484>] __do_softirq+0x1c/0x28
[73605.121199] ---[ end trace 0000000000000000 ]---
