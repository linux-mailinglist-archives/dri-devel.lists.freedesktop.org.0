Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9552F956F38
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 17:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F8810E2E9;
	Mon, 19 Aug 2024 15:49:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EuFiZOcx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3273810E2E9
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 15:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724082565; x=1755618565;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mpgtfZwkltRJnDE0vHDGt4EakdGQxqTVlLn+LHT0GCY=;
 b=EuFiZOcx1r7BKlVccoAA53EyQbebWfzSALNKqfQ0Ysd0DzoZ8V4Nhs9j
 ZDO2iAMXXbzLBFzLLFSCa6XATeiiWqqAnMwSaA4FwnpmeY7d9beL7eY6t
 aQA3Ukvq2mtM5uVBHWIVGGkRtUvzZiTdzDzpdHDcI6vyOmgjqjI4YRtDG
 g5MvMdzr9C/NwtHQqjlEVOQFzeku93GkO+rST+Lp4G1E5OhzGrA4CxCw/
 2aQnd9EvY6RBCM62+KV6nZ+TjcxLjkK8eOBVJ/9U0Tk6C3r+qm6Dd8vEl
 muIYbv4G44Z+3ju5x1FueXNHQD757wwX54Ik9TW3v5s+4BKM+vZ17rhJp g==;
X-CSE-ConnectionGUID: 7p3Z3TFqRJ6wqBEQaWuIJg==
X-CSE-MsgGUID: NFn4b852RbaVGxJM6+2byg==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="26204483"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="26204483"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 08:49:24 -0700
X-CSE-ConnectionGUID: xuc9agqnRzCKBBjaKhL80Q==
X-CSE-MsgGUID: 7X0Zf9fzSNOtrzWwOZM+7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="61192834"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.73])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 08:49:18 -0700
Date: Mon, 19 Aug 2024 17:49:13 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: use dev_err_probe when failing
 to get panel bridge
Message-ID: <ZsNpefhKhj4nXh0_@ashyti-mobl2.lan>
References: <20240808-ti-sn65dsi83-dev_err_probe-v1-1-72417aa275ab@bootlin.com>
 <ZrSfayN4U6Lk3UCj@ashyti-mobl2.lan> <20240813101643.5bf8d245@booty>
 <ZrtuksiarZNS8L79@ashyti-mobl2.lan> <20240819133840.26045152@booty>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819133840.26045152@booty>
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

Hi Luca,

On Mon, Aug 19, 2024 at 01:38:40PM +0200, Luca Ceresoli wrote:
> On Tue, 13 Aug 2024 16:32:50 +0200
> > On Tue, Aug 13, 2024 at 10:16:43AM +0200, Luca Ceresoli wrote:
> > > On Thu, 8 Aug 2024 11:35:23 +0100
> > > Andi Shyti <andi.shyti@linux.intel.com> wrote:  
> > > > On Thu, Aug 08, 2024 at 12:26:14PM +0200, Luca Ceresoli wrote:  
> > > > > When devm_drm_of_get_bridge() fails, the probe fails silently. Use
> > > > > dev_err_probe() instead to log an error or report the deferral reason,
> > > > > whichever is applicable.
> > > > > 
> > > > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > > > ---
> > > > >  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > > > index 57a7ed13f996..60b9f14d769a 100644
> > > > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > > > @@ -606,7 +606,7 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
> > > > >  
> > > > >  	panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 2, 0);
> > > > >  	if (IS_ERR(panel_bridge))
> > > > > -		return PTR_ERR(panel_bridge);
> > > > > +		return dev_err_probe(dev, PTR_ERR(panel_bridge), "Failed to get panel bridge\n");    
> > > > 
> > > > patch looks good, but the message is a bit misleading. You are
> > > > not failing to get the panel bridge, but you are failing to find
> > > > a panel bridge in a DT node. Right?  
> > > 
> > > As I can see from both the documentation and the code,
> > > devm_drm_of_get_bridge() is really returning a pointer to a panel
> > > bridge, potentially allocating and adding it in case it was not present
> > > before. Navigating the device tree is only a part of what it does.
> > > 
> > > Do you think I am missing something?  
> > 
> > No, maybe it's me being a bit pedantic. In the sense that we are
> > not really failing to get the panel, but most probably the panel
> > is not installed.
> 
> The panels I'm used to, which I believe to be the most common in
> embedded systems just have no way of being detected, so the operating
> system cannot detect a "panel not installed" condition.
> 
> However I went back to the code and realized your initial remark ("you
> are failing to find a panel bridge in a DT node") is more correct than
> I initially thought. Indeed there are two failure reasons for
> devm_drm_of_get_bridge() to fail: DT lookup and panel bridge creation
> failures. The latter however can be due to -ENOMEM (unlikely) or
> (panel->connector_type == DRM_MODE_CONNECTOR_Unknown), which in turn
> can be due to either a panel driver error or again a DT error in case
> the driver gets the panel type from DT, as panel-simple.c does.
> 
> That said, the role of devm_drm_of_get_bridge() is to provide a panel
> bridge object. If it fails, that means it is unable to provide such an
> object for whatever reason. Reasons currently include DT issues (the
> most likely), driver bug and -ENOMEM. There could be more reasons in
> future versions of the implementation.
> 
> I'm afraid I'm unable to express all the above logic in a single commit
> title line. However, should you have a better commit title or message
> to suggest, I'm still open to improvements. I value good commit
> messages.

yes, that's all correct... I'm just assuming that we don't fail
for enomem's or similar. But if you want to include them, then a
generic "get" might work.

To be honest, I wouldn't know how to write it better :-D
Writing error messages is skill per se.

Maybe something like

  ... "Failed to get panel bridge from DT (%pe)", panel_bridge);

Fact is that an error message should immidiately tell you what is
failing and you understand without browsing the code. A generic
"Failed to get..." says very little.

A use case can be if you receive a bug report. If someone tells
you "Failed to get..." you will need to start diggin on the
report. While if someone tells you "Failed to get panel bridge
from DT (-ENODEV)" you would immediately tell him to add the
panel in the configuration.

But... as I said...

> > I'm not strong on this comment, though, so that
> > feel free to add:

... this is a nitpick, feel free to ignore it.

> > Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> 
> Otherwise, I'm sending v2 with your review tag by the end of the week.

Thanks,
Andi
