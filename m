Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE798C246D
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 14:06:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE9710E128;
	Fri, 10 May 2024 12:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aI4kyUx+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4837310E128
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 12:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715342754; x=1746878754;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=rzaMEotraMZU3G4QSPccOjV7Z6nrXVR+82iLRVC2MyI=;
 b=aI4kyUx+F5TS5qOLCXEWBiRlWD3T0wwLZ5RNtZXHsGKI+Md6lp/usezn
 jDMJR9aSy6eP5ENMpm1DPWyfVTpzYhHlaSDO8JloNFOnbZmuD1pYssSY4
 2FLKRCwOkTCHE+/zOsEexKAOkjN4CydMlobDpMU06ltQITT6evUJWOc6y
 lobpGiZShEc0OcxWSopxW2pfod91Y5OglaiH1qA+lK1JvWMtSq3avjEyq
 id3WzHEm6KyL28Q2gbxYSvGvxIlCAzZ2l+FhTHdrGoQPS4IunZRRa+kx4
 COE+omg8UJcMvJmN2vrxxMmdSjWib6fn7ie2tRRZo1yO73TVfV8204tPW Q==;
X-CSE-ConnectionGUID: UrtPHf+gSv+yvpm1ryMwqw==
X-CSE-MsgGUID: e9yJg1LfRduL5nPhBty1gA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="33831947"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="33831947"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 05:05:39 -0700
X-CSE-ConnectionGUID: V4mfCCWnR3u+qbZaYtf8Sg==
X-CSE-MsgGUID: XXH/ogSXRDiZ5UBlxPD/OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="29657353"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.180])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 05:05:36 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@redhat.com, sean@poorly.run
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 2/5] drm/udl: Move drm_dev_{enter,exit}() into
 udl_get_edid_block()
In-Reply-To: <20240410120928.26487-3-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240410120928.26487-1-tzimmermann@suse.de>
 <20240410120928.26487-3-tzimmermann@suse.de>
Date: Fri, 10 May 2024 15:05:32 +0300
Message-ID: <871q69j2ib.fsf@intel.com>
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
> Protect the code in udl_get_edid_block() with drm_dev_enter() and
> drm_dev_exit(), so that all callers automatically invoke it. The
> function uses hardware resources, which can be hot-unplugged at
> any time. The other code in udl_connector_detect() does not use the
> resources of the hardware device and therefore does not require
> protection.
>
> This change will allow to use udl_get_edid_block() in various
> contexts easily.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/udl/udl_modeset.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
> index 751da3a294c44..3df9fc38388b4 100644
> --- a/drivers/gpu/drm/udl/udl_modeset.c
> +++ b/drivers/gpu/drm/udl/udl_modeset.c
> @@ -434,13 +434,18 @@ static int udl_get_edid_block(void *data, u8 *buf, unsigned int block, size_t le
>  	struct drm_device *dev = &udl->drm;
>  	struct usb_device *udev = udl_to_usb_device(udl);
>  	u8 *read_buff;
> -	int ret;
> +	int idx, ret;
>  	size_t i;
>  
>  	read_buff = kmalloc(2, GFP_KERNEL);
>  	if (!read_buff)
>  		return -ENOMEM;
>  
> +	if (!drm_dev_enter(dev, &idx)) {
> +		ret = -ENODEV;
> +		goto err_kfree;
> +	}
> +
>  	for (i = 0; i < len; i++) {
>  		int bval = (i + block * EDID_LENGTH) << 8;
>  
> @@ -449,20 +454,23 @@ static int udl_get_edid_block(void *data, u8 *buf, unsigned int block, size_t le
>  				      0xA1, read_buff, 2, USB_CTRL_GET_TIMEOUT);
>  		if (ret < 0) {
>  			drm_err(dev, "Read EDID byte %zu failed err %x\n", i, ret);
> -			goto err_kfree;
> +			goto err_drm_dev_exit;
>  		} else if (ret < 1) {
>  			ret = -EIO;
>  			drm_err(dev, "Read EDID byte %zu failed\n", i);
> -			goto err_kfree;
> +			goto err_drm_dev_exit;
>  		}
>  
>  		buf[i] = read_buff[1];
>  	}
>  
> +	drm_dev_exit(idx);
>  	kfree(read_buff);
>  
>  	return 0;
>  
> +err_drm_dev_exit:
> +	drm_dev_exit(idx);
>  err_kfree:
>  	kfree(read_buff);
>  	return ret;
> @@ -474,21 +482,15 @@ static enum drm_connector_status udl_connector_detect(struct drm_connector *conn
>  	struct udl_device *udl = to_udl(dev);
>  	struct udl_connector *udl_connector = to_udl_connector(connector);
>  	enum drm_connector_status status = connector_status_disconnected;
> -	int idx;
>  
>  	/* cleanup previous EDID */
>  	kfree(udl_connector->edid);
>  	udl_connector->edid = NULL;
>  
> -	if (!drm_dev_enter(dev, &idx))
> -		return connector_status_disconnected;
> -
>  	udl_connector->edid = drm_do_get_edid(connector, udl_get_edid_block, udl);
>  	if (udl_connector->edid)
>  		status = connector_status_connected;
>  
> -	drm_dev_exit(idx);
> -
>  	return status;
>  }

-- 
Jani Nikula, Intel
