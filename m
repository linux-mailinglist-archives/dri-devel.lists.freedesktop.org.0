Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B30444250C4
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 12:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 909F66F3DA;
	Thu,  7 Oct 2021 10:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343F46F3DA;
 Thu,  7 Oct 2021 10:10:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="207025283"
X-IronPort-AV: E=Sophos;i="5.85,354,1624345200"; d="scan'208";a="207025283"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 03:10:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,354,1624345200"; d="scan'208";a="560517398"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by FMSMGA003.fm.intel.com with SMTP; 07 Oct 2021 03:10:34 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 07 Oct 2021 13:10:32 +0300
Date: Thu, 7 Oct 2021 13:10:32 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 airlied@linux.ie, daniel@ffwll.ch, tiwai@suse.de,
 wanghaibin.wang@huawei.com, Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH] drm/i915: Free the returned object of acpi_evaluate_dsm()
Message-ID: <YV7HmF3J6RI9L40u@intel.com>
References: <20210906033541.862-1-yuzenghui@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210906033541.862-1-yuzenghui@huawei.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 06, 2021 at 11:35:41AM +0800, Zenghui Yu wrote:
> As per the comment on top of acpi_evaluate_dsm():
> 
> | * Evaluate device's _DSM method with specified GUID, revision id and
> | * function number. Caller needs to free the returned object.
> 
> We should free the returned object of acpi_evaluate_dsm() to avoid memory
> leakage. Otherwise the kmemleak splat will be triggered at boot time (if we
> compile kernel with CONFIG_DEBUG_TEST_DRIVER_REMOVE=y).
> 
> Fixes: 8e55f99c510f ("drm/i915: Invoke another _DSM to enable MUX on HP Workstation laptops")
> Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>

Applied to drm-intel-next. Thanks, and sorry for the lag.

> ---
>  drivers/gpu/drm/i915/display/intel_acpi.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c b/drivers/gpu/drm/i915/display/intel_acpi.c
> index 7cfe91fc05f2..68abeaf2d7d4 100644
> --- a/drivers/gpu/drm/i915/display/intel_acpi.c
> +++ b/drivers/gpu/drm/i915/display/intel_acpi.c
> @@ -186,13 +186,16 @@ void intel_dsm_get_bios_data_funcs_supported(struct drm_i915_private *i915)
>  {
>  	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
>  	acpi_handle dhandle;
> +	union acpi_object *obj;
>  
>  	dhandle = ACPI_HANDLE(&pdev->dev);
>  	if (!dhandle)
>  		return;
>  
> -	acpi_evaluate_dsm(dhandle, &intel_dsm_guid2, INTEL_DSM_REVISION_ID,
> -			  INTEL_DSM_FN_GET_BIOS_DATA_FUNCS_SUPPORTED, NULL);
> +	obj = acpi_evaluate_dsm(dhandle, &intel_dsm_guid2, INTEL_DSM_REVISION_ID,
> +				INTEL_DSM_FN_GET_BIOS_DATA_FUNCS_SUPPORTED, NULL);
> +	if (obj)
> +		ACPI_FREE(obj);
>  }
>  
>  /*
> -- 
> 2.19.1

-- 
Ville Syrjälä
Intel
