Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB077B02F9
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 13:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7691B10E4DF;
	Wed, 27 Sep 2023 11:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F84C10E4DF
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 11:30:58 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [95.214.66.65])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A2D918BF;
 Wed, 27 Sep 2023 13:29:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1695814155;
 bh=qSmTGHToi+ePmt08btgl4dfVq9gfhIgSPTVEib6vUzk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZBE3RNcKU1/4yKSBskfnxE/GflOKHD02VqS3+kTVaKCc1HXgTmUsb97e7rbHs1NM8
 nUVizq6ifroQ46k9tnRFgXfkTJeKqylXDWyV8FdHPffBq1A5gYNrD4KDYsq7Qn5VbD
 sVRPj6LcDIsouOEwEpoDYJT6jWlGWm0ao6IdGuNU=
Date: Wed, 27 Sep 2023 14:31:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 1/2] drm/bridge: use drm_bridge_get_edid() instead of
 using ->get_edid directly
Message-ID: <20230927113106.GU5854@pendragon.ideasonboard.com>
References: <20230914131450.2473061-1-jani.nikula@intel.com>
 <20230926101959.GB5854@pendragon.ideasonboard.com>
 <87v8bvkiqz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87v8bvkiqz.fsf@intel.com>
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

On Wed, Sep 27, 2023 at 01:33:56PM +0300, Jani Nikula wrote:
> On Tue, 26 Sep 2023, Laurent Pinchart wrote:
> > On Thu, Sep 14, 2023 at 04:14:49PM +0300, Jani Nikula wrote:
> >> Make drm_bridge_get_edid() the one place to call the hook.
> >> 
> >> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> >> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> >> Cc: Robert Foss <rfoss@kernel.org>
> >> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> >> Cc: Jonas Karlman <jonas@kwiboo.se>
> >> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Thanks Laurent, does that cover patch 2/2 as well, or just 1/2?

Just 1/2, I hadn't looked at 2/2. I've now reviewed it too.

> >> ---
> >>  drivers/gpu/drm/drm_bridge_connector.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >> 
> >> diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
> >> index 1da93d5a1f61..31baf1f5ff81 100644
> >> --- a/drivers/gpu/drm/drm_bridge_connector.c
> >> +++ b/drivers/gpu/drm/drm_bridge_connector.c
> >> @@ -238,7 +238,7 @@ static int drm_bridge_connector_get_modes_edid(struct drm_connector *connector,
> >>  	if (status != connector_status_connected)
> >>  		goto no_edid;
> >>  
> >> -	edid = bridge->funcs->get_edid(bridge, connector);
> >> +	edid = drm_bridge_get_edid(bridge, connector);
> >>  	if (!drm_edid_is_valid(edid)) {
> >>  		kfree(edid);
> >>  		goto no_edid;
> 
> -- 
> Jani Nikula, Intel

-- 
Regards,

Laurent Pinchart
