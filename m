Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E97ADE613
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 10:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0759410E7A8;
	Wed, 18 Jun 2025 08:50:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dolcini.it header.i=@dolcini.it header.b="yMI79iIy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6BAE10E7A8
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 08:50:50 +0000 (UTC)
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id 9837C1FCF4;
 Wed, 18 Jun 2025 10:50:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
 s=default; t=1750236646;
 bh=EVyxNDpmj447JSicFZcBDrHvNc7BkwjkT8xlrdgfqNc=;
 h=Received:From:To:Subject;
 b=yMI79iIytZAsl9+zX+5PcNcmv6Urh4mx9bCSSkl0psWLITACQfzB45MFIEvcvxyhS
 8qDhu9y2kgWDUUY8L0nJpw94KuQ8Oy2sE5pgCsnpUwvRvyFYaenIwql7eZlVEchtP8
 J/xTYwhQQ/NZOHZ+UCPMLRFP40xDpec6PbKYGsC/7cH+5xKxqt7dCGd6z7xVG3zFlP
 9Wvif3alr7JGcBbppAHJxXpnJdOXX5s6i3kfHDFUH/FeDQxv4uP2QKcy5eQ3e2auMT
 oiB+FYOfiie7RUYKl+ciITpokP+CWnsdZimLnMZ8LIytNTCqQRXN6mL6pEGUstsRSn
 Ojk6RUKLPt0VQ==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
 id 4C31C7FA06; Wed, 18 Jun 2025 10:50:46 +0200 (CEST)
Date: Wed, 18 Jun 2025 10:50:46 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
Subject: Re: drm/panel/panel-simple v6.16-rc1 WARNING regression
Message-ID: <aFJ95jZR6Cl_l7MJ@gaggiata.pivistrello.it>
References: <20250612081834.GA248237@francesco-nb>
 <CAN9Xe3RFEXZuWTZB5E1tJdjXc9o_hB1ArgA5SvqbDUBkwYea8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAN9Xe3RFEXZuWTZB5E1tJdjXc9o_hB1ArgA5SvqbDUBkwYea8w@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Anusha,

On Tue, Jun 17, 2025 at 11:17:20AM -0500, Anusha Srivatsa wrote:
> On Thu, Jun 12, 2025 at 3:24 AM Francesco Dolcini <francesco@dolcini.it>
> wrote:
> 
> > Commit de04bb0089a9 ("drm/panel/panel-simple: Use the new allocation in
> > place of devm_kzalloc()")
> > from 6.16-rc1 introduced a regression with this warning during probe
> > with panel dpi described in the DT.
> >
> > A revert solves the issue.
> >
> > The issue is that connector_type is set to DRM_MODE_CONNECTOR_DPI in
> > panel_dpi_probe() that after that change is called after
> > devm_drm_panel_alloc().
> >
> > I am not sure if there are other implication for this change in the call
> > ordering, apart the one that triggers this warning.
> >
> > [   12.089274] ------------[ cut here ]------------
> > [   12.089303] WARNING: CPU: 0 PID: 96 at
> > drivers/gpu/drm/bridge/panel.c:377 devm_drm_of_get_bridge+0xac/0xb8
> > [   12.130808] Modules linked in: v4l2_jpeg pwm_imx27(+) imx_vdoa
> > gpu_sched panel_simple imx6_media(C) imx_media_common
> > (C) videobuf2_dma_contig pwm_bl gpio_keys v4l2_mem2mem fuse ipv6 autofs4
> > [   12.147774] CPU: 0 UID: 0 PID: 96 Comm: kworker/u8:3 Tainted: G
> >  C          6.16.0-rc1+ #1 PREEMPT
> > [   12.157446] Tainted: [C]=CRAP
> > [   12.160418] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
> > [   12.166953] Workqueue: events_unbound deferred_probe_work_func
> > [   12.172805] Call trace:
> > [   12.172815]  unwind_backtrace from show_stack+0x10/0x14
> > [   12.180598]  show_stack from dump_stack_lvl+0x68/0x74
> > [   12.185674]  dump_stack_lvl from __warn+0x7c/0xe0
> > [   12.190407]  __warn from warn_slowpath_fmt+0x1b8/0x1c0
> > [   12.195567]  warn_slowpath_fmt from devm_drm_of_get_bridge+0xac/0xb8
> > [   12.201949]  devm_drm_of_get_bridge from imx_pd_probe+0x58/0x164
> > [   12.207976]  imx_pd_probe from platform_probe+0x5c/0xb0
> > [   12.213220]  platform_probe from really_probe+0xd0/0x3a4
> > [   12.218551]  really_probe from __driver_probe_device+0x8c/0x1d4
> > [   12.224486]  __driver_probe_device from driver_probe_device+0x30/0xc0
> > [   12.230942]  driver_probe_device from __device_attach_driver+0x98/0x10c
> > [   12.237572]  __device_attach_driver from bus_for_each_drv+0x90/0xe4
> > [   12.243854]  bus_for_each_drv from __device_attach+0xa8/0x1c8
> > [   12.249614]  __device_attach from bus_probe_device+0x88/0x8c
> > [   12.255285]  bus_probe_device from deferred_probe_work_func+0x8c/0xcc
> > [   12.261739]  deferred_probe_work_func from process_one_work+0x154/0x2dc
> > [   12.268371]  process_one_work from worker_thread+0x250/0x3f0
> > [   12.274043]  worker_thread from kthread+0x12c/0x24c
> > [   12.278940]  kthread from ret_from_fork+0x14/0x28
> > [   12.283660] Exception stack(0xd0be9fb0 to 0xd0be9ff8)
> > [   12.288720] 9fa0:                                     00000000 00000000
> > 00000000 00000000
> > [   12.296906] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000
> > 00000000 00000000
> > [   12.305089] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> > [   12.312050] ---[ end trace 0000000000000000 ]---
> >
> > #regzbot ^introduced: de04bb0089a96cc00d13b12cbf66a088befe3057
> >
> > Any advise?
> >
> > Hey Francesco!
> 
> This mail reached my spam and I hadn't realised till today. Thanks for
> bringing this to attention.
> 
> Thinking out loud here: If we called dpi_probe() before allocating the
> panel using devm_drm_panel_alloc()
> then we would have the connector type. But  dpi_probe() needs the panel to
> be allocated....
> 
> We could actually hardcode the connector type to DRM_MODE_CONNECTOR_DPI....
> Looking at panel_dpi_probe(), it guesses the connector_type:
> 
> /* We do not know the connector for the DT node, so guess it
> */	desc->connector_type
> <https://elixir.bootlin.com/linux/v6.16-rc2/C/ident/connector_type> =
> DRM_MODE_CONNECTOR_DPI
> <https://elixir.bootlin.com/linux/v6.16-rc2/C/ident/DRM_MODE_CONNECTOR_DPI>;
> 
> 
> Reverting will improve the end user experience but if the fix can be quick,
> we can avoid dropping the change

I do not have any specific suggestion myself, my short term solution would be
to just send a revert. If you have some other proposal I am happy to test any
patch.

Francesco



