Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AA430E39E
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 20:54:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5226EBA0;
	Wed,  3 Feb 2021 19:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0416EBA0
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 19:54:40 +0000 (UTC)
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1l7OET-0000yQ-R9; Wed, 03 Feb 2021 20:54:33 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Sebastian Fricke <sebastian.fricke@posteo.net>
Subject: Re: [PATCH 0/6] Support second Image Signal Processor on rk3399
Date: Wed, 03 Feb 2021 20:54:32 +0100
Message-ID: <16624224.lhrHg4fidi@diego>
In-Reply-To: <20210203181422.txbd6kvujlmz4nju@basti-TUXEDO-Book-XA1510>
References: <20210202145632.1263136-1-heiko@sntech.de>
 <20210203181422.txbd6kvujlmz4nju@basti-TUXEDO-Book-XA1510>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sebastian,

Am Mittwoch, 3. Februar 2021, 19:14:22 CET schrieb Sebastian Fricke:
> Hey Heiko,
> 
> I have tested your patch set on my nanoPC-T4, here is a complete log
> with:
> - relevant kernel log entries
> - system information
> - media ctl output
> - sysfs entry information
> 
> https://paste.debian.net/1183874/
> 
> Additionally, to your patchset I have applied the following patches:
> https://github.com/initBasti/Linux_kernel_media_tree_fork/commits/dual_cam_setup
> 
> And just to not cause confusion the `media_dev` entries come from this
> unmerged series:
> https://patchwork.kernel.org/project/linux-media/list/?series=426269
> 
> I have actually been able to stream with both of my cameras at the same
> time using the libcamera cam command.
> I would like to thank you a lot for making this possible.

Thanks for testing a dual camera setup. On my board I could only test
the second ISP. And really glad it works for you tool :-) .

Out of curiosity, do you also see that green tint in the images the cameras
produce?

Thanks
Heiko


> If you like to you can add:
> Tested-by: Sebastian Fricke <sebastian.fricke@posteo.net>
> 
> On 02.02.2021 15:56, Heiko Stuebner wrote:
> >The rk3399 has two ISPs and right now only the first one is usable.
> >The second ISP is connected to the TXRX dphy on the soc.
> >
> >The phy of ISP1 is only accessible through the DSI controller's
> >io-memory, so this series adds support for simply using the dsi
> >controller is a phy if needed.
> >
> >That solution is needed at least on rk3399 and rk3288 but no-one
> >has looked at camera support on rk3288 at all, so right now
> >only implement the rk3399 specifics.
> >
> >
> >Heiko Stuebner (6):
> >  drm/rockchip: dsi: add own additional pclk handling
> >  dt-bindings: display: rockchip-dsi: add optional #phy-cells property
> >  drm/rockchip: dsi: add ability to work as a phy instead of full dsi
> >  arm64: dts: rockchip: add #phy-cells to mipi-dsi1
> >  arm64: dts: rockchip: add cif clk-control pinctrl for rk3399
> >  arm64: dts: rockchip: add isp1 node on rk3399
> >
> > .../display/rockchip/dw_mipi_dsi_rockchip.txt |   1 +
> > arch/arm64/boot/dts/rockchip/rk3399.dtsi      |  39 ++
> > drivers/gpu/drm/rockchip/Kconfig              |   2 +
> > .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 342 ++++++++++++++++++
> > 4 files changed, 384 insertions(+)
> >
> 




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
