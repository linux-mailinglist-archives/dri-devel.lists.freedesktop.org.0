Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9740C8454C5
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 11:04:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E604C10E5A3;
	Thu,  1 Feb 2024 10:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D820F10E5A3
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 10:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706781863; x=1738317863;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=KdgUCk8gXka/4nZtIoc5a4Qez4+qKNQZz5DWDBkPpJ4=;
 b=CJiMwpRlYB/n3CJtQVCpWpvQ/gEQM2Ct9uczw00bFhQenPvojazGzd4/
 5xAQNvaeFxxVaoRt7ufF7Y/TKCI/p8EixCopwg39X2MbsvLiYpVr3o+zl
 77bYZY0dPQUCELb7ldD5OBMM7ABnoJRhbtsPR7Z8CYXbaZNvOUIBl4Cuz
 Oimymr4zWtl2xC1Fs1ggdFn7SJLDBI2PcoVoceMRmgz3hpV1o5rSD6U9s
 355gbC93l0E0vjcOK7nehayrUv7cCI+Nf8kcJUUvLxTg5Wf0a5bSdhlRl
 iK1PucHFrVKu6qI500KgO6AQArwZOu6Qa1KsBbfc9wld3EHVcekJihQ2n A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="400992751"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="400992751"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 02:04:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="23070696"
Received: from aragners-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.43.111])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 02:04:21 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Cong Liu <liucong2@kylinos.cn>, Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] fbdev/sh_mobile_lcdcfb: Replace deprecated
 simple_strtol with kstrtol
In-Reply-To: <20240201070127.3290465-1-liucong2@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240201070127.3290465-1-liucong2@kylinos.cn>
Date: Thu, 01 Feb 2024 12:04:18 +0200
Message-ID: <87a5okh55p.fsf@intel.com>
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
Cc: linux-fbdev@vger.kernel.org, Cong Liu <liucong2@kylinos.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 01 Feb 2024, Cong Liu <liucong2@kylinos.cn> wrote:
> This patch replaces the use of the deprecated simple_strtol [1] function
> in the sh_mobile_lcdcfb.c file with the recommended kstrtol function.
> This change improves error handling and boundary checks.
>
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#simple-strtol-simple-strtoll-simple-strtoul-simple-strtoull
>
> Signed-off-by: Cong Liu <liucong2@kylinos.cn>

This is completely wrong, and obviously not tested at all.

The recommended replacements are *not* drop-in replacements. Look into
the documentation of the functions.

BR,
Jani.

> ---
>  drivers/video/fbdev/sh_mobile_lcdcfb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
> index eb2297b37504..5fc7d74b273e 100644
> --- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
> +++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
> @@ -1278,11 +1278,11 @@ overlay_position_store(struct device *dev, struct device_attribute *attr,
>  	int pos_x;
>  	int pos_y;
>  
> -	pos_x = simple_strtol(buf, &endp, 10);
> +	pos_x = kstrtol(buf, &endp, 10);
>  	if (*endp != ',')
>  		return -EINVAL;
>  
> -	pos_y = simple_strtol(endp + 1, &endp, 10);
> +	pos_y = kstrtol(endp + 1, &endp, 10);
>  	if (isspace(*endp))
>  		endp++;

-- 
Jani Nikula, Intel
