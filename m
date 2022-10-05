Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E13D75F5C5C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 00:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A95B10E79D;
	Wed,  5 Oct 2022 22:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996FE10E79C
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Oct 2022 22:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665007441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J9nH6SAe2p+4G72Hb/60qeaydYa0VcigbbhPU+GvRYc=;
 b=bvTMxNjk3nKRN4OQ88kKOMLZ5Fqyv5y1QuwSAYWz9sZfchYu1s/It0zr0HYcE3C+ZWdORv
 1L5+lONufG3EZ8SsjS5++PQSQmvYzWjJPbH3Vwj72pCnLCxlrhxJ476vfAzFXGhTJrP82g
 wHZRfCd8yygURCE2To/sjtcAGZ5u95k=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-168-_yv6u6UkP7irwpp9nlXYlw-1; Wed, 05 Oct 2022 18:04:00 -0400
X-MC-Unique: _yv6u6UkP7irwpp9nlXYlw-1
Received: by mail-io1-f72.google.com with SMTP id
 a15-20020a6b660f000000b006a0d0794ad1so11761682ioc.6
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Oct 2022 15:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=J9nH6SAe2p+4G72Hb/60qeaydYa0VcigbbhPU+GvRYc=;
 b=ztmefh353d15/kS3YYp11U1KPMI9u3VQhDDaV9fhqK4SjSaM+sgp1hgk7XE1sXPqmx
 s8PMqBFk/q+AFTc2hC1KFAF1A46R4r8sIvlx6eddT4/0G1pD0ItU9pRzc8CMN8j2G8S9
 0+w0ZMtuPlyRxkbHt42+iJ1E0gIZjx7t9YCZQs0GPau45j2GAEyZXlDIx6goe1j0Vovt
 WPz9tY2JL5L7v1j+svWpuM+I7rJBrszVBK45+FdSIsvGIN5ZRLnXRLFCc9epZ760wRUy
 65rTkJakGYVUJFy4Gi7IbAtFruMn1i++jbNLU2BZFB8p0d7yXzhIXVbJkJ2gAsTrvHKK
 jn/g==
X-Gm-Message-State: ACrzQf1v0uW/5qxRz1NMeHoHjQnoV/BwHb4XXD6AWx4Dlflhw+Ihbaz6
 0/bEzuytcoq7bsStPqWOeOBUHC5FsVn4hB7eXETtxdAj0ztp5UcnK/e9fpLMtYkmLz+3uh2ptMU
 sZkFOTtGb55wsqSEeh/XCB1spnLnE
X-Received: by 2002:a05:6e02:1785:b0:2fa:2428:a37b with SMTP id
 y5-20020a056e02178500b002fa2428a37bmr800230ilu.312.1665007440088; 
 Wed, 05 Oct 2022 15:04:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM54tO6NXBc78ZQZvuhnh2uwZGv6Nq26Wj8onM9ymY8rQSrnmcaGBAN7T7WDiA6bSu4ubQQJEA==
X-Received: by 2002:a05:6e02:1785:b0:2fa:2428:a37b with SMTP id
 y5-20020a056e02178500b002fa2428a37bmr800221ilu.312.1665007439878; 
 Wed, 05 Oct 2022 15:03:59 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 n10-20020a02a90a000000b0035b6b21c21fsm4474450jam.17.2022.10.05.15.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 15:03:58 -0700 (PDT)
Date: Wed, 5 Oct 2022 16:03:56 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH] drm/i915/gvt: Add missing vfio_unregister_group_dev() call
Message-ID: <20221005160356.52d6428c.alex.williamson@redhat.com>
In-Reply-To: <20221005141717.234c215e.alex.williamson@redhat.com>
References: <0-v1-013609965fe8+9d-vfio_gvt_unregister_jgg@nvidia.com>
 <20221005141717.234c215e.alex.williamson@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 stable@vger.kernel.org, intel-gvt-dev@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 5 Oct 2022 14:17:17 -0600
Alex Williamson <alex.williamson@redhat.com> wrote:

> On Thu, 29 Sep 2022 14:48:35 -0300
> Jason Gunthorpe <jgg@nvidia.com> wrote:
> 
> > When converting to directly create the vfio_device the mdev driver has to
> > put a vfio_register_emulated_iommu_dev() in the probe() and a pairing
> > vfio_unregister_group_dev() in the remove.
> > 
> > This was missed for gvt, add it.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 978cf586ac35 ("drm/i915/gvt: convert to use vfio_register_emulated_iommu_dev")
> > Reported-by: Alex Williamson <alex.williamson@redhat.com>
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > ---
> >  drivers/gpu/drm/i915/gvt/kvmgt.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > Should go through Alex's tree.
> > 
> > diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
> > index 41bba40feef8f4..9003145adb5a93 100644
> > --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> > +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> > @@ -1615,6 +1615,7 @@ static void intel_vgpu_remove(struct mdev_device *mdev)
> >  	if (WARN_ON_ONCE(vgpu->attached))
> >  		return;

Actually, what's the purpose of this ^^^^ ?

We can't have a .remove callback that does nothing, this breaks
removing the device while it's in use.  Once we have the
vfio_unregister_group_dev() fix below, we'll block until the device is
unused, at which point vgpu->attached becomes false.  Unless I'm
missing something, I think we should also follow-up with a patch to
remove that bogus warn-on branch, right?  Thanks,

Alex

> >  
> > +	vfio_unregister_group_dev(&vgpu->vfio_device);
> >  	vfio_put_device(&vgpu->vfio_device);
> >  }
> >  
> > 
> > base-commit: c72e0034e6d4c36322d958b997d11d2627c6056c  
> 
> This is marked for stable, but I think the stable backport for
> existing kernels is actually:
> 
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
> index e3cd58946477..de89946c4817 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -1595,6 +1595,9 @@ static void intel_vgpu_remove(struct mdev_device *mdev)
>  
>  	if (WARN_ON_ONCE(vgpu->attached))
>  		return;
> +
> +	vfio_unregister_group_dev(&vgpu->vfio_device);
> +	vfio_uninit_group_dev(&vgpu->vfio_device);
>  	intel_gvt_destroy_vgpu(vgpu);
>  }

