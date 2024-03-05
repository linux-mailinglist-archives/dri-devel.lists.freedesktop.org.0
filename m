Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB80872285
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 16:17:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B29112BA4;
	Tue,  5 Mar 2024 15:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LucUjNmI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6BC112BA4
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 15:17:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi
 [89.27.53.110])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EBB7D8D0;
 Tue,  5 Mar 2024 16:16:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1709651811;
 bh=UBEdaobsAJ/RjTCc0B7vnfs+RuHFw5jINJSSUXaUtmo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LucUjNmIuv35SolmEs0QX4TdFDr5H5g3XVJFI6j989OzK68FYIcUcdQwdRkuFXQQ7
 Bkknjmd5TvR/o0wm1MYdl7Qh4x9Xny/hvs7mhp2H0ZW6niFdJmlCWqapmyaqmC6LAO
 4XX5CIVsPUi37PD0Sc3P/pYnxuCmGIUFEtVOguvY=
Date: Tue, 5 Mar 2024 17:17:09 +0200
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
Subject: Re: [PATCH v3 1/2] drm/bridge: adv7511: rearrange hotplug work code
Message-ID: <20240305151709.GF12482@pendragon.ideasonboard.com>
References: <20240219-adv7511-cec-edid-v3-0-445aed2f1cd7@bang-olufsen.dk>
 <20240219-adv7511-cec-edid-v3-1-445aed2f1cd7@bang-olufsen.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240219-adv7511-cec-edid-v3-1-445aed2f1cd7@bang-olufsen.dk>
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

Hi Alvin,

Thank you for the patch.

On Mon, Feb 19, 2024 at 09:12:58PM +0100, Alvin Šipraga wrote:
> From: Alvin Šipraga <alsi@bang-olufsen.dk>
> 
> In preparation for calling EDID helpers from the hotplug work, move the
> hotplug work below the EDID helper section. No functional change.
> 
> Reviewed-by: Robert Foss <rfoss@kernel.org>
> Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 120 ++++++++++++++-------------
>  1 file changed, 62 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 8be235144f6d..5ffc5904bd59 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -406,64 +406,6 @@ static void adv7511_power_off(struct adv7511 *adv7511)
>   * Interrupt and hotplug detection
>   */
>  
> -static bool adv7511_hpd(struct adv7511 *adv7511)
> -{
> -	unsigned int irq0;
> -	int ret;
> -
> -	ret = regmap_read(adv7511->regmap, ADV7511_REG_INT(0), &irq0);
> -	if (ret < 0)
> -		return false;
> -
> -	if (irq0 & ADV7511_INT0_HPD) {
> -		regmap_write(adv7511->regmap, ADV7511_REG_INT(0),
> -			     ADV7511_INT0_HPD);
> -		return true;
> -	}
> -
> -	return false;
> -}
> -
> -static void adv7511_hpd_work(struct work_struct *work)
> -{
> -	struct adv7511 *adv7511 = container_of(work, struct adv7511, hpd_work);
> -	enum drm_connector_status status;
> -	unsigned int val;
> -	int ret;
> -
> -	ret = regmap_read(adv7511->regmap, ADV7511_REG_STATUS, &val);
> -	if (ret < 0)
> -		status = connector_status_disconnected;
> -	else if (val & ADV7511_STATUS_HPD)
> -		status = connector_status_connected;
> -	else
> -		status = connector_status_disconnected;
> -
> -	/*
> -	 * The bridge resets its registers on unplug. So when we get a plug
> -	 * event and we're already supposed to be powered, cycle the bridge to
> -	 * restore its state.
> -	 */
> -	if (status == connector_status_connected &&
> -	    adv7511->connector.status == connector_status_disconnected &&
> -	    adv7511->powered) {
> -		regcache_mark_dirty(adv7511->regmap);
> -		adv7511_power_on(adv7511);
> -	}
> -
> -	if (adv7511->connector.status != status) {
> -		adv7511->connector.status = status;
> -
> -		if (adv7511->connector.dev) {
> -			if (status == connector_status_disconnected)
> -				cec_phys_addr_invalidate(adv7511->cec_adap);
> -			drm_kms_helper_hotplug_event(adv7511->connector.dev);
> -		} else {
> -			drm_bridge_hpd_notify(&adv7511->bridge, status);
> -		}
> -	}
> -}
> -
>  static int adv7511_irq_process(struct adv7511 *adv7511, bool process_hpd)
>  {
>  	unsigned int irq0, irq1;
> @@ -600,6 +542,68 @@ static int adv7511_get_edid_block(void *data, u8 *buf, unsigned int block,
>  	return 0;
>  }
>  
> +/* -----------------------------------------------------------------------------
> + * Hotplug handling
> + */
> +
> +static bool adv7511_hpd(struct adv7511 *adv7511)
> +{
> +	unsigned int irq0;
> +	int ret;
> +
> +	ret = regmap_read(adv7511->regmap, ADV7511_REG_INT(0), &irq0);
> +	if (ret < 0)
> +		return false;
> +
> +	if (irq0 & ADV7511_INT0_HPD) {
> +		regmap_write(adv7511->regmap, ADV7511_REG_INT(0),
> +			     ADV7511_INT0_HPD);
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +static void adv7511_hpd_work(struct work_struct *work)
> +{
> +	struct adv7511 *adv7511 = container_of(work, struct adv7511, hpd_work);
> +	enum drm_connector_status status;
> +	unsigned int val;
> +	int ret;
> +
> +	ret = regmap_read(adv7511->regmap, ADV7511_REG_STATUS, &val);
> +	if (ret < 0)
> +		status = connector_status_disconnected;
> +	else if (val & ADV7511_STATUS_HPD)
> +		status = connector_status_connected;
> +	else
> +		status = connector_status_disconnected;
> +
> +	/*
> +	 * The bridge resets its registers on unplug. So when we get a plug
> +	 * event and we're already supposed to be powered, cycle the bridge to
> +	 * restore its state.
> +	 */
> +	if (status == connector_status_connected &&
> +	    adv7511->connector.status == connector_status_disconnected &&
> +	    adv7511->powered) {
> +		regcache_mark_dirty(adv7511->regmap);
> +		adv7511_power_on(adv7511);
> +	}
> +
> +	if (adv7511->connector.status != status) {
> +		adv7511->connector.status = status;
> +
> +		if (adv7511->connector.dev) {
> +			if (status == connector_status_disconnected)
> +				cec_phys_addr_invalidate(adv7511->cec_adap);
> +			drm_kms_helper_hotplug_event(adv7511->connector.dev);
> +		} else {
> +			drm_bridge_hpd_notify(&adv7511->bridge, status);
> +		}
> +	}
> +}
> +
>  /* -----------------------------------------------------------------------------
>   * ADV75xx helpers
>   */

-- 
Regards,

Laurent Pinchart
