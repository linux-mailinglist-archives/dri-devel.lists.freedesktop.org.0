Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3202A6083
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 10:31:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994A56E970;
	Wed,  4 Nov 2020 09:31:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F16226E969
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 09:31:19 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id s9so21246548wro.8
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 01:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Fuyw4WaVFO2Q2N215fLvih/cHkL6tqCnCCEwpPFAFHE=;
 b=jZbJoqvzHP0K/4ZfVZzhpLsG5KODP4ijP8iTzQ5xZyBLRvC0Cf0hOtxwq05h1O6tS0
 4il123KcKOyDNw77ACnszwE4aLj0wmeSJhbe8mlT7//L+gW2drRdStCVFsnaYap4Zeei
 gHDlME22WPMypmqxG9OV7o7FsGUe5qR4N8CGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Fuyw4WaVFO2Q2N215fLvih/cHkL6tqCnCCEwpPFAFHE=;
 b=sY1n1OB0njunlXV2roIeKTR4/rFN3WO9SDBrHHNK6HCbr/3BT4dcAIFiFcw/ufD69k
 ypUId4+e0R7gupGQw8hxfxwNdatGwqJ1pMNDQTvd7z7Ip3j7Ltv18CKxCUEUm/3NiUus
 Io/mWVxVBLNU6tg/m+yH6ebzHdnVEaakzw9M+dIX5NTyYosmHwmyPX4w6hl/KfNeifq3
 UvS6BHz1xcskHyl+oAbjpL4kncWrp06krMlL2dCvl0+mL0/RCkn23Y2kfqrh+wbuUZ+P
 ezhR+zNIeXik+XhYybfX2ZEJOXX4o+JgVjLgiB3xBC5Y2hACSFYldNu5vPMMoZ8Cwa4S
 iEwg==
X-Gm-Message-State: AOAM531Rxp6PYHxygqN68qmQ3xJ+XJdLOMYoy+JRRtb9NtIcSDRL+kU6
 P3pge1KAoEwS0imP7V+NQjYj4A==
X-Google-Smtp-Source: ABdhPJwXREWH3IIASAFxO/5IcwRkQItdowdmN7Ai0p+gNwQrmEfbbohj/ubHTaIP95Gnyd4BpgLNGA==
X-Received: by 2002:adf:9150:: with SMTP id j74mr33220919wrj.57.1604482278356; 
 Wed, 04 Nov 2020 01:31:18 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l1sm1857301wrb.1.2020.11.04.01.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 01:31:17 -0800 (PST)
Date: Wed, 4 Nov 2020 10:31:14 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 3/5] drm/amdgpu: Paper over the drm_driver mangling for
 virt
