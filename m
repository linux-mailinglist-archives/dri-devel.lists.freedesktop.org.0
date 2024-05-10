Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A188C24AE
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 14:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F0B10E9CB;
	Fri, 10 May 2024 12:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nqzn8lBs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C341310E06E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 12:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715343436; x=1746879436;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=XLUVqcYatjg7IVAYa9hGddIBTsktRkER0why1Wz2KK4=;
 b=Nqzn8lBsBTLxbFtb134IMkCSC58Agupr7/xPB0HVovgthexKgHVE1puC
 pvPO3VmJZzByynIqiQSR5gKsAhnZEXcrw5NFpnFhkGk9QEzttQQ+PPKZ8
 zE54wNGH9VrwwXQ/AhqHGoFvr2e5KwxtpXHusGJ6368H+fO7w4bbVkqVh
 uuBZ37wiLh+Q9C3Hlk4O80YYOOgrNsHmh2GeK1X3YHKBx8J6+UmVqnsno
 Tgo8c/8arPk6AGZOjICu5caLqlf/bXFSeQLWivMCpKjyzlkhPHMhGwLjS
 sY1z7+j/FavCxnd4AWQ5BWhyvANAx1RJkiJc5dxU9w52T/nvVOqKWfHv+ Q==;
X-CSE-ConnectionGUID: Vzet0D0QTlG8Vi2RBHL6nA==
X-CSE-MsgGUID: dN8Qm9PCT0Kc+TZ0TccUUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11153824"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="11153824"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 05:17:15 -0700
X-CSE-ConnectionGUID: AOa7KYi0RaW8rR96NKMbhw==
X-CSE-MsgGUID: H6RvwJmsRn6vH8W0hJOTZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="60767336"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.180])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 05:17:13 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@redhat.com, sean@poorly.run
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 4/5] drm/udl: Untangle .get_modes() and .detect_ctx()
In-Reply-To: <20240410120928.26487-5-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240410120928.26487-1-tzimmermann@suse.de>
 <20240410120928.26487-5-tzimmermann@suse.de>
Date: Fri, 10 May 2024 15:17:09 +0300
Message-ID: <87ttj5hnei.fsf@intel.com>
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

