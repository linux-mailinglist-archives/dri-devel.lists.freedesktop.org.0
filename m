Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4341D257084
	for <lists+dri-devel@lfdr.de>; Sun, 30 Aug 2020 22:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5953891DB;
	Sun, 30 Aug 2020 20:42:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3636891DB
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Aug 2020 20:42:47 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 96DC5804BB;
 Sun, 30 Aug 2020 22:42:43 +0200 (CEST)
Date: Sun, 30 Aug 2020 22:42:42 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [v4,04/15] drm/bridge: tc358764: add drm_panel_bridge support
Message-ID: <20200830204242.GA952289@ravnborg.org>
References: <20200726203324.3722593-5-sam@ravnborg.org>
 <CGME20200827113906eucas1p28f8b819516dbc0cc0f4193726305e4f7@eucas1p2.samsung.com>
 <f22146de-1660-035c-c476-f7b3354de7cb@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f22146de-1660-035c-c476-f7b3354de7cb@samsung.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=A5ZCwZeG c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=8nJEP1OIZ-IA:10 a=7gkXJVJtAAAA:8 a=P1BnusSwAAAA:8 a=QyXUC8HyAAAA:8
 a=hD80L64hAAAA:8 a=IpJZQVW2AAAA:8 a=RwHePtW7AAAA:8 a=U9mkZgPJNYwR20VoP_YA:9
 a=wPNLvfGTeEIA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=D0XLA9XvdZm18NrgonBM:22
 a=IawgGOuG5U0WyFbmm1f5:22 a=FqraQwd7dyEg5dwJgZJs:22
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Jonas Karlman <jonas@kwiboo.se>,
 Peter Senna Tschudin <peter.senna@gmail.com>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Martin Donnelly <martin.donnelly@ge.com>, kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek.

On Thu, Aug 27, 2020 at 01:39:06PM +0200, Marek Szyprowski wrote:
> Hi Sam,
> =

> On 26.07.2020 22:33, Sam Ravnborg wrote:
> > Prepare the tc358764 bridge driver for use in a chained setup by
> > replacing direct use of drm_panel with drm_panel_bridge support.
> >
> > The bridge panel will use the connector type reported by the panel,
> > where the connector for this driver hardcodes DRM_MODE_CONNECTOR_LVDS.
> >
> > The tc358764 did not any additional info the the connector so the
> > connector creation is passed to the bridge panel driver.
> >
> > v3:
> >    - Merge with patch to make connector creation optional to avoid
> >      creating two connectors (Laurent)
> >    - Pass connector creation to bridge panel, as this bridge driver
> >      did not add any extra info to the connector.
> >    - Set bridge.type to DRM_MODE_CONNECTOR_LVDS.
> >
> > v2:
> >    - Use PTR_ERR_OR_ZERO() (kbuild test robot)
> >
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: kbuild test robot <lkp@intel.com>
> > Cc: Andrzej Hajda <a.hajda@samsung.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Jonas Karlman <jonas@kwiboo.se>
> > Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> =

> I've noticed that this patch has been merged recently to linux-next. =

> Sadly it causes regression on Samsung Exynos5250-based Arndale board.

Thanks for reporting this!

I did not find time to focus on this bug this weekend. It is on my todo
list for the coming weekend.

Anything you could do to narrow down this a bit to help finding the root
cause?

Ideas:
- Trying to find out what part of the connector that cuases troubles
- Posting the full kernel boot log, to help identifying something.
  Bonus if we get a working and non-working log - so we can compare.
- Migrate exonys to the new model
  That would not fix the bug, so that would be a natural step 2
- Identify the exact code-patch in the exonys driver that is used.
  drm_bridge_attach() is called in several places
- And likely much more that I just forgot

Any help would be appreciated - I did not find the culprint from first
glance. I may still be obvious but I just failed to spot it.

	Sam

> =

> It can be observed by the following warning during boot:
> =

> ------------[ cut here ]------------
> WARNING: CPU: 1 PID: 1 at drivers/gpu/drm/drm_atomic_state_helper.c:494 =

> drm_atomic_helper_connector_duplicate_state+0x60/0x68
> Modules linked in:
> CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.8.0-rc2-00501-g1644127f83bc =

> #1526
> Hardware name: Samsung Exynos (Flattened Device Tree)
> [<c011184c>] (unwind_backtrace) from [<c010d250>] (show_stack+0x10/0x14)
> [<c010d250>] (show_stack) from [<c0517ce4>] (dump_stack+0xbc/0xe8)
> [<c0517ce4>] (dump_stack) from [<c01270a8>] (__warn+0xf0/0x108)
> [<c01270a8>] (__warn) from [<c0127170>] (warn_slowpath_fmt+0xb0/0xb8)
> [<c0127170>] (warn_slowpath_fmt) from [<c05e81f0>] =

> (drm_atomic_helper_connector_duplicate_state+0x60/0x68)
> [<c05e81f0>] (drm_atomic_helper_connector_duplicate_state) from =

