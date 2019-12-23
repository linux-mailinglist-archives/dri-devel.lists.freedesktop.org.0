Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 155E81294FD
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 12:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6B96E03A;
	Mon, 23 Dec 2019 11:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 676F06E03A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 11:29:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Dec 2019 03:29:23 -0800
X-IronPort-AV: E=Sophos;i="5.69,347,1571727600"; d="scan'208";a="211527648"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Dec 2019 03:29:21 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 6/8] drm/print: add drm_dev_* logging functions
In-Reply-To: <20191221095553.13332-7-sam@ravnborg.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191221095553.13332-1-sam@ravnborg.org>
 <20191221095553.13332-7-sam@ravnborg.org>
Date: Mon, 23 Dec 2019 13:29:19 +0200
Message-ID: <87r20vuvow.fsf@intel.com>
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
Cc: Joe Perches <joe@perches.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 21 Dec 2019, Sam Ravnborg <sam@ravnborg.org> wrote:
> There are a lot of cases where we have a device * but no drm_device *.
> Add drm_dev_* variants of the logging functions to cover these cases.

So I know there are some valid cases where we only have struct device *,
and instead of passing struct drm_device * will need the distinction
between multiple struct device *.

Not all current uses of DRM_DEV_* meet that criteria, however. I think
I'd like to have those converted over to the drm_device based logging
first, and then see what's left. Because I fear adding these will just
lead to mass conversion from DRM_DEV_* to drm_dev_*, and the ball gets
dropped there.

I feel a bit similar about the drm_pr_* logging functions. I want to
promote switching to drm_device based logging, not switching to the same
old thing with just new names.

BR,
Jani.


