Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA5539A122
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 14:35:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E9C6F466;
	Thu,  3 Jun 2021 12:35:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873C06F466
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 12:35:02 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 62EA5EF;
 Thu,  3 Jun 2021 14:34:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1622723699;
 bh=onUa2iH+tMw4evUZL7Xjj7ms/k5ag5WQdNG+bLSFEX4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KUgEmSe8e299vmclnx3lLykffZ+PpPo/nnFTdTo7A6gV7pKlEbOTSEHPRit5SDXjF
 bGeK9zGudc32PKn8vGMHsFWqJeqes9EAI0sYXTPxGrwhvkYhwVZ5qQjiZ61cfZXT5D
 C61JvOkBmn1E3n+8R2GpXnTN2qf4mUx4EWVgiucA=
Date: Thu, 3 Jun 2021 15:34:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCHv3 1/6] drm: drm_bridge: add connector_attach/detach
 bridge ops
Message-ID: <YLjMZiX71mcQNQdO@pendragon.ideasonboard.com>
References: <20210428132545.1205162-1-hverkuil-cisco@xs4all.nl>
 <20210428132545.1205162-2-hverkuil-cisco@xs4all.nl>
 <bcf1d476-216f-db51-840e-7cda58585b5b@ideasonboard.com>
 <c3d0a979-ba34-6432-8832-1103c62cd1fd@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c3d0a979-ba34-6432-8832-1103c62cd1fd@xs4all.nl>
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
Cc: David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Tony Lindgren <tony@atomide.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hans,

On Thu, May 27, 2021 at 09:22:12AM +0200, Hans Verkuil wrote:
> On 04/05/2021 10:26, Tomi Valkeinen wrote:
> > On 28/04/2021 16:25, Hans Verkuil wrote:
> >> Add bridge connector_attach/detach ops. These ops are called when a
> >> bridge is attached or detached to a drm_connector. These ops can be
> >> used to register and unregister an HDMI CEC adapter for a bridge that
> >> supports CEC.
> >>
> >> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >> ---
> >>   drivers/gpu/drm/drm_bridge_connector.c | 25 +++++++++++++++++++++++-
> >>   include/drm/drm_bridge.h               | 27 ++++++++++++++++++++++++++
> >>   2 files changed, 51 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
> >> index 791379816837..0676677badfe 100644
> >> --- a/drivers/gpu/drm/drm_bridge_connector.c
> >> +++ b/drivers/gpu/drm/drm_bridge_connector.c
> >> @@ -203,6 +203,11 @@ static void drm_bridge_connector_destroy(struct drm_connector *connector)
> >>   {
> >>   	struct drm_bridge_connector *bridge_connector =
> >>   		to_drm_bridge_connector(connector);
> >> +	struct drm_bridge *bridge;
> >> +
> >> +	drm_for_each_bridge_in_chain(bridge_connector->encoder, bridge)
> >> +		if (bridge->funcs->connector_detach)
> >> +			bridge->funcs->connector_detach(bridge, connector);
> >>   
> >>   	if (bridge_connector->bridge_hpd) {
> >>   		struct drm_bridge *hpd = bridge_connector->bridge_hpd;
> >> @@ -318,6 +323,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> >>   	struct i2c_adapter *ddc = NULL;
> >>   	struct drm_bridge *bridge;
> >>   	int connector_type;
> >> +	int ret;
> >>   
> >>   	bridge_connector = kzalloc(sizeof(*bridge_connector), GFP_KERNEL);
> >>   	if (!bridge_connector)
> >> @@ -375,6 +381,23 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> >>   		connector->polled = DRM_CONNECTOR_POLL_CONNECT
> >>   				  | DRM_CONNECTOR_POLL_DISCONNECT;
> >>   
> >> -	return connector;
> >> +	ret = 0;
> >> +	/* call connector_attach for all bridges */
> >> +	drm_for_each_bridge_in_chain(encoder, bridge) {
> >> +		if (!bridge->funcs->connector_attach)
> >> +			continue;
> >> +		ret = bridge->funcs->connector_attach(bridge, connector);
> >> +		if (ret)
> >> +			break;
> >> +	}
> >> +	if (!ret)
> >> +		return connector;
> >> +
> >> +	/* on error, detach any previously successfully attached connectors */
> >> +	list_for_each_entry_continue_reverse(bridge, &(encoder)->bridge_chain,
> > 
> > No need for parenthesis in (encoder) here.
> > 
> >> +					     chain_node)
> >> +		if (bridge->funcs->connector_detach)
> >> +			bridge->funcs->connector_detach(bridge, connector);
> >> +	return ERR_PTR(ret);
> >>   }
> >>   EXPORT_SYMBOL_GPL(drm_bridge_connector_init);
> >> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> >> index 2195daa289d2..333fbc3a03e9 100644
> >> --- a/include/drm/drm_bridge.h
> >> +++ b/include/drm/drm_bridge.h
> >> @@ -629,6 +629,33 @@ struct drm_bridge_funcs {
> >>   	 * the DRM_BRIDGE_OP_HPD flag in their &drm_bridge->ops.
> >>   	 */
> >>   	void (*hpd_disable)(struct drm_bridge *bridge);
> >> +
> >> +	/**
> >> +	 * @connector_attach:
> >> +	 *
> >> +	 * This callback is invoked whenever our bridge is being attached to a
> >> +	 * &drm_connector. This is where an HDMI CEC adapter can be registered.
> >> +	 *
> >> +	 * The @connector_attach callback is optional.
> >> +	 *
> >> +	 * RETURNS:
> >> +	 *
> >> +	 * Zero on success, error code on failure.
> >> +	 */
> >> +	int (*connector_attach)(struct drm_bridge *bridge,
> >> +				struct drm_connector *conn);
> >> +
> >> +	/**
> >> +	 * @connector_detach:
> >> +	 *
> >> +	 * This callback is invoked whenever our bridge is being detached from a
> >> +	 * &drm_connector. This is where an HDMI CEC adapter can be
> >> +	 * unregistered.
> >> +	 *
> >> +	 * The @connector_detach callback is optional.
> >> +	 */
> >> +	void (*connector_detach)(struct drm_bridge *bridge,
> >> +				 struct drm_connector *conn);
> >>   };
> >>   
> >>   /**
> >>
> > 
> > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > 
> > I can take this series as it's mostly omapdrm, but we'll need a 
> > reviewed-by/acked-by from a maintainer for this patch.
> 
> Laurent, aren't you the drm bridge maintainer?

I'm merely a reviewer, but one without much free time these days :-(

> If so, can you review/ack this patch so Tomi can merge it?

Overall, I'm not fond of giving access to the connector to individual
bridges. It breaks the abstraction layers, and seems to be a bit of a
hack. On the other hand, a proper solution would likely involve lots of
work, so I'm not rejecting this, but I fear these operations will be
abused and we'll regret it later.

-- 
Regards,

Laurent Pinchart
