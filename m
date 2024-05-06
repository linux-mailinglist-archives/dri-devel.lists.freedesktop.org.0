Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D85548BD327
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 18:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB5E10F155;
	Mon,  6 May 2024 16:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NlR0WF+d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0989210F155
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 16:51:06 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9596E908;
 Mon,  6 May 2024 18:51:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1715014263;
 bh=8+i50YterCbwSCR8dhufT5e0/xJ1TjQeaFJDpeKsoMQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NlR0WF+dBNw/IcKF1IrTZLvIQyl/DjBfUtWWr+XCb3BcSrrOHid5t6h28Y8j8jpIR
 2EGaeJKVMM1b4qBJ3+v99XTjbBDCqzoeAgYE8gk3J62FreHQzTyO9WSWuNQ/s0LyLG
 72GoE96KsoL+ueCItx8AUaKTFavKV6c8WOnc+NYw=
Date: Mon, 6 May 2024 19:50:57 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Maxime Ripard <mripard@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] drm: zynqmp_dp: Lockup in zynqmp_dp_bridge_detect when
 device is unbound
Message-ID: <20240506165057.GD29108@pendragon.ideasonboard.com>
References: <4d8f4c9b-2efb-4774-9a37-2f257f79b2c9@linux.dev>
 <20240504122118.GB24548@pendragon.ideasonboard.com>
 <20240506-charcoal-griffin-of-tact-174dde@houat>
 <20240506073531.GA10260@pendragon.ideasonboard.com>
 <97811bfe-a1fb-419c-a148-74e3d84aa0e2@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <97811bfe-a1fb-419c-a148-74e3d84aa0e2@linux.dev>
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

On Mon, May 06, 2024 at 10:57:17AM -0400, Sean Anderson wrote:
> On 5/6/24 03:35, Laurent Pinchart wrote:
> > On Mon, May 06, 2024 at 09:29:36AM +0200, Maxime Ripard wrote:
> >> Hi Laurent, Sean,
> >> 
> >> On Sat, May 04, 2024 at 03:21:18PM GMT, Laurent Pinchart wrote:
> >> > On Fri, May 03, 2024 at 05:54:32PM -0400, Sean Anderson wrote:
> >> > > I have discovered a bug in the displayport driver on drm-misc-next. To
> >> > > trigger it, run
> >> > > 
> >> > > echo fd4a0000.display > /sys/bus/platform/drivers/zynqmp-dpsub/unbind
> >> > > 
> >> > > The system will become unresponsive and (after a bit) splat with a hard
> >> > > LOCKUP. One core will be unresponsive at the first zynqmp_dp_read in
> >> > > zynqmp_dp_bridge_detect.
> >> > > 
> >> > > I believe the issue is due the registers being unmapped and the block
> >> > > put into reset in zynqmp_dp_remove instead of zynqmp_dpsub_release.
> >> > 
> >> > That is on purpose. Drivers are not allowed to access the device at all
> >> > after .remove() returns.
> >> 
> >> It's not "on purpose" no. Drivers indeed are not allowed to access the
> >> device after remove, but the kernel shouldn't crash. This is exactly
> >> why we have drm_dev_enter / drm_dev_exit.
> > 
> > I didn't mean the crash was on purpose :-) It's the registers being
> > unmapped that is, as nothing should touch those registers after
> > .remove() returns.
> 
> OK, so then we need to have some kind of flag in the driver or in the drm
> subsystem so we know not to access those registers.

To avoid race conditions, the .remove() function should mark the device
as removed, wait for all ongoing access from userspace to be complete,
and then proceed to unmapping registers and doing other cleanups.
Userspace may still have open file descriptors to the device at that
point. Any new userspace access should be disallowed (by checking the
removed flag), with the only userspace-initiated operations that still
need to run being the release-related operations (unmapping memory,
closing file descriptors, ...).

-- 
Regards,

Laurent Pinchart
