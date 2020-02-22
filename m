Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0ED168FB2
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 16:16:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3851A6E942;
	Sat, 22 Feb 2020 15:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05786E942
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 15:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YF1UM2wgenJ2oHYpM5nrog9MJrnzYmIb0kMFg2Ft9ys=; b=UvFJKE9xO0dYi17RmAW5J79cx
 5xkSardFiLwbRrLoNL5F3fd+T3EA8R6zF5JT6JRigq0OQ2FZUUEkJFsIgpB9KITPzegrog3ErXt0N
 d352Zt6IZb5vCQcPJinfsFv/LVyZGl8BBmHElZbvkFiWDvj1+kn118it98vsrM6oRzJaiJKTHB3Bi
 ijicYkVWkW6K6lM6Wl9dzUocdTk0I7dsem7n6UAkksdWSpX/MOT7FwE3N5iNbjy0bb+yc1WIEBDib
 TTuzKI91pBf8yIV6uOjwVBwmsXQG4BKtq2NI2aMqi72OpIFIEn21DV4GoRP78Tr2Sf5XNYqcgoRti
 pF6BV25JA==;
Received: from shell.armlinux.org.uk
 ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:51318)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1j5WW7-0008K9-H3; Sat, 22 Feb 2020 15:16:31 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1j5WW0-0004Zk-Uo; Sat, 22 Feb 2020 15:16:24 +0000
Date: Sat, 22 Feb 2020 15:16:24 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 18/51] drm/<drivers>: Use drmm_add_final_kfree
Message-ID: <20200222151624.GN25745@shell.armlinux.org.uk>
References: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
 <20200221210319.2245170-19-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221210319.2245170-19-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 21, 2020 at 10:02:46PM +0100, Daniel Vetter wrote:
> These are the leftover drivers that didn't have a ->release hook that
> needed to be updated.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: "James (Qian) Wang" <james.qian.wang@arm.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Mihail Atanassov <mihail.atanassov@arm.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_kms.c | 2 ++
>  drivers/gpu/drm/armada/armada_drv.c             | 2 ++
>  drivers/gpu/drm/vboxvideo/vbox_drv.c            | 2 ++
>  3 files changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
> index 197dca3fc84c..dd9ed71ed942 100644
> --- a/drivers/gpu/drm/armada/armada_drv.c
> +++ b/drivers/gpu/drm/armada/armada_drv.c
> @@ -12,6 +12,7 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_ioctl.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_prime.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_fb_helper.h>
> @@ -103,6 +104,7 @@ static int armada_drm_bind(struct device *dev)
>  		kfree(priv);
>  		return ret;
>  	}
> +	drmm_add_final_kfree(&priv->drm, priv);
>  
>  	/* Remove early framebuffers */
>  	ret = drm_fb_helper_remove_conflicting_framebuffers(NULL,

I have no visibility of what the changes behind this are, so I
can't ack this change.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
