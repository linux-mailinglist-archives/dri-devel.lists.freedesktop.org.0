Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4277188D7DA
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 08:50:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3BF10E85F;
	Wed, 27 Mar 2024 07:50:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mBdwjkqw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BDFB10E85F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 07:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711525817; x=1743061817;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+I0dUNOdZGkwtBeC0T1EU1TrsDrWBxEiMA9XkoJPZrg=;
 b=mBdwjkqwAsAxs3oi7apG/3ZtBkcnGikAWzoehoPZOkbTYpetrxHWvsfX
 +eph1azzxHrFfNAOe6p3LmfchINcPPToWi/uSzbVnwVpruMnB9sCEFaLe
 6Vtjlt2UVeYpyuHgis9/Bamdy7vhl6jo6xfrokuGIgi5DF76sHeH3ViIA
 0CyFfaC5yKldgVT8vTWq1tQLAx7V1Zzt5Qh37mN1+jSMm7ppYAORBtgoZ
 CvpJr8zEtA9Lw8dPHV/iPBMlmZCOWcE7GDpphatxEOVFPHAUqnLxZNonI
 wQEAoOq8KpfgzUnoQhZbRHqTqka+psUEpRumluka9xe1SnEhxqH4FODgt Q==;
X-CSE-ConnectionGUID: SJAcTyDzTqOYbUaV1QT+zA==
X-CSE-MsgGUID: E9XH/CD/QUqtTFx8jF24TA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6467188"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; 
   d="scan'208";a="6467188"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 00:50:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="16277502"
Received: from mmazilu-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.56.43])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 00:50:08 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 Harry Wentland <harry.wentland@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay
 <ogabbay@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Linus Walleij <linus.walleij@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Andrew Morton
 <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Netdev <netdev@vger.kernel.org>,
 linux-mm@kvack.org, llvm@lists.linux.dev
Subject: Re: [PATCH 01/12] kbuild: make -Woverride-init warnings more
 consistent
In-Reply-To: <cb853762-06d4-401c-a1c8-07a0c031b499@app.fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240326144741.3094687-1-arnd@kernel.org>
 <20240326144741.3094687-2-arnd@kernel.org> <87jzlohhbc.fsf@intel.com>
 <cb853762-06d4-401c-a1c8-07a0c031b499@app.fastmail.com>
Date: Wed, 27 Mar 2024 09:50:05 +0200
Message-ID: <87edbwglle.fsf@intel.com>
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

