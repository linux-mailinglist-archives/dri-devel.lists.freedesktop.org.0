Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D6E5AD873
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 19:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3167810E46F;
	Mon,  5 Sep 2022 17:38:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6190B10E471
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 17:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662399496; x=1693935496;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=wwrxaBGmctdtRWscxmq8fW9GaRxCVf5lDzYYiT5pUZ4=;
 b=n9YNZ152ziwqd5qxpEGCGJZhSPUbrldTSOS79UTQTgDjEJy0up86t6pT
 Mju+7w1b4h88/ETwaHsz6OiN8fnm+CRxmzedSWypzRGS4fzkNGv7R7d8T
 MN5AsKZCGgIbGdYwx42WKSu4G9dmcbLdjKlffvExfLRnQJajuM6GIZu+f
 bifpqOdUAq9DoIQ6gso45WAYxHsRFOAyWnrLfL8JtrcX4VIN3yGSACP1u
 IlMQykoVt19XN9YqGk+R8UZNSiB2IS9r+HFTDzlDCJl1j7bMMDB0tcpa5
 ftPSNTD/r9EWqcCKkHM6vazQgj5DQBm2gOzFpirZt7lC+OiU1HV7a7rEy A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="276171966"
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; d="scan'208";a="276171966"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2022 10:38:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; d="scan'208";a="675360713"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga008.fm.intel.com with SMTP; 05 Sep 2022 10:38:12 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 05 Sep 2022 20:38:11 +0300
Date: Mon, 5 Sep 2022 20:38:11 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v4 4/8] drm/vc4: hdmi: Simplify the hotplug handling
Message-ID: <YxY0A8RQsGZkwrtU@intel.com>
References: <20220829134731.213478-1-maxime@cerno.tech>
 <20220829134731.213478-5-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220829134731.213478-5-maxime@cerno.tech>
X-Patchwork-Hint: comment
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 29, 2022 at 03:47:27PM +0200, Maxime Ripard wrote:
> Our detect callback has a bunch of operations to perform depending on
> the current and last status of the connector, such a setting the CEC
> physical address or enabling the scrambling again.
> 
> This is currently dealt with a bunch of if / else statetements that make
> it fairly difficult to read and extend.
> 
> Let's move all that logic to a function of its own.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 66 ++++++++++++++++++++++------------
>  1 file changed, 44 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index b786645eaeb7..9fad57ebdd11 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -273,17 +273,53 @@ static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi) {}
>  
>  static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder);
>  
> +static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
> +				    enum drm_connector_status status)
> +{
> +	struct drm_connector *connector = &vc4_hdmi->connector;
> +	struct edid *edid;
> +
> +	/*
> +	 * NOTE: This function should really be called with
> +	 * vc4_hdmi->mutex held, but doing so results in reentrancy
> +	 * issues since cec_s_phys_addr_from_edid might call
> +	 * .adap_enable, which leads to that funtion being called with
> +	 * our mutex held.
> +	 *
> +	 * Concurrency isn't an issue at the moment since we don't share
> +	 * any state with any of the other frameworks so we can ignore
> +	 * the lock for now.
> +	 */
> +
> +	if (status == connector->status)
> +		return;

This looks to have a change in behaviour to not call
vc4_hdmi_enable_scrambling() unless a change in the
connector status was detected. The previous code called
it regarless.

When I was doing the i915 stuff I did have a sink that
left hpd asserted while turned off, and when powering
back up it instead generated a pulse on the hpd line.
Not sure if such a pulse is always slow enough that
you can reasonably guarantee a detection of both edges...

Apart from that (and the cec locking mess that I dared
not even look at) the rest of the series looks OK to me.

> +
> +	if (status == connector_status_disconnected) {
> +		cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
> +		return;
> +	}
> +
> +	edid = drm_get_edid(connector, vc4_hdmi->ddc);
> +	if (!edid)
> +		return;
> +
> +	cec_s_phys_addr_from_edid(vc4_hdmi->cec_adap, edid);
> +	kfree(edid);
> +
> +	vc4_hdmi_enable_scrambling(&vc4_hdmi->encoder.base.base);
> +}
> +
>  static enum drm_connector_status
>  vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
>  {
>  	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
> -	bool connected = false;
> +	enum drm_connector_status status = connector_status_disconnected;
>  
>  	/*
>  	 * NOTE: This function should really take vc4_hdmi->mutex, but
>  	 * doing so results in reentrancy issues since
> -	 * cec_s_phys_addr_from_edid might call .adap_enable, which
> -	 * leads to that funtion being called with our mutex held.
> +	 * vc4_hdmi_handle_hotplug() can call into other functions that
> +	 * would take the mutex while it's held here.
>  	 *
>  	 * Concurrency isn't an issue at the moment since we don't share
>  	 * any state with any of the other frameworks so we can ignore
> @@ -294,31 +330,17 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
>  
>  	if (vc4_hdmi->hpd_gpio) {
>  		if (gpiod_get_value_cansleep(vc4_hdmi->hpd_gpio))
> -			connected = true;
> +			status = connector_status_connected;
>  	} else {
>  		if (vc4_hdmi->variant->hp_detect &&
>  		    vc4_hdmi->variant->hp_detect(vc4_hdmi))
> -			connected = true;
> +			status = connector_status_connected;
>  	}
>  
> -	if (connected) {
> -		if (connector->status != connector_status_connected) {
> -			struct edid *edid = drm_get_edid(connector, vc4_hdmi->ddc);
> -
> -			if (edid) {
> -				cec_s_phys_addr_from_edid(vc4_hdmi->cec_adap, edid);
> -				kfree(edid);
> -			}
> -		}
> -
> -		vc4_hdmi_enable_scrambling(&vc4_hdmi->encoder.base);
> -		pm_runtime_put(&vc4_hdmi->pdev->dev);
> -		return connector_status_connected;
> -	}
> -
> -	cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
> +	vc4_hdmi_handle_hotplug(vc4_hdmi, status);
>  	pm_runtime_put(&vc4_hdmi->pdev->dev);
> -	return connector_status_disconnected;
> +
> +	return status;
>  }
>  
>  static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
> -- 
> 2.37.1

-- 
Ville Syrjälä
Intel
