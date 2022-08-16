Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B48CE59547D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 10:06:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D9E18BB04;
	Tue, 16 Aug 2022 08:06:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B629D10F9E7;
 Tue, 16 Aug 2022 08:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660637191; x=1692173191;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=w+c/e2AkjNu1SyDCQR+vXt15ugvR4JTciB+nrN0p4kI=;
 b=hzMjQtmUBWFEKFr46bEQkS9rZUJeRdsSwnzugAHkAiKwh/mS9AvzaCGF
 0SpCNuBorQgPQm7IdCLHyka439Gnc8chelkTa9CZj120gQWjmxKlyDgiD
 1cmLnCRpzdchDuTTKoJZd+TS8GadCoxfdPCVD/lUv0N6I14M53MI5R7AC
 dN5TSpdIDCj1y+3kEnSz8YXCyMfhvHn5brlIPf/VO/7ZTKimP+j20eVBA
 mjmWVkQXXrclkN5xGqdAf8CAhxmepBN5IDKiN2o7GPRf/hAqIHymp4m2P
 /auWmBj83O40cv7m+Xfdsk0Djnsrcir5c9/OJig5DCv4k+MQKeIOacPNz A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="289726867"
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; d="scan'208";a="289726867"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 01:06:24 -0700
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; d="scan'208";a="667006509"
Received: from kinzelba-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.39.194])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 01:06:20 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tvrtko.ursulin@linux.intel.com
Subject: Re: [PATCH] drm/i915: Switch TGL-H DP-IN to dGFX when it's supported
In-Reply-To: <20220816025217.618181-1-kai.heng.feng@canonical.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220816025217.618181-1-kai.heng.feng@canonical.com>
Date: Tue, 16 Aug 2022 11:06:18 +0300
Message-ID: <87leror4sl.fsf@intel.com>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, Zenghui Yu <yuzenghui@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 16 Aug 2022, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
> On mobile workstations like HP ZBook Fury G8, iGFX's DP-IN can switch to
> dGFX so external monitors are routed to dGFX, and more monitors can be
> supported as result.
>
> To switch the DP-IN to dGFX, the driver needs to invoke _DSM function 20
> on intel_dsm_guid2. This method is described in Intel document 632107.

Is this the policy decision that we want to unconditionally make,
though?

BR,
Jani.

>
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
>  drivers/gpu/drm/i915/display/intel_acpi.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c b/drivers/gpu/drm/i915/display/intel_acpi.c
> index e78430001f077..3bd5930e2769b 100644
> --- a/drivers/gpu/drm/i915/display/intel_acpi.c
> +++ b/drivers/gpu/drm/i915/display/intel_acpi.c
> @@ -20,6 +20,7 @@ static const guid_t intel_dsm_guid =
>  		  0xa8, 0x54, 0x0f, 0x13, 0x17, 0xb0, 0x1c, 0x2c);
>  
>  #define INTEL_DSM_FN_GET_BIOS_DATA_FUNCS_SUPPORTED 0 /* No args */
> +#define INTEL_DSM_FN_DP_IN_SWITCH_TO_DGFX 20 /* No args */
>  
>  static const guid_t intel_dsm_guid2 =
>  	GUID_INIT(0x3e5b41c6, 0xeb1d, 0x4260,
> @@ -187,6 +188,7 @@ void intel_dsm_get_bios_data_funcs_supported(struct drm_i915_private *i915)
>  	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
>  	acpi_handle dhandle;
>  	union acpi_object *obj;
> +	int supported = 0;
>  
>  	dhandle = ACPI_HANDLE(&pdev->dev);
>  	if (!dhandle)
> @@ -194,8 +196,22 @@ void intel_dsm_get_bios_data_funcs_supported(struct drm_i915_private *i915)
>  
>  	obj = acpi_evaluate_dsm(dhandle, &intel_dsm_guid2, INTEL_DSM_REVISION_ID,
>  				INTEL_DSM_FN_GET_BIOS_DATA_FUNCS_SUPPORTED, NULL);
> -	if (obj)
> +	if (obj) {
> +		if (obj->type == ACPI_TYPE_INTEGER)
> +			supported = obj->integer.value;
> +
>  		ACPI_FREE(obj);
> +	}
> +
> +	/* Tiger Lake H DP-IN Boot Time Switching from iGfx to dGfx */
> +	if (supported & BIT(20)) {
> +		obj = acpi_evaluate_dsm(dhandle, &intel_dsm_guid2,
> +					INTEL_DSM_REVISION_ID,
> +					INTEL_DSM_FN_DP_IN_SWITCH_TO_DGFX,
> +					NULL);
> +		if (obj)
> +			ACPI_FREE(obj);
> +	}
>  }
>  
>  /*

-- 
Jani Nikula, Intel Open Source Graphics Center
