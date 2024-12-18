Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 827889F65FE
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 13:35:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A65C10E10F;
	Wed, 18 Dec 2024 12:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="lIuwHm8C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4B710E10F
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 12:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=phZjJ8Vd0a6a/KUNLyGQpPa9OxsPWwxJsNWkp8oFdNc=; b=lIuwHm8C3o0XdtMfisDH16HFrk
 xW2eZCC0NsEyhgo1QgwipjBohy3XKMwfemabXrMubtE3JQsgBlBhjxNCxzvSPsOKftOgk+npqLDSf
 eFcNtJT4PNdAkgiVD7bkntXI+XJwnWMmxMEd/3rdATt3pjh4CSCQ6Voajw1xEDtkoan5lyLsuJxdT
 +kfKXb8SsDni0xHBr61qMlBNjF53ldb0qlaD0DSRhy3WP8adBNHKzmwdOUjPH131INjHuFoNaizkW
 WpmFGXwgxswGU3P/RkGbheMpkqPUKzWDgYlhcdWCOvLG2Zf8GuPjgmWCmV3d+sbWwrRsJ5NDBhy6O
 YOP8x3ug==;
Received: from i53875bfb.versanet.de ([83.135.91.251] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tNtGw-0000Hd-65; Wed, 18 Dec 2024 13:35:26 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 rfoss@kernel.org, vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v2 04/11] phy: phy-rockchip-samsung-hdptx: Add support for
 eDP mode
Date: Wed, 18 Dec 2024 13:35:24 +0100
Message-ID: <867267676.0ifERbkFSE@diego>
In-Reply-To: <20241216031225.3746-5-damon.ding@rock-chips.com>
References: <20241216031225.3746-1-damon.ding@rock-chips.com>
 <20241216031225.3746-5-damon.ding@rock-chips.com>
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

Am Montag, 16. Dezember 2024, 04:12:18 CET schrieb Damon Ding:
> Add basic support for RBR/HBR/HBR2 link rates, and the voltage swing and
> pre-emphasis configurations of each link rate have been verified according
> to the eDP 1.3 requirements.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v2:
> - Add the module author
> ---

> @@ -255,6 +364,19 @@ struct ropll_config {
>  	u8 cd_tx_ser_rate_sel;
>  };
>  
> +struct tx_drv_ctrl {
> +	u8 tx_drv_lvl_ctrl;
> +	u8 tx_drv_post_lvl_ctrl;
> +	u8 ana_tx_drv_idrv_idn_ctrl;
> +	u8 ana_tx_drv_idrv_iup_ctrl;
> +	u8 ana_tx_drv_accdrv_en;
> +	u8 ana_tx_drv_accdrv_ctrl;
> +	u8 tx_drv_pre_lvl_ctrl;
> +	u8 ana_tx_jeq_en;
> +	u8 tx_jeq_even_ctrl;
> +	u8 tx_jeq_odd_ctrl;
> +};
> +
>  enum rk_hdptx_reset {
>  	RST_PHY = 0,
>  	RST_APB,

not a full review (yet), but this part conflicts with
commit f2dbca169790 ("phy: phy-rockchip-samsung-hdptx: Don't request RST_PHY/RST_ROPLL/RST_LCPLL")

[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=f2dbca169790ea1e436ffdd9ef37d7c3a4401c46


