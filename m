Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F02D75ABE5
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 12:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D68D510E59E;
	Thu, 20 Jul 2023 10:26:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv01.abscue.de (abscue.de
 [IPv6:2a03:4000:63:bf5:4817:8eff:feeb:8ac7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2308B10E58B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 10:26:21 +0000 (UTC)
Received: from srv01.abscue.de (localhost [127.0.0.1])
 by spamfilter.srv.local (Postfix) with ESMTP id 26B301C013E;
 Thu, 20 Jul 2023 12:26:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on abscue.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
 autolearn_force=no version=4.0.0
Received: from fluffy-mammal.speedport.ip
 (p200300f3cf161c42146c2050e1f73be6.dip0.t-ipconnect.de
 [IPv6:2003:f3:cf16:1c42:146c:2050:e1f7:3be6])
 by srv01.abscue.de (Postfix) with ESMTPSA id B05AA1C013D;
 Thu, 20 Jul 2023 12:26:18 +0200 (CEST)
From: =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/tiny: panel-mipi-dbi: Allow sharing the D/C GPIO
Date: Thu, 20 Jul 2023 12:26:05 +0200
Message-Id: <20230720102605.67805-3-otto.pflueger@abscue.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230720102605.67805-1-otto.pflueger@abscue.de>
References: <20230720102605.67805-1-otto.pflueger@abscue.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Displays that are connected to the same SPI bus may share the D/C GPIO.
Use GPIOD_FLAGS_BIT_NONEXCLUSIVE to allow access to the same GPIO for
multiple panel-mipi-dbi instances. Exclusive access to the GPIO during
transfers is ensured by the locking in drm_mipi_dbi.c.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
 drivers/gpu/drm/tiny/panel-mipi-dbi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/panel-mipi-dbi.c b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
index eb9f13f18a02..e616e3890043 100644
--- a/drivers/gpu/drm/tiny/panel-mipi-dbi.c
+++ b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
@@ -307,7 +307,8 @@ static int panel_mipi_dbi_spi_probe(struct spi_device *spi)
 	if (IS_ERR(dbi->reset))
 		return dev_err_probe(dev, PTR_ERR(dbi->reset), "Failed to get GPIO 'reset'\n");
 
-	dc = devm_gpiod_get_optional(dev, "dc", GPIOD_OUT_LOW);
+	dc = devm_gpiod_get_optional(dev, "dc",
+				     GPIOD_OUT_LOW | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
 	if (IS_ERR(dc))
 		return dev_err_probe(dev, PTR_ERR(dc), "Failed to get GPIO 'dc'\n");
 
-- 
2.39.1
