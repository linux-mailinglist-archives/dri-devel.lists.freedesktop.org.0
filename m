Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0A29507AE
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 16:33:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C30458876A;
	Tue, 13 Aug 2024 14:33:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hM1gpYPZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A6E8876A
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 14:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723559579; x=1755095579;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yYmSADZI5opGeLzpfk5KFVFuK9V4rm2ESSze6SWYrc0=;
 b=hM1gpYPZ9dMWyNQmVI/rcGf00rjndsHqxlwG+0de/Uh77YAkNJ5L3lrk
 QVUlW4LBHVSKDQJV0Lj0ziCz/HvsbvDL7otC0AFirMV0w/SVBjjkRhQzR
 QqrYxuqZhTNOztTx3thj8bObQYMhmbSneP0spf/0d8JFwZY/Z/Vh6YQKG
 a2VlxJWfDpWf0uvBWrP1Iup+uNsgSjr5+CR+QB03NhmI7jEmcigvDgTkB
 fOLkUFotyZtEp5jfV4KZHJ+12l2qFYh6k4SVWEPxNKIu1iB3HmA7qnp+k
 yMQX1T9NtHzZ8Pfqp7VQIleKoQSDbwoZ/CT9EgWfE4XQ2n4WcygKZYBq2 g==;
X-CSE-ConnectionGUID: P8lfrHJ+STyjwxP3q0Ws4w==
X-CSE-MsgGUID: /6LtY/6FQ3CfRiCeXRO0Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="25490183"
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="25490183"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 07:32:59 -0700
X-CSE-ConnectionGUID: 96evE7TcQXy6fBhvy5nVQw==
X-CSE-MsgGUID: JtW4SInQStyxOwsut3YheA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="58561914"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.4])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 07:32:54 -0700
Date: Tue, 13 Aug 2024 16:32:50 +0200
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
Message-ID: <ZrtuksiarZNS8L79@ashyti-mobl2.lan>
References: <20240808-ti-sn65dsi83-dev_err_probe-v1-1-72417aa275ab@bootlin.com>
 <ZrSfayN4U6Lk3UCj@ashyti-mobl2.lan> <20240813101643.5bf8d245@booty>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813101643.5bf8d245@booty>
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

On Tue, Aug 13, 2024 at 10:16:43AM +0200, Luca Ceresoli wrote:
> On Thu, 8 Aug 2024 11:35:23 +0100
> Andi Shyti <andi.shyti@linux.intel.com> wrote:
> > On Thu, Aug 08, 2024 at 12:26:14PM +0200, Luca Ceresoli wrote:
> > > When devm_drm_of_get_bridge() fails, the probe fails silently. Use
> > > dev_err_probe() instead to log an error or report the deferral reason,
> > > whichever is applicable.
> > > 
> > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > ---
> > >  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > index 57a7ed13f996..60b9f14d769a 100644
> > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > @@ -606,7 +606,7 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
> > >  
> > >  	panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 2, 0);
> > >  	if (IS_ERR(panel_bridge))
> > > -		return PTR_ERR(panel_bridge);
> > > +		return dev_err_probe(dev, PTR_ERR(panel_bridge), "Failed to get panel bridge\n");  
> > 
> > patch looks good, but the message is a bit misleading. You are
> > not failing to get the panel bridge, but you are failing to find
> > a panel bridge in a DT node. Right?
> 
> As I can see from both the documentation and the code,
> devm_drm_of_get_bridge() is really returning a pointer to a panel
> bridge, potentially allocating and adding it in case it was not present
> before. Navigating the device tree is only a part of what it does.
> 
> Do you think I am missing something?

No, maybe it's me being a bit pedantic. In the sense that we are
not really failing to get the panel, but most probably the panel
is not installed. I'm not strong on this comment, though, so that
feel free to add:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
