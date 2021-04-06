Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD838355414
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 14:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1B36E0C5;
	Tue,  6 Apr 2021 12:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7507C6E0C5
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Apr 2021 12:41:20 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 73ACD8E5;
 Tue,  6 Apr 2021 14:41:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1617712877;
 bh=TScFm4kNLM8PgTEJReKqvDkIXKIGV2TPe2iQsESJ+Mg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mecuFYP5mVEU1d2E1IPnSWqHa9M1L3m64OzYPdTGWhX+iQe8FBhTQE2HuBMuTE9br
 8CakVbYWT2PUIjRk0VVnPeJWBbIltnb3JD26M7vWL/TkNtf2g8vT3s5XRv9hE4/jOF
 OPo/2xQV91UFOg+npgyLv38BwG5xDSmK1Lsha0Jg=
Date: Tue, 6 Apr 2021 15:40:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Subject: Re: [PATCH] drm: bridge: rename the function drm_bridge_hpd_notify
 to drm_bridge_hpd_cb
Message-ID: <YGxWwTTjhFcVDELB@pendragon.ideasonboard.com>
References: <20210330115200.26006-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210330115200.26006-1-dafna.hirschfeld@collabora.com>
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
Cc: airlied@linux.ie, dafna3@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, enric.balletbo@collabora.com,
 kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dafna,

Thank you for the patch.

