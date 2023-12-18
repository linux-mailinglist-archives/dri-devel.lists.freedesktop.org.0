Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2D7817AD9
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:19:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60E910E3C9;
	Mon, 18 Dec 2023 19:19:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB4310E27F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 19:17:44 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1d39afa1eecso20284415ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 11:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1702927064; x=1703531864; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=orMvcLfAW1bWOmlNaHx4ffjlbLb3ietWU+HumE/aHms=;
 b=qFvnIibK25nLfdFNe+xtBnxDJbUCkXkfqPL0/7U1qGF4IRnk8x9wLCBHTqi5q7BL/B
 iCdYIozHUpb3RA2PKWnLCLDf5JhFoitjWJezMu/bGvMrtHwvAKQI8OgDd9msbszmld1o
 c3Apiyn7gDtvn2bjcDihDul30R2MpQMHz8fkBkw3w1lJK4Nf7QxXkhK4F8Ln1Zs/r/KL
 +ptnZHyDYQhiUbfM95e3c7aUrI1rTcCzvrwM0ulj1l+iO8K6ENpZlJ6lc44OKWl65QID
 qHEH/XcaSh8T9BSEuDx6eblfQga0M0vABz3VPtmQTKBrWO6c/iWx//ZqJJtStjuyUDqB
 psGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702927064; x=1703531864;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=orMvcLfAW1bWOmlNaHx4ffjlbLb3ietWU+HumE/aHms=;
 b=wgf2lFoel7xtD4VKzshgRYL+auy0Z0gtkW6PCGwSd9wGVB+C5VNpDVLnNMCgVKhYjM
 p3rJqiN7klGFSSg1inq4J8NhpU0eRy56n1CZy89WuCHCowTzOqWkHpMGbALqcBD2X+Xb
 N5yyiUJBkxPz6ECAHnxmyHxdBDc7x4zYhbmRj9r/E2Lm0UAy6bMSa4Tu6XEs9kwfThWW
 ZqmOLACxvC/eFqwu9dvKeVhWhqJm+ZzqKtIGXtq6XfnpKSOoCbawCY8+PJtgSRJZA//k
 uHllPXMEHGYQ8kj8MQwz6U7EtHRCBealybhIjv6pw50AHzabe73ksIRSUnxdxvnumZVH
 Aclw==
X-Gm-Message-State: AOJu0YyvMSYpw1oBSjAegNao084mCTkGoOPqRyrDVvtTQPOn7SCFuANY
 A6hAPPdh3jCYTpoO2i/THxXOa/pvOXuk6BRmoAo=
X-Google-Smtp-Source: AGHT+IGDmpYsBu9vjzBqD2RVr9vd3yuOeOgqIoJ2O9xi1AOkmHMN6+eAJ7arABF3v+gsBl8fGZSQuQ==
X-Received: by 2002:a17:90b:391:b0:28b:9117:d070 with SMTP id
 ga17-20020a17090b039100b0028b9117d070mr487023pjb.74.1702900729789; 
 Mon, 18 Dec 2023 03:58:49 -0800 (PST)
Received: from ubuntu.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a170902e88a00b001d38410aa13sm5868936plg.192.2023.12.18.03.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 03:58:49 -0800 (PST)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: Fixed a DP link training bug
Date: Mon, 18 Dec 2023 19:58:36 +0800
Message-Id: <20231218115836.23686-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
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
Cc: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>,
 neil.armstrong@linaro.org, rfoss@kernel.org, jonas@kwiboo.se, sam@ravnborg.org,
 jernej.skrabec@gmail.com, allen.chen@ite.corp-partner.google.com,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To have better compatibility for DP sink, there is a retry mechanism
for the link training process to switch between different training process.
The original driver code doesn't reset the retry counter when training
state is pass. If the system triggers link training over 3 times,
there will be a chance to causes the driver to use the wrong training
method and return a training fail result.

To Fix this, we reset the retry counter when training state is pass
each time.

Signed-off-by: Allen Chen <allen.chen@ite.corp-partner.google.com>
Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 2f300f5ca051..b589136ca6da 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2240,11 +2240,13 @@ static void it6505_link_training_work(struct work_struct *work)
 	ret = it6505_link_start_auto_train(it6505);
 	DRM_DEV_DEBUG_DRIVER(dev, "auto train %s, auto_train_retry: %d",
 			     ret ? "pass" : "failed", it6505->auto_train_retry);
-	it6505->auto_train_retry--;
 
 	if (ret) {
+		it6505->auto_train_retry = AUTO_TRAIN_RETRY;
 		it6505_link_train_ok(it6505);
 		return;
+	} else {
+		it6505->auto_train_retry--;
 	}
 
 	it6505_dump(it6505);
-- 
2.17.1

