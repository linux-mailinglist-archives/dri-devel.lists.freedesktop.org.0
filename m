Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C08872293
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 16:22:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8932D112BA9;
	Tue,  5 Mar 2024 15:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QTlTby0d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79865112BA8
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 15:22:53 +0000 (UTC)
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi
 [89.27.53.110])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 429AD8D0;
 Tue,  5 Mar 2024 16:22:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1709652155;
 bh=rVZIw01LOeMGt6xMQN9MnpOFeHTaZK+0KRQTlu0h68w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QTlTby0dJCFtukvZ2n1ugxY2crRs+OzKheEa8qYt9faZXxRjcaXmz4vwhbQtf/dwC
 R1+3R58EM2hP1/nxpTlBYpDP7WC0/mCQFgmC8vZzX3ntxb0gl28MLsPFGkL21lGru8
 zbbQSHlCuI/I+1jcYhJp21zgLoAoKmMKng3+asVQ=
Date: Tue, 5 Mar 2024 17:22:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin@pqrs.dk>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Subject: Re: [PATCH v3 2/2] drm/bridge: adv7511: get edid in hpd_work to
 update CEC phys address
Message-ID: <20240305152254.GG12482@pendragon.ideasonboard.com>
References: <20240219-adv7511-cec-edid-v3-0-445aed2f1cd7@bang-olufsen.dk>
 <20240219-adv7511-cec-edid-v3-2-445aed2f1cd7@bang-olufsen.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240219-adv7511-cec-edid-v3-2-445aed2f1cd7@bang-olufsen.dk>
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

Hello Alvin,

Thank you for the patch.

On Mon, Feb 19, 2024 at 09:12:59PM +0100, Alvin Šipraga wrote:
> From: Alvin Šipraga <alsi@bang-olufsen.dk>
> 
> The adv7511 driver is solely responsible for setting the physical
> address of its CEC adapter. To do this, it must read the EDID. However,
> EDID is only read when either the drm_bridge_funcs :: get_edid or
> drm_connector_helper_funcs :: get_modes ops are called. Without loss of
> generality, it cannot be assumed that these ops are called when a sink
> gets attached.

I wonder if that should be fixed, but it would likely be a quite big
rework of the DRM core. I've been thinking for several years now that
hotplug handling could do with more love.

> Therefore there exist scenarios in which the CEC physical
> address will be invalid (f.f.f.f), rendering the CEC adapter inoperable.
> 
> Address this problem by always fetching the EDID in the HPD work when we
> detect a connection. The CEC physical address is set in the process.
> This is done by moving the EDID DRM helper into an internal helper
> function so that it can be cleanly called from an earlier section of
> the code. The EDID getter has not changed in practice.
> 
> Reviewed-by: Robert Foss <rfoss@kernel.org>
> Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 73 ++++++++++++++++++----------
>  1 file changed, 47 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 5ffc5904bd59..d823b372ff43 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -542,6 +542,36 @@ static int adv7511_get_edid_block(void *data, u8 *buf, unsigned int block,
>  	return 0;
>  }
>  
> +static struct edid *__adv7511_get_edid(struct adv7511 *adv7511,
> +				       struct drm_connector *connector)
> +{
> +	struct edid *edid;
> +
> +	/* Reading the EDID only works if the device is powered */
> +	if (!adv7511->powered) {
> +		unsigned int edid_i2c_addr =
> +					(adv7511->i2c_edid->addr << 1);
> +
> +		__adv7511_power_on(adv7511);
> +
> +		/* Reset the EDID_I2C_ADDR register as it might be cleared */
> +		regmap_write(adv7511->regmap, ADV7511_REG_EDID_I2C_ADDR,
> +			     edid_i2c_addr);
> +	}
> +
> +	edid = drm_do_get_edid(connector, adv7511_get_edid_block, adv7511);
> +
> +	if (!adv7511->powered)
> +		__adv7511_power_off(adv7511);
> +
> +	adv7511_set_config_csc(adv7511, connector, adv7511->rgb,
> +			       drm_detect_hdmi_monitor(edid));
> +
> +	cec_s_phys_addr_from_edid(adv7511->cec_adap, edid);
> +
> +	return edid;
> +}
> +
>  /* -----------------------------------------------------------------------------
>   * Hotplug handling
>   */
> @@ -595,8 +625,23 @@ static void adv7511_hpd_work(struct work_struct *work)
>  		adv7511->connector.status = status;
>  
>  		if (adv7511->connector.dev) {
> -			if (status == connector_status_disconnected)
> +			if (status == connector_status_disconnected) {
>  				cec_phys_addr_invalidate(adv7511->cec_adap);
> +			} else {
> +				struct edid *edid;
> +
> +				/*
> +				 * Get the updated EDID so that the CEC
> +				 * subsystem gets informed of any change in CEC
> +				 * address. The helper returns a newly allocated
> +				 * edid structure, so free it to prevent
> +				 * leakage.
> +				 */
> +				edid = __adv7511_get_edid(adv7511,
> +							  &adv7511->connector);
> +				kfree(edid);

This means that we will, in most case, fetch EDID twice when a monitor
is plugged in: once here, and once when the DRM core will call the
.get_edid() operation. I wonder, would it make sense to cache the EDID
here, and return the cache version from adv7511_get_edid() ?

> +			}
> +
>  			drm_kms_helper_hotplug_event(adv7511->connector.dev);
>  		} else {
>  			drm_bridge_hpd_notify(&adv7511->bridge, status);
> @@ -611,31 +656,7 @@ static void adv7511_hpd_work(struct work_struct *work)
>  static struct edid *adv7511_get_edid(struct adv7511 *adv7511,
>  				     struct drm_connector *connector)
>  {
> -	struct edid *edid;
> -
> -	/* Reading the EDID only works if the device is powered */
> -	if (!adv7511->powered) {
> -		unsigned int edid_i2c_addr =
> -					(adv7511->i2c_edid->addr << 1);
> -
> -		__adv7511_power_on(adv7511);
> -
> -		/* Reset the EDID_I2C_ADDR register as it might be cleared */
> -		regmap_write(adv7511->regmap, ADV7511_REG_EDID_I2C_ADDR,
> -			     edid_i2c_addr);
> -	}
> -
> -	edid = drm_do_get_edid(connector, adv7511_get_edid_block, adv7511);
> -
> -	if (!adv7511->powered)
> -		__adv7511_power_off(adv7511);
> -
> -	adv7511_set_config_csc(adv7511, connector, adv7511->rgb,
> -			       drm_detect_hdmi_monitor(edid));
> -
> -	cec_s_phys_addr_from_edid(adv7511->cec_adap, edid);
> -
> -	return edid;
> +	return __adv7511_get_edid(adv7511, connector);
>  }
>  
>  static int adv7511_get_modes(struct adv7511 *adv7511,
> 

-- 
Regards,

Laurent Pinchart
