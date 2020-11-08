Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C092AAA9C
	for <lists+dri-devel@lfdr.de>; Sun,  8 Nov 2020 11:55:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F93C6E2D7;
	Sun,  8 Nov 2020 10:55:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B6EF6E2D7
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Nov 2020 10:55:40 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id D376220025;
 Sun,  8 Nov 2020 11:55:36 +0100 (CET)
Date: Sun, 8 Nov 2020 11:55:35 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: Re: [PATCH v3 2/3] drm/bridge: sii902x: Enable I/O and core VCC
 supplies if present
Message-ID: <20201108105535.GB1161483@ravnborg.org>
References: <20200928173056.1674274-1-mr.nuke.me@gmail.com>
 <20201020221501.260025-2-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201020221501.260025-2-mr.nuke.me@gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8 a=f2O8UAJn3HDJhdU-9UYA:9
 a=CjuIK1q_8ugA:10
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 David Airlie <airlied@linux.ie>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alexandru

On Tue, Oct 20, 2020 at 05:14:58PM -0500, Alexandru Gagniuc wrote:
> On the SII9022, the IOVCC and CVCC12 supplies must reach the correct
> voltage before the reset sequence is initiated. On most boards, this
> assumption is true at boot-up, so initialization succeeds.
> 
> However, when we try to initialize the chip with incorrect supply
> voltages, it will not respond to I2C requests. sii902x_probe() fails
> with -ENXIO.
> 
> To resolve this, look for the "iovcc" and "cvcc12" regulators, and
> make sure they are enabled before starting the reset sequence. If
> these supplies are not available in devicetree, then they will default
> to dummy-regulator. In that case everything will work like before.
> 
> This was observed on a STM32MP157C-DK2 booting in u-boot falcon mode.
> On this board, the supplies would be set by the second stage
> bootloader, which does not run in falcon mode.
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>

Thanks, applied series to drm-misc-next. I fixed two
checkpatch --strict warnings while applying.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
