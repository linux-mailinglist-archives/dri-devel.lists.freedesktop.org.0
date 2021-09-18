Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2B84104BA
	for <lists+dri-devel@lfdr.de>; Sat, 18 Sep 2021 09:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FF56E0E4;
	Sat, 18 Sep 2021 07:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 430 seconds by postgrey-1.36 at gabe;
 Sat, 18 Sep 2021 04:02:54 UTC
Received: from qq.com (smtpbg429.qq.com [183.3.255.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90C16E0D5
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Sep 2021 04:02:54 +0000 (UTC)
X-QQ-mid: bizesmtp47t1631937327txlrmwdz
Received: from localhost.localdomain (unknown [124.126.19.250])
 by esmtp6.qq.com (ESMTP) with 
 id ; Sat, 18 Sep 2021 11:55:25 +0800 (CST)
X-QQ-SSF: 0140000000000050D000000B0000000
X-QQ-FEAT: 1eo3oJ4iu3CXzawabx1UThWMAM5nZaz0mhKymUHU66ZwBk56u4Q5GYrIrIqDj
 TgbXcwb95umOfEWUQTkcGmAZra8MKPmAFqjmAj+Y6QGX0obMiTKxTtRY9caq8O6JIlMXIDz
 VTHB78lW81+4XIYH3Qohl2+e2YvHu38/o5lylQNoIHPMsuQsy9MxWZFFIraxTF++lUo1jia
 3HMsObmwEnvrYsSiN6s3J6397G/m9hrBl+dJVxiuWST46tauUxOqS+4p5iNAwC7FpRzgjIl
 L3q83tZyN8TWFEMYGURZXh0mFcwTaaRVs1xTMUd6h0Hk3OQf/bZ9euE6sDA/jddPMW9dzUi
 P3zH3YqnqqR55JzFgFfP+Uc1Wnve0sumzm56MoS
X-QQ-GoodBg: 1
From: Yunlongli <liyunlonga@uniontech.com>
To: ple@baylibre.com, narmstrong@baylibre.com, a.hajda@samsung.com,
 robert.foss@linaro.org, airlied@linux.ie, daniel@ffwll.ch
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, liyunlonga@uniontech.com
Subject: [PATCH] drm: bridge: it66121: Added it66121 chip external screen
 status judgment.
Date: Sat, 18 Sep 2021 11:55:02 +0800
Message-Id: <20210918035502.26486-1-liyunlonga@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign7
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



