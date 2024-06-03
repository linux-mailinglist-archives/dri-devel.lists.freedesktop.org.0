Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4071A8D835D
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 15:03:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6EB10E3B5;
	Mon,  3 Jun 2024 13:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E4410E3B5
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 13:03:46 +0000 (UTC)
Received: from [213.70.33.226] (helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1sE7LG-0007Q6-KA; Mon, 03 Jun 2024 15:03:14 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: neil.armstrong@linaro.org,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Mark Yao <markyao0591@gmail.com>, Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, kernel@collabora.com,
 Alexandre ARNOUD <aarnoud@me.com>, Luis de Arquer <ldearquer@gmail.com>,
 Algea Cao <algea.cao@rock-chips.com>
Subject: Re: [PATCH 00/14] Add initial support for the Rockchip RK3588 HDMI TX
 Controller
Date: Mon, 03 Jun 2024 15:03:12 +0200
Message-ID: <11359776.NyiUUSuA9g@phil>
In-Reply-To: <ab0a6372-091b-4293-8907-a4b3ff4845c0@rock-chips.com>
References: <20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com>
 <a4b22708-e85d-448a-8145-244b49bca053@linaro.org>
 <ab0a6372-091b-4293-8907-a4b3ff4845c0@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Am Montag, 3. Juni 2024, 14:14:17 CEST schrieb Andy Yan:
> Hi Neil:
> 
> On 6/3/24 16:55, Neil Armstrong wrote:
> > Hi Christian,
> > 
> > On 01/06/2024 15:12, Cristian Ciocaltea wrote:
> >> The RK3588 SoC family integrates a Quad-Pixel (QP) variant of the
> >> Synopsys DesignWare HDMI TX controller used in the previous SoCs.
> >>
> >> It is HDMI 2.1 compliant and supports the following features, among
> >> others:
> >>
> > .
> > 
> > ..
> > 
> >> * SCDC I2C DDC access
> >> * TMDS Scrambler enabling 2160p@60Hz with RGB/YCbCr4:4:4
> >> * YCbCr4:2:0 enabling 2160p@60Hz at lower HDMI link speeds
> >> * Multi-stream audio
> >> * Enhanced Audio Return Channel (EARC)
> > -> Those features were already supported by the HDMI 2.0a compliant HW, just
> > list the _new_ features for HDMI 2.1
> > 
> > I did a quick review of your patchset and I don't understand why you need
> > to add a separate dw-hdmi-qp.c since you only need simple variants of the I2C
> > bus, infoframe and bridge setup.
> > 
> > Can you elaborate further ? isn't this Quad-Pixel (QP) TX controller version
> > detectable at runtime ?
> > 
> > I would prefer to keep a single dw-hdmi driver if possible.
> 
> 
> 
> The QP HDMI controller is a completely different variant with totally different
> registers layout, see PATCH 13/14.
> I think make it a separate driver will be easier for development and maintenance.

I'm with Andy here. Trying to navigate a driver for two IP blocks really
sounds taxing especially when both are so different.

Synopsis also created a new dsi controller for the DSI2 standard, with
a vastly different registers layout.

I guess at some point there is time to say this really is a new IP ;-) .


Though while on that thought, I don't fully understand why both a compiled
under the dw_hdmi kconfig symbol. People going for a minimal kernel might
want one or the other, but not both for their specific board.


Heiko


