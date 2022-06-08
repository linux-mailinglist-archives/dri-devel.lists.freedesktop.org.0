Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8BD54322A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 16:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8AAA112267;
	Wed,  8 Jun 2022 14:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09535112178
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 14:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654697077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1BWR1iPg67/76Jhn7RzCgMANX3cJBPsC3uFhzpZxFQg=;
 b=Qvhq5TQuTZO6iiaBf0qN6Q2/KTRVG2xlExfP5HsO7hfMpdXsQozjbHiDDzIyt5AchaXglV
 X+3g/+RWifSDUtg7p8arQpz6eljxowJ3ueclIPggn9a1/sSQxcwY2E0J3zmaBD3VsmbhDD
 pjOceFzfCiBLqqHj0BRYEOHsVsPaGhk=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-Dy4WAvwjNe6KyOT_AXBJYQ-1; Wed, 08 Jun 2022 10:04:36 -0400
X-MC-Unique: Dy4WAvwjNe6KyOT_AXBJYQ-1
Received: by mail-il1-f200.google.com with SMTP id
 p12-20020a056e02144c00b002d196a4d73eso15740781ilo.18
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 07:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=1BWR1iPg67/76Jhn7RzCgMANX3cJBPsC3uFhzpZxFQg=;
 b=N1/9eaOx3cDtBq5m/fc07xR++fMw00Q2v5dsUlCRFXHKl3XvSn7OPPjjU6ZSOFFxEh
 zgsaWWMIMJhYUfcX4MZSpKJWrspgu9SiWA0DECrnbd/hkSeqrLmJ0NFZ4aiYPY8ze6DS
 zHTHVpqJLlzHKTAN/ZDzp8N+rIHWGPudOdmS3o+rEEP8oFwA4fla1V4cxygNqgEZVMIx
 N8VvrHWqU9tR+RlyyUamwIF4suBoBLBpQQ50K+Zu3V5MJwCIk6MKwk0lztVBy0m/qTGF
 NDDOoyMCpRm3yZzii16Ej89VEbe0kD63iq5DXKaJiFjzUJ7QOdf29NbewCjKvVDLV6rh
 0q4Q==
X-Gm-Message-State: AOAM533YLXwfnGuP08WBlfw38go8g+j5Uoib9tRo2+I0Re287EFXaHy8
 xzGMNWTSxN5nYCdZbyGaDSvmEa66Y6IKU4LF/62UeeL5hsU6aI4nzyeNPstaaMuD9DWU7JcmsXn
 XVPO0OkhX7q4mB4mAi6BGcJg+pMIX
X-Received: by 2002:a02:1105:0:b0:330:ec01:f04c with SMTP id
 5-20020a021105000000b00330ec01f04cmr18109732jaf.87.1654697074888; 
 Wed, 08 Jun 2022 07:04:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcbsemhYPtEW2RxxzY4T+70hTn6dNmp2D9+a0WEnP5LfYkb7EKVi/XVLp74c1u9qpmBliF3w==
X-Received: by 2002:a02:1105:0:b0:330:ec01:f04c with SMTP id
 5-20020a021105000000b00330ec01f04cmr18109717jaf.87.1654697074610; 
 Wed, 08 Jun 2022 07:04:34 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 m19-20020a02c893000000b00331b5a2c5d4sm3248455jao.164.2022.06.08.07.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 07:04:34 -0700 (PDT)
Date: Wed, 8 Jun 2022 08:04:32 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/2] vfio/pci: Remove console drivers
Message-ID: <20220608080432.45282f0b.alex.williamson@redhat.com>
In-Reply-To: <0c45183c-cdb8-4578-e346-bc4855be038f@suse.de>
References: <165453797543.3592816.6381793341352595461.stgit@omen>
 <165453800875.3592816.12944011921352366695.stgit@omen>
 <0c45183c-cdb8-4578-e346-bc4855be038f@suse.de>
Organization: Red Hat
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: kvm@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Laszlo Ersek <lersek@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Wed, 8 Jun 2022 13:11:21 +0200
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Hi Alex
> 
> Am 06.06.22 um 19:53 schrieb Alex Williamson:
> > Console drivers can create conflicts with PCI resources resulting in
> > userspace getting mmap failures to memory BARs.  This is especially evident
> > when trying to re-use the system primary console for userspace drivers.
> > Attempt to remove all nature of conflicting drivers as part of our VGA
> > initialization.  
> 
> First a dumb question about your use case.  You want to assign a PCI 
> graphics card to a virtual machine and need to remove the generic driver 
> from the framebuffer?

