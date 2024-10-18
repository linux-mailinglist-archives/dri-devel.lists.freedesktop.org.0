Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A689A4132
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 16:31:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24F110E14F;
	Fri, 18 Oct 2024 14:31:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TTrL2xL6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984CB10E14F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 14:31:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B1F34A44247;
 Fri, 18 Oct 2024 14:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0463C4CEC3;
 Fri, 18 Oct 2024 14:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1729261884;
 bh=JfB9lvxMoWET2hOxXPNBdT2uKL/PscD/8S5+uwWZoes=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TTrL2xL6DSDIbCrJeORRxW4iIZGoSXIE5we4tnNvBvudicT0CH0YiKnQeLb8wU2K0
 kuIXEq2odpz3i1ZKHSsHjCaGmmOD+ByVDizU3w+RJCpGV8X6LXUqJkhvDiLpszpLVP
 EloqGQO8A+Oje0nEp/wEl2VIMVEgzaKTKkKr2k70=
Date: Fri, 18 Oct 2024 16:31:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Douglas Anderson <dianders@chromium.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Fix multiple instances
Message-ID: <2024101837-crushed-emphasis-b496@gregkh>
References: <8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.1729180470.git.geert+renesas@glider.be>
 <20241018131035.GA20602@pendragon.ideasonboard.com>
 <CAMuHMdVrahM9GYDX4FBZ31YBUZWm67-KoG-EBTDL8LU9bv2qsg@mail.gmail.com>
 <2024101855-judo-tattered-bc3c@gregkh>
 <20241018142522.GA28934@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241018142522.GA28934@pendragon.ideasonboard.com>
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

On Fri, Oct 18, 2024 at 05:25:22PM +0300, Laurent Pinchart wrote:
> Hi Greg,
> 
> On Fri, Oct 18, 2024 at 04:09:26PM +0200, Greg KH wrote:
> > On Fri, Oct 18, 2024 at 03:36:48PM +0200, Geert Uytterhoeven wrote:
> > > On Fri, Oct 18, 2024 at 3:10 PM Laurent Pinchart wrote:
> > > > On Fri, Oct 18, 2024 at 09:45:52AM +0200, Geert Uytterhoeven wrote:
> > > > > Each bridge instance creates up to four auxiliary devices with different
> > > > > names.  However, their IDs are always zero, causing duplicate filename
> > > > > errors when a system has multiple bridges:
> > > > >
> > > > >     sysfs: cannot create duplicate filename '/bus/auxiliary/devices/ti_sn65dsi86.gpio.0'
> > > > >
> > > > > Fix this by using a unique instance ID per bridge instance.
> > > >
> > > > Isn't this something that should be handled by the AUX core ? The code
> > > > below would otherwise need to be duplicated by all drivers, which seems
> > > > a burden we should avoid.
> > > 
> > > According to the documentation, this is the responsibility of the caller
> > > https://elixir.bootlin.com/linux/v6.11.4/source/include/linux/auxiliary_bus.h#L81
> > > I believe this is the same for platform devices.
> > > See also the example at
> > > https://elixir.bootlin.com/linux/v6.11.4/source/include/linux/auxiliary_bus.h#L116
> > > 
> > > Note: the platform bus supports PLATFORM_DEVID_AUTO, but the auxiliary
> > > bus does not.
> > 
> > Yes, it does not as it's up to the caller to create a unique name, like
> > your patch here does.  I'd argue that platform should also not do
> > automatic device ids, but that's a different argument :)
> 
> __auxiliary_device_add() creates the device name with
> 
> 	dev_set_name(dev, "%s.%s.%d", modname, auxdev->name, auxdev->id);
> 
> I'm not calling for a PLATFORM_DEVID_AUTO-like feature here, but
> shouldn't the first component of the device name use the parent's name
> instead of the module name ?

Why would the parent's name not be the module name?  That name is
guaranteed unique in the system.  If you want "uniqueness" within the
driver/module, use the name and id field please.

That's worked well so far, but to be fair, aux devices are pretty new.
What problem is this naming scheme causing?

thanks,

greg k-h
