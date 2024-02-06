Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2740584BC21
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 18:36:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1AE112D15;
	Tue,  6 Feb 2024 17:36:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="CKtss218";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 557A8112D15
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 17:36:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E064DFF804;
 Tue,  6 Feb 2024 17:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1707240963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZprZaJ3ymP3skmdLg1+MO6aPXXlIBTqsbgRz9xo2kcc=;
 b=CKtss21823QhHbaxHdvc9ef9MQxN9DR1PULPtmC2JUfbY9ixESWQBIUyWHyy0NOh8T57ax
 bESUe7Mlaq1K3CWfOQAm5esbmfVblSpK3OEqDfW7FDZjUtBq0DBwrfIOOktkQR/++QmxI1
 DzCJ5EnI3oVYOktQ8gl7LDnl2sdVxVhvnVfwcPwKDxuUqVDu8adyxYwDsV/ntvK1DbVO5O
 aEmgQg2SeUM/XMS4O/BZEJeP50qrFsmywrPsoDhldMgGyr8+D/3+N62jviLj8wmquxlu+G
 DnMXuUGHVkw7SsEU4QrFaKVRbZ1TLYYTb6SJsWemVIMb1W1/Jb088ypH9bVb4Q==
Date: Tue, 6 Feb 2024 18:35:57 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, marex@denx.de,
 alexander.stein@ew.tq-group.com, frieder.schrempf@kontron.de, Lucas Stach
 <l.stach@pengutronix.de>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Richard Leitner
 <richard.leitner@skidata.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay
 Abraham I <kishon@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Liu Ying <victor.liu@nxp.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH V8 10/12] drm/bridge: imx: add bridge wrapper driver for
 i.MX8MP DWC HDMI
Message-ID: <20240206183557.408399f0@booty>
In-Reply-To: <20240203165307.7806-11-aford173@gmail.com>
References: <20240203165307.7806-1-aford173@gmail.com>
 <20240203165307.7806-11-aford173@gmail.com>
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

On Sat,  3 Feb 2024 10:52:50 -0600
Adam Ford <aford173@gmail.com> wrote:

> From: Lucas Stach <l.stach@pengutronix.de>
> 
> Add a simple wrapper driver for the DWC HDMI bridge driver that
> implements the few bits that are necessary to abstract the i.MX8MP
> SoC integration.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Tested-by: Marek Vasut <marex@denx.de>
> Tested-by: Adam Ford <aford173@gmail.com> #imx8mp-beacon
> Tested-by: Richard Leitner <richard.leitner@skidata.com>
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by:  Adam Ford <aford173@gmail.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
