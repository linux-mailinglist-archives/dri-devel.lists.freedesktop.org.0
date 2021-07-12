Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CB73C45DD
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 09:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8FB89B69;
	Mon, 12 Jul 2021 07:40:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A9E89B69;
 Mon, 12 Jul 2021 07:40:48 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10042"; a="209979588"
X-IronPort-AV: E=Sophos;i="5.84,232,1620716400"; d="scan'208";a="209979588"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 00:40:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,232,1620716400"; d="scan'208";a="459099758"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga008.jf.intel.com with SMTP; 12 Jul 2021 00:40:37 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 12 Jul 2021 10:40:36 +0300
Date: Mon, 12 Jul 2021 10:40:36 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH v4] drm/i915: Invoke another _DSM to enable MUX on HP
 Workstation laptops
Message-ID: <YOvx9PdqifXWIV1K@intel.com>
References: <20210520065832.614245-1-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210520065832.614245-1-kai.heng.feng@canonical.com>
X-Patchwork-Hint: comment
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 20, 2021 at 02:58:20PM +0800, Kai-Heng Feng wrote:
> On HP Fury G7 Workstations, graphics output is re-routed from Intel GFX
> to discrete GFX after S3. This is not desirable, because userspace will
> treat connected display as a new one, losing display settings.
> 
> The expected behavior is to let discrete GFX drives all external
> displays.
> 
> The platform in question uses ACPI method \_SB.PCI0.HGME to enable MUX.
> The method is inside the another _DSM, so add the _DSM and call it
> accordingly.
> 
> I also tested some MUX-less and iGPU only laptops with that _DSM, no
> regression was found.
> 
> v4:
>  - Rebase.
>  - Change the DSM name to avoid confusion.
>  - Move the function call to intel_opregion.
> 
> v3:
>  - Remove BXT from names.
>  - Change the parameter type.
>  - Fold the function into intel_modeset_init_hw().
> 
> v2:
>  - Forward declare struct pci_dev.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/3113
> References: https://lore.kernel.org/intel-gfx/1460040732-31417-4-git-send-email-animesh.manna@intel.com/
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

Thanks. Pushed to drm-intel-next. And sorry for the lag.

> ---
>  drivers/gpu/drm/i915/display/intel_acpi.c     | 19 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_acpi.h     |  3 +++
>  drivers/gpu/drm/i915/display/intel_opregion.c |  3 +++
>  3 files changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c b/drivers/gpu/drm/i915/display/intel_acpi.c
> index 833d0c1be4f1..7cfe91fc05f2 100644
> --- a/drivers/gpu/drm/i915/display/intel_acpi.c
> +++ b/drivers/gpu/drm/i915/display/intel_acpi.c
> @@ -19,6 +19,12 @@ static const guid_t intel_dsm_guid =
>  	GUID_INIT(0x7ed873d3, 0xc2d0, 0x4e4f,
>  		  0xa8, 0x54, 0x0f, 0x13, 0x17, 0xb0, 0x1c, 0x2c);
>  
> +#define INTEL_DSM_FN_GET_BIOS_DATA_FUNCS_SUPPORTED 0 /* No args */
> +
> +static const guid_t intel_dsm_guid2 =
> +	GUID_INIT(0x3e5b41c6, 0xeb1d, 0x4260,
> +		  0x9d, 0x15, 0xc7, 0x1f, 0xba, 0xda, 0xe4, 0x14);
> +
>  static char *intel_dsm_port_name(u8 id)
>  {
>  	switch (id) {
> @@ -176,6 +182,19 @@ void intel_unregister_dsm_handler(void)
>  {
>  }
>  
> +void intel_dsm_get_bios_data_funcs_supported(struct drm_i915_private *i915)
> +{
> +	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
> +	acpi_handle dhandle;
> +
> +	dhandle = ACPI_HANDLE(&pdev->dev);
> +	if (!dhandle)
> +		return;
> +
> +	acpi_evaluate_dsm(dhandle, &intel_dsm_guid2, INTEL_DSM_REVISION_ID,
> +			  INTEL_DSM_FN_GET_BIOS_DATA_FUNCS_SUPPORTED, NULL);
> +}
> +
>  /*
>   * ACPI Specification, Revision 5.0, Appendix B.3.2 _DOD (Enumerate All Devices
>   * Attached to the Display Adapter).
> diff --git a/drivers/gpu/drm/i915/display/intel_acpi.h b/drivers/gpu/drm/i915/display/intel_acpi.h
> index e8b068661d22..9f197401c313 100644
> --- a/drivers/gpu/drm/i915/display/intel_acpi.h
> +++ b/drivers/gpu/drm/i915/display/intel_acpi.h
> @@ -11,11 +11,14 @@ struct drm_i915_private;
>  #ifdef CONFIG_ACPI
>  void intel_register_dsm_handler(void);
>  void intel_unregister_dsm_handler(void);
> +void intel_dsm_get_bios_data_funcs_supported(struct drm_i915_private *i915);
>  void intel_acpi_device_id_update(struct drm_i915_private *i915);
>  #else
>  static inline void intel_register_dsm_handler(void) { return; }
>  static inline void intel_unregister_dsm_handler(void) { return; }
>  static inline
> +void intel_dsm_get_bios_data_funcs_supported(struct drm_i915_private *i915) { return; }
> +static inline
>  void intel_acpi_device_id_update(struct drm_i915_private *i915) { return; }
>  #endif /* CONFIG_ACPI */
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_opregion.c b/drivers/gpu/drm/i915/display/intel_opregion.c
> index dfd724e506b5..3855fba70980 100644
> --- a/drivers/gpu/drm/i915/display/intel_opregion.c
> +++ b/drivers/gpu/drm/i915/display/intel_opregion.c
> @@ -1078,6 +1078,9 @@ void intel_opregion_resume(struct drm_i915_private *i915)
>  		opregion->asle->ardy = ASLE_ARDY_READY;
>  	}
>  
> +	/* Some platforms abuse the _DSM to enable MUX */
> +	intel_dsm_get_bios_data_funcs_supported(i915);
> +
>  	intel_opregion_notify_adapter(i915, PCI_D0);
>  }
>  
> -- 
> 2.31.1

-- 
Ville Syrjälä
Intel
