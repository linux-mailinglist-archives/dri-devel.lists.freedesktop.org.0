Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C00A4587E23
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 16:29:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 694598BCCC;
	Tue,  2 Aug 2022 14:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40AE78BAB5
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 14:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659450558; x=1690986558;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=03qm8JOVn0V0LuRBj+aYQPlmiGoVKleHky+wewKkegU=;
 b=QDZqYenUTxqBKanKavHYb51yaWqUsrIR+lYqTgw2fX3750n1VmWwpRfR
 y4568EWeB1ByLi3v9WQTL511c7NDzyYL8Emg+6/3aVZyS7WdJb2Tyt37r
 pMhK+J2vYFLI0RRrTFfGeVrtH7IV0JOVycE06Bxj5yIxfXPfq889d/0Q6
 edbfLvgMMRMnLfieNlmHtAjR2V16bdtfTx2SXFMBpADFDfluTZ9MraLUm
 Jh1ZH8uJByKKhqMqBgCFYlWjEg1nhsV+Rew/Jdvgu4tmDg+H0QxdpYRYk
 wDIafeV9ebQFt9xKeWDxDS0sIXftWYnqSQQ08mFrdq0rGYCLA5Kio7fRr A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="289432650"
X-IronPort-AV: E=Sophos;i="5.93,211,1654585200"; d="scan'208";a="289432650"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 07:29:17 -0700
X-IronPort-AV: E=Sophos;i="5.93,211,1654585200"; d="scan'208";a="661643849"
Received: from llaviniu-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.60.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 07:29:14 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matthieu CHARETTE <matthieu.charette@gmail.com>, lkp@intel.com
Subject: Re: [PATCH] drm: Fix EDID firmware load on resume
In-Reply-To: <20220727074152.43059-1-matthieu.charette@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <202207172035.mtErdlaw-lkp@intel.com>
 <20220727074152.43059-1-matthieu.charette@gmail.com>
Date: Tue, 02 Aug 2022 17:29:12 +0300
Message-ID: <87wnbqen2f.fsf@intel.com>
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
Cc: kbuild-all@lists.01.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, matthieu.charette@gmail.com,
 tzimmermann@suse.de, andrealmeid@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 27 Jul 2022, Matthieu CHARETTE <matthieu.charette@gmail.com> wrote:
> Loading an EDID using drm.edid_firmware parameter makes resume to fail
> after firmware cache is being cleaned. This is because edid_load() use a
> temporary device to request the firmware. This cause the EDID firmware
> not to be cached from suspend. And, requesting the EDID firmware return
> an error during resume.
> So the request_firmware() call should use a permanent device for each
> connector. Also, we should cache the EDID even if no monitor is
> connected, in case it's plugged while suspended.

AFAICT this breaks changing drm.edid_firmware runtime.

BR,
Jani.

