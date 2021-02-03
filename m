Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B10630EE77
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 09:33:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EDE06ED0E;
	Thu,  4 Feb 2021 08:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3676C6EB71
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 18:14:39 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 15ABB240100
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 19:14:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
 t=1612376077; bh=95Jo6jadPYtj6MXt69Zot2RehnRdPqf90i4ijMVzY88=;
 h=Date:From:To:Cc:Subject:From;
 b=WPu3irPOSwnqaUPdGdKgFDOQTFH8jTR/M+vXhZEah1KnwWOX+ByCZxblNf5fouKBf
 dYp1NPyJaaNMe92UcxHvQpBF4chmMwPFfGG1th3gaTKouO5ogikfx0fBmCu9jA9pMw
 OR8rE5eguSq2e/vQjJ5bwgD8x5/7Q6UE2QJT17WSQaw4HIOZM18DciNOSJLycpUQNH
 XDt+J0EqxXs+pSwrjJC+OHB355lcWk3nfCEnHkab+O6loJLW4tNjhCeRDuBwoSl+xY
 8jEAR/ozoDsgsy8eJ9jAXt1mMxgaJZ424QvDwTLZFkTpLuZRZV/bzqxOootsfoasnR
 YEbQv9KnCNv6g==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4DW8w34mLRz6tmS;
 Wed,  3 Feb 2021 19:14:27 +0100 (CET)
Date: Wed, 3 Feb 2021 19:14:22 +0100
From: Sebastian Fricke <sebastian.fricke@posteo.net>
To: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 0/6] Support second Image Signal Processor on rk3399
Message-ID: <20210203181422.txbd6kvujlmz4nju@basti-TUXEDO-Book-XA1510>
References: <20210202145632.1263136-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210202145632.1263136-1-heiko@sntech.de>
X-Mailman-Approved-At: Thu, 04 Feb 2021 08:32:37 +0000
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

I have tested your patch set on my nanoPC-T4, here is a complete log
with:
- relevant kernel log entries
- system information
- media ctl output
- sysfs entry information

https://paste.debian.net/1183874/

Additionally, to your patchset I have applied the following patches:
https://github.com/initBasti/Linux_kernel_media_tree_fork/commits/dual_cam_setup

And just to not cause confusion the `media_dev` entries come from this
unmerged series:
https://patchwork.kernel.org/project/linux-media/list/?series=426269

I have actually been able to stream with both of my cameras at the same
time using the libcamera cam command.
I would like to thank you a lot for making this possible.

If you like to you can add:
Tested-by: Sebastian Fricke <sebastian.fricke@posteo.net>

On 02.02.2021 15:56, Heiko Stuebner wrote:
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
> .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 342 ++++++++++++++++++
> 4 files changed, 384 insertions(+)
>
>-- 
>2.29.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
