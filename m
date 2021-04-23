Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9953695FE
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 17:20:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CCCE6EC00;
	Fri, 23 Apr 2021 15:20:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF456E3BB
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 15:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619191217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZDCiuBPdtrh7+24YSM/bG1HNNByYRVPDuLtx+R1mChI=;
 b=c8j05yapRiUMCgRVK4ibfrLsJqqU9xRQD62LriwJ3NNdK0fa3lT1jgBMJ7guPnvOgXwuBD
 VHuXIW7a9ce8Gec/X9FVK8xBPfIynWIFlm6tMVqlL6t5DmLl7QwpW24mBH0LaI6vUoTZ6y
 2+sxUYhznOOe+5nM5fPucDeXMM635Uw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-Wq16G-YDNJa6WTFXCRPwbA-1; Fri, 23 Apr 2021 11:20:13 -0400
X-MC-Unique: Wq16G-YDNJa6WTFXCRPwbA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E8F1107ACCD;
 Fri, 23 Apr 2021 15:20:11 +0000 (UTC)
Received: from redhat.com (ovpn-114-21.phx2.redhat.com [10.3.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30C8F60854;
 Fri, 23 Apr 2021 15:20:10 +0000 (UTC)
Date: Fri, 23 Apr 2021 09:20:09 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH] vfio/gvt: fix DRM_I915_GVT dependency on VFIO_MDEV
Message-ID: <20210423092009.45fb4567@redhat.com>
In-Reply-To: <20210423120709.GH2047089@ziepe.ca>
References: <20210422133547.1861063-1-arnd@kernel.org>
 <20210422135810.GG2047089@ziepe.ca>
 <20210423035426.GG1551@zhen-hp.sh.intel.com>
 <20210423120709.GH2047089@ziepe.ca>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Arnd Bergmann <arnd@kernel.org>, Kevin Tian <kevin.tian@intel.com>,
 Cornelia Huck <cohuck@redhat.com>, dri-devel@lists.freedesktop.org,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 23 Apr 2021 09:07:09 -0300
Jason Gunthorpe <jgg@ziepe.ca> wrote:

> On Fri, Apr 23, 2021 at 11:54:26AM +0800, Zhenyu Wang wrote:
> > On 2021.04.22 10:58:10 -0300, Jason Gunthorpe wrote:  
> > > On Thu, Apr 22, 2021 at 03:35:33PM +0200, Arnd Bergmann wrote:  
> > > > From: Arnd Bergmann <arnd@arndb.de>
> > > > 
> > > > The Kconfig dependency is incomplete since DRM_I915_GVT is a 'bool'
> > > > symbol that depends on the 'tristate' VFIO_MDEV. This allows a
> > > > configuration with VFIO_MDEV=m, DRM_I915_GVT=y and DRM_I915=y that
> > > > causes a link failure:
> > > > 
> > > > x86_64-linux-ld: drivers/gpu/drm/i915/gvt/gvt.o: in function `available_instances_show':
> > > > gvt.c:(.text+0x67a): undefined reference to `mtype_get_parent_dev'
> > > > x86_64-linux-ld: gvt.c:(.text+0x6a5): undefined reference to `mtype_get_type_group_id'
> > > > x86_64-linux-ld: drivers/gpu/drm/i915/gvt/gvt.o: in function `description_show':
> > > > gvt.c:(.text+0x76e): undefined reference to `mtype_get_parent_dev'
> > > > x86_64-linux-ld: gvt.c:(.text+0x799): undefined reference to `mtype_get_type_group_id'
> > > > 
> > > > Clarify the dependency by specifically disallowing the broken
> > > > configuration. If VFIO_MDEV is built-in, it will work, but if
> > > > VFIO_MDEV=m, the i915 driver cannot be built-in here.
> > > > 
> > > > Fixes: 07e543f4f9d1 ("vfio/gvt: Make DRM_I915_GVT depend on VFIO_MDEV")
> > > > Fixes: 9169cff168ff ("vfio/mdev: Correct the function signatures for the mdev_type_attributes")
> > > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > > >  drivers/gpu/drm/i915/Kconfig | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)  
> > > 
> > > Oh kconfig stuff like this makes my head hurt, thanks for finding it
> > > 
> > > I also can't see an alternative to this ugly thing, besides having the
> > > i915 guys properly modularize this code someday
> > > 
> > > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > >   
> > 
> > I don't really want this mess to propagate further. We should move
> > mdev related stuff to kvmgt module instead, so not pretend any more to
> > possibly use that for other hypervisor..
> > 
> > Sorry that I didn't realize this issue when Jason proposed this. Let
> > me do the left cleanup.  
> 
> It would be good, but Alex should still take this patch for the
> upcoming merge window, you can revert it when you do all the cleanups

I can include it, but I'll wait for confirmation from Zhenyu.  Thanks,

Alex

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
