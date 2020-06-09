Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C861F4F13
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:36:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE986E406;
	Wed, 10 Jun 2020 07:35:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 614C66E061
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 15:12:37 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 59E388088;
 Tue,  9 Jun 2020 15:13:26 +0000 (UTC)
Date: Tue, 9 Jun 2020 08:12:32 -0700
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] drm/omap: force runtime PM suspend on system suspend
Message-ID: <20200609151232.GR43721@atomide.com>
References: <20200609103220.753969-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200609103220.753969-1-tomi.valkeinen@ti.com>
X-Mailman-Approved-At: Wed, 10 Jun 2020 07:35:32 +0000
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Tomi Valkeinen <tomi.valkeinen@ti.com> [200609 10:33]:
> Use suspend_late and resume_early callbacks in DSS submodules to force
> runtime PM suspend and resume.
> 
> We use suspend_late callback so that omapdrm's system suspend callback
> is called first, as that will disable all the display outputs after
> which it's safe to force DSS into suspend.

I think we can avoid the pm_runtime_force use if we have omapdrm
implement both .suspend and .suspend_late. In that case suspend would
only disable the display outputs, then suspend_late would take care
of switching off the lights and release the last PM runtime count
after the children are done suspending.

Looks like we have already something similar done for i915_drv.c, so
it should be doable. Maybe the disconnect can be done in .prepare and
then .suspend_late is not even needed?

And I think at that point the children can just use the standard
UNIVERSAL_DEV_PM_OPS without pm_runtime_force usage hopefully :)

Regards,

Tony
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
