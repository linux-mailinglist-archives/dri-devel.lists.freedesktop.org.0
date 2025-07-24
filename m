Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E053B0FF24
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 05:25:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50FA10E870;
	Thu, 24 Jul 2025 03:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gKl4kmdC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45BE10E870
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 03:25:38 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-7e62aeb0f5cso2035785a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 20:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753327538; x=1753932338; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6wVDs/1wpqhDY4HcSZTV4ZWp0eLuVHcvYN7ua0ivt9Y=;
 b=gKl4kmdCnE2NX7PJh87N7VqVlwF6X2IkjJpcy6toC1eMyvJDBzx38UZXCHK4urYc6p
 EZwVheqElLBGLfSXCIWp9kNxPgnTEKAOEHN6UqjXB1G0hp8QNwo9+yw/NKPkMYoHr0Xl
 TZkaSi2HZeyYBYVdWTtQMwEet12N5juPX3nBoploRT1pddJlQ/IuOLcDx9orcGNwGFm9
 xVQ0sdTyLeu//DcNXB100ba3xReaUDDlZSCipP2jIb2mUrlp3psLSPZnSfyRwo5jcI05
 rKSYRTn/hg1G3VPY6yeXnokS8ZxPAxFKYjBxyqps1O3WpsE3SZIsrd4ciZRtuAqzGh48
 hYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753327538; x=1753932338;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6wVDs/1wpqhDY4HcSZTV4ZWp0eLuVHcvYN7ua0ivt9Y=;
 b=mkeVr0tS6xS37Gt7d7X0QynSDLzUHaF+WLFMtfg4RgwtInOkNDPkZ9n9W7JeuSa2FK
 y6P77DOVK7jckGWFvuflQ9EVXfZ/vOu7hQ76QfE4RjdbD3xPLJVrqSqGtbw3SBrst+yN
 GYkQ8oqxCM0nO8eLy2URLhb4iGP0QbxG6NAAd6x8ORwC5WRjO5ceShcua334Q6PZJSSg
 QhCKjMXcHJqShrEged7JlT9047GnWY+bhXSaVjn2l3xN51tTGYnV2ccWgodJpLN750kj
 N4OFiyWugrKmNvbFiHGzrWw2i5BsSjv5+dAo0l4e3y2j/ngPllN/rtOuWRXBr21VPu/M
 7I5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUJ525cpNBVtusoMLUeMBFJue1hPSAlifJjj8OmFg9e4HBWqWCzUtfRP4/66HRBKoUbbacZpGYxBc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywmse8KL8rPjrrIe39FCFt+jHAY7s0hO2LnzZ41HiwKCE4Ef8jG
 cEwe8L5xw5Bwmwv6aq/dna2v5mnUYijdTjfAdg+vrbJeJ23SQN9WRJY=
X-Gm-Gg: ASbGncvBtd7UN36M9geHxjR+FVi4hSkMydqhF1w1r+AgYM636/S9QfLn8cA3GjyjoII
 FzN8SRkATh+UG0mzbwCGOC+kl0GICEEYhUtZJkC6eNZRlpqpQFyvL9sNx9C2Oe+rA6pLiq7XH7v
 wqAfDEMo9gO4Oc+FwPCGqdSQC7MLlNkumSK6ND80VmsX1+HHtwKoIRFYeo0EWzb2CkRDZfDNP7a
 v6rKJTFiF36+0OgZ+zXTIwbR6hC59GUFKOMZw/vyNrnVOH+KMOUENGkgVrWLVPgRmVl7M4cUiGT
 7Lb+YVy2SJw+QFvJ3qer5ysWuf8uf3prP7XB3exQFPQpedINl/3UTRTJApoGN1RxG9GRojEoeU4
 1FpkXmcZIOfXv2jOG7wI=
X-Google-Smtp-Source: AGHT+IHGnu+YAjFvpNlXoLdms3urmPpO5CFALkcBe0mKnj1jUfEF3394xo2fVnScG0OOVxyFL1h9pw==
X-Received: by 2002:a05:620a:4687:b0:7e3:328f:61fa with SMTP id
 af79cd13be357-7e62a1410a7mr262258185a.5.1753327537421; 
 Wed, 23 Jul 2025 20:25:37 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e632d4d48fsm54145685a.2.2025.07.23.20.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 20:25:37 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: s.hauer@pengutronix.de,
	deller@gmx.de
Cc: kernel@pengutronix.de, shawnguo@kernel.org, festevam@gmail.com,
 msp@baylibre.com, plagnioj@jcrosoft.com, linux-fbdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] fbdev: Check fb_add_videomode to prevent null-ptr-deref
Date: Wed, 23 Jul 2025 22:25:34 -0500
Message-Id: <20250724032534.1638187-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

fb_add_videomode() can fail with -ENOMEM when its internal kmalloc()
cannot allocate a struct fb_modelist.
If that happens, the modelist stays empty but the driver continues to
register.
Add a check for its return value to prevent poteintial null-ptr-deref,
which is similar to the commit 17186f1f90d3
("fbdev: Fix do_register_framebuffer to prevent null-ptr-deref in fb_videomode_to_var").

Fixes: 1b6c79361ba5 ("video: imxfb: Add DT support")
Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
---
 drivers/video/fbdev/imxfb.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index f30da32cdaed..a077bf346bdf 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -996,8 +996,13 @@ static int imxfb_probe(struct platform_device *pdev)
 	info->fix.smem_start = fbi->map_dma;
 
 	INIT_LIST_HEAD(&info->modelist);
-	for (i = 0; i < fbi->num_modes; i++)
-		fb_add_videomode(&fbi->mode[i].mode, &info->modelist);
+	for (i = 0; i < fbi->num_modes; i++) {
+		ret = fb_add_videomode(&fbi->mode[i].mode, &info->modelist);
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to add videomode\n");
+			goto failed_cmap;
+		}
+	}
 
 	/*
 	 * This makes sure that our colour bitfield
-- 
2.34.1

