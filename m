Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1C21BC5EE
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 19:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601DB6E83A;
	Tue, 28 Apr 2020 17:00:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699146E831;
 Tue, 28 Apr 2020 17:00:31 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 8FF2E2002F;
 Tue, 28 Apr 2020 19:00:27 +0200 (CEST)
Date: Tue, 28 Apr 2020 19:00:26 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 26/59] drm/qxl: Use devm_drm_dev_alloc
Message-ID: <20200428170026.GA27234@ravnborg.org>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-27-daniel.vetter@ffwll.ch>
 <20200424150911.GB20856@ravnborg.org>
 <20200428140011.GK3456981@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428140011.GK3456981@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=20KFwNOVAAAA:8 a=QyXUC8HyAAAA:8 a=Z4Rwk6OoAAAA:8
 a=e5mUnYsNAAAA:8 a=7gkXJVJtAAAA:8 a=25-AhOLfAAAA:8 a=SINs2PkATPjFCc2CyM4A:9
 a=CjuIK1q_8ugA:10 a=HkZW87K1Qel5hWWM3VKY:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=E9Po1WZjFZOl8hwRPBS3:22 a=dnuY3_Gu-P7Vi9ynLKQe:22
 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
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
Cc: Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, spice-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 28, 2020 at 04:00:11PM +0200, Daniel Vetter wrote:
> On Fri, Apr 24, 2020 at 05:09:11PM +0200, Sam Ravnborg wrote:
> > Hi Daniel
> > 
> > On Wed, Apr 15, 2020 at 09:40:01AM +0200, Daniel Vetter wrote:
> > > Also need to remove the drm_dev_put from the remove hook.
> > > 
> > > Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > Cc: Dave Airlie <airlied@redhat.com>
> > > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > > Cc: virtualization@lists.linux-foundation.org
> > > Cc: spice-devel@lists.freedesktop.org
> > > ---
> > >  drivers/gpu/drm/qxl/qxl_drv.c | 15 ++++++++-------
> > >  drivers/gpu/drm/qxl/qxl_drv.h |  3 +--
> > >  drivers/gpu/drm/qxl/qxl_kms.c | 12 +-----------
> > >  3 files changed, 10 insertions(+), 20 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
> > > index 09102e2efabc..6b4ae4c5fb76 100644
> > > --- a/drivers/gpu/drm/qxl/qxl_drv.c
> > > +++ b/drivers/gpu/drm/qxl/qxl_drv.c
> > > @@ -81,13 +81,16 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> > >  		return -EINVAL; /* TODO: ENODEV ? */
> > >  	}
> > >  
> > > -	qdev = kzalloc(sizeof(struct qxl_device), GFP_KERNEL);
> > > -	if (!qdev)
> > > +	qdev = devm_drm_dev_alloc(&pdev->dev, &qxl_driver,
> > > +				  struct qxl_device, ddev);
> > > +	if (IS_ERR(qdev)) {
> > > +		pr_err("Unable to init drm dev");
> > >  		return -ENOMEM;
> > > +	}
> > 
> > The other patches do not add any error message when devm_drm_dev_alloc()
> > fails and driver core will log that driver init failed.
> > 
> > So the pr_err() above should be dropped.
> > I know it comes from qxl_device_init() but that does not make it a good
> > idea.
> 
> Hm I know we're inconsistent here, but some drivers have error logging on
> all branches, some dont. I'm just trying to go with the prevailing style.
> 
> > With this fixed:
> 
> Insisting on this or ok as-is?
OK as-is.

	Sam

