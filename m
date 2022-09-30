Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBB85F14EB
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 23:32:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4104F10EDBB;
	Fri, 30 Sep 2022 21:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB98610EDB0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 21:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664573507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7MZyE4q4pUK9exbRcIZDL/JbobrwIaDD99sfovICQ4I=;
 b=Dy4fDLGrhU4x/HdAFAAywLi8FlRZDm9pK0+cPfdxqqixiGQ0y/ANYJPWg2V5Tud26W/1hI
 kQQHzdazQO61C1GY2vRLi+QPhe3xsSNRGlu1ULTFrUSSX1TEmeKQlZrbyq/+A1NzjrkewD
 n2RqBmQi6vA/ec6m2GJpbWupXBP9gUo=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-106-mUEIUdigMIqjY7zsjheI9g-1; Fri, 30 Sep 2022 17:31:45 -0400
X-MC-Unique: mUEIUdigMIqjY7zsjheI9g-1
Received: by mail-il1-f199.google.com with SMTP id
 l12-20020a056e0212ec00b002f96a08aaf1so1563416iln.5
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 14:31:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=7MZyE4q4pUK9exbRcIZDL/JbobrwIaDD99sfovICQ4I=;
 b=6p2d2Vt+IcOExH+f30izUrd/Bu/Vp+/ZTmAVlfdtpkEhpLpUuYODmOVEDaIA/b+sj5
 VZ9Lggv1REG+GEftT9UWpHrn6NEB8c2OswGlfhnGxX66ztn66Yay4PvYSn6krlkMQgdY
 KNaZmACY4W5PaA4B+w0Bje+j+vx7+O6krcGTIs8JMJ8qOqSb7Av5b7yFMN9wV9WHJHrM
 ak+67r1sv7SM8Q1j8GTANhvSKuzxsyzAzYMEFcw38N1K71kk9TG/Cb0Nx+MYYLHlXDqC
 uvJxOrHrnaCW/4XYTSnpwMFfutZs+OpkLdVdwk35Ix9kEZba2pEWUq4h0eo3aiV8Kkp2
 ZjgQ==
X-Gm-Message-State: ACrzQf1rwoR8FqjRW3hftrq+SQTA07v1KL6zbEAw5JiwOr1FCdGUsqIv
 uyTlu0kJE9xrLdQq/ir/JeJ+zCzurGkjPZdpXRIxIoadFO+mBxDOh+EbCg+tN4X0th9s3inv+Fy
 lUe5N3CBchDGfEsWuwTXtks2tZYLw
X-Received: by 2002:a05:6638:4416:b0:35a:3cca:4db3 with SMTP id
 bp22-20020a056638441600b0035a3cca4db3mr5665329jab.0.1664573503689; 
 Fri, 30 Sep 2022 14:31:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5cqLb3noeJWS0YhPhgS37XjFCTWP2XxFR9rFh11+Uu4oQtCWPM3VbBWg5g6mGXkpdAVP6H6g==
X-Received: by 2002:a05:6638:4416:b0:35a:3cca:4db3 with SMTP id
 bp22-20020a056638441600b0035a3cca4db3mr5665306jab.0.1664573503392; 
 Fri, 30 Sep 2022 14:31:43 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 l15-20020a02cd8f000000b0034c107ac9bbsm1343303jap.8.2022.09.30.14.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 14:31:42 -0700 (PDT)
Date: Fri, 30 Sep 2022 15:31:39 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH] drm/i915/gvt: Add missing vfio_unregister_group_dev() call
Message-ID: <20220930153139.0d60652b.alex.williamson@redhat.com>
In-Reply-To: <0-v1-013609965fe8+9d-vfio_gvt_unregister_jgg@nvidia.com>
References: <0-v1-013609965fe8+9d-vfio_gvt_unregister_jgg@nvidia.com>
Organization: Red Hat
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

Applied to vfio next branch for v6.1.  Thanks for the quick fix!

Alex
 
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

