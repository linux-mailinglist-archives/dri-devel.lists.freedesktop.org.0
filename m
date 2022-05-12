Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6A6524C41
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 13:59:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A9710EBB7;
	Thu, 12 May 2022 11:59:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E8C10EBB7
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 11:59:23 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 t11-20020a17090ad50b00b001d95bf21996so7607407pju.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 04:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a/Jq44xoX1PX4n3n8Vf2G0RTQLdM4u3R8vUUYgDiB04=;
 b=mlMqYveSz/+4qyhU7Gn2t3oWFvyH+LSNhqreDHRhYlwIHWqahZCFudIHWm6Ja6shfJ
 l6FeEnF5N+f7cfpHAwyX2D2A6Im2Xst2Vt0KatDULbUJMvR/gjU0p6whZWNLymtnRqdg
 XpenVROQ7O74LbOF/JN8z421V3oYlvmaPamURNP0qMVllMgrdgR7WQx0k1yzliiAGDc/
 cu1N8Oiya9M7Ouij7ORwpMcmR5valH7ZFw2ufqvt0khJMMvqGuQBiA299NVzlEwNymzT
 Fmu3DKnijVF6aP7k4Dbi0eWKnD7hm4SYQVcNLVueHvuwGkD28M55+CTWIy3+s1oDCUFV
 sAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a/Jq44xoX1PX4n3n8Vf2G0RTQLdM4u3R8vUUYgDiB04=;
 b=yFvmHnyLix+E1gwFQ1oRTDqjmk4Ps9C9zt9RB6nX6V84YWCp4MV1w/J0VmNcX6BSIM
 YtNyT9IjVqsYJRTiS6YdDSqzhfUwb+lyJOSHbBf3PzfPcj3psAADABdhIQrT+DZl54G7
 HQJd+OLhjWGQDTk8pj0++0M6YZF0lGrgv03S3t3I/E6RONaJTQ8cdrPbt1XkjaOlAMQC
 OuhTHAwLzn/TujRt6glc+irpj3XN2OkGu3MBxOa2daIstGj6skfgnQH/z4QmLU3cOJJ5
 kEmGN+Lzo8xqO5P/pKokfTxAqfgd1GtJLZbLNCprGHYWX8wRHka1jjzR5Ju62uKC68oz
 r/0A==
X-Gm-Message-State: AOAM533aSOXgvSt/4bikYDEHEpnZ5p0SjC5hmuEjmIUSGw3Q+eK1WIXx
 igRGZBjqa1OrOGadP+Zl+Uk=
X-Google-Smtp-Source: ABdhPJxUkdcERAaY6EHXM+YWGl5OJizIGEsi9bYKgIcAV4R0PZrxLengDsUUSp2cSZor8m+omxbfVQ==
X-Received: by 2002:a17:902:7445:b0:15f:2eb6:2c3d with SMTP id
 e5-20020a170902744500b0015f2eb62c3dmr9432973plt.132.1652356762826; 
 Thu, 12 May 2022 04:59:22 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 k34-20020a635a62000000b003c14af5063esm1653594pgm.86.2022.05.12.04.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 04:59:22 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Helge Deller <deller@gmx.de>,
 Miaoqian Lin <linmq006@gmail.com>, Pawel Moll <pawel.moll@arm.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] video: fbdev: Fix refcount leak in clcdfb_of_vram_setup
Date: Thu, 12 May 2022 15:59:08 +0400
Message-Id: <20220512115913.48685-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

of_parse_phandle() returns a node pointer with refcount
incremented, we should use of_node_put() on it when not need anymore.
Add missing of_node_put() to avoid refcount leak.

Fixes: d10715be03bd ("video: ARM CLCD: Add DT support")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/video/fbdev/amba-clcd.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/amba-clcd.c b/drivers/video/fbdev/amba-clcd.c
index 9ec969e136bf..8080116aea84 100644
--- a/drivers/video/fbdev/amba-clcd.c
+++ b/drivers/video/fbdev/amba-clcd.c
@@ -758,12 +758,15 @@ static int clcdfb_of_vram_setup(struct clcd_fb *fb)
 		return -ENODEV;
 
 	fb->fb.screen_base = of_iomap(memory, 0);
-	if (!fb->fb.screen_base)
+	if (!fb->fb.screen_base) {
+		of_node_put(memory);
 		return -ENOMEM;
+	}
 
 	fb->fb.fix.smem_start = of_translate_address(memory,
 			of_get_address(memory, 0, &size, NULL));
 	fb->fb.fix.smem_len = size;
+	of_node_put(memory);
 
 	return 0;
 }
-- 
2.25.1

