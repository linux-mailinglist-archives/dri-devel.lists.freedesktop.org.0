Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B2D4F8D41
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 07:18:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E13910F620;
	Fri,  8 Apr 2022 05:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E85210F620;
 Fri,  8 Apr 2022 05:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649395081; x=1680931081;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=YSQDheq8XtVc5EpwvzKy5YTKtqdFPn8eorhRrePjleA=;
 b=gPh5cW7FQa6xiHa21m/ulU5Lc5IxYMEhWbFKOMz2xAFcKOqw8q+oR4l3
 6SxSLH5XzcB9OEGrjafYMJS0yfgLJ5V5bQpdE9wd5vuExT+YD5dHSCrGU
 4vYaO10Jeo6+Fs7RLoDSKsyoXYjDTqVBxZp2TMNWJZ9gczt8whsozOtfm
 OUSjR9s6tgeNk1g2zEY2BdnXSDXC9RedqRmG360G5JDoJitYofpPPvJyM
 BbZutpWhotMxKIrUx3g5RNAQoRRndd1yJ1GrvEgWyNVLgK9eHdbEiVY3S
 2pTUGPUqBTEAaCRdo1NB9psTBxzn0/PSO1nCIsSgF4NAZ9LDpmuJg1K28 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="260346967"
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="260346967"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 22:18:00 -0700
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="589097177"
Received: from aalkukhu-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.172.187])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 22:18:00 -0700
Date: Thu, 7 Apr 2022 22:18:00 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Sunset igpu legacy mmap support
 based on GRAPHICS_VER_FULL
Message-ID: <20220408051800.3gedsqgkjbb7wpc5@ldmartin-desk2>
References: <20220407161839.1073443-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220407161839.1073443-1-matthew.d.roper@intel.com>
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
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 07, 2022 at 09:18:39AM -0700, Matt Roper wrote:
>The intent of the version check in the mmap ioctl was to maintain
>support for existing platforms (i.e., ADL/RPL and earlier), but drop
>support on all future igpu platforms.  As we've seen on the dgpu side,
>the hardware teams are using a more fine-grained numbering system for IP
>version numbers these days, so it's possible the version number
>associated with our next igpu could be some form of "12.xx" rather than
>13 or higher.  Comparing against the full ver.release number will ensure
>the intent of the check is maintained no matter what numbering the
>hardware teams settle on.
>
>Fixes: d3f3baa3562a ("drm/i915: Reinstate the mmap ioctl for some platforms")
>Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/i915/gem/i915_gem_mman.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>index c3ea243d414d..0c5c43852e24 100644
>--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>@@ -70,7 +70,7 @@ i915_gem_mmap_ioctl(struct drm_device *dev, void *data,
> 	 * mmap ioctl is disallowed for all discrete platforms,
> 	 * and for all platforms with GRAPHICS_VER > 12.
> 	 */
>-	if (IS_DGFX(i915) || GRAPHICS_VER(i915) > 12)
>+	if (IS_DGFX(i915) || GRAPHICS_VER_FULL(i915) > IP_VER(12, 0))
> 		return -EOPNOTSUPP;
>
> 	if (args->flags & ~(I915_MMAP_WC))
>-- 
>2.34.1
>
