Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D305A19D8D1
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 16:17:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C516EBDD;
	Fri,  3 Apr 2020 14:17:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1CCE6EBC8;
 Fri,  3 Apr 2020 14:17:16 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4B0672078C;
 Fri,  3 Apr 2020 14:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585923436;
 bh=AgMmqbAqnPQN5mHGbBPRQBFxOr5Kc+09s/Y9rjNBuFY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HRLOANfD5mVZiXgsD3GVDJ0Gl/vgGna3vEkCa+Czr4tYzwlfmpmh7tdxUXoIrTc2H
 DhjHklqJt/B8ck7CZmxP52+rNd9njo7Whq5zpqZSjLDkE987Av1uKZS70XhlridIQf
 G9etVI2KkyynGoVa9dt1th4HWrcrkQ5T/EUXq94Y=
Date: Fri, 3 Apr 2020 16:17:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 01/44] drivers/base: Always release devres on device_del
Message-ID: <20200403141712.GA4088318@kroah.com>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403135828.2542770-2-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 03, 2020 at 03:57:45PM +0200, Daniel Vetter wrote:
> In drm we've added nice drm_device (the main gpu driver thing, which
> also represents the userspace interfaces and has everything else
> dangling off it) init functions using devres, devm_drm_dev_init and
> soon devm_drm_dev_alloc (this patch series adds that).
> 
> A slight trouble is that drm_device itself holds a reference on the
> struct device it's sitting on top (for sysfs links and dmesg debug and
> lots of other things), so there's a reference loop. For real drivers
> this is broken at remove/unplug time, where all devres resources are
> released device_release_driver(), before the final device reference is
> dropped. So far so good.
> 
> There's 2 exceptions:
> - drm/vkms|vgem: Virtual drivers for which we create a fake/virtual
>   platform device to make them look more like normal devices to
>   userspace. These aren't drivers in the driver model sense, we simple
>   create a platform_device and register it.

That's a horrid abuse of platform devices, just use a "virtual" device
please, create/remove it when you need it, and all should be fine.

> - drm/i915/selftests, where we create minimal mock devices, and again
>   the selftests aren't proper drivers in the driver model sense.

Again, virtual devices are best to use for this.

> For these two cases the reference loop isn't broken, because devres is
> only cleaned up when the last device reference is dropped. But that's
> not happening, because the drm_device holds that last struct device
> reference.
> 
> Thus far this wasn't a problem since the above cases simply
> hand-rolled their cleanup code. But I want to convert all drivers over
> to the devm_ versions, hence it would be really nice if these
> virtual/fake/mock uses-cases could also be managed with devres
> cleanup.
> 
> I see three possible approaches:
> 
> - Clean up devres from device_del (or platform_device_unregister) even
>   when no driver is bound. This seems like the simplest solution, but
>   also the one with the widest impact, and what this patch implements.
>   We might want to include more of the cleanup than just
>   devres_release_all, but this is all I need to get my use case going.

After device_del, you should never be using that structure again anyway.
So why is there any "resource leak"?  You can't recycle the structure,
and you can't assign it to anything else, so eventually you have to do
a final put on the thing, which will free up the resources.

And then all should be fine, right?  But, by putting the freeing here,
you can still have a "live" device that thinks it has resources availble
that it can access, but yet they are now gone.  Yeah, it's probably not
ever going to really happen, but the lifecycles of dynamic devices are
tough to "prove" at times, and I worry that freeing things this early is
going to cause odd disconnect issues.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
