Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A42BC7B0EEF
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 00:35:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D966C10E12F;
	Wed, 27 Sep 2023 22:35:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2393610E12F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 22:35:02 +0000 (UTC)
Received: from pendragon.ideasonboard.com (176-132-227-79.abo.bbox.fr
 [176.132.227.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C83FADFB;
 Thu, 28 Sep 2023 00:33:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1695853998;
 bh=tgAM6hIf8vOK+JbAL7Vltz95go7SSxBCMXgYon6UG5w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oZIyfWeNWzFWcCxiWW3ZuR2voup+13/CqIpCfzRQHZS5757xYYoKIoOUPi/OkA8Sg
 vgRP7qEIRQ3xJeKySuyVVs4ej5Zccm2qNL78Py5W4OPBuNRjLyyPLYjXoC8kXBSBYK
 Puc+rMXp324F+g5tsfoGAOtW7pyF0o4CnEitbEC8=
Date: Thu, 28 Sep 2023 01:35:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 2/2] drm/bridge: lt9611uxc: use drm_bridge_get_edid()
 instead of using ->get_edid directly
Message-ID: <20230927223510.GY5854@pendragon.ideasonboard.com>
References: <20230914131450.2473061-1-jani.nikula@intel.com>
 <20230914131450.2473061-2-jani.nikula@intel.com>
 <20230927113058.GA8079@pendragon.ideasonboard.com>
 <87lecrk8rw.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87lecrk8rw.fsf@intel.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 27, 2023 at 05:09:23PM +0300, Jani Nikula wrote:
> On Wed, 27 Sep 2023, Laurent Pinchart wrote:
> > On Thu, Sep 14, 2023 at 04:14:50PM +0300, Jani Nikula wrote:
> >> Make drm_bridge_get_edid() the one place to call the hook.
> >> 
> >> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> >> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> >> Cc: Robert Foss <rfoss@kernel.org>
> >> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> >> Cc: Jonas Karlman <jonas@kwiboo.se>
> >> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> 
> >> ---
> >> 
> >> UNTESTED
> >
> > I can't test this either, but it looks fine.
> 
> Thanks. Are you okay with merging the two with review only?

The changes are trivial, if we can't get anyone to test them, then I'm
OK merging them.

> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> >> ---
> >>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >> 
> >> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> >> index 22c84d29c2bc..7835738a532e 100644
> >> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> >> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> >> @@ -296,7 +296,7 @@ static int lt9611uxc_connector_get_modes(struct drm_connector *connector)
> >>  	unsigned int count;
> >>  	struct edid *edid;
> >>  
> >> -	edid = lt9611uxc->bridge.funcs->get_edid(&lt9611uxc->bridge, connector);
> >> +	edid = drm_bridge_get_edid(&lt9611uxc->bridge, connector);
> >>  	drm_connector_update_edid_property(connector, edid);
> >>  	count = drm_add_edid_modes(connector, edid);
> >>  	kfree(edid);

-- 
Regards,

Laurent Pinchart
