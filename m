Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D4B42FC3F
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 21:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A603E6ED8E;
	Fri, 15 Oct 2021 19:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336E76ED8E
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 19:37:08 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 4cbe97a8-2def-11ec-ac3c-0050568cd888;
 Fri, 15 Oct 2021 19:37:14 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id B7410194B3E;
 Fri, 15 Oct 2021 21:37:13 +0200 (CEST)
Date: Fri, 15 Oct 2021 21:37:04 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 1/6] drm/sysfs: introduce
 drm_sysfs_connector_hotplug_event
Message-ID: <YWnYYNLL+Sg6JXYL@ravnborg.org>
References: <20211015163336.95188-1-contact@emersion.fr>
 <20211015163336.95188-2-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015163336.95188-2-contact@emersion.fr>
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

Hi Simon,

On Fri, Oct 15, 2021 at 04:33:41PM +0000, Simon Ser wrote:
> This function sends a hotplug uevent with a CONNECTOR property.

A little late feedback.

	Sam

> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> ---
>  drivers/gpu/drm/drm_sysfs.c | 25 +++++++++++++++++++++++++
>  include/drm/drm_sysfs.h     |  1 +
>  2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> index 76ff6ec3421b..430e00b16eec 100644
> --- a/drivers/gpu/drm/drm_sysfs.c
> +++ b/drivers/gpu/drm/drm_sysfs.c
> @@ -409,6 +409,31 @@ void drm_sysfs_hotplug_event(struct drm_device *dev)
>  }
>  EXPORT_SYMBOL(drm_sysfs_hotplug_event);
>  
> +/**
> + * drm_sysfs_connector_hotplug_event - generate a DRM uevent for any connector
> + * change
> + * @connector: connector which has changed
> + *
> + * Send a uevent for the DRM connector specified by @connector. This will send
> + * a uevent with the properties HOTPLUG=1 and CONNECTOR.
> + */
> +void drm_sysfs_connector_hotplug_event(struct drm_connector *connector)
> +{
> +	struct drm_device *dev = connector->dev;
> +	char hotplug_str[] = "HOTPLUG=1", conn_id[21];
> +	char *envp[] = { hotplug_str, conn_id, NULL };
> +
> +	snprintf(conn_id, sizeof(conn_id),
> +		 "CONNECTOR=%u", connector->base.id);
We have add_uevent_var() that seems a better choice than handrolling
snprintf here.

	Sam

> +
> +	drm_dbg_kms(connector->dev,
> +		    "[CONNECTOR:%d:%s] generating connector hotplug event\n",
> +		    connector->base.id, connector->name);
> +
> +	kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
> +}
> +EXPORT_SYMBOL(drm_sysfs_connector_hotplug_event);
> +
>  /**
>   * drm_sysfs_connector_status_event - generate a DRM uevent for connector
>   * property status change
> diff --git a/include/drm/drm_sysfs.h b/include/drm/drm_sysfs.h
> index d454ef617b2c..6273cac44e47 100644
> --- a/include/drm/drm_sysfs.h
> +++ b/include/drm/drm_sysfs.h
> @@ -11,6 +11,7 @@ int drm_class_device_register(struct device *dev);
>  void drm_class_device_unregister(struct device *dev);
>  
>  void drm_sysfs_hotplug_event(struct drm_device *dev);
> +void drm_sysfs_connector_hotplug_event(struct drm_connector *connector);
>  void drm_sysfs_connector_status_event(struct drm_connector *connector,
>  				      struct drm_property *property);
>  #endif
> -- 
> 2.33.1
> 
