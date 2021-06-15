Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 425E03A76CD
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 07:52:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EECE6E098;
	Tue, 15 Jun 2021 05:52:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9163D89F85
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 03:29:45 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id e7so7723877plj.7
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 20:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ko1IwBGBst5Jf2WhqbyLBt78jSlpiQeS/6AIDQFiD8w=;
 b=ZuGe39zMIh0zTAo7XlKLZPzD8gyv2KE+kIUzjS2rlpekG/fPV7gz1czM1SUsTsL+fS
 npwq05fl62dITgBoZksqFKJxpTL9C+H+nMc+5OA470NtLeF/nSH6Nt+QlBaTrrmNROcr
 PZ8z6Zhzn2mCde9ILXCzny9Q+VW+vTxgkg/ow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ko1IwBGBst5Jf2WhqbyLBt78jSlpiQeS/6AIDQFiD8w=;
 b=TGJFmZLOBE79hWhINU0KEJE6wMzy037R/Wvs9EfxjFwtVdFUwBNg2hcAyLfZM6c48d
 UhHNGKKKp7vt7S0/v4IR+so+L4xWXMb1SUph2NhnqQ016UR2BOkvpq8wOSlQk/doCuv9
 KfFZneTliJg/cZjXoRJkezVHCdNekdWaWyKslPxkxPWG/rqCUVVMUk9XteC1Kfu7bGJh
 CqvT7mBk2Ky1H0Y//RmYcthlc4PnAJJ1VB0a7AFrP1ZICI32XBhsxkJd+VjVBYUKgFSJ
 MG0YTlBKCTiTvynKeERiC5YHCNDCa9OskGpGMaPvPVfE5udcXLmJbwDr6rf12rVDxgm1
 jPmw==
X-Gm-Message-State: AOAM532t/CjojXRryE66Bua81qCSsqXhiUYWIQ3U57G3WtKeR+pXvsYJ
 OOklKas15ZcgoQIM2WNP6k0Qrw==
X-Google-Smtp-Source: ABdhPJxk9ulOgf+BkOotf4gBXMadqzHQr5KaW1jAZnlUzhyqv6EQetNNiVdjMmPmoQdgyjUSsr3s0A==
X-Received: by 2002:a17:902:a98c:b029:119:926d:f99a with SMTP id
 bh12-20020a170902a98cb0290119926df99amr2388315plb.5.1623727785121; 
 Mon, 14 Jun 2021 20:29:45 -0700 (PDT)
Received: from kafuu-chino.c.googlers.com.com
 (105.219.229.35.bc.googleusercontent.com. [35.229.219.105])
 by smtp.googlemail.com with ESMTPSA id o16sm13441990pjw.10.2021.06.14.20.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 20:29:44 -0700 (PDT)
From: Pi-Hsun Shih <pihsun@chromium.org>
To: 
Subject: [PATCH] drm/bridge: anx7625: Make hpd workqueue freezable
Date: Tue, 15 Jun 2021 11:29:24 +0800
Message-Id: <20210615032937.2328468-1-pihsun@chromium.org>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 15 Jun 2021 05:52:29 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Jonas Karlman <jonas@kwiboo.se>, open list <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Tzung-Bi Shih <tzungbi@google.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Pi-Hsun Shih <pihsun@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There were still a race condition between hpd work and suspend, since
the workqueue work can still be run after anx7625 had powered off in
suspend.

Since we never want hpd work to run while suspending, and there's no
harm to delay them to be run after resume, mark the workqueue as
WQ_FREEZABLE so all works won't run while suspending.

Fixes: 409776fa3c42 ("drm/bridge: anx7625: add suspend / resume hooks")

Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 7519b7a0f29d..e165be5a2067 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1730,7 +1730,6 @@ static int __maybe_unused anx7625_suspend(struct device *dev)
 	if (!pm_runtime_enabled(dev) || !pm_runtime_suspended(dev)) {
 		anx7625_runtime_pm_suspend(dev);
 		disable_irq(ctx->pdata.intp_irq);
-		flush_workqueue(ctx->workqueue);
 	}
 
 	return 0;
@@ -1790,7 +1789,8 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 	platform->pdata.intp_irq = client->irq;
 	if (platform->pdata.intp_irq) {
 		INIT_WORK(&platform->work, anx7625_work_func);
-		platform->workqueue = create_workqueue("anx7625_work");
+		platform->workqueue = alloc_workqueue(
+			"anx7625_work", WQ_FREEZABLE | WQ_MEM_RECLAIM, 1);
 		if (!platform->workqueue) {
 			DRM_DEV_ERROR(dev, "fail to create work queue\n");
 			ret = -ENOMEM;

base-commit: 25fe90f43fa312213b653dc1f12fd2d80f855883
-- 
2.32.0.272.g935e593368-goog

