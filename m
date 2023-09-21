Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D49C87A93DE
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 13:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02BD910E5C8;
	Thu, 21 Sep 2023 11:35:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 66FAE10E5C8
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 11:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 9C055809E;
 Thu, 21 Sep 2023 11:35:46 +0000 (UTC)
Date: Thu, 21 Sep 2023 14:35:45 +0300
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH] drm/mipi-dsi: Fix detach call without attach
Message-ID: <20230921113545.GR5285@atomide.com>
References: <20230921-dsi-detach-fix-v1-1-d0de2d1621d9@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230921-dsi-detach-fix-v1-1-d0de2d1621d9@ideasonboard.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [230921 10:51]:
> mipi_dsi_host_unregister() will call two functions for all its DSI
> peripheral devices: mipi_dsi_detach() and mipi_dsi_device_unregister().
> The latter makes sense, as the device exists, but the former may be
> wrong as attach has not necessarily been done.
> 
> To fix this, track the attached state of the peripheral, and only detach
> from mipi_dsi_host_unregister() if the peripheral was attached.
> 
> Note that I have only tested this with a board with an i2c DSI
> peripheral, not with a "pure" DSI peripheral.

Thanks this fixes the deferred probe warning I've been seeing:

Tested-by: Tony Lindgren <tony@atomide.com>
