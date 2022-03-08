Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 037ED4D1CC7
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 17:08:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D6010E2CA;
	Tue,  8 Mar 2022 16:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD0210E2CA
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 16:08:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 38901616FC;
 Tue,  8 Mar 2022 16:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80638C340EB;
 Tue,  8 Mar 2022 16:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646755690;
 bh=AwGaASbjETpK4nZOLdxXknvHFDS1cXriyWuhbix2BOk=;
 h=From:To:Cc:Subject:Date:From;
 b=JlxmXyQ9i/uGi0mTu813EeOoGwxorHisDmVWJfzihVN11unNsKANxpRCwBckMo6gW
 sXLRmNW3acloiyou9mrGKIVE8CiB8nZUr4x+8rL7if3ub81ceppqk+G4k5+B17zeOQ
 xlgz7694bABrbOy9AjSb69nCxLoHAVywwAPLixwKXaGYb9L87F1NtQwYi0+giYTOO8
 +LP3xq5VijPw++S1MGE3Dk1DD/URryU2xbplfs/Bw7+k0Yug82x/lMtQCy3ylyvCoD
 tL3pToQoFJhM5s5x4zmsDoudb6QR0hwniUDARx2UGCCjOPq4a6wGWH8fjyBIFep2Xm
 OsLtUGYL00GfQ==
Received: by wens.tw (Postfix, from userid 1000)
 id 334BC5FC3B; Wed,  9 Mar 2022 00:08:08 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/2] drm: ssd130x: Fix COM scan direction register mask
Date: Wed,  9 Mar 2022 00:07:57 +0800
Message-Id: <20220308160758.26060-1-wens@kernel.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Chen-Yu Tsai <wens@csie.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chen-Yu Tsai <wens@csie.org>

The SSD130x's command to toggle COM scan direction uses bit 3 and only
bit 3 to set the direction of the scanout. The driver has an incorrect
GENMASK(3, 2), causing the setting to be set on bit 2, rendering it
ineffective.

Fix the mask to only bit 3, so that the requested setting is applied
correctly.

Fixes: a61732e80867 ("drm: Add driver for Solomon SSD130x OLED displays")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/gpu/drm/solomon/ssd130x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index ce4dc20412e0..ccd378135589 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -61,7 +61,7 @@
 #define SSD130X_SET_COM_PINS_CONFIG		0xda
 #define SSD130X_SET_VCOMH			0xdb
 
-#define SSD130X_SET_COM_SCAN_DIR_MASK		GENMASK(3, 2)
+#define SSD130X_SET_COM_SCAN_DIR_MASK		GENMASK(3, 3)
 #define SSD130X_SET_COM_SCAN_DIR_SET(val)	FIELD_PREP(SSD130X_SET_COM_SCAN_DIR_MASK, (val))
 #define SSD130X_SET_CLOCK_DIV_MASK		GENMASK(3, 0)
 #define SSD130X_SET_CLOCK_DIV_SET(val)		FIELD_PREP(SSD130X_SET_CLOCK_DIV_MASK, (val))
-- 
2.34.1

