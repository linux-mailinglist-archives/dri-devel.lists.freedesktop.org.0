Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE200517313
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 17:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E66510EEF9;
	Mon,  2 May 2022 15:41:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44BFF10EEF9
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 15:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651506106; x=1683042106;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=9Es5XqFtpVE3LdYUHq79mdDv756yQwrZat3r/qgRHNc=;
 b=As911dw3FJ4XCUXVbTwYDRzrsF7LBM2CsrhxjUsgf6hHw6OlWdkmrqFJ
 cPw8UajKCAa/JDwBgFm3CgayzCepkNo1jEO0wBg0UPFAmRbQ7jdIwBfjv
 e2a+ODINejzhqJD3gYFsJ/klAwwXUJWyqWH8oH0NW6a/Sn1YXoR38voE+
 xKi4ZbrlkEn6ZVAlpRfQZYGGiUYujSfzB7JpqnpA8i6Tf8ExN94dr7r7L
 1NZjiWxYgC5OoOhjv73po0Qzx2DslSpALj5R654a+vvhpndDuuBNZcHJM
 SZ4O2SQI1tPT8VSPSMu+H5Si0ZMVOkdx3ewYLuR3QIHXOp/DukgHCbjYk w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="353673691"
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="353673691"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 08:41:45 -0700
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="583756662"
Received: from wagoleb-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.155.30])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 08:41:42 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Subject: Re: [PATCH] drm: drm_gem.h: Add explicit includes for
 DEFINE_DRM_GEM_FOPS
In-Reply-To: <1651262112-29664-1-git-send-email-quic_jhugo@quicinc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1651262112-29664-1-git-send-email-quic_jhugo@quicinc.com>
Date: Mon, 02 May 2022 18:41:39 +0300
Message-ID: <87y1zkq6vg.fsf@intel.com>
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 29 Apr 2022, Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
> DEFINE_DRM_GEM_FOPS() references drm functions from other headers.  For
> example drm_open() is defined in drm_file.h and drm_ioctl() is defined
> in drm_ioctl.h.  Since drm_gem.h doesn't include these headers, it
> relies on an implicit include from the .c file to have included these
> required headers before DEFINE_DRM_GEM_FOPS() gets used.  Relying on
> these implicit includes can cause build failures for new code that
> doesn't know about these requirements, and can lead to future problems
> if the headers ever get restructured as there will be a need to update
> every downstream file that includes drm_gem.h.
>
> Lets fix this explicitly including the required headers in drm_gem.h so
> that code that includes drm_gem.h does not need to worry about these
> implicit dependencies.

In the general case, I tend to agree, but in this specific instance I
think I'd err on the side of fewer includes. I think the more likely
outcome here is accumulating implicit dependencies on symbols from
drm_file.h and drm_ioctl.h by including drm_gem.h only!

I do think headers need to be self-contained, and we actually enforce
this in i915 (see HDRTEST in drivers/gpu/drm/i915/Makefile), but not to
the point of macro expansions.

BR,
Jani.



>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  include/drm/drm_gem.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 9d7c61a..1cbe3d8 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -37,6 +37,8 @@
>  #include <linux/kref.h>
>  #include <linux/dma-resv.h>
>  
> +#include <drm/drm_file.h>
> +#include <drm/drm_ioctl.h>
>  #include <drm/drm_vma_manager.h>
>  
>  struct iosys_map;

-- 
Jani Nikula, Intel Open Source Graphics Center
