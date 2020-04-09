Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 306801A3C2A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 23:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5316EC2A;
	Thu,  9 Apr 2020 21:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8CBC6EC2A;
 Thu,  9 Apr 2020 21:58:23 +0000 (UTC)
IronPort-SDR: I0SvzK11s3il3/brROHn9JYNWetaWC0H9u2Wwj6U2qO3eSk71A0tr8LWyBzqEabnoyv0Sou4rv
 Ye0q6jS1xiBg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2020 14:58:23 -0700
IronPort-SDR: D0pm5353ktocpv3kpo6A6WHysf3MP6G8D5ge3b2t4SECFo5NL7i7GSNW6qc7EkQ/UyECLinL/P
 sDP9uCGUF1yA==
X-IronPort-AV: E=Sophos;i="5.72,364,1580803200"; d="scan'208";a="425675703"
Received: from ashakhno-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.61.38])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2020 14:58:18 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/i915: remove gvt/Makefile
In-Reply-To: <20200409150627.29205-2-masahiroy@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200409150627.29205-1-masahiroy@kernel.org>
 <20200409150627.29205-2-masahiroy@kernel.org>
Date: Fri, 10 Apr 2020 00:58:16 +0300
Message-ID: <87h7xsgw3r.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, Masahiro Yamada <masahiroy@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 Apr 2020, Masahiro Yamada <masahiroy@kernel.org> wrote:
> Including subdirectory Makefile from the driver main Makefile does not
> buy us much because this is not real isolation.

The isolation it does buy us is that gvt/ subdirectory is developed and
maintained on a separate mailing list and separate git repo. I think at
some point there were plans to make it an actual module too.

So while you could quip about Conway's law here, I think it might be
better to keep this as it is.

Zhenyu, Zhi, what do you think?


BR,
Jani.


>
> Having a single Makefile at the top of the module is clearer, and
> it is what this driver almost does.
>
> Move all gvt objects to the i915 main Makefile.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  drivers/gpu/drm/i915/Makefile     | 28 ++++++++++++++++++++++++----
>  drivers/gpu/drm/i915/gvt/Makefile |  8 --------
>  2 files changed, 24 insertions(+), 12 deletions(-)
>  delete mode 100644 drivers/gpu/drm/i915/gvt/Makefile
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 6cd1f6253814..74e965882a98 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -275,10 +275,30 @@ i915-$(CONFIG_DRM_I915_SELFTEST) += \
>  # virtual gpu code
>  i915-y += i915_vgpu.o
>  
> -ifeq ($(CONFIG_DRM_I915_GVT),y)
> -i915-y += intel_gvt.o
> -include $(src)/gvt/Makefile
> -endif
> +i915-$(CONFIG_DRM_I915_GVT) += \
> +	intel_gvt.o \
> +	gvt/gvt.o \
> +	gvt/aperture_gm.o \
> +	gvt/handlers.o \
> +	gvt/vgpu.o \
> +	gvt/trace_points.o \
> +	gvt/firmware.o \
> +	gvt/interrupt.o \
> +	gvt/gtt.o \
> +	gvt/cfg_space.o \
> +	gvt/opregion.o \
> +	gvt/mmio.o \
> +	gvt/display.o \
> +	gvt/edid.o \
> +	gvt/execlist.o \
> +	gvt/scheduler.o \
> +	gvt/sched_policy.o \
> +	gvt/mmio_context.o \
> +	gvt/cmd_parser.o \
> +	gvt/debugfs.o \
> +	gvt/fb_decoder.o \
> +	gvt/dmabuf.o \
> +	gvt/page_track.o
>  
>  obj-$(CONFIG_DRM_I915) += i915.o
>  obj-$(CONFIG_DRM_I915_GVT_KVMGT) += gvt/kvmgt.o
> diff --git a/drivers/gpu/drm/i915/gvt/Makefile b/drivers/gpu/drm/i915/gvt/Makefile
> deleted file mode 100644
> index 4d70f4689479..000000000000
> --- a/drivers/gpu/drm/i915/gvt/Makefile
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0
> -GVT_DIR := gvt
> -GVT_SOURCE := gvt.o aperture_gm.o handlers.o vgpu.o trace_points.o firmware.o \
> -	interrupt.o gtt.o cfg_space.o opregion.o mmio.o display.o edid.o \
> -	execlist.o scheduler.o sched_policy.o mmio_context.o cmd_parser.o debugfs.o \
> -	fb_decoder.o dmabuf.o page_track.o
> -
> -i915-y					+= $(addprefix $(GVT_DIR)/, $(GVT_SOURCE))

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
