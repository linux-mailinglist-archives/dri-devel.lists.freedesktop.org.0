Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B502C9BE033
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 09:18:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB2710E676;
	Wed,  6 Nov 2024 08:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UDHTjPjR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D278B10E5FA
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 18:19:00 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-20c8b557f91so60044225ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2024 10:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730830740; x=1731435540; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gFcn89fIoB6eD8igdjIgNFL2KkUGAKDd0Xov8oHjAXc=;
 b=UDHTjPjREOimlU+9ad8+jL67AHGd5ulhs1cDGd8ziEg+Fva2uRV61MqSZD4zkuMVKk
 7L8lw2DhhytMnjrYZmi3/lobRiH/RfWj98vgZegzCyllOBhhlvv84vG7balxOcU2vMAd
 ZUH6HRimGWL3Ru/JWJjUocpdMqIc615LRUHtaD/ijcpBnt3gQ2MYDotIYRu/gYXjv5fW
 tlqGf2tRkKCi1W4MiwKXaDGjbs8JiSst8OPlYIG4+pcx5nhYhdbUuPOQs5F0JedEyHns
 r3xlrlG/UPj1Jz/PoZ7xFyexdyOnXVC3mt2im6eBT1Kne/0r8ybB0llPUFH64qUMsRZ4
 D6kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730830740; x=1731435540;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gFcn89fIoB6eD8igdjIgNFL2KkUGAKDd0Xov8oHjAXc=;
 b=XerS/7OG0l0GMfHIY9khe6zsHWqtqRCFSYiV/BwUJZscUGMyUdkUYXtzVfjBYohCAR
 R6ohDH+jbPqY37IoPMvJoBX9wqER4pYmfcTfeyIbIATV26LIclqgzXVe9H/LGZpQhX1g
 feluXEV71iQ13XR7mHCTRzWg2W/I7d1wfq21ugoMRp+6oBSHSq4wMH75P9B9Lq1otQMC
 P2fsTfbcNXgN0nj+KzlzgOqmsY2ZTy42MgERmZliHo9S6/sPH3ji7Hlc04eVjl5RFHNJ
 Ycynzn3m5ASyOLra9M4VxVaO1BjU3iRzW+aK3IHWvgfFAsW/BFP3LxmuRXoiBNKmAcr2
 uccg==
X-Gm-Message-State: AOJu0YwupmsXBMw8FxSXOoAnc5sjRPPqtcvp9qSeO5HcAaNjauP/4T3s
 XCik8VwyiBMHpC0JCbXsvVZr2c4Ol6k0P4S1Ce4af8Mz2oH9PKiZ
X-Google-Smtp-Source: AGHT+IEdjJFisK8cPYnddVc07XFagAr0tosxVTWcS5kPRCLoXBKMcfxPfCn7QDkgIIIcEpVfjlfxlA==
X-Received: by 2002:a17:903:1c2:b0:20c:a175:1943 with SMTP id
 d9443c01a7336-210c6c6d9a5mr505410645ad.40.1730830740228; 
 Tue, 05 Nov 2024 10:19:00 -0800 (PST)
Received: from Emma ([2401:4900:1c97:5a7:5054:ff:fe53:2787])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-211057a2eaasm81208945ad.159.2024.11.05.10.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 10:18:59 -0800 (PST)
From: Karan Sanghavi <karansanghvi98@gmail.com>
Date: Tue, 05 Nov 2024 18:18:42 +0000
Subject: [PATCH] drm:sprd: Correct left shift operator evaluating constant
 expression
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241105-coverity1511468wrongoperator-v1-1-06c7513c3efc@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIFhKmcC/x3MPQ6DMAxA4asgz41kpwEhroI6pMGlXmLkIH6Eu
 Hujjt/w3gWFTbjA0FxgvEkRzRX0aCB9Y57ZyVQNHn0gwtYl3WqxntQSha7fTfOsC1tc1ZxHeuI
 7TcEHhLpYjD9y/Pfj675/980BHW4AAAA=
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Karan Sanghavi <karansanghvi98@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730830736; l=1441;
 i=karansanghvi98@gmail.com; s=20241017; h=from:subject:message-id;
 bh=wvRSAYs3rsDyEyx2uErygYM6LqQrDkxqRE+1X+C/K8A=;
 b=CgjOZ0VtIDWUoRD0Yf5FbUnA+DHoIVLNVlo427a5rDs+icdBvp3hgYaZkHdPJhljSvJ4rbQVc
 f3sn+bRSmulBmqq40nd9nHxjZxNGqTJ+DM2dz1H46kWlCI69d0HdsoT
X-Developer-Key: i=karansanghvi98@gmail.com; a=ed25519;
 pk=UAcbefT1C06npNVDJHdgpPqTm4WE9IhaA1fmJb3A37Y=
X-Mailman-Approved-At: Wed, 06 Nov 2024 08:18:14 +0000
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

The left shift operation followed by a mask with 0xf will
always result in 0. To correctly evaluate the expression for
the bitwise OR operation, use a right shift instead.

Reported by Coverity Scan CID: 1511468

Signed-off-by: Karan Sanghavi <karansanghvi98@gmail.com>
---
Coverity Scan Message:
CID 1511468: (#1 of 1): Wrong operator used (CONSTANT_EXPRESSION_RESULT)
operator_confusion: (pll->kint << 4) & 15 is always 0 regardless of the 
values of its operands. This occurs as the bitwise second operand of "|"
---
 drivers/gpu/drm/sprd/megacores_pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sprd/megacores_pll.c b/drivers/gpu/drm/sprd/megacores_pll.c
index 3091dfdc11e3..43c10a5fc441 100644
--- a/drivers/gpu/drm/sprd/megacores_pll.c
+++ b/drivers/gpu/drm/sprd/megacores_pll.c
@@ -94,7 +94,7 @@ static void dphy_set_pll_reg(struct dphy_pll *pll, struct regmap *regmap)
 	reg_val[3] = pll->vco_band | (pll->sdm_en << 1) | (pll->refin << 2);
 	reg_val[4] = pll->kint >> 12;
 	reg_val[5] = pll->kint >> 4;
-	reg_val[6] = pll->out_sel | ((pll->kint << 4) & 0xf);
+	reg_val[6] = pll->out_sel | ((pll->kint >> 4) & 0xf);
 	reg_val[7] = 1 << 4;
 	reg_val[8] = pll->det_delay;
 

---
base-commit: 81983758430957d9a5cb3333fe324fd70cf63e7e
change-id: 20241105-coverity1511468wrongoperator-20130bcd4240

Best regards,
-- 
Karan Sanghavi <karansanghvi98@gmail.com>

