Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CE6649ADC
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 10:15:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CAB110E17A;
	Mon, 12 Dec 2022 09:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F390410E17D;
 Mon, 12 Dec 2022 09:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670836526; x=1702372526;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4qWOYjI6HzAFqdDSK6MP2+ZJuunk3nHdTzyaWN88PzU=;
 b=O3bMuv7mKN8/Y4ClIPxw+2oKwGF0CbnUvNT4X7fj+tJx9WWFHxiq5ljf
 Y5/r0lxh81dNSlB2dMHrbwN9bcyFgeu/WLjEBBdFVH6ZqSIsfKZ+bkYAJ
 jlU8LR+zg1vCb0oCtIED4Zr9F5na+HFVwhZvqfyqqJX5eKPx6FXPFQxLO
 IoXyX5Dh/98LunvbOdgwCfP4WHe7A76fohkSWPcP06S9DT26vzLTe6UQL
 REpKVgGUh+WtQcsbTdenirg+5L0WOr9dG2d4tqXSTc2icAyNe7weSYbSk
 A4IxHCLVt4Pi/lMzuJuiKp/mBaWCmI0IBBFqwyYoyDVYTH8tNERVxDPJV g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10558"; a="404064355"
X-IronPort-AV: E=Sophos;i="5.96,237,1665471600"; d="scan'208";a="404064355"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2022 01:15:25 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10558"; a="790422882"
X-IronPort-AV: E=Sophos;i="5.96,237,1665471600"; d="scan'208";a="790422882"
Received: from sshumihi-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.5.95])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2022 01:15:22 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Alexey Lukyanchuk <skif@skif-web.ru>, tvrtko.ursulin@linux.intel.com
Subject: Re: [PATCH RFC] fix dell wyse 3040 poweroff
In-Reply-To: <20221210180118.22087-1-skif@skif-web.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221210180118.22087-1-skif@skif-web.ru>
Date: Mon, 12 Dec 2022 11:15:19 +0200
Message-ID: <87y1rdx9so.fsf@intel.com>
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
Cc: Alexey Lukyanchuk <skif@skif-web.ru>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 10 Dec 2022, Alexey Lukyanchuk <skif@skif-web.ru> wrote:
> Dell wyse 3040 cat't poweroff aftet kernel 5.11.
> It happens  because i915_driver_shutdown function.
> Disabling of this function mitigate this problem.
>
> Fixes: 440b354f3 ("drivers/gpu/drm:power off troubles on dell wyse 3040") 

Fixes: is supposed to reference an existing commit.

> Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru> 
> ---
> There is trouble with i915_driver_shutdown function. After some diving I found that trouble looks like race condition in drm_atomic_get_connector_state function (drivers/gpu/drm/drm_atomic.c), maybe it linked to iterators. Now I fully exclude i915_driver_shutdown for wyse 3040 device.
>
> Can any one comment on this one please ? 

Bypassing the entire shutdown function is not an acceptable quirk.

Please file a bug over at fdo gitlab [1]. Add drm.debug=0xe module
parameter, and attach dmesg from boot to reproducing the problem. Add
log_buf_len=8M or similar as necessary to get the complete dmesg.

Have you tried the more recent kernels?

BR,
Jani.


[1] https://gitlab.freedesktop.org/drm/intel/wikis/How-to-file-i915-bugs


> ---
>  drivers/gpu/drm/i915/display/intel_quirks.c | 25 +++++++++++++++++++++
>  drivers/gpu/drm/i915/i915_driver.c          |  3 +++
>  drivers/gpu/drm/i915/i915_drv.h             |  1 +
>  3 files changed, 29 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
> index e415cd7c0..a6a549d48 100644
> --- a/drivers/gpu/drm/i915/display/intel_quirks.c
> +++ b/drivers/gpu/drm/i915/display/intel_quirks.c
> @@ -60,6 +60,12 @@ static void quirk_no_pps_backlight_power_hook(struct drm_i915_private *i915)
>  	drm_info(&i915->drm, "Applying no pps backlight power quirk\n");
>  }
>  
> +static void quirk_wyse_3040_shutdown_fix(struct drm_i915_private *i915)
> +{
> +	i915->quirks |= QUIRK_WYSE_3040_SHUTDOWN_FIX;
> +	drm_info(&i915->drm, "Applying wyse 3040 shutdown fix\n");
> +}
> +
>  struct intel_quirk {
>  	int device;
>  	int subsystem_vendor;
> @@ -85,6 +91,12 @@ static int intel_dmi_no_pps_backlight(const struct dmi_system_id *id)
>  	return 1;
>  }
>  
> +static int wyse_3040_shutdown_fix(const struct dmi_system_id *id)
> +{
> +	DRM_INFO("This device need help with poweroff %s\n", id->ident);
> +	return 1;
> +}
> +
>  static const struct intel_dmi_quirk intel_dmi_quirks[] = {
>  	{
>  		.dmi_id_list = &(const struct dmi_system_id[]) {
> @@ -131,6 +143,19 @@ static const struct intel_dmi_quirk intel_dmi_quirks[] = {
>  		},
>  		.hook = quirk_no_pps_backlight_power_hook,
>  	},
> +	{
> +		.dmi_id_list = &(const struct dmi_system_id[]) {
> +			{
> +				.callback = wyse_3040_shutdown_fix,
> +				.ident = "Dell Inc. 0G56C0",
> +				.matches = {DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Dell Inc."),
> +					    DMI_EXACT_MATCH(DMI_BOARD_NAME, "0G56C0"),
> +				},
> +			},
> +			{ }
> +		},
> +		.hook = quirk_wyse_3040_shutdown_fix,
> +	},
>  };
>  
>  static struct intel_quirk intel_quirks[] = {
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index deb8a8b76..af60fb79a 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -1079,6 +1079,9 @@ static void intel_shutdown_encoders(struct drm_i915_private *dev_priv)
>  
>  void i915_driver_shutdown(struct drm_i915_private *i915)
>  {
> +	if (!(i915->quirks & QUIRK_WYSE_3040_SHUTDOWN_FIX))
> +		return;
> +
>  	disable_rpm_wakeref_asserts(&i915->runtime_pm);
>  	intel_runtime_pm_disable(&i915->runtime_pm);
>  	intel_power_domains_disable(i915);
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 086bbe894..fdd6866e7 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -200,6 +200,7 @@ struct drm_i915_display_funcs {
>  #define QUIRK_INCREASE_T12_DELAY (1<<6)
>  #define QUIRK_INCREASE_DDI_DISABLED_TIME (1<<7)
>  #define QUIRK_NO_PPS_BACKLIGHT_POWER_HOOK (1<<8)
> +#define QUIRK_WYSE_3040_SHUTDOWN_FIX (1<<9)
>  
>  struct i915_suspend_saved_registers {
>  	u32 saveDSPARB;

-- 
Jani Nikula, Intel Open Source Graphics Center
