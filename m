Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4A84A4893
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 14:48:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A366E10E357;
	Mon, 31 Jan 2022 13:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C43B10E357;
 Mon, 31 Jan 2022 13:48:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CF874B82B2F;
 Mon, 31 Jan 2022 13:48:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C22C1C340E8;
 Mon, 31 Jan 2022 13:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1643636909;
 bh=hvWGq6EEMPf49OBk4zZ3xW/NpC/UiTcIU8yTkJHSgi4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Oi9IYx8GQc7DsFlm2dleVl8AmVY7R4AbkIcb8hBxQtJSL+69TqptjpsvTjCgQSeC3
 WOW9qJLVLRyavDFwb3XsXJ+tl3/p6Z0kT60jtxlf5WdkyNIyP1tU0AeJZ135A5BQLQ
 E1R+3Zz36ZllzAuCAPSiO62pyVGyMD24cKFowLUg=
Date: Mon, 31 Jan 2022 14:48:26 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v6 02/35] component: Introduce the aggregate bus_type
Message-ID: <YffoqgmeUdxZ56zB@kroah.com>
References: <20220127200141.1295328-1-swboyd@chromium.org>
 <20220127200141.1295328-3-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220127200141.1295328-3-swboyd@chromium.org>
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
Cc: Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-msm@vger.kernel.org, Russell King <rmk+kernel@arm.linux.org.uk>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 27, 2022 at 12:01:08PM -0800, Stephen Boyd wrote:
> The component framework only provides 'bind' and 'unbind' callbacks to
> tell the host driver that it is time to assemble the aggregate driver
> now that all the components have probed. The component framework doesn't
> attempt to resolve runtime PM or suspend/resume ordering, and explicitly
> mentions this in the code. This lack of support leads to some pretty
> gnarly usages of the 'prepare' and 'complete' power management hooks in
> drivers that host the aggregate device, and it fully breaks down when
> faced with ordering shutdown between the various components, the
> aggregate driver, and the host driver that registers the whole thing.
> 
> In a concrete example, the MSM display driver at drivers/gpu/drm/msm is
> using 'prepare' and 'complete' to call the drm helpers
> drm_mode_config_helper_suspend() and drm_mode_config_helper_resume()
> respectively, so that it can move the aggregate driver suspend/resume
> callbacks to be before and after the components that make up the drm
> device call any suspend/resume hooks they have. This only works as long
> as the component devices don't do anything in their own 'prepare' and
> 'complete' callbacks. If they did, then the ordering would be incorrect
> and we would be doing something in the component drivers before the
> aggregate driver could do anything. Yuck!
> 
> Similarly, when trying to add shutdown support to the MSM driver we run
> across a problem where we're trying to shutdown the drm device via
> drm_atomic_helper_shutdown(), but some of the devices in the encoder
> chain have already been shutdown. This time, the component devices
> aren't the problem (although they could be if they did anything in their
> shutdown callbacks), but there's a DSI to eDP bridge in the encoder
> chain that has already been shutdown before the driver hosting the
> aggregate device runs shutdown. The ordering of driver probe is like
> this:
> 
>  1. msm_pdev_probe() (host driver)
>  2. DSI bridge
>  3. aggregate bind
> 
> When it comes to shutdown we have this order:
> 
>  1. DSI bridge
>  2. msm_pdev_shutdown() (host driver)
> 
> and so the bridge is already off, but we want to communicate to it to
> turn things off on the display during msm_pdev_shutdown(). Double yuck!
> Unfortunately, this time we can't split shutdown into multiple phases
> and swap msm_pdev_shutdown() with the DSI bridge.
> 
> Let's make the component_master_ops into an actual device driver that has
> probe/remove/shutdown functions. The driver will only be bound to the
> aggregate device once all component drivers have called component_add()
> to indicate they're ready to assemble the aggregate driver. This allows
> us to attach shutdown logic (and in the future runtime PM logic) to the
> aggregate driver so that it runs the hooks in the correct order.

I know I asked before, but I can not remember the answer.

This really looks like it is turning into the aux bus code.  Why can't
you just use that instead here for this type of thing?  You are creating
another bus and drivers for that bus that are "fake" which is great, but
that's what the aux bus code was supposed to help out with, so we
wouldn't have to write more of these.

So, if this really is different, can you document it here so I remember
next time you resend this patch series?

thanks,

greg k-h
