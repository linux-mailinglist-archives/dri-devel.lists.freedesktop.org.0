Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E62EA96CA76
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 00:30:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA8910E06E;
	Wed,  4 Sep 2024 22:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jXAryBFh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09CAD10E070;
 Wed,  4 Sep 2024 22:30:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AFB345C587B;
 Wed,  4 Sep 2024 22:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BC8EC4CEC2;
 Wed,  4 Sep 2024 22:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725489032;
 bh=7VZ8dopNb6Xw84A7ZivyftmrGW6ZT1IuRr6IdvMLH0w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jXAryBFhT3Ki0WRLE2VlwfBA2xoebFISDTyJH+j0nU2iKAMX2/+HNXfPCfuiFNQdS
 5Fxw1UX+w/IQXdKCznpydfoSVK+zv0OP1HLgGsfKFRqFjGjZPWSuxC2Lg0q6RAx6XE
 OB6G15/pK04eBU2vJpxK5easAvqFKVieoWVPpa4VeEWBcEuuUXxCYHiaQNTABVK0kT
 fhWObQER8fMijWuoij/5+r4wG8N4zp+OkHOI+17U9wIKsQBOJJPYZlVipywuV81vON
 axD78ZETV703r/QoISiFxg+pqoF1Ku1f4rXAkj93zFtT9N8erstfpdF4Sl0kW2jvVT
 yr43q54G0Orlg==
Date: Wed, 4 Sep 2024 15:30:30 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm: enable warnings on unused static inlines
Message-ID: <20240904223030.GA1944054@thelio-3990X>
References: <20240904123819.3784906-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904123819.3784906-1-jani.nikula@intel.com>
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

Hi Jani,

On Wed, Sep 04, 2024 at 03:38:19PM +0300, Jani Nikula wrote:
> We enable most W=1 warnings by default subsystem wide. Also enable
> warnings on unused static inlines when building with clang.
> 
> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> inline functions for W=1 build").
> 
> Cc: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/Makefile | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 784229d4504d..6bd2cdb08be7 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -19,6 +19,9 @@ subdir-ccflags-y += $(call cc-option, -Wformat-overflow)
>  # FIXME: fix -Wformat-truncation warnings and uncomment
>  #subdir-ccflags-y += $(call cc-option, -Wformat-truncation)
>  subdir-ccflags-y += $(call cc-option, -Wstringop-truncation)
> +
> +subdir-ccflags-y += -DKBUILD_EXTRA_WARN1
> +
>  # The following turn off the warnings enabled by -Wextra
>  ifeq ($(findstring 2, $(KBUILD_EXTRA_WARN)),)
>  subdir-ccflags-y += -Wno-missing-field-initializers
> -- 
> 2.39.2
> 

I ran this through my test matrix and this is what it found (across
various configuration options, I can give specifics as necessary):

drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c:30:18: warning: unused function 'hdmi_read' [-Wunused-function]
   30 | static inline u8 hdmi_read(struct dw_hdmi_i2s_audio_data *audio, int offset)
      |                  ^~~~~~~~~

drivers/gpu/drm/bridge/ti-sn65dsi86.c:1638:19: warning: unused function 'ti_sn_pwm_pin_request' [-Wunused-function]
 1638 | static inline int ti_sn_pwm_pin_request(struct ti_sn65dsi86 *pdata) { return 0; }
      |                   ^~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/bridge/ti-sn65dsi86.c:1639:20: warning: unused function 'ti_sn_pwm_pin_release' [-Wunused-function]
 1639 | static inline void ti_sn_pwm_pin_release(struct ti_sn65dsi86 *pdata) {}
      |                    ^~~~~~~~~~~~~~~~~~~~~

