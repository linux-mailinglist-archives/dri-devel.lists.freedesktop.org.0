Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B719D909941
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2024 19:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 595D210E0D7;
	Sat, 15 Jun 2024 17:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kwiboo.se header.i=@kwiboo.se header.b="AAfyi5xO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8100610E280
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 17:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1718471748; bh=edw+pFynRH27QoyX9zOhxiRHTMZh2GXeD3zDbH9aM0s=;
 b=AAfyi5xOU9HR7BcRNkHuvUq6LmQOg6WNpqGps4Gy9a+YUhxuJc/Jpc8OGh0poBOTFSQNWJNpF
 +gl29NuTC7Lg4sqvbPy74yLdRUzOL8ucBuALxT3peLCO1zpYLcyD41C1I3EJfW9NCe9R0S0IftM
 oTr43U5685XJ16oF60ShORYULDEzvUNcupOm6PU3OGHIvUOasYG70aU/O/sXpneRWIxcz9dSJEm
 kpyrA4HEqBd83oDVSGYKVPfpLSQ4Q0cyOjyYuffWF/uAYD69BFTRjsm08FyIOOgQiQjFXFVLhSo
 vcF7/n8WK1AB85YRDgtpwjAIqh3f7/eZ/aaMfA0D+7ZQ==
From: Jonas Karlman <jonas@kwiboo.se>
To: dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 "=?UTF-8?q?Heiko=20St=C3=BCbner?=" <heiko@sntech.de>, Andy Yan
 <andy.yan@rock-chips.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Jonas
 Karlman <jonas@kwiboo.se>, Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH 08/13] drm/rockchip: dw_hdmi: Adjust cklvl & txlvl for RF/EMI
Date: Sat, 15 Jun 2024 17:03:59 +0000
Message-ID: <20240615170417.3134517-9-jonas@kwiboo.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240615170417.3134517-1-jonas@kwiboo.se>
References: <20240615170417.3134517-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 666dc9bc24e0254b39804063
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
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 4acf73b5692a..205cfe02079f 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -204,7 +204,7 @@ static const struct dw_hdmi_curr_ctrl rockchip_cur_ctr[] = {
 static const struct dw_hdmi_phy_config rockchip_phy_config[] = {
 	/*pixelclk   symbol   term   vlev*/
 	{ 74250000,  0x8009, 0x0004, 0x0272},
-	{ 148500000, 0x802b, 0x0004, 0x028d},
+	{ 165000000, 0x802b, 0x0004, 0x0209},
 	{ 297000000, 0x8039, 0x0005, 0x028d},
 	{ ~0UL,	     0x0000, 0x0000, 0x0000}
 };
-- 
2.45.2

