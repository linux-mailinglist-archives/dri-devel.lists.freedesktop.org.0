Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E72F14B2F5
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 11:48:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44EBF6EDAB;
	Tue, 28 Jan 2020 10:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC7636EDAB;
 Tue, 28 Jan 2020 10:48:22 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 20032604-1500050 for multiple; Tue, 28 Jan 2020 10:48:01 +0000
MIME-Version: 1.0
To: DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200128104602.1459802-1-daniel.vetter@ffwll.ch>
References: <20200128104602.1459802-1-daniel.vetter@ffwll.ch>
Message-ID: <158020847932.30113.5492073782079336156@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [Intel-gfx] [PATCH 1/4] drm: Complain if drivers still use the
 ->load callback
Date: Tue, 28 Jan 2020 10:47:59 +0000
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Daniel Vetter (2020-01-28 10:45:58)
> Kinda time to get this sorted. The locking around this really is not
> nice.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/drm_drv.c | 6 ++++++
>  include/drm/drm_drv.h     | 3 +++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 7c18a980cd4b..8deff75b484c 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -948,6 +948,12 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
>  
>         mutex_lock(&drm_global_mutex);
>  
> +       if (dev->driver->load) {
> +               if (!drm_core_check_feature(dev, DRIVER_LEGACY))
> +                       DRM_INFO("drm driver %s is using deprecated ->load callback\n",
> +                                dev->driver->name);

DRM_WARN() if the plan is to remove it?

That should encourage people to complain louder.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
