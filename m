Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6614D398FB8
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 18:16:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525CE6E4C1;
	Wed,  2 Jun 2021 16:15:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Wed, 02 Jun 2021 16:15:55 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608206E4C1
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 16:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1622650556; x=1654186556;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=2gw1LPRHVc5WHx/TLUSAc36JsiCrmgOgMOSM1MRoLSY=;
 b=HLy2vTS6QT2AQMkY3HiN/usiLkZP/nE8mlIvKABtM3oRXJiuM0u+ocxl
 4stDBBjEUFCV+jhW/ek7UsYlDEEIPNoE6W2y5F18O5LGDrgDPKCcfDOyA
 ZOtkkwDTTokW2GSW6Yv35H77PRFiFV5Yx5VQpfT6FTWfN3E2SXBUnr/d5
 Gs6fJDgF/qaqhiUAVOVu4jPWBBzU3n7+s5De/UharMHJDUK54PyhUW4MC
 iFrrJzMcFvDaUsbIExQOnVm/04/X55MOdh1+YXS0mvxO3hWUbT/cbJQSo
 tjBs69v/N/aLcgG0jCuLXCLzGl44Tof0l/HFzZqlDbo+r7hanQoqeDNic g==;
IronPort-SDR: fJiU9Iv86kQyanaDFZQyhjRa8bUG5TM9OX4uwRTFTY4U4xePJz7dC+7cj0ucEJtr5azJXzPgpr
 cXICT7dlLL7+b/nsP2OdA8Ownbf6Or2W8Ajj1clbzklh7yikbLAHBpAxb0yrGe6sZajb00QNpa
 UsXfhl8eVkmBanvrXP7G+2UNrxfPM0WxevgJzOLPilxgS8cpFa6JHeHEXyb+c/mv/1p5MrD/1g
 vq6NrAQnOoHuyCW+qWbDovmqVVatfT5f8XGHZZRLXYadvXgTt3a+4BvZ+IOS5XzYym9TcnMcfX
 5Fo=
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="123275472"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Jun 2021 09:08:48 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 2 Jun 2021 09:08:47 -0700
Received: from dan-linux.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Wed, 2 Jun 2021 09:08:47 -0700
From: Dan Sneddon <dan.sneddon@microchip.com>
To: Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm:atmel: Enable the crtc vblank prior to crtc usage.
Date: Wed, 2 Jun 2021 09:08:45 -0700
Message-ID: <20210602160846.5013-1-dan.sneddon@microchip.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>, David Airlie <airlied@linux.ie>,
 Dan Sneddon <dan.sneddon@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

'commit eec44d44a3d2 ("drm/atmel: Use drm_atomic_helper_commit")'
removed the home-grown handling of atomic commits and exposed an issue
in the crtc atomic commit handling where vblank is expected to be
enabled but hasn't yet, causing kernel warnings during boot.  This patch
cleans up the crtc vblank handling thus removing the warning on boot.

Fixes: eec44d44a3d2 ("drm/atmel: Use drm_atomic_helper_commit")

Signed-off-by: Dan Sneddon <dan.sneddon@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index 05ad75d155e8..cfe4fc69277e 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -232,7 +232,6 @@ static void atmel_hlcdc_crtc_atomic_enable(struct drm_crtc *c,
 
 	pm_runtime_put_sync(dev->dev);
 
-	drm_crtc_vblank_on(c);
 }
 
 #define ATMEL_HLCDC_RGB444_OUTPUT	BIT(0)
@@ -343,8 +342,17 @@ static int atmel_hlcdc_crtc_atomic_check(struct drm_crtc *c,
 
 static void atmel_hlcdc_crtc_atomic_begin(struct drm_crtc *c,
 					  struct drm_atomic_state *state)
+{
+	drm_crtc_vblank_on(c);
+}
+
+static void atmel_hlcdc_crtc_atomic_flush(struct drm_crtc *c,
+					  struct drm_atomic_state *state)
 {
 	struct atmel_hlcdc_crtc *crtc = drm_crtc_to_atmel_hlcdc_crtc(c);
+	unsigned long flags;
+
+	spin_lock_irqsave(&c->dev->event_lock, flags);
 
 	if (c->state->event) {
 		c->state->event->pipe = drm_crtc_index(c);
@@ -354,12 +362,7 @@ static void atmel_hlcdc_crtc_atomic_begin(struct drm_crtc *c,
 		crtc->event = c->state->event;
 		c->state->event = NULL;
 	}
-}
-
-static void atmel_hlcdc_crtc_atomic_flush(struct drm_crtc *crtc,
-					  struct drm_atomic_state *state)
-{
-	/* TODO: write common plane control register if available */
+	spin_unlock_irqrestore(&c->dev->event_lock, flags);
 }
 
 static const struct drm_crtc_helper_funcs lcdc_crtc_helper_funcs = {
-- 
2.17.1

