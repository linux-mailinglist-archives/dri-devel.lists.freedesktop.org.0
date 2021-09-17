Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE3540F35A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 09:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE07B6EC09;
	Fri, 17 Sep 2021 07:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 860 seconds by postgrey-1.36 at gabe;
 Fri, 17 Sep 2021 07:37:07 UTC
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95226EC09
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 07:37:07 +0000 (UTC)
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
 by twspam01.aspeedtech.com with ESMTP id 18H72m6Q030533
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 15:02:48 +0800 (GMT-8)
 (envelope-from kuohsiang_chou@aspeedtech.com)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 18H72ZTG030518;
 Fri, 17 Sep 2021 15:02:35 +0800 (GMT-8)
 (envelope-from kuohsiang_chou@aspeedtech.com)
Received: from localhost.localdomain.com (192.168.2.142) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 17 Sep 2021 15:22:34 +0800
From: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
To: <tzimmermann@suse.de>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: <airlied@redhat.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <jenmin_yuan@aspeedtech.com>, <kuohsiang_chou@aspeedtech.com>,
 <arc_sung@aspeedtech.com>
Subject: [PATCH] drm/ast: Atomic CR/SR reg R/W
Date: Fri, 17 Sep 2021 15:22:26 +0800
Message-ID: <20210917072226.17357-1-kuohsiang_chou@aspeedtech.com>
X-Mailer: git-send-email 2.18.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.2.142]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 18H72ZTG030518
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

1. Avoid IO-index racing
2. IO-index racing happened on resolustion switching
   and mouse moving at the same time
3. System hung while IO-index racing occurred.

Signed-off-by: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
---
 drivers/gpu/drm/ast/ast_main.c | 48 +++++++++++++++++++++++++---------
 1 file changed, 36 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 79a361867..1d8fa70c5 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -41,28 +41,52 @@ void ast_set_index_reg_mask(struct ast_private *ast,
 			    uint32_t base, uint8_t index,
 			    uint8_t mask, uint8_t val)
 {
-	u8 tmp;
-	ast_io_write8(ast, base, index);
-	tmp = (ast_io_read8(ast, base + 1) & mask) | val;
-	ast_set_index_reg(ast, base, index, tmp);
+	uint16_t volatile usData;
+	uint8_t  volatile jData;
+
+	do {
+		ast_io_write8(ast, base, index);
+		usData = ast_io_read16(ast, base);
+	} while ((uint8_t)(usData) != index);
+
+	jData  = (uint8_t)(usData >> 8);
+	jData &= mask;
+	jData |= val;
+	usData = ((uint16_t) jData << 8) | (uint16_t) index;
+	ast_io_write16(ast, base, usData);
 }

 uint8_t ast_get_index_reg(struct ast_private *ast,
 			  uint32_t base, uint8_t index)
 {
-	uint8_t ret;
-	ast_io_write8(ast, base, index);
-	ret = ast_io_read8(ast, base + 1);
-	return ret;
+	uint16_t volatile usData;
+	uint8_t  volatile jData;
+
+	do {
+		ast_io_write8(ast, base, index);
+		usData = ast_io_read16(ast, base);
+	} while ((uint8_t)(usData) != index);
+
+	jData  = (uint8_t)(usData >> 8);
+
+	return jData;
 }

 uint8_t ast_get_index_reg_mask(struct ast_private *ast,
 			       uint32_t base, uint8_t index, uint8_t mask)
 {
-	uint8_t ret;
-	ast_io_write8(ast, base, index);
-	ret = ast_io_read8(ast, base + 1) & mask;
-	return ret;
+	uint16_t volatile usData;
+	uint8_t  volatile jData;
+
+	do {
+		ast_io_write8(ast, base, index);
+		usData = ast_io_read16(ast, base);
+	} while ((uint8_t)(usData) != index);
+
+	jData  = (uint8_t)(usData >> 8);
+	jData &= mask;
+
+	return jData;
 }

 static void ast_detect_config_mode(struct drm_device *dev, u32 *scu_rev)
--
2.18.4

