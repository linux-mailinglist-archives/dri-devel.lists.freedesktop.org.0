Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 658806C0382
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 18:41:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6278010E182;
	Sun, 19 Mar 2023 17:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2BA10E18A
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 17:41:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-5-41-nat.elisa-mobile.fi
 [85.76.5.41])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 97EB4189A;
 Sun, 19 Mar 2023 18:41:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1679247699;
 bh=28ciIfdvWRNWa742z9erhVrubJ+67RoKMHrFTAbEAhw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MutowwL7gMMOf4ulJeV+OWwUUFZJJNsEvGldCmCW0OZM3uJIw1L9VRGo9PJi9zjYW
 Uey6tr8vwDWLxbHlBcEm/69LSsWvUYm84+Bc/++ne/h/VDD4X6eLSFdgkRHOfqgz4F
 4prLh66Ayq9Codcul07FntbKxw2YhLRnvMcCnH4I=
Date: Sun, 19 Mar 2023 19:41:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 01/19] drm/bridge: cdns-mhdp8546: Improve error reporting
 in remove callback
Message-ID: <20230319174144.GD13726@pendragon.ideasonboard.com>
References: <20230318190804.234610-1-u.kleine-koenig@pengutronix.de>
 <20230318190804.234610-2-u.kleine-koenig@pengutronix.de>
 <20230319131301.GF10144@pendragon.ideasonboard.com>
 <20230319135921.bf3awq3h36kb4q3e@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230319135921.bf3awq3h36kb4q3e@pengutronix.de>
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
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Jani Nikula <jani.nikula@intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Uwe,

On Sun, Mar 19, 2023 at 02:59:21PM +0100, Uwe Kleine-König wrote:
> On Sun, Mar 19, 2023 at 03:13:01PM +0200, Laurent Pinchart wrote:
> > On Sat, Mar 18, 2023 at 08:07:46PM +0100, Uwe Kleine-König wrote:
> > > Replace the generic error message issued by the driver core when the remove
> > > callback returns non-zero ("remove callback returned a non-zero value. This
> > > will be ignored.") by a message that tells the actual problem.
> > > 
> > > Also simplify a bit by checking the return value of wait_event_timeout a
> > > bit later.
> > > 
> > > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > ---
> > >  .../drm/bridge/cadence/cdns-mhdp8546-core.c    | 18 +++++++++---------
> > >  1 file changed, 9 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> > > index f6822dfa3805..d74c6fa30ccc 100644
> > > --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> > > +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> > > @@ -2574,7 +2574,6 @@ static int cdns_mhdp_remove(struct platform_device *pdev)
> > >  {
> > >  	struct cdns_mhdp_device *mhdp = platform_get_drvdata(pdev);
> > >  	unsigned long timeout = msecs_to_jiffies(100);
> > > -	bool stop_fw = false;
> > >  	int ret;
> > >  
> > >  	drm_bridge_remove(&mhdp->bridge);
> > > @@ -2582,18 +2581,19 @@ static int cdns_mhdp_remove(struct platform_device *pdev)
> > >  	ret = wait_event_timeout(mhdp->fw_load_wq,
> > >  				 mhdp->hw_state == MHDP_HW_READY,
> > >  				 timeout);
> > > -	if (ret == 0)
> > > -		dev_err(mhdp->dev, "%s: Timeout waiting for fw loading\n",
> > > -			__func__);
> > > -	else
> > > -		stop_fw = true;
> > > -
> > >  	spin_lock(&mhdp->start_lock);
> > >  	mhdp->hw_state = MHDP_HW_STOPPED;
> > >  	spin_unlock(&mhdp->start_lock);
> > >  
> > > -	if (stop_fw)
> > > +	if (ret == 0) {
> > > +		dev_err(mhdp->dev, "%s: Timeout waiting for fw loading\n",
> > > +			__func__);
> > > +	} else {
> > >  		ret = cdns_mhdp_set_firmware_active(mhdp, false);
> > > +		if (ret)
> > > +			dev_err(mhdp->dev, "Failed to stop firmware (%pe)\n",
> > > +				ERR_PTR(ret));
> > 
> > Why not simply
> > 			dev_err(mhdp->dev, "Failed to stop firmware (%d)\n",
> > 				ret);
> > 
> > ? Apart from that,
> 
> %pe is superior to %d because
> 
> 	Failed to stop firmware (EIO)
> 
> is easier to understand for humans than
> 
> 	Failed to stop firmware (-5)
> 
> . Don't you agree?

Partly :) When I try to match error codes received in userspace with
kernel log messages, or debug core dumps, numerical errors are easier.
At other times, the error name is likely better. I don't have a string
preference here.

-- 
Regards,

Laurent Pinchart
