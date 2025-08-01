Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E34CAB1818A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 14:19:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72BFB10E070;
	Fri,  1 Aug 2025 12:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NVnzLlyA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1D010E070
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 12:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754050757; x=1785586757;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=XE8MwQfjcnyAnEktcaEH8sZ3y2b2AklUggRNz6+yXLA=;
 b=NVnzLlyAi3dafByQgzZrtaLn6HXbOATOv5MMv3J9MUxhPAMjtoIpuLmP
 Up6o3tKCbN4g/QYD/frgg8hGttXWy6znX45CZf1NOdcTr2Uw4ya87cGcB
 DQeQKH1uNVgylRBrw0/FvsQjfTPETvAHEEbqM5Lpj1CLHc5HpdFeZeZC/
 tVUe2UuW7259Vgq/0+YNSh2AIcoyhEjPd1Q2S5Uup4zwomp+9SwrDfpL/
 O5+C6hote+ML+UrUf2F+QJyXdwsfr6kMCsGOjj85WRoLQnUjdQq008eKe
 TbYq12SBw+tb5lwa6K9KEVfDGHQwdRGW8tox3GA5nCrsv1QoWM8U0LF33 A==;
X-CSE-ConnectionGUID: D/XMFAOATGeT947BHeXgLg==
X-CSE-MsgGUID: OJNa4VugSq6keVQ+ocGbVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="73853402"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="73853402"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 05:19:17 -0700
X-CSE-ConnectionGUID: GQTlK/EEQimgihbWmH942Q==
X-CSE-MsgGUID: 0b556gS8QJe2J2yDoVo28w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="163253903"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.164])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 05:19:14 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Marius Vlad <marius.vlad@collabora.com>, dri-devel@lists.freedesktop.org
Cc: daniel.stone@collabora.com, tzimmermann@suse.de, simona.vetter@ffwll.ch,
 marius.vlad@collabora.com, derek.foreman@collabora.com
Subject: Re: [PATCH] drm/connector: hdmi: Add a link bpc property
In-Reply-To: <20250801101750.1726-1-marius.vlad@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250801101750.1726-1-marius.vlad@collabora.com>
Date: Fri, 01 Aug 2025 15:19:08 +0300
Message-ID: <a1c36f0b76eecbb6a4e23d71da053d89f7193b0d@intel.com>
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

On Fri, 01 Aug 2025, Marius Vlad <marius.vlad@collabora.com> wrote:
> From: Derek Foreman <derek.foreman@collabora.com>
>
> Add a way to know the actual bpc of a running link.
>
> Drivers might change the current bpc link value due to changes in mode
> line or refresh rates. For example when enabling VRR the underlying
> hardware might not be able sustain the same bandwidth for a particular
> mode line, and it might attempt to lower the bpc. Another example can be
> found when switching the color output format, part of YUV420 fallback.
>
> This means we might be displaying a stale bpc value although it was
> modified for different reasons -- like a refresh rate or an output
> color format.
>
> This patch introduces a new property 'link bpc' that user-space can

Nitpick, s/This patch introduces/Introduce/.

> use to get the current bpc value of a running link. In the same
> time this would allow user-space set up bpc using 'max_bpc' property.
>
> Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c |  5 +++++
>  drivers/gpu/drm/drm_connector.c   | 26 ++++++++++++++++++++++++++
>  include/drm/drm_connector.h       |  8 ++++++++
>  3 files changed, 39 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index ecc73d52bfae..3a2ffb957ade 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -776,6 +776,9 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
>  						   fence_ptr);
>  	} else if (property == connector->max_bpc_property) {
>  		state->max_requested_bpc = val;
> +	} else if (property == connector->link_bpc_property) {
> +		drm_dbg_kms(dev, "only drivers can set link bpc property. Use max_bpc instead\n");
> +		return -EINVAL;
>  	} else if (property == connector->privacy_screen_sw_state_property) {
>  		state->privacy_screen_sw_state = val;
>  	} else if (property == connector->broadcast_rgb_property) {
> @@ -861,6 +864,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
>  		*val = 0;
>  	} else if (property == connector->max_bpc_property) {
>  		*val = state->max_requested_bpc;
> +	} else if (property == connector->link_bpc_property) {
> +		*val = state->hdmi.output_bpc;
>  	} else if (property == connector->privacy_screen_sw_state_property) {
>  		*val = state->privacy_screen_sw_state;
>  	} else if (property == connector->broadcast_rgb_property) {
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 272d6254ea47..7ed27aec0ccc 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -542,6 +542,28 @@ int drmm_connector_init(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL(drmm_connector_init);
>  
> +static int
> +drm_connector_attach_link_bpc_property(struct drm_connector *connector,
> +				       int min, int max)
> +{
> +	struct drm_device *dev = connector->dev;
> +	struct drm_property *prop;
> +
> +	prop = connector->link_bpc_property;
> +	if (prop)
> +		return 0;
> +
> +	prop = drm_property_create_range(dev, 0, "link bpc", min, max);
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	connector->link_bpc_property = prop;
> +
> +	drm_object_attach_property(&connector->base, prop, max);
> +
> +	return 0;
> +}
> +
>  /**
>   * drmm_connector_hdmi_init - Init a preallocated HDMI connector
>   * @dev: DRM device
> @@ -618,6 +640,10 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
>  	drm_connector_attach_max_bpc_property(connector, 8, max_bpc);
>  	connector->max_bpc = max_bpc;
>  
> +	ret = drm_connector_attach_link_bpc_property(connector, 8, max_bpc);
> +	if (ret)
> +		return ret;
> +
>  	if (max_bpc > 8)
>  		drm_connector_attach_hdr_output_metadata_property(connector);
>  
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 8f34f4b8183d..4a50198aa7c0 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -2079,6 +2079,14 @@ struct drm_connector {
>  	 */
>  	struct drm_property *max_bpc_property;
>  
> +	/**
> +	 * @link_bpc_property: Current connector link bpc set by the driver
> +	 *
> +	 * This property can be used to retrieve the current link bpc from
> +	 * connector_state::hdmi:output_bpc

It doesn't have to be just HDMI, does it?

> +	 */
> +	struct drm_property *link_bpc_property;
> +
>  	/** @privacy_screen: drm_privacy_screen for this connector, or NULL. */
>  	struct drm_privacy_screen *privacy_screen;

-- 
Jani Nikula, Intel
