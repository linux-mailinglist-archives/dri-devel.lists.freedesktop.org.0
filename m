Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC3F7EF0DF
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 11:44:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D074810E743;
	Fri, 17 Nov 2023 10:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DAFF10E74D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 10:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700217873; x=1731753873;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ipPoGTvGqA5rXQXVD7IfzLtXbPV/tOcCAeiMi27tEZE=;
 b=SYyS+sQ7mFbZUknDaKgARpRRthQ1tF/Sfvm3yON3aWiP4AHPczAkgBqx
 SJs9+NHw4KoIGKa81DwdZtaHjfsdJE9L9Md2w0CF9DbJqn0s1M3M+vK1B
 qZoO7ZtMlT5YnJnw+2065L/2pPSwqcoVVoKQmKCC/NGuZlZTwCQ+kpXzx
 tZKNVa8XDyRo8Ci3HKosz0mzWOkqrBIxHfVFO/dJYVNSjTyBRD0fnibRN
 BXFo8yjFu5ExmpWI/gNSEwyTHMzslCyudXL7TnOIh2DZPeIB1zgX65NnS
 JV/Wjt2U7UZYXpUNWgtkijvcY7ZIEkXPmqzPAxfZuevrkcXjO+r91xVfm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="388430194"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="388430194"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 02:44:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="769189028"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="769189028"
Received: from guoqingz-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.56.178])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 02:44:15 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Luben Tuikov <ltuikov89@gmail.com>
Subject: Re: [PATCH] drm/print: Handle NULL drm device in __drm_printk()
In-Reply-To: <20231117035427.68125-2-ltuikov89@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231117035427.68125-2-ltuikov89@gmail.com>
Date: Fri, 17 Nov 2023 12:44:11 +0200
Message-ID: <87o7fspslg.fsf@intel.com>
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
Cc: Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>, Luben Tuikov <ltuikov89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Nov 2023, Luben Tuikov <ltuikov89@gmail.com> wrote:
> drm_{err,warn,...}() use __drm_printk() which takes a drm device pointer and
> uses the embedded device pointer to print the device. This facility handles
> NULL device pointer, but not NULL drm device pointer. This patch makes
> __drm_printk() also handle a NULL drm device pointer. The printed output is
> identical to if drm->dev had been NULL.
>
> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  include/drm/drm_print.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index a93a387f8a1a15..dd4883df876a6d 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -453,7 +453,7 @@ void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
>  
>  /* Helper for struct drm_device based logging. */
>  #define __drm_printk(drm, level, type, fmt, ...)			\
> -	dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
> +	dev_##level##type((drm) ? (drm)->dev : NULL, "[drm] " fmt, ##__VA_ARGS__)
>  
>  
>  #define drm_info(drm, fmt, ...)					\
>
> base-commit: 3b434a3445fff3149128db0169da864d67057325

-- 
Jani Nikula, Intel
