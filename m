Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 332081294E3
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 12:16:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 181C06E25E;
	Mon, 23 Dec 2019 11:16:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D326E25E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 11:16:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Dec 2019 03:16:06 -0800
X-IronPort-AV: E=Sophos;i="5.69,347,1571727600"; d="scan'208";a="211525045"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Dec 2019 03:16:04 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 3/8] drm/print: add new logging helper for drm logging
In-Reply-To: <20191221095553.13332-4-sam@ravnborg.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191221095553.13332-1-sam@ravnborg.org>
 <20191221095553.13332-4-sam@ravnborg.org>
Date: Mon, 23 Dec 2019 13:16:01 +0200
Message-ID: <8736dbwavi.fsf@intel.com>
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
> Add new helper so logging can use the standard logging
> functions without an extra helper function.

The main functional change here is that this will no longer print the
function names in the debug logs. I am not sure if we want to make that
change.

BR,
Jani.

>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  include/drm/drm_print.h | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
>
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index d2b9ac6a6e18..c1d333bb7534 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -403,10 +403,15 @@ static inline bool drm_debug_enabled(enum drm_debug_category category)
>   * Prefer drm_device based logging over device or printk based logging.
>   */
>  
> -/* Helper for struct drm_device based logging. */
> +/* Helpers for struct drm_device based logging. */
>  #define __drm_printk(drm, level, type, fmt, ...)			\
>  	dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
>  
> +#define __drm_cat_printk(drm, cat, fmt, ...)				\
> +({									\
> +	if (drm_debug_enabled(cat))					\
> +		dev_dbg((drm)->dev, "[drm] " fmt, ##__VA_ARGS__);	\
> +})
>  
>  #define drm_info(drm, fmt, ...)						\
>  	__drm_printk((drm), info,, fmt, ##__VA_ARGS__)
> @@ -430,24 +435,23 @@ static inline bool drm_debug_enabled(enum drm_debug_category category)
>  	__drm_printk((drm), err, _ratelimited, "*ERROR* " fmt, ##__VA_ARGS__)
>  
>  #define drm_dbg_core(drm, fmt, ...)					\
> -	drm_dev_dbg((drm)->dev, DRM_UT_CORE, fmt, ##__VA_ARGS__)
> +	__drm_cat_printk((drm), DRM_UT_CORE, fmt, ##__VA_ARGS__)
>  #define drm_dbg(drm, fmt, ...)						\
> -	drm_dev_dbg((drm)->dev, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
> +	__drm_cat_printk((drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
>  #define drm_dbg_kms(drm, fmt, ...)					\
> -	drm_dev_dbg((drm)->dev, DRM_UT_KMS, fmt, ##__VA_ARGS__)
> +	__drm_cat_printk((drm), DRM_UT_KMS, fmt, ##__VA_ARGS__)
>  #define drm_dbg_prime(drm, fmt, ...)					\
> -	drm_dev_dbg((drm)->dev, DRM_UT_PRIME, fmt, ##__VA_ARGS__)
> +	__drm_cat_printk((drm), DRM_UT_PRIME, fmt, ##__VA_ARGS__)
>  #define drm_dbg_atomic(drm, fmt, ...)					\
> -	drm_dev_dbg((drm)->dev, DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
> +	__drm_cat_printk((drm), DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
>  #define drm_dbg_vbl(drm, fmt, ...)					\
> -	drm_dev_dbg((drm)->dev, DRM_UT_VBL, fmt, ##__VA_ARGS__)
> +	__drm_cat_printk((drm), DRM_UT_VBL, fmt, ##__VA_ARGS__)
>  #define drm_dbg_state(drm, fmt, ...)					\
> -	drm_dev_dbg((drm)->dev, DRM_UT_STATE, fmt, ##__VA_ARGS__)
> +	__drm_cat_printk((drm), DRM_UT_STATE, fmt, ##__VA_ARGS__)
>  #define drm_dbg_lease(drm, fmt, ...)					\
> -	drm_dev_dbg((drm)->dev, DRM_UT_LEASE, fmt, ##__VA_ARGS__)
> +	__drm_cat_printk((drm), DRM_UT_LEASE, fmt, ##__VA_ARGS__)
>  #define drm_dbg_dp(drm, fmt, ...)					\
> -	drm_dev_dbg((drm)->dev, DRM_UT_DP, fmt, ##__VA_ARGS__)
> -
> +	__drm_cat_printk((drm), DRM_UT_DP, fmt, ##__VA_ARGS__)
>  
>  /*
>   * LEGACY logging support - do not use in new code

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
