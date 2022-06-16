Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 008DA54E106
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 14:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12FE11A526;
	Thu, 16 Jun 2022 12:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A284811A528;
 Thu, 16 Jun 2022 12:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655383595; x=1686919595;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=TXkm7+kwD59YyMfPXT5p+xWvSdvpPMKrJ2d5fygZgzs=;
 b=IUWUwBQ9M6JE/CegW4ASZb3svwAY8Y2Tbi9+r/RjPVhcJBLPYayXvyVi
 Idb6z9QmNlO0CyUV79fdbqeHOfYnhssJ7oGdg+ysvEX23PVy8Eb6W7Upu
 O2TnGHZRq3xIdbipMUv9kWCtkDfvAiwWE444SgknbnLtxAVeidjCz+ZQQ
 g/rQpG8yHaEWgdwgzZ5jvGQvB3OduietWY/qEOWnDajRQQN4KZPYccUCt
 IvtloUU3UX8119GbGesWXg7nGHkfbItsuxWxe8gfUARbc/aAR0bg3sn0f
 1rmGswuhpCQJdMluMApzxqC4m4Kf09J0Cla+Bi9zoSy8Enwhuz2DVdwUG A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="267927787"
X-IronPort-AV: E=Sophos;i="5.91,305,1647327600"; d="scan'208";a="267927787"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 05:46:34 -0700
X-IronPort-AV: E=Sophos;i="5.91,305,1647327600"; d="scan'208";a="641523053"
Received: from malashi-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.57.133])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 05:46:31 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 6/9] drm/i915/dgfx: Setup VRAM SR with D3COLD
In-Reply-To: <20220616120106.24353-7-anshuman.gupta@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220616120106.24353-1-anshuman.gupta@intel.com>
 <20220616120106.24353-7-anshuman.gupta@intel.com>
Date: Thu, 16 Jun 2022 15:46:29 +0300
Message-ID: <87bkuswzbu.fsf@intel.com>
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
Cc: tilak.tangudu@intel.com, tvrtko.ursulin@intel.com,
 Anshuman Gupta <anshuman.gupta@intel.com>, jon.ewins@intel.com,
 badal.nilawar@intel.com, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Jun 2022, Anshuman Gupta <anshuman.gupta@intel.com> wrote:
