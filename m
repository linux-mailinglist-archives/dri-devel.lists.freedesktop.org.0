Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9952D906975
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 11:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13CD710E9EB;
	Thu, 13 Jun 2024 09:57:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dS27HN8s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C7810E9EE
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 09:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718272642; x=1749808642;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=A8fQucEWgIY3N0m7YjeqXGe9J0vRHAYsEv3IPZ9+Xro=;
 b=dS27HN8s0dZQH/SkkBFzqegjVD5fr61JWHIr5/w1NjXQr8gDdMGnPDWJ
 Q+Z9W8c70q3ZcPu2ML8nNaPgXiu5TwJu93YR7WokEEJw/DT/hArSoZF/I
 9Eko8w3W8WcUTtYkhR6scCar+zM8d9fegQfYQrKWegRuK4qZhDNEWs+1H
 5Qw875Eybw/sacs8m4BL6hm/YA6INeK7FUnYpgL00qbz/82YEk+4SYmj9
 RyDz0HCNDUJv1jOK7JY8Z0MQSavQ3ojzLoyEo7LKmTG/3D2OJHivbAOZ5
 3K09GhXtjrlzMgjo8Q0KYjPh7sBV+47phNyvV44vvRw8daqpuUKtraGUA A==;
X-CSE-ConnectionGUID: finy/mIUR+2jVOfvPwbViA==
X-CSE-MsgGUID: DEuH55UeRN+uPmeleDSRBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="15249607"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="15249607"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 02:57:21 -0700
X-CSE-ConnectionGUID: MlBowOWfT8ygDvkOJfzzjA==
X-CSE-MsgGUID: kjCRsfTMT62WscGM0Bi4oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="45033958"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.112])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 02:57:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: flyingpenghao@gmail.com, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Peng Hao <flyingpeng@tencent.com>
Subject: Re: [PATCH] i915: increase frame warning limit in intel_workaround
 when using KASAN or KCSAN
In-Reply-To: <20240613022343.49254-1-flyingpeng@tencent.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240613022343.49254-1-flyingpeng@tencent.com>
Date: Thu, 13 Jun 2024 12:57:16 +0300
Message-ID: <87ikydi2rn.fsf@intel.com>
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

On Thu, 13 Jun 2024, flyingpenghao@gmail.com wrote:
> From: Peng Hao <flyingpeng@tencent.com>
>
> When building kernel with clang, which will typically
> have sanitizers enabled, there is a warning about a large stack frame.
>
> drivers/gpu/drm/i915/gt/intel_workarounds.c:3044:6: error: stack frame size (5176)
> exceeds limit (2048) in 'intel_engine_init_workarounds' [-Werror,-Wframe-larger-than]
> void intel_engine_init_workarounds(struct intel_engine_cs *engine)
>      ^
> 128/5176 (2.47%) spills, 5048/5176 (97.53%) variables
>
> so increase the limit for configurations that have KASAN or KCSAN enabled for not
> breaking the majority of builds.

We need to fix the issue instead of sweeping it under the carpet.

Also, please see MAINTAINERS for where to send i915 patches.


BR,
Jani.


>
> Signed-off-by: Peng Hao <flyingpeng@tencent.com>
> ---
>  drivers/gpu/drm/i915/Makefile | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index fba73c38e235..884e2f010bdd 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -36,7 +36,11 @@ subdir-ccflags-$(CONFIG_DRM_I915_WERROR) += -Werror
>  CFLAGS_i915_pci.o = -Wno-override-init
>  CFLAGS_display/intel_display_device.o = -Wno-override-init
>  CFLAGS_display/intel_fbdev.o = -Wno-override-init
> -
> +ifneq ($(CONFIG_FRAME_WARN),0)
> +ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
> +CFLAGS_gt/intel_workarounds.o = -Wframe-larger-than=5272
> +endif
> +endif
>  # Support compiling the display code separately for both i915 and xe
>  # drivers. Define I915 when building i915.
>  subdir-ccflags-y += -DI915

-- 
Jani Nikula, Intel
