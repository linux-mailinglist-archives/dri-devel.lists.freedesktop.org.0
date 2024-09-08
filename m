Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 830A997083D
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 16:55:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E565910E28A;
	Sun,  8 Sep 2024 14:55:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kwiboo.se header.i=@kwiboo.se header.b="dDz0Rd+y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9006D10E28B
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 14:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1725807332; bh=s4d/+ThRHSQtfU43RCtR36kOGQZWrroV7EpFOhfrkPA=;
 b=dDz0Rd+ysMJo7E7Mp/8ntt1o7OUMS97maozuVK800alL0C7nalo7oYo02BiBtmFvibztL0h6V
 0esFL6jjvePN3SxQgMjohPvX5NV3d38QJK9IDb1i5UFay1F7LoC6+x+V1BETArYs4QwFf6nyIWD
 jI7G/S2TDMp46puwgyQdgt5YoEOQDJrvVGLifkIOXsbFcZGwwCGSVfzd6FaB18cA/uvmNM/uf44
 A2xHypv3Vitpof6yldLNUz4pzBxitCaky3kOcq1x1LTHKyKf0UTnaAZcC483yTgP26gUqcAFV0Q
 nGJsENbQ/8W/7x4XwcR24/2fHGDKD8sfEHsUqXIkyv9Q==
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Diederik de Haas <didi.debian@cknow.org>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v2 2/7] drm/rockchip: dw_hdmi: Adjust cklvl & txlvl for RF/EMI
Date: Sun,  8 Sep 2024 14:54:59 +0000
Message-ID: <20240908145511.3331451-3-jonas@kwiboo.se>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240908145511.3331451-1-jonas@kwiboo.se>
References: <20240908145511.3331451-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 66ddbadf3c9877b459588e98
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

From: Yakir Yang <ykk@rock-chips.com>

Dut to the high HDMI signal voltage driver, Mickey have meet
a serious RF/EMI problem, so we decided to reduce HDMI signal
voltage to a proper value.

The default params for phy is cklvl = 20 & txlvl = 13 (RF/EMI failed)
  ck: lvl = 13, term=100, vlo = 2.71, vhi=3.14, vswing = 0.43
  tx: lvl = 20, term=100, vlo = 2.81, vhi=3.16, vswing = 0.35

1. We decided to reduce voltage value to lower, but VSwing still
keep high, RF/EMI have been improved but still failed.
   ck: lvl =  6, term=100, vlo = 2.61, vhi=3.11, vswing = 0.50
   tx: lvl =  6, term=100, vlo = 2.61, vhi=3.11, vswing = 0.50

2. We try to keep voltage value and vswing both lower, then RF/EMI
test all passed  ;)
   ck: lvl = 11, term= 66, vlo = 2.68, vhi=3.09, vswing = 0.40
   tx: lvl = 11, term= 66, vlo = 2.68, vhi=3.09, vswing = 0.40
When we back to run HDMI different test and single-end test, we see
different test passed, but signle-end test failed. The oscilloscope
show that simgle-end clock's VL value is 1.78v (which remind LowLimit
should not lower then 2.6v).

3. That's to say there are some different between PHY document and
measure value. And according to experiment 2 results, we need to
higher clock voltage and lower data voltage, then we can keep RF/EMI
satisfied and single-end & differen test passed.
  ck: lvl =  9, term=100, vlo = 2.65, vhi=3.12, vswing = 0.47
  tx: lvl = 16, term=100, vlo = 2.75, vhi=3.15, vswing = 0.39

Signed-off-by: Yakir Yang <ykk@rock-chips.com>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v2: No change
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 36cc700766fd..fc5e87285a91 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -202,7 +202,7 @@ static const struct dw_hdmi_curr_ctrl rockchip_cur_ctr[] = {
 static const struct dw_hdmi_phy_config rockchip_phy_config[] = {
 	/*pixelclk   symbol   term   vlev*/
 	{ 74250000,  0x8009, 0x0004, 0x0272},
-	{ 148500000, 0x802b, 0x0004, 0x028d},
+	{ 165000000, 0x802b, 0x0004, 0x0209},
 	{ 297000000, 0x8039, 0x0005, 0x028d},
 	{ ~0UL,	     0x0000, 0x0000, 0x0000}
 };
-- 
2.46.0

