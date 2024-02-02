Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E141846ED8
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 12:22:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 746C310F03C;
	Fri,  2 Feb 2024 11:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="oD4486gF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728FD10F03C
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 11:22:15 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id C5F31C2C1C
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 11:20:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8667E1BF20A;
 Fri,  2 Feb 2024 11:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1706872839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C801XntAx6vFH+ttC2yyLkXTQzS50DDecHjK0YLEF9U=;
 b=oD4486gF+t55vbzZkQfwe6Ks80voR9BadNJK17DdKY2sGSYG3Mht8NVxspZipuV6rFKGZA
 tIGSBbv2mv4adrsdgRIKTzv7yRGxQoC0XHK8f/31SiRWvQ9fBeT9QNGkdcxYyPT4LKEVDZ
 XH7evlQ2OJcDlcJjIBtiwMpZAUxGoFR7tLGD2j5gOWQFgyFzPZOAtLfaLgvcuc2QHtLPPl
 8AzodWGrlZFdNRol8DJSOeyUKlwJuULAJ5DQlnLhsX6SD2cYyG3u/GYeP7P7FK1pjW32FM
 8HcdVuTZFig+4ifYlpN16pnaSMP0+5D4AP8QHG56UlZ8LySlFOFWcSnQVeN3vA==
Date: Fri, 2 Feb 2024 12:20:36 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Adam Ford <aford173@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I
 <kishon@kernel.org>, devicetree@vger.kernel.org, Conor Dooley
 <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, Vinod
 Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team
 <linux-imx@nxp.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V2 2/2] phy: freescale: add Samsung HDMI PHY
Message-ID: <20240202122036.7aa66d9d@booty>
In-Reply-To: <20240106221907.325127-2-aford173@gmail.com>
References: <20240106221907.325127-1-aford173@gmail.com>
 <20240106221907.325127-2-aford173@gmail.com>
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

Hello Adam,

On Sat,  6 Jan 2024 16:19:05 -0600
Adam Ford <aford173@gmail.com> wrote:

> From: Lucas Stach <l.stach@pengutronix.de>
> 
> This adds the driver for the Samsung HDMI PHY found on the
> i.MX8MP SoC.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Adam Ford <aford173@gmail.com>

I had already tested the v2 from Lucas, however I also tested this
version which works as well, on v6.8-rc1, custom hardware based on the
Avnet i.MX8MP SMARC SoM.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Generally speaking, as there are several small patch series around which
together implement HDMI on iMX8MP and similar, I think it would be much
easier fore reviewing and testing if they were grouped into a unique
series.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
