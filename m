Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F29EC241D8E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 17:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD6B6E5B4;
	Tue, 11 Aug 2020 15:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 024DC6E5B4
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 15:48:36 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1k5WVv-0002wd-NI; Tue, 11 Aug 2020 17:48:35 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1k5WVv-0003Km-Cw; Tue, 11 Aug 2020 17:48:35 +0200
Message-ID: <6b8c0ccaec3b890faef85ecb8b694badf6bc1dde.camel@pengutronix.de>
Subject: Re: imx-drm: master bind failed: -517 with parallel_display (on
 i.MX6DL)
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Stefan Birkholz <Birkholz@systecnet.com>
Date: Tue, 11 Aug 2020 17:48:35 +0200
In-Reply-To: <f25a430a491c46a9bacef9f62c3c2129@systecnet.com>
References: <f25a430a491c46a9bacef9f62c3c2129@systecnet.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2020-08-11 at 14:50 +0000, Stefan Birkholz wrote:
> Hello,
> 
> we are using the mainline kernel (currently on 4.19.128) successfully on an i.MX6DL-based system, but when we try to upgrade to any more recent kernel (>5.1) the display output stops working (screen is blank, backlight works). 
> 
> The relevant entries from the kernel log seem to be:
> [    8.954942] imx-drm display-subsystem: bound imx-ipuv3-crtc.3 (ops imx_drm_exit [imxdrm])
> [    9.028406] imx-drm display-subsystem: failed to bind disp0 (ops imx_pd_ops [parallel_display]): -517
> [    9.037873] imx-drm display-subsystem: master bind failed: -517

The only call in imx_pd_bind() I would expect to return -EPROBE_DEFER is
drm_of_find_panel_or_bridge(), maybe parallel-display node's port@1 is
connected to a panel that is not registered. Are the drivers for the
panel and all its dependencies (power supply regulator, backlight)
enabled and probed?

regards
Philipp
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
