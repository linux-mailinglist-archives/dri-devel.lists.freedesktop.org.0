Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C591326C14
	for <lists+dri-devel@lfdr.de>; Sat, 27 Feb 2021 08:19:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443176E19C;
	Sat, 27 Feb 2021 07:18:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6BC8A6E19C
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Feb 2021 07:18:56 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id D60AA80CE;
 Sat, 27 Feb 2021 07:19:25 +0000 (UTC)
Date: Sat, 27 Feb 2021 09:18:45 +0200
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v4 24/80] drm/omap: dsi: move TE GPIO handling into core
Message-ID: <YDnyVV/O78sQjtWb@atomide.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-25-tomi.valkeinen@ti.com>
 <YCF7ARchcMKvWa4s@atomide.com>
 <5b469566-c926-7e1f-8872-84774b96f389@ideasonboard.com>
 <YCVq8JnuMLQq6FEc@atomide.com>
 <4432cf2c-fe15-dab0-3034-789f6d711396@ideasonboard.com>
 <YC4Bte47SFKVgrqX@atomide.com>
 <7c852efd-560a-4dbb-ed04-e4812b343a33@ideasonboard.com>
 <YDecMzuPaXGS/n5l@atomide.com>
 <0eb62659-041d-d3bd-3803-4d562677dfbf@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0eb62659-041d-d3bd-3803-4d562677dfbf@ideasonboard.com>
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
Cc: hns@goldelico.com, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [210226 09:04]:
> Hmm, if I read the code right, TE was not enabled at all before this patch.
> And this patch enables it. So maybe TE has never worked with that panel?
> 
> You could try changing the enable_te calls to pass false.
> 
> Or with the upstream driver, comment out
> 
> mipi_dsi_dcs_set_tear_on(ddata->dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);

Yup you're right that's it.

Commenting it out in drivers/gpu/drm/panel/panel-dsi-cm.c makes the
warnings go away.

There are some BTA related comments in the old v3.0.8 based Android
kernel for droid4 panel at [0], but I don't really follow what they
mean. Maybe it's some ordering issue?

Regards,

Tony


[0] https://github.com/NotKit/android_kernel_motorola_omap4-common/blob/hybris-11.0/drivers/video/omap2/displays/panel-mapphone.c
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
