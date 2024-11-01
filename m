Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2DC9B8DA7
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 10:21:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF4B910E077;
	Fri,  1 Nov 2024 09:20:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UbN1DXSM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4227F10E077
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 09:20:57 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3436D3D4;
 Fri,  1 Nov 2024 10:20:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1730452851;
 bh=DvGdTgJ/Dg9JlFjF6NE7OmksllUnclX4NbH7Ot6PLFk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UbN1DXSMfqjA+beJQ+tmf2QAG3lWzfRixBwST78dyzID5Q9CUZjnxJr7nuL+mHKC7
 9KqXtwICmXxJwrrlbewhGPeNmpBXER55mMZ/MwEtL0UfmLVe1AB9gHssb/XY3xk12l
 8eD7F2OUFpTlJ/USFuTALVxl1et5E3n1FS5/5Iuc=
Date: Fri, 1 Nov 2024 11:20:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Johan Hovold <johan@kernel.org>, neil.armstrong@linaro.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
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
Message-ID: <20241101092049.GJ2473@pendragon.ideasonboard.com>
References: <20241018-drm-aux-bridge-mark-of-node-reused-v2-1-aeed1b445c7d@linaro.org>
 <172951608323.1285208.3162107667310691864.b4-ty@linaro.org>
 <230b5910-6790-44cb-90ed-222bee89054d@linux.dev>
 <c2a4cc3a-2ffc-46f3-8636-238cd561f7aa@linaro.org>
 <751a4ab5-acbf-4e57-8cf4-51ab10206cc9@linux.dev>
 <ZyOvAqnuxbNnGWli@hovoldconsulting.com>
 <30fefafc-d19a-40cb-bcb1-3c586ba8e67e@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
> 
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

Brainstorming a bit, I wonder if we could create a swnode for the
auxiliary device, instead of reusing the parent's OF node. This would
require switching the DRM OF-based APIs to fwnode, but that's easy and
mostly a mechanical change.

-- 
Regards,

Laurent Pinchart