Message-ID: <20201104093114.GJ401619@phenom.ffwll.local>
References: <20201030101104.2503-1-daniel.vetter@ffwll.ch>
 <20201030101104.2503-3-daniel.vetter@ffwll.ch>
 <CADnq5_OFVymqfub0mczoaKcEZa=uyaX_WtTYBUgn=K4_a3Fw5Q@mail.gmail.com>
 <CAKMK7uGka2iOZ67=6oJUFOvCf15FnkACTs=UtzokjE+_zmaguQ@mail.gmail.com>
 <CAKMK7uFwMkg6ZpQnE9HEH9vagzDJ5MCrSyGcsJOsC1JVLSO-ww@mail.gmail.com>
 <CADnq5_M+Qp7dz+1xrM0+U4KgUYN5Gh5zyoyAVBVSxsCgsvM7HA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_M+Qp7dz+1xrM0+U4KgUYN5Gh5zyoyAVBVSxsCgsvM7HA@mail.gmail.com>
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
Cc: Evan Quan <evan.quan@amd.com>, chen gong <curry.gong@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Wenhui Sheng <Wenhui.Sheng@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Monk Liu <Monk.Liu@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 "Stanley.Yang" <Stanley.Yang@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Bokun Zhang <Bokun.Zhang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Yintian Tao <yttao@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Dennis Li <Dennis.Li@amd.com>, shaoyunl <shaoyun.liu@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 03, 2020 at 11:49:40AM -0500, Alex Deucher wrote:
> On Sun, Nov 1, 2020 at 5:01 AM Daniel Vetter <daniel.vetter@ffwll.ch> wro=
te:
> >
> > On Sat, Oct 31, 2020 at 2:57 PM Daniel Vetter <daniel.vetter@ffwll.ch> =
wrote:
> > >
> > > On Fri, Oct 30, 2020 at 7:47 PM Alex Deucher <alexdeucher@gmail.com> =
wrote:
> > > >
> > > > On Fri, Oct 30, 2020 at 6:11 AM Daniel Vetter <daniel.vetter@ffwll.=
ch> wrote:
> > > > >
> > > > > Prep work to make drm_device->driver const.
> > > > >
> > > > > Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > > > Cc: "Christian K=F6nig" <christian.koenig@amd.com>
> > > > > Cc: Evan Quan <evan.quan@amd.com>
> > > > > Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> > > > > Cc: Hawking Zhang <Hawking.Zhang@amd.com>
> > > > > Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > > > > Cc: Luben Tuikov <luben.tuikov@amd.com>
> > > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > > Cc: Monk Liu <Monk.Liu@amd.com>
> > > > > Cc: Yintian Tao <yttao@amd.com>
> > > > > Cc: Dennis Li <Dennis.Li@amd.com>
> > > > > Cc: shaoyunl <shaoyun.liu@amd.com>
> > > > > Cc: Bokun Zhang <Bokun.Zhang@amd.com>
> > > > > Cc: "Stanley.Yang" <Stanley.Yang@amd.com>
> > > > > Cc: Wenhui Sheng <Wenhui.Sheng@amd.com>
> > > > > Cc: chen gong <curry.gong@amd.com>
> > > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  |  8 ++++----
> > > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c | 12 +++++++++++-
> > > > >  2 files changed, 15 insertions(+), 5 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gp=
u/drm/amd/amdgpu/amdgpu_drv.c
> > > > > index 024c3b70b1aa..3d337f13ae4e 100644
> > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > > > @@ -1093,7 +1093,7 @@ static const struct pci_device_id pciidlist=
[] =3D {
> > > > >
> > > > >  MODULE_DEVICE_TABLE(pci, pciidlist);
> > > > >
> > > > > -static struct drm_driver kms_driver;
> > > > > +struct drm_driver amdgpu_kms_driver;
> > > > >
> > > > >  static int amdgpu_pci_probe(struct pci_dev *pdev,
> > > > >                             const struct pci_device_id *ent)
> > > > > @@ -1164,7 +1164,7 @@ static int amdgpu_pci_probe(struct pci_dev =
*pdev,
> > > > >         if (ret)
> > > > >                 return ret;
> > > > >
> > > > > -       adev =3D devm_drm_dev_alloc(&pdev->dev, &kms_driver, type=
of(*adev), ddev);
> > > > > +       adev =3D devm_drm_dev_alloc(&pdev->dev, &amdgpu_kms_drive=
r, typeof(*adev), ddev);
> > > > >         if (IS_ERR(adev))
> > > > >                 return PTR_ERR(adev);
> > > > >
> > > > > @@ -1508,7 +1508,7 @@ int amdgpu_file_to_fpriv(struct file *filp,=
 struct amdgpu_fpriv **fpriv)
> > > > >         return 0;
> > > > >  }
> > > > >
> > > > > -static struct drm_driver kms_driver =3D {
> > > > > +struct drm_driver amdgpu_kms_driver =3D {
> > > > >         .driver_features =3D
> > > > >             DRIVER_ATOMIC |
> > > > >             DRIVER_GEM |
> > > > > @@ -1571,7 +1571,7 @@ static int __init amdgpu_init(void)
> > > > >                 goto error_fence;
> > > > >
> > > > >         DRM_INFO("amdgpu kernel modesetting enabled.\n");
> > > > > -       kms_driver.num_ioctls =3D amdgpu_max_kms_ioctl;
> > > > > +       amdgpu_kms_driver.num_ioctls =3D amdgpu_max_kms_ioctl;
> > > > >         amdgpu_register_atpx_handler();
> > > > >
> > > > >         /* Ignore KFD init failures. Normal when CONFIG_HSA_AMD i=
s not set. */
> > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_virt.c
> > > > > index d0aea5e39531..dde4c449c284 100644
> > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> > > > > @@ -45,13 +45,23 @@ bool amdgpu_virt_mmio_blocked(struct amdgpu_d=
evice *adev)
> > > > >         return RREG32_NO_KIQ(0xc040) =3D=3D 0xffffffff;
> > > > >  }
> > > > >
> > > > > +extern struct drm_driver amdgpu_kms_driver;
> > > > > +
> > > > >  void amdgpu_virt_init_setting(struct amdgpu_device *adev)
> > > > >  {
> > > > >         /* enable virtual display */
> > > > >         if (adev->mode_info.num_crtc =3D=3D 0)
> > > > >                 adev->mode_info.num_crtc =3D 1;
> > > > >         adev->enable_virtual_display =3D true;
> > > > > -       adev_to_drm(adev)->driver->driver_features &=3D ~DRIVER_A=
TOMIC;
> > > > > +
> > > > > +       /*
> > > > > +        * FIXME: Either make virt support atomic or make sure yo=
u have two
> > > > > +        * drm_driver structs, these kind of tricks are only ok w=
hen there's
> > > > > +        * guaranteed only a single device per system. This shoul=
d also be done
> > > > > +        * before struct drm_device is initialized.
> > > > > +        */
> > > > > +       amdgpu_kms_driver.driver_features &=3D ~DRIVER_ATOMIC;
> > > >
> > > > There is additional DRIVER_ATOMIC in amdgpu_pci_probe() for older
> > > > chips without atomic support.
> > >
> > > That would need to be fixed for making the amdgpu drm_driver
> > > structures constant, but that's not what I'm doing here. I'm only
> > > removing the usage of the drm_device->driver pointer, to allow that to
> > > become constant. Untangling the flow to make the amdgpu_kms_driver
> > > const looked a bit more involved than just a  simple patch.
> >
> > On second look, this changes the drm_device->driver_features flag,
> > which was added to avoid having to change the drm_driver one. So
> > that's actually all ok (and just the virt code here is broken). But
> > amdgpu also updates num_ioctl and other stuff, and that's a fairly
> > invasive patch.
> =

> We don't change the number of ioctls:
> const int amdgpu_max_kms_ioctl =3D ARRAY_SIZE(amdgpu_ioctls_kms);
> So I think the only thing here is the driver features flag for the
> virt display code, or am I missing something?

You set the num_ioctl at runtime, not compile time. That's enough to
prevent constification. Moving that around to make it compile time means a
_lot_ of code shuffling, much more than I felt was a good idea for me to
do :-)

And for the virt case you could use drm_device->driver_flags instead to
avoid this.

Note I don't really care for this series whether you're changing your
drm_driver at runtime or not, I just want to make it possible for drivers
to make it const, which means drm_device->driver must be a const pointer.
Whether you want to make the amdgpu drm_driver const or not is up to you.
-Daniel

> =

> Alex
> =

> =

> >
> > I'm also not sure whether this code here can just be switched over
> > from drm_driver->driver_features to drm_device->driver_features. So
> > given all this, ok as-is and you guys figure out how to patch this
> > properly, or want me to change something in this patch?
> >
> > Cheers, Daniel
> >
> > >
> > > > Alex
> > > >
> > > > > +
> > > > >         adev->cg_flags =3D 0;
> > > > >         adev->pg_flags =3D 0;
> > > > >  }
> > > > > --
> > > > > 2.28.0
> > > > >
> > > > > _______________________________________________
> > > > > dri-devel mailing list
> > > > > dri-devel@lists.freedesktop.org
> > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > >
> > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
