Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D53625F48A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 10:06:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED57E6E2DF;
	Mon,  7 Sep 2020 08:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8616E2DF
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 08:06:12 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id s13so13416512wmh.4
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 01:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=J1Mpi4UEGst1+jfTnSAZj1njlq1xD6nM4x6w31L/2X0=;
 b=FOBwhnKLM1GK4o55+YgVRJeoCXrR0a/twv0kdgj2Dq5MTJ9AQc7YprEvSbcjJjzWxb
 pEKPxBs8/0EgAthjuLFjWRjPxmVQPqZq1Q5LjmfvN/l9W+3pQEosyGzE/Ophf1h2LeEO
 x1YRnxSN+YZH9+bM2Gu5Cv0spcDU8nzdt0nz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J1Mpi4UEGst1+jfTnSAZj1njlq1xD6nM4x6w31L/2X0=;
 b=V4MZhtYNS8GudhTrTfI9++J9rT2Y9/vcMtg0GZyQIGyFXxikX30UU79RZEWjMNLb9J
 XGb6ALkNlx2IB/YT+gCPzBpYP36ZHI9zrrqfnBLE77qb5EfpMDBE+KXsSlRDcLOUOJSj
 3DSjynFoH3enZXbK5cHfAzIV1BqEN4aj+/qMRWHwGEjyeOKnMwbIuw86qrV7yN4xibXs
 4kJdURHWuPwZsuvpRMQKZOJu1n7jC5BVajxwtk/tFGC7Pkok9QGU/jb9m0+aFAlxOWuN
 v5UkwtKNmJbhSnAiCos7quTylmPCJNusGMngDmxK+9vBb8Bqxqi/tRK+iZg4/k5d0Rar
 5jDQ==
X-Gm-Message-State: AOAM532kYUl6ixNugKNkba6hMr/4XT9v7IvZgUbUzABGjo11luSvtNc1
 fvRRQsSedgLDz0gkkkcIvBhzYw==
X-Google-Smtp-Source: ABdhPJyP3+GM7ddbwBGCkBbL4EcryirV3FquaTBp2f8U3roTfj+eTB2QdzV7CLgAoppO8cZcTc4LoQ==
X-Received: by 2002:a1c:cc05:: with SMTP id h5mr18787566wmb.129.1599465971341; 
 Mon, 07 Sep 2020 01:06:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d2sm7437483wro.34.2020.09.07.01.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 01:06:10 -0700 (PDT)
Date: Mon, 7 Sep 2020 10:06:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 1/1] drm/amdgpu: Convert to using devm_drm_dev_alloc()
Message-ID: <20200907080608.GP2352366@phenom.ffwll.local>
References: <20200904012218.4971-1-luben.tuikov@amd.com>
 <20200904012218.4971-2-luben.tuikov@amd.com>
 <CADnq5_NRyOfP48C5w4Q87qx98-hTLQP7PsP8OhGMbXJBu_Gb4A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_NRyOfP48C5w4Q87qx98-hTLQP7PsP8OhGMbXJBu_Gb4A@mail.gmail.com>
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

On Sat, Sep 05, 2020 at 11:50:05AM -0400, Alex Deucher wrote:
> On Thu, Sep 3, 2020 at 9:22 PM Luben Tuikov <luben.tuikov@amd.com> wrote:
> >
> > Convert to using devm_drm_dev_alloc(),
> > as drm_dev_init() is going away.
> >
> > Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
> 
> I think we can drop the final drm_put in the error case?  I think the
> unwinding in current devm code should take care of it.

Same applies for the pci remove hook too.
-Daniel
> 
> Alex
> 
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 11 +++--------
> >  1 file changed, 3 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > index 146a85c8df1c..06d994187c24 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > @@ -1142,18 +1142,13 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
> >         if (ret)
> >                 return ret;
> >
> > -       adev = kzalloc(sizeof(*adev), GFP_KERNEL);
> > -       if (!adev)
> > -               return -ENOMEM;
> > +       adev = devm_drm_dev_alloc(&pdev->dev, &kms_driver, typeof(*adev), ddev);
> > +       if (IS_ERR(adev))
> > +               return PTR_ERR(adev);
> >
> >         adev->dev  = &pdev->dev;
> >         adev->pdev = pdev;
> >         ddev = adev_to_drm(adev);
> > -       ret = drm_dev_init(ddev, &kms_driver, &pdev->dev);
> > -       if (ret)
> > -               goto err_free;
> > -
> > -       drmm_add_final_kfree(ddev, adev);
> >
> >         if (!supports_atomic)
> >                 ddev->driver_features &= ~DRIVER_ATOMIC;
> > --
> > 2.28.0.394.ge197136389
> >
> > _______________________________________________
> > amd-gfx mailing list
> > amd-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/amd-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
