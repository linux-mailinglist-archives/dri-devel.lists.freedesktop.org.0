Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0AB87EF72
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 19:04:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475F810F5FB;
	Mon, 18 Mar 2024 18:04:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vtO3Ho3S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B88010F690
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 18:04:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A6B8B1;
 Mon, 18 Mar 2024 19:03:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1710785036;
 bh=ytC7Jy+LJXldStggCJrABwzse0wCXMTACFRT3hDT9II=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vtO3Ho3ScpgfuoPNIQuhHJsCEcEZJLUM1pBBsuQK9F4nTNuWAzUsghgU2vdnp01gs
 f21K9mGJg1fRRsuFRPIOSQqosx/GqtE5fDZ0vGf1kLnkykXXzemwG3Akp5of8WyVla
 ub7pDh+fudBGwxeQsl1HOaAQX2mLYbMglnlv4xOA=
Date: Mon, 18 Mar 2024 20:04:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH] drm: bridge: thc63lvd1024: Print error message when DT
 parsing fails
Message-ID: <20240318180420.GP13682@pendragon.ideasonboard.com>
References: <20240318160601.2813-1-laurent.pinchart+renesas@ideasonboard.com>
 <78739dfe-c6ee-44bd-a2e6-2ced24ff15c1@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <78739dfe-c6ee-44bd-a2e6-2ced24ff15c1@linux.dev>
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

Hi Sui,

On Tue, Mar 19, 2024 at 12:42:41AM +0800, Sui Jingfeng wrote:
> On 2024/3/19 00:06, Laurent Pinchart wrote:
> > Commit 00084f0c01bf ("drm: bridge: thc63lvd1024: Switch to use
> > of_graph_get_remote_node()") simplified the thc63lvd1024 driver by
> > replacing hand-rolled code with a helper function.
> 
> [...]
> 
> > While doing so, it
> > created an error code path at probe time without any error message,
> 
> If this is a reason or a concern, then every drm bridges drivers will suffer from
> such a concern. Right?

Yes, bridge drivers (or any driver, really) should avoid failing probe
silently.

> > potentially causing probe issues that get annoying to debug.
> 
> Sorry, let's keep it fair enough, it creates nothing annoyed.
> 
> If there is a probe issues, then, it is caused by ill-behavioral DT.
> *NOT* my patch. And should be found during review stage.

Even before the review stage, in the DT development stage. My point is
that creating a silent failure path in probe will make it more difficult
for DT developers to debug issues.

> If the of_graph_get_remote_node() function is not good enough,
> I suggest to improve the of_graph_get_remote_node() function,
> then all callers of it will benefits.
> 
> Well, the strong word here just terrifying new programmers to call
> core function helpers. Please use more *soft* description in the
> commit message.

Could you please propose a wording that you would consider more soft ?

> > Fix it by
> > adding an error message.
> >
> > Fixes: 00084f0c01bf ("drm: bridge: thc63lvd1024: Switch to use of_graph_get_remote_node()")
> 
> Please drop the fixes tag at here, append the tag to a real bug-fix patch will make more sense imo.
> I suggest to improve the of_graph_get_remote_node() function, then all callers of it will benefits.
> NOT a single implement like this.

Improving core helpers is certainly a good idea, and if we do so, we can
simplify drivers. What I'm concerned is that commit 00084f0c01bf creates
a silent probe failure path, which didn't exist before it. This is why
this patch references it in the Fixes: tag, making sure that this patch
will get backported to any stable kernel that includes commit
00084f0c01bf. As far as I understand, this is business as usual. There's
nothing personal here, and no judgement on the quality of your code.

> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >   drivers/gpu/drm/bridge/thc63lvd1024.c | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
> > index 5f99f9724081..674efc489e3a 100644
> > --- a/drivers/gpu/drm/bridge/thc63lvd1024.c
> > +++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
> > @@ -125,8 +125,11 @@ static int thc63_parse_dt(struct thc63_dev *thc63)
> >   
> >   	remote = of_graph_get_remote_node(thc63->dev->of_node,
> >   					  THC63_RGB_OUT0, -1);
> > -	if (!remote)
> > +	if (!remote) {
> > +		dev_err(thc63->dev, "No remote endpoint for port@%u\n",
> > +			THC63_RGB_OUT0);
> >   		return -ENODEV;
> > +	}
> >   
> >   	thc63->next = of_drm_find_bridge(remote);
> >   	of_node_put(remote);
> >
> > base-commit: 00084f0c01bf3a2591d007010b196e048281c455

-- 
Regards,

Laurent Pinchart
