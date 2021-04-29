Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8443036E44E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 06:46:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F1A6E0FB;
	Thu, 29 Apr 2021 04:46:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id BF8F06E0FB
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 04:46:08 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id EEC9B80AA;
 Thu, 29 Apr 2021 04:46:06 +0000 (UTC)
Date: Thu, 29 Apr 2021 07:46:03 +0300
From: Tony Lindgren <tony@atomide.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCHv2] drm/omap: Fix issue with clocks left on after resume
Message-ID: <YIo6CzsU4JRvAdpb@atomide.com>
References: <20210428092500.23521-1-tony@atomide.com>
 <YIlsy4mOkLcbMKwr@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YIlsy4mOkLcbMKwr@pendragon.ideasonboard.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-omap@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

* Laurent Pinchart <laurent.pinchart@ideasonboard.com> [210428 14:10]:
> Based on my experience on the camera and display side with devices that
> are made of multiple components, suspend and resume are best handled in
> a controlled way by the top-level driver. Otherwise you end up having
> different components suspending and resuming in random orders, and
> that's a recipe for failure.

Manually suspending and resuming the components should be doable based
on the registered components. However, I'm not sure it buys much in
this case since we do have Linux driver module take care of things for
us for most part :)

The dss hardware is really a private interconnect with a control module,
and a collection of various mostly independent display output device
modules.

We also have the interconnect target module to deal with for each
module, and have the interconnect hierachy mapped in the devicetree.
So we already have Linux driver module take care of the device
hierarchy.

Because the child components are mostly independent, it should not
matter in which order they suspend and resume related to each other.

I think the remaining issue is how dispc should provide services to
the other components.

If dispc needs to be enabled to provide services to the other modules,
maybe there's some better Linux generic framework dispc could implement?
That is other than PM runtime calls for routing the signals to the
output modules? Then PM runtime can be handled private to the dispc
module.

Decoupling the system suspend and resume from PM runtime calls for
all the other dss components should still also be done IMO. But that
can be done as a separate clean-up patches after we have fixed the
$subject issue.

> Can we get the omapdrm suspend/resume to run first/last, and
> stop/restart the whole device from there ?

This is already the case since commit ecfdedd7da5d ("drm/omap: force
runtime PM suspend on system suspend"). We have omap_drv use
SIMPLE_DEV_PM_OPS, and the components use SET_LATE_SYSTEM_SLEEP_PM_OPS.
So omap_drv suspends first and resumes last. The order should not
matter for other components. Well that is as long as we can deal
with dispc providing resources.

I think we really should also change omap_drv use prepare/complete ops,
and have the components use standard SIMPLE_DEV_PM_OPS. That still
won't help with PM runtime related issues for system suspend and
resume though, but leaves out the need for late pm ops.

Regards,

Tony
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
