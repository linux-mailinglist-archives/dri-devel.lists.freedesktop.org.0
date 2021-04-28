Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C923136D4B7
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 11:25:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D552A6EADA;
	Wed, 28 Apr 2021 09:25:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0A99B6EADA
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 09:25:54 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id D78F580AA;
 Wed, 28 Apr 2021 09:25:54 +0000 (UTC)
Date: Wed, 28 Apr 2021 12:25:51 +0300
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH] drm/omap: Fix issue with clocks left on after resume
Message-ID: <YIkqH46nv5RL75ab@atomide.com>
References: <20210426141241.51985-1-tony@atomide.com>
 <0963c9fa-1b45-b742-ed9b-5c48d3a97987@ideasonboard.com>
 <YIfjlVaiGa2sz8qW@atomide.com> <YIftdKeNHFzOw+aU@atomide.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YIftdKeNHFzOw+aU@atomide.com>
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
Cc: linux-omap@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Tony Lindgren <tony@atomide.com> [210427 10:54]:
> * Tony Lindgren <tony@atomide.com> [210427 10:12]:
> > * Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [210427 08:47]:
> > > If I understand right, this is only an issue when the dss was not enabled
> > > before the system suspend? And as the dispc is not enabled at suspend,
> > > pm_runtime_force_suspend and pm_runtime_force_resume don't really do
> > > anything. At resume, the DRM resume functionality causes omapdrm to call
> > > pm_runtime_get and put, and this somehow causes the dss to stay enabled.
> > 
> > We do have dss enabled at system suspend from omap_atomic_comit_tail()
> > until pm_runtime_force_suspend(). Then we have pm_runtime_force_resume()
> > enable it.
> 
> Sorry I already forgot that pm_runtime_force_resume() is not enabling
> it because pm_runtime_need_not_resume().. It's the omapdrm calling
> pm_runtime_get() that enables the hardware on resume.
> 
> > Then on resume PM runtime prevents disable of the hardware on resume path
> > until after device_complete(). Until then we have rpm_suspend() return
> > -EBUSY, and so the parent child_count is not going to get decreased.
> > Something would have to handle the -EBUSY error here it seems.

I sent out v2 patch with an updated description.

Regards,

Tony
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
