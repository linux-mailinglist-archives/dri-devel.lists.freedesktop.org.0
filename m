Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC984660362
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 16:37:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E0F10E877;
	Fri,  6 Jan 2023 15:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA14410E2B9;
 Fri,  6 Jan 2023 15:37:05 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id s187so1312620oie.10;
 Fri, 06 Jan 2023 07:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=u/Lsgx2uhO7z4CHG2k1K2w4zI9yimLeqiU/9EtWNEoo=;
 b=lY6ch6bC/40KLG9mnt+CylGg8Eoz9M5px1aalq63jDvpC6EugfvNgleQwQIWDV22fO
 7skJgcKXhpWIjZMfgwCfMCnwM8lDCZUtamk1nRB6+vspSTyOPYmU0mRneFVxKaJg37Nc
 qVA6vjlJFP9OgFzesD009lwZmUU8adxVpGDgg+5YPByL2IHNTM0aTUGDa54KI20wmI+l
 AOl/LAtA4a9mtclhW2WQgxw9v67hIt4ECtn0IuE14sN0cf8aav93RGRrSLTx/W9S8nQz
 rNTeC8wtsrABwumlZUG6edCyHuJUdFAjrrnzwPfAiR1KmajXFbETGLZVG3J+qs3URWwz
 yqiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u/Lsgx2uhO7z4CHG2k1K2w4zI9yimLeqiU/9EtWNEoo=;
 b=johPMG7ZleCdhOEjyBGNGY+J7/vyh/T8Fg/7rkLdXbho0bE6Gw3hkfMeYiCeED31Qp
 QIaXtl+QGqyzvH/gICQzGtRGyxQMGwivkzd4uhHGlsHtDhnmFKvFbvvx2TGEsoLUdQ7i
 nB+lLDaGui4GRQvPWrLnxnd0w7uojfMq2rdg+c1WsW+km8Ctv8Y6vQeJd79XXcr07/0R
 bkbGnddrRh/PrXak67GOBBF2ksXfiTZ2iGOttG1xjZvc7tmvOJunbj0A1uHGp8hFM+k/
 fjoaGYTvq0oK6U7wTeoIj8EHTbj7ha3AdZBZ79Gldtat75lpYhepVHB0byRF8UB7RaM/
 dcbQ==
X-Gm-Message-State: AFqh2koVbA7fmZ4Z2WtlCS5QQM/L2/qCJDWCVmgjDJvcwOJhnko2Jvy9
 BTmywiM3nXF4FSAl5uGakDfzpO+CpDl1/g2BOe8=
X-Google-Smtp-Source: AMrXdXtmjcKgHjr8tNu+gLgPcd6cIQNYsyzt9AUdpP3VHWJ+8Nge3tJ8QQ84K748sLuDZ8RST6ayQ7S8v6s5tiVNoSM=
X-Received: by 2002:a05:6808:2001:b0:35b:d93f:cbc4 with SMTP id
 q1-20020a056808200100b0035bd93fcbc4mr3590248oiw.96.1673019425141; Fri, 06 Jan
 2023 07:37:05 -0800 (PST)
MIME-Version: 1.0
References: <20230106094729.38598-1-liwei.song@windriver.com>
In-Reply-To: <20230106094729.38598-1-liwei.song@windriver.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 6 Jan 2023 10:36:53 -0500
Message-ID: <CADnq5_Mu-9_HoH9PULANvWS39D0Sra+nxodwFspH-TXX_3GJKA@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: free iio for atombios when driver shutdown
To: Liwei Song <liwei.song@windriver.com>
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
Cc: PanXinhui <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 AlexDeucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?ChristianK=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Jan 6, 2023 at 5:00 AM Liwei Song <liwei.song@windriver.com> wrote:
>
> Fix below kmemleak when unload radeon driver:
>
> unreferenced object 0xffff9f8608ede200 (size 512):
>   comm "systemd-udevd", pid 326, jiffies 4294682822 (age 716.338s)
>   hex dump (first 32 bytes):
>     00 00 00 00 c4 aa ec aa 14 ab 00 00 00 00 00 00  ................
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace:
>     [<0000000062fadebe>] kmem_cache_alloc_trace+0x2f1/0x500
>     [<00000000b6883cea>] atom_parse+0x117/0x230 [radeon]
>     [<00000000158c23fd>] radeon_atombios_init+0xab/0x170 [radeon]
>     [<00000000683f672e>] si_init+0x57/0x750 [radeon]
>     [<00000000566cc31f>] radeon_device_init+0x559/0x9c0 [radeon]
>     [<0000000046efabb3>] radeon_driver_load_kms+0xc1/0x1a0 [radeon]
>     [<00000000b5155064>] drm_dev_register+0xdd/0x1d0
>     [<0000000045fec835>] radeon_pci_probe+0xbd/0x100 [radeon]
>     [<00000000e69ecca3>] pci_device_probe+0xe1/0x160
>     [<0000000019484b76>] really_probe.part.0+0xc1/0x2c0
>     [<000000003f2649da>] __driver_probe_device+0x96/0x130
>     [<00000000231c5bb1>] driver_probe_device+0x24/0xf0
>     [<0000000000a42377>] __driver_attach+0x77/0x190
>     [<00000000d7574da6>] bus_for_each_dev+0x7f/0xd0
>     [<00000000633166d2>] driver_attach+0x1e/0x30
>     [<00000000313b05b8>] bus_add_driver+0x12c/0x1e0
>
> iio was allocated in atom_index_iio() called by atom_parse(),
> but it doesn't got released when the dirver is shutdown.
> Fix this kmemleak by free it in radeon_atombios_fini().
>
> Signed-off-by: Liwei Song <liwei.song@windriver.com>
> ---
>  drivers/gpu/drm/radeon/radeon_device.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
> index 92905ebb7b45..1c005e0ddd38 100644
> --- a/drivers/gpu/drm/radeon/radeon_device.c
> +++ b/drivers/gpu/drm/radeon/radeon_device.c
> @@ -1022,6 +1022,7 @@ void radeon_atombios_fini(struct radeon_device *rdev)
>  {
>         if (rdev->mode_info.atom_context) {
>                 kfree(rdev->mode_info.atom_context->scratch);
> +               kfree(rdev->mode_info.atom_context->iio);
>         }
>         kfree(rdev->mode_info.atom_context);
>         rdev->mode_info.atom_context = NULL;
> --
> 2.33.1
>