> Setup VRAM Self Refresh with D3COLD state.
> VRAM Self Refresh will retain the context of VRAM, driver
> need to save any corresponding=E2=80=AFhardware state that needs
> to be restore on D3COLD exit, example PCI state.
>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_driver.c |  2 ++
>  drivers/gpu/drm/i915/i915_drv.h    |  7 +++++
>  drivers/gpu/drm/i915/i915_reg.h    |  4 +++
>  drivers/gpu/drm/i915/intel_pcode.c | 28 +++++++++++++++++++
>  drivers/gpu/drm/i915/intel_pcode.h |  2 ++
>  drivers/gpu/drm/i915/intel_pm.c    | 43 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/i915/intel_pm.h    |  2 ++
>  7 files changed, 88 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i9=
15_driver.c
> index d26dcca7e654..aa1fb15b1f11 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -649,6 +649,8 @@ static int i915_driver_hw_probe(struct drm_i915_priva=
te *dev_priv)
>  	if (ret)
>  		goto err_msi;
>=20=20
> +	intel_pm_vram_sr_setup(dev_priv);
> +
>  	/*
>  	 * Fill the dram structure to get the system dram info. This will be
>  	 * used for memory latency calculation.
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_=
drv.h
> index 7983b36c1720..09f53aeda8d0 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -624,6 +624,13 @@ struct drm_i915_private {
>  	u32 bxt_phy_grc;
>=20=20
>  	u32 suspend_count;
> +
> +	struct {
> +		/* lock to protect vram_sr flags */
> +		struct mutex lock;
> +		bool supported;
> +	} vram_sr;
> +
>  	struct i915_suspend_saved_registers regfile;
>  	struct vlv_s0ix_state *vlv_s0ix_state;
>=20=20
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_=
reg.h
> index 932bd6aa4a0a..0e3dc4a8846a 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -6766,6 +6766,8 @@
>  #define   DG1_PCODE_STATUS			0x7E
>  #define     DG1_UNCORE_GET_INIT_STATUS		0x0
>  #define     DG1_UNCORE_INIT_STATUS_COMPLETE	0x1
> +#define   DG1_PCODE_D3_VRAM_SR                  0x71
> +#define     DG1_ENABLE_SR                        0x1
>  #define GEN12_PCODE_READ_SAGV_BLOCK_TIME_US	0x23
>  #define   XEHPSDV_PCODE_FREQUENCY_CONFIG		0x6e	/* xehpsdv, pvc */
>  /* XEHPSDV_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
> @@ -6779,6 +6781,8 @@
>  #define   GEN6_PCODE_FREQ_IA_RATIO_SHIFT	8
>  #define   GEN6_PCODE_FREQ_RING_RATIO_SHIFT	16
>  #define GEN6_PCODE_DATA1			_MMIO(0x13812C)
> +#define VRAM_CAPABILITY                         _MMIO(0x138144)
> +#define   VRAM_SUPPORTED                        REG_BIT(0)
>=20=20
>  /* IVYBRIDGE DPF */
>  #define GEN7_L3CDERRST1(slice)		_MMIO(0xB008 + (slice) * 0x200) /* L3CD =
Error Status 1 */
> diff --git a/drivers/gpu/drm/i915/intel_pcode.c b/drivers/gpu/drm/i915/in=
tel_pcode.c
> index a234d9b4ed14..88bd1f44cfb2 100644
> --- a/drivers/gpu/drm/i915/intel_pcode.c
> +++ b/drivers/gpu/drm/i915/intel_pcode.c
> @@ -246,3 +246,31 @@ int snb_pcode_write_p(struct intel_uncore *uncore, u=
32 mbcmd, u32 p1, u32 p2, u3
>=20=20
>  	return err;
>  }
> +
> +/**
> + * intel_pcode_enable_vram_sr - Enable pcode vram_sr.
> + * @dev_priv: i915 device
> + *
> + * This function triggers the required pcode flow to enable vram_sr.
> + * This function stictly need to call from rpm handlers, as i915 is
> + * transitioning to rpm idle/suspend, it doesn't require to grab
> + * rpm wakeref.
> + *
> + * Returns:
> + * returns returned value from pcode mbox write.
> + */
> +int intel_pcode_enable_vram_sr(struct drm_i915_private *i915)
> +{
> +	int ret =3D 0;
> +
> +	if (!HAS_LMEM_SR(i915))
> +		return ret;
> +
> +	ret =3D snb_pcode_write(&i915->uncore,
> +			      REG_FIELD_PREP(GEN6_PCODE_MB_COMMAND,
> +			      DG1_PCODE_D3_VRAM_SR) |
> +			      REG_FIELD_PREP(GEN6_PCODE_MB_PARAM1,
> +			      DG1_ENABLE_SR), 0); /* no data needed for this cmd */
> +
> +	return ret;
> +}

This function doesn't belong here. intel_pcode.c provides the
*mechanisms* for pcode access, not specific stuff like this. Just put
this near the use in intel_pm.c I think.