> [<c06014b8>] (drm_atomic_get_connector_state+0xfc/0x184)
> [<c06014b8>] (drm_atomic_get_connector_state) from [<c0602238>] =

> (__drm_atomic_helper_set_config+0x2a0/0x368)
> [<c0602238>] (__drm_atomic_helper_set_config) from [<c06183b8>] =

> (drm_client_modeset_commit_atomic+0x180/0x284)
> [<c06183b8>] (drm_client_modeset_commit_atomic) from [<c061859c>] =

> (drm_client_modeset_commit_locked+0x64/0x1cc)
> [<c061859c>] (drm_client_modeset_commit_locked) from [<c0618728>] =

> (drm_client_modeset_commit+0x24/0x40)
> [<c0618728>] (drm_client_modeset_commit) from [<c05eb6b4>] =

> (drm_fb_helper_restore_fbdev_mode_unlocked+0x50/0x94)
> [<c05eb6b4>] (drm_fb_helper_restore_fbdev_mode_unlocked) from =

> [<c05eb728>] (drm_fb_helper_set_par+0x30/0x5c)
> [<c05eb728>] (drm_fb_helper_set_par) from [<c055dedc>] =

> (fbcon_init+0x5c8/0x65c)
> [<c055dedc>] (fbcon_init) from [<c05a8530>] (visual_init+0xc0/0x108)
> [<c05a8530>] (visual_init) from [<c05aaca4>] =

> (do_bind_con_driver+0x180/0x39c)
> [<c05aaca4>] (do_bind_con_driver) from [<c05ab244>] =

> (do_take_over_console+0x140/0x1cc)
> [<c05ab244>] (do_take_over_console) from [<c055ac04>] =

> (do_fbcon_takeover+0x84/0xe0)
> [<c055ac04>] (do_fbcon_takeover) from [<c0553820>] =

> (register_framebuffer+0x1cc/0x2dc)
> [<c0553820>] (register_framebuffer) from [<c05eb19c>] =

> (__drm_fb_helper_initial_config_and_unlock+0x3f0/0x5e8)
> [<c05eb19c>] (__drm_fb_helper_initial_config_and_unlock) from =

> [<c05d941c>] (drm_kms_helper_hotplug_event+0x24/0x30)
> [<c05d941c>] (drm_kms_helper_hotplug_event) from [<c0628f74>] =

> (exynos_dsi_host_attach+0x184/0x2d8)
> [<c0628f74>] (exynos_dsi_host_attach) from [<c0634120>] =

> (tc358764_probe+0x13c/0x1ac)
> [<c0634120>] (tc358764_probe) from [<c064cce4>] (really_probe+0x200/0x48c)
> [<c064cce4>] (really_probe) from [<c064d0d8>] =

> (driver_probe_device+0x78/0x1fc)
> [<c064d0d8>] (driver_probe_device) from [<c064d4c0>] =

> (device_driver_attach+0x58/0x60)
> [<c064d4c0>] (device_driver_attach) from [<c064d5a4>] =

> (__driver_attach+0xdc/0x174)
> [<c064d5a4>] (__driver_attach) from [<c064aaf0>] =

> (bus_for_each_dev+0x68/0xb4)
> [<c064aaf0>] (bus_for_each_dev) from [<c064be24>] =

> (bus_add_driver+0x158/0x214)
> [<c064be24>] (bus_add_driver) from [<c064e478>] (driver_register+0x78/0x1=
10)
> [<c064e478>] (driver_register) from [<c0102378>] =

> (do_one_initcall+0x8c/0x424)
> [<c0102378>] (do_one_initcall) from [<c1001158>] =

> (kernel_init_freeable+0x190/0x204)
> [<c1001158>] (kernel_init_freeable) from [<c0ab835c>] =

> (kernel_init+0x8/0x118)
> [<c0ab835c>] (kernel_init) from [<c0100114>] (ret_from_fork+0x14/0x20)
> Exception stack(0xee8ddfb0 to 0xee8ddff8)
> dfa0:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 00000000 00000000 00000000 =

> 00000000
> dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 =

> 00000000
> dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
> irq event stamp: 171647
> hardirqs last=A0 enabled at (171653): [<c019ec00>] vprintk_emit+0x2ac/0x2=
ec
> hardirqs last disabled at (171658): [<c019eab8>] vprintk_emit+0x164/0x2ec
> softirqs last=A0 enabled at (171486): [<c010174c>] __do_softirq+0x50c/0x6=
08
> softirqs last disabled at (171473): [<c0130340>] irq_exit+0x168/0x16c
> ---[ end trace 33117a16f066466a ]---
> =

> Then calling modetest end with segmentation fault. I'm not able to check =

> currently if there is anything on the display because of having only =

> remote access to the board. If this is important I will try to ask =

> someone to help checking at the board's display at the office.
> =

> Best regards
> -- =

> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
