Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C565C4104B7
	for <lists+dri-devel@lfdr.de>; Sat, 18 Sep 2021 09:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 565136E0DB;
	Sat, 18 Sep 2021 07:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 429 seconds by postgrey-1.36 at gabe;
 Sat, 18 Sep 2021 03:58:39 UTC
Received: from qq.com (smtpbg465.qq.com [59.36.132.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59886E0D5
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Sep 2021 03:58:39 +0000 (UTC)
X-QQ-mid: bizesmtp44t1631937068tuf7vu0i
Received: from localhost.localdomain (unknown [124.126.19.250])
 by esmtp6.qq.com (ESMTP) with 
 id ; Sat, 18 Sep 2021 11:51:06 +0800 (CST)
X-QQ-SSF: 0140000000000050D000000B0000000
X-QQ-FEAT: OKkEFpVJhAgeOo+4wBV1a8svT7hEZbnr9Q8DIBXJHVG4F7VfEjlVBvIJQ4rhj
 iOeinhXzceJDjLrohQuz6dsPqstmrPfiWgPEEqh8CvsUG7WX2kGTUc8RbcBruycYeJlrU6W
 cJ9xE1JAtkTDpQlcPLUVnGNEkYO0tOkdfHZdUgxel2PPeuwe+ogreu0IUW0OIaHyOe+NfM3
 rBs4pWIA73WDPrqlUVnkXRz+xu04nQsevwwp4SIa99f4oAMFR1Lg9KeMi4XrjIngnrcfgbb
 QjxLe5XY0w8/WO8R9ul/+/wsDafr6f9tmQ9Nw2NRpAF/QflMyvS3IAw9f4R/bdLO5sXOvnv
 dSS5fIa7eTqRPDxAYX72gqdP/MIYA==
X-QQ-GoodBg: 1
From: Yunlongli <liyunlonga@uniontech.com>
To: ple@baylibre.com, narmstrong@baylibre.com, a.hajda@samsung.com,
 robert.foss@linaro.org, airlied@linux.ie, daniel@ffwll.ch
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, liyunlonga@uniontech.com
Subject: [PATCH] drm: bridge: it66121: Added it66121 chip external screen
 status judgment.
Date: Sat, 18 Sep 2021 11:50:41 +0800
Message-Id: <20210918035041.25512-1-liyunlonga@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Sat, 18 Sep 2021 07:25:35 +0000
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

fix: Add further confirm if external screens are involved.

log: In the actual tests,  the IT66121 chip sometimes misjudged whether
     it had an external screen, so, reference the it66121_user_guid.pdf
     about Audio/Video data is stable or not A typical initialization
     of HDMI link should be based on interrupt signal and appropriate
     register probing. Recommended flow is detailed in IT66121
     Programming Guide. Simply put, the microcontroller should monitor
     the HPD status first. Upon valid HPD event, move on to check
     RxSENDetect register to see if the receiver chip is ready for
     further handshaking. When RxSENDetect is asserted, start reading EDID
     data through DDC channels and carry on the rest of the handshaking
     subsequently.If the micro-controller makes no use of the interrupt
     signal as well as the above-mentioned status  registers, the link
     establishment might fail. Please do follow the suggested
     initialization flow recommended in IT66121 Programming Guide.
     So, I add the IT66121_SYS_STATUS_SENDECTECT register status detection.

Signed-off-by: Yunlongli <liyunlonga@uniontech.com>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 2f2a09adb4bc..9ed4fa298d11 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -523,7 +523,7 @@ static bool it66121_is_hpd_detect(struct it66121_ctx *ctx)
 	if (regmap_read(ctx->regmap, IT66121_SYS_STATUS_REG, &val))
 		return false;
 
-	return val & IT66121_SYS_STATUS_HPDETECT;
+	return ((val & IT66121_SYS_STATUS_HPDETECT) && (val & IT66121_SYS_STATUS_SENDECTECT));
 }
 
 static int it66121_bridge_attach(struct drm_bridge *bridge,
-- 
2.20.1