On Tue, Mar 30, 2021 at 01:52:00PM +0200, Dafna Hirschfeld wrote:
> drm_bridge_funcs has a function called 'hpd_notify'.
> The function drm_bridge_hpd_notify does not call
> 'hpd_notify' but it calls 'hpd_cb'. This is rather
> confusing. Rename the function to fix this confusion.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c        | 2 +-
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 4 ++--
>  drivers/gpu/drm/bridge/display-connector.c          | 2 +-
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c          | 8 ++++----
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c           | 2 +-
>  drivers/gpu/drm/bridge/ti-tpd12s015.c               | 2 +-
>  drivers/gpu/drm/drm_bridge.c                        | 8 ++++----
>  include/drm/drm_bridge.h                            | 8 ++++----
>  8 files changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 76555ae64e9c..748f82910f4f 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -449,7 +449,7 @@ static void adv7511_hpd_work(struct work_struct *work)
>  				cec_phys_addr_invalidate(adv7511->cec_adap);
>  			drm_kms_helper_hotplug_event(adv7511->connector.dev);
>  		} else {
> -			drm_bridge_hpd_notify(&adv7511->bridge, status);
> +			drm_bridge_hpd_cb(&adv7511->bridge, status);
>  		}
>  	}
>  }
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index d0c65610ebb5..682da288ff6d 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -794,7 +794,7 @@ static void cdns_mhdp_fw_cb(const struct firmware *fw, void *context)
>  		if (mhdp->connector.dev)
>  			drm_kms_helper_hotplug_event(mhdp->bridge.dev);
>  		else
> -			drm_bridge_hpd_notify(&mhdp->bridge, cdns_mhdp_detect(mhdp));
> +			drm_bridge_hpd_cb(&mhdp->bridge, cdns_mhdp_detect(mhdp));
>  	}
>  }
>  
> @@ -2314,7 +2314,7 @@ static irqreturn_t cdns_mhdp_irq_handler(int irq, void *data)
>  			else
>  				drm_kms_helper_hotplug_event(mhdp->bridge.dev);
>  		} else {
> -			drm_bridge_hpd_notify(&mhdp->bridge, cdns_mhdp_detect(mhdp));
> +			drm_bridge_hpd_cb(&mhdp->bridge, cdns_mhdp_detect(mhdp));
>  		}
>  	}
>  
> diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
> index 05eb759da6fc..8ccd69d7fe34 100644
> --- a/drivers/gpu/drm/bridge/display-connector.c
> +++ b/drivers/gpu/drm/bridge/display-connector.c
> @@ -98,7 +98,7 @@ static irqreturn_t display_connector_hpd_irq(int irq, void *arg)
>  	struct display_connector *conn = arg;
>  	struct drm_bridge *bridge = &conn->bridge;
>  
> -	drm_bridge_hpd_notify(bridge, display_connector_detect(bridge));
> +	drm_bridge_hpd_cb(bridge, display_connector_detect(bridge));
>  
>  	return IRQ_HANDLED;
>  }
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index fee27952ec6d..58f61b5da605 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -175,10 +175,10 @@ static void lt9611uxc_hpd_work(struct work_struct *work)
>  		connected = lt9611uxc->hdmi_connected;
>  		mutex_unlock(&lt9611uxc->ocm_lock);
>  
> -		drm_bridge_hpd_notify(&lt9611uxc->bridge,
> -				      connected ?
> -				      connector_status_connected :
> -				      connector_status_disconnected);
> +		drm_bridge_hpd_cb(&lt9611uxc->bridge,
> +				  connected ?
> +				  connector_status_connected :
> +				  connector_status_disconnected);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index dda4fa9a1a08..984ab5c4bc71 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -3026,7 +3026,7 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
>  
>  		if (hdmi->bridge.dev) {
>  			drm_helper_hpd_irq_event(hdmi->bridge.dev);
> -			drm_bridge_hpd_notify(&hdmi->bridge, status);
> +			drm_bridge_hpd_cb(&hdmi->bridge, status);
>  		}
>  	}
>  
> diff --git a/drivers/gpu/drm/bridge/ti-tpd12s015.c b/drivers/gpu/drm/bridge/ti-tpd12s015.c
> index e0e015243a60..2f079b6f51bc 100644
> --- a/drivers/gpu/drm/bridge/ti-tpd12s015.c
> +++ b/drivers/gpu/drm/bridge/ti-tpd12s015.c
> @@ -103,7 +103,7 @@ static irqreturn_t tpd12s015_hpd_isr(int irq, void *data)
>  	struct tpd12s015_device *tpd = data;
>  	struct drm_bridge *bridge = &tpd->bridge;
>  
> -	drm_bridge_hpd_notify(bridge, tpd12s015_detect(bridge));
> +	drm_bridge_hpd_cb(bridge, tpd12s015_detect(bridge));
>  
>  	return IRQ_HANDLED;
>  }
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 64f0effb52ac..653761a0d5f9 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -1173,7 +1173,7 @@ void drm_bridge_hpd_disable(struct drm_bridge *bridge)
>  EXPORT_SYMBOL_GPL(drm_bridge_hpd_disable);
>  
>  /**
> - * drm_bridge_hpd_notify - notify hot plug detection events
> + * drm_bridge_hpd_cb - notify hot plug detection events

This function is still documented as notifying hot plug detection
events, so drm_bridge_hpd_cb() isn't a great name :-S I do agree there's
confusion with the current naming scheme though.

bridge->hpd_cb() is an internal callback, not part of bridge ops, so I'd
rather not expose its name in the public drm_bridge_hpd_notify() API.
Could we find a better naming scheme ?

>   * @bridge: bridge control structure
>   * @status: output connection status
>   *
> @@ -1183,15 +1183,15 @@ EXPORT_SYMBOL_GPL(drm_bridge_hpd_disable);
>   *
>   * This function shall be called in a context that can sleep.
>   */
> -void drm_bridge_hpd_notify(struct drm_bridge *bridge,
> -			   enum drm_connector_status status)
> +void drm_bridge_hpd_cb(struct drm_bridge *bridge,
> +		       enum drm_connector_status status)
>  {
>  	mutex_lock(&bridge->hpd_mutex);
>  	if (bridge->hpd_cb)
>  		bridge->hpd_cb(bridge->hpd_data, status);
>  	mutex_unlock(&bridge->hpd_mutex);
>  }
> -EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
> +EXPORT_SYMBOL_GPL(drm_bridge_hpd_cb);
>  
>  #ifdef CONFIG_OF
>  /**
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 2195daa289d2..ab54715eda8b 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -605,7 +605,7 @@ struct drm_bridge_funcs {
>  	 * @hpd_enable:
>  	 *
>  	 * Enable hot plug detection. From now on the bridge shall call
> -	 * drm_bridge_hpd_notify() each time a change is detected in the output
> +	 * drm_bridge_hpd_cb() each time a change is detected in the output
>  	 * connection status, until hot plug detection gets disabled with
>  	 * @hpd_disable.
>  	 *
> @@ -620,7 +620,7 @@ struct drm_bridge_funcs {
>  	 * @hpd_disable:
>  	 *
>  	 * Disable hot plug detection. Once this function returns the bridge
> -	 * shall not call drm_bridge_hpd_notify() when a change in the output
> +	 * shall not call drm_bridge_hpd_cb() when a change in the output
>  	 * connection status occurs.
>  	 *
>  	 * This callback is optional and shall only be implemented by bridges
> @@ -878,8 +878,8 @@ void drm_bridge_hpd_enable(struct drm_bridge *bridge,
>  				      enum drm_connector_status status),
>  			   void *data);
>  void drm_bridge_hpd_disable(struct drm_bridge *bridge);
> -void drm_bridge_hpd_notify(struct drm_bridge *bridge,
> -			   enum drm_connector_status status);
> +void drm_bridge_hpd_cb(struct drm_bridge *bridge,
> +		       enum drm_connector_status status);
>  
>  #ifdef CONFIG_DRM_PANEL_BRIDGE
>  struct drm_bridge *drm_panel_bridge_add(struct drm_panel *panel);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
