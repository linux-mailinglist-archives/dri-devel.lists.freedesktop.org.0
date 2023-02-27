Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D58196A3E8A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 10:43:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E2610E39B;
	Mon, 27 Feb 2023 09:43:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E9C10E39B
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 09:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677491013; x=1709027013;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=xMUxSLnjLt6gEX29cQsLrq6Ej7+QHxeH+R+GgC/uMOg=;
 b=Cw1660cPHJsUnTxRamqE8wyvEPDTqF2uNpzfOh6gR42AUti+LX/PN3tu
 ZCybnSWVcjDOXT/m+rRM9XEfeB0SVgnNbu9Dtdi0OzPzNvdlxBPjNnuJ2
 kwzevax7VYJS6wyD4Ggo24MXQYcqf948OF9fErJJh8rZ2E4Km+nw4/Jvr
 tYc0Jw11rDXg2usYJR1ySNYBeT3q29DnaclX5p167Fe8A5FIX3mEXiTu7
 qHwv3CwL67cwzlZpXKcQ6QBdvLB0LtxzZPTTDbgFU896cGrm6SbBJJmaP
 zv7R9pwEqPo4v8QObj7oxFy0qlCug3XLkKs3fxuXsn9gO1XWuizsuDai0 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="313493697"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="313493697"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 01:43:27 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="762624258"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="762624258"
Received: from jkaisrli-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.56.158])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 01:43:24 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Siddh Raman Pant <code@siddh.me>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jim Cromie <jim.cromie@gmail.com>, Sam
 Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v7 1/7] drm/print: Fix and add support for NULL as first
 argument in drm_* macros
In-Reply-To: <89f0aa1f26696846c2303527fe4d133bb4ff4bf6.1677395403.git.code@siddh.me>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1677395403.git.code@siddh.me>
 <89f0aa1f26696846c2303527fe4d133bb4ff4bf6.1677395403.git.code@siddh.me>
Date: Mon, 27 Feb 2023 11:43:21 +0200
Message-ID: <87ilfn30li.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 26 Feb 2023, Siddh Raman Pant <code@siddh.me> wrote:
> Comments say macros DRM_DEBUG_* are deprecated in favor of
> drm_dbg_*(NULL, ...), but they have broken support for it,
> as the macro will result in `(NULL) ? (NULL)->dev : NULL`.
>
> Thus, fix them by separating logic to get dev ptr in a new
> function, which will return the dev ptr if arg is not NULL.
> Use it in drm_dbg_*, and also in __DRM_DEFINE_DBG_RATELIMITED,
> where a similar (but correct) NULL check was in place.
>
> Also, add support for NULL in __drm_printk, so that all the
> drm_* macros will hence support NULL as the first argument.
> This also means that deprecation comments mentioning pr_()*
> can now be changed to the drm equivalents.
>
> There is a need to support device pointers, as in some cases,
> we may not have drm_device but just the device ptr, such as
> when dealing with struct mipi_dsi_host. Before this change,
> passing just mipi_dsi_host would have worked, since due to
> preprocessing, the resultant would be "host->dev", but now
> due to NULL check that cannot happen.

First of all, that's two distinct changes in one patch. The subject says
one thing, but it's really two.

But the main question is, do we *really* want to let callers pass either
struct drm_device * or struct device *? It will be type safe with
generics, but if it's okay to use either, people *will* use either. The
call sites will end up being a mixture of both. You can't control it. It
will be very tedious if you ever want to revert that decision.

Do we want to promote a style where you can pass either? To me, in C
context, it seems awfully sloppy and confusing rather than convenient.

I'd argue the struct mipi_dsi_host stuff should use dev_* calls
directly, as it's more of a special case, rather than allow struct
device * in drm_* logging macros.


BR,
Jani.


