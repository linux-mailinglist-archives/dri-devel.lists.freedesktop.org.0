Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 329717E1774
	for <lists+dri-devel@lfdr.de>; Sun,  5 Nov 2023 23:53:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1131110E00B;
	Sun,  5 Nov 2023 22:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0555710E00B
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Nov 2023 22:53:25 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E76C85AA;
 Sun,  5 Nov 2023 23:53:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1699224784;
 bh=dNcx5iDMFzxOMAoTLK6Hi+aLe2QDlPQ35djZA8jJ2xA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PffUCUzufLQueoyqDiVd0GUM82lBLHNdJwH8Aq1TEItVkX3DvotEBEL1D8U0D2Q/n
 xjmxzD5PvZ+gfz4RoROPGY8TuCgbi5iHy11UWPkotAl6j9IXKY3GFxEGQSABiSTnZa
 H4lDr+KzsUYqJSc5YWDZu4iJJA5lVSVX7uQ6nC9U=
Date: Mon, 6 Nov 2023 00:53:30 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 02/10] drm/tidss: Use PM autosuspend
Message-ID: <20231105225330.GA15635@pendragon.ideasonboard.com>
References: <20231101-tidss-probe-v1-0-45149e0f9415@ideasonboard.com>
 <20231101-tidss-probe-v1-2-45149e0f9415@ideasonboard.com>
 <20231101135406.GR12764@pendragon.ideasonboard.com>
 <7395880d-36ba-471c-ba7c-745a0ec8e5de@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7395880d-36ba-471c-ba7c-745a0ec8e5de@ideasonboard.com>
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
Cc: Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Sakari Ailus <sakari.ailus@iki.fi>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

CC'ing Sakari for his expertise on runtime PM (I think he will soon
start wishing he would be ignorant in this area).

On Thu, Nov 02, 2023 at 08:34:45AM +0200, Tomi Valkeinen wrote:
> On 01/11/2023 15:54, Laurent Pinchart wrote:
> > On Wed, Nov 01, 2023 at 11:17:39AM +0200, Tomi Valkeinen wrote:
> >> Use runtime PM autosuspend feature, with 1s timeout, to avoid
> >> unnecessary suspend-resume cycles when, e.g. the userspace temporarily
> >> turns off the crtcs when configuring the outputs.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> ---
> >>   drivers/gpu/drm/tidss/tidss_drv.c | 8 +++++++-
> >>   1 file changed, 7 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
> >> index f403db11b846..64914331715a 100644
> >> --- a/drivers/gpu/drm/tidss/tidss_drv.c
> >> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> >> @@ -43,7 +43,9 @@ void tidss_runtime_put(struct tidss_device *tidss)
> >>   
> >>   	dev_dbg(tidss->dev, "%s\n", __func__);
> >>   
> >> -	r = pm_runtime_put_sync(tidss->dev);
> >> +	pm_runtime_mark_last_busy(tidss->dev);
> >> +
> >> +	r = pm_runtime_put_autosuspend(tidss->dev);
> >>   	WARN_ON(r < 0);
> >>   }
> >>   
> >> @@ -144,6 +146,9 @@ static int tidss_probe(struct platform_device *pdev)
> >>   
> >>   	pm_runtime_enable(dev);
> >>   
> >> +	pm_runtime_set_autosuspend_delay(dev, 1000);
> >> +	pm_runtime_use_autosuspend(dev);
> >> +
> >>   #ifndef CONFIG_PM
> >>   	/* If we don't have PM, we need to call resume manually */
> >>   	dispc_runtime_resume(tidss->dispc);
> > 
> > By the way, there's a way to handle this without any ifdef:
> > 
> > 	dispc_runtime_resume(tidss->dispc);
> > 
> > 	pm_runtime_set_active(dev);
> > 	pm_runtime_get_noresume(dev);
> > 	pm_runtime_enable(dev);
> > 	pm_runtime_set_autosuspend_delay(dev, 1000);
> > 	pm_runtime_use_autosuspend(dev);
> 
> I'm not sure I follow what you are trying to do here. The call to 
> dispc_runtime_resume() would crash if we have PM, as the HW would not be 
> enabled at that point.

Isn't dispc_runtime_resume() meant to enable the hardware ?

The idea is to enable the hardware, then enable runtime PM, and tell the
runtime PM framework that the device is enabled. If CONFIG_PM is not
set, the RPM calls will be no-ops, and the device will stay enable. If
CONFIG_PM is set, the device will be enabled, and will get disabled at
end of probe by a call to pm_runtime_put_autosuspend().

> And even if it wouldn't, we don't want to call dispc_runtime_resume()
> in probe when we have PM.

Don't you need to enable the device at probe time in order to reset it,
as done in later patches in the series ?

> > Then, in the error path,
> > 
> > 	pm_runtime_dont_use_autosuspend(dev);
> > 	pm_runtime_disable(dev);
> > 	pm_runtime_put_noidle(dev);
> > 
> > 	dispc_runtime_suspend(tidss->dispc);
> > 
> > And in remove:
> > 
> > 	pm_runtime_dont_use_autosuspend(dev);
> > 	pm_runtime_disable(dev);
> > 	if (!pm_runtime_status_suspended(dev))
> > 		dispc_runtime_suspend(tidss->dispc);
> > 	pm_runtime_set_suspended(dev);
> > 
> > And yes, runtime PM is a horrible API.
> > 
> >> @@ -215,6 +220,7 @@ static void tidss_remove(struct platform_device *pdev)
> >>   	/* If we don't have PM, we need to call suspend manually */
> >>   	dispc_runtime_suspend(tidss->dispc);
> >>   #endif
> >> +	pm_runtime_dont_use_autosuspend(dev);
> > 
> > This also needs to be done in the probe error path.
> 
> Oops. Right, I'll add that.

-- 
Regards,

Laurent Pinchart
