Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D1B509AE7
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 10:45:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E4210F958;
	Thu, 21 Apr 2022 08:45:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3834D10F95F
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 08:45:50 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id e128so3080468qkd.7
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 01:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vEFTLGDtfWVDHuldQRqU5lfCf1pN2Vgy21hTY3jHvgQ=;
 b=QhpKmsYZOuFIkN4tj3pzITIfRmGL2Vw7l/+c8exFfYc6R07W66oKCSEfVx2uaiEotL
 oMxreb9mw2xifvpnos2nFc3Y2+pdADJx2Mzr33z93JKDagA8B8gZ9M3RJmE/ZsUVBywj
 6NhWmo/mn8Hailgt9VnTYmHQr8KdQLM3r7NM+f9mZYcbuA1IASqlV+ieBLPerESqtg+N
 NnfHz6vOjwdViQaT6M6I0k1ZUuk8kYlViRnDQhJqf5nIpRDaGdrtG02MRkYw7umTQsbl
 lPLjKRJ5bJUlzzEaxEWpz3NpIyokwG7NKEcnvJvD+TYn16T+Hhh1VEjwRCLAR5Txf8JU
 pQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vEFTLGDtfWVDHuldQRqU5lfCf1pN2Vgy21hTY3jHvgQ=;
 b=6AfoIgDFvG8ZIWzP2vSn7iA+Tg0zmIcmAgPSYq11QWk8IHmK777ymUbMrPBFV/580Q
 AHq4GAPaUdi90LKcH6COpdXjFgsexvWY9ieAO8y3P4M6joa8r8giSRtgEX/B0nho8Cik
 Kaq0seaLEGlp12swsH52U1Yj1cvAwhnT4cdf0OcQT4/jHrWewoPZQlgMuewq/gI2JYw2
 7k2QN+uarA0MS/pKOo3qO1X6CHLxwTfBM9RNHnZtmdHYB7vnG8nQ8kRnN5fN8UBLWH04
 hTUFLbgsIK5KrcS6mataDaDW1JNRNjdMKtEzHUjUuOwtLh9Kn6s0Oj2SoLG/j9+9KEJG
 9EHQ==
X-Gm-Message-State: AOAM533xkqRvlBpoYPXS2MY/caOxz7MHrl7GmAh4enInVwxXE1e21+MP
 h88IjHkybb+eKar9EIDkgTw=
X-Google-Smtp-Source: ABdhPJy4CvLhO4p7WBjhapwu+eeHntufKSaitDCKftgQbXnaIlO7ZsLftW46MkYtHfvXRPLF2+8TbQ==
X-Received: by 2002:a05:620a:4014:b0:69e:c20c:5064 with SMTP id
 h20-20020a05620a401400b0069ec20c5064mr7479298qko.111.1650530749339; 
 Thu, 21 Apr 2022 01:45:49 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 t17-20020a05620a035100b0069ea7219390sm2528245qkm.55.2022.04.21.01.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 01:45:49 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To: thierry.reding@gmail.com,
	airlied@linux.ie
Subject: [PATCH] drm/tegra: Make use of the helper function
 devm_platform_ioremap_resource()
Date: Thu, 21 Apr 2022 08:45:42 +0000
Message-Id: <20220421084542.2615381-1-lv.ruyi@zte.com.cn>
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
Cc: Lv Ruyi <lv.ruyi@zte.com.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lv Ruyi <lv.ruyi@zte.com.cn>

Use the devm_platform_ioremap_resource() helper instead of calling
platform_get_resource() and devm_ioremap_resource() separately.Make the
code simpler without functional changes.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
---
 drivers/gpu/drm/tegra/vic.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index 1e342fa3d27b..daba4f6cc328 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -409,7 +409,6 @@ static int vic_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct host1x_syncpt **syncpts;
-	struct resource *regs;
 	struct vic *vic;
 	int err;
 
@@ -430,13 +429,7 @@ static int vic_probe(struct platform_device *pdev)
 	if (!syncpts)
 		return -ENOMEM;
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!regs) {
-		dev_err(&pdev->dev, "failed to get registers\n");
-		return -ENXIO;
-	}
-
-	vic->regs = devm_ioremap_resource(dev, regs);
+	vic->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(vic->regs))
 		return PTR_ERR(vic->regs);
 
-- 
2.25.1


