Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 825A540B2ED
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 17:20:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F206E4FB;
	Tue, 14 Sep 2021 15:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B036E4FB
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 15:20:37 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 490fdabe-156f-11ec-9416-0050568cd888;
 Tue, 14 Sep 2021 15:20:25 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 23306194C00;
 Tue, 14 Sep 2021 17:20:28 +0200 (CEST)
Date: Tue, 14 Sep 2021 17:20:34 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Maxime Ripard <maxime@cerno.tech>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>, linux-rpi-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] drm/vc4: hdmi: Actually check for the connector
 status in hotplug
Message-ID: <YUC9wkJHI4H3vWMg@ravnborg.org>
References: <20210914101724.266570-1-maxime@cerno.tech>
 <20210914101724.266570-3-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914101724.266570-3-maxime@cerno.tech>
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

Hi Maxime,

On Tue, Sep 14, 2021 at 12:17:24PM +0200, Maxime Ripard wrote:
> The drm_helper_hpd_irq_event() documentation states that this function
> is "useful for drivers which can't or don't track hotplug interrupts for
> each connector." and that "Drivers which support hotplug interrupts for
> each connector individually and which have a more fine-grained detect
> logic should bypass this code and directly call
> drm_kms_helper_hotplug_event()". This is thus what we ended-up doing.
> 
> However, what this actually means, and is further explained in the
> drm_kms_helper_hotplug_event() documentation, is that
> drm_kms_helper_hotplug_event() should be called by drivers that can
> track the connection status change, and if it has changed we should call
> that function.
> 
> This underlying expectation we failed to provide is that the caller of
> drm_kms_helper_hotplug_event() should call drm_helper_probe_detect() to
> probe the new status of the connector.
> 
> Since we didn't do it, it meant that even though we were sending the
> notification to user-space and the DRM clients that something changed we
> never probed or updated our internal connector status ourselves.
> 
> This went mostly unnoticed since the detect callback usually doesn't
> have any side-effect. Also, if we were using the DRM fbdev emulation
> (which is a DRM client), or any user-space application that can deal
> with hotplug events, chances are they would react to the hotplug event
> by probing the connector status eventually.
> 
> However, now that we have to enable the scrambler in detect() if it was
> enabled it has a side effect, and an application such as Kodi or
> modetest doesn't deal with hotplug events. This resulted with a black
> screen when Kodi or modetest was running when a screen was disconnected
> and then reconnected, or switched off and on.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

I leave it to you and Daniel to sort out this patch.

	Sam
