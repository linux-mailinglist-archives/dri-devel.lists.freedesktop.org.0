Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7A387800B
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 13:34:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82CCA10E609;
	Mon, 11 Mar 2024 12:33:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U/l8E/8+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F6C010E5F0;
 Mon, 11 Mar 2024 12:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710160437; x=1741696437;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=v4D5CIABTgOMbu/W/o0xzENeSstQWMdIhzGIuGixcOc=;
 b=U/l8E/8+MrEhBFHx5a5rrVm4k53bHjtBZ7uQeRiwTrHsxIANc/yv07cg
 5A+irKFmNeF3jw1gQ/v2Sx/IOJFqbk0uCFTHNhOWCj+Qk0z3gTOEuiIPq
 als85dEINZfLECvT8GDuLNyfli9hhzuTYPWAAOevYfiiwDc6nMqjQHio4
 a3xqm+GkqCO8MX2Gk+yr39RUghZaCf4sh7BwO5mti3ADYZJOAqBtL0GMp
 E2IDGOzz5Gxt6/kGFWqlcvIcY15wK3itxNWi15zO7opaByXAdFxG51v60
 oMwLKzXo/jri+aUD1eN960rSLBTMiTBFUG140KFoQfL3GQ9rfXlXcGDPH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="30256859"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="30256859"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 05:33:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="11572605"
Received: from tbeaumon-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.34.24])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 05:33:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Masahiro
 Yamada <masahiroy@kernel.org>, lucas.demarchi@intel.com
Subject: Re: [PATCH v2 16/16] drm: ensure drm headers are self-contained and
 pass kernel-doc
In-Reply-To: <ba6527a126daeae8e66e1cd64053580645106612.1709898638.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1709898638.git.jani.nikula@intel.com>
 <ba6527a126daeae8e66e1cd64053580645106612.1709898638.git.jani.nikula@intel.com>
Date: Mon, 11 Mar 2024 14:33:48 +0200
Message-ID: <877ci9t0b7.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 08 Mar 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> Ensure drm headers build, are self-contained, have header guards, and
> have no kernel-doc warnings, when CONFIG_DRM_HEADER_TEST=y.
>
> The mechanism follows similar patters used in i915, xe, and usr/include.
>
> To cover include/drm, we need to recurse there using the top level
> Kbuild and the new include/Kbuild files.
>
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Masahiro, ack for merging this?

BR,
Jani.

> ---
>  Kbuild                   |  1 +
>  drivers/gpu/drm/Kconfig  | 11 +++++++++++
>  drivers/gpu/drm/Makefile | 18 ++++++++++++++++++
>  include/Kbuild           |  1 +
>  include/drm/Makefile     | 18 ++++++++++++++++++
>  5 files changed, 49 insertions(+)
>  create mode 100644 include/Kbuild
>  create mode 100644 include/drm/Makefile
>
> diff --git a/Kbuild b/Kbuild
> index 464b34a08f51..f327ca86990c 100644
> --- a/Kbuild
> +++ b/Kbuild
> @@ -97,3 +97,4 @@ obj-$(CONFIG_SAMPLES)	+= samples/
>  obj-$(CONFIG_NET)	+= net/
>  obj-y			+= virt/
>  obj-y			+= $(ARCH_DRIVERS)
> +obj-$(CONFIG_DRM_HEADER_TEST)	+= include/
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index c08e18108c2a..dd17685ef6e7 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -429,3 +429,14 @@ config DRM_WERROR
>  	  this config option is disabled by default.
>  
>  	  If in doubt, say N.
> +
> +config DRM_HEADER_TEST
> +	bool "Ensure DRM headers are self-contained and pass kernel-doc"
> +	depends on EXPERT
> +	default n
> +	help
> +	  Ensure the DRM subsystem headers both under drivers/gpu/drm and
> +	  include/drm compile, are self-contained, have header guards, and have
> +	  no kernel-doc warnings.
> +
> +	  If in doubt, say N.
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index a73c04d2d7a3..6605d5686d01 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -218,3 +218,21 @@ obj-y			+= solomon/
>  obj-$(CONFIG_DRM_SPRD) += sprd/
>  obj-$(CONFIG_DRM_LOONGSON) += loongson/
>  obj-$(CONFIG_DRM_POWERVR) += imagination/
> +
> +# Ensure drm headers are self-contained and pass kernel-doc
> +hdrtest-files := \
> +	$(shell cd $(srctree)/$(src) && find . -maxdepth 1 -name 'drm_*.h') \
> +	$(shell cd $(srctree)/$(src) && find display lib -name '*.h')
> +
> +always-$(CONFIG_DRM_HEADER_TEST) += \
> +	$(patsubst %.h,%.hdrtest, $(hdrtest-files))
> +
> +# Include the header twice to detect missing include guard.
> +quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
> +      cmd_hdrtest = \
> +		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
> +		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_DRM_WERROR),-Werror) $<; \
> +		touch $@
> +
> +$(obj)/%.hdrtest: $(src)/%.h FORCE
> +	$(call if_changed_dep,hdrtest)
> diff --git a/include/Kbuild b/include/Kbuild
> new file mode 100644
> index 000000000000..5e76a599e2dd
> --- /dev/null
> +++ b/include/Kbuild
> @@ -0,0 +1 @@
> +obj-$(CONFIG_DRM_HEADER_TEST)	+= drm/
> diff --git a/include/drm/Makefile b/include/drm/Makefile
> new file mode 100644
> index 000000000000..b9f391d7aadd
> --- /dev/null
> +++ b/include/drm/Makefile
> @@ -0,0 +1,18 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +# Ensure drm headers are self-contained and pass kernel-doc
> +hdrtest-files := \
> +	$(shell cd $(srctree)/$(src) && find * -name '*.h' 2>/dev/null)
> +
> +always-$(CONFIG_DRM_HEADER_TEST) += \
> +	$(patsubst %.h,%.hdrtest, $(hdrtest-files))
> +
> +# Include the header twice to detect missing include guard.
> +quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
> +      cmd_hdrtest = \
> +		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
> +		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_DRM_WERROR),-Werror) $<; \
> +		touch $@
> +
> +$(obj)/%.hdrtest: $(src)/%.h FORCE
> +	$(call if_changed_dep,hdrtest)

-- 
Jani Nikula, Intel
