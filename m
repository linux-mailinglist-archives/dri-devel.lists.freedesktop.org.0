Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E718324F108
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 04:17:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 163756E0AA;
	Mon, 24 Aug 2020 02:17:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FEF76E0AA
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 02:17:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EF2C7279;
 Mon, 24 Aug 2020 04:17:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1598235468;
 bh=VS2Ji6BKMMlOSyfmJqEuX9dmkd7/97W4wQM4QpLMh50=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aGSEOSlarAmS9SsV7QTFOWmejcCuuTIlcLQDaTE6wx/zYQS2rV0NXhaygzDsHetxj
 pQDSk/qp9E91lBNQ9ow/HO9v2iIopYXdzc8Qnb+I0ku9vHrw+nuqm8dnDlg2yst0ck
 e7F74w9KDQWOFTmwNKAkZ3J3xYhsc3A3V3O34s1g=
Date: Mon, 24 Aug 2020 05:17:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v8 2/3] drm: bridge: Add support for Cadence MHDP DPI/DP
 bridge
Message-ID: <20200824021729.GY6002@pendragon.ideasonboard.com>
References: <1596713672-8146-1-git-send-email-sjakhade@cadence.com>
 <1596713672-8146-3-git-send-email-sjakhade@cadence.com>
 <20200811023622.GC13513@pendragon.ideasonboard.com>
 <a2f2ff9d-0c52-12d9-23c5-bab35ef8f8f6@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a2f2ff9d-0c52-12d9-23c5-bab35ef8f8f6@ti.com>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, praneeth@ti.com,
 yamonkar@cadence.com, narmstrong@baylibre.com, airlied@linux.ie,
 jonas@kwiboo.se, nsekhar@ti.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com, robh+dt@kernel.org,
 jsarha@ti.com, Swapnil Jakhade <sjakhade@cadence.com>, mparab@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On Fri, Aug 14, 2020 at 11:22:09AM +0300, Tomi Valkeinen wrote:
> On 11/08/2020 05:36, Laurent Pinchart wrote:
> 
> >> +static int cdns_mhdp_connector_init(struct cdns_mhdp_device *mhdp)
> >> +{
> >> +	u32 bus_format = MEDIA_BUS_FMT_RGB121212_1X36;
> >> +	struct drm_connector *conn = &mhdp->connector;
> >> +	struct drm_bridge *bridge = &mhdp->bridge;
> >> +	int ret;
> >> +
> >> +	if (!bridge->encoder) {
> >> +		DRM_ERROR("Parent encoder object not found");
> >> +		return -ENODEV;
> >> +	}
> >> +
> >> +	conn->polled = DRM_CONNECTOR_POLL_HPD;
> >> +
> >> +	ret = drm_connector_init(bridge->dev, conn, &cdns_mhdp_conn_funcs,
> >> +				 DRM_MODE_CONNECTOR_DisplayPort);
> >> +	if (ret) {
> >> +		DRM_ERROR("Failed to initialize connector with drm\n");
> >> +		return ret;
> >> +	}
> >> +
> >> +	drm_connector_helper_add(conn, &cdns_mhdp_conn_helper_funcs);
> >> +
> >> +	ret = drm_display_info_set_bus_formats(&conn->display_info,
> >> +					       &bus_format, 1);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	conn->display_info.bus_flags = DRM_BUS_FLAG_DE_HIGH;
> > 
> > Aren't these supposed to be retrieved from the display ? Why do we need
> > to override them here ?
> 
> DE_HIGH is meant for the display controller. I think this should be in bridge->timings->input_bus_flags
> 
> >> +static int cdns_mhdp_atomic_check(struct drm_bridge *bridge,
> >> +				  struct drm_bridge_state *bridge_state,
> >> +				  struct drm_crtc_state *crtc_state,
> >> +				  struct drm_connector_state *conn_state)
> >> +{
> >> +	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
> >> +	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
> >> +	int ret;
> >> +
> >> +	if (!mhdp->plugged)
> >> +		return 0;
> >> +
> >> +	mutex_lock(&mhdp->link_mutex);
> >> +
> >> +	if (!mhdp->link_up) {
> >> +		ret = cdns_mhdp_link_up(mhdp);
> >> +		if (ret < 0)
> >> +			goto err_check;
> >> +	}
> > 
> > atomic_check isn't supposed to access the hardware. Is there a reason
> > this is needed ?
> 
> We have been going back and forth with this. The basic problem is that
> to understand which videomodes can be used, you need to do link
> training to see the bandwidth available.
> 
> I'm not sure if we strictly need to do LT in atomic check, though...
> It would then pass modes that can't be used, but perhaps that's not a
> big issue.
> 
> I think the main point with doing LT in certain places is to filter
> the list of video modes passed to userspace, as we can't pass the
> modes from EDID directly without filtering them based on the link
> bandwidth.

I've discussed this on #dri-devel with Daniel a week or two ago. His
advice was to drop LT from atomic check, relying on DPCD (DisplayPort
Configuration Data) instead. If LT then fails to negotiate a high-enough
bandwidth for the mode when enabling the output, the link-status
property should be set to bad, and userspace should retry. I think
you've seen the discussion, I can provide a log if needed.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