> -Daniel
> 
> > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > 
> > >  
> > >  	ret = pci_enable_device(pdev);
> > >  	if (ret)
> > > -		goto free_dev;
> > > +		return ret;
> > >  
> > >  	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "qxl");
> > >  	if (ret)
> > > @@ -101,7 +104,7 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> > >  		}
> > >  	}
> > >  
> > > -	ret = qxl_device_init(qdev, &qxl_driver, pdev);
> > > +	ret = qxl_device_init(qdev, pdev);
> > >  	if (ret)
> > >  		goto put_vga;
> > >  
> > > @@ -128,8 +131,7 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> > >  		vga_put(pdev, VGA_RSRC_LEGACY_IO);
> > >  disable_pci:
> > >  	pci_disable_device(pdev);
> > > -free_dev:
> > > -	kfree(qdev);
> > > +
> > >  	return ret;
> > >  }
> > >  
> > > @@ -155,7 +157,6 @@ qxl_pci_remove(struct pci_dev *pdev)
> > >  	drm_atomic_helper_shutdown(dev);
> > >  	if (is_vga(pdev))
> > >  		vga_put(pdev, VGA_RSRC_LEGACY_IO);
> > > -	drm_dev_put(dev);
> > >  }
> > >  
> > >  DEFINE_DRM_GEM_FOPS(qxl_fops);
> > > diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
> > > index 435126facc9b..86ac191d9205 100644
> > > --- a/drivers/gpu/drm/qxl/qxl_drv.h
> > > +++ b/drivers/gpu/drm/qxl/qxl_drv.h
> > > @@ -276,8 +276,7 @@ struct qxl_device {
> > >  extern const struct drm_ioctl_desc qxl_ioctls[];
> > >  extern int qxl_max_ioctl;
> > >  
> > > -int qxl_device_init(struct qxl_device *qdev, struct drm_driver *drv,
> > > -		    struct pci_dev *pdev);
> > > +int qxl_device_init(struct qxl_device *qdev, struct pci_dev *pdev);
> > >  void qxl_device_fini(struct qxl_device *qdev);
> > >  
> > >  int qxl_modeset_init(struct qxl_device *qdev);
> > > diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_kms.c
> > > index 9eed1a375f24..91a34dd835d7 100644
> > > --- a/drivers/gpu/drm/qxl/qxl_kms.c
> > > +++ b/drivers/gpu/drm/qxl/qxl_kms.c
> > > @@ -108,21 +108,13 @@ static void qxl_gc_work(struct work_struct *work)
> > >  }
> > >  
> > >  int qxl_device_init(struct qxl_device *qdev,
> > > -		    struct drm_driver *drv,
> > >  		    struct pci_dev *pdev)
> > >  {
> > >  	int r, sb;
> > >  
> > > -	r = drm_dev_init(&qdev->ddev, drv, &pdev->dev);
> > > -	if (r) {
> > > -		pr_err("Unable to init drm dev");
> > > -		goto error;
> > > -	}
> > > -
> > >  	qdev->ddev.pdev = pdev;
> > >  	pci_set_drvdata(pdev, &qdev->ddev);
> > >  	qdev->ddev.dev_private = qdev;
> > > -	drmm_add_final_kfree(&qdev->ddev, qdev);
> > >  
> > >  	mutex_init(&qdev->gem.mutex);
> > >  	mutex_init(&qdev->update_area_mutex);
> > > @@ -138,8 +130,7 @@ int qxl_device_init(struct qxl_device *qdev,
> > >  	qdev->vram_mapping = io_mapping_create_wc(qdev->vram_base, pci_resource_len(pdev, 0));
> > >  	if (!qdev->vram_mapping) {
> > >  		pr_err("Unable to create vram_mapping");
> > > -		r = -ENOMEM;
> > > -		goto error;
> > > +		return -ENOMEM;
> > >  	}
> > >  
> > >  	if (pci_resource_len(pdev, 4) > 0) {
> > > @@ -293,7 +284,6 @@ int qxl_device_init(struct qxl_device *qdev,
> > >  	io_mapping_free(qdev->surface_mapping);
> > >  vram_mapping_free:
> > >  	io_mapping_free(qdev->vram_mapping);
> > > -error:
> > >  	return r;
> > >  }
> > >  
> > > -- 
> > > 2.25.1
> > > 
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