drivers/gpu/drm/drm_mm.c:152:1: warning: unused function 'drm_mm_interval_tree_insert' [-Wunused-function]
  152 | INTERVAL_TREE_DEFINE(struct drm_mm_node, rb,
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  153 |                      u64, __subtree_last,
      |                      ~~~~~~~~~~~~~~~~~~~~
  154 |                      START, LAST, static inline, drm_mm_interval_tree)
      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/interval_tree_generic.h:38:15: note: expanded from macro 'INTERVAL_TREE_DEFINE'
   38 | ITSTATIC void ITPREFIX ## _insert(ITSTRUCT *node,                             \
      |               ^~~~~~~~~~~~~~~~~~~
<scratch space>:38:1: note: expanded from here
   38 | drm_mm_interval_tree_insert
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/drm_mm.c:152:1: warning: unused function 'drm_mm_interval_tree_iter_next' [-Wunused-function]
  152 | INTERVAL_TREE_DEFINE(struct drm_mm_node, rb,
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  153 |                      u64, __subtree_last,
      |                      ~~~~~~~~~~~~~~~~~~~~
  154 |                      START, LAST, static inline, drm_mm_interval_tree)
      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/interval_tree_generic.h:151:33: note: expanded from macro 'INTERVAL_TREE_DEFINE'
  151 | ITSTATIC ITSTRUCT *                                                           \
      |                                                                               ^
  152 | ITPREFIX ## _iter_next(ITSTRUCT *node, ITTYPE start, ITTYPE last)             \
      | ~~~~~~~~~~~~~~~~~~~~~~
<scratch space>:50:1: note: expanded from here
   50 | drm_mm_interval_tree_iter_next
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/drm_mm.c:614:20: warning: function 'drm_mm_node_scanned_block' is not needed and will not be emitted [-Wunneeded-internal-declaration]
  614 | static inline bool drm_mm_node_scanned_block(const struct drm_mm_node *node)
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~

drivers/gpu/drm/i915/i915_sw_fence.c:97:20: error: unused function 'debug_fence_init_onstack' [-Werror,-Wunused-function]
   97 | static inline void debug_fence_init_onstack(struct i915_sw_fence *fence)
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/i915/i915_sw_fence.c:118:20: error: unused function 'debug_fence_free' [-Werror,-Wunused-function]
  118 | static inline void debug_fence_free(struct i915_sw_fence *fence)
      |                    ^~~~~~~~~~~~~~~~

drivers/gpu/drm/imagination/pvr_drv.c:224:1: warning: unused function 'pvr_fw_version_packed' [-Wunused-function]
  224 | pvr_fw_version_packed(u32 major, u32 minor)
      | ^~~~~~~~~~~~~~~~~~~~~

drivers/gpu/drm/kmb/kmb_dsi.c:822:2: warning: unused function 'set_test_mode_src_osc_freq_target_low_bits' [-Wunused-function]
  822 |         set_test_mode_src_osc_freq_target_low_bits(struct kmb_dsi *kmb_dsi,
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/kmb/kmb_dsi.c:834:2: warning: unused function 'set_test_mode_src_osc_freq_target_hi_bits' [-Wunused-function]
  834 |         set_test_mode_src_osc_freq_target_hi_bits(struct kmb_dsi *kmb_dsi,
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

drivers/gpu/drm/meson/meson_dw_hdmi.c:276:20: warning: unused function 'dw_hdmi_dwc_write_bits' [-Wunused-function]
  276 | static inline void dw_hdmi_dwc_write_bits(struct meson_dw_hdmi *dw_hdmi,
      |                    ^~~~~~~~~~~~~~~~~~~~~~

drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c:35:19: warning: unused function 'rcar_cmm_read' [-Wunused-function]
   35 | static inline int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
      |                   ^~~~~~~~~~~~~

drivers/gpu/drm/stm/ltdc.c:494:35: warning: unused function 'encoder_to_ltdc' [-Wunused-function]
  494 | static inline struct ltdc_device *encoder_to_ltdc(struct drm_encoder *enc)
      |                                   ^~~~~~~~~~~~~~~

Cheers,
Nathan
