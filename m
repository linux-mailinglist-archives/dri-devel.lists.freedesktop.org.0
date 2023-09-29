Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 832977B382C
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 18:56:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2D810E0A4;
	Fri, 29 Sep 2023 16:55:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 430 seconds by postgrey-1.36 at gabe;
 Fri, 29 Sep 2023 16:55:55 UTC
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65D810E0A4
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 16:55:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1F11EFF80A;
 Fri, 29 Sep 2023 16:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1696006554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0s6liZ65S6LcJzLjeut2b8fzES+0W9Bu/QBNIiJjhuo=;
 b=Srl+Z0pKN0Iy2DbOjmmfz1bA4sj8VMcOUJwle+YTtLygArIYYgu4JmXm4j5U2HmZVffHcT
 s0jxEaMmKFM1dMUZcM7u1gYTb8qdhuAhHiZ0okSY8dickP3CwH56uV30hcPBxwOtO50fdu
 tGZsz9kII8WUHXt9IosU8qyThOwREJ33b/GQivWQ3XTydHnw2tw2rOW/BKMQK+MVbZOAub
 Mrw8RTjfhgeFoWpL1i+uhEkFRlQYtn6hhtjMM1aZokrRxkJNz5hJBsFnNA1/2Gv8Fp7ZdZ
 rABKnf/VczcqehgJfCZW9d1ttUEL58CqoiH+wDtSe75Hle9IKw9RJxVP4270QA==
Date: Fri, 29 Sep 2023 18:55:49 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v4 2/2] drm/bridge: imx: add driver for HDMI TX Parallel
 Video Interface
Message-ID: <20230929185549.18aa57e7@booty>
In-Reply-To: <20230928125536.1782715-2-l.stach@pengutronix.de>
References: <20230928125536.1782715-1-l.stach@pengutronix.de>
 <20230928125536.1782715-2-l.stach@pengutronix.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 patchwork-lst@pengutronix.de, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

On Thu, 28 Sep 2023 14:55:36 +0200
Lucas Stach <l.stach@pengutronix.de> wrote:

> This IP block is found in the HDMI subsystem of the i.MX8MP SoC. It has a
> full timing generator and can switch between different video sources. On
> the i.MX8MP however the only supported source is the LCDIF. The block
> just needs to be powered up and told about the polarity of the video
> sync signals to act in bypass mode.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com> (v2)

I was in Cc on your v3 but not on this v4. Maybe the " (v2)" on these
lines confuses get_maintainers.pl?

> Tested-by: Marek Vasut <marex@denx.de> (v1)
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> (v2)
> Tested-by: Richard Leitner <richard.leitner@skidata.com> (v2)
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> (v2)
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com> (v3)

A changelog would be appreciated, especially as a long time has gone
since I last looked at these patches.

Confirmed for this v4:

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
[On Avnet MSC SM2-MB-EP1 based on the SMARC module]
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
