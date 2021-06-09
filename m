Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A78DC3A1226
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 13:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064A86E7EF;
	Wed,  9 Jun 2021 11:16:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76C36E5CF;
 Wed,  9 Jun 2021 11:16:52 +0000 (UTC)
IronPort-SDR: ocNkKiRsqUDb2nez9Xhz2x5y9Efrp2VgKU4XuflILo1frjUyGNRAqNvzBgrY6hnQHzMSr9oOii
 kW87JAZOUUFg==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="192160292"
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="192160292"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 04:16:52 -0700
IronPort-SDR: U6fbddEJv5cOiIk7cxc8wYmoj05vfgSyUf9GZSeYJVrLGgpQjF+XHPWl5d+1V+xlBg4O9i7TZS
 fOWneR9uhZew==
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="482344477"
Received: from ochaldek-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.34.111])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 04:16:49 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 1/4] drm/sysfs: introduce drm_sysfs_connector_hotplug_event
In-Reply-To: <mpYHCnsBfIaxJEM7yrUVKKcVHXnFDEUtoK5NbmwA@cp4-web-034.plabs.ch>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <mpYHCnsBfIaxJEM7yrUVKKcVHXnFDEUtoK5NbmwA@cp4-web-034.plabs.ch>
Date: Wed, 09 Jun 2021 14:16:46 +0300
Message-ID: <871r9b1e5d.fsf@intel.com>
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
Cc: alexander.deucher@amd.com, michel@daenzer.net, pekka.paalanen@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 09 Jun 2021, Simon Ser <contact@emersion.fr> wrote:
> This function sends a hotplug uevent with a CONNECTOR property.
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> ---
>  drivers/gpu/drm/drm_sysfs.c | 25 +++++++++++++++++++++++++
>  include/drm/drm_sysfs.h     |  1 +
>  2 files changed, 26 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> index 968a9560b4aa..6b52a53c0c3e 100644
> --- a/drivers/gpu/drm/drm_sysfs.c
> +++ b/drivers/gpu/drm/drm_sysfs.c
> @@ -343,6 +343,31 @@ void drm_sysfs_hotplug_event(struct drm_device *dev)
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
> +	snprintf(conn_id, ARRAY_SIZE(conn_id),

Semantically should be sizeof(conn_id) though the result is the same. (I
guess this is copy-paste from drm_sysfs_connector_status_event().)

> +		 "CONNECTOR=%u", connector->base.id);
> +
> +	drm_dbg(connector->dev,

drm_dbg_kms?

> +		"generating hotplug event for [CONNECTOR:%d:%s]\n",
> +		connector->base.id, connector->name);

A matter of taste, but seems like in a lot of places we tend to stick
the [CONNECTOR:%d:%s] at the beginning of the string. So if you have
back-to-back messages related to the same connector, they get aligned
and are easy to spot.

BR,
Jani.

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

-- 
Jani Nikula, Intel Open Source Graphics Center
