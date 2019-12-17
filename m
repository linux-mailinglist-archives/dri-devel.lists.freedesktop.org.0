Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 009D71235DF
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 20:41:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63156E0DE;
	Tue, 17 Dec 2019 19:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F8E6E0DE
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 19:41:05 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 9425E20022;
 Tue, 17 Dec 2019 20:40:59 +0100 (CET)
Date: Tue, 17 Dec 2019 20:40:58 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v1 1/1] drm/drm_panel: Fix EXPORT of
 drm_panel_of_backlight() one more time
Message-ID: <20191217194058.GA30852@ravnborg.org>
References: <20191217140721.42432-1-andriy.shevchenko@linux.intel.com>
 <63f068fe-13b4-98d1-8e27-faa1bd0bdf23@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <63f068fe-13b4-98d1-8e27-faa1bd0bdf23@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=JfrnYn6hAAAA:8
 a=KKAkSRfTAAAA:8 a=7gkXJVJtAAAA:8 a=P1BnusSwAAAA:8 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=-g4Mg-S7RQq0A9TmIasA:9
 a=CjuIK1q_8ugA:10 a=1CNFftbPRP8L7MoqJWF3:22 a=cvBusfyB2V15izCimMoJ:22
 a=E9Po1WZjFZOl8hwRPBS3:22 a=D0XLA9XvdZm18NrgonBM:22
 a=AjGcO6oz07-iQ99wixmX:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sean Paul <sean@poorly.run>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 17, 2019 at 08:25:03AM -0800, Randy Dunlap wrote:
> On 12/17/19 6:07 AM, Andy Shevchenko wrote:
> > The initial commit followed by the fix didn't take into consideration the case
> > 
> > CONFIG_DRM_PANEL=y
> > CONFIG_BACKLIGHT_CLASS_DEVICE=m
> > CONFIG_DRM_I915=y
> > 
> > where symbol devm_of_find_backlight() is not reachable from DRM subsystem.
> > Quick fix is to avoid drm_panel_of_backlight() from exporting in such case.
> > 
> > Fixes: 907aa265fde6 ("drm/drm_panel: fix EXPORT of drm_panel_of_backlight")
> > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Yes, that fixes the build error.  Thanks.
> 
> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Hi Andy - thanks for fixing this. And thanks Randy for verifying the
fix.
It passed my build test and is now pushed to drm-misc-next.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
