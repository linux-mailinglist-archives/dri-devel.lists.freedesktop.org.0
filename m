Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A38EE1646EB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 15:28:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 967776EBFC;
	Wed, 19 Feb 2020 14:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF0EA8947A;
 Wed, 19 Feb 2020 14:28:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2D2DC2F9;
 Wed, 19 Feb 2020 15:28:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582122505;
 bh=4z+CTGmqSituyCLJdy3NAd3tapKkeT1S/Em5Zl3+xuo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HNVoEJTx04+RGNXpHgaxZZC/NjxQRcF409uzA98auuuv2LUFgCDGv49dZVeN5rEj/
 t8mTnnDFt0/gyQNeUg2YBG11podl2TYKTn9jqzCIlvetXSUvTUsupi6T5wcJQgnwDG
 iAM/CQqILAP9aoF5NKJ0WySNk1+W0gQAK8I0bozw=
Date: Wed, 19 Feb 2020 16:28:06 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 21/52] drm: Handle dev->unique with drmm_
Message-ID: <20200219142806.GL5070@pendragon.ideasonboard.com>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-22-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219102122.1607365-22-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

Thank you for the patch.

On Wed, Feb 19, 2020 at 11:20:51AM +0100, Daniel Vetter wrote:
> We need to add a drmm_kstrdup for this, but let's start somewhere.
> 
> This is not exactly perfect onion unwinding, but it's jsut a kfree so
> doesn't really matter at all.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/drm_drv.c     |  5 ++---
>  drivers/gpu/drm/drm_managed.c | 16 ++++++++++++++++
>  include/drm/drm_managed.h     |  1 +
>  3 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 1ee606b4a4f9..782fd5d6f8b2 100644
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
> @@ -1063,8 +1062,8 @@ EXPORT_SYMBOL(drm_dev_unregister);
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
> index ee7c7253af61..d8a484e19830 100644
> --- a/drivers/gpu/drm/drm_managed.c
> +++ b/drivers/gpu/drm/drm_managed.c
> @@ -147,6 +147,22 @@ void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp)
>  }
>  EXPORT_SYMBOL(drmm_kmalloc);
>  
> +char *drmm_kstrdup(struct drm_device *dev, const char *s, gfp_t gfp)

Do we need support for gfp_t other than GFP_KERNEL ? Given that the
memory will be released when the drm_device is destroyed, GFP_ATOMIC
would seem of dubious use to me, and we may want to not make it possible
to use it.

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
>  	struct drmres *dr = NULL, *tmp;
> diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
> index 75f2c8932c69..240edd395e88 100644
> --- a/include/drm/drm_managed.h
> +++ b/include/drm/drm_managed.h
> @@ -21,5 +21,6 @@ static inline void *drmm_kzalloc(struct drm_device *dev, size_t size, gfp_t gfp)
>  {
>  	return drmm_kmalloc(dev, size, gfp | __GFP_ZERO);
>  }
> +char *drmm_kstrdup(struct drm_device *dev, const char *s, gfp_t gfp);
>  
>  void drmm_kfree(struct drm_device *dev, void *data);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
