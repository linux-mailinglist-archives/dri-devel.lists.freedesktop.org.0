Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0485D9886B0
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 16:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A07010EC49;
	Fri, 27 Sep 2024 14:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n3MFVKqo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7B310EC49
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 14:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727446106; x=1758982106;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=KXzIM6EQQ+TLc2CdJItum9iXhDE2IvWQTXMDLhI1RN0=;
 b=n3MFVKqoHn9RsI0p420qYPDLn9dk+b3cgiIxMOVtN0wOBVJaeKVt9Mvq
 8lVyLgsTTUayN2T/GxDR1+t4Vma/257BbnhUuJQk56YmGUT3CCyLauuVx
 ZIoZPYi1ea8zFD/2HjrLnLa6CN5DeRplibReQUKfjvlJnlCZCbvFLQanF
 PXxDCNCPM4+8pMnBBJzyny2Nl/vz9ym00vugn/bidtr8dDNjs1G265+fI
 zxvoFXCMuJKmhUtOjdg4hTettPYmWqPDTxMjtUcdUTgTecLDfOJA8wr1I
 XCaYLYNcEACcw1OjeErRH+rD2NeUzvHypfiDe1Iq0SL80KZn+XvJT/GSw A==;
X-CSE-ConnectionGUID: 8Mk37rStQh6WwJIH+OIpow==
X-CSE-MsgGUID: N+r/h3p5R4CYtns08yAVrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="14210565"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="14210565"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 07:08:25 -0700
X-CSE-ConnectionGUID: z+8TlRe1T5yn7gbPva5pQQ==
X-CSE-MsgGUID: jF1Ot04WReG324rjr+N3yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="77375865"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.211])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 07:08:22 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/5] drm/mgag200: vga-bmc: Transparently handle BMC
In-Reply-To: <20240805130622.63458-3-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240805130622.63458-1-tzimmermann@suse.de>
 <20240805130622.63458-3-tzimmermann@suse.de>
Date: Fri, 27 Sep 2024 17:08:16 +0300
Message-ID: <87msjtxk8f.fsf@intel.com>
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

On Mon, 05 Aug 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> The VGA-BMC connector selects the VGA output if a display has been
> attached to the physical connector. Otherwise it selects the BMC
> output. In any case, the connector status is set to 'detected', so
> that the userspace compositor displays to it.
>
> Depending on the setting, the connector's display modes either come
> from the VGA monitor's EDID or from an internal list of BMC-compatible
> modes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/mgag200/mgag200_vga_bmc.c | 50 ++++++++++++++++++++++-
>  1 file changed, 48 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c b/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
> index b6b90632b3c6..3a958c3587ac 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_edid.h>
>  #include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_probe_helper.h>
>  
> @@ -11,9 +12,54 @@ static const struct drm_encoder_funcs mgag200_dac_encoder_funcs = {
>  	.destroy = drm_encoder_cleanup
>  };
>  
> +static int mgag200_vga_bmc_connector_helper_get_modes(struct drm_connector *connector)
> +{
> +	struct mga_device *mdev = to_mga_device(connector->dev);
> +	const struct mgag200_device_info *minfo = mdev->info;
> +	int count;
> +
> +	count = drm_connector_helper_get_modes(connector);
> +
> +	if (!count) {
> +		/*
> +		 * There's no EDID data without a connected monitor. Set BMC-
> +		 * compatible modes in this case. The XGA default resolution
> +		 * should work well for all BMCs.
> +		 */
> +		count = drm_add_modes_noedid(connector, minfo->max_hdisplay, minfo->max_vdisplay);
> +		if (count)
> +			drm_set_preferred_mode(connector, 1024, 768);
> +	}
> +
> +	return count;
> +}
> +
> +/*
> + * There's no monitor connected if the DDC did not return an EDID. Still
> + * return 'connected' as there's always a BMC. Incrementing the connector's
> + * epoch counter triggers an update of the related properties.
> + */
> +static int mgag200_vga_bmc_connector_helper_detect_ctx(struct drm_connector *connector,
> +						       struct drm_modeset_acquire_ctx *ctx,
> +						       bool force)
> +{
> +	enum drm_connector_status old_status, status;
> +
> +	if (connector->edid_blob_ptr)

This is now the only place outside of drm_edid.c that uses edid_blob_ptr
for anything.

Seems like you're using it as a proxy for "had a display connected".

I wish it could be kept private to the EDID code.


BR,
Jani.


> +		old_status = connector_status_connected;
> +	else
> +		old_status = connector_status_disconnected;
> +
> +	status = drm_connector_helper_detect_from_ddc(connector, ctx, force);
> +
> +	if (status != old_status)
> +		++connector->epoch_counter;
> +	return connector_status_connected;
> +}
> +
>  static const struct drm_connector_helper_funcs mgag200_vga_connector_helper_funcs = {
> -	.get_modes = drm_connector_helper_get_modes,
> -	.detect_ctx = drm_connector_helper_detect_from_ddc
> +	.get_modes = mgag200_vga_bmc_connector_helper_get_modes,
> +	.detect_ctx = mgag200_vga_bmc_connector_helper_detect_ctx,
>  };
>  
>  static const struct drm_connector_funcs mgag200_vga_connector_funcs = {

-- 
Jani Nikula, Intel
