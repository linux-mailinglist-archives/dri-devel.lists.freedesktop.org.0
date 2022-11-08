Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4794E620BA9
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 10:01:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF64D10E1AB;
	Tue,  8 Nov 2022 09:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C7D10E1AB
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 09:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667898062; x=1699434062;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=dqUc1q8prxlKmVN2pBzwuH9UNa0QagrT3ecK4s6e0aY=;
 b=Q1L8odTSvaW14BVzPtAYTUVIf07SsIHHquew2KPQjfpSRtMlPfm34LF9
 IcfECL6Xom7GuHtRFFRHGcsi44+EdxV3ZPfVfsU7p53ky8GN8KRY4/c3L
 GUoSIrMxMlV6xiXuwXYjKUfyirnrY9H9tBi2jHylPzBGyZV9H38/dx1RF
 redzuRMWurLoskjoEPK56kteb3KaoPod4gRCVMBQqo29M4gQk+OCNqTMW
 ywTsuedQc2JqQiRKaW08sgi51x/J4iO+mKv9kOr9omPo3k99+IUOzYvZM
 UPbNHid/lYtp0my0yod3jf6p6pP70tlUoIL/ATi8WL9h1Dy5lixShrDwP g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="312436552"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; d="scan'208";a="312436552"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 01:00:52 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="881445112"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; d="scan'208";a="881445112"
Received: from smoriord-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.16.110])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 01:00:47 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Won Chung <wonchung@google.com>, wonchung@google.com, bleung@google.com,
 pmalani@chromium.org, heikki.krogerus@linux.intel.com,
 imre.deak@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/sysfs: Link DRM connectors to corresponding
 Type-C connectors
In-Reply-To: <20221027212854.1083686-1-wonchung@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221027212854.1083686-1-wonchung@google.com>
Date: Tue, 08 Nov 2022 11:00:45 +0200
Message-ID: <87k045akhu.fsf@intel.com>
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

On Thu, 27 Oct 2022, Won Chung <wonchung@google.com> wrote:
> Create a symlink pointing to USB Type-C connector for DRM connectors
> when they are created. The link will be created only if the firmware is
> able to describe the connection beween the two connectors.

The commit messages should explain the *why*.

BR,
Jani.


>
> Signed-off-by: Won Chung <wonchung@google.com>
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
> Changes from v2:
> - Resending the patch to dri-devel list
>
> Changes from v1:
> - Fix multiple lines to single line
>
>
>  drivers/gpu/drm/drm_sysfs.c | 40 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> index 430e00b16eec..6a9904fa9186 100644
> --- a/drivers/gpu/drm/drm_sysfs.c
> +++ b/drivers/gpu/drm/drm_sysfs.c
> @@ -11,12 +11,14 @@
>   */
>  
>  #include <linux/acpi.h>
> +#include <linux/component.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/export.h>
>  #include <linux/gfp.h>
>  #include <linux/i2c.h>
>  #include <linux/kdev_t.h>
> +#include <linux/property.h>
>  #include <linux/slab.h>
>  
>  #include <drm/drm_connector.h>
> @@ -95,6 +97,34 @@ static char *drm_devnode(struct device *dev, umode_t *mode)
>  	return kasprintf(GFP_KERNEL, "dri/%s", dev_name(dev));
>  }
>  
> +static int typec_connector_bind(struct device *dev,
> +	struct device *typec_connector, void *data)
> +{
> +	int ret;
> +
> +	ret = sysfs_create_link(&dev->kobj, &typec_connector->kobj, "typec_connector");
> +	if (ret)
> +		return ret;
> +
> +	ret = sysfs_create_link(&typec_connector->kobj, &dev->kobj, "drm_connector");
> +	if (ret)
> +		sysfs_remove_link(&dev->kobj, "typec_connector");
> +
> +	return ret;
> +}
> +
> +static void typec_connector_unbind(struct device *dev,
> +	struct device *typec_connector, void *data)
> +{
> +	sysfs_remove_link(&typec_connector->kobj, "drm_connector");
> +	sysfs_remove_link(&dev->kobj, "typec_connector");
> +}
> +
> +static const struct component_ops typec_connector_ops = {
> +	.bind = typec_connector_bind,
> +	.unbind = typec_connector_unbind,
> +};
> +
>  static CLASS_ATTR_STRING(version, S_IRUGO, "drm 1.1.0 20060810");
>  
>  /**
> @@ -355,6 +385,13 @@ int drm_sysfs_connector_add(struct drm_connector *connector)
>  	if (connector->ddc)
>  		return sysfs_create_link(&connector->kdev->kobj,
>  				 &connector->ddc->dev.kobj, "ddc");
> +
> +	if (dev_fwnode(kdev)) {
> +		r = component_add(kdev, &typec_connector_ops);
> +		if (r)
> +			drm_err(dev, "failed to add component\n");
> +	}
> +
>  	return 0;
>  
>  err_free:
> @@ -367,6 +404,9 @@ void drm_sysfs_connector_remove(struct drm_connector *connector)
>  	if (!connector->kdev)
>  		return;
>  
> +	if (dev_fwnode(connector->kdev))
> +		component_del(connector->kdev, &typec_connector_ops);
> +
>  	if (connector->ddc)
>  		sysfs_remove_link(&connector->kdev->kobj, "ddc");

-- 
Jani Nikula, Intel Open Source Graphics Center
