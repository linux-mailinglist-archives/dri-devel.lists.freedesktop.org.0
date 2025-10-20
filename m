Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E57C5BEFEA9
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 10:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4255410E31C;
	Mon, 20 Oct 2025 08:26:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="rDUON071";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C1510E313
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 08:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
 bh=CSwYSi0Xsz6tuPWeN+n3HczJ/oB9p6CTq0FVpTz/uaI=; b=rDUON071VRbe/08gmHCk5RdYAL
 xRLUZXgv4qI3q0MXbZaqLw0BDKEq35NvtlrTQPtKZIOhDFr2tsQ4DGIoPim3KWPIy2n/2QUJkblGA
 ZwYWKGFjcpTIt0gk4TAXd7vmPxOGdztVOH+5fxFjl8RS8oRrEOLMEBjLlbtloxGotqXlevqEQUzKI
 mM3Hnn4lCdtV5iDEaJEcixDmmeCHOJXZeHN6RZXUH/s5VKOa+NtoTE5JrNhZ2yd4i6maSYYVK7H6Q
 Bg/wiwNNONUN1IB74uWCGHV1Xo/N8QPvbVST/IGKwqJCQpO9w9eUcw01sML9idmV4brpV9KxG8VBg
 tpGXMCyQ==;
Received: from [141.76.253.240] (helo=phil.eduroam.local)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vAlCy-00078O-U0; Mon, 20 Oct 2025 10:25:36 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quentin.schulz@cherry.de, andy.yan@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, cn.liweihao@gmail.com,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 3/9] soc: rockchip: grf: Add select correct PWM implementation
 on RK3368
Date: Mon, 20 Oct 2025 10:25:02 +0200
Message-ID: <20251020082508.3636511-4-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251020082508.3636511-1-heiko@sntech.de>
References: <20251020082508.3636511-1-heiko@sntech.de>
MIME-Version: 1.0
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

Similar to the RK3288, the RK3368 has two different implementations of
the PWM block inside the soc - the newer one that we have a driver for
and that is used on every soc and a previous variant that was likely
left as a fallback if the new one creates problems.

The devicetree already is set up for the new variant, so make sure
we actually use it - similar to the RK3288.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 drivers/soc/rockchip/grf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/rockchip/grf.c b/drivers/soc/rockchip/grf.c
index 344870da7675..963cdea01ce7 100644
--- a/drivers/soc/rockchip/grf.c
+++ b/drivers/soc/rockchip/grf.c
@@ -91,6 +91,7 @@ static const struct rockchip_grf_info rk3328_grf __initconst = {
 
 static const struct rockchip_grf_value rk3368_defaults[] __initconst = {
 	{ "jtag switching", RK3368_GRF_SOC_CON15, FIELD_PREP_WM16_CONST(BIT(13), 0) },
+	{ "pwm select", RK3368_GRF_SOC_CON15, FIELD_PREP_WM16_CONST(BIT(12), 1) },
 };
 
 static const struct rockchip_grf_info rk3368_grf __initconst = {
-- 
2.47.2

