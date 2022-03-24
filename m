Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E96CA4E6119
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 10:31:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7245010E798;
	Thu, 24 Mar 2022 09:31:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8FC10E773;
 Thu, 24 Mar 2022 09:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648114315; x=1679650315;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=VmCO7w1rvfCpSXpAU4GX1Z6fkzmncwn0ZJtZgZvk7vI=;
 b=Dfu9Sv8B1HVRHF39fDPQQdNOXuOXEImHJ0YXs/TlXRAIr4tnjzrIdqT4
 +5DYhI7eN543CFRTH484tq9k9dSICNgSkLVJQFdh2Hnn35AAgVUV14kvO
 yqo/ka9gX1lAmPJKdofrZ0lQZytVVefyRMxdEqAn/kgejM3+g/EBfcBwO
 Xl8lKzmjZbnN3/IeDI86qN6P2H4Rsyyb1QzQPaZU2nxHfd/qAGmUnKh9T
 wcpqlCsj5ng8zjQ5n2E0cYe7Pi8OWL5kMBnYgeXX80hNzWjHZ/MfLe9m6
 pIpo94PIPJ0oloCrHRcBfUjlBUMA7H/e9DrsR6OnqKfhBzRyavw+y1ZXv w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="258517340"
X-IronPort-AV: E=Sophos;i="5.90,206,1643702400"; d="scan'208";a="258517340"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 02:31:54 -0700
X-IronPort-AV: E=Sophos;i="5.90,206,1643702400"; d="scan'208";a="561298849"
Received: from cnalawad-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.37.131])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 02:31:52 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org
Subject: Re: [RFC] drm/i915: Split out intel_vtd_active and run_as_guest to
 own header
In-Reply-To: <20220322164446.2124983-1-tvrtko.ursulin@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220322164446.2124983-1-tvrtko.ursulin@linux.intel.com>
Date: Thu, 24 Mar 2022 11:31:49 +0200
Message-ID: <878rszitmi.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 22 Mar 2022, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> ...
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> Typed up how I see it - bash away.

So is intel_vtd_active() so performance critical that it needs to be
inline?

We're passing struct drm_i915_private * everywhere we can, and it just
feels silly to use struct drm_device * to avoid the include.

Static inlines considered harmful. :p


BR,
Jani.


