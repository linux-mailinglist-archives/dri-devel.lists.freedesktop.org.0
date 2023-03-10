Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1496B4717
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 15:48:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C152D10E914;
	Fri, 10 Mar 2023 14:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EBE610E914
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 14:48:38 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 g73-20020a9d12cf000000b006943a7df072so3029055otg.11
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 06:48:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678459717;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ps/svGZ6xWHVJQ0dMU8++7OD08k18rg46UI9xmEWbIc=;
 b=05eV7JiFe2O/o39JEPIdFxiQekG7Eyk0rPHeWzTtPPITfpmdl9yjLPc+ndzHzYMr65
 OptjJZa4JZSYR7bO/sLpH3Acfv2IQf/+asPST2BIvtba+oAa8cyHKx3HgRzPl1tLKewg
 x4gAqqywPO85of860d2uz6BrBOqI8Uy8heaoCcqNaiwI+ALPU380rXm2e3cKpTws6YLx
 qsT+36H56jEjcgs2Nt3pF+4VkvnhDss4djGEIQO+TJrJpOXA8ALPg4HhsyeSVLQ083mv
 8yKkzU+qtf/ikp90ZT4iHSYPEh1bULfDGf7Plb8gq3eyGUsWxRNXZ9I2Ny7Y2aDeclkc
 Andw==
X-Gm-Message-State: AO0yUKUnC95RS756HUMr9qcnD6EkzUKTtw0fN+puGrfZMsTU8I+Zolwz
 LLQpiF7MRV2FqRnAsvlEx89q+168AQ==
X-Google-Smtp-Source: AK7set9IVJnTY/EvHnm9u8/rDXJ25KPAa+oF7Itt6s3eH5A96+jOhMraQGJ1753yivMUYDLltPrUBA==
X-Received: by 2002:a05:6830:3687:b0:693:d927:645e with SMTP id
 bk7-20020a056830368700b00693d927645emr13293296otb.6.1678459717375; 
 Fri, 10 Mar 2023 06:48:37 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 63-20020a9d0845000000b00690f6d9a737sm135685oty.8.2023.03.10.06.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 06:48:36 -0800 (PST)
Received: (nullmailer pid 1546057 invoked by uid 1000);
 Fri, 10 Mar 2023 14:47:30 -0000
From: Rob Herring <robh@kernel.org>
To: Helge Deller <deller@gmx.de>, Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH] fbdev: Use of_property_read_bool() for boolean properties
Date: Fri, 10 Mar 2023 08:47:30 -0600
Message-Id: <20230310144730.1546031-1-robh@kernel.org>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is preferred to use typed property access functions (i.e.
of_property_read_<type> functions) rather than low-level
of_get_property/of_find_property functions for reading properties.
Convert reading boolean properties to to of_property_read_bool().

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/video/fbdev/offb.c     | 4 ++--
 drivers/video/fbdev/sm501fb.c  | 4 ++--
 drivers/video/fbdev/tcx.c      | 3 +--
 drivers/video/fbdev/xilinxfb.c | 3 +--
 4 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/video/fbdev/offb.c b/drivers/video/fbdev/offb.c
index f7ad6bc9d02d..b97d251d894b 100644
--- a/drivers/video/fbdev/offb.c
+++ b/drivers/video/fbdev/offb.c
@@ -549,10 +549,10 @@ static void offb_init_nodriver(struct platform_device *parent, struct device_nod
 	int foreign_endian = 0;
 
 #ifdef __BIG_ENDIAN
-	if (of_get_property(dp, "little-endian", NULL))
+	if (of_property_read_bool(dp, "little-endian"))
 		foreign_endian = FBINFO_FOREIGN_ENDIAN;
 #else
-	if (of_get_property(dp, "big-endian", NULL))
+	if (of_property_read_bool(dp, "big-endian"))
 		foreign_endian = FBINFO_FOREIGN_ENDIAN;
 #endif
 
diff --git a/drivers/video/fbdev/sm501fb.c b/drivers/video/fbdev/sm501fb.c
index f743bfbde2a6..1f3cbe723def 100644
--- a/drivers/video/fbdev/sm501fb.c
+++ b/drivers/video/fbdev/sm501fb.c
@@ -1737,10 +1737,10 @@ static int sm501fb_init_fb(struct fb_info *fb, enum sm501_controller head,
 
 #if defined(CONFIG_OF)
 #ifdef __BIG_ENDIAN
-	if (of_get_property(info->dev->parent->of_node, "little-endian", NULL))
+	if (of_property_read_bool(info->dev->parent->of_node, "little-endian"))
 		fb->flags |= FBINFO_FOREIGN_ENDIAN;
 #else
-	if (of_get_property(info->dev->parent->of_node, "big-endian", NULL))
+	if (of_property_read_bool(info->dev->parent->of_node, "big-endian"))
 		fb->flags |= FBINFO_FOREIGN_ENDIAN;
 #endif
 #endif
diff --git a/drivers/video/fbdev/tcx.c b/drivers/video/fbdev/tcx.c
index 01d87f53324d..f2eaf6e7fff6 100644
--- a/drivers/video/fbdev/tcx.c
+++ b/drivers/video/fbdev/tcx.c
@@ -379,8 +379,7 @@ static int tcx_probe(struct platform_device *op)
 
 	spin_lock_init(&par->lock);
 
-	par->lowdepth =
-		(of_find_property(dp, "tcx-8-bit", NULL) != NULL);
+	par->lowdepth = of_property_read_bool(dp, "tcx-8-bit");
 
 	sbusfb_fill_var(&info->var, dp, 8);
 	info->var.red.length = 8;
diff --git a/drivers/video/fbdev/xilinxfb.c b/drivers/video/fbdev/xilinxfb.c
index 1ac83900a21c..c17cfffd9a84 100644
--- a/drivers/video/fbdev/xilinxfb.c
+++ b/drivers/video/fbdev/xilinxfb.c
@@ -469,8 +469,7 @@ static int xilinxfb_of_probe(struct platform_device *pdev)
 		pdata.yvirt = prop[1];
 	}
 
-	if (of_find_property(pdev->dev.of_node, "rotate-display", NULL))
-		pdata.rotate_screen = 1;
+	pdata.rotate_screen = of_property_read_bool(pdev->dev.of_node, "rotate-display");
 
 	platform_set_drvdata(pdev, drvdata);
 	return xilinxfb_assign(pdev, drvdata, &pdata);
-- 
2.39.2

