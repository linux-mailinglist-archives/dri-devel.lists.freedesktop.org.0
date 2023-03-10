Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 259B86B470F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 15:48:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0754610E909;
	Fri, 10 Mar 2023 14:48:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B7810E909
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 14:48:29 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-176b48a9a05so6139665fac.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 06:48:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678459709;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5ABh9MagjDNyGivJ3oT/1DUZHeIg4J1qNxCI1uEPy4Q=;
 b=16M6Ovc241YFlx2ROybEHZEnhOuiJ68bKYnM7vSt3M5t2Ry/RMgH1f4gcw2rf+SmYq
 j6UNKsW3WThuWan784jkKX0zECcJgBD2nKzyJs+Df0X6i3mpDKwznDVV2ZpvZ2D8Mpdp
 tZ07ax5me/PzOnEWNzLps1gkIehnoDqcS+FrUkFMCjgb0rce3c43UBFHQIPfiX1wMUUY
 v3xGd3brr5i/OYnvww8af/cf2g0UA9pIu95C5iJeIL+URlTWMgBskECAO4f+dLIpOgBa
 LtTNBRtKbsPIYrLgmSQS5vrkXY4JC89JYH3hHCTwjWm5asayHT08oM39WinRFRbaAsKI
 sdag==
X-Gm-Message-State: AO0yUKXce+dzEklanoMP1d1LN8GNjwpGLpj8E2T4q9uJeucC2Im3i4kC
 umWHI+KjzaFv4KlNLcLkmw==
X-Google-Smtp-Source: AK7set/3qtl4P82g+jyKy/zqrO1gocYbHRAq7O166an25I6PVtSxchhQQDghw8aD3mFYHy2oBhVb6g==
X-Received: by 2002:a05:6870:a68c:b0:16e:8d40:b5ec with SMTP id
 i12-20020a056870a68c00b0016e8d40b5ecmr16859362oam.50.1678459708772; 
 Fri, 10 Mar 2023 06:48:28 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 z21-20020a056870515500b001728d38a41asm71779oak.55.2023.03.10.06.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 06:48:28 -0800 (PST)
Received: (nullmailer pid 1545988 invoked by uid 1000);
 Fri, 10 Mar 2023 14:47:29 -0000
From: Rob Herring <robh@kernel.org>
To: Russell King <linux@armlinux.org.uk>, Helge Deller <deller@gmx.de>
Subject: [PATCH] fbdev: Use of_property_present() for testing DT property
 presence
Date: Fri, 10 Mar 2023 08:47:29 -0600
Message-Id: <20230310144729.1545943-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is preferred to use typed property access functions (i.e.
of_property_read_<type> functions) rather than low-level
of_get_property/of_find_property functions for reading properties. As
part of this, convert of_get_property/of_find_property calls to the
recently added of_property_present() helper when we just want to test
for presence of a property and nothing more.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/video/fbdev/amba-clcd.c                          | 2 +-
 drivers/video/fbdev/bw2.c                                | 2 +-
 drivers/video/fbdev/cg3.c                                | 2 +-
 drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/amba-clcd.c b/drivers/video/fbdev/amba-clcd.c
index f65c96d1394d..e45338227be6 100644
--- a/drivers/video/fbdev/amba-clcd.c
+++ b/drivers/video/fbdev/amba-clcd.c
@@ -854,7 +854,7 @@ static struct clcd_board *clcdfb_of_get_board(struct amba_device *dev)
 	board->caps = CLCD_CAP_ALL;
 	board->check = clcdfb_check;
 	board->decode = clcdfb_decode;
-	if (of_find_property(node, "memory-region", NULL)) {
+	if (of_property_present(node, "memory-region")) {
 		board->setup = clcdfb_of_vram_setup;
 		board->mmap = clcdfb_of_vram_mmap;
 		board->remove = clcdfb_of_vram_remove;
diff --git a/drivers/video/fbdev/bw2.c b/drivers/video/fbdev/bw2.c
index 6403ae07970d..9cbadcd18b25 100644
--- a/drivers/video/fbdev/bw2.c
+++ b/drivers/video/fbdev/bw2.c
@@ -306,7 +306,7 @@ static int bw2_probe(struct platform_device *op)
 	if (!par->regs)
 		goto out_release_fb;
 
-	if (!of_find_property(dp, "width", NULL)) {
+	if (!of_property_present(dp, "width")) {
 		err = bw2_do_default_mode(par, info, &linebytes);
 		if (err)
 			goto out_unmap_regs;
diff --git a/drivers/video/fbdev/cg3.c b/drivers/video/fbdev/cg3.c
index bdcc3f6ab666..3a37fff4df36 100644
--- a/drivers/video/fbdev/cg3.c
+++ b/drivers/video/fbdev/cg3.c
@@ -393,7 +393,7 @@ static int cg3_probe(struct platform_device *op)
 
 	cg3_blank(FB_BLANK_UNBLANK, info);
 
-	if (!of_find_property(dp, "width", NULL)) {
+	if (!of_property_present(dp, "width")) {
 		err = cg3_do_default_mode(par);
 		if (err)
 			goto out_unmap_screen;
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c b/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c
index 0ae0cab252d3..09f719af0d0c 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c
@@ -192,7 +192,7 @@ static int __init omapdss_boot_init(void)
 	omapdss_walk_device(dss, true);
 
 	for_each_available_child_of_node(dss, child) {
-		if (!of_find_property(child, "compatible", NULL))
+		if (!of_property_present(child, "compatible"))
 			continue;
 
 		omapdss_walk_device(child, true);
-- 
2.39.2

