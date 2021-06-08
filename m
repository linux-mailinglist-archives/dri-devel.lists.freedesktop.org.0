Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 892A139F9A5
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 16:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B4936E190;
	Tue,  8 Jun 2021 14:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EAE36E190;
 Tue,  8 Jun 2021 14:54:17 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id z3so21770964oib.5;
 Tue, 08 Jun 2021 07:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YOoJEAvOVqbK4v61piMRQZKD7D+2Wxv5vNkMO12sWiQ=;
 b=lp04WpJQ5cFn5howqG+MuDdJmNjwz8GlRj1bvoRTW/1I82dmb2yowy8E3iTj5P2fK1
 mJCMvw2jkZq7wEuGTj2c9Gfryglr6XrC3y6ONNynB7tR+ixr4p8DGlTPJXNTcvINFB/b
 RsvE8qxy/Hgu5wsPSlEDQbHSgI5Emy8/3GoZf0dMzrGi/d9nrOu5jqpa4xzzxyQVUlsp
 l+dnGZF2k0aWDYhh3TZ3w7Lc8/TbQrHzIommbszYqPYXkgYtdjnMGBBO713Jijdy5C7R
 2qOV0ci+YShmXDfSL9uhhkf3g7eEll6wpaP7r4OsGr9Bq5c+PUHJV9YIZSVQHDgA5MLm
 HrYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YOoJEAvOVqbK4v61piMRQZKD7D+2Wxv5vNkMO12sWiQ=;
 b=FQBcuuhZTYpigtvffyrYUUnEru2nVahGTkbHcJ5pr7FTZgPBa60PMUTaszkHCZSI2e
 lfVpatmaafd68DnBp8AuXbUj88QVRUHU2aRjafl9zTS/Oh+cw7mZ/j8m2OqwRCZX6DXn
 neDdfpiClt40lZDykNp3pkm3EpuO1w7p7UnkIN1MXvKsILKUhIC586yt06JYhOuozgPS
 yRizqZGBG3IiX4edyJqfn00PoIwVx44k+1mzsFOhmeKQXvTSxeCcHvgT5mvh9fEvvYgd
 FJ/iQWi2uz31x8uGZidVTYdG6JQP9KICBDqwHamNugL1OJR7TAs4eI4MODVbAoFMO/e5
 XcXQ==
X-Gm-Message-State: AOAM530SGnhZEr0EHBg/Q0mYrfz867AI3sDcQ6lkZ+0pdeGJmSiBTcC0
 7MlJJMgP3wVdS0tT95IkJPxh1GOG8sx59lhZZH1wEetT
X-Google-Smtp-Source: ABdhPJzvWbYI44VZl2fltwTHhC1u82++xVlMbWzDht7tkDoco05BKY+OWKvuT9uVpyvyGieu9ZnU0SGmONh+j5r/uic=
X-Received: by 2002:a05:6808:249:: with SMTP id
 m9mr3105250oie.120.1623164056486; 
 Tue, 08 Jun 2021 07:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <1623068820-2479-1-git-send-email-yangtiezhu@loongson.cn>
 <0d1b517f-797f-e87d-4edd-8474b16993ed@amd.com>
 <CADnq5_PvZRu0h60dn-=4v0aXBOaNy=s0KjmeuSndDzU3C8qFog@mail.gmail.com>
 <31de1f2e-5030-3a01-782b-df659d0d2869@loongson.cn>
In-Reply-To: <31de1f2e-5030-3a01-782b-df659d0d2869@loongson.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 8 Jun 2021 10:54:05 -0400
Message-ID: <CADnq5_PMrv7imajh2SNJQL3nOBj8OKwV5Ud=1LQnKn0kN4SoNw@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: Always call radeon_suspend_kms() in
 radeon_pci_shutdown()
To: Tiezhu Yang <yangtiezhu@loongson.cn>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Jianmin Lv <lvjianmin@loongson.cn>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Xuefeng Li <lixuefeng@loongson.cn>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 7, 2021 at 10:26 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
> On 06/07/2021 09:42 PM, Alex Deucher wrote:
> > On Mon, Jun 7, 2021 at 8:30 AM Christian K=C3=B6nig <christian.koenig@a=
md.com> wrote:
> >> Am 07.06.21 um 14:27 schrieb Tiezhu Yang:
> >>> radeon_suspend_kms() puts the hw in the suspend state (all asics),
> >>> it should always call radeon_suspend_kms() in radeon_pci_shutdown(),
> >>> this is a normal cleanup process to avoid more operations on radeon,
> >>> just remove #ifdef CONFIG_PPC64 and the related comments.
> >> Well NAK.
> >>
> >> Alex knows more about the details but suspending should not be part of
> >> the pci shotdown process at all.
> >>
> >> We just add that here to enforce a GPU reset on PPC64 boards for some
> >> reason.
> > Everything in the comment still applies.
> >
> > Alex
>
> Hi Alex and Christian,
>
> Thanks for your quick reply. What do you think of the following changes?
> If it is OK, I will send v2. If no, please ignore it.
>
> Any comments will be much appreciated.

Looks fine.  Please send it out.

Alex

>
> Thanks,
> Tiezhu
>
>
> Subject: [PATCH] drm/radeon: Call radeon_suspend_kms() in
>   radeon_pci_shutdown() for Loongson64
>
> On the Loongson64 platform used with Radeon GPU, shutdown or reboot faile=
d
> when console=3Dtty is in the boot cmdline.
>
> radeon_suspend_kms() puts the hw in the suspend state, especially set fb
> state as FBINFO_STATE_SUSPENDED:
>
>      if (fbcon) {
>          console_lock();
>          radeon_fbdev_set_suspend(rdev, 1);
>          console_unlock();
>      }
>
> Then avoid to do any more fb operations in the related functions:
>
>      if (p->state !=3D FBINFO_STATE_RUNNING)
>          return;
>
> So call radeon_suspend_kms() in radeon_pci_shutdown() for Loongson64 to f=
ix
> this issue, it looks like some kind of workaround like powerpc.
>
> Co-developed-by: Jianmin Lv <lvjianmin@loongson.cn>
> Signed-off-by: Jianmin Lv <lvjianmin@loongson.cn>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>   drivers/gpu/drm/radeon/radeon_drv.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c
> b/drivers/gpu/drm/radeon/radeon_drv.c
> index efeb115..daabbf5 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.c
> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> @@ -386,13 +386,13 @@ radeon_pci_shutdown(struct pci_dev *pdev)
>       if (radeon_device_is_virtual())
>           radeon_pci_remove(pdev);
>
> -#ifdef CONFIG_PPC64
> +#if defined(CONFIG_PPC64) || defined(CONFIG_MACH_LOONGSON64)
>       /*
>        * Some adapters need to be suspended before a
>        * shutdown occurs in order to prevent an error
> -     * during kexec.
> -     * Make this power specific becauase it breaks
> -     * some non-power boards.
> +     * during kexec, shutdown or reboot.
> +     * Make this power and Loongson specific becauase
> +     * it breaks some other boards.
>        */
>       radeon_suspend_kms(pci_get_drvdata(pdev), true, true, false);
>   #endif
> --
> 2.1.0
>
