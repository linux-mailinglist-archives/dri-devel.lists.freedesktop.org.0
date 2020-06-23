Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C82C204EF1
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 12:22:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A186E990;
	Tue, 23 Jun 2020 10:22:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C276E991
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 10:22:07 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g75so2439416wme.5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 03:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=8MJZaey/8nrc4SU4YxN+QY48qHrK1/CFR5/NqTMnCYg=;
 b=OB5LbnFjkLYYY2KQ2G3kAOp4JdSQqqpWvY5hrGmd5zFrsIC+g70q/qtmG2jdV3Gk0X
 iq2FYvjHOCAQ9vzGiMFup9kla0scvl17kEOVch3OoKngXwviMu73SQN9wKmpczSRpUzS
 RSJMBCOwwpk9Pwff7Qt/lRFxDpqkRuoc4i9qc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=8MJZaey/8nrc4SU4YxN+QY48qHrK1/CFR5/NqTMnCYg=;
 b=POR6bnv/ZLtVaNTZGadAfPQM4wOduolVRxq4NjLHivBmX+UISnJ+yZQ51PHyrG1zqA
 AVff/B7tKpbnb23E8J4sMHiQ+9imwYfzvQSHfxhcH1OyGNu0WlWCiSgvsl5x22EePRcw
 eh7KYCzZHuzAYutIe1x8cpX3+JMrmmy+9Fss6KRznZoBKdTZanJwL6DOmqqqtkTCkjYp
 SmfP84ULRFhvUUm249+YdD2WOsc5h/HQ76zuCE9LgJcOtnTnNQfcai624yEdzHmn7W/1
 t0I/JkMyvpwb0xq7z3GLO4yZNAs/qiAs2k7VxfLIcKmJNwCmD7AEHtKigdedFqxVnX4U
 QuSg==
X-Gm-Message-State: AOAM533PQ1XiyUi3ozzpuCGZZa72B4wCo9fv78iBJsFyHT0rLPlXSqeY
 /6J3comkW7Hp2eP696rqgJEpnA==
X-Google-Smtp-Source: ABdhPJxk9v+aoyp+zhnKGMnfGcRixiH424XENful5ZKVIwbQMwNrm0VRh1rj0fZK/X2kXMwogKChkw==
X-Received: by 2002:a05:600c:2182:: with SMTP id
 e2mr7836518wme.186.1592907726202; 
 Tue, 23 Jun 2020 03:22:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e5sm22098413wrw.19.2020.06.23.03.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 03:22:05 -0700 (PDT)
Date: Tue, 23 Jun 2020 12:22:03 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH v2 6/8] drm/amdgpu: Unmap entire device address space on
 device remove.
Message-ID: <20200623102203.GK20149@phenom.ffwll.local>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-7-git-send-email-andrey.grodzovsky@amd.com>
 <ec7dc51a-231f-f9e7-6082-5aad02965c67@gmail.com>
 <CADnq5_Oz_858bq-PRc=DsL62=TiqFaONw4qARK8NVbUVzMfuCw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_Oz_858bq-PRc=DsL62=TiqFaONw4qARK8NVbUVzMfuCw@mail.gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 22, 2020 at 03:48:29PM -0400, Alex Deucher wrote:
> On Mon, Jun 22, 2020 at 3:38 PM Christian K=F6nig
> <ckoenig.leichtzumerken@gmail.com> wrote:
> >
> > Am 21.06.20 um 08:03 schrieb Andrey Grodzovsky:
> > > Use the new TTM interface to invalidate all exsisting BO CPU mappings
> > > form all user proccesses.
> > >
> > > Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> >
> > Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>
> >
> > I think those two patches could already land in amd-staging-drm-next
> > since they are a good idea independent of how else we fix the other iss=
ues.
> =

> Please make sure they land in drm-misc as well.

Not sure that's much use, since without any of the fault side changes you
just blow up on the first refault. Seems somewhat silly to charge ahead on
this with the other bits still very much under discussion.

Plus I suggested a possible bikeshed here :-)
-Daniel

> =

> Alex
> =

> >
> > > ---
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_drv.c
> > > index 43592dc..6932d75 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > @@ -1135,6 +1135,7 @@ amdgpu_pci_remove(struct pci_dev *pdev)
> > >       struct drm_device *dev =3D pci_get_drvdata(pdev);
> > >
> > >       drm_dev_unplug(dev);
> > > +     ttm_bo_unmap_virtual_address_space(&adev->mman.bdev);
> > >       amdgpu_driver_unload_kms(dev);
> > >
> > >       pci_disable_device(pdev);
> >

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
