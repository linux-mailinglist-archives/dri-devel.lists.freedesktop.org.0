Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 788C470B298
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 02:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E3710E221;
	Mon, 22 May 2023 00:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408FF10E221
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 00:45:29 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2105184658;
 Mon, 22 May 2023 02:45:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1684716326;
 bh=M6osm2r9KOnQhGuND4VAlRoKkJDyNDkqmaw9NQH4kHg=;
 h=From:To:Cc:Subject:Date:From;
 b=dK3zdp1cetELcv/QB5Cb7DrFCDxYLK/sfRO5R2UI1AYt6gS5s2908Ygpq0cZ0mrNM
 loQfvoJASzhaKNrgM+iuSJIZhPHkRvdarI6J128ScmT0GD4HTKFJO9PL4LJCRbWXgJ
 KGp+ZTOtecGwyWOADMSgUqSlEjA+QQWLSqaDQhmT2YGZ0GglIwHad0C44H6MAaNOFZ
 OalrHg2hT1K7xD/YUWkVvtUmS98a9pFJ5/mbsNLWy5TDUETwscLuHZT1W/mogpA0jP
 Y3QRC4mC1oAt34I4WVq3+OMv0nXxKWxYIPWJMOrGTZpzkjqvUixAG8ghCO30DM9KRr
 +MEdio30K9XTQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm] modetest: Try and open device using drmOpenDevice first
Date: Mon, 22 May 2023 02:45:13 +0200
Message-Id: <20230522004513.168431-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This way, it is possible to use modetest -D to specify a card in /dev/dri/cardN
which is esp. useful on systems which have multiple cards, with identical modules
and where it is otherwise impossible to discern the different cards via drmOpen().
One such example is i.MX8M Plus, which has three such cards, one for DSI, one for
LVDS, and one for HDMI.

Signed-off-by: Marek Vasut <marex@denx.de>
---
 tests/util/kms.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/util/kms.c b/tests/util/kms.c
index 34a84180..31087522 100644
--- a/tests/util/kms.c
+++ b/tests/util/kms.c
@@ -38,6 +38,7 @@
  */
 
 #include <errno.h>
+#include <fcntl.h>
 #include <stdint.h>
 #include <stdio.h>
 #include <stdlib.h>
@@ -142,6 +143,16 @@ int util_open(const char *device, const char *module)
 	} else {
 		unsigned int i;
 
+		printf("trying to open device '%s'...", device);
+
+		fd = open(device, O_RDWR | O_CLOEXEC);
+		if (fd < 0) {
+			printf("failed\n");
+		} else {
+			printf("done\n");
+			return fd;
+		}
+
 		for (i = 0; i < ARRAY_SIZE(modules); i++) {
 			printf("trying to open device '%s'...", modules[i]);
 
-- 
2.39.2

