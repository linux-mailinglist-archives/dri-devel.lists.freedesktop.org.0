Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 637D025F491
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 10:07:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D466E328;
	Mon,  7 Sep 2020 08:07:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0476B6E2F9
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 08:07:30 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z1so14797191wrt.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 01:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=a34LqIGh8Ore9lQ5nuwZ0RKCoARr8JhMKOxwLqhOSbg=;
 b=Zzb4dzjmSqGszJ/LTvtdJR7BNlJaQI4LCxCIRH5uIwMPptzHmbFKaaOMhq51k1rbb4
 yoYfY17SP6lESmJgNU0XgPbUXpFzgwKy0urM9aaejVwX5gwP4H2aaXADWsgLqXxGDAIL
 m2e+ybxNJlVoQ1/Ln1481m6bnputLTBHg96hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=a34LqIGh8Ore9lQ5nuwZ0RKCoARr8JhMKOxwLqhOSbg=;
 b=GSUlTPQNBiFcC95YvPunXyKcoCbuT9J9J2aTS25eiQrvORi7sOYemJjBd5DWsjNrz+
 BwkTDQBNwxOZHA9DA+lpaE4kA8k7TbqaGd0UNF9MUF8NcXCvKpdd5towfc6vCTXyKwQq
 rkh45LpaiMYMYO6hrJef99F6BAnRVnM1sQNn2mxDVMtKACPoF1Fif2xKHeiJTKdB+F/Q
 lsOVjt+phASwIDDftKyz7256dXo1OyLYf4ehJzYcw6jZXFiJKk2SKLVMFexPMD19ZKCi
 fWGJlkJLmrvG1MXKE2lU5W7lBcUhv8DaYqM8OCwy9jzuqpoyANtHqHkpS/SV+Z2f0oHP
 z6og==
X-Gm-Message-State: AOAM532Et9H4cryuS5GOXf6SRRsNmpBqXdOepiZjlzbPL4zlAYgDRLRB
 5L6LzigadxIoO2XCxqB0cn2rtg==
X-Google-Smtp-Source: ABdhPJzRMa2LOsZoYLEl10YLrV2gnxP6PrzTF8Ou08ECjZFhZu7sk9ZzY1mOEMNlOLH/oATO7A9zYw==
X-Received: by 2002:adf:81a3:: with SMTP id 32mr20553073wra.368.1599466048658; 
 Mon, 07 Sep 2020 01:07:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y5sm17213230wrh.6.2020.09.07.01.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 01:07:28 -0700 (PDT)
Date: Mon, 7 Sep 2020 10:07:26 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 1/1] drm/amdgpu: Convert to using devm_drm_dev_alloc()
Message-ID: <20200907080726.GQ2352366@phenom.ffwll.local>
References: <20200904012218.4971-1-luben.tuikov@amd.com>
 <20200904012218.4971-2-luben.tuikov@amd.com>
 <CADnq5_NRyOfP48C5w4Q87qx98-hTLQP7PsP8OhGMbXJBu_Gb4A@mail.gmail.com>
 <20200907080608.GP2352366@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907080608.GP2352366@phenom.ffwll.local>
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
Cc: Alexander Deucher <Alexander.Deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 07, 2020 at 10:06:08AM +0200, Daniel Vetter wrote:
> On Sat, Sep 05, 2020 at 11:50:05AM -0400, Alex Deucher wrote:
> > On Thu, Sep 3, 2020 at 9:22 PM Luben Tuikov <luben.tuikov@amd.com> wrote:
> > >
> > > Convert to using devm_drm_dev_alloc(),
> > > as drm_dev_init() is going away.
> > >
> > > Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
> > 
> > I think we can drop the final drm_put in the error case?  I think the
> > unwinding in current devm code should take care of it.
> 
> Same applies for the pci remove hook too.

KASAN run with unload should have caught this. I strongly recommend doing
that for any changes to the unload code, it's way to easy to mix up
something and release it in the wrong order or from the wrong callback or
with the wrong managed (devm_ vs drmm_) functions.
-Daniel

> -Daniel
> > 
> > Alex
> > 
> > > ---
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 11 +++--------
> > >  1 file changed, 3 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > index 146a85c8df1c..06d994187c24 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > @@ -1142,18 +1142,13 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
> > >         if (ret)
> > >                 return ret;
> > >
> > > -       adev = kzalloc(sizeof(*adev), GFP_KERNEL);
> > > -       if (!adev)
> > > -               return -ENOMEM;
> > > +       adev = devm_drm_dev_alloc(&pdev->dev, &kms_driver, typeof(*adev), ddev);
> > > +       if (IS_ERR(adev))
> > > +               return PTR_ERR(adev);
> > >
> > >         adev->dev  = &pdev->dev;
> > >         adev->pdev = pdev;
> > >         ddev = adev_to_drm(adev);
> > > -       ret = drm_dev_init(ddev, &kms_driver, &pdev->dev);
> > > -       if (ret)
> > > -               goto err_free;
> > > -
> > > -       drmm_add_final_kfree(ddev, adev);
> > >
> > >         if (!supports_atomic)
> > >                 ddev->driver_features &= ~DRIVER_ATOMIC;
> > > --
> > > 2.28.0.394.ge197136389
> > >
> > > _______________________________________________
> > > amd-gfx mailing list
> > > amd-gfx@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/amd-gfx
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