> diff --git a/drivers/gpu/drm/i915/intel_pcode.h b/drivers/gpu/drm/i915/in=
tel_pcode.h
> index 8d2198e29422..295594514d49 100644
> --- a/drivers/gpu/drm/i915/intel_pcode.h
> +++ b/drivers/gpu/drm/i915/intel_pcode.h
> @@ -9,6 +9,7 @@
>  #include <linux/types.h>
>=20=20
>  struct intel_uncore;
> +struct drm_i915_private;
>=20=20
>  int snb_pcode_read(struct intel_uncore *uncore, u32 mbox, u32 *val, u32 =
*val1);
>  int snb_pcode_write_timeout(struct intel_uncore *uncore, u32 mbox, u32 v=
al,
> @@ -26,5 +27,6 @@ int intel_pcode_init(struct intel_uncore *uncore);
>   */
>  int snb_pcode_read_p(struct intel_uncore *uncore, u32 mbcmd, u32 p1, u32=
 p2, u32 *val);
>  int snb_pcode_write_p(struct intel_uncore *uncore, u32 mbcmd, u32 p1, u3=
2 p2, u32 val);
> +int intel_pcode_enable_vram_sr(struct drm_i915_private *i915);
>=20=20
>  #endif /* _INTEL_PCODE_H */
> diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel=
_pm.c
> index 5a61fc3f26c1..299fbc5375a9 100644
> --- a/drivers/gpu/drm/i915/intel_pm.c
> +++ b/drivers/gpu/drm/i915/intel_pm.c
> @@ -8166,6 +8166,49 @@ void intel_pm_setup(struct drm_i915_private *dev_p=
riv)
>  	atomic_set(&dev_priv->runtime_pm.wakeref_count, 0);
>  }
>=20=20
> +void intel_pm_vram_sr_setup(struct drm_i915_private *i915)
> +{
> +	if (!HAS_LMEM_SR(i915))
> +		return;
> +
> +	mutex_init(&i915->vram_sr.lock);
> +
> +	i915->vram_sr.supported =3D intel_uncore_read(&i915->uncore,
> +						    VRAM_CAPABILITY) & VRAM_SUPPORTED;
> +	if (intel_opregion_vram_sr_required(i915))
> +		i915->vram_sr.supported =3D i915->vram_sr.supported &&
> +						intel_opregion_bios_supports_vram_sr(i915);
> +}
> +
> +int intel_pm_vram_sr(struct drm_i915_private *i915, bool enable)
> +{
> +	int ret =3D 0;
> +
> +	if (!HAS_LMEM_SR(i915))
> +		return -EOPNOTSUPP;

You can drop this and only look at i915->vram_sr.supported.

> +
> +	mutex_lock(&i915->vram_sr.lock);
> +	if (!i915->vram_sr.supported) {
> +		drm_dbg(&i915->drm, "VRAM Self Refresh is not supported\n");
> +		ret =3D -EOPNOTSUPP;
> +		goto unlock;
> +	}

This part doesn't need the mutex protection. You don't actually change
i915->vram_sr.supported anywhere after initialization.

> +
> +	drm_dbg(&i915->drm, "VRAM Self Refresh supported\n");
> +	if (enable)
> +		ret =3D intel_pcode_enable_vram_sr(i915);
> +
> +	if (ret)
> +		goto unlock;
> +
> +	intel_opregion_vram_sr(i915, enable);
> +
> +unlock:
> +	mutex_unlock(&i915->vram_sr.lock);
> +
> +	return ret;
> +}
> +
>  static struct intel_global_state *intel_dbuf_duplicate_state(struct inte=
l_global_obj *obj)
>  {
>  	struct intel_dbuf_state *dbuf_state;
> diff --git a/drivers/gpu/drm/i915/intel_pm.h b/drivers/gpu/drm/i915/intel=
_pm.h
> index 50604cf7398c..0da85d6b9ea7 100644
> --- a/drivers/gpu/drm/i915/intel_pm.h
> +++ b/drivers/gpu/drm/i915/intel_pm.h
> @@ -31,6 +31,8 @@ int ilk_wm_max_level(const struct drm_i915_private *dev=
_priv);
>  void intel_init_pm(struct drm_i915_private *dev_priv);
>  void intel_init_clock_gating_hooks(struct drm_i915_private *dev_priv);
>  void intel_pm_setup(struct drm_i915_private *dev_priv);
> +void intel_pm_vram_sr_setup(struct drm_i915_private *i915);
> +int intel_pm_vram_sr(struct drm_i915_private *i915, bool enable);
>  void g4x_wm_get_hw_state(struct drm_i915_private *dev_priv);
>  void vlv_wm_get_hw_state(struct drm_i915_private *dev_priv);
>  void ilk_wm_get_hw_state(struct drm_i915_private *dev_priv);

--=20
Jani Nikula, Intel Open Source Graphics Center
