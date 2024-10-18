Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E109A40C4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 16:09:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC8E10E937;
	Fri, 18 Oct 2024 14:09:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qAex1rLi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1374010E934
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 14:09:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C04CAA4329F;
 Fri, 18 Oct 2024 14:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6025C4CEC3;
 Fri, 18 Oct 2024 14:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1729260569;
 bh=C4/YmzjPc/7gwlrguDACjSm7qG4ICBi4j44FEcFFiJg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qAex1rLiF/nSM6ahr6psEp73xyqP1jEWlPCeL8IN28waoRXswxWVHfNsyWJ3vodWR
 uLxRH39inIyELXBiWjI6/XS3mrQw3oSkhnG1+kMIIhhz+Tp8VpBXGHZe9Lksh/ymjH
 WVujzgtmaTDHMufXIMAOupUa2XflUr88V/Lpgfnc=
Date: Fri, 18 Oct 2024 16:09:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Message-ID: <2024101855-judo-tattered-bc3c@gregkh>
References: <8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.1729180470.git.geert+renesas@glider.be>
 <20241018131035.GA20602@pendragon.ideasonboard.com>
 <CAMuHMdVrahM9GYDX4FBZ31YBUZWm67-KoG-EBTDL8LU9bv2qsg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVrahM9GYDX4FBZ31YBUZWm67-KoG-EBTDL8LU9bv2qsg@mail.gmail.com>
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

On Fri, Oct 18, 2024 at 03:36:48PM +0200, Geert Uytterhoeven wrote:
> Hi Laurent,
> 
> CC GregKH
> 
> On Fri, Oct 18, 2024 at 3:10 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Fri, Oct 18, 2024 at 09:45:52AM +0200, Geert Uytterhoeven wrote:
> > > Each bridge instance creates up to four auxiliary devices with different
> > > names.  However, their IDs are always zero, causing duplicate filename
> > > errors when a system has multiple bridges:
> > >
> > >     sysfs: cannot create duplicate filename '/bus/auxiliary/devices/ti_sn65dsi86.gpio.0'
> > >
> > > Fix this by using a unique instance ID per bridge instance.
> >
> > Isn't this something that should be handled by the AUX core ? The code
> > below would otherwise need to be duplicated by all drivers, which seems
> > a burden we should avoid.
> 
> According to the documentation, this is the responsibility of the caller
> https://elixir.bootlin.com/linux/v6.11.4/source/include/linux/auxiliary_bus.h#L81
> I believe this is the same for platform devices.
> See also the example at
> https://elixir.bootlin.com/linux/v6.11.4/source/include/linux/auxiliary_bus.h#L116
> 
> Note: the platform bus supports PLATFORM_DEVID_AUTO, but the auxiliary
> bus does not.

Yes, it does not as it's up to the caller to create a unique name, like
your patch here does.  I'd argue that platform should also not do
automatic device ids, but that's a different argument :)

This change looks good to me!

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