>
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2061
> Signed-off-by: Matthieu CHARETTE <matthieu.charette@gmail.com>
> ---
>  drivers/gpu/drm/drm_connector.c |  9 ++++
>  drivers/gpu/drm/drm_edid_load.c | 81 ++++++++++++++++++++++++++++-----
>  include/drm/drm_connector.h     | 12 +++++
>  include/drm/drm_edid.h          |  3 ++
>  4 files changed, 94 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 1c48d162c77e..e8819ebf1c4b 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -31,6 +31,7 @@
>  #include <drm/drm_privacy_screen_consumer.h>
>  #include <drm/drm_sysfs.h>
>  
> +#include <linux/platform_device.h>
>  #include <linux/uaccess.h>
>  
>  #include "drm_crtc_internal.h"
> @@ -289,6 +290,9 @@ int drm_connector_init(struct drm_device *dev,
>  
>  	drm_connector_get_cmdline_mode(connector);
>  
> +	connector->edid_load_pdev = NULL;
> +	drm_cache_edid_firmware(connector);
> +
>  	/* We should add connectors at the end to avoid upsetting the connector
>  	 * index too much.
>  	 */
> @@ -473,6 +477,11 @@ void drm_connector_cleanup(struct drm_connector *connector)
>  		connector->tile_group = NULL;
>  	}
>  
> +	if (connector->edid_load_pdev) {
> +		platform_device_unregister(connector->edid_load_pdev);
> +		connector->edid_load_pdev = NULL;
> +	}
> +
>  	list_for_each_entry_safe(mode, t, &connector->probed_modes, head)
>  		drm_mode_remove(connector, mode);
>  
> diff --git a/drivers/gpu/drm/drm_edid_load.c b/drivers/gpu/drm/drm_edid_load.c
> index 37d8ba3ddb46..5a82be9917ec 100644
> --- a/drivers/gpu/drm/drm_edid_load.c
> +++ b/drivers/gpu/drm/drm_edid_load.c
> @@ -167,6 +167,19 @@ static int edid_size(const u8 *edid, int data_size)
>  	return (edid[0x7e] + 1) * EDID_LENGTH;
>  }
>  
> +static struct platform_device *edid_pdev(const char *connector_name)
> +{
> +	struct platform_device *pdev = platform_device_register_simple(connector_name, -1, NULL, 0);
> +
> +	if (IS_ERR(pdev)) {
> +		DRM_ERROR("Failed to register EDID firmware platform device "
> +			"for connector \"%s\"\n", connector_name);
> +		return ERR_CAST(pdev);
> +	}
> +
> +	return pdev;
> +}
> +
>  static void *edid_load(struct drm_connector *connector, const char *name,
>  			const char *connector_name)
>  {
> @@ -182,18 +195,17 @@ static void *edid_load(struct drm_connector *connector, const char *name,
>  		fwdata = generic_edid[builtin];
>  		fwsize = sizeof(generic_edid[builtin]);
>  	} else {
> -		struct platform_device *pdev;
> +		struct platform_device *pdev = connector->edid_load_pdev;
>  		int err;
>  
> -		pdev = platform_device_register_simple(connector_name, -1, NULL, 0);
> -		if (IS_ERR(pdev)) {
> -			DRM_ERROR("Failed to register EDID firmware platform device "
> -				  "for connector \"%s\"\n", connector_name);
> -			return ERR_CAST(pdev);
> +		if (WARN_ON(!pdev)) {
> +			pdev = edid_pdev(connector_name);
> +			if (IS_ERR(pdev))
> +				return ERR_CAST(pdev);
> +			connector->edid_load_pdev = pdev;
>  		}
>  
>  		err = request_firmware(&fw, name, &pdev->dev);
> -		platform_device_unregister(pdev);
>  		if (err) {
>  			DRM_ERROR("Requesting EDID firmware \"%s\" failed (err=%d)\n",
>  				  name, err);
> @@ -263,11 +275,9 @@ static void *edid_load(struct drm_connector *connector, const char *name,
>  	return edid;
>  }
>  
> -struct edid *drm_load_edid_firmware(struct drm_connector *connector)
> +static char *edid_name(const char *connector_name)
>  {
> -	const char *connector_name = connector->name;
>  	char *edidname, *last, *colon, *fwstr, *edidstr, *fallback = NULL;
> -	struct edid *edid;
>  
>  	if (edid_firmware[0] == '\0')
>  		return ERR_PTR(-ENOENT);
> @@ -310,8 +320,57 @@ struct edid *drm_load_edid_firmware(struct drm_connector *connector)
>  	if (*last == '\n')
>  		*last = '\0';
>  
> -	edid = edid_load(connector, edidname, connector_name);
> +	edidname = kstrdup(edidname, GFP_KERNEL);
> +	if (!edidname) {
> +		kfree(fwstr);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
>  	kfree(fwstr);
> +	return edidname;
> +}
> +
> +void drm_cache_edid_firmware(struct drm_connector *connector)
> +{
> +	const char *connector_name = connector->name;
> +	const char *edidname = edid_name(connector_name);
> +	struct platform_device *pdev;
> +	int err;
> +
> +	if (IS_ERR(edidname))
> +		return;
> +
> +	if (match_string(generic_edid_name, GENERIC_EDIDS, edidname) >= 0) {
> +		kfree(edidname);
> +		return;
> +	}
> +
> +	pdev = edid_pdev(connector_name);
> +	if (IS_ERR(pdev)) {
> +		kfree(edidname);
> +		return;
> +	}
> +	connector->edid_load_pdev = pdev;
> +
> +	err = firmware_request_cache(&pdev->dev, edidname);
> +	if (err)
> +		DRM_ERROR("Requesting EDID firmware cache \"%s\" failed (err=%d)\n",
> +			edidname, err);
> +
> +	kfree(edidname);
> +}
> +
> +struct edid *drm_load_edid_firmware(struct drm_connector *connector)
> +{
> +	const char *connector_name = connector->name;
> +	const char *edidname = edid_name(connector_name);
> +	struct edid *edid;
> +
> +	if (IS_ERR(edidname))
> +		return ERR_CAST(edidname);
> +
> +	edid = edid_load(connector, edidname, connector_name);
> +	kfree(edidname);
>  
>  	return edid;
>  }
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 3ac4bf87f257..47c84741517e 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1573,6 +1573,18 @@ struct drm_connector {
>  	 */
>  	struct i2c_adapter *ddc;
>  
> +	/**
> +	 * @edid_load_pdev: Platform device for loading EDID via firmware.
> +	 *
> +	 * The platform device is registered in drm_connector_init() in case a
> +	 * custom EDID firmware is used with `edid_firmware` parameter. Otherwise,
> +	 * it is set to NULL.
> +	 *
> +	 * Platform device is unregistered in drm_connector_cleanup() if it
> +	 * is not NULL.
> +	 */
> +	struct platform_device *edid_load_pdev;
> +
>  	/**
>  	 * @null_edid_counter: track sinks that give us all zeros for the EDID.
>  	 * Needed to workaround some HW bugs where we get all 0s
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index b2756753370b..e907c928a35d 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -378,10 +378,13 @@ int drm_av_sync_delay(struct drm_connector *connector,
>  		      const struct drm_display_mode *mode);
>  
>  #ifdef CONFIG_DRM_LOAD_EDID_FIRMWARE
> +void drm_cache_edid_firmware(struct drm_connector *connector);
>  struct edid *drm_load_edid_firmware(struct drm_connector *connector);
>  int __drm_set_edid_firmware_path(const char *path);
>  int __drm_get_edid_firmware_path(char *buf, size_t bufsize);
>  #else
> +inline void
> +drm_cache_edid_firmware(struct drm_connector *connector);
>  static inline struct edid *
>  drm_load_edid_firmware(struct drm_connector *connector)
>  {

-- 
Jani Nikula, Intel Open Source Graphics Center
