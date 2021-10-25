Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2565E439125
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 10:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9163E89DEC;
	Mon, 25 Oct 2021 08:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB3E89DA5;
 Mon, 25 Oct 2021 08:25:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10147"; a="229457608"
X-IronPort-AV: E=Sophos;i="5.87,179,1631602800"; d="scan'208";a="229457608"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 01:25:25 -0700
X-IronPort-AV: E=Sophos;i="5.87,179,1631602800"; d="scan'208";a="485580144"
Received: from atmozipo-mobl.amr.corp.intel.com (HELO localhost)
 ([10.249.43.83])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 01:25:21 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 Tsuchiya Yuto <kitakar@gmail.com>, "Deak\, Imre" <imre.deak@intel.com>
Subject: Re: [PATCH] drm/i915: Add NO_VLV_DISP_PW_DPIO_CMN_BC_INIT quirk
In-Reply-To: <20211024155010.126275-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211024155010.126275-1-hdegoede@redhat.com>
Date: Mon, 25 Oct 2021 11:25:18 +0300
Message-ID: <877de1lde9.fsf@intel.com>
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

On Sun, 24 Oct 2021, Hans de Goede <hdegoede@redhat.com> wrote:
> Add a NO_VLV_DISP_PW_DPIO_CMN_BC_INIT quirk to fix i915 not working on
> the Xiaomi Mi Pad 2 (with CHT x5-Z8500 SoC).
>
> The Xiaomi Mi Pad 2 uses quite an unusual hardware-design for a Cherry
> Trail tablet. It deviates from the typical reference design based tablets
> in many ways.
>
> The Mi Pad 2 does not have any DisplayPort or HDMI outouts. I suspect that
> as part of its unusual design it also has some supply rail which is only
> used for DisplayPort or HDMI not connected.
>
> Force-enabling the dpio-common-bc powerwell as the i915 normal does at boot
> appears to cause the P-Unit to hang. When booting with a serial-usb console
> the following errors are logged before the system freezes:
>
>  i915 0000:00:02.0: [drm] *ERROR* timeout setting power well state 00000000 (fffff3ff)
>  i915 0000:00:02.0: [drm] *ERROR* Display PHY 0 is not power up
>  ------------[ cut here ]------------
>  i915 0000:00:02.0: DPIO read pipe A reg 0x8170 == 0xffffffff
>  WARNING: CPU: 3 PID: 258 at drivers/gpu/drm/i915/intel_sideband.c:257 vlv_dpio_read+0x95/0xb0 [i915]
>  ...
>  Call Trace:
>   chv_dpio_cmn_power_well_enable+0xab/0x210 [i915]
>   __intel_display_power_get_domain.part.0+0xa0/0xc0 [i915]
>   intel_power_domains_init_hw+0x26d/0x760 [i915]
>   intel_modeset_init_noirq+0x5d/0x270 [i915]
>   i915_driver_probe+0x6b6/0xd10 [i915]
>   ...
>
> If I disable the WARN about the register being 0xffffffff, so that the
> system can log some more dmesg output over the serial console before
> freezing, the following errors are also logged:
>
>  i915 0000:00:02.0: [drm] *ERROR* timeout setting power well state 00000000 (fcfff3ff)
>  i915 0000:00:02.0: [drm] *ERROR* Display PHY 1 is not power up
>
> With this patch to disable the force-enabling of the PHY 0 / dpio-common-bc
> powerwell in place, this error for PHY 1 goes away. So it seems that trying
> the force-enabling of the PHY 0 / dpio-common-bc powerwell freezes the
> P-Unit, causing the subsequent enabling of PHY 1 to also fail (and causing
> the entire system to freeze within seconds).
>
> With this patch the PHY 1 error disappears and the entire system works.
>
> Note this change also moves the intel_init_quirks() call a bit up inside
> intel_modeset_init_noirq() this is necessary so that the quirk is set
> before the intel_power_domains_init_hw() call. This is harmless, all that
> intel_init_quirks() does is set some bits in drm_i915_private.quirks and
> make some drm_info() log calls.
>
> Reported-by: Tsuchiya Yuto <kitakar@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c     |  4 ++--
>  .../gpu/drm/i915/display/intel_display_power.c   | 16 ++++++++++++++--
>  drivers/gpu/drm/i915/display/intel_quirks.c      | 10 ++++++++++
>  drivers/gpu/drm/i915/i915_drv.h                  |  1 +
>  4 files changed, 27 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 015854b5078c..1fb885cc86c9 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -12467,6 +12467,8 @@ int intel_modeset_init_noirq(struct drm_i915_private *i915)
>  	if (ret)
>  		goto cleanup_bios;
>  
> +	intel_init_quirks(i915);
> +
>  	/* FIXME: completely on the wrong abstraction layer */
>  	intel_power_domains_init_hw(i915, false);
>  
> @@ -12501,8 +12503,6 @@ int intel_modeset_init_noirq(struct drm_i915_private *i915)
>  	INIT_WORK(&i915->atomic_helper.free_work,
>  		  intel_atomic_helper_free_state_worker);
>  
> -	intel_init_quirks(i915);
> -
>  	intel_fbc_init(i915);
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
> index cce1a926fcc1..eeaba3dc064b 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power.c
> @@ -2090,8 +2090,14 @@ __intel_display_power_get_domain(struct drm_i915_private *dev_priv,
>  	if (intel_display_power_grab_async_put_ref(dev_priv, domain))
>  		return;
>  
> -	for_each_power_domain_well(dev_priv, power_well, BIT_ULL(domain))
> +	for_each_power_domain_well(dev_priv, power_well, BIT_ULL(domain)) {
> +		if (domain == POWER_DOMAIN_INIT &&
> +		    (dev_priv->quirks & QUIRK_NO_VLV_DISP_PW_DPIO_CMN_BC_INIT) &&
> +		    power_well->desc->id == VLV_DISP_PW_DPIO_CMN_BC)
> +			continue;
> +
>  		intel_power_well_get(dev_priv, power_well);
> +	}

Cc: Imre

There has got to be a way to hide this better. Having this here is
unacceptable.


BR,
Jani.

>  
>  	power_domains->domain_use_count[domain]++;
>  }
> @@ -2184,8 +2190,14 @@ __intel_display_power_put_domain(struct drm_i915_private *dev_priv,
>  
>  	power_domains->domain_use_count[domain]--;
>  
> -	for_each_power_domain_well_reverse(dev_priv, power_well, BIT_ULL(domain))
> +	for_each_power_domain_well_reverse(dev_priv, power_well, BIT_ULL(domain)) {
> +		if (domain == POWER_DOMAIN_INIT &&
> +		    (dev_priv->quirks & QUIRK_NO_VLV_DISP_PW_DPIO_CMN_BC_INIT) &&
> +		    power_well->desc->id == VLV_DISP_PW_DPIO_CMN_BC)
> +			continue;
> +
>  		intel_power_well_put(dev_priv, power_well);
> +	}
>  }
>  
>  static void __intel_display_power_put(struct drm_i915_private *dev_priv,
> diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
> index 8a52b7a16774..c377f515bbf4 100644
> --- a/drivers/gpu/drm/i915/display/intel_quirks.c
> +++ b/drivers/gpu/drm/i915/display/intel_quirks.c
> @@ -59,6 +59,13 @@ static void quirk_no_pps_backlight_power_hook(struct drm_i915_private *i915)
>  	drm_info(&i915->drm, "Applying no pps backlight power quirk\n");
>  }
>  
> +/* The Xiaomi Mi Pad 2 CHT tablet hangs on enabling the dpio-common-bc well */
> +static void quirk_no_vlv_disp_pw_dpio_cmn_bc_init(struct drm_i915_private *i915)
> +{
> +	i915->quirks |= QUIRK_NO_VLV_DISP_PW_DPIO_CMN_BC_INIT;
> +	drm_info(&i915->drm, "Applying no dpio-common-bc powerwell init quirk\n");
> +}
> +
>  struct intel_quirk {
>  	int device;
>  	int subsystem_vendor;
> @@ -190,6 +197,9 @@ static struct intel_quirk intel_quirks[] = {
>  	/* ASRock ITX*/
>  	{ 0x3185, 0x1849, 0x2212, quirk_increase_ddi_disabled_time },
>  	{ 0x3184, 0x1849, 0x2212, quirk_increase_ddi_disabled_time },
> +
> +	/* Xiaomi Mi Pad 2 */
> +	{ 0x22b0, 0x1d72, 0x1502, quirk_no_vlv_disp_pw_dpio_cmn_bc_init },
>  };
>  
>  void intel_init_quirks(struct drm_i915_private *i915)
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 005b1cec7007..b907b49b4f0e 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -524,6 +524,7 @@ struct i915_drrs {
>  #define QUIRK_INCREASE_T12_DELAY (1<<6)
>  #define QUIRK_INCREASE_DDI_DISABLED_TIME (1<<7)
>  #define QUIRK_NO_PPS_BACKLIGHT_POWER_HOOK (1<<8)
> +#define QUIRK_NO_VLV_DISP_PW_DPIO_CMN_BC_INIT (1<<9)
>  
>  struct intel_fbdev;
>  struct intel_fbc_work;

-- 
Jani Nikula, Intel Open Source Graphics Center
