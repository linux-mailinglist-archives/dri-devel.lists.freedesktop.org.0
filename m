Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DA93B92DF
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 16:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D67A6EB1D;
	Thu,  1 Jul 2021 14:07:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C1F6EB1D;
 Thu,  1 Jul 2021 14:07:17 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id o6so7379470oic.9;
 Thu, 01 Jul 2021 07:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/LvpeMiTx+++tobKvgMd8tiu03gqF3LE74eGjSIVJmM=;
 b=cG4bqq9KDzrE+dj3GFUS1LQbZj0AdrOX1WfFneE90DHNbcdGVC6/hFFLG9qlWGzW40
 yukj07M/SLCeVwyBsRFJUIXUKd5+sC9SZjs7VIn+EUN+wOjVazmWEZxtGIgUlp+2Krqo
 dHXbmmE/Lbl3wfIzbqtFdRgC+IfWQ6GHL9y+q/0AL0yJXlwJJi1R//K6M0EZQP9rELmI
 peHS+l+ZsMSP92FpCw/NM5wq7kVBQYi8ooxbVWkIUKx7mzZzNGMMmW4rFXWQw7Y2tR7J
 NBC9z6/0O0Vvy5rarcNfWPW0CUn/rD308wAwfkM3tPJP74zlRYGpfi9FbJjvLtMmmczr
 Iziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/LvpeMiTx+++tobKvgMd8tiu03gqF3LE74eGjSIVJmM=;
 b=mrMq2xRE/+n/1ANVX04FD2n45hq7yyM1GubmGyydqQf2ynSoc16xvPph78C3Ii4fI3
 hA2qGR414RjtKQYLI8C+1cVSR/rUzF5eHwqO4qtfw676snSpC1LtqbwfjEaq6tdAeoKL
 TuUdt5VqdxIZyKh6sauQFv5pm6tcVfv6HNsmD3CEyVSsAAc2CNSjxYc0pV17BgixkkQ6
 SK4DQToLXGZM0sF7UBkJGGIMLGLtH6T4wFE/fFag/DbEWF95TrvLEgbk3YXbX0Tc35de
 bvPmh4dsjIDBCufxtxG41d3YqOQs36ZN1Irwo7tL4kXz8ONqZODE57C917Fgkz7vMHkw
 cqNQ==
X-Gm-Message-State: AOAM530RKfd78SASCq+lhx5BO+JuoIx4YHqp/x2rJzQVtIo8LlCV5gpx
 pHfKZ10Tl0yPDYIPG9rCq6zGShVkl9c/6W3n808=
X-Google-Smtp-Source: ABdhPJy/Bb2nAAYxH99GQ22ZYraHDbrq4Lv/WhfkE3YsXG7MGaxPKGpRgwHVefcnoe12zrB+8vhQEZsXjPcz7bZ5a/Q=
X-Received: by 2002:aca:3446:: with SMTP id b67mr19352551oia.120.1625148436388; 
 Thu, 01 Jul 2021 07:07:16 -0700 (PDT)
MIME-Version: 1.0
References: <nycvar.YFH.7.76.2106241319430.18969@cbobk.fhfr.pm>
 <nycvar.YFH.7.76.2107011030030.18969@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2107011030030.18969@cbobk.fhfr.pm>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 1 Jul 2021 10:07:05 -0400
Message-ID: <CADnq5_N_v5YGxSE6szz5dAajbO0VV032Xp2YTrO6c-qr7ft62g@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix resource leak on probe error path
To: Jiri Kosina <jikos@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, Vojtech Pavlik <vojtech@ucw.cz>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Jul 1, 2021 at 4:32 AM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Thu, 24 Jun 2021, Jiri Kosina wrote:
>
> > From: Jiri Kosina <jkosina@suse.cz>
> >
> > This reverts commit 4192f7b5768912ceda82be2f83c87ea7181f9980.
> >
> > It is not true (as stated in the reverted commit changelog) that we never
> > unmap the BAR on failure; it actually does happen properly on
> > amdgpu_driver_load_kms() -> amdgpu_driver_unload_kms() ->
> > amdgpu_device_fini() error path.
> >
> > What's worse, this commit actually completely breaks resource freeing on
> > probe failure (like e.g. failure to load microcode), as
> > amdgpu_driver_unload_kms() notices adev->rmmio being NULL and bails too
> > early, leaving all the resources that'd normally be freed in
> > amdgpu_acpi_fini() and amdgpu_device_fini() still hanging around, leading
> > to all sorts of oopses when someone tries to, for example, access the
> > sysfs and procfs resources which are still around while the driver is
> > gone.
> >
> > Fixes: 4192f7b57689 ("drm/amdgpu: unmap register bar on device init failure")
> > Reported-by: Vojtech Pavlik <vojtech@ucw.cz>
> > Signed-off-by: Jiri Kosina <jkosina@suse.cz>
>
> Friendly ping on this one (as it's easily triggerable in the wild by just
> missing proper firwmare).
>
> Thanks.
>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > index 57ec108b5972..0f1c0e17a587 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -3414,13 +3414,13 @@ int amdgpu_device_init(struct amdgpu_device *adev,
> >       r = amdgpu_device_get_job_timeout_settings(adev);
> >       if (r) {
> >               dev_err(adev->dev, "invalid lockup_timeout parameter syntax\n");
> > -             goto failed_unmap;
> > +             return r;
> >       }
> >
> >       /* early init functions */
> >       r = amdgpu_device_ip_early_init(adev);
> >       if (r)
> > -             goto failed_unmap;
> > +             return r;
> >
> >       /* doorbell bar mapping and doorbell index init*/
> >       amdgpu_device_doorbell_init(adev);
> > @@ -3646,10 +3646,6 @@ int amdgpu_device_init(struct amdgpu_device *adev,
> >  failed:
> >       amdgpu_vf_error_trans_all(adev);
> >
> > -failed_unmap:
> > -     iounmap(adev->rmmio);
> > -     adev->rmmio = NULL;
> > -
> >       return r;
> >  }
> >
> > --
> > 2.12.3
> >
> >
>
> --
> Jiri Kosina
> SUSE Labs
>
