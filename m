Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F6C50826C
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 09:42:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14E810E5FD;
	Wed, 20 Apr 2022 07:42:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB45810F187
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 07:06:43 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id h11so842869ljb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 00:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S6Pm6EQrJOZ/4EtJZXl52Z94IGgkZJJYDyI9ZFEJiOI=;
 b=aAcEjQWF0TAoCEXgBar5MuPFQ/YhqGLMjfZBrdip0U5FzeAFDKsuy+YpWOXvCSo4Cu
 d2RevKENklHTnW/xtjpv8VYGsZbZOHYLY6ZpLCOUwoc4wYQ+aPPwnDFesjx2DANGBrU8
 iY/IM6S0fHecKah9bK/nufixsKpBoYZR3mAr9lU5JwgamGzxfwuTkUJXIe2A3f3jS/oK
 C1iHraDKyLz3SNfs1vxzp8GUJP32phUs7Fb6iKz1ANha432H7Ya2mnrk7KW0FLrni+D3
 MpNc2SikA0eJqgC6hSpGInBOTf1DbSwx1ZoiGkZ3I/XWbCCQD7op2WNKl4j9mTrk3rEe
 AvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S6Pm6EQrJOZ/4EtJZXl52Z94IGgkZJJYDyI9ZFEJiOI=;
 b=fEXIQL78uvqMA5HsHbxOoPZJ5LetCSHWqM4pYtDYqCn/Zk9ZjHo8Ey3mfDB3nSYRab
 nHLDYQoy5QBoutVG2ZcOxqQcHqj2Y7285bNrddiTHn+JmS1Q1+77p2pU1xEeu2PCVq3T
 8HkhAQ+LtCXQ89b9AE5wEZkaHRyiZG+U2UuoErlgoOHU1WKS3znW+c3FcnNjryXoFV0b
 UV+i0Rm1ERt6OMBJZfBr7t4dn8GLTobP9MYtPFymnIZTY7G+/6vAEVuYnIYXsu5+2Vb7
 PoIwpN3FVkzN+MTjjmpPH3zSLyBQm0Xa5dJ1fKbQ5cEMkjLJ1PPLZxHMzBDdlKK8zy8Q
 l0LQ==
X-Gm-Message-State: AOAM531hyWB1132BOqrQI2v8zyhgHugQ7SUaku0B6611F3/xcgSPjXtz
 RXw9978MqUjxcGiRcaLkBqc=
X-Google-Smtp-Source: ABdhPJxxrz61XJwjbTtEFvxXTZA6X+h3fWbjr+H8xjkcYpoXbV+qfS7teIWXYa4d7icAIz9JoQdZ3w==
X-Received: by 2002:a2e:3e17:0:b0:24e:9b47:f1c4 with SMTP id
 l23-20020a2e3e17000000b0024e9b47f1c4mr453071lja.445.1650438402154; 
 Wed, 20 Apr 2022 00:06:42 -0700 (PDT)
Received: from shc.milas.spb.ru ([188.243.217.78])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a2e7012000000b0024b50132eeasm1630224ljc.10.2022.04.20.00.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 00:06:41 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-fbdev@vger.kernel.org
Subject: [PATCH] video: clps711x-fb: Use syscon_regmap_lookup_by_phandle
Date: Wed, 20 Apr 2022 10:06:39 +0300
Message-Id: <20220420070639.62440-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 20 Apr 2022 07:42:00 +0000
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
Cc: Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Alexander Shiyan <eagle.alexander923@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since version 5.13, the standard syscon bindings have been added
to all clps711x DT nodes, so we can now use the more general
syscon_regmap_lookup_by_phandle function to get the syscon pointer.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 drivers/video/fbdev/clps711x-fb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/clps711x-fb.c b/drivers/video/fbdev/clps711x-fb.c
index c5d15c6db287..771ce1f76951 100644
--- a/drivers/video/fbdev/clps711x-fb.c
+++ b/drivers/video/fbdev/clps711x-fb.c
@@ -268,8 +268,7 @@ static int clps711x_fb_probe(struct platform_device *pdev)
 		goto out_fb_release;
 	}
 
-	cfb->syscon =
-		syscon_regmap_lookup_by_compatible("cirrus,ep7209-syscon1");
+	cfb->syscon = syscon_regmap_lookup_by_phandle(np, "syscon");
 	if (IS_ERR(cfb->syscon)) {
 		ret = PTR_ERR(cfb->syscon);
 		goto out_fb_release;
-- 
2.32.0

