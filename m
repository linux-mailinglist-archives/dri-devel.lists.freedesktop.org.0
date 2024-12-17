Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EEB9F5040
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 17:06:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709A210E941;
	Tue, 17 Dec 2024 16:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="pb1H+ovL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E23B210E941
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 16:06:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41B2B20007;
 Tue, 17 Dec 2024 16:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1734451599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K7QDxB7ttCT3f928duF1sBDfU54SNcLGFr+6XlIU/P0=;
 b=pb1H+ovL4E89Ij5PpNP/cqdiiPIFrAs9145uI6YrgF5nkIcAjUN1pNY7yGSFeemDYWP0iu
 E3X5H5hzNUr1QZJF5es97OjH29DFcT5hLTYMIXFTknfFQpVpZlock4yLuDKpQZSGlR61aB
 vcZjBKUYKB6tFF/VAB1lctMnM+IpK29gGVkDdyPloFN6CU5405DX7NspCSOvp7WXn+KY2u
 37v+iGu+kLJzwWPT730sopSPxrap796PFEwQc7+WH+il/riE9mb1+ludRuzzF6aDorkfvs
 SpEthPUjYIiZPHnWS54ynDZuDEsoDLIELCC8WxjBERezo/itB5k/RHkZ/eTzbw==
Date: Tue, 17 Dec 2024 17:06:35 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Herve Codina <herve.codina@bootlin.com>, Simona Vetter
 <simona.vetter@ffwll.ch>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Louis
 Chauvet <louis.chauvet@bootlin.com>, Andi Shyti
 <andi.shyti@linux.intel.com>
Subject: Re: [PATCH RESEND] drm/bridge: ti-sn65dsi83: use dev_err_probe when
 failing to get panel bridge
Message-ID: <20241217170635.2ba35c08@booty>
In-Reply-To: <20241217-ti-sn65dsi83-dev_err_probe-v1-1-3fdce386400c@bootlin.com>
References: <20241217-ti-sn65dsi83-dev_err_probe-v1-1-3fdce386400c@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
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

Hello,

On Tue, 17 Dec 2024 17:02:51 +0100
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> When devm_drm_of_get_bridge() fails, the probe fails silently. Use
> dev_err_probe() instead to log an error or report the deferral reason,
> whichever is applicable.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

This patch got a reviewed-by from Andi Shyti when I sent it the first
time [0], but b4 didn't keep it when resending. I think it is fair for
me to add it now, even though I'm not sure patchwork and b4 will catch
it:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

[0] https://lore.kernel.org/all/ZrtuksiarZNS8L79@ashyti-mobl2.lan/

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
