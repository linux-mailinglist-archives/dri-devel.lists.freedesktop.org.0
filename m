Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E54DC481E86
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 18:17:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ACA310E257;
	Thu, 30 Dec 2021 17:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 153D410E8D2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 16:06:29 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id s1so51392025wrg.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 08:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x0Z4VfhJECgT1/vs4niZzj7+Z6gvqhAPOkKcI0mAqoc=;
 b=ipzs2Z2aIE/u3K6VQ0AbCXqJ8wzmf1CopsYvKY+Qnn/ypMJrQW++LKWeEAwsV267tf
 t/OWBLVKSyFw0wHISAQYQ/sekslWFw+GrVzFpI2MXI+UUgXxYiJnRgyfaUcgYLs5Nbc5
 OU4JWJ+vwyVDzJbMgAD/7iEZaV+serEDsV9EO6Q+mLPRybz+otJsAr9upP8DSB9ux1y7
 C3ZIYUS+20ZWs3XKnn++HN1OxbYZrd/hWqjy0MeN+9OO5294IDMdhtAUM/m7bOuNEj09
 R2c0HsgYjT3+g57nvb2HtHm56oclfA62XnLRfylNZNz+mv1MqDvvyoM3JLoj+slwMRF2
 HwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x0Z4VfhJECgT1/vs4niZzj7+Z6gvqhAPOkKcI0mAqoc=;
 b=Wa4IzxNdLcJbeQDHYe8N0PDRvB6JV/c6XFoK4c0BtHxnQVnSeP6ODOzsiItiie7x82
 T2YlZ0DtsJ+n2xf9xDJBGBpYb8ESao0F0W6hetO15V+qpN4BbBe2Adf07e3gDo6EWadd
 6V+AMpc/su8VAg5/SATMQ3fDJrORhTOZvdQ7vkTCYiGLjHVHuYgemx/yn8SNevoBkDX6
 P1bB5mFgh3ruYcT8E7RzdpETG7YoYSUctyFICoIbwHLodkVva5rL8jl46c86QupRe4Gw
 62jtgDkkyvwr6rrzlN47lawLgbwoJRYBuMB4fwuUdmQOMScTMjX6z9W0ynQKsvSDTr/E
 EOCA==
X-Gm-Message-State: AOAM5317b8tISe3av2CQDwxD0TLtwWVPv6G/wbqbLyEJfPEyDJCRqGa5
 E/rpzSb1X6ucm1dGV3aIX/g=
X-Google-Smtp-Source: ABdhPJwh/LJEO882P8Cm7xI3bzxI9mqZ37vTY5joIviEvK7W3BI5qy21cL58BLPI6V+WVVtkmMpCMA==
X-Received: by 2002:a05:6000:1241:: with SMTP id
 j1mr27249409wrx.601.1640880387487; 
 Thu, 30 Dec 2021 08:06:27 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
 by smtp.gmail.com with ESMTPSA id r7sm23477675wrt.77.2021.12.30.08.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 08:06:27 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] video: fbdev: s3c-fb: remove redundant initialization of
 pointer bufs
Date: Thu, 30 Dec 2021 16:06:26 +0000
Message-Id: <20211230160626.404072-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 30 Dec 2021 17:17:01 +0000
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
Cc: llvm@lists.linux.dev, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pointer bufs is being initialized with a value that is never read, it
is being re-assigned with a different value later on. The assignment
is redundant and can be removed. Cleans up clang-scan warning:

drivers/video/fbdev/s3c-fb.c:492:16: warning: Value stored to 'buf'
during its initialization is never read [deadcode.DeadStores]
        void __iomem *buf = regs;

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/video/fbdev/s3c-fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/s3c-fb.c b/drivers/video/fbdev/s3c-fb.c
index 3b134e1bbc38..68408c499627 100644
--- a/drivers/video/fbdev/s3c-fb.c
+++ b/drivers/video/fbdev/s3c-fb.c
@@ -489,7 +489,7 @@ static int s3c_fb_set_par(struct fb_info *info)
 	struct s3c_fb_win *win = info->par;
 	struct s3c_fb *sfb = win->parent;
 	void __iomem *regs = sfb->regs;
-	void __iomem *buf = regs;
+	void __iomem *buf;
 	int win_no = win->index;
 	u32 alpha = 0;
 	u32 data;
-- 
2.33.1

