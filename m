Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D117EDC4D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 08:50:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D0B610E29E;
	Thu, 16 Nov 2023 07:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9EC710E29E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 07:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1700121021; x=1731657021;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kjXlzMKI4SAh9l1+GsCDYTAjNE/uMze9MZXtOyCmaPM=;
 b=S37DsSk+eEY4py9sXn8iIigkO0oICsQXN6vmd4FOHTvmU71Yypds9l1x
 cMEoBMIXtHpAjxBDDlRXlojigeSrlKk433gYdaxRRDrtWQz8HkYM1el/Y
 gqyVUXCPZP0b77yV2qzVGitEv8X/Hyb1/Mx3ZLYiNW+MIu4VZNpPs4iVn
 JbOQoa4EmOxNNyASMWpl0DI1oFjfGiPMugN8pWKhHm/y6PjfPEjzbkYrT
 xFMSM2X75prJyF4ygr6QyZbzxPF63ZKQmhE02f5bq7m7OXv1EnMwf3e9S
 T812RzFRwdmWrq2naEd1iNrfQefkpx4RxNeMbkjC9wSqhPHsoG6nasg9H Q==;
X-IronPort-AV: E=Sophos;i="6.03,307,1694728800"; d="scan'208";a="34010892"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 16 Nov 2023 08:50:18 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 30CB928007F;
 Thu, 16 Nov 2023 08:50:18 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Subject: [PATCH 1/1] backlight: pwm_bl: Use dev_err_probe
Date: Thu, 16 Nov 2023 08:50:17 +0100
Message-Id: <20231116075017.939926-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let dev_err_probe handle the -EPROBE_DEFER case and also add an entry to
/sys/kernel/debug/devices_deferred when deferred.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/video/backlight/pwm_bl.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index 289bd9ce4d36d..3825c2b67c53b 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -509,8 +509,7 @@ static int pwm_backlight_probe(struct platform_device *pdev)
 	pb->pwm = devm_pwm_get(&pdev->dev, NULL);
 	if (IS_ERR(pb->pwm)) {
 		ret = PTR_ERR(pb->pwm);
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "unable to request PWM\n");
+		dev_err_probe(&pdev->dev, ret, "unable to request PWM\n");
 		goto err_alloc;
 	}
 
-- 
2.34.1

