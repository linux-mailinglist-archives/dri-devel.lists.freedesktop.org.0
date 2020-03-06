Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBAC17C725
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 21:37:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD6586E4E6;
	Fri,  6 Mar 2020 20:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6998B89150;
 Fri,  6 Mar 2020 20:37:14 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 37DE22001E;
 Fri,  6 Mar 2020 21:37:12 +0100 (CET)
Date: Fri, 6 Mar 2020 21:37:10 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 20/51] drm: Handle dev->unique with drmm_
Message-ID: <20200306203710.GG14757@ravnborg.org>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-21-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302222631.3861340-21-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8
 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=Eu1Yk3ZNupszFTrKmO4A:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 02, 2020 at 11:26:00PM +0100, Daniel Vetter wrote:
> We need to add a drmm_kstrdup for this, but let's start somewhere.
> 
> This is not exactly perfect onion unwinding, but it's jsut a kfree so
> doesn't really matter at all.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Reluctanlyt... But anyway
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

See below for a few comments.


> ---
>  drivers/gpu/drm/drm_drv.c     |  5 ++---
>  drivers/gpu/drm/drm_managed.c | 16 ++++++++++++++++
>  include/drm/drm_managed.h     |  1 +
>  3 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 1a048325f30e..ef79c03e311c 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -777,7 +777,6 @@ void drm_dev_fini(struct drm_device *dev)
>  	mutex_destroy(&dev->filelist_mutex);
>  	mutex_destroy(&dev->struct_mutex);
>  	drm_legacy_destroy_members(dev);
> -	kfree(dev->unique);
>  }
>  EXPORT_SYMBOL(drm_dev_fini);
>  
> @@ -1068,8 +1067,8 @@ EXPORT_SYMBOL(drm_dev_unregister);
>   */
>  int drm_dev_set_unique(struct drm_device *dev, const char *name)
>  {
> -	kfree(dev->unique);
> -	dev->unique = kstrdup(name, GFP_KERNEL);
> +	drmm_kfree(dev, dev->unique);
> +	dev->unique = drmm_kstrdup(dev, name, GFP_KERNEL);
>  
>  	return dev->unique ? 0 : -ENOMEM;
>  }
> diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
> index 57dc79fa90af..514d5bd42446 100644
> --- a/drivers/gpu/drm/drm_managed.c
> +++ b/drivers/gpu/drm/drm_managed.c
> @@ -160,6 +160,22 @@ void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp)
>  }
>  EXPORT_SYMBOL(drmm_kmalloc);
>  
> +char *drmm_kstrdup(struct drm_device *dev, const char *s, gfp_t gfp)

So we need this gfp for all users - just because i915 is special and
uses "GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN" in to places -
sigh.



> +{
> +	size_t size;
> +	char *buf;
> +
> +	if (!s)
> +		return NULL;
> +
> +	size = strlen(s) + 1;
> +	buf = drmm_kmalloc(dev, size, gfp);
> +	if (buf)
> +		memcpy(buf, s, size);
> +	return buf;
> +}
> +EXPORT_SYMBOL_GPL(drmm_kstrdup);
> +
>  void drmm_kfree(struct drm_device *dev, void *data)
>  {
>  	struct drmres *dr_match = NULL, *dr;
> diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
> index 7b5df7d09b19..89e6fce9f689 100644
> --- a/include/drm/drm_managed.h
> +++ b/include/drm/drm_managed.h
> @@ -24,6 +24,7 @@ static inline void *drmm_kzalloc(struct drm_device *dev, size_t size, gfp_t gfp)
>  {
>  	return drmm_kmalloc(dev, size, gfp | __GFP_ZERO);
>  }
> +char *drmm_kstrdup(struct drm_device *dev, const char *s, gfp_t gfp);
Missing empty line above. But it is fixed later IIRC

>  
>  void drmm_kfree(struct drm_device *dev, void *data);
>  
> -- 
> 2.24.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
