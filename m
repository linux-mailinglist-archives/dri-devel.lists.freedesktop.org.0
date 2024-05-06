Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0561F8BC86F
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 09:35:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D7F1121F0;
	Mon,  6 May 2024 07:35:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="P93j5mis";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CFEE1121F0
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 07:35:41 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E680E836;
 Mon,  6 May 2024 09:35:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1714980938;
 bh=n5+hynqpfyw2VkPWlAy7ChrItQVLYJ1f8V2xfUMm5QY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P93j5missxNkHoWP51IhSnZa8MCPh3t/vBhIXL35U4+LIY1WxMC85iW/7gPR5ag+q
 Ei6nFmCIqZu+Z18Sz8zHujvK6+mJlOSjVJ26XDeFa14VDvEGXjX+HsL0F699WeViiD
 j4NGIH+aSGJDDyQcwg1vYoqYqGLAe6Bh7h6hBJIM=
Date: Mon, 6 May 2024 10:35:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Sean Anderson <sean.anderson@linux.dev>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] drm: zynqmp_dp: Lockup in zynqmp_dp_bridge_detect when
 device is unbound
Message-ID: <20240506073531.GA10260@pendragon.ideasonboard.com>
References: <4d8f4c9b-2efb-4774-9a37-2f257f79b2c9@linux.dev>
 <20240504122118.GB24548@pendragon.ideasonboard.com>
 <20240506-charcoal-griffin-of-tact-174dde@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240506-charcoal-griffin-of-tact-174dde@houat>
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

On Mon, May 06, 2024 at 09:29:36AM +0200, Maxime Ripard wrote:
> Hi Laurent, Sean,
> 
> On Sat, May 04, 2024 at 03:21:18PM GMT, Laurent Pinchart wrote:
> > On Fri, May 03, 2024 at 05:54:32PM -0400, Sean Anderson wrote:
> > > I have discovered a bug in the displayport driver on drm-misc-next. To
> > > trigger it, run
> > > 
> > > echo fd4a0000.display > /sys/bus/platform/drivers/zynqmp-dpsub/unbind
> > > 
> > > The system will become unresponsive and (after a bit) splat with a hard
> > > LOCKUP. One core will be unresponsive at the first zynqmp_dp_read in
> > > zynqmp_dp_bridge_detect.
> > > 
> > > I believe the issue is due the registers being unmapped and the block
> > > put into reset in zynqmp_dp_remove instead of zynqmp_dpsub_release.
> > 
> > That is on purpose. Drivers are not allowed to access the device at all
> > after .remove() returns.
> 
> It's not "on purpose" no. Drivers indeed are not allowed to access the
> device after remove, but the kernel shouldn't crash. This is exactly
> why we have drm_dev_enter / drm_dev_exit.

I didn't mean the crash was on purpose :-) It's the registers being
unmapped that is, as nothing should touch those registers after
.remove() returns.

-- 
Regards,

Laurent Pinchart
