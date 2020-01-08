Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E29F1133EE6
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 11:08:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 950F86E1B8;
	Wed,  8 Jan 2020 10:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B9F6E1B8
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 10:08:39 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id C7B5C80566;
 Wed,  8 Jan 2020 11:08:32 +0100 (CET)
Date: Wed, 8 Jan 2020 11:08:31 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drm/drm_panel: fix export of drm_panel_of_backlight, try
 #3
Message-ID: <20200108100831.GA23308@ravnborg.org>
References: <20200107203231.920256-1-arnd@arndb.de> <87zheyqnla.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87zheyqnla.fsf@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=Vt2AcnKqAAAA:8
 a=QyXUC8HyAAAA:8 a=4k1t4WDYj-Gm4IL4ZnQA:9 a=CjuIK1q_8ugA:10
 a=v10HlyRyNeVhbzM4Lqgd:22
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
Cc: dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sean Paul <sean@poorly.run>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani.

On Wed, Jan 08, 2020 at 11:55:29AM +0200, Jani Nikula wrote:
> On Tue, 07 Jan 2020, Arnd Bergmann <arnd@arndb.de> wrote:
> > Making this IS_REACHABLE() was still wrong, as that just determines
> > whether the lower-level backlight code would be reachable from the panel
> > driver. However, with CONFIG_DRM=y and CONFIG_BACKLIGHT_CLASS_DEVICE=m,
> > the drm_panel_of_backlight is left out of drm_panel.o but the condition
> > tells the driver that it is there, leading to multiple link errors such as
> >
> > ERROR: "drm_panel_of_backlight" [drivers/gpu/drm/panel/panel-sitronix-st7701.ko] undefined!
> > ERROR: "drm_panel_of_backlight" [drivers/gpu/drm/panel/panel-sharp-ls043t1le01.ko] undefined!
> > ERROR: "drm_panel_of_backlight" [drivers/gpu/drm/panel/panel-seiko-43wvf1g.ko] undefined!
> > ERROR: "drm_panel_of_backlight" [drivers/gpu/drm/panel/panel-ronbo-rb070d30.ko] undefined!
> > ERROR: "drm_panel_of_backlight" [drivers/gpu/drm/panel/panel-rocktech-jh057n00900.ko] undefined!
> > ERROR: "drm_panel_of_backlight" [drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.ko] undefined!
> > ERROR: "drm_panel_of_backlight" [drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.ko] undefined!
> >
> > Change the condition to check for whether the function was actually part
> > of the drm module. This version of the patch survived a few hundred
> > randconfig builds, so I have a good feeling this might be the last
> > one for the export.
> 
> Broken record, this will still be wrong, even if it builds and links. No
> backlight support for panel despite expectations.
> 
> See http://mid.mail-archive.com/87d0cnynst.fsf@intel.com
> 
> All of this is just another hack until the backlight config usage is
> fixed for good. Do we really want to make this the example to copy paste
> wherever we hit the issue next?
> 
> I'm not naking, but I'm not acking either.

I will try to take a look at your old BACKLIGHT_CLASS_DEVICE patch this
weekend. I think we need that one fixed - and then we can have this mess
with "drm_panel_of_backlight" fixed in the right way.

Sigh...

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
