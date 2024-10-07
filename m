Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EC1993A1F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 00:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03F910E22C;
	Mon,  7 Oct 2024 22:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Vt/jQpsJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9244E10E009;
 Mon,  7 Oct 2024 22:25:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [132.205.230.14])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3BF2C2E0;
 Tue,  8 Oct 2024 00:23:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1728339812;
 bh=dP+7pB+yKyOf0NQhF4Ey5QlbknqrHAfw9DP+SkAi1ag=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vt/jQpsJvHUxjmrGDOx6XdDb5/eYcmNOZ+fqGvfgmsCX/Gb8xh5L8MF7/XiaHHs5d
 yKwoK1M07KNVU8k6VzBH5mlVNl0fsdfcm8rX4+3gQCvlKP9vNnMhm8hVpFB58jMlbq
 3JlQ6yo4ObX+z3BTaIVDayxCEaIiiFVwmh4Cxqis=
Date: Tue, 8 Oct 2024 01:25:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-gpio@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-i3c@lists.infradead.org, linux-iio@vger.kernel.org,
 linux-input@vger.kernel.org, patches@opensource.cirrus.com,
 iommu@lists.linux.dev, imx@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-usb@vger.kernel.org,
 linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org,
 asahi@lists.linux.dev, rafael@kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 00/51] treewide: Switch to __pm_runtime_put_autosuspend()
Message-ID: <20241007222502.GG30699@pendragon.ideasonboard.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <CAPDyKFp0N6UJhnHS164Tdf=xkWB0jzq65L9TdvYazeBQ-6WjeQ@mail.gmail.com>
 <20241007184924.GH14766@pendragon.ideasonboard.com>
 <CAPDyKFpQVnF7eQv3dup8k-3EijnMjuveCG9sZ=Rpey1Y6MBJEg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPDyKFpQVnF7eQv3dup8k-3EijnMjuveCG9sZ=Rpey1Y6MBJEg@mail.gmail.com>
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

Hi Ulf,

On Tue, Oct 08, 2024 at 12:08:24AM +0200, Ulf Hansson wrote:
> On Mon, 7 Oct 2024 at 20:49, Laurent Pinchart wrote:
> > On Fri, Oct 04, 2024 at 04:38:36PM +0200, Ulf Hansson wrote:
> > > On Fri, 4 Oct 2024 at 11:41, Sakari Ailus wrote:
> > > >
> > > > Hello everyone,
> > > >
> > > > This set will switch the users of pm_runtime_put_autosuspend() to
> > > > __pm_runtime_put_autosuspend() while the former will soon be re-purposed
> > > > to include a call to pm_runtime_mark_last_busy(). The two are almost
> > > > always used together, apart from bugs which are likely common. Going
> > > > forward, most new users should be using pm_runtime_put_autosuspend().
> > > >
> > > > Once this conversion is done and pm_runtime_put_autosuspend() re-purposed,
> > > > I'll post another set to merge the calls to __pm_runtime_put_autosuspend()
> > > > and pm_runtime_mark_last_busy().
> > >
> > > That sounds like it could cause a lot of churns.
> > >
> > > Why not add a new helper function that does the
> > > pm_runtime_put_autosuspend() and the pm_runtime_mark_last_busy()
> > > things? Then we can start moving users over to this new interface,
> > > rather than having this intermediate step?
> >
> > I think the API would be nicer if we used the shortest and simplest
> > function names for the most common use cases. Following
> > pm_runtime_put_autosuspend() with pm_runtime_mark_last_busy() is that
> > most common use case. That's why I like Sakari's approach of repurposing
> > pm_runtime_put_autosuspend(), and introducing
> > __pm_runtime_put_autosuspend() for the odd cases where
> > pm_runtime_mark_last_busy() shouldn't be called.
> 
> Okay, so the reason for this approach is because we couldn't find a
> short and descriptive name that could be used in favor of
> pm_runtime_put_autosuspend(). Let me throw some ideas at it and maybe
> you like it - or not. :-)

I like the idea at least :-)

> I don't know what options you guys discussed, but to me the entire
> "autosuspend"-suffix isn't really that necessary in my opinion. There
> are more ways than calling pm_runtime_put_autosuspend() that triggers
> us to use the RPM_AUTO flag for rpm_suspend(). For example, just
> calling pm_runtime_put() has the similar effect.

To be honest, I'm lost there. pm_runtime_put() calls
__pm_runtime_idle(RPM_GET_PUT | RPM_ASYNC), while
pm_runtime_put_autosuspend() calls __pm_runtime_suspend(RPM_GET_PUT |
RPM_ASYNC | RPM_AUTO).

> 
> Moreover, it's similar for pm_runtime_mark_last_busy(), it's called
> during rpm_resume() too, for example. So why bother about having
> "mark_last_busy" in the new name too.
> 
> That said, my suggestion is simply "pm_runtime_put_suspend".

Can we do even better, and make pm_runtime_put() to handle autosuspend
automatically when autosuspend is enabled ?

> If you don't like it, I will certainly not object to your current
> approach, even if I think it leads to unnecessary churns.
> 
> [...]
> 
> Kind regards
> Uffe

-- 
Regards,

Laurent Pinchart
