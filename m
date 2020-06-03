Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EF01EDDB8
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 09:12:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3E86E271;
	Thu,  4 Jun 2020 07:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3F27F89B11
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 14:06:44 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id B20A1809C;
 Wed,  3 Jun 2020 14:07:32 +0000 (UTC)
Date: Wed, 3 Jun 2020 07:06:39 -0700
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 1/5] drm/omap: Fix suspend resume regression after
 platform data removal
Message-ID: <20200603140639.GG37466@atomide.com>
References: <20200531193941.13179-1-tony@atomide.com>
 <20200531193941.13179-2-tony@atomide.com>
 <16ba1808-5c7f-573d-8dd0-c80cac2f476e@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <16ba1808-5c7f-573d-8dd0-c80cac2f476e@ti.com>
X-Mailman-Approved-At: Thu, 04 Jun 2020 07:11:42 +0000
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
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Andrew F . Davis" <afd@ti.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Keerthy <j-keerthy@ti.com>, Suman Anna <s-anna@ti.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Tomi Valkeinen <tomi.valkeinen@ti.com> [200603 12:34]:
> Hi Tony,
> 
> On 31/05/2020 22:39, Tony Lindgren wrote:
> > When booting without legacy platform data, we no longer have omap_device
> > calling PM runtime suspend for us on suspend. This causes the driver
> > context not be saved as we have no suspend and resume functions defined.
> > 
> > Let's fix the issue by switching over to use UNIVERSAL_DEV_PM_OPS as it
> > will call the existing PM runtime suspend functions on suspend.
> 
> I don't think we can use UNIVERSAL_DEV_PM_OPS, as we can't disable DSS
> modules in any order, but things have to be shut down in orderly manner.

OK. I presume you talk about the order of dss child devices here.

> omapdrm hasn't relied on omap_device calling runtime suspend for us (I
> didn't know it does that). We have system suspend hooks in omap_drv.c:

We had omap_device sort of brute forcing things to idle on suspend
which only really works for interconnect target modules with one
device in them.

> SIMPLE_DEV_PM_OPS(omapdrm_pm_ops, omap_drm_suspend, omap_drm_resume)
> 
> omap_drm_suspend() is supposed to turn off the displays, which then cause
> dispc_runtime_put (and other runtime_puts) to be called, which result in
> dispc_runtime_suspend (and other runtime PM suspends).

OK thanks for explaining, I missed that part.

> So... For some reason that's no longer happening? I need to try to find a
> board with which suspend/resume works (without DSS)...

Yes it seems something has changed. When diffing the dmesg debug output
on suspend and resume, context save and restore functions are no longer
called as the PM runtime suspend and resume functions are no longer
called on suspend and resume.

I'll drop this patch, and will be applying the rest of the series to
fixes if no objections.

Thanks,

Tony
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