>
> Include brief documentation.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  include/drm/drm_print.h | 99 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 98 insertions(+), 1 deletion(-)
>
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 7c0b93e6cb80..b2e5d0209010 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -337,7 +337,50 @@ static inline struct drm_printer drm_err_printer(const char *prefix)
>   *
>   * Logging when a &device * is available, but no &drm_device *
>   * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> - * TODO
> + *
> + * Adding a device pointer (if no &drm_device * is available) is always a good
> + * idea as it add more information in the logging message thus making it easier
> + * to determine the source of the logging.
> + *
> + * All logging functions in this block share the same prototype:
> + *
> + * .. code-block:: c
> + *
> + *   void drm_dev_xxx(struct device *, char * fmt, ...)
> + *
> + * The following functions are available:
> + *
> + * .. code-block:: none
> + *
> + *   # Plain logging
> + *   drm_dev_dbg()
> + *   drm_dev_info()
> + *   drm_dev_notice()
> + *   drm_dev_warn()
> + *   drm_dev_err()
> + *
> + *   # Log only once
> + *   drm_dev_info_once()
> + *   drm_dev_notice_once()
> + *   drm_dev_warn_once()
> + *   drm_dev_err_once()
> + *
> + *   # Ratelimited - do not flood the logs
> + *   drm_dev_err_ratelimited()
> + *   drm_dev_dbg_ratelimited()
> + *   drm_dev_dbg_kms_ratelimited()
> + *
> + *   # Logging with a specific category
> + *   drm_dev_dbg_core()
> + *   drm_dev_dbg()		# Uses the DRIVER category
> + *   drm_dev_dbg_kms()
> + *   drm_dev_dbg_prime()
> + *   drm_dev_dbg_atomic()
> + *   drm_dev_dbg_vbl()
> + *   drm_dev_dbg_state()
> + *   drm_dev_dbg_lease()
> + *   drm_dev_dbg_dp()
> + *
>   *
>   * Logging when no &device * nor &drm_device * is available
>   * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> @@ -468,6 +511,60 @@ static inline bool drm_debug_enabled(enum drm_debug_category category)
>  #define drm_dbg_dp(drm, fmt, ...)					\
>  	__drm_cat_printk((drm), DRM_UT_DP, fmt, ##__VA_ARGS__)
>  
> +/* struct device based logging. */
> +#define __drm_dev_printk(dev, level, type, fmt, ...)			\
> +	dev_##level##type(dev, "[drm] " fmt, ##__VA_ARGS__)
> +
> +#define __drm_dev_cat_printk(dev, cat, type, fmt, ...)			\
> +({									\
> +	if (drm_debug_enabled(cat))					\
> +		dev_dbg##type((dev), "[drm] " fmt, ##__VA_ARGS__);	\
> +})
> +
> +#define drm_dev_info(dev, fmt, ...)					\
> +	__drm_dev_printk((dev), info,, fmt, ##__VA_ARGS__)
> +#define drm_dev_notice(dev, fmt, ...)					\
> +	__drm_dev_printk((dev), notice,, fmt, ##__VA_ARGS__)
> +#define drm_dev_warn(dev, fmt, ...)					\
> +	__drm_dev_printk((dev), warn,, fmt, ##__VA_ARGS__)
> +#define drm_dev_err(dev, fmt, ...)					\
> +	__drm_dev_printk((dev), err,, "*ERROR* " fmt, ##__VA_ARGS__)
> +
> +#define drm_dev_info_once(dev, fmt, ...)				\
> +	__drm_dev_printk((dev), info, _once, fmt, ##__VA_ARGS__)
> +#define drm_dev_notice_once(dev, fmt, ...)				\
> +	__drm_dev_printk((dev), notice, _once, fmt, ##__VA_ARGS__)
> +#define drm_dev_warn_once(dev, fmt, ...)				\
> +	__drm_dev_printk((dev), warn, _once, fmt, ##__VA_ARGS__)
> +#define drm_dev_err_once(dev, fmt, ...)					\
> +	__drm_dev_printk((dev), err, _once, "*ERROR* " fmt, ##__VA_ARGS__)
> +
> +#define drm_dev_err_ratelimited(dev, fmt, ...)				\
> +	__drm_dev_printk((dev), err, _ratelimited, "*ERROR* " fmt, ##__VA_ARGS__)
> +#define drm_dev_dbg_ratelimited(dev, fmt, ...)				\
> +	__drm_dev_cat_printk((dev), DRM_UT_DRIVER,_ratelimited, fmt, ##__VA_ARGS__)
> +#define drm_dev_dbg_kms_ratelimited(dev, fmt, ...)			\
> +	__drm_dev_cat_printk((dev), DRM_UT_KMS,_ratelimited, fmt, ##__VA_ARGS__)
> +
> +#define drm_dev_dbg_core(dev, fmt, ...)					\
> +	__drm_dev_cat_printk((dev), DRM_UT_CORE,, fmt, ##__VA_ARGS__)
> +#define drm_dev_dbg(dev, fmt, ...)					\
> +	__drm_dev_cat_printk((dev), DRM_UT_DRIVER,, fmt, ##__VA_ARGS__)
> +#define drm_dev_dbg_kms(dev, fmt, ...)					\
> +	__drm_dev_cat_printk((dev), DRM_UT_KMS,, fmt, ##__VA_ARGS__)
> +#define drm_dev_dbg_prime(dev, fmt, ...)				\
> +	__drm_dev_cat_printk((dev), DRM_UT_PRIME,, fmt, ##__VA_ARGS__)
> +#define drm_dev_dbg_atomic(dev, fmt, ...)				\
> +	__drm_dev_cat_printk((dev), DRM_UT_ATOMIC,, fmt, ##__VA_ARGS__)
> +#define drm_dev_dbg_vbl(dev, fmt, ...)					\
> +	__drm_dev_cat_printk((dev), DRM_UT_VBL,, fmt, ##__VA_ARGS__)
> +#define drm_dev_dbg_state(dev, fmt, ...)				\
> +	__drm_dev_cat_printk((dev), DRM_UT_STATE,, fmt, ##__VA_ARGS__)
> +#define drm_dev_dbg_lease(dev, fmt, ...)				\
> +	__drm_dev_cat_printk((dev), DRM_UT_LEASE,, fmt, ##__VA_ARGS__)
> +#define drm_dev_dbg_dp(dev, fmt, ...)					\
> +	__drm_dev_cat_printk((dev), DRM_UT_DP,, fmt, ##__VA_ARGS__)
> +
>  /*
>   * LEGACY logging support - do not use in new code
>   */

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
