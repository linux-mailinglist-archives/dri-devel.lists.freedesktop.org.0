Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6B4C68CFC
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 11:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D2510E158;
	Tue, 18 Nov 2025 10:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=louisalexis.eyraud@collabora.com header.b="NcANy9/F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6FC610E120
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 10:25:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1763461471; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=LdMLm3RLXrPOWV71tCfHSwoPdsQ11sEkhGvdVs3OMDVUyCDvCt678axHNax319WCianL0bTs5vIPZIYcgIZ2WEMP9t/cfZGA5Ro7SGrbBcPi7Y0ZldpiiMzfoSkF6OANRKIhU6agyVpFvvJMixlBvh+9V7UJ81NGTLPz4saoW1w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1763461471;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=NAUSaA3KPKG9he/p30k6wBazwxquuoNqgQBZ6NGhy3w=; 
 b=Vvw3sr+sXOQGqA6b4hlh4rjQSJDT1LsDwCYm2obiu7c7oGDv22ky/BfGagYrsWeZHWCY7RXguivZWIM9gk4cw0Sv1Ap6UbW5op/+VmC4HXmrpgbMHE65uPqic+vtmPVbi9KzX3UAzUZ8W+2cXD0selsnE2rwBRmDqaCwSY8WUd4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
 dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763461471; 
 s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=NAUSaA3KPKG9he/p30k6wBazwxquuoNqgQBZ6NGhy3w=;
 b=NcANy9/F4oSqxya+A0wXe59480FqEHR2ERhY5Xe3Xy/Pv0IRnf2hWGuUZ/oGiemg
 m/OfC+HWvFia3oV/Tx9vPNzVpIe2T/qx1Yry2/muFx5KqfF+vDBuV9yl1cJ3dDgGJ8P
 ep1hVRTwDVMKNA3m+CLM06C9AQf8Wn/jVYA/KRbE=
Received: by mx.zohomail.com with SMTPS id 1763461469257293.33494424404137;
 Tue, 18 Nov 2025 02:24:29 -0800 (PST)
Message-ID: <815d7300e19db00f84091f0925b2e509c4453fa0.camel@collabora.com>
Subject: Re: [PATCH v2 RESEND 4/9] phy: mediatek: phy-mtk-hdmi-mt8195:
 convert from round_rate() to determine_rate()
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, Kishon
 Vijay Abraham I <kishon@kernel.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Heiko Stuebner
 <heiko@sntech.de>, Stephen Boyd	 <sboyd@kernel.org>, Maxime Ripard
 <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
Date: Tue, 18 Nov 2025 11:24:22 +0100
In-Reply-To: <20251106-phy-clk-route-rate-v2-resend-v1-4-e2058963bfb1@redhat.com>
References: <20251106-phy-clk-route-rate-v2-resend-v1-0-e2058963bfb1@redhat.com>
 <20251106-phy-clk-route-rate-v2-resend-v1-4-e2058963bfb1@redhat.com>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-ZohoMailClient: External
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

Hi,

On Thu, 2025-11-06 at 18:25 -0500, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
> =C2=A0drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 10 +++++-----
> =C2=A01 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> index
> b38f3ae26b3f3d8c9e73b43d86510acf6cedb471..1426a2db984d53b91125b18f772
> 5738c44f19555 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> @@ -418,13 +418,13 @@ static int mtk_hdmi_pll_set_rate(struct clk_hw
> *hw, unsigned long rate,
> =C2=A0	return mtk_hdmi_pll_calc(hdmi_phy, hw, rate, parent_rate);
> =C2=A0}
> =C2=A0
> -static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long
> rate,
> -				=C2=A0=C2=A0=C2=A0 unsigned long *parent_rate)
> +static int mtk_hdmi_pll_determine_rate(struct clk_hw *hw,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct clk_rate_request *req)
> =C2=A0{
> =C2=A0	struct mtk_hdmi_phy *hdmi_phy =3D to_mtk_hdmi_phy(hw);
> =C2=A0
> -	hdmi_phy->pll_rate =3D rate;
> -	return rate;
> +	hdmi_phy->pll_rate =3D req->rate;
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static unsigned long mtk_hdmi_pll_recalc_rate(struct clk_hw *hw,
> @@ -439,7 +439,7 @@ static const struct clk_ops mtk_hdmi_pll_ops =3D {
> =C2=A0	.prepare =3D mtk_hdmi_pll_prepare,
> =C2=A0	.unprepare =3D mtk_hdmi_pll_unprepare,
> =C2=A0	.set_rate =3D mtk_hdmi_pll_set_rate,
> -	.round_rate =3D mtk_hdmi_pll_round_rate,
> +	.determine_rate =3D mtk_hdmi_pll_determine_rate,
> =C2=A0	.recalc_rate =3D mtk_hdmi_pll_recalc_rate,
> =C2=A0};
> =C2=A0
Tested OK on Mediatek Genio 510-EVK (MT8370) and Genio 1200-EVK
(MT8395) boards.

Tested-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Regards,
Louis-Alexis
