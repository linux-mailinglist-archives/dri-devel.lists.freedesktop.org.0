Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E26A031AEEC
	for <lists+dri-devel@lfdr.de>; Sun, 14 Feb 2021 05:52:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8FBC6E30D;
	Sun, 14 Feb 2021 04:52:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FFA6E30D
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 04:52:11 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id EB7FC160060
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 05:52:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
 t=1613278329; bh=N2OFag51Yk707V6y0F3zYvO9dt8D3xrSs1fvn36Gyis=;
 h=Date:From:To:Cc:Subject:From;
 b=IziuXCnWpKYaoaVXJKT+kkTieF8H5YnmT0pAs4epzJThVbqDDYiwKI2KEL9kRhZ33
 0dnh+TMSMX4r+ndVuS/v+I/2iLFnR1JrH8AumHf7JRsmmjdsDDQ+9tSKatbgrAWNHI
 26ynq8McsRJKhYjxmm3g0QPPKECFm4Wz1ASoDWM4FPNEJiPjeSmo50MYDU36i39Rit
 Ro+YsGPy1nVJ/VNZ2EBvyLnGkaGYoeLrJNSZwxB+0E43reO1hwUVVXLVpsU71mWS4X
 VzIGuOxu+B67caK2mZ7q2NOl73OqBTbGK1x91BYhaOjz9Nwk+X+yfW4shggf6OEsXw
 G66+f0mnfnYsg==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4DdZbB5ZDhz9rxH;
 Sun, 14 Feb 2021 05:52:06 +0100 (CET)
Date: Sun, 14 Feb 2021 05:52:06 +0100
From: Sebastian Fricke <sebastian.fricke@posteo.net>
To: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 0/6] Support second Image Signal Processor on rk3399
Message-ID: <20210214045206.4jqae2yuolgdxwad@basti-TUXEDO-Book-XA1510>
References: <20210210111020.2476369-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210210111020.2476369-1-heiko@sntech.de>
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
Cc: devicetree@vger.kernel.org, dafna.hirschfeld@collabora.com,
 cmuellner@linux.com, hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 helen.koike@collabora.com, robh+dt@kernel.org, ezequiel@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Heiko,

I have tested your series and it successfully fixes the problem with the
2nd camera when HDMI is connected at boot. Besides that the patch looks
good and my tests have confirmed that both cameras have the same output
quality when I exchange the connected ISP instances.

Tested-by: Sebastian Fricke <sebastian.fricke@posteo.net>

Greetings,
Sebastian

On 10.02.2021 12:10, Heiko Stuebner wrote:
>The rk3399 has two ISPs and right now only the first one is usable.
>The second ISP is connected to the TXRX dphy on the soc.
>
>The phy of ISP1 is only accessible through the DSI controller's
>io-memory, so this series adds support for simply using the dsi
>controller is a phy if needed.
>
>That solution is needed at least on rk3399 and rk3288 but no-one
>has looked at camera support on rk3288 at all, so right now
>only implement the rk3399 specifics.
>
>changes in v2:
>- enable grf-clock also for init callback
>  to not break if for example hdmi is connected on boot
>  and disabled the grf clock during its probe
>- add Sebastian's Tested-by
>- add Rob's Ack for the phy-cells property
>
>Heiko Stuebner (6):
>  drm/rockchip: dsi: add own additional pclk handling
>  dt-bindings: display: rockchip-dsi: add optional #phy-cells property
>  drm/rockchip: dsi: add ability to work as a phy instead of full dsi
>  arm64: dts: rockchip: add #phy-cells to mipi-dsi1
>  arm64: dts: rockchip: add cif clk-control pinctrl for rk3399
>  arm64: dts: rockchip: add isp1 node on rk3399
>
> .../display/rockchip/dw_mipi_dsi_rockchip.txt |   1 +
> arch/arm64/boot/dts/rockchip/rk3399.dtsi      |  39 ++
> drivers/gpu/drm/rockchip/Kconfig              |   2 +
> .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 349 ++++++++++++++++++
> 4 files changed, 391 insertions(+)
>
>-- 
>2.29.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
