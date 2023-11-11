Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 363107E8AB2
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 12:33:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE35F10E27E;
	Sat, 11 Nov 2023 11:33:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A64BF10E27E
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 11:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699702427; x=1731238427;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=fQD/oqu5OcK1UU8xk7iEK2AaaP6OU77DWfMuqW2r9DQ=;
 b=gqp6xwIeWtIWOT8S8PasZYYdia2sE2oI50yX0H3l+x9K6GFL/IMZZOpU
 S3B3a0HaKYmIPi8IjTiNnMiBVUQr+Rnmlm/sckFZSvwM7bwDYh/8aALtM
 9oN+SjZOdOHOPkirjMoAyXFziORZPY4w5FtHWindPotlaSWbtOdFiRL0W
 gOoIK0gV7mr8ij8recPc2mi65VfXwXPKiJxJ8h274WwTDnT3K/2gEJeMJ
 wdvnzbwKRnReSVuG+Gd6e0ZVA447WtmwbGSk9afwp3CxBFeUV6R2s1Ts/
 SQLwJDt4y2n9rnoJ0ywyYoOLy7bSJ5UluxQ+6AbzgaJV7ims+TTJB/tvT A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="389134214"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; d="scan'208";a="389134214"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2023 03:33:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="1011144238"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; d="scan'208";a="1011144238"
Received: from sschumil-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.54.111])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2023 03:33:45 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Luben Tuikov <ltuikov89@gmail.com>, javierm@redhat.com
Subject: Re: [PATCH] Revert "drm/sched: Define pr_fmt() for DRM using pr_*()"
In-Reply-To: <20231111083327.18607-2-ltuikov89@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <87leb4ae6z.fsf@minerva.mail-host-address-is-not-set>
 <20231111083327.18607-2-ltuikov89@gmail.com>
Date: Sat, 11 Nov 2023 13:33:43 +0200
Message-ID: <87y1f4v814.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, ltuikov89@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 11 Nov 2023, Luben Tuikov <ltuikov89@gmail.com> wrote:
> From Jani:
> The drm_print.[ch] facilities use very few pr_*() calls directly. The
> users of pr_*() calls do not necessarily include <drm/drm_print.h> at
> all, and really don't have to.
>
> Even the ones that do include it, usually have <linux/...> includes
> first, and <drm/...> includes next. Notably, <linux/kernel.h> includes
> <linux/printk.h>.
>
> And, of course, <linux/printk.h> defines pr_fmt() itself if not already
> defined.
>
> No, it's encouraged not to use pr_*() at all, and prefer drm device
> based logging, or device based logging.
>
> This reverts commit 36245bd02e88e68ac5955c2958c968879d7b75a9.
>
> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
> Link: https://patchwork.freedesktop.org/patch/msgid/878r75wzm9.fsf@intel.com

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  include/drm/drm_print.h | 14 --------------
>  1 file changed, 14 deletions(-)
>
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index e8fe60d0eb8783..a93a387f8a1a15 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -26,20 +26,6 @@
>  #ifndef DRM_PRINT_H_
>  #define DRM_PRINT_H_
>  
> -/* Define this before including linux/printk.h, so that the format
> - * string in pr_*() macros is correctly set for DRM. If a file wants
> - * to define this to something else, it should do so before including
> - * this header file.
> - *
> - * It is encouraged code using pr_err() to prefix their format with
> - * the string "*ERROR* ", to make it easier to scan kernel logs. For
> - * instance,
> - *   pr_err("*ERROR* <the rest of your format string here>", args).
> - */
> -#ifndef pr_fmt
> -#define pr_fmt(fmt) "[drm] " fmt
> -#endif
> -
>  #include <linux/compiler.h>
>  #include <linux/printk.h>
>  #include <linux/seq_file.h>
>
> base-commit: 540527b1385fb203cc4513ca838b4de60bbbc49a

-- 
Jani Nikula, Intel
