Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A78D477CA4E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 11:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D52D10E241;
	Tue, 15 Aug 2023 09:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D9210E241
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 09:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692091164; x=1723627164;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=mAC4DXIcqQ/8JD4Zjwy/1kp3a2e9CjhUfeak91eAFIY=;
 b=e4Sr44fcx1v/MXXnfxEcH1XeLraUEfGrsfB/wp0ZnJ0m+Ct81SbhiVS6
 G1EaRojKwoVqtQBsbac5FILFUdIFCmslobyhbfDz34+IersekhlIIAp8B
 b14T/e9rwI2Sd9WHGCrEySHFRbS54gh4T7CR3MiT2BBGKM6/BmipyQJhf
 4YSY2E3Vf+/QtipqhMurnemLX8g5LfY0M/IeIInKa4dutiIRXPbr+x9IN
 uVRbQsXYJE9jPlx8KJmf5f45eFPz0/TuOV9glOPy8chn2sJcSXIYPBmr8
 dU0BjcVKq4MPU649WdLFCU0gSrmqCVkXrf4bFufWhTcyufZDUt4jKI+1S g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="436135729"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; d="scan'208";a="436135729"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 02:19:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="799137260"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; d="scan'208";a="799137260"
Received: from cristina-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.52.75])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 02:19:17 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>
Subject: Re: [PATCH RFC 01/13] drm/connector: Introduce an HDMI connector
In-Reply-To: <20230814-kms-hdmi-connector-state-v1-1-048054df3654@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230814-kms-hdmi-connector-state-v1-0-048054df3654@kernel.org>
 <20230814-kms-hdmi-connector-state-v1-1-048054df3654@kernel.org>
Date: Tue, 15 Aug 2023 12:19:14 +0300
Message-ID: <878racd5nx.fsf@intel.com>
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
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 14 Aug 2023, Maxime Ripard <mripard@kernel.org> wrote:
> A lot of the various HDMI drivers duplicate some logic that depends on
> the HDMI spec itself and not really a particular hardware
> implementation.
>
> Output BPC or format selection, infoframe generation are good examples
> of such areas.
>
> This creates a lot of boilerplate, with a lot of variations, which makes
> it hard for userspace to rely on, and makes it difficult to get it right
> for drivers.
>
> Let's create a new connector variant specifically dedicated to HDMI
> controllers that will allow to abstract away the duplicated logic.
>
> Hopefully, this will make drivers simpler to handle, and their behaviour
> more consistent.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/Makefile             |  1 +
>  drivers/gpu/drm/drm_hdmi_connector.c | 45 ++++++++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h          | 16 +++++++++++++
>  3 files changed, 62 insertions(+)
>
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 7a09a89b493b..1520d4ccd3d7 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -27,6 +27,7 @@ drm-y := \
>  	drm_fourcc.o \
>  	drm_framebuffer.o \
>  	drm_gem.o \
> +	drm_hdmi_connector.o \
>  	drm_ioctl.o \
>  	drm_lease.o \
>  	drm_managed.o \
> diff --git a/drivers/gpu/drm/drm_hdmi_connector.c b/drivers/gpu/drm/drm_hdmi_connector.c
> new file mode 100644
> index 000000000000..62f01dd2e6df
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_hdmi_connector.c
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +#include <drm/drm_connector.h>
> +#include <drm/drm_mode.h>
> +
> +#include <linux/export.h>
> +
> +/**
> + * drmm_hdmi_connector_init - Init a preallocated HDMI connector
> + * @dev: DRM device
> + * @hdmi_connector: A pointer to the HDMI connector to init
> + * @connector_type: user visible type of the connector
> + * @ddc: optional pointer to the associated ddc adapter
> + *
> + * Initialises a preallocated HDMI connector. Connectors can be
> + * subclassed as part of driver connector objects.
> + *
> + * Cleanup is automatically handled with a call to
> + * drm_connector_cleanup() in a DRM-managed action.
> + *
> + * The connector structure should be allocated with drmm_kzalloc().
> + *
> + * Returns:
> + * Zero on success, error code on failure.
> + */
> +int drmm_hdmi_connector_init(struct drm_device *dev,
> +			     struct drm_hdmi_connector *hdmi_connector,
> +			     const struct drm_connector_funcs *funcs,
> +			     int connector_type,
> +			     struct i2c_adapter *ddc)
> +{
> +	struct drm_connector *connector = &hdmi_connector->base;
> +	int ret;
> +
> +	if (connector_type != DRM_MODE_CONNECTOR_HDMIA ||
> +	    connector_type != DRM_MODE_CONNECTOR_HDMIB)
> +		return -EINVAL;
> +
> +	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drmm_hdmi_connector_init);
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index d300fde6c1a4..1859b74083f5 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -2042,6 +2042,22 @@ void drm_connector_attach_privacy_screen_provider(
>  	struct drm_connector *connector, struct drm_privacy_screen *priv);
>  void drm_connector_update_privacy_screen(const struct drm_connector_state *connector_state);
>  
> +struct drm_hdmi_connector {
> +	/**
> +	 * @base: Base Connector
> +	 */
> +	struct drm_connector base;
> +};
> +
> +#define connector_to_hdmi_connector(connector) \
> +	container_of_const(connector, struct drm_hdmi_connector, base)
> +
> +int drmm_hdmi_connector_init(struct drm_device *dev,
> +			     struct drm_hdmi_connector *hdmi_connector,
> +			     const struct drm_connector_funcs *funcs,
> +			     int connector_type,
> +			     struct i2c_adapter *ddc);
> +

Pure bikeshedding, maybe add drm_hdmi_connector.h from the start so we
don't have to split this up later.

BR,
Jani.

>  /**
>   * struct drm_tile_group - Tile group metadata
>   * @refcount: reference count

-- 
Jani Nikula, Intel Open Source Graphics Center
