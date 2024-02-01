Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F268454E5
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 11:10:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC6010E62D;
	Thu,  1 Feb 2024 10:10:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 425 seconds by postgrey-1.36 at gabe;
 Thu, 01 Feb 2024 10:10:28 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE3310E62D
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 10:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706782228; x=1738318228;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=SMbbGGWUmvD7XTGC4Ymv5iB6mMaT4d+KU3zA8ododTc=;
 b=QHUT4v6Siw1Nb/jlOAZpFgmgSBnLexMMY5co7oqaQY+dAKazUoK1/4Jr
 DaEeS/ilNIQLRPh5IesmCRes/ClRH7HGsFK2qUZLqIEn6nMkQZp1sodr7
 Fpix9QAPC5BwI4g7EWqaZ7nei7c3VFiP+6jAFThJAoq1XfVsDKLr2bSvm
 p6PZXeqEc+WaVMQtFHjBaMDin+bzvPNR5KItB+GeORK16d2VdqoGwJVdF
 OsIhqS5ot0/+GgRAwddjeU+gUrXf0kkVebjQFbzp0qXCLLxFjrmvatwJx
 kKQVqMaGIFuWFyNRuFCwSLyANPA7fySTkpz9ydnwGAqrLkXfb5Rfs797t g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="41747"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="41747"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 02:03:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="42236"
Received: from aragners-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.43.111])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 02:03:18 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Cong Liu <liucong2@kylinos.cn>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/modes: Replace deprecated simple_strtol with kstrtol
In-Reply-To: <20240201070226.3292315-1-liucong2@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240201070226.3292315-1-liucong2@kylinos.cn>
Date: Thu, 01 Feb 2024 12:03:15 +0200
Message-ID: <87frych57g.fsf@intel.com>
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
Cc: Cong Liu <liucong2@kylinos.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 01 Feb 2024, Cong Liu <liucong2@kylinos.cn> wrote:
> This patch replaces the use of the deprecated simple_strtol [1] function
> in the drm_modes.c file with the recommended kstrtol function. This change
> improves error handling and boundary checks.
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
>  drivers/gpu/drm/drm_modes.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index 893f52ee4926..fce0fb1df9b2 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -1942,7 +1942,7 @@ static int drm_mode_parse_cmdline_bpp(const char *str, char **end_ptr,
>  		return -EINVAL;
>  
>  	str++;
> -	bpp = simple_strtol(str, end_ptr, 10);
> +	bpp = kstrtol(str, end_ptr, 10);
>  	if (*end_ptr == str)
>  		return -EINVAL;
>  
> @@ -1961,7 +1961,7 @@ static int drm_mode_parse_cmdline_refresh(const char *str, char **end_ptr,
>  		return -EINVAL;
>  
>  	str++;
> -	refresh = simple_strtol(str, end_ptr, 10);
> +	refresh = kstrtol(str, end_ptr, 10);
>  	if (*end_ptr == str)
>  		return -EINVAL;
>  
> @@ -2033,7 +2033,7 @@ static int drm_mode_parse_cmdline_res_mode(const char *str, unsigned int length,
>  	int remaining, i;
>  	char *end_ptr;
>  
> -	xres = simple_strtol(str, &end_ptr, 10);
> +	xres = kstrtol(str, &end_ptr, 10);
>  	if (end_ptr == str)
>  		return -EINVAL;
>  
> @@ -2042,7 +2042,7 @@ static int drm_mode_parse_cmdline_res_mode(const char *str, unsigned int length,
>  	end_ptr++;
>  
>  	str = end_ptr;
> -	yres = simple_strtol(str, &end_ptr, 10);
> +	yres = kstrtol(str, &end_ptr, 10);
>  	if (end_ptr == str)
>  		return -EINVAL;
>  
> @@ -2100,7 +2100,7 @@ static int drm_mode_parse_cmdline_int(const char *delim, unsigned int *int_ret)
>  		return -EINVAL;
>  
>  	value = delim + 1;
> -	*int_ret = simple_strtol(value, &endp, 10);
> +	*int_ret = kstrtol(value, &endp, 10);
>  
>  	/* Make sure we have parsed something */
>  	if (endp == value)

-- 
Jani Nikula, Intel
