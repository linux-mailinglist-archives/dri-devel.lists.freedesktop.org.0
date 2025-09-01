Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF4BB3E0C1
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 12:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A813210E41D;
	Mon,  1 Sep 2025 10:59:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="RpaGy4XL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A4AF10E422
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 10:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=b8jTxoxu6fM2YyVPoK/aAvaCJ5ksiaw3bZKSjKUEM/U=; b=RpaGy4XLA2c8YZbgeSDDso6S1v
 Oq+FsFM7XHisXgM9rW4mmHd7SdV6y32fbWlLjPI0RAygFIsPgPoNluuqQZNVroLT/F2auR68tNQ4Y
 tiFfd+Dvh6V+OKoRhvvhyTTOmD3Bv9hdYlxB496hP52VeyuFbv5NTQOkwlXef959spGX2yfhCzNfx
 sb8GcCicl0XC1MJ5GHahwYid1616J5X2RvY35RwumHQsoDxueaks1SRe2oZJc/DtHriO5UQZP0xfz
 DrphtNNohbV6b9/EXMt+SoT1VWC1fy+LCtWlVB60NP6CE/Eez7CjZ0pZWPSgxz+KN5AhY66C73Gux
 zLLCRaVQ==;
Received: from i53875a2d.versanet.de ([83.135.90.45] helo=phil..)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1ut2G3-0001WA-HP; Mon, 01 Sep 2025 12:59:31 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: dmitry.baryshkov@oss.qualcomm.com,
	Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>, hjc@rock-chips.com, mripard@kernel.org,
 naoki@radxa.com, stephen@radxa.com, cristian.ciocaltea@collabora.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 yubing.zhang@rock-chips.com, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh@kernel.org,
 sebastian.reichel@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: (subset) [PATCH v7 00/10] Add support for RK3588 DisplayPort
 Controller
Date: Mon,  1 Sep 2025 12:59:27 +0200
Message-ID: <175672432555.3612134.264758265580488174.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250822063959.692098-1-andyshrk@163.com>
References: <20250822063959.692098-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Fri, 22 Aug 2025 14:39:44 +0800, Andy Yan wrote:
> There are two DW DPTX based DisplayPort Controller on rk3588 which
> are compliant with the DisplayPort Specification Version 1.4 with
> the following features:
> 
> * DisplayPort 1.4a
> * Main Link: 1/2/4 lanes
> * Main Link Support 1.62Gbps, 2.7Gbps, 5.4Gbps and 8.1Gbps
> * AUX channel 1Mbps
> * Single Stream Transport(SST)
> * Multistream Transport (MST)
> * Type-C support (alternate mode)
> * HDCP 2.2, HDCP 1.3
> * Supports up to 8/10 bits per color component
> * Supports RBG, YCbCr4:4:4, YCbCr4:2:2, YCbCr4:2:0
> * Pixel clock up to 594MHz
> * I2S, SPDIF audio interface
> 
> [...]

Applied, thanks!

[07/10] arm64: dts: rockchip: Add DP0 for rk3588
        commit: 8c239f24341ab9ac75992a0a3c32bb8cddf48a20
[08/10] arm64: dts: rockchip: Add DP1 for rk3588
        commit: 445e4ac0d85821904b3f2bee410def4181987c4e
[09/10] arm64: dts: rockchip: Enable DisplayPort for rk3588s Cool Pi 4B
        commit: 1b242cafdfc4bc7d43ed9147cbffe5480632f661
[10/10] arm64: dts: rockchip: Enable DP2HDMI for ROCK 5 ITX
        commit: df02252f271b4fa50c7087a0e6f5a7d7ed2f1dcc

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
