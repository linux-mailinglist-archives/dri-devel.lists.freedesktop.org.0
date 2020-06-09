Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3990A1F4F34
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:37:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D0E6E428;
	Wed, 10 Jun 2020 07:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2428189C99
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 16:37:28 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id C95E78088;
 Tue,  9 Jun 2020 16:38:18 +0000 (UTC)
Date: Tue, 9 Jun 2020 09:37:24 -0700
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] drm/omap: force runtime PM suspend on system suspend
Message-ID: <20200609163724.GT43721@atomide.com>
References: <20200609103220.753969-1-tomi.valkeinen@ti.com>
 <20200609151232.GR43721@atomide.com>
 <ea8f7a47-3d84-de98-e6e5-ecd7357b1f58@ti.com>
 <20200609161044.GS43721@atomide.com>
 <fc4e7d29-b170-8863-3bfb-9159196421f4@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fc4e7d29-b170-8863-3bfb-9159196421f4@ti.com>
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

* Tomi Valkeinen <tomi.valkeinen@ti.com> [200609 16:27]:
> On 09/06/2020 19:10, Tony Lindgren wrote:
> > Yeah so it seems. Can we just diconnect the display outputs
> > in .prepare somewhere? Or is that the wrong place to do it?
> 
> Hmm, yes, perhaps... If omapdrm uses .prepare to disable all the outputs.
> Then DSS submodules could use UNIVERSAL_DEV_PM_OPS() and have the same
> functions for system and runtime suspend.

Yeah that would be nice. And maybe the need for force_suspend
also disappears with the ordering issues gone :)

> Although that has the problem that if the DSS is already runtime suspended
> when system suspend happens, the PM does not wake DSS up, and thus the
> suspend callbacks will crash if they access registers. So they need some
> extra logic there.
> 
> I'll see tomorrow if I can come up with something like that.

OK. This $subject patch works for my test cases for suspend
and resume based on a brief test with my fixes branch FYI.

Regards,

Tony
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
