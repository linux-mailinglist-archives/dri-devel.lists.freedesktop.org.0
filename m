Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF128401E8
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 10:39:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40C110F697;
	Mon, 29 Jan 2024 09:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF6010F6A8;
 Mon, 29 Jan 2024 09:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706521180; x=1738057180;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=vUokWzEw5+VC5jpC2OPRStu+GWoiZ2lrs+sppMiHM5k=;
 b=DiK3P93Zk8DZxJKkBJbtJAt8nTd9VgOgq7WddB1boej3/y6zu/jB2mje
 6JDWppiqXnjdTecPIZXMGZo9ZhuFFQlM94aJXZSKA1Beqv0VJauX4SISr
 JR2qFdiFacmO7UEoCE3+kkoCS/X4ftQ9jehGMpnw4NlsLFdy+bzRWOU2X
 LERX/xLMjhEHsWg6TJEvcOJkPD/wQz/0spT3pQg1Ukw/utktXB/hTYI5O
 y7kt6rHEYJp51yL8q7RpnWAjT0tehKjfSPXwk8Sw0mke1JwHqWz1U9fmq
 AxqX1vv6/GoyRh+8IoIRnfjpBeV2aKqkveLhYG8x6PClWmjVU1+u8nhj6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="9650777"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="9650777"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 01:39:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="3246388"
Received: from hbrandbe-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.53])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 01:39:34 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 2/2] drm/amd: Fetch the EDID from _DDC if available for eDP
In-Reply-To: <20240126184639.8187-3-mario.limonciello@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240126184639.8187-1-mario.limonciello@amd.com>
 <20240126184639.8187-3-mario.limonciello@amd.com>
Date: Mon, 29 Jan 2024 11:39:32 +0200
Message-ID: <87le88jx63.fsf@intel.com>
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
Cc: open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>, "open
 list:ACPI" <linux-acpi@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 26 Jan 2024, Mario Limonciello <mario.limonciello@amd.com> wrote:
> Some manufacturers have intentionally put an EDID that differs from
> the EDID on the internal panel on laptops.
>
> Attempt to fetch this EDID if it exists and prefer it over the EDID
> that is provided by the panel.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  2 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c      | 30 +++++++++++++++++++
>  .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    |  5 ++++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  8 ++++-
>  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  7 +++--
>  5 files changed, 49 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index c5f3859fd682..99abe12567a4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1520,6 +1520,7 @@ int amdgpu_acpi_get_mem_info(struct amdgpu_device *adev, int xcc_id,
>  
>  void amdgpu_acpi_get_backlight_caps(struct amdgpu_dm_backlight_caps *caps);
>  bool amdgpu_acpi_should_gpu_reset(struct amdgpu_device *adev);
> +void *amdgpu_acpi_edid(struct amdgpu_device *adev, struct drm_connector *connector);
>  void amdgpu_acpi_detect(void);
>  void amdgpu_acpi_release(void);
>  #else
> @@ -1537,6 +1538,7 @@ static inline int amdgpu_acpi_get_mem_info(struct amdgpu_device *adev,
>  }
>  static inline void amdgpu_acpi_fini(struct amdgpu_device *adev) { }
>  static inline bool amdgpu_acpi_should_gpu_reset(struct amdgpu_device *adev) { return false; }
> +static inline void *amdgpu_acpi_edid(struct amdgpu_device *adev, struct drm_connector *connector) { return NULL; }
>  static inline void amdgpu_acpi_detect(void) { }
>  static inline void amdgpu_acpi_release(void) { }
>  static inline bool amdgpu_acpi_is_power_shift_control_supported(void) { return false; }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> index e550067e5c5d..c106335f1f22 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -1380,6 +1380,36 @@ bool amdgpu_acpi_should_gpu_reset(struct amdgpu_device *adev)
>  #endif
>  }
>  
> +/**
> + * amdgpu_acpi_edid
> + * @adev: amdgpu_device pointer
> + * @connector: drm_connector pointer
> + *
> + * Returns the EDID used for the internal panel if present, NULL otherwise.
> + */
> +void *
> +amdgpu_acpi_edid(struct amdgpu_device *adev, struct drm_connector *connector)
> +{
> +	struct drm_device *ddev = adev_to_drm(adev);
> +	struct acpi_device *acpidev = ACPI_COMPANION(ddev->dev);
> +	void *edid;
> +	int r;
> +
> +	if (!acpidev)
> +		return NULL;
> +
> +	if (connector->connector_type != DRM_MODE_CONNECTOR_eDP)
> +		return NULL;
> +
> +	r = acpi_video_get_edid(acpidev, ACPI_VIDEO_DISPLAY_LCD, -1, &edid);
> +	if (r < 0) {
> +		DRM_DEBUG_DRIVER("Failed to get EDID from ACPI: %d\n", r);
> +		return NULL;
> +	}
> +
> +	return kmemdup(edid, r, GFP_KERNEL);
> +}
> +
>  /*
>   * amdgpu_acpi_detect - detect ACPI ATIF/ATCS methods
>   *
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> index 9caba10315a8..c7e1563a46d3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> @@ -278,6 +278,11 @@ static void amdgpu_connector_get_edid(struct drm_connector *connector)
>  	struct amdgpu_device *adev = drm_to_adev(dev);
>  	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
>  
> +	if (amdgpu_connector->edid)
> +		return;
> +
> +	/* if the BIOS specifies the EDID via _DDC, prefer this */
> +	amdgpu_connector->edid = amdgpu_acpi_edid(adev, connector);

Imagine the EDID returned by acpi_video_get_edid() has edid->extensions
bigger than 4. Of course it should not, but you have no guarantees, and
it originates outside of the kernel.

The real fix is to have the function return a struct drm_edid which
tracks the allocation size separately. Unfortunately, it requires a
bunch of changes along the way. We've mostly done it in i915, and I've
sent a series to do this in drm/bridge [1].

Bottom line, we should stop using struct edid in drivers. They'll all
parse the info differently, and from what I've seen, often wrong.


BR,
Jani.


[1] https://patchwork.freedesktop.org/series/128149/


>  	if (amdgpu_connector->edid)
>  		return;
>  
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index cd98b3565178..1faa21f542bd 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6562,17 +6562,23 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
>  {
>  	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
>  	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
> +	struct amdgpu_device *adev = drm_to_adev(connector->dev);
>  	struct dc_link *dc_link = aconnector->dc_link;
>  	struct dc_sink *dc_em_sink = aconnector->dc_em_sink;
>  	struct edid *edid;
>  
> +	/* prefer ACPI over panel for eDP */
> +	edid = amdgpu_acpi_edid(adev, connector);
> +
>  	/*
>  	 * Note: drm_get_edid gets edid in the following order:
>  	 * 1) override EDID if set via edid_override debugfs,
>  	 * 2) firmware EDID if set via edid_firmware module parameter
>  	 * 3) regular DDC read.
>  	 */
> -	edid = drm_get_edid(connector, &amdgpu_connector->ddc_bus->aux.ddc);
> +	if (!edid)
> +		edid = drm_get_edid(connector, &amdgpu_connector->ddc_bus->aux.ddc);
> +
>  	if (!edid) {
>  		DRM_ERROR("No EDID found on connector: %s.\n", connector->name);
>  		return;
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index e3915c4f8566..6bf2a8867e76 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -895,6 +895,7 @@ enum dc_edid_status dm_helpers_read_local_edid(
>  {
>  	struct amdgpu_dm_connector *aconnector = link->priv;
>  	struct drm_connector *connector = &aconnector->base;
> +	struct amdgpu_device *adev = drm_to_adev(connector->dev);
>  	struct i2c_adapter *ddc;
>  	int retry = 3;
>  	enum dc_edid_status edid_status;
> @@ -909,8 +910,10 @@ enum dc_edid_status dm_helpers_read_local_edid(
>  	 * do check sum and retry to make sure read correct edid.
>  	 */
>  	do {
> -
> -		edid = drm_get_edid(&aconnector->base, ddc);
> +		/* prefer ACPI over panel for eDP */
> +		edid = amdgpu_acpi_edid(adev, connector);
> +		if (!edid)
> +			edid = drm_get_edid(&aconnector->base, ddc);
>  
>  		/* DP Compliance Test 4.2.2.6 */
>  		if (link->aux_mode && connector->edid_corrupt)

-- 
Jani Nikula, Intel
