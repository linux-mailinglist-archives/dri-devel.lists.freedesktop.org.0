Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 698C49DA4C3
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 10:29:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54CFA10EA63;
	Wed, 27 Nov 2024 09:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="DNiHHf5i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4825610E179
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 09:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=US6YPwHGZjjY/0o2sbSCg5NuQ0NYboqqQtTlEz4XOBo=; b=DNiHHf5igtfm+55scaCjyZ70X7
 iuSqoFzaV3fG6GsxmRNtB0hU+YItLw9Kt1xc9qvPlnKftzC5IUJL3cswmUB+durrrkwlkVff3QvL0
 oW/WUQ4VENUS3go8z/eNA53dD5V82fV/Ub4F+EJb7EjER23M5HtZZG0OhCpgS52/ylbltk4fkF2df
 IKXxYTRzp07YGOJjLfjr6Hgs0mNiwvA+cvN6OcfjyE2k0lqR5Mrcu042p6kmfnA3EF5Y5h7pqMKxu
 e158u8PPCV38GUdV5KUReHvHOWNJANjHf7bWIGMXg98bcgU0FxyzxgG5tD9n5rlr1GxijAG/IVzpb
 Ttb1A31A==;
Received: from i5e86190f.versanet.de ([94.134.25.15] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tGEMA-0006nM-HZ; Wed, 27 Nov 2024 10:29:10 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 rfoss@kernel.org, vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Damon Ding <damon.ding@rock-chips.com>,
 sebastian.reichel@collabora.com
Subject: Re: [PATCH v1 04/10] phy: phy-rockchip-samsung-hdptx: Add support for
 eDP mode
Date: Wed, 27 Nov 2024 10:29:09 +0100
Message-ID: <4260470.1IzOArtZ34@diego>
In-Reply-To: <20241127075157.856029-5-damon.ding@rock-chips.com>
References: <20241127075157.856029-1-damon.ding@rock-chips.com>
 <20241127075157.856029-5-damon.ding@rock-chips.com>
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

Hi Damon,

Am Mittwoch, 27. November 2024, 08:51:51 CET schrieb Damon Ding:
> Add basic support for RBR/HBR/HBR2 link rates, and the voltage swing and
> pre-emphasis configurations of each link rate have been verified according
> to the eDP 1.3 requirements.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---

[ ... huge block of DP phy support ...]

yes that block was huge, but I also don't see a way to split that up in a
useful way, so it should be fine.


> +static int rk_hdptx_phy_set_mode(struct phy *phy, enum phy_mode mode,
> +				 int submode)
> +{
> +	return 0;
> +}

I think it might make sense to go the same way as the DCPHY and also
naneng combophy, to use #phy-cells = 1 to select the phy-mode via DT .

See [0] for Sebastians initial suggestion regarding the DC-PHY.
The naneng combophy already uses that scheme of mode-selection too.

There is of course the issue of backwards-compatibility, but that can be
worked around in the binding with something like:

 '#phy-cells':
    enum: [0, 1]
    description: |
      If #phy-cells is 0, PHY mode is set to PHY_TYPE_HDMI
      If #phy-cells is 1 mode is set in the PHY cells. Supported modes are:
        - PHY_TYPE_HDMI
        - PHY_TYPE_DP
      See include/dt-bindings/phy/phy.h for constants.

PHY_TYPE_HDMI needs to be added to include/dt-bindings/phy/phy.h
but PHY_TYPE_DP is already there.

That way we would standardize on one form of accessing phy-types
on rk3588 :-) .

Also see the Mediatek CSI rx phy doing this too already [1]


Heiko

[0] https://lore.kernel.org/linux-rockchip/udad4qf3o7kt45nuz6gxsvsmprh4rnyfxfogopmih6ucznizih@7oj2jrnlfonz/
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml



