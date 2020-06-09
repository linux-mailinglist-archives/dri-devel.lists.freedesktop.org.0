Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D56C21F4F33
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A5B6E4AE;
	Wed, 10 Jun 2020 07:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 52EB86E079
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 16:10:47 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id D19058088;
 Tue,  9 Jun 2020 16:11:38 +0000 (UTC)
Date: Tue, 9 Jun 2020 09:10:44 -0700
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] drm/omap: force runtime PM suspend on system suspend
Message-ID: <20200609161044.GS43721@atomide.com>
References: <20200609103220.753969-1-tomi.valkeinen@ti.com>
 <20200609151232.GR43721@atomide.com>
 <ea8f7a47-3d84-de98-e6e5-ecd7357b1f58@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ea8f7a47-3d84-de98-e6e5-ecd7357b1f58@ti.com>
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

* Tomi Valkeinen <tomi.valkeinen@ti.com> [200609 15:38]:
> On 09/06/2020 18:12, Tony Lindgren wrote:
> > * Tomi Valkeinen <tomi.valkeinen@ti.com> [200609 10:33]:
> > > Use suspend_late and resume_early callbacks in DSS submodules to force
> > > runtime PM suspend and resume.
> > > 
> > > We use suspend_late callback so that omapdrm's system suspend callback
> > > is called first, as that will disable all the display outputs after
> > > which it's safe to force DSS into suspend.
> > 
> > I think we can avoid the pm_runtime_force use if we have omapdrm
> > implement both .suspend and .suspend_late. In that case suspend would
> > only disable the display outputs, then suspend_late would take care
> > of switching off the lights and release the last PM runtime count
> > after the children are done suspending.
> 
> I'm not sure how that can be done cleanly. omapdrm doesn't really see the
> DSS submodules. And even if it does, how can it "release the last PM runtime
> count"? With pm_runtime_force_suspend for each? That would be almost the
> same as this patch.

Well there should not be anything special needed for the children,
it should all happen automatically for us.

I'm just wondering if this can be all done without the need for
all the boilerplate code and adding suspend_late :)

> Also, if omapdrm can do the above, it could do it in the .suspend, after
> disabling the display outputs. I don't think there's need for suspend_late
> then.

Yeah so it seems. Can we just diconnect the display outputs
in .prepare somewhere? Or is that the wrong place to do it?

Regards,

Tony
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
