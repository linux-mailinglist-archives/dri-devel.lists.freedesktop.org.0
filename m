Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE3A5F5AE0
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 22:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D5AD10E770;
	Wed,  5 Oct 2022 20:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B9C10E772
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Oct 2022 20:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665001077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g2vLC0/2i+I0uLMhPpq2EA/KZTboH7Z2lCWoTbduUxI=;
 b=OZdm2wKSPKHOoHgu0vNoyqloJXvWH2edU72fbp4uFNRUvzz2o1i2dhegjKb2MVdHhup2x4
 VEIxhW9A7nmIr7PWeu2NFp7d3mGCTskTP2zQO9nz218whwvjLWpcHmo8p8A4/MXvVnkOY6
 CnbijjaEoOeXfrBrI6YuaybunAz5XpU=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-190-dphy1s_YOy6kuUe-4ZYrbQ-1; Wed, 05 Oct 2022 16:17:56 -0400
X-MC-Unique: dphy1s_YOy6kuUe-4ZYrbQ-1
Received: by mail-il1-f198.google.com with SMTP id
 i4-20020a056e02152400b002fa876e95b3so25259ilu.17
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Oct 2022 13:17:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=g2vLC0/2i+I0uLMhPpq2EA/KZTboH7Z2lCWoTbduUxI=;
 b=t8wQ+8kDUrZHruEz3ePdGylT88BWmk9R7J3sbhQ2BJ10xDXQkRPC3epjX4fmB1QBis
 gwIYtkHYuDabflaxs0Q5h9xDiy1r+BsuOnexeJ9aqQK72KmwI8okswRgzTsBFtG8f5yN
 SoJVPSKEIiXoi+WnvQnCCsYvIbhMtcV0mMBT2lOqLr+RxCJTQnmIvss/cRtXLTWoHX8m
 wAWu1/uk0wVJpcyMpZqbzNIUnI0i9EioekD6TaesQm/4/3DlqvElWWDla0YTv5ZhrA9G
 k9qh01sBviU0dO1wSzVmMAoRieyZPloYCGYrpHXcEsMzrp2hI3nepX19qeg3VuitDcNu
 qTXw==
X-Gm-Message-State: ACrzQf0NUrrJh7/wRqmfdCifFbDZRsGdPhVU321vfrtmJR00v+Aya6Vf
 or713r+gMOThaQhwNj1LKhrgtOW1ZI8qTTpZh6jyXwrAcMIW2LBiqQeXrMqyeHx9NyP2zNKFeqF
 Xg/rcjnFwrGampMCA9JWwIWdl83k0
X-Received: by 2002:a05:6e02:c67:b0:2f9:9117:a581 with SMTP id
 f7-20020a056e020c6700b002f99117a581mr669157ilj.107.1665001075226; 
 Wed, 05 Oct 2022 13:17:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7TZXdlHRglVXSKK9ZEsjo4JcrcXszFMsFm+6IUYbJ/RhiRJTAFh4/Dq8wK7FNTPN7X1kZaiQ==
X-Received: by 2002:a05:6e02:c67:b0:2f9:9117:a581 with SMTP id
 f7-20020a056e020c6700b002f99117a581mr669141ilj.107.1665001074983; 
 Wed, 05 Oct 2022 13:17:54 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 a14-20020a056602148e00b006a4ab3268f3sm1537915iow.42.2022.10.05.13.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 13:17:32 -0700 (PDT)
Date: Wed, 5 Oct 2022 14:17:17 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH] drm/i915/gvt: Add missing vfio_unregister_group_dev() call
Message-ID: <20221005141717.234c215e.alex.williamson@redhat.com>
In-Reply-To: <0-v1-013609965fe8+9d-vfio_gvt_unregister_jgg@nvidia.com>
References: <0-v1-013609965fe8+9d-vfio_gvt_unregister_jgg@nvidia.com>
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

On Thu, 29 Sep 2022 14:48:35 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> When converting to directly create the vfio_device the mdev driver has to
> put a vfio_register_emulated_iommu_dev() in the probe() and a pairing
> vfio_unregister_group_dev() in the remove.
> 
> This was missed for gvt, add it.
> 
> Cc: stable@vger.kernel.org
> Fixes: 978cf586ac35 ("drm/i915/gvt: convert to use vfio_register_emulated_iommu_dev")
> Reported-by: Alex Williamson <alex.williamson@redhat.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> Should go through Alex's tree.
> 
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
> index 41bba40feef8f4..9003145adb5a93 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -1615,6 +1615,7 @@ static void intel_vgpu_remove(struct mdev_device *mdev)
>  	if (WARN_ON_ONCE(vgpu->attached))
>  		return;
>  
> +	vfio_unregister_group_dev(&vgpu->vfio_device);
>  	vfio_put_device(&vgpu->vfio_device);
>  }
>  
> 
> base-commit: c72e0034e6d4c36322d958b997d11d2627c6056c

This is marked for stable, but I think the stable backport for
existing kernels is actually:

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index e3cd58946477..de89946c4817 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1595,6 +1595,9 @@ static void intel_vgpu_remove(struct mdev_device *mdev)
 
 	if (WARN_ON_ONCE(vgpu->attached))
 		return;
+
+	vfio_unregister_group_dev(&vgpu->vfio_device);
+	vfio_uninit_group_dev(&vgpu->vfio_device);
 	intel_gvt_destroy_vgpu(vgpu);
 }

