Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D348096D072
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 09:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B1110E6A6;
	Thu,  5 Sep 2024 07:32:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VsUVxlCJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89CBD10E6A6;
 Thu,  5 Sep 2024 07:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725521574; x=1757057574;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=cWe0HJbPrFW6Fn33/rkgU2m4AtCc97BVEsC8NZR13KM=;
 b=VsUVxlCJbvCMiwS8k+S0Vrtx3bZVIniyIleuJH+3P7gksPYLgsoofzKj
 10xUARwOR0X9KpGI90fZmO4K3cBH84bIqrAQy4S4iYFb0pI+wjfKFLkYO
 w+P5WgWS5deJLtsaIdtx6ACx0KcJ0R6yAs0krDkMzNWKkpsiXuIDjq9YO
 QlxGv0SgF1gih8qLZXZVpFVS5fYCSYpEd0qsqbEGYsKx4pvoabXkY15oc
 svz8lTrMJTZNvvHK75oojfrM++TkGgcVcGA8mJvLL8UfpW4fVN6CkVljw
 eDJsYZi8U4brIFY28Frk+YCKvZyV65JCr/JFBuqhsj+lLKLPpNzgzobTX Q==;
X-CSE-ConnectionGUID: hhzpi2tnTL6FmqtvaBRtnA==
X-CSE-MsgGUID: ZVgxtAE2Q5ugKdFN1WX8HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="13380576"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="13380576"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 00:32:54 -0700
X-CSE-ConnectionGUID: /r8xKFEaT/eLpauFbBHBjw==
X-CSE-MsgGUID: 2bJcjJM6Rd+DU/xqvztNMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="65376386"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.139])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 00:32:52 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm: enable warnings on unused static inlines
In-Reply-To: <20240904223030.GA1944054@thelio-3990X>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240904123819.3784906-1-jani.nikula@intel.com>
 <20240904223030.GA1944054@thelio-3990X>
Date: Thu, 05 Sep 2024 10:32:49 +0300
Message-ID: <87seuer1we.fsf@intel.com>
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

On Wed, 04 Sep 2024, Nathan Chancellor <nathan@kernel.org> wrote:
> Hi Jani,
>
> On Wed, Sep 04, 2024 at 03:38:19PM +0300, Jani Nikula wrote:
>> We enable most W=1 warnings by default subsystem wide. Also enable
>> warnings on unused static inlines when building with clang.
>> 
>> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
>> inline functions for W=1 build").
>> 
>> Cc: Nathan Chancellor <nathan@kernel.org>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/Makefile | 3 +++
>>  1 file changed, 3 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index 784229d4504d..6bd2cdb08be7 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -19,6 +19,9 @@ subdir-ccflags-y += $(call cc-option, -Wformat-overflow)
>>  # FIXME: fix -Wformat-truncation warnings and uncomment
>>  #subdir-ccflags-y += $(call cc-option, -Wformat-truncation)
>>  subdir-ccflags-y += $(call cc-option, -Wstringop-truncation)
>> +
>> +subdir-ccflags-y += -DKBUILD_EXTRA_WARN1
>> +
>>  # The following turn off the warnings enabled by -Wextra
>>  ifeq ($(findstring 2, $(KBUILD_EXTRA_WARN)),)
>>  subdir-ccflags-y += -Wno-missing-field-initializers
>> -- 
>> 2.39.2
>> 
>
> I ran this through my test matrix and this is what it found (across
> various configuration options, I can give specifics as necessary):

Thanks, I didn't really expect this would not catch anything. :)

We've already fixed some in drm-misc-next and drm-intel-next, see
below. Will need to fix more before merging, obviously.

BR,
Jani.

> drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c:30:18: warning: unused function 'hdmi_read' [-Wunused-function]
>    30 | static inline u8 hdmi_read(struct dw_hdmi_i2s_audio_data *audio, int offset)
>       |                  ^~~~~~~~~
>
> drivers/gpu/drm/bridge/ti-sn65dsi86.c:1638:19: warning: unused function 'ti_sn_pwm_pin_request' [-Wunused-function]
>  1638 | static inline int ti_sn_pwm_pin_request(struct ti_sn65dsi86 *pdata) { return 0; }
>       |                   ^~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/bridge/ti-sn65dsi86.c:1639:20: warning: unused function 'ti_sn_pwm_pin_release' [-Wunused-function]
>  1639 | static inline void ti_sn_pwm_pin_release(struct ti_sn65dsi86 *pdata) {}
>       |                    ^~~~~~~~~~~~~~~~~~~~~
>
> drivers/gpu/drm/drm_mm.c:152:1: warning: unused function 'drm_mm_interval_tree_insert' [-Wunused-function]
>   152 | INTERVAL_TREE_DEFINE(struct drm_mm_node, rb,
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   153 |                      u64, __subtree_last,
>       |                      ~~~~~~~~~~~~~~~~~~~~
>   154 |                      START, LAST, static inline, drm_mm_interval_tree)
>       |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/interval_tree_generic.h:38:15: note: expanded from macro 'INTERVAL_TREE_DEFINE'
>    38 | ITSTATIC void ITPREFIX ## _insert(ITSTRUCT *node,                             \
>       |               ^~~~~~~~~~~~~~~~~~~
> <scratch space>:38:1: note: expanded from here
>    38 | drm_mm_interval_tree_insert
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/drm_mm.c:152:1: warning: unused function 'drm_mm_interval_tree_iter_next' [-Wunused-function]
>   152 | INTERVAL_TREE_DEFINE(struct drm_mm_node, rb,
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   153 |                      u64, __subtree_last,
>       |                      ~~~~~~~~~~~~~~~~~~~~
>   154 |                      START, LAST, static inline, drm_mm_interval_tree)
>       |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/interval_tree_generic.h:151:33: note: expanded from macro 'INTERVAL_TREE_DEFINE'
>   151 | ITSTATIC ITSTRUCT *                                                           \
>       |                                                                               ^
>   152 | ITPREFIX ## _iter_next(ITSTRUCT *node, ITTYPE start, ITTYPE last)             \
>       | ~~~~~~~~~~~~~~~~~~~~~~
> <scratch space>:50:1: note: expanded from here
>    50 | drm_mm_interval_tree_iter_next
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

53bd7c1c0077 ("drm/mm: Mark drm_mm_interval_tree*() functions with __maybe_unused")


> drivers/gpu/drm/drm_mm.c:614:20: warning: function 'drm_mm_node_scanned_block' is not needed and will not be emitted [-Wunneeded-internal-declaration]
>   614 | static inline bool drm_mm_node_scanned_block(const struct drm_mm_node *node)
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~

461ed4aad018 ("drm/mm: annotate drm_mm_node_scanned_block() with __maybe_unused")

> drivers/gpu/drm/i915/i915_sw_fence.c:97:20: error: unused function 'debug_fence_init_onstack' [-Werror,-Wunused-function]
>    97 | static inline void debug_fence_init_onstack(struct i915_sw_fence *fence)
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~

fcd9e8afd546 ("drm/i915/fence: Mark debug_fence_init_onstack() with __maybe_unused")

> drivers/gpu/drm/i915/i915_sw_fence.c:118:20: error: unused function 'debug_fence_free' [-Werror,-Wunused-function]
>   118 | static inline void debug_fence_free(struct i915_sw_fence *fence)
>       |                    ^~~~~~~~~~~~~~~~

f99999536128 ("drm/i915/fence: Mark debug_fence_free() with __maybe_unused")

>
> drivers/gpu/drm/imagination/pvr_drv.c:224:1: warning: unused function 'pvr_fw_version_packed' [-Wunused-function]
>   224 | pvr_fw_version_packed(u32 major, u32 minor)
>       | ^~~~~~~~~~~~~~~~~~~~~
>
> drivers/gpu/drm/kmb/kmb_dsi.c:822:2: warning: unused function 'set_test_mode_src_osc_freq_target_low_bits' [-Wunused-function]
>   822 |         set_test_mode_src_osc_freq_target_low_bits(struct kmb_dsi *kmb_dsi,
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/kmb/kmb_dsi.c:834:2: warning: unused function 'set_test_mode_src_osc_freq_target_hi_bits' [-Wunused-function]
>   834 |         set_test_mode_src_osc_freq_target_hi_bits(struct kmb_dsi *kmb_dsi,
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> drivers/gpu/drm/meson/meson_dw_hdmi.c:276:20: warning: unused function 'dw_hdmi_dwc_write_bits' [-Wunused-function]
>   276 | static inline void dw_hdmi_dwc_write_bits(struct meson_dw_hdmi *dw_hdmi,
>       |                    ^~~~~~~~~~~~~~~~~~~~~~
>
> drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c:35:19: warning: unused function 'rcar_cmm_read' [-Wunused-function]
>    35 | static inline int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
>       |                   ^~~~~~~~~~~~~
>
> drivers/gpu/drm/stm/ltdc.c:494:35: warning: unused function 'encoder_to_ltdc' [-Wunused-function]
>   494 | static inline struct ltdc_device *encoder_to_ltdc(struct drm_encoder *enc)
>       |                                   ^~~~~~~~~~~~~~~
>
> Cheers,
> Nathan

-- 
Jani Nikula, Intel
