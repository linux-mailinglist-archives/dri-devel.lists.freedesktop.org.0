Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B368055B9
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 14:20:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E6310E520;
	Tue,  5 Dec 2023 13:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7ED10E520
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 13:20:08 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-5d3758fdd2eso54086867b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 05:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701782407; x=1702387207; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FisYxDa6iVbed3/U4DiESiIhhRteOZr0hHzROfMa1GQ=;
 b=FPrVXBD6pWZGYhPHRuiz10Hh2hXpxN3pFuposT3cEtxCQhNm3hMfemHJD74rne/tf+
 BSNS1WAWOFlBw0CGoYqoE5P0cWHrTWQqxRkx4EK1ch7riA0steo6v1vrVkaTSDeXxR2L
 sHfawNpvR8ji8MvxUtiACwUuwxKkogNXNzVCua+nn3nx4xDCnAQkD85P8efsC5lAYxEa
 11YE9P/tIcliLZax8kdhDa6ZTw2cwrElvWiNo1PRJ9ffcVQWLFLSq2iegabWJGhf/XLt
 bP7lqMcrIGMM6O7jzjxrHdgX9uAuUGtR7hM5drY9pANcN21pik1uDGdLhH90pAhcHmMo
 vCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701782407; x=1702387207;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FisYxDa6iVbed3/U4DiESiIhhRteOZr0hHzROfMa1GQ=;
 b=opvyQ16H75fn6CdqOCy2GC6606spypLAVLEceiBoudoMXuoAZjpbsGjskGSk+hTL4+
 QJDR+Sc5bXcq8Hp3DH55V2Xa3ClNgb2G0cqFHzm+N67X24Bv5uJrVtOe+rj86Sup5p/Y
 Men+L6W+H2obsRUCKkiHAboqCW9cMS7VtH4Jwe7xk6F7xlPYqPEeHFQZqxGTFPUbBH76
 geNn02ytZmjBqvtUyQRwDTWyq7yfJe/nZOLTbxbzmyp6mJF9f9LaV45TrGRIbgstGWTW
 KetWe19vqYdAPNJfKAXxqc+OVQ/iv5czjZUfWhffnid/XAYxTcR0fXjD2DGK5lKavRLq
 3Ngw==
X-Gm-Message-State: AOJu0YyniBFrYBL7uFhclo1ulbyeF7jLqTtnjIUdvsSwQ2k2wCAuMMwd
 5SQPSadfeZLf2rbd10VgvmihBMlLRB80BS3p3vYrFw==
X-Google-Smtp-Source: AGHT+IG6XUHsPD9ZiSDBI8UAZQbYN2B4l0jNcx7ezUGR9F0vkCQ5Oq/48R1cbboJIGT3keij9lruomLFQNOD1omAe7w=
X-Received: by 2002:a81:ad0b:0:b0:5d7:1941:3556 with SMTP id
 l11-20020a81ad0b000000b005d719413556mr3794472ywh.61.1701782407651; Tue, 05
 Dec 2023 05:20:07 -0800 (PST)
MIME-Version: 1.0
References: <CGME20231205130643eucas1p283a5476b78a87997fa393d00f5172418@eucas1p2.samsung.com>
 <20231205130631.3456986-1-m.szyprowski@samsung.com>
In-Reply-To: <20231205130631.3456986-1-m.szyprowski@samsung.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 5 Dec 2023 15:19:56 +0200
Message-ID: <CAA8EJpr3hNdB02avXrY+PQGGSjJTm4YT3Hct1OwsLuNQN_H9Xw@mail.gmail.com>
Subject: Re: [PATCH] drm/debugfs: fix potential NULL pointer dereference
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 5 Dec 2023 at 15:06, Marek Szyprowski <m.szyprowski@samsung.com> wr=
ote:
>
> encoder->funcs entry might be NULL, so check it first before calling its
> methods. This fixes NULL pointer dereference observed on Rasberry Pi
> 3b/4b boards.
>
> Fixes: caf525ed45b4 ("drm/encoder: register per-encoder debugfs dir")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> This fixes the following issue observed on Raspberry Pi 4b:
>
> vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
> vc4-drm gpu: bound fef00700.hdmi (ops vc4_hdmi_ops [vc4])
> vc4-drm gpu: bound fef05700.hdmi (ops vc4_hdmi_ops [vc4])
> vc4-drm gpu: bound fe004000.txp (ops vc4_txp_ops [vc4])
> vc4-drm gpu: bound fe206000.pixelvalve (ops vc4_crtc_ops [vc4])
> vc4-drm gpu: bound fe207000.pixelvalve (ops vc4_crtc_ops [vc4])
> vc4-drm gpu: bound fe20a000.pixelvalve (ops vc4_crtc_ops [vc4])
> vc4-drm gpu: bound fe216000.pixelvalve (ops vc4_crtc_ops [vc4])
> 8<--- cut here ---
> Unable to handle kernel NULL pointer dereference at virtual address 00000=
010 when read
> [00000010] *pgd=3D00000000
> Internal error: Oops: 5 [#1] SMP ARM
> Modules linked in: sha256_arm raspberrypi_hwmon cfg80211(+) hci_uart btbc=
m bluetooth vc4(+) ecdh_generic ecc libaes snd_soc_hdmi_codec snd_soc_core =
v3d drm_shmem_helper ac97_bus snd_pcm_dmaengine snd_pcm genet(+) gpu_sched =
snd_timer snd bcm2711_thermal soundcore drm_dma_helper
> CPU: 1 PID: 221 Comm: systemd-udevd Not tainted 6.7.0-rc4-next-20231205 #=
14267
> Hardware name: BCM2711
> PC is at drm_debugfs_encoder_add+0x6c/0x98
> LR is at 0x0
> ...
>  drm_debugfs_encoder_add from drm_encoder_register_all+0x20/0x60
>  drm_encoder_register_all from drm_modeset_register_all+0x34/0x70
>  drm_modeset_register_all from drm_dev_register+0x24c/0x28c
>  drm_dev_register from vc4_drm_bind+0x21c/0x2d0 [vc4]
>  vc4_drm_bind [vc4] from try_to_bring_up_aggregate_device+0x160/0x1bc
>  try_to_bring_up_aggregate_device from component_master_add_with_match+0x=
c4/0xf8
>  component_master_add_with_match from vc4_platform_drm_probe+0xa0/0xc0 [v=
c4]
>  vc4_platform_drm_probe [vc4] from platform_probe+0x5c/0xb8
>  platform_probe from really_probe+0xc8/0x2dc
>  really_probe from __driver_probe_device+0x88/0x19c
>  __driver_probe_device from driver_probe_device+0x30/0x104
>  driver_probe_device from __driver_attach+0x90/0x174
>  __driver_attach from bus_for_each_dev+0x6c/0xb4
>  bus_for_each_dev from bus_add_driver+0xcc/0x1cc
>  bus_add_driver from driver_register+0x7c/0x118
>  driver_register from vc4_drm_register+0x44/0x1000 [vc4]
>  vc4_drm_register [vc4] from do_one_initcall+0x40/0x1e0
>  do_one_initcall from do_init_module+0x50/0x1e4
>  do_init_module from init_module_from_file+0x90/0xbc
>  init_module_from_file from sys_finit_module+0x144/0x258
>  sys_finit_module from ret_fast_syscall+0x0/0x54
> Exception stack(0xf0cf1fa8 to 0xf0cf1ff0)
> ...
> ---[ end trace 0000000000000000 ]---
>
> ---
>  drivers/gpu/drm/drm_debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


--=20
With best wishes
Dmitry
