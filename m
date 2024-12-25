Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 959979FC5D7
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2024 16:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E23A10E00F;
	Wed, 25 Dec 2024 15:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Qwf4uo7v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7023210E00F
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 15:01:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8829B5C5DA5
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 15:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B3DAC4CECD
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 15:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735138889;
 bh=4bBE8LbFUYcZ10/kvs+K0KUMEg1oift8keSWrmc1IWM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Qwf4uo7v3vQwlFcBS5TpFevok2CrBVmP/NGdwq+P5lGGhBtQRz7RnpPF3PN+VBqwz
 X8qFMfqPUeaespfHTxJiwTiHxaxKe/j4soflcxZtUCXmEGz4bJpAu2uy4SrDZhLhyS
 u+72EBBqmmSejAKXs5F8G5CEJWqoWx50Wb2o5CJmge53rRfw2tuoBZdCnp81wAQ4mm
 NRtwJomQq9yA4jTkhBhoEO4v3iQYFb6LICeFbvv8nnhAB3sFAemAYTKdTbXlhWYUDr
 uEaRW87x5nSLad/xVB5NSq+GscuUEuJ44KJPT7VN8v5wgulge3TNsCGXSYqY/xvWAC
 7LRMBNhNdiVLA==
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2ee989553c1so6270362a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 07:01:29 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX4c4+vDLsZbxdtRGr1yUzHLwifIRyijzYfqszSQzfq0BGykan3i7R6/syCb/3PeJH3qRZvxrzdy9o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0unw5a+Ek2QGGwVq4WeDNzye/63rYtD95NR4URI7DHU0MY68/
 lB/ttMdZYuMpOkmugrOlswjX1jzQKQ1ROIdsX/KXgpOPInTu+Dk5URwjV8g1rHiiX6gdZtDtJu2
 uZoQZVV9bHAouXAFSjfmsEfYE/Q==
X-Google-Smtp-Source: AGHT+IF9xqr0MB+CeYvcLBK3vTLIYnlZnLybva/SWf50PuDmdoY6PLKbqt076UUPF0Wsld6o+8QicufgIRbtnqCK+ak=
X-Received: by 2002:a17:90a:e187:b0:2ee:8430:b847 with SMTP id
 98e67ed59e1d1-2f452dfcd26mr28539700a91.6.1735138889113; Wed, 25 Dec 2024
 07:01:29 -0800 (PST)
MIME-Version: 1.0
References: <20241223023227.1258112-1-guoqing.jiang@canonical.com>
In-Reply-To: <20241223023227.1258112-1-guoqing.jiang@canonical.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 25 Dec 2024 23:02:01 +0800
X-Gmail-Original-Message-ID: <CAAOTY__No2VrkivsH3=6jvPGkPTXZ22vbGGKAcB3MMcA-+QeEw@mail.gmail.com>
Message-ID: <CAAOTY__No2VrkivsH3=6jvPGkPTXZ22vbGGKAcB3MMcA-+QeEw@mail.gmail.com>
Subject: Re: [PATCH V2] drm/mediatek: Set private->all_drm_private[i]->drm to
 NULL if mtk_drm_bind returns err
To: Guoqing Jiang <guoqing.jiang@canonical.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 simona@ffwll.ch, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, nancy.lin@mediatek.com, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
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

Hi, Guoqing:

Guoqing Jiang <guoqing.jiang@canonical.com> =E6=96=BC 2024=E5=B9=B412=E6=9C=
=8823=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=8810:32=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> The pointer need to be set to NULL, otherwise KASAN complains about
> use-after-free. Because in mtk_drm_bind, all private's drm are set
> as follows.
>
> private->all_drm_private[i]->drm =3D drm;
>
> And drm will be released by drm_dev_put in case mtk_drm_kms_init returns
> failure. However, the shutdown path still accesses the previous allocated
> memory in drm_atomic_helper_shutdown.
>
> [   84.874820] watchdog: watchdog0: watchdog did not stop!
> [   86.512054] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   86.513162] BUG: KASAN: use-after-free in drm_atomic_helper_shutdown+0=
x33c/0x378
> [   86.514258] Read of size 8 at addr ffff0000d46fc068 by task shutdown/1
> [   86.515213]
> [   86.515455] CPU: 1 UID: 0 PID: 1 Comm: shutdown Not tainted 6.13.0-rc1=
-mtk+gfa1a78e5d24b-dirty #55
> [   86.516752] Hardware name: Unknown Unknown Product/Unknown Product, BI=
OS 2022.10 10/01/2022
> [   86.517960] Call trace:
> [   86.518333]  show_stack+0x20/0x38 (C)
> [   86.518891]  dump_stack_lvl+0x90/0xd0
> [   86.519443]  print_report+0xf8/0x5b0
> [   86.519985]  kasan_report+0xb4/0x100
> [   86.520526]  __asan_report_load8_noabort+0x20/0x30
> [   86.521240]  drm_atomic_helper_shutdown+0x33c/0x378
> [   86.521966]  mtk_drm_shutdown+0x54/0x80
> [   86.522546]  platform_shutdown+0x64/0x90
> [   86.523137]  device_shutdown+0x260/0x5b8
> [   86.523728]  kernel_restart+0x78/0xf0
> [   86.524282]  __do_sys_reboot+0x258/0x2f0
> [   86.524871]  __arm64_sys_reboot+0x90/0xd8
> [   86.525473]  invoke_syscall+0x74/0x268
> [   86.526041]  el0_svc_common.constprop.0+0xb0/0x240
> [   86.526751]  do_el0_svc+0x4c/0x70
> [   86.527251]  el0_svc+0x4c/0xc0
> [   86.527719]  el0t_64_sync_handler+0x144/0x168
> [   86.528367]  el0t_64_sync+0x198/0x1a0
> [   86.528920]
> [   86.529157] The buggy address belongs to the physical page:
> [   86.529972] page: refcount:0 mapcount:0 mapping:0000000000000000 index=
:0xffff0000d46fd4d0 pfn:0x1146fc
> [   86.531319] flags: 0xbfffc0000000000(node=3D0|zone=3D2|lastcpupid=3D0x=
ffff)
> [   86.532267] raw: 0bfffc0000000000 0000000000000000 dead000000000122 00=
00000000000000
> [   86.533390] raw: ffff0000d46fd4d0 0000000000000000 00000000ffffffff 00=
00000000000000
> [   86.534511] page dumped because: kasan: bad access detected
> [   86.535323]
> [   86.535559] Memory state around the buggy address:
> [   86.536265]  ffff0000d46fbf00: ff ff ff ff ff ff ff ff ff ff ff ff ff =
ff ff ff
> [   86.537314]  ffff0000d46fbf80: ff ff ff ff ff ff ff ff ff ff ff ff ff =
ff ff ff
> [   86.538363] >ffff0000d46fc000: ff ff ff ff ff ff ff ff ff ff ff ff ff =
ff ff ff
> [   86.544733]                                                           =
^
> [   86.551057]  ffff0000d46fc080: ff ff ff ff ff ff ff ff ff ff ff ff ff =
ff ff ff
> [   86.557510]  ffff0000d46fc100: ff ff ff ff ff ff ff ff ff ff ff ff ff =
ff ff ff
> [   86.563928] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   86.571093] Disabling lock debugging due to kernel taint
> [   86.577642] Unable to handle kernel paging request at virtual address =
e0e9c0920000000b
> [   86.581834] KASAN: maybe wild-memory-access in range [0x07520490000000=
58-0x075204900000005f]
> ...
>

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

> Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi =
mmsys support")
> Signed-off-by: Guoqing Jiang <guoqing.jiang@canonical.com>
> ---
> V2 changes:
> 1. add Fixes tag per CK's comment
>
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 9a8ef8558da9..0062374f75d5 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -673,6 +673,8 @@ static int mtk_drm_bind(struct device *dev)
>  err_free:
>         private->drm =3D NULL;
>         drm_dev_put(drm);
> +       for (i =3D 0; i < private->data->mmsys_dev_num; i++)
> +               private->all_drm_private[i]->drm =3D NULL;
>         return ret;
>  }
>
> --
> 2.35.3
>