On Tue, 26 Mar 2024, "Arnd Bergmann" <arnd@arndb.de> wrote:
> On Tue, Mar 26, 2024, at 21:24, Jani Nikula wrote:
>> On Tue, 26 Mar 2024, Arnd Bergmann <arnd@kernel.org> wrote:
>>> From: Arnd Bergmann <arnd@arndb.de>
>>> index 475e1e8c1d35..0786eb0da391 100644
>>> --- a/drivers/net/ethernet/renesas/sh_eth.c
>>> +++ b/drivers/net/ethernet/renesas/sh_eth.c
>>> @@ -50,7 +50,7 @@
>>>   * the macros available to do this only define GCC 8.
>>>   */
>>>  __diag_push();
>>> -__diag_ignore(GCC, 8, "-Woverride-init",
>>> +__diag_ignore_all("-Woverride-init",
>>>  	      "logic to initialize all and then override some is OK");
>>
>> This is nice because it's more localized than the per-file
>> disable. However, we tried to do this in i915, but this doesn't work for
>> GCC versions < 8, and some defconfigs enabling -Werror forced us to
>> revert. See commit 290d16104575 ("Revert "drm/i915: use localized
>> __diag_ignore_all() instead of per file"").
>
> It works now.
>
> The original __diag_ignore_all() only did it for gcc-8 and above
> because that was initially needed to suppress warnings that
> got added in that version, but this was always a mistake.
>
> 689b097a06ba ("compiler-gcc: Suppress -Wmissing-prototypes
> warning for all supported GCC") made it work correctly.

Oh, nice! Then I think we'd like to go back to __diag_ignore_all() in
i915 and xe.

The diff is below. I'm fine with you squashing it to your patch, or if
you want me to turn it into a proper patch for you to pick up in your
series, that's fine too. Just let me know.

BR,
Jani.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>


diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 3ef6ed41e62b..87d6ba8d2341 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -32,11 +32,6 @@ endif
 # Enable -Werror in CI and development
 subdir-ccflags-$(CONFIG_DRM_I915_WERROR) += -Werror
 
-# Fine grained warnings disable
-CFLAGS_i915_pci.o = $(call cc-disable-warning, override-init)
-CFLAGS_display/intel_display_device.o = $(call cc-disable-warning, override-init)
-CFLAGS_display/intel_fbdev.o = $(call cc-disable-warning, override-init)
-
 # Support compiling the display code separately for both i915 and xe
 # drivers. Define I915 when building i915.
 subdir-ccflags-y += -DI915
diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
index c02d79b50006..b8903bd0e82a 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.c
+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
@@ -17,6 +17,9 @@
 #include "intel_display_reg_defs.h"
 #include "intel_fbc.h"
 
+__diag_push();
+__diag_ignore_all("-Woverride-init", "Allow field initialization overrides for display info");
+
 static const struct intel_display_device_info no_display = {};
 
 #define PIPE_A_OFFSET		0x70000
@@ -768,6 +771,8 @@ static const struct intel_display_device_info xe2_lpd_display = {
 		BIT(INTEL_FBC_C) | BIT(INTEL_FBC_D),
 };
 
+__diag_pop();
+
 /*
  * Separate detection for no display cases to keep the display id array simple.
  *
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 99894a855ef0..43855c6c3509 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -135,6 +135,9 @@ static int intel_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
 	return i915_gem_fb_mmap(obj, vma);
 }
 
+__diag_push();
+__diag_ignore_all("-Woverride-init", "Allow field initialization overrides for fb ops");
+
 static const struct fb_ops intelfb_ops = {
 	.owner = THIS_MODULE,
 	__FB_DEFAULT_DEFERRED_OPS_RDWR(intel_fbdev),
@@ -146,6 +149,8 @@ static const struct fb_ops intelfb_ops = {
 	.fb_mmap = intel_fbdev_mmap,
 };
 
+__diag_pop();
+
 static int intelfb_create(struct drm_fb_helper *helper,
 			  struct drm_fb_helper_surface_size *sizes)
 {
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 1e69783ae4fd..405ca17a990b 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -38,6 +38,9 @@
 #include "i915_reg.h"
 #include "intel_pci_config.h"
 
+__diag_push();
+__diag_ignore_all("-Woverride-init", "Allow field initialization overrides for device info");
+
 #define PLATFORM(x) .platform = (x)
 #define GEN(x) \
 	.__runtime.graphics.ip.ver = (x), \
@@ -785,6 +788,8 @@ static const struct intel_device_info mtl_info = {
 
 #undef PLATFORM
 
+__diag_pop();
+
 /*
  * Make sure any device matches here are from most specific to most
  * general.  For example, since the Quanta match is based on the subsystem
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 3c3e67885559..2f58faf0a79a 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -172,9 +172,6 @@ subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
 	-Ddrm_i915_gem_object=xe_bo \
 	-Ddrm_i915_private=xe_device
 
-CFLAGS_i915-display/intel_fbdev.o = $(call cc-disable-warning, override-init)
-CFLAGS_i915-display/intel_display_device.o = $(call cc-disable-warning, override-init)
-
 # Rule to build SOC code shared with i915
 $(obj)/i915-soc/%.o: $(srctree)/drivers/gpu/drm/i915/soc/%.c FORCE
 	$(call cmd,force_checksrc)

-- 
Jani Nikula, Intel
