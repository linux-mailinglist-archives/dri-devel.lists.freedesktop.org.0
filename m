Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 067DE8723F1
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 17:19:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D9A10E4FB;
	Tue,  5 Mar 2024 16:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IJ4qkZCa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357A510E4E3
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 16:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709655538; x=1741191538;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Pa0fMVUTeiUhUY2VLkFLVyMrIu9XCbjjrHzKX5ueVOA=;
 b=IJ4qkZCaz63pUg99SXEYb9CtFb57zDlSpMwtAd1D8r038svN8TWKdQcj
 WE0zIUQFnkPoavC67+nwbWngEf7nUBBtsZ93dYKIaK7VhiFPC56hDvBAR
 CiSmgkkZQdSl4IfEHP/J8hbqBy4yNkuchphDAv+bF2FtzqhNGh4PjqeuS
 u2hzu6sHOgEX9pfo7IPC1Qv2B7GcW8zgOHb1ZxTH4E9zYXd/7vCCArS3K
 N4wNcPVmEPfrip8QdHW0DAPdsK9scaokBPcAxvxC6CUAfb5BeSvyBB7bN
 ZDvfsBZPpq0PB07DrQ288syLF1GckAt6HFAFRoTQeEkBz4IM8Ux3nnGq6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="7161286"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="7161286"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 08:18:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9533104"
Received: from omakhlou-mobl4.amr.corp.intel.com (HELO localhost)
 ([10.252.51.143])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 08:18:52 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin@pqrs.dk>, Andrzej Hajda
 <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss
 <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Alvin
 =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Subject: Re: [PATCH v3 2/2] drm/bridge: adv7511: get edid in hpd_work to
 update CEC phys address
In-Reply-To: <20240219-adv7511-cec-edid-v3-2-445aed2f1cd7@bang-olufsen.dk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240219-adv7511-cec-edid-v3-0-445aed2f1cd7@bang-olufsen.dk>
 <20240219-adv7511-cec-edid-v3-2-445aed2f1cd7@bang-olufsen.dk>
Date: Tue, 05 Mar 2024 18:18:50 +0200
Message-ID: <87cys81wk5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 19 Feb 2024, Alvin =C5=A0ipraga <alvin@pqrs.dk> wrote:
> From: Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>
>
> The adv7511 driver is solely responsible for setting the physical
> address of its CEC adapter. To do this, it must read the EDID. However,
> EDID is only read when either the drm_bridge_funcs :: get_edid or
> drm_connector_helper_funcs :: get_modes ops are called. Without loss of
> generality, it cannot be assumed that these ops are called when a sink
> gets attached. Therefore there exist scenarios in which the CEC physical
> address will be invalid (f.f.f.f), rendering the CEC adapter inoperable.
>
> Address this problem by always fetching the EDID in the HPD work when we
> detect a connection. The CEC physical address is set in the process.
> This is done by moving the EDID DRM helper into an internal helper
> function so that it can be cleanly called from an earlier section of
> the code. The EDID getter has not changed in practice.
>
> Reviewed-by: Robert Foss <rfoss@kernel.org>
> Signed-off-by: Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 73 ++++++++++++++++++----=
------
>  1 file changed, 47 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/d=
rm/bridge/adv7511/adv7511_drv.c
> index 5ffc5904bd59..d823b372ff43 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -542,6 +542,36 @@ static int adv7511_get_edid_block(void *data, u8 *bu=
f, unsigned int block,
>  	return 0;
>  }
>=20=20
> +static struct edid *__adv7511_get_edid(struct adv7511 *adv7511,
> +				       struct drm_connector *connector)
> +{
> +	struct edid *edid;
> +
> +	/* Reading the EDID only works if the device is powered */
> +	if (!adv7511->powered) {
> +		unsigned int edid_i2c_addr =3D
> +					(adv7511->i2c_edid->addr << 1);
> +
> +		__adv7511_power_on(adv7511);
> +
> +		/* Reset the EDID_I2C_ADDR register as it might be cleared */
> +		regmap_write(adv7511->regmap, ADV7511_REG_EDID_I2C_ADDR,
> +			     edid_i2c_addr);
> +	}
> +
> +	edid =3D drm_do_get_edid(connector, adv7511_get_edid_block, adv7511);
> +
> +	if (!adv7511->powered)
> +		__adv7511_power_off(adv7511);
> +
> +	adv7511_set_config_csc(adv7511, connector, adv7511->rgb,
> +			       drm_detect_hdmi_monitor(edid));
> +
> +	cec_s_phys_addr_from_edid(adv7511->cec_adap, edid);

It really would be better to do drm_edid_read_custom(),
drm_edid_connector_update(), and cec_s_phys_addr() with the physical
address from connector->display_info.source_physical_address initialized
by drm_edid_connector_update().

The point is, cec_s_phys_addr_from_edid() has its own duplicate EDID
parsing, which is slightly different from drm_edid_connector_update()
and of course redundant.


BR,
Jani.


> +
> +	return edid;
> +}
> +
>  /* ---------------------------------------------------------------------=
--------
>   * Hotplug handling
>   */
> @@ -595,8 +625,23 @@ static void adv7511_hpd_work(struct work_struct *wor=
k)
>  		adv7511->connector.status =3D status;
>=20=20
>  		if (adv7511->connector.dev) {
> -			if (status =3D=3D connector_status_disconnected)
> +			if (status =3D=3D connector_status_disconnected) {
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
> +				edid =3D __adv7511_get_edid(adv7511,
> +							  &adv7511->connector);
> +				kfree(edid);
> +			}
> +
>  			drm_kms_helper_hotplug_event(adv7511->connector.dev);
>  		} else {
>  			drm_bridge_hpd_notify(&adv7511->bridge, status);
> @@ -611,31 +656,7 @@ static void adv7511_hpd_work(struct work_struct *wor=
k)
>  static struct edid *adv7511_get_edid(struct adv7511 *adv7511,
>  				     struct drm_connector *connector)
>  {
> -	struct edid *edid;
> -
> -	/* Reading the EDID only works if the device is powered */
> -	if (!adv7511->powered) {
> -		unsigned int edid_i2c_addr =3D
> -					(adv7511->i2c_edid->addr << 1);
> -
> -		__adv7511_power_on(adv7511);
> -
> -		/* Reset the EDID_I2C_ADDR register as it might be cleared */
> -		regmap_write(adv7511->regmap, ADV7511_REG_EDID_I2C_ADDR,
> -			     edid_i2c_addr);
> -	}
> -
> -	edid =3D drm_do_get_edid(connector, adv7511_get_edid_block, adv7511);
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
>=20=20
>  static int adv7511_get_modes(struct adv7511 *adv7511,

--=20
Jani Nikula, Intel
