Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0713D37A02C
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 08:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3F26E9D9;
	Tue, 11 May 2021 06:56:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366DE6E9D5;
 Tue, 11 May 2021 06:56:54 +0000 (UTC)
IronPort-SDR: 1ArniK7wJQ5CDcyejvpgnCGn3Mp6mnNHvYLS3vH9lIATBoJh1u161nVEol3TcqMDiUjW8dFeQI
 Gfu+bloivy0g==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="179634647"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="179634647"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 23:56:53 -0700
IronPort-SDR: AXt6I+3BZTXV82Na/G8r1U/DmwHW+A/xtrteoQDsOcDEi74Fp05hRB+PswzxV/7z36q0dPhEXt
 CxeX9zQOciWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="536844677"
Received: from kuha.fi.intel.com ([10.237.72.162])
 by fmsmga001.fm.intel.com with SMTP; 10 May 2021 23:56:49 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Tue, 11 May 2021 09:56:48 +0300
Date: Tue, 11 May 2021 09:56:48 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 8/8] usb: typec: altmodes/displayport: Notify drm subsys
 of hotplug events
Message-ID: <YJoqsMTJnOUdg1hk@kuha.fi.intel.com>
References: <20210505162415.531876-1-hdegoede@redhat.com>
 <20210505162415.531876-9-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210505162415.531876-9-hdegoede@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 platform-driver-x86@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 05, 2021 at 06:24:15PM +0200, Hans de Goede wrote:
> Use the new drm_connector_oob_hotplug_event() functions to let drm/kms
> drivers know about DisplayPort over Type-C hotplug events.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes in v3:
> - Only call drm_connector_oob_hotplug_event() on hpd status bit change
> - Adjust for drm_connector_oob_hotplug_event() no longer having a data
>   argument
> 
> Changes in v2:
> - Add missing depends on DRM to TYPEC_DP_ALTMODE Kconfig entry
> ---
>  drivers/usb/typec/altmodes/Kconfig       |  1 +
>  drivers/usb/typec/altmodes/displayport.c | 23 +++++++++++++++++++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/drivers/usb/typec/altmodes/Kconfig b/drivers/usb/typec/altmodes/Kconfig
> index 60d375e9c3c7..1a6b5e872b0d 100644
> --- a/drivers/usb/typec/altmodes/Kconfig
> +++ b/drivers/usb/typec/altmodes/Kconfig
> @@ -4,6 +4,7 @@ menu "USB Type-C Alternate Mode drivers"
>  
>  config TYPEC_DP_ALTMODE
>  	tristate "DisplayPort Alternate Mode driver"
> +	depends on DRM
>  	help
>  	  DisplayPort USB Type-C Alternate Mode allows DisplayPort
>  	  displays and adapters to be attached to the USB Type-C
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> index aa669b9cf70e..c1d8c23baa39 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -11,8 +11,10 @@
>  #include <linux/delay.h>
>  #include <linux/mutex.h>
>  #include <linux/module.h>
> +#include <linux/property.h>
>  #include <linux/usb/pd_vdo.h>
>  #include <linux/usb/typec_dp.h>
> +#include <drm/drm_connector.h>
>  #include "displayport.h"
>  
>  #define DP_HEADER(_dp, ver, cmd)	(VDO((_dp)->alt->svid, 1, ver, cmd)	\
> @@ -57,11 +59,13 @@ struct dp_altmode {
>  	struct typec_displayport_data data;
>  
>  	enum dp_state state;
> +	bool hpd;
>  
>  	struct mutex lock; /* device lock */
>  	struct work_struct work;
>  	struct typec_altmode *alt;
>  	const struct typec_altmode *port;
> +	struct fwnode_handle *connector_fwnode;
>  };
>  
>  static int dp_altmode_notify(struct dp_altmode *dp)
> @@ -125,6 +129,7 @@ static int dp_altmode_configure(struct dp_altmode *dp, u8 con)
>  static int dp_altmode_status_update(struct dp_altmode *dp)
>  {
>  	bool configured = !!DP_CONF_GET_PIN_ASSIGN(dp->data.conf);
> +	bool hpd = !!(dp->data.status & DP_STATUS_HPD_STATE);
>  	u8 con = DP_STATUS_CONNECTION(dp->data.status);
>  	int ret = 0;
>  
> @@ -137,6 +142,11 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
>  		ret = dp_altmode_configure(dp, con);
>  		if (!ret)
>  			dp->state = DP_STATE_CONFIGURE;
> +	} else {
> +		if (dp->hpd != hpd) {
> +			drm_connector_oob_hotplug_event(dp->connector_fwnode);
> +			dp->hpd = hpd;
> +		}
>  	}
>  
>  	return ret;
> @@ -512,6 +522,7 @@ static const struct attribute_group dp_altmode_group = {
>  int dp_altmode_probe(struct typec_altmode *alt)
>  {
>  	const struct typec_altmode *port = typec_altmode_get_partner(alt);
> +	struct fwnode_handle *fwnode;
>  	struct dp_altmode *dp;
>  	int ret;
>  
> @@ -540,6 +551,11 @@ int dp_altmode_probe(struct typec_altmode *alt)
>  	alt->desc = "DisplayPort";
>  	alt->ops = &dp_altmode_ops;
>  
> +	fwnode = dev_fwnode(alt->dev.parent->parent); /* typec_port fwnode */
> +	dp->connector_fwnode = fwnode_find_reference(fwnode, "displayport", 0);
> +	if (IS_ERR(dp->connector_fwnode))
> +		dp->connector_fwnode = NULL;
> +
>  	typec_altmode_set_drvdata(alt, dp);
>  
>  	dp->state = DP_STATE_ENTER;
> @@ -555,6 +571,13 @@ void dp_altmode_remove(struct typec_altmode *alt)
>  
>  	sysfs_remove_group(&alt->dev.kobj, &dp_altmode_group);
>  	cancel_work_sync(&dp->work);
> +
> +	if (dp->connector_fwnode) {
> +		if (dp->hpd)
> +			drm_connector_oob_hotplug_event(dp->connector_fwnode);
> +
> +		fwnode_handle_put(dp->connector_fwnode);
> +	}
>  }
>  EXPORT_SYMBOL_GPL(dp_altmode_remove);
>  
> -- 
> 2.31.1

-- 
heikki
