Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB05C8056D1
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 15:08:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE7510E549;
	Tue,  5 Dec 2023 14:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com
 [91.218.175.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D248610E549
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 14:08:51 +0000 (UTC)
Message-ID: <e403811b-7f9b-4793-8282-0166a7d903f2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1701785330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I32I7v/9h3pu/d/g+fb5q0L/O3LmmLJ3r5wElMjMeL4=;
 b=fkq6U9+/NN1mhLPo9KKXi7tS25W3+Cfs8rFawdKDNIevr2K3D/dNZ4DFsc9yyW5Bq122p5
 0qtgfofqPr1rJv/F3qnsjR985FiwXfwUo2Ds4MjNTzCLNlhji4A44qvClil8aO0njBEPn0
 i1rDR/AzIUREJkGE/k44oT7dnB2uUUs=
Date: Tue, 5 Dec 2023 22:08:41 +0800
MIME-Version: 1.0
Subject: Re: [RFC] drm: enable W=1 warnings by default across the subsystem
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
References: <20231129181219.1237887-1-jani.nikula@intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20231129181219.1237887-1-jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: Pan@freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 intel-gfx@lists.freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Danilo Krummrich <dakr@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


I'm agree with you.


On 2023/11/30 02:12, Jani Nikula wrote:
> At least the i915 and amd drivers enable a bunch more compiler warnings
> than the kernel defaults.
>
> Extend the W=1 warnings to the entire drm subsystem by default. Use the
> copy-pasted warnings from scripts/Makefile.extrawarn with
> s/KBUILD_CFLAGS/subdir-ccflags-y/ to make it easier to compare and keep
> up with them in the future.
>
> This is similar to the approach currently used in i915.
>
> Some of the -Wextra warnings do need to be disabled, just like in
> Makefile.extrawarn, but take care to not disable them for W=2 or W=3
> builds, depending on the warning.
>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Pan, Xinhui <Xinhui.Pan@amd.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Javier Martinez Canillas <javierm@redhat.com>


Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>


> ---
>
> With my admittedly limited and very much x86 focused kernel config, I
> get some -Wunused-but-set-variable and -Wformat-truncation= warnings,
> but nothing we can't handle.
>
> We could fix them up front, or disable the extra warnings on a per
> driver basis with a FIXME comment in their respective Makefiles.
>
> With the experience from i915, I think this would significantly reduce
> the constant loop of warnings added by people not using W=1 and
> subsequently fixed by people using W=1.
>
> Note: I've Cc'd the maintainers of drm, drm misc and some of the biggest
> drivers.
> ---
>   drivers/gpu/drm/Makefile | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
>
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index b4cb0835620a..6939e4ea13d5 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -5,6 +5,33 @@
>   
>   CFLAGS-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
>   
> +# Unconditionally enable W=1 warnings locally
> +# --- begin copy-paste W=1 warnings from scripts/Makefile.extrawarn
> +subdir-ccflags-y += -Wextra -Wunused -Wno-unused-parameter
> +subdir-ccflags-y += -Wmissing-declarations
> +subdir-ccflags-y += $(call cc-option, -Wrestrict)
> +subdir-ccflags-y += -Wmissing-format-attribute
> +subdir-ccflags-y += -Wmissing-prototypes
> +subdir-ccflags-y += -Wold-style-definition
> +subdir-ccflags-y += -Wmissing-include-dirs
> +subdir-ccflags-y += $(call cc-option, -Wunused-but-set-variable)
> +subdir-ccflags-y += $(call cc-option, -Wunused-const-variable)
> +subdir-ccflags-y += $(call cc-option, -Wpacked-not-aligned)
> +subdir-ccflags-y += $(call cc-option, -Wformat-overflow)
> +subdir-ccflags-y += $(call cc-option, -Wformat-truncation)
> +subdir-ccflags-y += $(call cc-option, -Wstringop-overflow)
> +subdir-ccflags-y += $(call cc-option, -Wstringop-truncation)
> +# The following turn off the warnings enabled by -Wextra
> +ifeq ($(findstring 2, $(KBUILD_EXTRA_WARN)),)
> +subdir-ccflags-y += -Wno-missing-field-initializers
> +subdir-ccflags-y += -Wno-type-limits
> +subdir-ccflags-y += -Wno-shift-negative-value
> +endif
> +ifeq ($(findstring 3, $(KBUILD_EXTRA_WARN)),)
> +subdir-ccflags-y += -Wno-sign-compare
> +endif
> +# --- end copy-paste
> +
>   drm-y := \
>   	drm_aperture.o \
>   	drm_atomic.o \
