Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D30CD07AC
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 16:20:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D741E10E391;
	Fri, 19 Dec 2025 15:20:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z1vh3To8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B35210E391
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 15:20:49 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-7e1651ae0d5so1506595b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 07:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766157649; x=1766762449; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FRLyHIcaTYgGGdTbN+5lMzudMmbrt4aktasmpYS38uM=;
 b=Z1vh3To8qEwaHjGQHLLtfmkJ0hH35wwXAsP7gyBVf4wKO/v0jyFVgz0enprQevwYHd
 fozoDaHUXJK8oa0X4ghM4O7ROpVVqSugMzOuVvyzA5+cl/TJVM4ksvcCMeAEKnszKDFn
 o0p1JlqAP05vumGSpqTc28j9WBdPGdYsf3CXIWEA6Wo8zC8GQYM8mhWELUOr0KBiyR+j
 JwadzL3qspT/6DSyDo/Yzt30ft8XC2C1lBrm6aJcZpRbFvP0Idv7BRiAYt2e6FWI7er0
 zF3sN4MdKP/rsGzDGpGIpZ8x6CJBUWCWxkrAU/lChRFjvTTuYEN1BgL1FNtfEGsGw9ot
 a6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766157649; x=1766762449;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FRLyHIcaTYgGGdTbN+5lMzudMmbrt4aktasmpYS38uM=;
 b=YgAeL6vg0e2GMhTOBBB92l4b0/+TkSSI3oLjtrrcnOOZciz1uh2I5YQibrbXca9WUP
 AgsdwlQyk+TDDS0cC2vu5/yg2kzeoePnSAy+gR2Ghhdy9KuDTTFPaOr6L8jQr6h4inT8
 yAH79NRLPI2kepHdcFnJzy8+b6EdEotCeJi1Fz+go6NZN76eutAfXueluoPGNmpN/Jgc
 0tXi1bgTbou5DAGV28lhfnnGOAbROX64YS+YTF2nEDj8j1ZSK4f/DqBeEETuhTY0xG55
 cGH3lLmQAqbJ3UBVUDRIi07QHZvQ1czlmiU7d/Nx4wBbI6xQLYlhfWOY6T7qULqzG2Sb
 keSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMSkMQAom3y+BXd1zPCuAgP5a2Ujx4rOGhL44qc4moIILvSjCaifU/wUD0Kuya3qI1qT6Vgax5/zI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUjvU70e3OtYbXjd1dgYmbnPHzt2UmsbgLE4iSBBaYP+IFsybK
 4DxjYdxChmeIuNkt/MkOTRuOYWE9KILN0Fgoy78gAQFXF5z4eQE1puKz
X-Gm-Gg: AY/fxX7ZmUpky7k+KhqC5UOEcth6199K0EbY4SL1l74PQvWDkB02hm7HLzHcBEJfLR+
 W2Ch3XW+1y2GXRdnGrQmof0jFX35ze6XVfL4kP2vScMr1Z2eUqK9U5XI5uq0XKSxeEk4OrcmtsK
 +I2iDgO0yzOPrkWaitlSpm5nhXISKdNXf1FL+XaTtIb8gcvQUf4uUfKKgKB2R3xhPGIVUGQ9rmc
 BEqhV00SjaO05rYSLEJi8iayuJAP13AfGy0xF56GbEP8dlVjAexo7nGLJV7W9ZhrvUiTZD+S1D9
 v+NcZLG4q3Nc8duJG+6FyvY3d4lMjLi9JsLBZV9dHd56OyV5ghmRbKzWcf8OgNEcG315WqACaDk
 w1I5UwGdB4fdI2C4Ejgf/08h1hKfJN5ApRSg0I7Yh0x2vwuQhbpxLxRtSjUic84SlMIRVB7gec2
 Tw6KLC2pODmS08
X-Google-Smtp-Source: AGHT+IHZF6dThhbGJCz/FfsvtZUXhVynNTqCbs4rVadVbBB844qGhg3Y+x98uNRKysilHK4dqgzXuw==
X-Received: by 2002:a05:6a20:7d9f:b0:366:14b2:31a with SMTP id
 adf61e73a8af0-376aa6eadcbmr3041159637.77.1766157648759; 
 Fri, 19 Dec 2025 07:20:48 -0800 (PST)
Received: from c45b92c47440.. ([202.120.234.58])
 by smtp.googlemail.com with ESMTPSA id
 41be03b00d2f7-c1e7bd61b40sm2459612a12.23.2025.12.19.07.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Dec 2025 07:20:48 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] drm/fsl-dcu: fix clock reference leak in fsl_tcon_init error
 path
Date: Fri, 19 Dec 2025 19:20:35 +0400
Message-Id: <20251219152036.2958051-1-linmq006@gmail.com>
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

In fsl_tcon_init(), when of_clk_get_by_name() succeeds but
clk_prepare_enable() fails, the function jumps to err_node_put label
without releasing the clock reference obtained.
This causes a clock reference leak.

Fix by calling clk_put() that properly releases the clock
reference.

Found via static analysis and code review.

Fixes: fb127b7943c9 ("drm/fsl-dcu: add TCON driver")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/fsl-dcu/fsl_tcon.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_tcon.c b/drivers/gpu/drm/fsl-dcu/fsl_tcon.c
index 49bbd00c77ae..b7ba90814b0e 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_tcon.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_tcon.c
@@ -86,7 +86,7 @@ struct fsl_tcon *fsl_tcon_init(struct device *dev)
 	ret = clk_prepare_enable(tcon->ipg_clk);
 	if (ret) {
 		dev_err(dev, "Couldn't enable the TCON clock\n");
-		goto err_node_put;
+		goto err_clk_put;
 	}
 
 	of_node_put(np);
@@ -94,6 +94,8 @@ struct fsl_tcon *fsl_tcon_init(struct device *dev)
 
 	return tcon;
 
+err_clk_put:
+	clk_put(tcon->ipg_clk);
 err_node_put:
 	of_node_put(np);
 	return NULL;
-- 
2.25.1

