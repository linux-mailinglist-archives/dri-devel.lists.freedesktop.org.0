Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AF71294F2
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 12:23:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345476E262;
	Mon, 23 Dec 2019 11:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A806E262
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 11:23:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Dec 2019 03:23:08 -0800
X-IronPort-AV: E=Sophos;i="5.69,347,1571727600"; d="scan'208";a="219148947"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Dec 2019 03:23:03 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 1/8] drm/print: document logging functions
In-Reply-To: <20191221095553.13332-2-sam@ravnborg.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191221095553.13332-1-sam@ravnborg.org>
 <20191221095553.13332-2-sam@ravnborg.org>
Date: Mon, 23 Dec 2019 13:23:00 +0200
Message-ID: <87tv5ruvzf.fsf@intel.com>
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
> This is the documentation I have missed when I looked for help
> how to do proper logging. Hopefully it can help others.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  Documentation/gpu/drm-internals.rst |  6 ++
>  include/drm/drm_print.h             | 91 ++++++++++++++++++++++++++---
>  2 files changed, 90 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
> index a73320576ca9..c2093611999c 100644
> --- a/Documentation/gpu/drm-internals.rst
> +++ b/Documentation/gpu/drm-internals.rst
> @@ -164,6 +164,12 @@ File Operations
>  Misc Utilities
>  ==============
>  
> +Logging
> +-------
> +
> +.. kernel-doc:: include/drm/drm_print.h
> +   :doc: logging
> +
>  Printer
>  -------
>  
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 8f99d389792d..e9e31ace0afa 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -250,22 +250,42 @@ static inline struct drm_printer drm_err_printer(const char *prefix)
>  }
>  
>  /**
> - * enum drm_debug_category - The DRM debug categories
> + * DOC: logging
> + *
> + * There is a set of functions/macros available used for logging
> + * in the DRM subsystem.
> + * Using the drm logging function enables that the logging is consistently
> + * prefixed with *[drm]* thus the logging is easy to recognize.
> + *
> + * Example of logging with *[drm]* prefix::
>   *
> - * Each of the DRM debug logging macros use a specific category, and the logging
> - * is filtered by the drm.debug module parameter. This enum specifies the values
> - * for the interface.
> + *   [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> + *   [drm] Driver supports precise vblank timestamp query.
>   *
> - * Each DRM_DEBUG_<CATEGORY> macro logs to DRM_UT_<CATEGORY> category, except
> - * DRM_DEBUG() logs to DRM_UT_CORE.
> + *
> + * Each of the debug logging macros use a specific category, and the logging
> + * is filtered by the drm.debug module parameter. The &drm_debug_category enum
> + * specifies the values for the interface.
> + *
> + * Each drm_dbg_<category> macro logs to a DRM_UT_<category> category,
> + * except drm_dbg() that logs to DRM_UT_DRIVER.
>   *
>   * Enabling verbose debug messages is done through the drm.debug parameter, each
>   * category being enabled by a bit:
>   *
>   *  - drm.debug=0x1 will enable CORE messages
>   *  - drm.debug=0x2 will enable DRIVER messages
> + *  - drm.debug=0x4 will enable KMS messages
> + *  - drm.debug=0x8 will enable PRIME messages
> + *  - drm.debug=0x10 will enable ATOMIC messages
> + *  - drm.debug=0x20 will enable VBL messages
> + *  - drm.debug=0x40 will enable STATE messages
> + *  - drm.debug=0x80 will enable LEASE messages
> + *  - drm.debug=0x100 will enable DP messages

Maybe document this stuff in enum drm_debug_category where they're
defined instead?

BR,
Jani.

> + *
> + * To enable more than one category OR the values - examples:
> + *
>   *  - drm.debug=0x3 will enable CORE and DRIVER messages
> - *  - ...
>   *  - drm.debug=0x1ff will enable all messages
>   *
>   * An interesting feature is that it's possible to enable verbose logging at
> @@ -273,6 +293,63 @@ static inline struct drm_printer drm_err_printer(const char *prefix)
>   *
>   *   # echo 0xf > /sys/module/drm/parameters/debug
>   *
> + *
> + * When a &drm_device * is available use one of the following logging functions.
> + * The same prototype is shared by all the logging functions
> + * that take a &drm_device * as first argument:
> + *
> + * .. code-block:: c
> + *
> + *   void drm_xxx(struct drm_device *, char * fmt, ...)
> + *
> + * Drivers can use the following functions for logging.
> + *
> + * .. code-block:: none
> + *
> + *   # Plain logging
> + *   drm_dbg()
> + *   drm_info()
> + *   drm_notice()
> + *   drm_warn()
> + *   drm_err()
> + *
> + *   # Log only once
> + *   drm_info_once()
> + *   drm_notice_once()
> + *   drm_warn_once()
> + *   drm_err_once()
> + *
> + *   # Ratelimited - do not flood the logs
> + *   drm_err_ratelimited()
> + *
> + *   # Logging with a specific category
> + *   drm_dbg_core()
> + *   drm_dbg()		# Uses the DRIVER category
> + *   drm_dbg_kms()
> + *   drm_dbg_prime()
> + *   drm_dbg_atomic()
> + *   drm_dbg_vbl()
> + *   drm_dbg_state()
> + *   drm_dbg_lease()
> + *   drm_dbg_dp()
> + *
> + * See enum &drm_debug_category for a description of the categories.
> + *
> + * Logging when a &device * is available, but no &drm_device *
> + * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> + * TODO
> + *
> + * Logging when no &device * nor &drm_device * is available
> + * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> + * TODO
> + *
> + * Obsoleted logging functions
> + * ~~~~~~~~~~~~~~~~~~~~~~~~~~~
> + * The DRM_*() logging functions are deprecated - do not use them in new code.
> + */
> +
> +/**
> + * enum drm_debug_category - The DRM debug categories
>   */
>  enum drm_debug_category {
>  	/**

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
