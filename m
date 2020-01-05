Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0484913085A
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jan 2020 15:05:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A8689A16;
	Sun,  5 Jan 2020 14:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 020D0898FD
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jan 2020 14:05:33 +0000 (UTC)
Received: from p508fce23.dip0.t-ipconnect.de ([80.143.206.35]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1io6X0-0007kM-Qo; Sun, 05 Jan 2020 15:05:26 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 00/11] Add PX30 LVDS support
Date: Sun, 05 Jan 2020 15:05:26 +0100
Message-ID: <1885398.klecWcqSHf@phil>
In-Reply-To: <20191224143900.23567-1-miquel.raynal@bootlin.com>
References: <20191224143900.23567-1-miquel.raynal@bootlin.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Dienstag, 24. Dezember 2019, 15:38:49 CET schrieb Miquel Raynal:
> Hello,
> =

> This series aims at supporting LVDS on PX30.
> =

> A first couple of patches update the documentation with the new
> compatible and the presence of a PHY. Then, the existing Rockchip
> driver is cleaned and extended to support PX30 specificities. Finally,
> the PX30 DTSI is updated with CRTC routes, the DSI DPHY and the LVDS
> IP itself.
> =

> Cheers,
> Miqu=E8l
> =

> Changes since v1:
> * Added Rob's Ack.
> * Used "must" instead of "should" in the bindings.
> * Precised that phy-names is an optional property in the case of
>   PX30.
> * Renamed the WRITE_EN macro into HIWORD_UPDATE to be aligned with
>   other files.
> * Removed extra configuration, not needed for generic panels (see
>   Sandy Huang answer).
> * Dropped the display-subsystem routes (useless).
> * Merged two patches to avoid phandle interdependencies in graphs and
>   intermediate build errors.
> =

> Miquel Raynal (11):
>   dt-bindings: display: rockchip-lvds: Declare PX30 compatible
>   dt-bindings: display: rockchip-lvds: Document PX30 PHY
>   drm/rockchip: lvds: Fix indentation of a #define
>   drm/rockchip: lvds: Harmonize function names
>   drm/rockchip: lvds: Change platform data
>   drm/rockchip: lvds: Create an RK3288 specific probe function
>   drm/rockchip: lvds: Helpers should return decent values
>   drm/rockchip: lvds: Pack functions together

applied patches 1-8 to drm-misc-next

>   drm/rockchip: lvds: Add PX30 support

drm-misc-next is currently still at 5.4-rc4, so I'll need to find out how
to get newer kernel changes in there, as right now we're missing
the PHY_MODE_LVDS constant.


Heiko

>   arm64: dts: rockchip: Add PX30 DSI DPHY
>   arm64: dts: rockchip: Add PX30 LVDS
> =

>  .../display/rockchip/rockchip-lvds.txt        |   4 +
>  arch/arm64/boot/dts/rockchip/px30.dtsi        |  48 ++
>  drivers/gpu/drm/rockchip/rockchip_lvds.c      | 486 ++++++++++++------
>  drivers/gpu/drm/rockchip/rockchip_lvds.h      |  19 +-
>  4 files changed, 401 insertions(+), 156 deletions(-)
> =

> =





_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