> ---
>  drivers/gpu/drm/i915/display/intel_bw.c      |  3 +-
>  drivers/gpu/drm/i915/display/intel_display.c |  9 ++++-
>  drivers/gpu/drm/i915/display/intel_display.h |  2 ++
>  drivers/gpu/drm/i915/display/intel_fbc.c     |  3 +-
>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c   |  3 +-
>  drivers/gpu/drm/i915/gem/i915_gemfs.c        |  3 +-
>  drivers/gpu/drm/i915/gt/intel_ggtt.c         |  5 +--
>  drivers/gpu/drm/i915/gt/intel_gtt.c          | 12 +++++++
>  drivers/gpu/drm/i915/gt/intel_gtt.h          |  2 ++
>  drivers/gpu/drm/i915/i915_debugfs.c          |  1 +
>  drivers/gpu/drm/i915/i915_driver.c           |  3 +-
>  drivers/gpu/drm/i915/i915_driver.h           |  4 +++
>  drivers/gpu/drm/i915/i915_drv.h              | 37 --------------------
>  drivers/gpu/drm/i915/i915_gpu_error.c        |  3 +-
>  drivers/gpu/drm/i915/intel_device_info.c     |  4 ++-
>  drivers/gpu/drm/i915/intel_pch.c             |  3 +-
>  drivers/gpu/drm/i915/intel_vtd.h             | 27 ++++++++++++++
>  17 files changed, 76 insertions(+), 48 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/intel_vtd.h
>
> diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i9=
15/display/intel_bw.c
> index ac11ff19e47d..6c9cb4f97218 100644
> --- a/drivers/gpu/drm/i915/display/intel_bw.c
> +++ b/drivers/gpu/drm/i915/display/intel_bw.c
> @@ -13,6 +13,7 @@
>  #include "intel_mchbar_regs.h"
>  #include "intel_pcode.h"
>  #include "intel_pm.h"
> +#include "intel_vtd.h"
>=20=20
>  /* Parameters for Qclk Geyserville (QGV) */
>  struct intel_qgv_point {
> @@ -649,7 +650,7 @@ static unsigned int intel_bw_data_rate(struct drm_i91=
5_private *dev_priv,
>  	for_each_pipe(dev_priv, pipe)
>  		data_rate +=3D bw_state->data_rate[pipe];
>=20=20
> -	if (DISPLAY_VER(dev_priv) >=3D 13 && intel_vtd_active(dev_priv))
> +	if (DISPLAY_VER(dev_priv) >=3D 13 && intel_vtd_active(dev_priv->drm.dev=
))
>  		data_rate =3D DIV_ROUND_UP(data_rate * 105, 100);
>=20=20
>  	return data_rate;
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index dc6e21e4ef0b..e80f3ca3ee4e 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -110,6 +110,7 @@
>  #include "intel_quirks.h"
>  #include "intel_sprite.h"
>  #include "intel_tc.h"
> +#include "intel_vtd.h"
>  #include "intel_vga.h"
>  #include "i9xx_plane.h"
>  #include "skl_scaler.h"
> @@ -1197,7 +1198,7 @@ static bool needs_async_flip_vtd_wa(const struct in=
tel_crtc_state *crtc_state)
>  {
>  	struct drm_i915_private *i915 =3D to_i915(crtc_state->uapi.crtc->dev);
>=20=20
> -	return crtc_state->uapi.async_flip && intel_vtd_active(i915) &&
> +	return crtc_state->uapi.async_flip && intel_vtd_active(i915->drm.dev) &&
>  		(DISPLAY_VER(i915) =3D=3D 9 || IS_BROADWELL(i915) || IS_HASWELL(i915));
>  }
>=20=20
> @@ -10699,3 +10700,9 @@ void intel_display_driver_unregister(struct drm_i=
915_private *i915)
>  	acpi_video_unregister();
>  	intel_opregion_unregister(i915);
>  }
> +
> +bool intel_scanout_needs_vtd_wa(struct drm_i915_private *dev_priv)
> +{
> +	return DISPLAY_VER(dev_priv) >=3D 6 &&
> +	       intel_vtd_active(dev_priv->drm.dev);
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/d=
rm/i915/display/intel_display.h
> index 8513703086b7..d69587c76e71 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.h
> +++ b/drivers/gpu/drm/i915/display/intel_display.h
> @@ -694,4 +694,6 @@ void assert_transcoder(struct drm_i915_private *dev_p=
riv,
>  #define I915_STATE_WARN_ON(x)						\
>  	I915_STATE_WARN((x), "%s", "WARN_ON(" __stringify(x) ")")
>=20=20
> +bool intel_scanout_needs_vtd_wa(struct drm_i915_private *dev_priv);
> +
>  #endif
> diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i=
915/display/intel_fbc.c
> index 142280b6ce6d..00a3e30587a5 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbc.c
> @@ -50,6 +50,7 @@
>  #include "intel_display_types.h"
>  #include "intel_fbc.h"
>  #include "intel_frontbuffer.h"
> +#include "intel_vtd.h"
>=20=20
>  #define for_each_fbc_id(__dev_priv, __fbc_id) \
>  	for ((__fbc_id) =3D INTEL_FBC_A; (__fbc_id) < I915_MAX_FBCS; (__fbc_id)=
++) \
> @@ -1643,7 +1644,7 @@ static int intel_sanitize_fbc_option(struct drm_i91=
5_private *i915)
>  static bool need_fbc_vtd_wa(struct drm_i915_private *i915)
>  {
>  	/* WaFbcTurnOffFbcWhenHyperVisorIsUsed:skl,bxt */
> -	if (intel_vtd_active(i915) &&
> +	if (intel_vtd_active(i915->drm.dev) &&
>  	    (IS_SKYLAKE(i915) || IS_BROXTON(i915))) {
>  		drm_info(&i915->drm,
>  			 "Disabling framebuffer compression (FBC) to prevent screen flicker w=
ith VT-d enabled\n");
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm=
/i915/gem/i915_gem_stolen.c
> index 143f61aaa867..9b986b1b0b60 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -19,6 +19,7 @@
>  #include "i915_reg.h"
>  #include "i915_vgpu.h"
>  #include "intel_mchbar_regs.h"
> +#include "intel_vtd.h"
>=20=20
>  /*
>   * The BIOS typically reserves some of the system's memory for the exclu=
sive
> @@ -403,7 +404,7 @@ static int i915_gem_init_stolen(struct intel_memory_r=
egion *mem)
>  		return 0;
>  	}
>=20=20
> -	if (intel_vtd_active(i915) && GRAPHICS_VER(i915) < 8) {
> +	if (intel_vtd_active(i915->drm.dev) && GRAPHICS_VER(i915) < 8) {
>  		drm_notice(&i915->drm,
>  			   "%s, disabling use of stolen memory\n",
>  			   "DMAR active");
> diff --git a/drivers/gpu/drm/i915/gem/i915_gemfs.c b/drivers/gpu/drm/i915=
/gem/i915_gemfs.c
> index 7271fbf813fa..271826642bd4 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gemfs.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gemfs.c
> @@ -9,6 +9,7 @@
>=20=20
>  #include "i915_drv.h"
>  #include "i915_gemfs.h"
> +#include "intel_vtd.h"
>=20=20
>  int i915_gemfs_init(struct drm_i915_private *i915)
>  {
> @@ -32,7 +33,7 @@ int i915_gemfs_init(struct drm_i915_private *i915)
>  	 */
>=20=20
>  	opts =3D NULL;
> -	if (intel_vtd_active(i915)) {
> +	if (intel_vtd_active(i915->drm.dev)) {
>  		if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
>  			opts =3D huge_opt;
>  			drm_info(&i915->drm,
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/=
gt/intel_ggtt.c
> index 04191fe2ee34..386181cec300 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -21,6 +21,7 @@
>  #include "i915_vgpu.h"
>=20=20
>  #include "intel_gtt.h"
> +#include "intel_vtd.h"
>  #include "gen8_ppgtt.h"
>=20=20
>  static void i915_ggtt_color_adjust(const struct drm_mm_node *node,
> @@ -104,7 +105,7 @@ static bool needs_idle_maps(struct drm_i915_private *=
i915)
>  	 * Query intel_iommu to see if we need the workaround. Presumably that
>  	 * was loaded first.
>  	 */
> -	if (!intel_vtd_active(i915))
> +	if (!intel_vtd_active(i915->drm.dev))
>  		return false;
>=20=20
>  	if (GRAPHICS_VER(i915) =3D=3D 5 && IS_MOBILE(i915))
> @@ -1258,7 +1259,7 @@ int i915_ggtt_probe_hw(struct drm_i915_private *i91=
5)
>  	if (ret)
>  		return ret;
>=20=20
> -	if (intel_vtd_active(i915))
> +	if (intel_vtd_active(i915->drm.dev))
>  		drm_info(&i915->drm, "VT-d active for gfx access\n");
>=20=20
>  	return 0;
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/g=
t/intel_gtt.c
> index aed6de2d5a79..ee17e987cddc 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> @@ -16,6 +16,18 @@
>  #include "intel_gt.h"
>  #include "intel_gt_regs.h"
>  #include "intel_gtt.h"
> +#include "intel_vtd.h"
> +
> +
> +static bool intel_ggtt_update_needs_vtd_wa(struct drm_i915_private *i915)
> +{
> +	return IS_BROXTON(i915) && intel_vtd_active(i915->drm.dev);
> +}
> +
> +bool intel_vm_no_concurrent_access_wa(struct drm_i915_private *i915)
> +{
> +	return IS_CHERRYVIEW(i915) || intel_ggtt_update_needs_vtd_wa(i915);
> +}
>=20=20
>  struct drm_i915_gem_object *alloc_pt_lmem(struct i915_address_space *vm,=
 int sz)
>  {
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/g=
t/intel_gtt.h
> index 4529b5e9f6e6..5922e2cf4d8d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> @@ -382,6 +382,8 @@ struct i915_ppgtt {
>  #define i915_is_dpt(vm) ((vm)->is_dpt)
>  #define i915_is_ggtt_or_dpt(vm) (i915_is_ggtt(vm) || i915_is_dpt(vm))
>=20=20
> +bool intel_vm_no_concurrent_access_wa(struct drm_i915_private *i915);
> +
>  int __must_check
>  i915_vm_lock_objects(struct i915_address_space *vm, struct i915_gem_ww_c=
tx *ww);
>=20=20
> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i=
915_debugfs.c
> index 2cbd1f58e754..cda71457d630 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> @@ -48,6 +48,7 @@
>=20=20
>  #include "i915_debugfs.h"
>  #include "i915_debugfs_params.h"
> +#include "i915_driver.h"
>  #include "i915_irq.h"
>  #include "i915_scheduler.h"
>  #include "intel_mchbar_regs.h"
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i9=
15_driver.c
> index 64e6f76861f9..f03a63b57f05 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -96,6 +96,7 @@
>  #include "intel_pcode.h"
>  #include "intel_pm.h"
>  #include "intel_region_ttm.h"
> +#include "intel_vtd.h"
>  #include "vlv_suspend.h"
>=20=20
>  static const struct drm_driver i915_drm_driver;
> @@ -744,7 +745,7 @@ void
>  i915_print_iommu_status(struct drm_i915_private *i915, struct drm_printe=
r *p)
>  {
>  	drm_printf(p, "iommu: %s\n",
> -		   str_enabled_disabled(intel_vtd_active(i915)));
> +		   str_enabled_disabled(intel_vtd_active(i915->drm.dev)));
>  }
>=20=20
>  static void i915_welcome_messages(struct drm_i915_private *dev_priv)
> diff --git a/drivers/gpu/drm/i915/i915_driver.h b/drivers/gpu/drm/i915/i9=
15_driver.h
> index 9d11de65daaf..44ec543d92cb 100644
> --- a/drivers/gpu/drm/i915/i915_driver.h
> +++ b/drivers/gpu/drm/i915/i915_driver.h
> @@ -11,6 +11,7 @@
>  struct pci_dev;
>  struct pci_device_id;
>  struct drm_i915_private;
> +struct drm_printer;
>=20=20
>  #define DRIVER_NAME		"i915"
>  #define DRIVER_DESC		"Intel Graphics"
> @@ -26,4 +27,7 @@ void i915_driver_shutdown(struct drm_i915_private *i915=
);
>  int i915_driver_resume_switcheroo(struct drm_i915_private *i915);
>  int i915_driver_suspend_switcheroo(struct drm_i915_private *i915, pm_mes=
sage_t state);
>=20=20
> +void
> +i915_print_iommu_status(struct drm_i915_private *i915, struct drm_printe=
r *p);
> +
>  #endif /* __I915_DRIVER_H__ */
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_=
drv.h
> index 217c09422711..799f386a7ef2 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -32,9 +32,6 @@
>=20=20
>  #include <uapi/drm/i915_drm.h>
>=20=20
> -#include <asm/hypervisor.h>
> -
> -#include <linux/intel-iommu.h>
>  #include <linux/pm_qos.h>
>=20=20
>  #include <drm/drm_connector.h>
> @@ -1387,43 +1384,9 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>  #define HAS_PERCTX_PREEMPT_CTRL(i915) \
>  	((GRAPHICS_VER(i915) >=3D 9) &&  GRAPHICS_VER_FULL(i915) < IP_VER(12, 5=
5))
>=20=20
> -static inline bool run_as_guest(void)
> -{
> -	return !hypervisor_is_type(X86_HYPER_NATIVE);
> -}
> -
>  #define HAS_D12_PLANE_MINIMIZATION(dev_priv) (IS_ROCKETLAKE(dev_priv) ||=
 \
>  					      IS_ALDERLAKE_S(dev_priv))
>=20=20
> -static inline bool intel_vtd_active(struct drm_i915_private *i915)
> -{
> -	if (device_iommu_mapped(i915->drm.dev))
> -		return true;
> -
> -	/* Running as a guest, we assume the host is enforcing VT'd */
> -	return run_as_guest();
> -}
> -
> -void
> -i915_print_iommu_status(struct drm_i915_private *i915, struct drm_printe=
r *p);
> -
> -static inline bool intel_scanout_needs_vtd_wa(struct drm_i915_private *d=
ev_priv)
> -{
> -	return DISPLAY_VER(dev_priv) >=3D 6 && intel_vtd_active(dev_priv);
> -}
> -
> -static inline bool
> -intel_ggtt_update_needs_vtd_wa(struct drm_i915_private *i915)
> -{
> -	return IS_BROXTON(i915) && intel_vtd_active(i915);
> -}
> -
> -static inline bool
> -intel_vm_no_concurrent_access_wa(struct drm_i915_private *i915)
> -{
> -	return IS_CHERRYVIEW(i915) || intel_ggtt_update_needs_vtd_wa(i915);
> -}
> -
>  /* i915_gem.c */
>  void i915_gem_init_early(struct drm_i915_private *dev_priv);
>  void i915_gem_cleanup_early(struct drm_i915_private *dev_priv);
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915=
/i915_gpu_error.c
> index a8acc6fbb299..a221b19e588c 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -48,6 +48,7 @@
>  #include "gt/intel_gt.h"
>  #include "gt/intel_gt_pm.h"
>  #include "gt/intel_gt_regs.h"
> +#include "intel_vtd.h"
>=20=20
>  #include "i915_driver.h"
>  #include "i915_drv.h"
> @@ -1814,7 +1815,7 @@ static void capture_gen(struct i915_gpu_coredump *e=
rror)
>  	error->wakelock =3D atomic_read(&i915->runtime_pm.wakeref_count);
>  	error->suspended =3D i915->runtime_pm.suspended;
>=20=20
> -	error->iommu =3D intel_vtd_active(i915);
> +	error->iommu =3D intel_vtd_active(i915->drm.dev);
>  	error->reset_count =3D i915_reset_count(&i915->gpu_error);
>  	error->suspend_count =3D i915->suspend_count;
>=20=20
> diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i=
915/intel_device_info.c
> index 8d458226f478..21423e6eacb3 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.c
> +++ b/drivers/gpu/drm/i915/intel_device_info.c
> @@ -30,6 +30,7 @@
>  #include "display/intel_cdclk.h"
>  #include "display/intel_de.h"
>  #include "intel_device_info.h"
> +#include "intel_vtd.h"
>  #include "i915_drv.h"
>=20=20
>  #define PLATFORM_NAME(x) [INTEL_##x] =3D #x
> @@ -389,7 +390,8 @@ void intel_device_info_runtime_init(struct drm_i915_p=
rivate *dev_priv)
>  			info->display.has_dsc =3D 0;
>  	}
>=20=20
> -	if (GRAPHICS_VER(dev_priv) =3D=3D 6 && intel_vtd_active(dev_priv)) {
> +	if (GRAPHICS_VER(dev_priv) =3D=3D 6 &&
> +	    intel_vtd_active(dev_priv->drm.dev)) {
>  		drm_info(&dev_priv->drm,
>  			 "Disabling ppGTT for VT-d support\n");
>  		info->ppgtt_type =3D INTEL_PPGTT_NONE;
> diff --git a/drivers/gpu/drm/i915/intel_pch.c b/drivers/gpu/drm/i915/inte=
l_pch.c
> index 4cce044efde2..c232343d5ba7 100644
> --- a/drivers/gpu/drm/i915/intel_pch.c
> +++ b/drivers/gpu/drm/i915/intel_pch.c
> @@ -5,6 +5,7 @@
>=20=20
>  #include "i915_drv.h"
>  #include "intel_pch.h"
> +#include "intel_vtd.h"
>=20=20
>  /* Map PCH device id to PCH type, or PCH_NONE if unknown. */
>  static enum intel_pch
> @@ -256,7 +257,7 @@ void intel_detect_pch(struct drm_i915_private *dev_pr=
iv)
>  		dev_priv->pch_type =3D PCH_NOP;
>  		dev_priv->pch_id =3D 0;
>  	} else if (!pch) {
> -		if (run_as_guest() && HAS_DISPLAY(dev_priv)) {
> +		if (intel_vtd_run_as_guest() && HAS_DISPLAY(dev_priv)) {
>  			intel_virt_detect_pch(dev_priv, &id, &pch_type);
>  			dev_priv->pch_type =3D pch_type;
>  			dev_priv->pch_id =3D id;
> diff --git a/drivers/gpu/drm/i915/intel_vtd.h b/drivers/gpu/drm/i915/inte=
l_vtd.h
> new file mode 100644
> index 000000000000..1aa5d813f002
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/intel_vtd.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2022 Intel Corporation
> + */
> +
> +#ifndef __INTEL_VTD_H__
> +#define __INTEL_VTD_H__
> +
> +#include <linux/device.h>
> +#include <linux/types.h>
> +#include <asm/hypervisor.h>
> +
> +static inline bool intel_vtd_run_as_guest(void)
> +{
> +	return !hypervisor_is_type(X86_HYPER_NATIVE);
> +}
> +
> +static inline bool intel_vtd_active(struct device *dev)
> +{
> +	if (device_iommu_mapped(dev))
> +		return true;
> +
> +	/* Running as a guest, we assume the host is enforcing VT'd */
> +	return intel_vtd_run_as_guest();
> +}
> +
> +#endif /* __INTEL_VTD_H__ */

--=20
Jani Nikula, Intel Open Source Graphics Center
