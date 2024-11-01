Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C12709B9382
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 15:43:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5757110E1D2;
	Fri,  1 Nov 2024 14:43:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MWSY2wEu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315FF10E1D2
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 14:43:24 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7B5A3A2;
 Fri,  1 Nov 2024 15:43:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1730472198;
 bh=DZWLfHW2eJhePPE3Q0nswhlD0ECMPDjCzq0Ko2Z40oY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MWSY2wEuc6Qj4FjBO1cBCoPs8MjJsah9QmCwk1mYCY9KoN9I2sQ1ACQPh9nnYAIF4
 XZI7POtpBEFYQMIMKaRhw6/NII7D3A0NpY0kmHqscG5E/j11ZbdJhvWZsMTs0qX+Jg
 U0kWOWPi7wXFI6a3uSYYB8XQ01MXInSjzYigHdP0=
Date: Fri, 1 Nov 2024 16:43:15 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>, Johan Hovold <johan@kernel.org>,
 neil.armstrong@linaro.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abel Vesa <abel.vesa@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] drm/bridge: Fix assignment of the of_node of the
 parent to aux bridge
Message-ID: <20241101144315.GK2473@pendragon.ideasonboard.com>
References: <20241018-drm-aux-bridge-mark-of-node-reused-v2-1-aeed1b445c7d@linaro.org>
 <172951608323.1285208.3162107667310691864.b4-ty@linaro.org>
 <230b5910-6790-44cb-90ed-222bee89054d@linux.dev>
 <c2a4cc3a-2ffc-46f3-8636-238cd561f7aa@linaro.org>
 <751a4ab5-acbf-4e57-8cf4-51ab10206cc9@linux.dev>
 <ZyOvAqnuxbNnGWli@hovoldconsulting.com>
 <30fefafc-d19a-40cb-bcb1-3c586ba8e67e@linux.dev>
 <20241101092049.GJ2473@pendragon.ideasonboard.com>
 <CAA8EJprEDV2JViB9kQS2H1p=NgF+PcataEejC97DBo=aU5g5kw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAA8EJprEDV2JViB9kQS2H1p=NgF+PcataEejC97DBo=aU5g5kw@mail.gmail.com>
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

On Fri, Nov 01, 2024 at 12:27:15PM +0200, Dmitry Baryshkov wrote:
> On Fri, 1 Nov 2024 at 11:20, Laurent Pinchart wrote:
> > On Fri, Nov 01, 2024 at 11:49:07AM +0800, Sui Jingfeng wrote:
> > > On 2024/11/1 00:23, Johan Hovold wrote:
> > > > On Thu, Oct 31, 2024 at 11:06:38PM +0800, Sui Jingfeng wrote:
> > > >
> > > >> But I think Johan do need more times to understand what exactly
> > > >> the real problem is. We do need times to investigate new method.
> > > > No, I know perfectly well what the (immediate) problem is here (I was
> > > > the one adding support for the of_node_reused flag some years back).
> > > >
> > > > I just wanted to make sure that the commit message was correct and
> > > > complete before merging (and also to figure out whether this particular
> > > > patch needed to be backported).
> > >
> > > Well under such a design, having the child device sharing the 'OF' device
> > > node with it parent device means that one parent device can *only*
> > > create one AUX bridge child device.
> > >
> > > Since If you create two or more child AUX bridge, *all* of them will
> > > call devm_drm_of_get_bridge(&auxdev->dev, auxdev->dev.of_node, 0, 0),
> > > then we will *contend* the same next bridge resource.
> > >
> > > Because of the 'auxdev->dev.of_node' is same for all its instance.
> > > While other display bridges seems don't has such limitations.
> >
> > Brainstorming a bit, I wonder if we could create a swnode for the
> > auxiliary device, instead of reusing the parent's OF node.
> 
> This will break bridge lookup which is performed by following the OF
> graph links. So the aux bridges should use corresponding of_node or
> fwnode.

We can also expand the lookup infrastructure and handle more platform
integration and driver architecture options. I'm not sure how it would
look like, but all these are in-kernel APIs, so they can be extended and
modified if needed.

> > This would
> > require switching the DRM OF-based APIs to fwnode, but that's easy and
> > mostly a mechanical change.

-- 
Regards,

Laurent Pinchart
