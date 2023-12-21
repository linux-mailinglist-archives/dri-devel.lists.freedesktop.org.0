Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7994D81B25A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 10:31:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6DC10E07A;
	Thu, 21 Dec 2023 09:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B003910E07A
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 09:31:11 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6d7f1109abcso344352b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 01:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1703151071; x=1703755871; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=orMvcLfAW1bWOmlNaHx4ffjlbLb3ietWU+HumE/aHms=;
 b=VoIGoAugblydXqZRCKQcfx8+WkLzVkYVP0+eyB1aIgxq7NiooUOVJHaY28eYyxyFLu
 QvL+/RnD/66bYyAZ0ZezvjpQSC8aqOCGrbvNU2UXI3alMv4WAAgGAmQa5ssPqcGqVY4s
 gcyhqDGKuL9rUgZB7bvmrykV06G3YcKeOV0Ox/tlZt3b95sTbWkJILrt7q96K/4wnzN5
 pub8zbHzyvkhQKQlHL8gjsWQed4a1nsk9vYVZ0y51mzs4skXkK6st/x2TUS/1f5wZTdG
 gw8W5J5hkbh+rv3A216AXZfcTAwhVwz7TfV5KwYFIsCUG3K5XB76wXE6+k2KHPtKU5Lv
 /qXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703151071; x=1703755871;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=orMvcLfAW1bWOmlNaHx4ffjlbLb3ietWU+HumE/aHms=;
 b=qtXELGD9Prt2/Y1MTm1E16tv9Fipjafe4xzJ9aXCZDe9/uVEC7tRCNRmecXZrVpDOw
 UFTMZ0J0dpvOltTDdY7NTo3UmXta0mka9AZU9VE0QNvY1dl83R/E+RarhYZFJNwUztgl
 CbZgWpRBwtACjKcJmaZsFW+3sPMdXQgVKu/WpHevoWmRhFdrowC+YcagtB0JeBKVnBGW
 yFIDDR83utlydnXOBIlijgraGHSiIdhpaeSlVRz7IlD7KP7P33t9p7PnxKe/xdHiQSZE
 jw+layKD6EmcX/nC5JfStY7sbxJmSew1626rLw+KQqHyv/rEpt2SnrCU7VkeKNRC2KeP
 X3vw==
X-Gm-Message-State: AOJu0YzcsTlw/F9gTYsW1pD+Fmfb5mgSzIZTLsAo/Pplttfm+J1zj+Cp
 BLsirTcjyJZ6Mrk1rZnl46E6o8jAUQjpRE70vF8=
X-Google-Smtp-Source: AGHT+IHI26Y47w+/46gRPCqXGKzZtZ12NB9UdTqzWVjrYsMkiyMkqOBvwN9hGUq3sAiJixjUQbiqYA==
X-Received: by 2002:a05:6a20:dca8:b0:18c:23b0:39bd with SMTP id
 ky40-20020a056a20dca800b0018c23b039bdmr756282pzb.16.1703151070745; 
 Thu, 21 Dec 2023 01:31:10 -0800 (PST)
Received: from ubuntu.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 c9-20020a170902c1c900b001d09c539c95sm1170875plc.90.2023.12.21.01.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 01:31:09 -0800 (PST)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] drm/bridge: Fixed a DP link training bug
Date: Thu, 21 Dec 2023 17:30:57 +0800
Message-Id: <20231221093057.7073-1-xiazhengqiao@huaqin.corp-partner.google.com>
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
 neil.armstrong@linaro.org, rfoss@kernel.org, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, dianders@google.com,
 allen.chen@ite.corp-partner.google.com, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, hsinyi@google.com, sam@ravnborg.org
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