On Wed, 10 Apr 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Provide separate implementations of .get_modes() and .detect_ctx()
> from struct drm_connector. Switch to struct drm_edid.
>
> Udl's .detect() helper used to fetch the EDID from the adapter and the
> .get_modes() helper provided display modes from the data. But this
> relied on the DRM helpers to call the functions in the correct order.
> When no EDID could be retrieved, .detect() regularly printed a warning
> to the kernel log.
>
> Switching to the new helpers around struct drm_edid separates both from
> each other. The .get_modes() helper now fetches the EDID by itself and
> the .detect_ctx() helper only tests for its presence. The patch does a
> number of things to implement this.
>
> - Move udl_get_edid_block() to udl_edid.c and rename it to
> udl_read_edid_block(). Then use the helper to implement probing in
> udl_probe_edid() and reading in udl_edid_read(). The latter helper
> is build on top of DRM helpers.
>
> - Replace the existing code in .get_modes() and .detect() with udl's
> new EDID helpers. The new code behaves like DRM's similar DDC-based
> helpers. Instead of .detect(), udl now implements .detect_ctx().
>
> - Remove the edid data from struct udl_connector. The field cached
> the EDID data between calls to .detect() and .get_modes(), but is now
> unused.
>
> v2:
> - implement udl_probe_edid() within udl
> - reword commit description
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/udl/Makefile      |  1 +
>  drivers/gpu/drm/udl/udl_drv.h     |  2 -
>  drivers/gpu/drm/udl/udl_edid.c    | 79 +++++++++++++++++++++++++++
>  drivers/gpu/drm/udl/udl_edid.h    | 15 ++++++
>  drivers/gpu/drm/udl/udl_modeset.c | 90 +++++++------------------------
>  5 files changed, 114 insertions(+), 73 deletions(-)
>  create mode 100644 drivers/gpu/drm/udl/udl_edid.c
>  create mode 100644 drivers/gpu/drm/udl/udl_edid.h
>
> diff --git a/drivers/gpu/drm/udl/Makefile b/drivers/gpu/drm/udl/Makefile
> index 00690741db376..43d69a16af183 100644
> --- a/drivers/gpu/drm/udl/Makefile
> +++ b/drivers/gpu/drm/udl/Makefile
> @@ -2,6 +2,7 @@
>  
>  udl-y := \
>  	udl_drv.o \
> +	udl_edid.o \
>  	udl_main.o \
>  	udl_modeset.o \
>  	udl_transfer.o
> diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
> index 282ebd6c02fda..f112cfb270f31 100644
> --- a/drivers/gpu/drm/udl/udl_drv.h
> +++ b/drivers/gpu/drm/udl/udl_drv.h
> @@ -51,8 +51,6 @@ struct urb_list {
>  
>  struct udl_connector {
>  	struct drm_connector connector;
> -	/* last udl_detect edid */
> -	struct edid *edid;
>  };
>  
>  static inline struct udl_connector *to_udl_connector(struct drm_connector *connector)
> diff --git a/drivers/gpu/drm/udl/udl_edid.c b/drivers/gpu/drm/udl/udl_edid.c
> new file mode 100644
> index 0000000000000..626f1badea90a
> --- /dev/null
> +++ b/drivers/gpu/drm/udl/udl_edid.c
> @@ -0,0 +1,79 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_edid.h>
> +
> +#include "udl_drv.h"
> +#include "udl_edid.h"
> +
> +static int udl_read_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
> +{
> +	struct udl_device *udl = data;
> +	struct drm_device *dev = &udl->drm;
> +	struct usb_device *udev = udl_to_usb_device(udl);
> +	u8 *read_buff;
> +	int idx, ret;
> +	size_t i;
> +
> +	read_buff = kmalloc(2, GFP_KERNEL);
> +	if (!read_buff)
> +		return -ENOMEM;
> +
> +	if (!drm_dev_enter(dev, &idx)) {
> +		ret = -ENODEV;
> +		goto err_kfree;
> +	}
> +
> +	for (i = 0; i < len; i++) {
> +		int bval = (i + block * EDID_LENGTH) << 8;
> +
> +		ret = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
> +				      0x02, (0x80 | (0x02 << 5)), bval,
> +				      0xA1, read_buff, 2, USB_CTRL_GET_TIMEOUT);
> +		if (ret < 0) {
> +			drm_err(dev, "Read EDID byte %zu failed err %x\n", i, ret);
> +			goto err_drm_dev_exit;
> +		} else if (ret < 1) {
> +			ret = -EIO;
> +			drm_err(dev, "Read EDID byte %zu failed\n", i);
> +			goto err_drm_dev_exit;
> +		}
> +
> +		buf[i] = read_buff[1];
> +	}
> +
> +	drm_dev_exit(idx);
> +	kfree(read_buff);
> +
> +	return 0;
> +
> +err_drm_dev_exit:
> +	drm_dev_exit(idx);
> +err_kfree:
> +	kfree(read_buff);
> +	return ret;
> +}
> +
> +bool udl_probe_edid(struct udl_device *udl)
> +{
> +	static const u8 no_edid[8] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
> +	u8 hdr[8];
> +	int ret;
> +
> +	ret = udl_read_edid_block(udl, hdr, 0, sizeof(hdr));
> +	if (ret)
> +		return false;
> +
> +	/*
> +	 * The adapter sends all-zeros if no monitor has been
> +	 * connected. We consider anything else a connection.
> +	 */
> +	return memcmp(no_edid, hdr, 8) != 0;

Nitpick, this works, but you can drop the no_edid buf by using:

	return memchr_inv(hdr, 0, sizeof(hdr));

Up to you,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> +}
> +
> +const struct drm_edid *udl_edid_read(struct drm_connector *connector)
> +{
> +	struct udl_device *udl = to_udl(connector->dev);
> +
> +	return drm_edid_read_custom(connector, udl_read_edid_block, udl);
> +}
> diff --git a/drivers/gpu/drm/udl/udl_edid.h b/drivers/gpu/drm/udl/udl_edid.h
> new file mode 100644
> index 0000000000000..fe15ff3752b7d
> --- /dev/null
> +++ b/drivers/gpu/drm/udl/udl_edid.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef UDL_EDID_H
> +#define UDL_EDID_H
> +
> +#include <linux/types.h>
> +
> +struct drm_connector;
> +struct drm_edid;
> +struct udl_device;
> +
> +bool udl_probe_edid(struct udl_device *udl);
> +const struct drm_edid *udl_edid_read(struct drm_connector *connector);
> +
> +#endif
> diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
> index 3df9fc38388b4..4236ce57f5945 100644
> --- a/drivers/gpu/drm/udl/udl_modeset.c
> +++ b/drivers/gpu/drm/udl/udl_modeset.c
> @@ -25,6 +25,7 @@
>  #include <drm/drm_vblank.h>
>  
>  #include "udl_drv.h"
> +#include "udl_edid.h"
>  #include "udl_proto.h"
>  
>  /*
> @@ -415,97 +416,44 @@ static const struct drm_encoder_funcs udl_encoder_funcs = {
>  
>  static int udl_connector_helper_get_modes(struct drm_connector *connector)
>  {
> -	struct udl_connector *udl_connector = to_udl_connector(connector);
> +	const struct drm_edid *drm_edid;
> +	int count;
>  
> -	drm_connector_update_edid_property(connector, udl_connector->edid);
> -	if (udl_connector->edid)
> -		return drm_add_edid_modes(connector, udl_connector->edid);
> +	drm_edid = udl_edid_read(connector);
> +	drm_edid_connector_update(connector, drm_edid);
> +	count = drm_edid_connector_add_modes(connector);
> +	drm_edid_free(drm_edid);
>  
> -	return 0;
> +	return count;
>  }
>  
> -static const struct drm_connector_helper_funcs udl_connector_helper_funcs = {
> -	.get_modes = udl_connector_helper_get_modes,
> -};
> -
> -static int udl_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
> +static int udl_connector_helper_detect_ctx(struct drm_connector *connector,
> +					   struct drm_modeset_acquire_ctx *ctx,
> +					   bool force)
>  {
> -	struct udl_device *udl = data;
> -	struct drm_device *dev = &udl->drm;
> -	struct usb_device *udev = udl_to_usb_device(udl);
> -	u8 *read_buff;
> -	int idx, ret;
> -	size_t i;
> -
> -	read_buff = kmalloc(2, GFP_KERNEL);
> -	if (!read_buff)
> -		return -ENOMEM;
> +	struct udl_device *udl = to_udl(connector->dev);
>  
> -	if (!drm_dev_enter(dev, &idx)) {
> -		ret = -ENODEV;
> -		goto err_kfree;
> -	}
> -
> -	for (i = 0; i < len; i++) {
> -		int bval = (i + block * EDID_LENGTH) << 8;
> -
> -		ret = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
> -				      0x02, (0x80 | (0x02 << 5)), bval,
> -				      0xA1, read_buff, 2, USB_CTRL_GET_TIMEOUT);
> -		if (ret < 0) {
> -			drm_err(dev, "Read EDID byte %zu failed err %x\n", i, ret);
> -			goto err_drm_dev_exit;
> -		} else if (ret < 1) {
> -			ret = -EIO;
> -			drm_err(dev, "Read EDID byte %zu failed\n", i);
> -			goto err_drm_dev_exit;
> -		}
> -
> -		buf[i] = read_buff[1];
> -	}
> +	if (udl_probe_edid(udl))
> +		return connector_status_connected;
>  
> -	drm_dev_exit(idx);
> -	kfree(read_buff);
> -
> -	return 0;
> -
> -err_drm_dev_exit:
> -	drm_dev_exit(idx);
> -err_kfree:
> -	kfree(read_buff);
> -	return ret;
> +	return connector_status_disconnected;
>  }
>  
> -static enum drm_connector_status udl_connector_detect(struct drm_connector *connector, bool force)
> -{
> -	struct drm_device *dev = connector->dev;
> -	struct udl_device *udl = to_udl(dev);
> -	struct udl_connector *udl_connector = to_udl_connector(connector);
> -	enum drm_connector_status status = connector_status_disconnected;
> -
> -	/* cleanup previous EDID */
> -	kfree(udl_connector->edid);
> -	udl_connector->edid = NULL;
> -
> -	udl_connector->edid = drm_do_get_edid(connector, udl_get_edid_block, udl);
> -	if (udl_connector->edid)
> -		status = connector_status_connected;
> -
> -	return status;
> -}
> +static const struct drm_connector_helper_funcs udl_connector_helper_funcs = {
> +	.get_modes = udl_connector_helper_get_modes,
> +	.detect_ctx = udl_connector_helper_detect_ctx,
> +};
>  
>  static void udl_connector_destroy(struct drm_connector *connector)
>  {
>  	struct udl_connector *udl_connector = to_udl_connector(connector);
>  
>  	drm_connector_cleanup(connector);
> -	kfree(udl_connector->edid);
>  	kfree(udl_connector);
>  }
>  
>  static const struct drm_connector_funcs udl_connector_funcs = {
>  	.reset = drm_atomic_helper_connector_reset,
> -	.detect = udl_connector_detect,
>  	.fill_modes = drm_helper_probe_single_connector_modes,
>  	.destroy = udl_connector_destroy,
>  	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,

-- 
Jani Nikula, Intel
