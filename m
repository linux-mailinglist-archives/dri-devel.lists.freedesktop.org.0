Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDE315D469
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 10:13:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A96A6F8DB;
	Fri, 14 Feb 2020 09:13:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A816F8DB
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 09:13:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Feb 2020 01:13:30 -0800
X-IronPort-AV: E=Sophos;i="5.70,440,1574150400"; d="scan'208";a="227536531"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Feb 2020 01:13:26 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/print: Delete a few unused shouting macros
In-Reply-To: <20200214090428.2929833-1-daniel.vetter@ffwll.ch>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200214090428.2929833-1-daniel.vetter@ffwll.ch>
Date: Fri, 14 Feb 2020 11:13:23 +0200
Message-ID: <8736bdy1jg.fsf@intel.com>
MIME-Version: 1.0
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
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 14 Feb 2020, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> We want to go over to the new lowercase ones, encourage that a bit
> more.
>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/drm_managed.c | 21 +++++++++++++++++++++

Oops?

>  include/drm/drm_print.h       | 26 --------------------------

Acked-by: Jani Nikula <jani.nikula@intel.com>

for this file.

>  2 files changed, 21 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
> index ea49071b16ee..7d4827b79806 100644
> --- a/drivers/gpu/drm/drm_managed.c
> +++ b/drivers/gpu/drm/drm_managed.c
> @@ -38,4 +38,25 @@ struct drmres {
>  	u8 __aligned(ARCH_KMALLOC_MINALIGN) data[];
>  };
>  
> +static __always_inline struct drmres * alloc_dr(drmres_release_t release,
> +						size_t size, gfp_t gfp, int nid)
> +{
> +	size_t tot_size;
> +	struct drmres *dr;
> +
> +	/* We must catch any near-SIZE_MAX cases that could overflow. */
> +	if (unlikely(check_add_overflow(sizeof(*dr), size, &tot_size)))
> +		return NULL;
> +
> +	dr = kmalloc_node_track_caller(tot_size, gfp, nid);
> +	if (unlikely(!dr))
> +		return NULL;
> +
> +	memset(dr, 0, offsetof(struct drmres, data));
> +
> +	INIT_LIST_HEAD(&dr->node.entry);
> +	dr->node.release = release;
> +	return dr;
> +}
> +
>  
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 894a0b9437e2..fd6ba2532f50 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -382,14 +382,6 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
>  	drm_dev_dbg(dev, DRM_UT_DRIVER,	fmt, ##__VA_ARGS__)
>  #define DRM_DEV_DEBUG_KMS(dev, fmt, ...)				\
>  	drm_dev_dbg(dev, DRM_UT_KMS, fmt, ##__VA_ARGS__)
> -#define DRM_DEV_DEBUG_PRIME(dev, fmt, ...)				\
> -	drm_dev_dbg(dev, DRM_UT_PRIME, fmt, ##__VA_ARGS__)
> -#define DRM_DEV_DEBUG_ATOMIC(dev, fmt, ...)				\
> -	drm_dev_dbg(dev, DRM_UT_ATOMIC,	fmt, ##__VA_ARGS__)
> -#define DRM_DEV_DEBUG_VBL(dev, fmt, ...)				\
> -	drm_dev_dbg(dev, DRM_UT_VBL, fmt, ##__VA_ARGS__)
> -#define	DRM_DEV_DEBUG_DP(dev, fmt, ...)					\
> -	drm_dev_dbg(dev, DRM_UT_DP, fmt, ## __VA_ARGS__)
>  
>  #define _DRM_DEV_DEFINE_DEBUG_RATELIMITED(dev, category, fmt, ...)	\
>  ({									\
> @@ -406,18 +398,9 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
>   * @dev: device pointer
>   * @fmt: printf() like format string.
>   */
> -#define DRM_DEV_DEBUG_RATELIMITED(dev, fmt, ...)			\
> -	_DEV_DRM_DEFINE_DEBUG_RATELIMITED(dev, DRM_UT_CORE,		\
> -					  fmt, ##__VA_ARGS__)
> -#define DRM_DEV_DEBUG_DRIVER_RATELIMITED(dev, fmt, ...)			\
> -	_DRM_DEV_DEFINE_DEBUG_RATELIMITED(dev, DRM_UT_DRIVER,		\
> -					  fmt, ##__VA_ARGS__)
>  #define DRM_DEV_DEBUG_KMS_RATELIMITED(dev, fmt, ...)			\
>  	_DRM_DEV_DEFINE_DEBUG_RATELIMITED(dev, DRM_UT_KMS,		\
>  					  fmt, ##__VA_ARGS__)
> -#define DRM_DEV_DEBUG_PRIME_RATELIMITED(dev, fmt, ...)			\
> -	_DRM_DEV_DEFINE_DEBUG_RATELIMITED(dev, DRM_UT_PRIME,		\
> -					  fmt, ##__VA_ARGS__)
>  
>  /*
>   * struct drm_device based logging
> @@ -541,18 +524,9 @@ void __drm_err(const char *format, ...);
>  	__drm_dbg(DRM_UT_DP, fmt, ## __VA_ARGS__)
>  
>  
> -#define DRM_DEBUG_RATELIMITED(fmt, ...)					\
> -	DRM_DEV_DEBUG_RATELIMITED(NULL, fmt, ##__VA_ARGS__)
> -
> -#define DRM_DEBUG_DRIVER_RATELIMITED(fmt, ...)				\
> -	DRM_DEV_DEBUG_DRIVER_RATELIMITED(NULL, fmt, ##__VA_ARGS__)
> -
>  #define DRM_DEBUG_KMS_RATELIMITED(fmt, ...)				\
>  	DRM_DEV_DEBUG_KMS_RATELIMITED(NULL, fmt, ##__VA_ARGS__)
>  
> -#define DRM_DEBUG_PRIME_RATELIMITED(fmt, ...)				\
> -	DRM_DEV_DEBUG_PRIME_RATELIMITED(NULL, fmt, ##__VA_ARGS__)
> -
>  /*
>   * struct drm_device based WARNs
>   *

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
