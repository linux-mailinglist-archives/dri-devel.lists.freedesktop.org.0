Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE88924150A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 04:43:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E646E0CA;
	Tue, 11 Aug 2020 02:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D57616E0CA
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 02:43:22 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6460858;
 Tue, 11 Aug 2020 04:43:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1597113801;
 bh=WW5T77cfFpWObOoCK4Jd1gjvAgx5wXNgpO1aG1KQAGo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AvcnLevqsm+75glXW8u0IeEaT4/SPDcX+tRt01nszuRleIHWVqP/1zGNKhPdeBtwQ
 Rl4lNNNYSdi+4OxLFhJ3rzoHDVNBTshZjfwVsj+lNybDvr8CE2mUlW5SH1e3s9zW72
 f/j9m4qvpu4MYOpl+jw/rDfGzRp/8Ev4jngdT+BE=
Date: Tue, 11 Aug 2020 05:43:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, daniel@ffwll.ch
Subject: Re: [PATCH v6 2/3] drm: bridge: Add support for Cadence MHDP DPI/DP
 bridge
Message-ID: <20200811024308.GE13513@pendragon.ideasonboard.com>
References: <1582712579-28504-1-git-send-email-yamonkar@cadence.com>
 <1582712579-28504-3-git-send-email-yamonkar@cadence.com>
 <20200311222053.GE4863@pendragon.ideasonboard.com>
 <ef6a6e31-425f-c402-83ab-886221b4a0c3@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ef6a6e31-425f-c402-83ab-886221b4a0c3@ti.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 Yuti Amonkar <yamonkar@cadence.com>, narmstrong@baylibre.com, airlied@linux.ie,
 jonas@kwiboo.se, jsarha@ti.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com, robh+dt@kernel.org,
 maxime@cerno.tech, praneeth@ti.com, sjakhade@cadence.com, mparab@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi, Daniel,

On Thu, Mar 12, 2020 at 09:13:06AM +0200, Tomi Valkeinen wrote:
> On 12/03/2020 00:20, Laurent Pinchart wrote:
> >> +	ret = load_firmware(mhdp);
> >> +	if (ret)
> >> +		goto phy_exit;
> >> +
> >> +	drm_bridge_add(&mhdp->bridge);
>
> > What if someone starts using the bridge before the firmware is
> > operational ? It seems that you should delay bridge registration until
> > the firmware is loaded. It may make it possible to remove
> > bridge_attached and solve the problem you mention in mhdp_fw_cb().
> 
> Handling the fw has been a bit of a pain... This is what we came up with to support all the 
> combinations (built-in/module, fw-userspace-helper/direct load, single-output/multiple-outputs).
> 
> The idea is that when the driver is loaded and probed (with or without fw), the DP is "ready". If we 
> don't have fw yet, everything looks fine, but the connector stays in disconnected state. When we get 
> the fw, connector will get connected (only if there's a cable connected, of course).
> 
> If we register the bridge only when we have fw, two things can happen:
> 
> - If we get the fw only rather late (in case userspace fw helper), a userspace app (e.g. weston) 
> could already have been started, and failed due to there being no DRM card.
> 
> - If we have two displays from the same display controller, say, DP and HDMI, the HDMI will only be 
> available when the DP is available. If the DP fw, for some reason, cannot be loaded, we never get HDMI.

These seem to me to be deficiencies in the graphics stack. We don't have
to solve them now, but I'm curious to know if anyone would have ideas on
how this should ideally be addressed. Daniel, what do you think ?

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