Exactly.
 
> > Reported-by: Laszlo Ersek <lersek@redhat.com>
> > Tested-by: Laszlo Ersek <lersek@redhat.com>
> > Suggested-by: Gerd Hoffmann <kraxel@redhat.com>
> > Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> > ---
> >   drivers/vfio/pci/vfio_pci_core.c |   17 +++++++++++++++++
> >   1 file changed, 17 insertions(+)
> > 
> > diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> > index a0d69ddaf90d..e0cbcbc2aee1 100644
> > --- a/drivers/vfio/pci/vfio_pci_core.c
> > +++ b/drivers/vfio/pci/vfio_pci_core.c
> > @@ -13,6 +13,7 @@
> >   #include <linux/device.h>
> >   #include <linux/eventfd.h>
> >   #include <linux/file.h>
> > +#include <linux/fb.h>
> >   #include <linux/interrupt.h>
> >   #include <linux/iommu.h>
> >   #include <linux/module.h>
> > @@ -29,6 +30,8 @@
> >   
> >   #include <linux/vfio_pci_core.h>
> >   
> > +#include <drm/drm_aperture.h>
> > +
> >   #define DRIVER_AUTHOR   "Alex Williamson <alex.williamson@redhat.com>"
> >   #define DRIVER_DESC "core driver for VFIO based PCI devices"
> >   
> > @@ -1793,6 +1796,20 @@ static int vfio_pci_vga_init(struct vfio_pci_core_device *vdev)
> >   	if (!vfio_pci_is_vga(pdev))
> >   		return 0;
> >   
> > +#if IS_REACHABLE(CONFIG_DRM)
> > +	drm_aperture_detach_platform_drivers(pdev);
> > +#endif
> > +
> > +#if IS_REACHABLE(CONFIG_FB)
> > +	ret = remove_conflicting_pci_framebuffers(pdev, vdev->vdev.ops->name);
> > +	if (ret)
> > +		return ret;
> > +#endif
> > +
> > +	ret = vga_remove_vgacon(pdev);
> > +	if (ret)
> > +		return ret;
> > +  
> 
> You shouldn't have to copy any of the implementation of the aperture 
> helpers.
> 
> If you call drm_aperture_remove_conflicting_pci_framebuffers() it should 
> work correctly. The only reason why it requires a DRM driver structure 
> as second argument is for the driver's name. [1] And that name is only 
> used for printing an info message. [2]

vfio-pci is not dependent on CONFIG_DRM, therefore we need to open code
this regardless.  The only difference if we were to use the existing
function would be something like:

#if IS_REACHABLE(CONFIG_DRM)
	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &dummy_drm_driver);
	if (ret)
		return ret;
#else
#if IS_REACHABLE(CONFIG_FB)
	ret = remove_conflicting_pci_framebuffers(pdev, vdev->vdev.ops->name);
	if (ret)
		return ret;
#endif
	ret = vga_remove_vgacon(pdev);
	if (ret)
		return ret;
#endif

It's also bad practice to create a dummy DRM driver struct with some
assumption which fields are used.  If the usage is later expanded, we'd
only discover it by users getting segfaults.  If DRM wanted to make
such an API guarantee, then we shouldn't have commit 97c9bfe3f660
("drm/aperture: Pass DRM driver structure instead of driver name").

> The plan forward would be to drop patch 1 entirely.
> 
> For patch 2, the most trivial workaround is to instanciate struct 
> drm_driver here and set the name field to 'vdev->vdev.ops->name'. In the 
> longer term, the aperture helpers will be moved out of DRM and into a 
> more prominent location. That workaround will be cleaned up then.

Trivial in execution, but as above, this is poor practice and should be
avoided.

> Alternatively, drm_aperture_remove_conflicting_pci_framebuffers() could 
> be changed to accept the name string as second argument, but that's 
> quite a bit of churn within the DRM code.

The series as presented was exactly meant to provide the most correct
solution with the least churn to the DRM code.  The above referenced
commit precludes us from calling the existing DRM function directly
without resorting to poor practices of assuming the usage of the DRM
driver struct.  Using the existing DRM function also does not prevent
us from open coding the remainder of the function to avoid a CONFIG_DRM
dependency.  Thanks,

Alex