>
> Signed-off-by: Siddh Raman Pant <code@siddh.me>
> ---
>  include/drm/drm_print.h | 114 ++++++++++++++++++++++++++++++----------
>  1 file changed, 87 insertions(+), 27 deletions(-)
>
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index a93a387f8a1a..1a7d4064d120 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -34,6 +34,7 @@
>  #include <linux/dynamic_debug.h>
>  
>  #include <drm/drm.h>
> +#include <drm/drm_device.h>
>  
>  /* Do *not* use outside of drm_print.[ch]! */
>  extern unsigned long __drm_debug;
> @@ -445,15 +446,73 @@ void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
>  #define DRM_DEV_DEBUG_KMS(dev, fmt, ...)				\
>  	drm_dev_dbg(dev, DRM_UT_KMS, fmt, ##__VA_ARGS__)
>  
> +/* Helpers for struct drm_device based logging. */
> +
> +/**
> + * __drm_dev_ptr - Helper function to get drm->dev pointer.
> + * @drm: struct drm_device pointer.
> + *
> + * RETURNS:
> + * The struct device pointer (NULL if @drm is NULL).
> + */
> +static inline struct device *__drm_dev_ptr(const struct drm_device *drm)
> +{
> +	if (drm)
> +		return drm->dev;
> +
> +	return NULL;
> +}
> +
> +/**
> + * __dev_ptr - Helper function to get the same device pointer.
> + * @dev: struct device pointer, or NULL.
> + *
> + * RETURNS:
> + * The struct device pointer (NULL if @dev is NULL).
> + */
> +static inline struct device *__dev_ptr(const struct device *dev)
> +{
> +	return (struct device *)dev;
> +}
> +
> +/**
> + * __get_dev_ptr - Helper to get device pointer given struct drm_device *,
> + *		   or struct device *, or NULL.
> + *
> + * Primarily for use in drm_*() print macros, since they need to handle NULL
> + * as the first argument passed.
> + *
> + * struct device pointers are supported for edge cases (such as mipi_dsi_host),
> + * the default (and recommended) way is to pass struct drm_device pointer.
> + */
> +#define  __get_dev_ptr(drm)			\
> +	_Generic((drm),				\
> +		struct device * :		\
> +			__dev_ptr,		\
> +		const struct device * :		\
> +			__dev_ptr,		\
> +		default :			\
> +			__drm_dev_ptr		\
> +	)(drm)
> +
>  /*
>   * struct drm_device based logging
>   *
>   * Prefer drm_device based logging over device or prink based logging.
> + *
> + * The below macros support device pointers to cope for edge cases where
> + * we only have device (like in mipi_dsi_host) but not drm_device.
>   */
>  
>  /* Helper for struct drm_device based logging. */
>  #define __drm_printk(drm, level, type, fmt, ...)			\
> -	dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
> +({									\
> +	struct device *__dev_ = __get_dev_ptr(drm);			\
> +	if (__dev_)							\
> +		dev_##level##type(__dev_, "[drm] " fmt, ##__VA_ARGS__);	\
> +	else								\
> +		pr_##level##type("[drm] " fmt, ##__VA_ARGS__);		\
> +})
>  
>  
>  #define drm_info(drm, fmt, ...)					\
> @@ -487,25 +546,25 @@ void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
>  
>  
>  #define drm_dbg_core(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_CORE, fmt, ##__VA_ARGS__)
> -#define drm_dbg_driver(drm, fmt, ...)						\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg(__get_dev_ptr(drm), DRM_UT_CORE, fmt, ##__VA_ARGS__)
> +#define drm_dbg_driver(drm, fmt, ...)					\
> +	drm_dev_dbg(__get_dev_ptr(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
>  #define drm_dbg_kms(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg(__get_dev_ptr(drm), DRM_UT_KMS, fmt, ##__VA_ARGS__)
>  #define drm_dbg_prime(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_PRIME, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg(__get_dev_ptr(drm), DRM_UT_PRIME, fmt, ##__VA_ARGS__)
>  #define drm_dbg_atomic(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg(__get_dev_ptr(drm), DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
>  #define drm_dbg_vbl(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_VBL, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg(__get_dev_ptr(drm), DRM_UT_VBL, fmt, ##__VA_ARGS__)
>  #define drm_dbg_state(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_STATE, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg(__get_dev_ptr(drm), DRM_UT_STATE, fmt, ##__VA_ARGS__)
>  #define drm_dbg_lease(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_LEASE, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg(__get_dev_ptr(drm), DRM_UT_LEASE, fmt, ##__VA_ARGS__)
>  #define drm_dbg_dp(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DP, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg(__get_dev_ptr(drm), DRM_UT_DP, fmt, ##__VA_ARGS__)
>  #define drm_dbg_drmres(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRMRES, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg(__get_dev_ptr(drm), DRM_UT_DRMRES, fmt, ##__VA_ARGS__)
>  
>  #define drm_dbg(drm, fmt, ...)	drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
>  
> @@ -533,31 +592,31 @@ void __drm_err(const char *format, ...);
>  #define _DRM_PRINTK(once, level, fmt, ...)				\
>  	printk##once(KERN_##level "[" DRM_NAME "] " fmt, ##__VA_ARGS__)
>  
> -/* NOTE: this is deprecated in favor of pr_info(). */
> +/* NOTE: this is deprecated in favor of drm_info(NULL, ...). */
>  #define DRM_INFO(fmt, ...)						\
>  	_DRM_PRINTK(, INFO, fmt, ##__VA_ARGS__)
> -/* NOTE: this is deprecated in favor of pr_notice(). */
> +/* NOTE: this is deprecated in favor of drm_notice(NULL, ...). */
>  #define DRM_NOTE(fmt, ...)						\
>  	_DRM_PRINTK(, NOTICE, fmt, ##__VA_ARGS__)
> -/* NOTE: this is deprecated in favor of pr_warn(). */
> +/* NOTE: this is deprecated in favor of drm_warn(NULL, ...). */
>  #define DRM_WARN(fmt, ...)						\
>  	_DRM_PRINTK(, WARNING, fmt, ##__VA_ARGS__)
>  
> -/* NOTE: this is deprecated in favor of pr_info_once(). */
> +/* NOTE: this is deprecated in favor of drm_info_once(NULL, ...). */
>  #define DRM_INFO_ONCE(fmt, ...)						\
>  	_DRM_PRINTK(_once, INFO, fmt, ##__VA_ARGS__)
> -/* NOTE: this is deprecated in favor of pr_notice_once(). */
> +/* NOTE: this is deprecated in favor of drm_notice_once(NULL, ...). */
>  #define DRM_NOTE_ONCE(fmt, ...)						\
>  	_DRM_PRINTK(_once, NOTICE, fmt, ##__VA_ARGS__)
> -/* NOTE: this is deprecated in favor of pr_warn_once(). */
> +/* NOTE: this is deprecated in favor of drm_warn_once(NULL, ...). */
>  #define DRM_WARN_ONCE(fmt, ...)						\
>  	_DRM_PRINTK(_once, WARNING, fmt, ##__VA_ARGS__)
>  
> -/* NOTE: this is deprecated in favor of pr_err(). */
> +/* NOTE: this is deprecated in favor of drm_err(NULL, ...). */
>  #define DRM_ERROR(fmt, ...)						\
>  	__drm_err(fmt, ##__VA_ARGS__)
>  
> -/* NOTE: this is deprecated in favor of pr_err_ratelimited(). */
> +/* NOTE: this is deprecated in favor of drm_err_ratelimited(NULL, ...). */
>  #define DRM_ERROR_RATELIMITED(fmt, ...)					\
>  	DRM_DEV_ERROR_RATELIMITED(NULL, fmt, ##__VA_ARGS__)
>  
> @@ -593,13 +652,14 @@ void __drm_err(const char *format, ...);
>  #define DRM_DEBUG_DP(fmt, ...)						\
>  	__drm_dbg(DRM_UT_DP, fmt, ## __VA_ARGS__)
>  
> -#define __DRM_DEFINE_DBG_RATELIMITED(category, drm, fmt, ...)					\
> -({												\
> -	static DEFINE_RATELIMIT_STATE(rs_, DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST);\
> -	const struct drm_device *drm_ = (drm);							\
> -												\
> -	if (drm_debug_enabled(DRM_UT_ ## category) && __ratelimit(&rs_))			\
> -		drm_dev_printk(drm_ ? drm_->dev : NULL, KERN_DEBUG, fmt, ## __VA_ARGS__);	\
> +#define __DRM_DEFINE_DBG_RATELIMITED(category, drm, fmt, ...)		\
> +({									\
> +	static DEFINE_RATELIMIT_STATE(rs_, DEFAULT_RATELIMIT_INTERVAL,	\
> +				      DEFAULT_RATELIMIT_BURST);		\
> +									\
> +	if (drm_debug_enabled(DRM_UT_ ## category) && __ratelimit(&rs_))\
> +		drm_dev_printk(__get_dev_ptr(drm), KERN_DEBUG,		\
> +			       fmt, ## __VA_ARGS__);			\
>  })
>  
>  #define drm_dbg_kms_ratelimited(drm, fmt, ...) \

-- 
Jani Nikula, Intel Open Source Graphics Center
