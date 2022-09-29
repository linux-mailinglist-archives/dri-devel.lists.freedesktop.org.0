Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D565F016B
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 01:33:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F6F10EC11;
	Thu, 29 Sep 2022 23:33:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB17B10EC11
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 23:33:11 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A5C8747C;
 Fri, 30 Sep 2022 01:33:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664494389;
 bh=rsXQPfoODOoV2YweOgK8vKwcfwOCqbxKs2G25NITsXE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wm76qp2D4KHujb8qnUUTH+dm4zmzZn2BKqGocvRED6/EcWRUtfKQUnL8Cm+vxm/Xm
 NY4r/893XoVIsInA/tSKO3nseZpmblPZ5ojyodhs3mfwPIBZBNUZ/kzx30uFHZd+lX
 6IFzsk5SGu61QuHzRQqGGr49o3TStmnpvwfY/nWM=
Date: Fri, 30 Sep 2022 02:33:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Michael Rodin <mrodin@de.adit-jv.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] drm: do not call detect for connectors which are forced on
Message-ID: <YzYrNJbfGcch1UtX@pendragon.ideasonboard.com>
References: <20220826091121.389315-1-mrodin@de.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220826091121.389315-1-mrodin@de.adit-jv.com>
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
Cc: David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 michael@rodin.online, Sean Paul <seanpaul@chromium.org>,
 Alex Deucher <alexander.deucher@amd.com>, erosca@de.adit-jv.com,
 Vincent Abriou <vincent.abriou@st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Michael,

Thank you for the patch. Sorry for the late reply, I wasn't on the CC
list so I didn't notice it.

On Fri, Aug 26, 2022 at 11:11:21AM +0200, Michael Rodin wrote:
> "detect" should not be called and its return value shall not be used when a
> connector is forced as hinted in the commit d50ba256b5f1 ("drm/kms: start
> adding command line interface using fb.") and the commit 6fe14acd496e
> ("drm: Document drm_connector_funcs"). One negative side effect of doing
> this is observed on the RCar3 SoCs which use the dw-hdmi driver. It
> continues executing drm_helper_hpd_irq_event even if its connector is
> forced to ON. As consequence drm_helper_hpd_irq_event calls "detect" so the
> connector status is updated to "disconnected":
> 
> [  420.201527] [drm:drm_helper_hpd_irq_event] [CONNECTOR:76:HDMI-A-1] status updated from connected to disconnected
> 
> This status is corrected by drm_helper_probe_single_connector_modes shortly
> after this because this function checks if a connector is forced:
> 
> [  420.218703] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:76:HDMI-A-1] status updated from disconnected to connected
> 
> To avoid similar issues this commit adapts functions which call "detect"
> so they check if a connector is forced and return the correct status.
> 
> Fixes: 949f08862d66 ("drm: Make the connector .detect() callback optional")

Is this really the right fixes tag ? The call to .detect() in
drm_helper_hpd_irq_event() predates that commit.

> Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
> ---
>  drivers/gpu/drm/drm_probe_helper.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index bb427c5a4f1f..1691047d0472 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -289,7 +289,12 @@ drm_helper_probe_detect_ctx(struct drm_connector *connector, bool force)
>  retry:
>  	ret = drm_modeset_lock(&connector->dev->mode_config.connection_mutex, &ctx);
>  	if (!ret) {
> -		if (funcs->detect_ctx)
> +		if (connector->force == DRM_FORCE_ON ||
> +		    connector->force == DRM_FORCE_ON_DIGITAL)
> +			ret = connector_status_connected;
> +		else if (connector->force == DRM_FORCE_OFF)
> +			ret = connector_status_disconnected;
> +		else if (funcs->detect_ctx)
>  			ret = funcs->detect_ctx(connector, &ctx, force);
>  		else if (connector->funcs->detect)
>  			ret = connector->funcs->detect(connector, force);
> @@ -340,7 +345,14 @@ drm_helper_probe_detect(struct drm_connector *connector,
>  	if (ret)
>  		return ret;
>  
> -	if (funcs->detect_ctx)
> +	if (connector->force == DRM_FORCE_ON ||
> +	    connector->force == DRM_FORCE_ON_DIGITAL)
> +		ret = connector_status_connected;
> +	else if (connector->force == DRM_FORCE_OFF)
> +		ret = connector_status_disconnected;
> +	else if (funcs->detect_ctx)
> +		ret = funcs->detect_ctx(connector, ctx, force);
> +	else if (funcs->detect_ctx)
>  		ret = funcs->detect_ctx(connector, ctx, force);

Those two conditions are identical.

>  	else if (connector->funcs->detect)
>  		ret = connector->funcs->detect(connector, force);

The same logic is used in two places in this patch. Could this be
factored out to a separate function ? It may even be possible to
refactor drm_helper_probe_detect() and drm_helper_probe_detect_ctx() to
share more code between the two functions.

This being said, I'm not sure this is the right fix. Beside the i915 and
nouveau drivers, the only callers of drm_helper_probe_detect() are
drm_helper_probe_single_connector_modes(), output_poll_execute() and
check_connector_changed() in this file. The first two functions already
check connector->force and skip the call to drm_helper_probe_detect() if
the connector is forced. Only check_connector_changed() is missing that
check. Wouldn't it be simpler to return false in that function if
connector->force is set ?

Another question is whether it is valid for the dw-hdmi driver to call
drm_helper_hpd_irq_event() when the connector status is forced.
Shouldn't HPD events be ignored in that case ?

The detection code has grown quite complex over time, I would really
appreciate input from Maxime and Maarten on this.

-- 
Regards,

Laurent Pinchart
