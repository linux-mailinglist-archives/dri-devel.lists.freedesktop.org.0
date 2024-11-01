Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6739B8C09
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 08:27:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E31EA10E0FB;
	Fri,  1 Nov 2024 07:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cDmhzBQi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C8C10E0FB
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 07:27:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9538EA40B71;
 Fri,  1 Nov 2024 07:25:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3057C4CECD;
 Fri,  1 Nov 2024 07:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730446025;
 bh=eB/YxladbY67Z1rGM/yK1zVVfqWKD65iIbhTpOy341Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cDmhzBQi4YTa0N5Msh41yVsVAP1dMN4CQB/M2DhBeySbNoCTF+ZMGFUGGpBtj8lSt
 FLDsDJhRWVRMVEBzJi4UpIdl6ZqccdXfbQwYUR87Rx1s21LSs/0whgmcBCrpY1ySGN
 8p1WnGjgOHGB7Xkf+WEhRnpdwh1UNOdcdo3WZ4ftF6FXNt3MXg4g6waUvRM0XjmY/x
 5PNrhX3qSy/UV3DHjUOnUQyv70vt//Zr/uI9NZYmZZvdIhgBUKzpTIW7FH+xjl8X6e
 UJ0c7XDunu/N5V1V1YQxj7W0kCqo9ypOqklz67LTPKJrMtwLbnFoYXqhGQFdhQLpKN
 pa2oCz/HXMyBA==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1t6m3j-000000004kI-0lrJ;
 Fri, 01 Nov 2024 08:27:03 +0100
Date: Fri, 1 Nov 2024 08:27:03 +0100
From: Johan Hovold <johan@kernel.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: neil.armstrong@linaro.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abel Vesa <abel.vesa@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] drm/bridge: Fix assignment of the of_node of the
 parent to aux bridge
Message-ID: <ZySCx9mvjRjo0Xfp@hovoldconsulting.com>
References: <20241018-drm-aux-bridge-mark-of-node-reused-v2-1-aeed1b445c7d@linaro.org>
 <172951608323.1285208.3162107667310691864.b4-ty@linaro.org>
 <230b5910-6790-44cb-90ed-222bee89054d@linux.dev>
 <c2a4cc3a-2ffc-46f3-8636-238cd561f7aa@linaro.org>
 <751a4ab5-acbf-4e57-8cf4-51ab10206cc9@linux.dev>
 <ZyOvAqnuxbNnGWli@hovoldconsulting.com>
 <30fefafc-d19a-40cb-bcb1-3c586ba8e67e@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30fefafc-d19a-40cb-bcb1-3c586ba8e67e@linux.dev>
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

On Fri, Nov 01, 2024 at 11:49:07AM +0800, Sui Jingfeng wrote:
> On 2024/11/1 00:23, Johan Hovold wrote:
> > On Thu, Oct 31, 2024 at 11:06:38PM +0800, Sui Jingfeng wrote:
> >
> >> But I think Johan do need more times to understand what exactly
> >> the real problem is. We do need times to investigate new method.

> > No, I know perfectly well what the (immediate) problem is here (I was
> > the one adding support for the of_node_reused flag some years back).
> >
> > I just wanted to make sure that the commit message was correct and
> > complete before merging (and also to figure out whether this particular
> > patch needed to be backported).
> 
> Well under such a design, having the child device sharing the 'OF' device
> node with it parent device means that one parent device can *only*
> create one AUX bridge child device.
> 
> Since If you create two or more child AUX bridge, *all* of them will
> call devm_drm_of_get_bridge(&auxdev->dev, auxdev->dev.of_node, 0, 0),
> then we will *contend* the same next bridge resource.
> 
> Because of the 'auxdev->dev.of_node' is same for all its instance.
> While other display bridges seems don't has such limitations.

Oh, I'm not saying that there cannot be further issues with the design
or implementation here. And perhaps fixing those would make the
immediate issue Abel was trying to address go away.

Johan
