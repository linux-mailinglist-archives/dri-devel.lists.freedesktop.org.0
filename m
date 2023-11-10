Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6987E7C3A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 13:40:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185A410E9AE;
	Fri, 10 Nov 2023 12:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2733110E9AE
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 12:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699620022; x=1731156022;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=xnyIm+fQjLg/fO6Q0zDASsxnekJ3VS1XKgWrQIqrhMM=;
 b=L5hPAROBEeWd5SRE2fvFU32HefD1HL72GLUNPw8OzYrvOae0OdpbD71a
 TmqpyAP8710v7jWs0EmtjfMkWz4QYl3X/F4rVucsWVWolLR3fg/M3lVNU
 XiYlsmpqYFPCEWqorWFOfMrMSsAYMX9E5u3+5uSbuJCzMvy0qlkooyFIX
 0Wl/qqEbhKSNVrMC91d1UbjxzpzoRWQ8Mynha7HqMv9ntE7DouMuHjjqZ
 tzej0HicU0gH3GOFcw+oGXAgtj3s/b9AOCIZ2x6XcPoREC5FHw6WnXYVh
 qGxHhEo6HuTN70zQs9y8hOyNEdFM9YB3ux2Yy8qJZC7qQ9zR3AjsDaeD3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="389983219"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="389983219"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 04:40:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="757190669"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="757190669"
Received: from ruehl-mobl.ger.corp.intel.com (HELO localhost) ([10.252.53.12])
 by orsmga007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 04:40:19 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Luben Tuikov <ltuikov89@gmail.com>, Direct Rendering Infrastructure -
 Development <dri-devel@lists.freedesktop.org>, Danilo Krummrich
 <dakr@redhat.com>
Subject: Re: [PATCH] drm/sched: Define pr_fmt() for DRM using pr_*()
In-Reply-To: <20231110002659.113208-2-ltuikov89@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231110002659.113208-2-ltuikov89@gmail.com>
Date: Fri, 10 Nov 2023 14:40:14 +0200
Message-ID: <878r75wzm9.fsf@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Luben Tuikov <ltuikov89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 09 Nov 2023, Luben Tuikov <ltuikov89@gmail.com> wrote:
> Define pr_fmt() as "[drm] " for DRM code using pr_*() facilities, especially
> when no devices are available. This makes it easier to browse kernel logs.

Please do not merge patches before people have actually had a chance to
look at them. This was merged *way* too quickly.

This does not do what you think it does, and it's not robust enough.

The drm_print.[ch] facilities use very few pr_*() calls directly. The
users of pr_*() calls do not necessarily include <drm/drm_print.h> at
all, and really don't have to.

Even the ones that do include it, usually have <linux/...> includes
first, and <drm/...> includes next. Notably, <linux/kernel.h> includes
<linux/printk.h>.

And, of course, <linux/printk.h> defines pr_fmt() itself if not already
defined.

> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
> ---
>  include/drm/drm_print.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index a93a387f8a1a15..e8fe60d0eb8783 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -26,6 +26,20 @@
>  #ifndef DRM_PRINT_H_
>  #define DRM_PRINT_H_
>  
> +/* Define this before including linux/printk.h, so that the format
> + * string in pr_*() macros is correctly set for DRM. If a file wants
> + * to define this to something else, it should do so before including
> + * this header file.

The only way this would work is by including <drm/drm_print.h> as the
very first header, and that's fragile at best.

> + *
> + * It is encouraged code using pr_err() to prefix their format with
> + * the string "*ERROR* ", to make it easier to scan kernel logs. For
> + * instance,
> + *   pr_err("*ERROR* <the rest of your format string here>", args).

No, it's encouraged not to use pr_*() at all, and prefer drm device
based logging, or device based logging.

I'd rather this whole thing was just reverted.

BR,
Jani.

> + */
> +#ifndef pr_fmt
> +#define pr_fmt(fmt) "[drm] " fmt
> +#endif
> +
>  #include <linux/compiler.h>
>  #include <linux/printk.h>
>  #include <linux/seq_file.h>
>
> base-commit: f3123c2590005c5ff631653d31428e40cd10c618

-- 
Jani Nikula, Intel
